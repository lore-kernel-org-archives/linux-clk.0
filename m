Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3141540DFC9
	for <linux-clk@vger.kernel.org>; Tue,  5 May 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986987; cv=none; b=Z6WYPdpJgW3vtDWTDmcoQCqi//fD+McUfQi0id978Ys9lFgWUBmHfpqtZfR84x6bpPbSNIATpeSr+4slZTKe3ofURcsq8ycF4aaNh7uRBIjRPoCMOeXAt4wamAdlX82HWL3ifs3yeboYSY2I8zIPZIOCKvSMsnV6q88v8NPQcvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986987; c=relaxed/simple;
	bh=cXqD6L5ZgGDOjaRakM6IhHDH07275qAKvJ3/w4t7AvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXjH8bJ9i5FLx8VoC6eLN1aF/vgosVmsP0FsB/kI/wzsFnC2ACKZZ+i2OUpPEzT9P++zysHcFp1Qj9QbYXNWBb9mPVCeffLCsoS63kBm0q9+kZ9elGkd2Sziby6UeTnJbD1powZvn7KcCKv5Ofqg0IbcSiOFcCeQv5s4umXpc3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YoFL9TeD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YoFL9TeD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D85434E42BC6;
	Tue,  5 May 2026 13:16:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3A846053C;
	Tue,  5 May 2026 13:16:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA5E811AD0179;
	Tue,  5 May 2026 15:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777986981; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0Ay5j5jF2czJyodsxELYPre6pXvfnrOxt7H2FRKhYNQ=;
	b=YoFL9TeDIlgs+4UdO6TLJUbdRIFRxIC68L5gBvqBPEdsZERSZYnPetT+i8GPets2aozpms
	wPjVS4wuImYqjkIm81YvLU4zzCTIdLWfrA8tPOTATI+i7ARIGj4h4o5Djs87nLq0UZsdIw
	x5qVtN1e8AtZlsuN4YfqcR3S3+FG04AP7hKPMVU93Xx2ymPh3crIprUkFHtu39DKqMgvoP
	ZI0mGi1jLYWSjtANE9pYlamZR7K0ttTayBGwytqnFGrpjlzTKl4/KERzOukirXo5d4S6E5
	abCcXnasvG4EVhZLUyf6BNVbAcAYiUWh1sKn7Yl8jXIUNc6kvPAnU/V/TupTaw==
Message-ID: <9fe10a63-3dc5-4bbc-bbd0-08cc3f625975@bootlin.com>
Date: Tue, 5 May 2026 15:16:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] firmware: ti_sci: add support for restoring IRQs
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
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-2-72c6468cb2ab@bootlin.com>
 <20260505113213.fz7qrovpgn4lbesn@zodiac>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260505113213.fz7qrovpgn4lbesn@zodiac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/5/26 1:32 PM, Nishanth Menon wrote:
> On 14:21-20260427, Thomas Richard (TI) wrote:
> 
> [..]
> 
>>  /**
>>   * ti_sci_set_irq() - Helper api to configure the irq route between the
>>   *		      requested source and destination
>> @@ -2324,15 +2363,43 @@ static int ti_sci_set_irq(const struct ti_sci_handle *handle, u32 valid_params,
>>  			  u16 dst_host_irq, u16 ia_id, u16 vint,
>>  			  u16 global_event, u8 vint_status_bit, u8 s_host)
>>  {
>> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
>> +	struct ti_sci_msg_req_manage_irq *desc;
>> +	struct ti_sci_irq *irq;
>> +	int ret;
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
>> +		return ret;
>> +
>> +	irq = kzalloc_obj(*irq, GFP_KERNEL);
>> +	if (!irq)
>> +		return -ENOMEM;
> 
> Do we need to handle cleanup of ti_sci_manage_irq if the allocation fails?

Yes to keep hash list and allocated IRQs consistent.

> 
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
> 
> No locking? set_irq can be invoked in parallel paths, no?
> Further, should'nt we check if the same src_id and src_index is already
> present before adding to hash list?

ti_sci_manage_irq(TI_SCI_MSG_SET_IRQ) is the lock. If it succeeds we
have to add it in hash list.

Can set_irq() and free_irq() be invoked in parallel paths? In this case
maybe I should add a lock for set_irq() and free_irq().

> 
>> +
>> +	return 0;
>>  }
>>  
>>  /**
>> @@ -2358,15 +2425,46 @@ static int ti_sci_free_irq(const struct ti_sci_handle *handle, u32 valid_params,
>>  			   u16 dst_host_irq, u16 ia_id, u16 vint,
>>  			   u16 global_event, u8 vint_status_bit, u8 s_host)
>>  {
>> +	struct ti_sci_info *info = handle_to_ti_sci_info(handle);
>> +	struct ti_sci_msg_req_manage_irq irq_desc;
>> +	struct ti_sci_irq *this_irq;
>> +	struct hlist_node *tmp_node;
>> +	int ret;
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
>> +		return ret;
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
>> +			return 0;
>> +		}
>> +	}
>> +
> 
> We should ideally not be here, correct? Add a dev_warn?

yes

> 
>> +	return 0;
>>  }
>>  
>>  /**
>> @@ -3847,7 +3945,10 @@ static int ti_sci_suspend_noirq(struct device *dev)
>>  static int ti_sci_resume_noirq(struct device *dev)
>>  {
>>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>> -	int ret = 0;
>> +	struct ti_sci_msg_req_manage_irq *irq_desc;
>> +	struct ti_sci_irq *irq;
>> +	struct hlist_node *tmp_node;
>> +	int ret = 0, i;
>>  	u32 source;
>>  	u64 time;
>>  	u8 pin;
>> @@ -3859,6 +3960,32 @@ static int ti_sci_resume_noirq(struct device *dev)
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
>> +				if (ret)
>> +					return ret;
> 
> Do you want to attempt to restore the rest of the entries rather than give
> up on the first fail? Maybe just log the error for debug and attempt the
> rest?

In this case, if I get more than one error what value should I return?

Best Regards,
Thomas
