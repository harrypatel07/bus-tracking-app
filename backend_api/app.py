from flask import Flask, request
from flask_restplus import Resource, Api

app = Flask(__name__)
api = Api(app)

todos = {}


@api.route('/<string:todo_id>')
class TodoSimple(Resource):
    """
    You can try this example as follow:
        $ curl http://localhost:5000/todo1 -d "data=Remember the milk" -X PUT
        $ curl http://localhost:5000/todo1
        {"todo1": "Remember the milk"}
        $ curl http://localhost:5000/todo2 -d "data=Change my breakpads" -X PUT
        $ curl http://localhost:5000/todo2
        {"todo2": "Change my breakpads"}
    """
    def get(self, todo_id):
        for todo in todos:
           if todo['id'] == todo_id:
                return {todo_id: todos[todo_id]}
        api.abort(404, "Todo {} doesn't exist".format(todo_id))
        

    def put(self, todo_id):
        todos[todo_id] = request.form['data']
        return {todo_id: todos[todo_id]}


if __name__ == '__main__':
    app.run(debug=False)
