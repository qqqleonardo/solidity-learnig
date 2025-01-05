// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) external {
        todos.push(Todo({text: _text, completed: false}));
    }

    function updateText(uint256 _index, string calldata _text) external {
        todos[_index].text = _text; //更省gas

        // Todo storage todo = todos[_index];
        // todo.text = _text;
        //会消耗更多的gas 但是在更新结构体多个字段的时候会有更优的gas消耗
    }

    function toggleCompleted(uint256 _index) external {
        todos[_index].completed = !todos[_index].completed;
    }

    function get(uint256 _index) external view returns (string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }
}
