package main

import (
	"github.com/hashicorp/terraform-plugin-sdk/v2/helper/schema"
)

func resourceHelloWorld() *schema.Resource {
	return &schema.Resource{
		Create: resourceHelloWorldCreate,
		Read:   resourceHelloWorldRead,
		Update: resourceHelloWorldUpdate,
		Delete: resourceHelloWorldDelete,

		Schema: map[string]*schema.Schema{
			"message": {
				Type:     schema.TypeString,
				Required: true,
			},
		},
	}
}

func resourceHelloWorldCreate(d *schema.ResourceData, m interface{}) error {
	message := d.Get("message").(string)
	d.SetId("helloworld")
	d.Set("message", message)
	return nil
}

func resourceHelloWorldRead(d *schema.ResourceData, m interface{}) error {
	return nil
}

func resourceHelloWorldUpdate(d *schema.ResourceData, m interface{}) error {
	message := d.Get("message").(string)
	d.Set("message", message)
	return nil
}

func resourceHelloWorldDelete(d *schema.ResourceData, m interface{}) error {
	d.SetId("")
	return nil
}
