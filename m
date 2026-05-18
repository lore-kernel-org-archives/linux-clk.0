Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967542F1FDF;
	Mon, 18 May 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118309; cv=none; b=LCZI/M5eLljFJQL18SxWAMBTzK/dYukqEThW9by33pw3mVuTMC2O/k+Wprodbc3S5pKr4hFD8VzTH0u2gSNFu/7ET9gYoHv3bmUYsQHHsRw2mISJ+dFCi0iuCXLpvskvUckqTcwkeACtLA+9C7seWUhVENu/na4SVx5Qa2Nvrbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118309; c=relaxed/simple;
	bh=JpWnSmvcEqA51rSPfHoD3uVTOZethfc5ES+f1+Ur1E0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwC2IuJvJ8ksnh8+w+VSA1Jsbe6c0ILAkFDzAlqviWxtOPcS3rqOqK4T3ib5blLPY6q8gHcY1+3CRbDuNJ1K6XXvrfSiWz2iaqwcBt76h4U3ZUFIYsQTkic/4SpSu/MnWbagiRLhJrEfmYXlTQO2uJLnw9ubOLuYEqO1gyxDLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vIngCAZB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vIngCAZB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8128AC2B9E7;
	Mon, 18 May 2026 15:32:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC92F5FFA3;
	Mon, 18 May 2026 15:31:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A852111AF87C0;
	Mon, 18 May 2026 17:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779118302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GedkbT/hMsDB4oPdDWOa0ci7dvrTDFrM6dS9NjjNaXk=;
	b=vIngCAZBipKPEwkUwbvDJSNgwP664y7A5wktLlsWfr62d0PeSYgdMabXHQOtwRPgKdvlDQ
	csmRJZI2QwBcsTMZ6Pp2KdNTzPmGgu2gNNUZSBmDrRfj4vi2lyUfBG7fqxZjZU2l+klWYi
	YrXRU7xXUXyg3xWKemRF7lcxTw3wDBm2NzjAtX6Kdlx1q2waHm77V7dubunzIbmlOeLVIH
	thAe5uSwAcMS3gYiKS/rvNJOK4HfKpIHNIDsSQTh/U/SA5L3WfaEMZ5G/N7njcPBx6OkS+
	SumsWT2tdplV3USMgpdpemaeuLvp8S19BHVfFtBrrN8b0QbcPoWJhakuQZtNvQ==
Message-ID: <bea17624-dc1e-488e-8b5b-fb3fdf1f8fbf@bootlin.com>
Date: Mon, 18 May 2026 17:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] firmware: ti_sci: add support for restoring IRQs
 during resume
To: "Kumar, Udit" <u-kumar1@ti.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
 Kendall Willis <k-willis@ti.com>
References: <20260513-ti-sci-jacinto-s2r-restore-irq-v8-0-195b27f91519@bootlin.com>
 <20260513-ti-sci-jacinto-s2r-restore-irq-v8-2-195b27f91519@bootlin.com>
 <495082a3-1a08-45d9-90f0-4723837ec4be@ti.com>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <495082a3-1a08-45d9-90f0-4723837ec4be@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Udit,

On 5/18/26 3:22 PM, Kumar, Udit wrote:
> 
> 
> On 5/13/2026 6:16 PM, Thomas Richard (TI) wrote:
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
>>  drivers/firmware/ti_sci.c | 201 +++++++++++++++++++++++++++++++++++++++++++---
>>  drivers/firmware/ti_sci.h |   3 +
>>  2 files changed, 192 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index eaeaaae94142..35ee8cc830c8 100644
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
> 
> Could you check, recursive header inclusion header warning
> In file included from linux/printk.h,
>                   from linux/srcu.h:85
>                   from linux/notifier.h:16
>                   from linux/reboot.h:6
> -drivers/firmware/ti_sci.c:31: warning: recursive header inclusion
> +drivers/firmware/ti_sci.c:33: warning: recursive header inclusion

This warning was already present. It just means the line changed because
I added some new headers. But this patch did not introduce the recursive
header inclusion.

> 
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
> One of script report errors, you might need to document hashtabke.
> However warning is unrelated
> CHECK: struct mutex definition without commen

mutex and hashtable are documented.
checkpatch returns there is no comment for struct mutex which not true.
It's a false positive.

Best Regards,
Thomas
