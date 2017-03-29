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
    '/cruisers', 'cruisers',
    '/detectives', 'detectives',
    '/divisions', 'divisions',
    '/leadership', 'leadership',
    '/officers', 'officers',
    '/radios', 'radios',
    '/sidearms', 'sidearms',
    '/support_personnel', 'support_personnel'
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

class cruisers:
    def GET(self):
        todos = db.select('todo')
        return render.cruisers(todos)

class detectives:
    def GET(self):
        todos = db.select('todo')
        return render.detectives(todos)

class divisions:
    def GET(self):
        todos = db.select('todo')
        return render.divisions(todos)

class leadership:
    def GET(self):
        todos = db.select('todo')
        return render.leadership(todos)

class officers:
    def GET(self):
        todos = db.select('todo')
        return render.officers(todos)

class radios:
    def GET(self):
        todos = db.select('todo')
        return render.radios(todos)

class sidearms:
    def GET(self):
        todos = db.select('todo')
        return render.sidearms(todos)

class support_personnel:
    def GET(self):
        todos = db.select('todo')
        return render.support_personnel(todos)

if __name__ == "__main__":
    app = web.application(urls, globals())
    app.run()
