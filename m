Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0EF3CAA3E
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 15:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600669; cv=none; b=mUmTMpEpl6U+wQQggbHJw9OH7ffSjtNadPcJglYCRsi++l+U4FXXuZmqhDYPPRNSL6Nr6dXC1LNPYmSlaOAkf+B2H1HBrROn/HYPWbkym4vfFggUeQMSzJqhB6Q3egYhUf6NRRHG3JDlfNls4z4Agir5qXdm3gVdhMXvJ/JawlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600669; c=relaxed/simple;
	bh=ux9OVZqtuDTsqrys9zxanS/HEJU9ENuceEUnZaxE7vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kK+2hJmZHBIj3HYCD38uWXcKNL/x35ujJXmsj3C5BLCaaY414NewiXuwHWmLvToCu0MeC1F+Mjbwm7C6yq0tJ2gat/40MfIHnsde4d6BRjgt5OlUgsNYqPl4ZtYiTqWtszHXhRsQPhDh5BLj/D8wUCJGKV4jKpHs0s5EignVIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=omhLMDri; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="omhLMDri"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D9CF4E42C00;
	Tue, 12 May 2026 15:44:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1D5560646;
	Tue, 12 May 2026 15:44:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB84211AF8C84;
	Tue, 12 May 2026 17:44:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778600656; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BURi5vkPxcxPKcJLIsmlkzLGP0wRjDvf8EYPEcCoD1I=;
	b=omhLMDriLy7fOtPYzmTFgtuOpEWgUbD9lHNhu3jzp88xq8+RIQt2rrBpLoX2uZPiQb5Nw/
	XGfVjrX0x+iJgs6NLuJJUM54WpGvIaDWfAmBCnqRlDn96rDOfFXz+Fl0yYiDYZ/BZfNzKE
	fsEsh5WRzqpkNzs0i5GBiGnfeNLg5NB1MNJfT1mPgEb0s7Qtcl3zD6YP8tR9HyRdk/QGgE
	v9YWPvqlpo8IhVNejFEthq8vqDKLkVicPsaAkJ8wXFITaOxOYBpjLK+fCxNNlbtTq73mjl
	LJyMMaMLM4GNwrlmBYgTIVh9rvMrnwykeRvQUmIdKmNeJa4FV92Va+URZGQg1A==
Message-ID: <110af14c-101e-48fb-8262-60bf395d4f0a@bootlin.com>
Date: Tue, 12 May 2026 17:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
To: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
 Kendall Willis <k-willis@ti.com>
References: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
 <20260506-ti-sci-jacinto-s2r-restore-irq-v7-2-037098a35215@bootlin.com>
 <20260506141508.2bko3ntcv7rkqfvn@certainty>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260506141508.2bko3ntcv7rkqfvn@certainty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Nishanth,

On 5/6/26 4:15 PM, Nishanth Menon wrote:
> On 10:35-20260506, Thomas Richard (TI) wrote:
>> Some DM-Firmware are not able to restore the IRQ context after a
>> suspend-resume. The IRQ_CONTEXT_LOST firmware capability has been
>> introduced to identify this characteristic. In this case the
>> responsibility is delegated to the ti_sci driver, which maintains an
>> internal list of all requested IRQs. This list is updated on each
>> set()/free() operation, and all IRQs are restored during the resume_noirq()
>> phase.
>>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Reviewed-by: Kendall Willis <k-willis@ti.com>
>> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
>> ---
> 
> coccicheck reports two additional warnings at this patch:
> +drivers/firmware/ti_sci.c:2495:1-7: preceding lock on line 2454
> +drivers/firmware/ti_sci.c:2420:1-7: preceding lock on line 2378

I do not see the potential deadlock in set_irq() and free_irq().
I guess it is a false positive.

