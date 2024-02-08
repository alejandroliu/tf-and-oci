TOFU	= tofu

help:
	@echo "Usage:"
	@echo "- make template : generate template terraform.tfvars"
	@echo "- make key : Generate default key"
	@echo "- make users : Generate a template users file"
	@echo "- make zip : zip sensitive files"
	@echo "- make clean : remove terraform state"


template: terraform.tfvars

terraform.tfvars:
	# TODO: do diff/merge
	# if target already exits:
	# - take previous saved output
	# - take current saved output
	# - merge diffs into terraform.tfvars
	# else:
	# - just generate...
	grep -E  '#|variable|^$$' vars.tf \
			| sed -e 's/[ ]*variable[ ]*"//' -e 's/"[ ][ ]*{/ = "__FILL_DATA_HERE__"/' > $@

clean:
	@type $(TOFU)
	# Make sure that there are not resources pending
	@[ $$($(TOFU) state list | wc -l) -eq 0 ] && exit 0 ;\
		echo "You must destroy resources before running \"clean\"" 1>&2 ;\
		exit 1
	rm -rf .terraform .terraform.lock.hcl terraform.tfstate terraform.tfstate.backup

zip:
	zip saved-$(shell date +%y%m%d_%H%M%S).zip users.yml default-id_key* terraform.tfvars

users: users.yml

users.yml:
	cp -v users.yml-sample users.yml

key: default-id_key.pub

default-id_key.pub:
	ssh-keygen -C "tofu-default-key" -f $$(basename "$@" .pub) -N ''


