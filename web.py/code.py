import web

render = web.template.render('templates/')

db = web.database(dbn='mysql', user='root', pw='linux', db='police')

urls = (
    '/(.*)/', 'redirect',
    '/', 'police_dept',
    '/add', 'add',
    '/delete', 'delete',
    '/update', 'update',
    '/cases', 'cases',
    '/addCase','addCase',
    '/solveCase', 'solveCase',
    '/detectives', 'detectives',
    '/divisions', 'divisions',
    '/addDivision', 'addDivision',
    '/delDivision', 'delDivision',
    '/personnel', 'personnel',
    '/addOfficer', 'addOfficer',
    '/delOfficer', 'delOfficer',
    '/updateOfficer', 'updateOfficer',
    '/addSupport', 'addSupport',
    '/delSupport', 'delSupport',
    '/response', 'response',
    '/addResponse', 'addResponse',
    '/delResponse', 'delResponse',
    '/incidents', 'incidents',
    '/addIncident', 'addIncident',
    '/resolveIncident', 'resolveIncident',
)

class redirect:
    def GET(self, path):
        web.seeother('/' + path)

class police_dept:
    def GET(self):
        todos = db.select('todo')
        return render.police_dept(todos)

class add:
    def POST(self):
        i = web.input()
        n = db.insert('todo', title=i.title)
        raise web.seeother('/')

class delete:
    def POST(self):
        i = web.input()
        n = db.delete('todo', where="id=" + i.primeKey)
        raise web.seeother('/')

class update:
    def POST(self):
        i = web.input()
        v = i.column
        n = db.update('todo', where="id=" + i.primeKey, Done = i.value)
        raise web.seeother('/')

class cases:
    def GET(self):
        todos = db.select('todo')
        return render.cases(todos)

class detectives:
    def GET(self):
        todos = db.select('todo')
        return render.detectives(todos)

class divisions:
    def GET(self):
        todos = db.select('Divisions')
        return render.divisions(todos)

class addDivision:
    def POST(self):
        i = web.input()
        n = db.insert('Divisions', title=i.title, deptId=1)
        raise web.seeother('/divisions')

class delDivision:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Divisions WHERE title='" + i.primeKey + "'")
        raise web.seeother('/divisions')

class response:
    def GET(self):
        respond = db.select('Respond')
        officers = db.select('Officers')
        incidents = db.select('Incidents')
        return render.response(respond, officers, incidents)

class addResponse:
    def POST(self):
        i = web.input()
        n = db.insert('Respond', officerId=i.offi, incidentId=i.inci)
        raise web.seeother('/response')

class delResponse:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Respond WHERE officerId='" + i.offi + "' AND incidentId='" + i.inci + "'")
        raise web.seeother('/response')

class personnel:
    def GET(self):
        lead = db.select('Leadership')
        offi = db.select('Officers')
        supp = db.select('Support_Personnel')
        return render.personnel(lead, offi, supp)

class addOfficer:
    def POST(self):
        i = web.input()
        n = db.insert('Officers', lastName=i.last, firstName=i.first, rank='Officer', title=i.divi)
        raise web.seeother('/personnel')

class updateOfficer:
    def POST(self):
        i = web.input()
        n = db.query("UPDATE Officers SET rank='" + i.rank + "' WHERE officerId=" + i.offid)
        raise web.seeother('/personnel')

class delOfficer:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Officers WHERE officerId=" + i.offId)
        raise web.seeother('/personnel')

class addSupport:
    def POST(self):
        i = web.input()
        n = db.insert('Support_Personnel', lastName=i.last, firstName=i.first, title=i.divi)
        raise web.seeother('/personnel')

class delSupport:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Support_Personnel WHERE empId=" + i.empId)
        raise web.seeother('/personnel')

class incidents:
    def GET(self):
        inci = db.select('Incidents')
        return render.incidents(inci)

class addIncident:
    def POST(self):
        i = web.input()
        n = db.insert('Incidents', description=i.desc, location=i.loc)
        raise web.seeother('/incidents')

class resolveIncident:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Incidents WHERE incidentId=" + i.inciId)
        raise web.seeother('/incidents')

class cases:
    def GET(self):
        case = db.select('Cases')
        sus = db.select('Suspect')
        evi = db.select('Evidence')
        return render.cases(case,sus,evi)

class addCase:
    def POST(self):
        i = web.input()
        n = db.insert('Cases', offense=i.off, solved=0)
        raise web.seeother('/cases')

class solveCase:
    def POST(self):
        i = web.input()
        db.query("UPDATE Cases SET solved=1 WHERE caseNo=" + i.caseNo)
        raise web.seeother('/cases')

if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
