Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C9E3DFC7A;
	Tue, 31 Mar 2026 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774967305; cv=none; b=R77Kg0xajznb6aYs1myt8SqlpihTPNDekG1z+yQdXMUAQguYB/2iDbSIS/IvptAAs/0RU6UEpWqgQhxMnepkWxXebEAhBEisW492EtQOvXhuyYGRDWKTPh8GLTt9SfjWtXyW/Y/UJt1bx6A6bmYzMSFwkIpM2Ud8VfT3DO2UmMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774967305; c=relaxed/simple;
	bh=pi9+jTTjBEggYl4mVGdAIHgEUjoB84G3TUthvHDcKv4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmXPQsHs7XPYRm8SWFycSZyQcNWmd1TVdzFVqos98QRdWO54xMroCJgt/6MaU2HLFCOV19wzmmXgOfhNb1acrgIx+9r3z8t9tQAgiHQ0+8TwH3j0gs10IAWo4qK8L+piwridZn0AqTF9JJ5uL2I8dqH0NAK8poytEiDBeeRJ5xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J9Biep0L; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J9Biep0L"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A9090C59943;
	Tue, 31 Mar 2026 14:28:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17ACB6029D;
	Tue, 31 Mar 2026 14:28:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10DD9104502A1;
	Tue, 31 Mar 2026 16:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774967298; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fPi+rGF0rYzZ+nDZLHKJl/1MAN3JGEnQt9nVv1QbgBY=;
	b=J9Biep0L71BjUoQeNlZpBX2t+clXYySmubp3Nka6bQIUW10LmpA05/t8nj4EdA4PQHqwyB
	A/XiVWukH9O9//OPioTUSDrYHcj0AKzVfnBKnySZY5u5JhaomYVkFbXk3e1Uc14tZX9hwL
	lzUcKg8PZECK5r25ejhn7X1YhanhSHsW5pv6gTOF0Sn9zWBX2hOmqD228ykuUzwK5h+moE
	kWiug8Y8OEmQ/212K/a4yABEBo1NoVtL5kbfVHDmmMUlGxHUiyIBqORzvg1bgMlgbalh9v
	QXWjwlyBrA8LwF3qKzkD2quOV7q3rShCQqIQ+uqlIqQzMaUTWdrTZrKoxdbkNw==
Message-ID: <91077ff2-8ae5-45b3-b799-f84db16bc964@bootlin.com>
Date: Tue, 31 Mar 2026 16:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
To: Dhruva Gole <d-gole@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>,
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com>
 <20260209095159.pfcthh5a4yo4q2em@lcpd911>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20260209095159.pfcthh5a4yo4q2em@lcpd911>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Dhruva,

Thanks for the review.

On 2/9/26 10:51 AM, Dhruva Gole wrote:
> On Feb 04, 2026 at 16:03:37 +0100, Thomas Richard (TI) wrote:
>> The fourth iteration of this series adds support for two new firmware
>> capabilities:
>> - MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: Indicates that DM-Firmware is not
>>   able to restore IRQ context during resume after suspend-to-ram.
>> - MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST: Indicates that DM-Firmware is not
>>   able to restore clock context (rate and parent configuration) during
>>   resume after suspend-to-ram.
>>
>> Now, ti_sci driver determines whether to restore IRQs based on the
>> MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST capability rather than the
>> BOARDCFG_MANAGED mode. The same logic applies to the clock context.
>>
>> Both J784s4 and J7200 platforms support these new capabilities. A
>> corresponding pull request has been submitted on DM-Firmware side to
>> define and enable these capabilities.
>>
>> The value for the BOARDCFG_MANAGED mode has also been fixed.
>>
>> Public documentation for BOARDCFG_MANAGED mode and these new capabilities
>> is currently unavailable. I will update the series with relevant
>> documentation references as soon as they become available.
>>
>> I rebased the series on linux-next next-20260202.
>>
>> Best Regards,
>> Thomas
>>
>> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
>> ---
>> Changes in v4:
>> - rebase on linux-next next-20260202.
>> - fix BOARDCFG_MANAGED value.
>> - add MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST firmware capability.
>> - add MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST firmware capability.
>> - Link to v3: https://lore.kernel.org/r/20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com
>>
>> Changes in v3:
>> - rebased on linux-next
>> - sci-clk: context_restore() operation restores also rate.
>> - Link to v2: https://lore.kernel.org/r/20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com
>>
>> Changes in v2:
>> - ti_sci: use hlist to store IRQs.
>> - sci-clk: add context_restore operation
>> - ti_sci: restore clock parents during resume
>> - Link to v1: https://lore.kernel.org/r/20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com
>>
>> ---
>> Thomas Richard (TI) (4):
>>       firmware: ti_sci: add BOARDCFG_MANAGED mode support
>>       firmware: ti_sci: add support for restoring IRQs during resume
>>       clk: keystone: sci-clk: add restore_context() operation
>>       firmware: ti_sci: add support for restoring clock context during resume
> 
> The series looks good to me, just checking if maintainer prefers the 2/4
> PATCH on IRQ restore to be split up. IMO similar to how you've split up
> the clk restore support and then actually restored clk context in
> another patch, you can do similar split up for IRQ.
> No strong opinions from my side though.

Splitting clock part in 2 commits makes sense because two drivers are
involved. For IRQ part you would have a first patch adding all the hlist
logic only if MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST, and you just fill the
hlist. Then a second path adds the missing part in resume() path. I
think it is a bit odd, but no strong opinions.

If someone really wants this split up please let me know.

Best Regards,
Thomas