> 
>>  drivers/firmware/ti_sci.c | 201 +++++++++++++++++++++++++++++++++++++++++++---
>>  drivers/firmware/ti_sci.h |   2 +
>>  2 files changed, 191 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index eaeaaae94142..531ac3aa38b8 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -12,11 +12,13 @@
>>  #include <linux/cpu.h>
>>  #include <linux/debugfs.h>
>>  #include <linux/export.h>
>> +#include <linux/hashtable.h>
>>  #include <linux/io.h>
>>  #include <linux/iopoll.h>
>>  #include <linux/kernel.h>
>>  #include <linux/mailbox_client.h>
>>  #include <linux/module.h>
>> +#include <linux/mutex.h>
>>  #include <linux/of.h>
>>  #include <linux/of_platform.h>
>>  #include <linux/platform_device.h>
>> @@ -87,6 +89,16 @@ struct ti_sci_desc {
>>  	int max_msg_size;
>>  };
>>  
>> +/**
>> + * struct ti_sci_irq - Description of allocated irqs
>> + * @node: Link to hash table
>> + * @desc: Description of the irq
>> + */
>> +struct ti_sci_irq {
>> +	struct hlist_node node;
>> +	struct ti_sci_msg_req_manage_irq desc;
>> +};
>> +
>>  /**
>>   * struct ti_sci_info - Structure representing a TI SCI instance
>>   * @dev:	Device pointer
>> @@ -101,6 +113,8 @@ struct ti_sci_desc {
>>   * @chan_rx:	Receive mailbox channel
>>   * @minfo:	Message info
>>   * @node:	list head
>> + * @irqs:	List of allocated irqs
>> + * @irq_lock:	Protection for irq hash list
>>   * @host_id:	Host ID
>>   * @fw_caps:	FW/SoC low power capabilities
>>   * @users:	Number of users of this instance
>> @@ -118,6 +132,8 @@ struct ti_sci_info {
>>  	struct mbox_chan *chan_rx;
>>  	struct ti_sci_xfers_info minfo;
>>  	struct list_head node;
>> +	DECLARE_HASHTABLE(irqs, 8);
>> +	struct mutex irq_lock;
> 
> No action needed: checkpatch flags this as not documented, when it is
> clearly documented above.
> 
>>  	u8 host_id;
>>  	u64 fw_caps;
>>  	/* protected by ti_sci_list_mutex */
>> @@ -2301,6 +2317,32 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
>>  	return ret;
>>  }
>>  
>> +/**
>> + * ti_sci_irq_hash() - Helper API to compute irq hash for the hash table.
>> + * @irq:	irq to hash
>> + *
>> + * Return: the computed hash value.
>> + */
>> +static int ti_sci_irq_hash(struct ti_sci_msg_req_manage_irq *irq)
>> +{
>> +	return irq->src_id ^ irq->src_index;
>> +}
>> +
>> +/**
>> + * ti_sci_irq_equal() - Helper API to compare two irqs (generic headers are not
>> + *                       compared)
>> + * @irq_a:	irq_a to compare
>> + * @irq_b:	irq_b to compare
>> + *
>> + * Return: true if the two irqs are equal, else false.
>> + */
>> +static bool ti_sci_irq_equal(struct ti_sci_msg_req_manage_irq *irq_a,
>> +			     struct ti_sci_msg_req_manage_irq *irq_b)
>> +{
>> +	return !memcmp(&irq_a->valid_params, &irq_b->valid_params,
>> +		       sizeof(*irq_a) - sizeof(irq_a->hdr));
>> +}
>> +
>>  /**
>>   * ti_sci_set_irq() - Helper api to configure the irq route between the
>>   *		      requested source and destination
>> @@ -2324,15 +2366,60 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
>>  			  u16 dst_host_irq, u16 ia_id, u16 vint,
>>  			  u16 global_event, u8 vint_status_bit, u8 s_host)
>>  {
>> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
>> +	struct ti_sci_msg_req_manage_irq *desc;
>> +	struct ti_sci_irq *irq;
>> +	int ret;
>> +
>> +	/*
>> +	 * Lock for set_irq() and free_irq() to keep the IRQ hash list
>> +	 * consistent only if MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST is set. Else
>> +	 * IRQ hash list is not used.
>> +	 */
>> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
>> +		mutex_lock(&info->irq_lock);
>> +
>>  	pr_debug("%s: IRQ set with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>>  		 __func__, valid_params, src_id, src_index,
>>  		 dst_id, dst_host_irq, ia_id, vint, global_event,
>>  		 vint_status_bit);
>>  
>> -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
>> -				 dst_id, dst_host_irq, ia_id, vint,
>> -				 global_event, vint_status_bit, s_host,
>> -				 TI_SCI_MSG_SET_IRQ);
>> +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
>> +				dst_id, dst_host_irq, ia_id, vint,
>> +				global_event, vint_status_bit, s_host,
>> +				TI_SCI_MSG_SET_IRQ);
>> +
>> +	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
>> +		goto end;
>> +
>> +	irq = kzalloc_obj(*irq, GFP_KERNEL);
>> +	if (!irq) {
>> +		ti_sci_manage_irq(handle, valid_params, src_id, src_index,
>> +				  dst_id, dst_host_irq, ia_id, vint,
>> +				  global_event, vint_status_bit, s_host,
>> +				  TI_SCI_MSG_FREE_IRQ);
>> +		ret = -ENOMEM;
>> +		goto end;
>> +	}
>> +
>> +	desc = &irq->desc;
>> +	desc->valid_params = valid_params;
>> +	desc->src_id = src_id;
>> +	desc->src_index = src_index;
>> +	desc->dst_id = dst_id;
>> +	desc->dst_host_irq = dst_host_irq;
>> +	desc->ia_id = ia_id;
>> +	desc->vint = vint;
>> +	desc->global_event = global_event;
>> +	desc->vint_status_bit = vint_status_bit;
>> +	desc->secondary_host = s_host;
>> +
>> +	hash_add(info->irqs, &irq->node, ti_sci_irq_hash(desc));
>> +
>> +end:
>> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
>> +		mutex_unlock(&info->irq_lock);
>> +	return ret;
>>  }
>>  
>>  /**
>> @@ -2358,15 +2445,56 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
>>  			   u16 dst_host_irq, u16 ia_id, u16 vint,
>>  			   u16 global_event, u8 vint_status_bit, u8 s_host)
>>  {
>> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
>> +	struct ti_sci_msg_req_manage_irq irq_desc;
>> +	struct device *dev = info->dev;
>> +	struct ti_sci_irq *this_irq;
>> +	struct hlist_node *tmp_node;
>> +	int ret;
>> +
>> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
>> +		mutex_lock(&info->irq_lock);
>> +
>>  	pr_debug("%s: IRQ release with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
>>  		 __func__, valid_params, src_id, src_index,
>>  		 dst_id, dst_host_irq, ia_id, vint, global_event,
>>  		 vint_status_bit);
>>  
>> -	return ti_sci_manage_irq(handle, valid_params, src_id, src_index,
>> -				 dst_id, dst_host_irq, ia_id, vint,
>> -				 global_event, vint_status_bit, s_host,
>> -				 TI_SCI_MSG_FREE_IRQ);
>> +	ret = ti_sci_manage_irq(handle, valid_params, src_id, src_index,
>> +				dst_id, dst_host_irq, ia_id, vint,
>> +				global_event, vint_status_bit, s_host,
>> +				TI_SCI_MSG_FREE_IRQ);
>> +
>> +	if (ret || !(info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST))
>> +		goto end;
>> +
>> +	irq_desc.valid_params = valid_params;
>> +	irq_desc.src_id = src_id;
>> +	irq_desc.src_index = src_index;
>> +	irq_desc.dst_id = dst_id;
>> +	irq_desc.dst_host_irq = dst_host_irq;
>> +	irq_desc.ia_id = ia_id;
>> +	irq_desc.vint = vint;
>> +	irq_desc.global_event = global_event;
>> +	irq_desc.vint_status_bit = vint_status_bit;
>> +	irq_desc.secondary_host = s_host;
>> +
>> +	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
>> +				    ti_sci_irq_hash(&irq_desc)) {
>> +		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
>> +			hlist_del(&this_irq->node);
>> +			kfree(this_irq);
>> +			goto end;
>> +		}
>> +	}
>> +
>> +	dev_warn(dev, "%s: should not be here, IRQ was not found in hash list\n",
>> +		 __func__);
>> +
>> +end:
>> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST)
>> +		mutex_unlock(&info->irq_lock);
>> +	return ret;
>>  }
>>  
>>  /**
>> @@ -3847,7 +3975,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
>>  static int ti_sci_resume_noirq(struct device *dev)
>>  {
>>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>> -	int ret = 0;
>> +	struct ti_sci_msg_req_manage_irq *irq_desc;
>> +	struct ti_sci_irq *irq;
>> +	struct hlist_node *tmp_node;
>> +	int ret = 0, err = 0, i;
>>  	u32 source;
>>  	u64 time;
>>  	u8 pin;
>> @@ -3859,13 +3990,50 @@ static int ti_sci_resume_noirq(struct device *dev)
>>  			return ret;
>>  	}
>>  
>> +	switch (pm_suspend_target_state) {
>> +	case PM_SUSPEND_MEM:
>> +		if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
>> +			hash_for_each_safe(info->irqs, i, tmp_node, irq, node) {
>> +				irq_desc = &irq->desc;
>> +				ret = ti_sci_manage_irq(&info->handle,
>> +							irq_desc->valid_params,
>> +							irq_desc->src_id,
>> +							irq_desc->src_index,
>> +							irq_desc->dst_id,
>> +							irq_desc->dst_host_irq,
>> +							irq_desc->ia_id,
>> +							irq_desc->vint,
>> +							irq_desc->global_event,
>> +							irq_desc->vint_status_bit,
>> +							irq_desc->secondary_host,
>> +							TI_SCI_MSG_SET_IRQ);
>> +				if (ret) {
>> +					dev_err(dev, "failed to restore IRQ with valid_params = 0x%x from src = %d, index = %d, to dst = %d, irq = %d,via ia_id = %d, vint = %d, global event = %d,status_bit = %d\n",
> 
> space before via? overall this print is needed, but a bit umm.. we have
> similar ones already..

Yes I wanted to have consistent messages.
Will fix the missing space.

> 
>> +						irq_desc->valid_params,
>> +						irq_desc->src_id,
>> +						irq_desc->src_index,
>> +						irq_desc->dst_id,
>> +						irq_desc->dst_host_irq,
>> +						irq_desc->ia_id,
>> +						irq_desc->vint,
>> +						irq_desc->global_event,
>> +						irq_desc->vint_status_bit);
>> +					err = ret;
>> +				}
>> +			}
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>>  	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
>>  	/* Do not fail to resume on error as the wake reason is not critical */
>>  	if (!ret)
>>  		dev_info(dev, "ti_sci: wakeup source:0x%x, pin:0x%x, mode:0x%x\n",
>>  			 source, pin, mode);
>>  
>> -	return 0;
>> +	return err;
>>  }
>>  
>>  static void ti_sci_pm_complete(struct device *dev)
>> @@ -4014,13 +4182,14 @@ static int ti_sci_probe(struct platform_device *pdev)
>>  	}
>>  
>>  	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
>> -	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s\n",
>> +	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s\n",
>>  		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
>>  		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
>>  		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
>>  		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
>>  		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
>> -		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : ""
>> +		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
>> +		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : ""
>>  	);
>>  
>>  	ti_sci_setup_ops(info);
>> @@ -4053,6 +4222,14 @@ static int ti_sci_probe(struct platform_device *pdev)
>>  	list_add_tail(&info->node, &ti_sci_list);
>>  	mutex_unlock(&ti_sci_list_mutex);
>>  
>> +	if (info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST) {
>> +		ret = devm_mutex_init(dev, &info->irq_lock);
>> +		if (ret)
>> +			return ret;
> 
> If devm_mutex_init() fails, the function returns directly rather than
> going through the out: label. All other error paths after the mailbox
> channel allocations use goto out, which calls mbox_free_channel() for
> both channels. Since mbox_request_channel_byname() is not a devm
> allocation, those channels would not be freed by the devm cleanup path
> on probe failure.
> 
> Does this leak info->chan_tx and info->chan_rx when devm_mutex_init()
> returns an error?

Indeed we should go to 'out'.

Best Regards,
Thomas
