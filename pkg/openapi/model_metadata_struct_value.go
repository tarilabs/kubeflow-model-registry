/*
Model Registry REST API

REST API for Model Registry to create and manage ML model metadata

API version: v1alpha2
*/

// Code generated by OpenAPI Generator (https://openapi-generator.tech); DO NOT EDIT.

package openapi

import (
	"encoding/json"
)

// checks if the MetadataStructValue type satisfies the MappedNullable interface at compile time
var _ MappedNullable = &MetadataStructValue{}

// MetadataStructValue A struct property value.
type MetadataStructValue struct {
	// Base64 encoded bytes for struct value
	StructValue  string `json:"struct_value"`
	MetadataType string `json:"metadataType"`
}

// NewMetadataStructValue instantiates a new MetadataStructValue object
// This constructor will assign default values to properties that have it defined,
// and makes sure properties required by API are set, but the set of arguments
// will change when the set of required properties is changed
func NewMetadataStructValue(structValue string, metadataType string) *MetadataStructValue {
	this := MetadataStructValue{}
	this.StructValue = structValue
	this.MetadataType = metadataType
	return &this
}

// NewMetadataStructValueWithDefaults instantiates a new MetadataStructValue object
// This constructor will only assign default values to properties that have it defined,
// but it doesn't guarantee that properties required by API are set
func NewMetadataStructValueWithDefaults() *MetadataStructValue {
	this := MetadataStructValue{}
	var metadataType string = "MetadataStructValue"
	this.MetadataType = metadataType
	return &this
}

// GetStructValue returns the StructValue field value
func (o *MetadataStructValue) GetStructValue() string {
	if o == nil {
		var ret string
		return ret
	}

	return o.StructValue
}

// GetStructValueOk returns a tuple with the StructValue field value
// and a boolean to check if the value has been set.
func (o *MetadataStructValue) GetStructValueOk() (*string, bool) {
	if o == nil {
		return nil, false
	}
	return &o.StructValue, true
}

// SetStructValue sets field value
func (o *MetadataStructValue) SetStructValue(v string) {
	o.StructValue = v
}

// GetMetadataType returns the MetadataType field value
func (o *MetadataStructValue) GetMetadataType() string {
	if o == nil {
		var ret string
		return ret
	}

	return o.MetadataType
}

// GetMetadataTypeOk returns a tuple with the MetadataType field value
// and a boolean to check if the value has been set.
func (o *MetadataStructValue) GetMetadataTypeOk() (*string, bool) {
	if o == nil {
		return nil, false
	}
	return &o.MetadataType, true
}

// SetMetadataType sets field value
func (o *MetadataStructValue) SetMetadataType(v string) {
	o.MetadataType = v
}

func (o MetadataStructValue) MarshalJSON() ([]byte, error) {
	toSerialize, err := o.ToMap()
	if err != nil {
		return []byte{}, err
	}
	return json.Marshal(toSerialize)
}

func (o MetadataStructValue) ToMap() (map[string]interface{}, error) {
	toSerialize := map[string]interface{}{}
	toSerialize["struct_value"] = o.StructValue
	toSerialize["metadataType"] = o.MetadataType
	return toSerialize, nil
}

type NullableMetadataStructValue struct {
	value *MetadataStructValue
	isSet bool
}

func (v NullableMetadataStructValue) Get() *MetadataStructValue {
	return v.value
}

func (v *NullableMetadataStructValue) Set(val *MetadataStructValue) {
	v.value = val
	v.isSet = true
}

func (v NullableMetadataStructValue) IsSet() bool {
	return v.isSet
}

func (v *NullableMetadataStructValue) Unset() {
	v.value = nil
	v.isSet = false
}

func NewNullableMetadataStructValue(val *MetadataStructValue) *NullableMetadataStructValue {
	return &NullableMetadataStructValue{value: val, isSet: true}
}

func (v NullableMetadataStructValue) MarshalJSON() ([]byte, error) {
	return json.Marshal(v.value)
}

func (v *NullableMetadataStructValue) UnmarshalJSON(src []byte) error {
	v.isSet = true
	return json.Unmarshal(src, &v.value)
}
