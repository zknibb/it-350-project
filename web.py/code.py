import web

render = web.template.render('templates/')

db = web.database(dbn='mysql', user='root', pw='linux', db='police')

urls = (
    '/(.*)/', 'redirect',
    '/cases', 'cases',
    '/addCase','addCase',
    '/solveCase', 'solveCase',
    '/detectives', 'detectives',
    '/addDet', 'addDet',
    '/delDet', 'delDet',
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
    '/assignments', 'assignments',
    '/addAssignment', 'addAssignment',
    '/delAssignment', 'delAssignment',
    '/incidents', 'incidents',
    '/addIncident', 'addIncident',
    '/resolveIncident', 'resolveIncident',
    '/suspidence', 'suspidence',
    '/addSus', 'addSus',
    '/addEv', 'addEv',
    '/removeSus', 'removeSus',
    '/removeEv', 'removeEv',
    '/assignSus', 'assignSus',
    '/assignEv', 'assignEv',
    '/equipment', 'equipment',
    '/addCruiser', 'addCruiser',
    '/deleteCruiser', 'deleteCruiser',
    '/addRadio', 'addRadio',
    '/deleteRadio', 'deleteRadio',
    '/addSidearm', 'addSidearm',
    '/deleteSidearm', 'deleteSidearm',
    '/assignCruiser', 'assignCruiser',
    '/assignRadio', 'assignRadio',
    '/assignSidearm', 'assignSidearm',
    '/unassignCruiser', 'unassignCruiser',
    '/unassignSidearm','unassignSidearm',
    '/unassignRadio', 'unassignRadio'
)

class redirect:
    def GET(self, path):
        web.seeother('/' + path)

class cases:
    def GET(self):
        todos = db.select('todo')
        return render.cases(todos)

class detectives:
    def GET(self):
        det = db.select('Detectives')
        return render.detectives(det)

class addDet:
    def POST(self):
        i = web.input()
        n = db.insert('Detectives', deptId=1, lastName=i.last, firstName=i.first)
        raise web.seeother('/detectives')

class delDet:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Detectives WHERE badgeNo='" + i.badgeNo + "'")
        raise web.seeother('/detectives')

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

class assignments:
    def GET(self):
        assign = db.select('Assignments')
        detect = db.select('Detectives')
        case = db.select('Cases')
        return render.assignments(assign, detect, case)

class addAssignment:
    def POST(self):
        i = web.input()
        n = db.insert('Assignments', badgeNo=i.badgeNo, caseNo=i.caseNo)
        raise web.seeother('/assignments')

class delAssignment:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Assignments WHERE badgeNo='" + i.badgeNo + "' AND caseNo='" + i.caseNo + "'")
        raise web.seeother('/assignments')

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

class suspidence:
    def GET(self):
        sus = db.select('Suspect')
        evi = db.select('Evidence')
        case = db.select('Cases')
        return render.suspidence(sus,evi,case)

class addSus:
    def POST(self):
        i = web.input()
        n = db.insert('Suspect', name=i.name, address=i.addr, caseNo=i.caseNo)
        id = db.query("SELECT susId FROM Suspect WHERE name='" + i.name + "' AND address='" + i.addr + "' AND caseNo=" + i.caseNo)
        for entry in id:
            y = db.insert('AttachedTo', susId=entry.susId, caseNo=i.caseNo)
            break
        raise web.seeother('/suspidence')

class addEv:
    def POST(self):
        i = web.input()
        n = db.insert('Evidence', description=i.desc, caseNo=i.caseNo)
        raise web.seeother('/suspidence')

class removeSus:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM AttachedTo WHERE susId=" + i.susId)
        db.query("DELETE FROM Suspect WHERE susId=" + i.susId)
        raise web.seeother('/suspidence')

class removeEv:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Evidence WHERE evId=" + i.evId)
        raise web.seeother('/suspidence')

class equipment:
    def GET(self):
        cruise = db.select('Cruisers')
        rad = db.select('Radios')
        side = db.select('Sidearms')
        return render.equipment(cruise, rad, side)

class assignRadio:
    def POST(self):
        i = web.input()
        db.query("UPDATE Radios SET officerId=" + i.officerId + " WHERE radioId=" + i.radioId)
        raise web.seeother('/equipment')

class assignCruiser:
    def POST(self):
        i = web.input()
        db.query("UPDATE Cruisers SET officerId=" + i.officerId + " WHERE vin=" + i.vin)
        raise web.seeother('/equipment')

class assignSidearm:
    def POST(self):
        i = web.input()
        db.query("UPDATE Sidearms SET officerId=" + i.officerId + " WHERE serialNo=" + i.serialNo)
        raise web.seeother('/equipment')

class unassignRadio:
    def POST(self):
        i = web.input()
        db.query("UPDATE Radios SET officerId=NULL WHERE radioId=" + i.radioId)
        raise web.seeother('/equipment')

class unassignCruiser:
    def POST(self):
        i = web.input()
        db.query("UPDATE Cruisers SET officerId=NULL WHERE vin=" + i.vin)
        raise web.seeother('/equipment')

class unassignSidearm:
    def POST(self):
        i = web.input()
        db.query("UPDATE Sidearms SET officerId=NULL WHERE serialNo=" + i.serialNo)
        raise web.seeother('/equipment')

class deleteRadio:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Radios WHERE radioId=" + i.radioId)
        raise web.seeother('/equipment')

class deleteCruiser:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Cruisers WHERE vin=" + i.vin)
        raise web.seeother('/equipment')

class deleteSidearm:
    def POST(self):
        i = web.input()
        db.query("DELETE FROM Sidearms WHERE serialNo=" + i.serialNo)
        raise web.seeother('/equipment')

class addCruiser:
    def POST(self):
        i = web.input()
        n = db.insert('Cruisers', model=i.model, deptId=1)
        raise web.seeother('/equipment')

class addSidearm:
    def POST(self):
        i = web.input()
        n = db.insert('Sidearms', type=i.type, deptId=1)
        raise web.seeother('/equipment')

class addRadio:
    def POST(self):
        i = web.input()
        n = db.insert('Radios', deptId=1)
        raise web.seeother('/equipment')


if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
