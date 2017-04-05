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
    '/detectives', 'detectives',
    '/divisions', 'divisions',
    '/addDivision', 'addDivision',
    '/delDivision', 'delDivision',
    '/response', 'response',
    '/addResponse', 'addResponse',
    '/delResponse', 'delResponse'
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

if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
