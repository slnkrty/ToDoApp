pragma solidity ^0.8.7;
import "hardhat/console.sol";
// SPDX-License-Identifier: MIT

contract ToDo{

    struct ToDos{
        string gorev;
        bool gorevin_durumu;
    }
    ToDos[] public todo_list; //ToDos tipinde bir array olusturuldu

    function GorevEkle(string calldata _gorev) public {

        // initialize an empty struct and then update it
        ToDos memory todo;
        todo.gorev=_gorev;
        // todo.completed initialized to false
        todo_list.push(todo);
    }
        function get(uint _index) public view returns (string memory gorev, bool gorevin_durumu) {
        ToDos storage todo = todo_list[_index];
        return (todo.gorev, todo.gorevin_durumu);
    }

    // gorevin guncellendigi fonksiyon
    function updateText(uint _index, string calldata _gorev) public {
        ToDos storage todo = todo_list[_index];
        todo.gorev = _gorev;
    }

    // gorevin durumu bilgisinin guncellendigi fonksiyon
    function toggleCompleted(uint _index) public {
        ToDos storage todo = todo_list[_index];
        todo.gorevin_durumu = !todo.gorevin_durumu;
    }
    function GorevSil(uint _index) public {
        // girilen indexteki gorev silinir, diger gorevlerin indexi aynı kalır
        delete (todo_list[_index]);
    }
  }
