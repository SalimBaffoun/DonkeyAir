<?php

class Option {

    public static function listOptions(){
        $db = DataBase::getPdo();
        $options = $db->query('SELECT * FROM options');

        return $options;

    }



}