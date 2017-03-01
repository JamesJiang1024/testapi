package models

import (
	"errors"
	"strconv"
	"time"
)

var (
	Objects map[string]*Object
)

type Object struct {
	ObjectId   string
	Version    string
	PlayerName string
}

func init() {
	Objects = make(map[string]*Object)
	Objects["bb3f3e75-c777-4519-b18e-87d187e883e1"] = &Object{"bb3f3e75-c777-4519-b18e-87d187e883e1", "v2.0", "yuejun"}
}

func AddOne(object Object) (ObjectId string) {
	object.ObjectId = "astaxie" + strconv.FormatInt(time.Now().UnixNano(), 10)
	Objects[object.ObjectId] = &object
	return object.ObjectId
}

func GetOne(ObjectId string) (object *Object, err error) {
	if v, ok := Objects[ObjectId]; ok {
		return v, nil
	}
	return nil, errors.New("ObjectId Not Exist")
}

func GetAll() map[string]*Object {
	return Objects
}

func Update(ObjectId string, Version string) (err error) {
	if v, ok := Objects[ObjectId]; ok {
		v.Version = Version
		return nil
	}
	return errors.New("ObjectId Not Exist")
}

func Delete(ObjectId string) {
	delete(Objects, ObjectId)
}
