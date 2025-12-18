Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4593B338926;
	Thu, 18 Dec 2025 10:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053042; cv=none; b=WcxoWEyX2Q9d6uSZV8bPozgBxtjRQpZ1PX5m3qOr1+6QS78ugLqB/Tvowg0lvcS1YL6gyUnoddnelI3y4Ex9fvDCtBKuaBHEbjmirjQy1P5qLPIUUl6yVulazkSUtLH5cIJxWYNeHg9Hk417lH2suscEs+oYAuDJy97TAP9rgdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053042; c=relaxed/simple;
	bh=CScmJNU+JJxx2SMD+McaX1+tgSCTudmwD9adi9syoLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9UYyMFyu1NWPmVtqJABvTcxi+6Aor6kg7BcNXNjFrBMOEvZp97Yj4IBfXGYpmKYa0yW16AP1NJmoetnWuE+K/oFQ0aGzc1K9Z2T+7crdPgk9s/ngYGW3ygAKcQHWxJfmMULJFPyIXAc6p5EV+0auGdPzTB6VFh/piib/3Nw/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eqmsGEaR; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eqmsGEaR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9564B1A22B1;
	Thu, 18 Dec 2025 10:17:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B503606B6;
	Thu, 18 Dec 2025 10:17:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01C80102F0ADB;
	Thu, 18 Dec 2025 11:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766053030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=0UVj8eHSim3xc1VUi0DklfXad/yzwIRBiWDqW4iH6Hc=;
	b=eqmsGEaROLSAnt9YLAoLXgCmL518iL0y+8Qfqs0SH9DP2Js3Wk845lsz+lZML+V7ezTui7
	j6jqkOa/UY1a1t7FOC8PJUEXFZX0yIRbStXD1mhwgmh7QcTEYFoqgiPWdOAeaL9JswEUaa
	nO09hcdkqv+mLm53bc58ZRu6T6X//pDespnaykpJjDk+3zCAsqB+3xu9Civj9Nn7h+v19Z
	kDhGF3w8hzUbpYiu6W37nKUdCcZfDko2fhV5HmzONOCFW7hvQPk0NKSbmK8uo7Utq40v1E
	+Qn1NnSBpC1ifyNineMH0BmlO6R6TNsUA+Tp0bCPpe/92JpYTXGo8Slwi3hRxA==
Message-ID: <9ed481c4-0a47-4616-97f6-89f58e423eed@bootlin.com>
Date: Thu, 18 Dec 2025 11:17:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] firmware: ti_sci: handle IRQ restore in
 BOARDCFG_MANAGED mode during resume
To: Dhruva Gole <d-gole@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Prasanth Mantena <p-mantena@ti.com>,
 Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-2-d06963974ad4@bootlin.com>
 <bcc7a3da-3cb5-451b-98eb-4f7896c615a1@ti.com>
 <20251217052938.fpgclxhmyydvw7ce@lcpd911>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251217052938.fpgclxhmyydvw7ce@lcpd911>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/17/25 6:29 AM, Dhruva Gole wrote:
> On Dec 16, 2025 at 08:17:24 +0530, Kumar, Udit wrote:
>>
>> On 12/5/2025 7:58 PM, Thomas Richard (TI.com) wrote:
>>> In BOARDCFG_MANAGED mode, the firmware cannot restore IRQs during
>>> resume. This responsibility is delegated to the ti_sci driver,
>>> which maintains an internal list of all requested IRQs. This list
>>> is updated on each set/free operation, and all IRQs are restored
>>> during the resume_noirq() phase.
>>>
>>> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>

[...]

>>> +
>>> +	hash_for_each_possible_safe(info->irqs, this_irq, tmp_node, node,
>>> +				    ti_sci_irq_hash(&irq_desc)) {
>>> +		if (ti_sci_irq_equal(&irq_desc, &this_irq->desc)) {
>>> +			hlist_del(&this_irq->node);
>>> +			kfree(this_irq);
>>> +			return 0;
>>
>>
>> IMO,  you can restrict saving of irq and list management to fw having
>>
>> BOARDCFG_MANAGED capability.
>>
>> Dhurva ?
> 
> Yes I agree with Udit, we should gate hash operations by firmware capability.
> Everywhere else you'll need to make it conditional accordingly.

ack

> 
> Also, how much is the IRQ count usually? If IRQ count is typically small (< 50),
> then won't a simple linked list be more efficient than a hash table? The
> code becomes a bit more readable too that way IMO.
> Take a call based on if there's really that many IRQs that LL's become
> less practical.
> 

I tested a TI kernel on J721S2 and I got 60 entries. I guess we can
expect this number to grow with the next SOCs. But maybe the test does
not reflect the usual cases.

Best Regards,
Thomas


