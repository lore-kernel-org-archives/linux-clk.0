Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7C1345CC4
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053189; cv=none; b=OL25VCzzLwmG641kDwv2MfLo45tI1NoVCa+OrwjQwTp7+17BKEYEPWkPpCZEi18mhdJ/iSjoPZvaIAzBPSXdiJOARP3zDC+QZlA8gdo3Nn2+VCReWMoDkbUrTz1oQy0IiI1S9U3t5xZn7goL43boL214mxTWAodZsA1BVBI1Nqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053189; c=relaxed/simple;
	bh=ozVGGm2xyBhXlggrMLQXK1LZb6xoIlU1yLKbosf12Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8TYvuXQgjp8vWv7tnbjwekbvfGztMhgCFiHn/8frGE3ctuSKlFKa7ZUqhU5CqmvILCJu4/RtYw3tjKRxfizzybKeymDbWSjDYgG4oLl1Qtmt8xlmSnmJaoWa3z9ljInaAXOtyPWwsUhn+UYE3rDqKV4Lu42lg+cjKGtM2yT3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dzXSoQqt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dzXSoQqt"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A00BC1A22C0;
	Thu, 18 Dec 2025 10:19:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76546606B6;
	Thu, 18 Dec 2025 10:19:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BBCC102F0AE2;
	Thu, 18 Dec 2025 11:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766053181; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aWdMku9LK5PFx1F1L2Z19osi5GnZTsR0+SmWdNSoHeY=;
	b=dzXSoQqtVgMzu4RQ1UInBdB6ThGYAAG8CPz6Ms4jJHpK3wUVoG4UUr96ZEeGLEtMqB/6ME
	7ccMp4X7w66U8kgoFUnwjK948/P+GhwE43xPtPzCEm5j2SiDSJlKrg+e5L+KXn7g+dzVXu
	h23A9OjSGfRHl743SLDMt2qZIxSz7CmbzLc1ta4l5T6KYC5FNmvHCSjDeiDlmaZZSMgFlR
	IpK/htyklTg0mYnPD6b8GZI+tb++AMlfgG2nlBK8hGspvMQOMS02Af2cIIwxG2KHR3fU8F
	zBgSa4yrQhN4+zlpILc++fxww/xj/+5wf3rwXEYtPc7EKwa+uJA5+y+yltombg==
Message-ID: <e8c4d832-3146-4fad-a0f6-0e2df77e83c0@bootlin.com>
Date: Thu, 18 Dec 2025 11:19:39 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] firmware: ti_sci: restore clock context during
 resume in BOARDCFG_MANAGED mode
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
References: <20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com>
 <20251205-ti-sci-jacinto-s2r-restore-irq-v3-4-d06963974ad4@bootlin.com>
 <20251217060727.idneboxj7kwslie2@lcpd911>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20251217060727.idneboxj7kwslie2@lcpd911>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/17/25 7:07 AM, Dhruva Gole wrote:
> On Dec 05, 2025 at 15:28:26 +0100, Thomas Richard (TI.com) wrote:
>> In BOARDCFG_MANAGED mode, the firmware cannot restore the clock rates and
>> the clock parents. This responsibility is therefore delegated to the ti_sci
>> driver, which uses clk_restore_context() to trigger the context_restore()
>> operation for all registered clocks, including those managed by the sci-clk
>> driver. The sci-clk driver implements the context_restore() operation to
>> ensure rates and clock parents are correctly restored.
>>
>> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
>> ---
>>  drivers/firmware/ti_sci.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
>> index 8d94745376e2a..6ef687e481c49 100644
>> --- a/drivers/firmware/ti_sci.c
>> +++ b/drivers/firmware/ti_sci.c
>> @@ -9,6 +9,7 @@
>>  #define pr_fmt(fmt) "%s: " fmt, __func__
>>  
>>  #include <linux/bitmap.h>
>> +#include <linux/clk.h>
>>  #include <linux/cpu.h>
>>  #include <linux/debugfs.h>
>>  #include <linux/export.h>
>> @@ -3980,6 +3981,8 @@ static int ti_sci_resume_noirq(struct device *dev)
>>  				if (ret)
>>  					return ret;
>>  			}
>> +
>> +			clk_restore_context();
> 
> Here as well, make it conditional to only BOARDCFG_MANAGED. Other
> platforms/ firmwares have lived without this for a while now, and it's
> evident that we don't always need this.

It is already conditionally done to only BOARDCFG_MANAGED.

> 
> Thinking more about this, I think we're over using this BOARDCFG_MANAGED
> mode a bit much. We should really just come up with new FW caps for
> this, one for clk_restore , other for the previous IRQ restore patch.
> 
> That's the only way I can see this scaling. In future if we ever need
> more devices that may actually be BOARDCFG_MANAGED, but don't need the
> IRQ or clock restoration then the current approach won't work.
> 
> MODE should only be passed in the prepare_sleep, where it makes sense.
> Using it for anything else just does not feel clean to me.

Fair point. Restoring clocks and IRQs is more related to the fact that
DM-Firmware on Jacinto platforms does not have suspend-resume support
than the BOARDCFG_MANAGED mode. I guess we could imagine in the future
having suspend-resume support in Jacinto DM-Firmware, so no need to
restore clocks and IRQs anymore, but the mode remains BOARDCFG_MANAGED.

Best Regards,
Thomas

