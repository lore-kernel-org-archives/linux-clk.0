Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E6425B2FA
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775734492; cv=none; b=VpBrmZ0mhj9zjff8VpZlgK2/vprtE63ufRf6/O96J90IW6+R+LUZcRYvemZgOEVToBdj9QIMOuSxwa+eFnEzETERcMDzwXKSwP20iZfE6PBYwl3o6AaYz3owa7joWP0J+U26kSs1mWb5DjlYiKDYHINM773ZJybknmLoo0zThzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775734492; c=relaxed/simple;
	bh=UmH4nWMTQpcn1a0CoOTUtTCqXuKacJpJt4DtwsZ3vOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mj/UDeGlyp7PtR4Tf5oHEtJ+p71G+ainKpn3y+3DfNQnkakhNcwpellRdK/wtnBcxc+8LtyaM+Y/4p/bid3XHkL0wOHN4eNnpGCLogakWSH4JjXucJ8A15oAFhAP1E+YYMiEeEu54usOE6Rywdbo/SZPdWd9O3VlndP9LQf4wzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wAneU-0000FE-P7; Thu, 09 Apr 2026 13:34:26 +0200
Message-ID: <95e718b9-c281-4336-9c1e-3bf8aff68457@pengutronix.de>
Date: Thu, 9 Apr 2026 13:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: martijn.de.gouw@prodrive-technologies.com,
 Saravana Kannan <saravanak@google.com>, abelvesa@kernel.org,
 peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org, linux-clk@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
 <20260409091643.3787112-1-paul.geurts@prodrive-technologies.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260409091643.3787112-1-paul.geurts@prodrive-technologies.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hello Paul,

Cc += Saravana

On 4/9/26 11:16 AM, Paul Geurts wrote:
>> Hello Paul,
>>
>> On 4/8/26 12:13 PM, Paul Geurts wrote:
>>> The i.MX8MM clock driver is implemented as module_platform_driver();,
>>> which makes it initialize in device_initcall(). This means that all
>>> drivers referencing the clock driver nodes in the device tree are
>>> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
>>>
>>> Explicitly initialize the clock driver in arch_initcall(), to make sure
>>> the clock driver is ready when the rest of the drivers are probed.
>>>
>>> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
>>
>> Your commit message doesn't explain why this was a problem for you.
>> Does it delay your boot? What makes this patch a fix?
> 
> Yes I could update that in the commit description. The problem is that because
> of this, _all_ hardware is initialized in late_initcall, as that is where
> deferred probes are handled.

There's no one initcall order that will make drivers across all systems
equally happy. That's why there are probe deferrals in the first place.

> For embedded devices, some sign of life is
> expected by most people during boot. Especially when an initrd needs to be
> unpacked, this sign of life is going to take a very long time.

Ok, so the problem is that the probes happen too late. Does the total
boot time take considerably longer or are you just unhappy with the
ordering?

> Some display
> controllers don't even get enough time to show the boot logo because of this.
> I don't think the idea behind the initcall levels is that _everything_ is
> initialized in late.

I suspect we could improve the situation with "post-init-providers"
hints, but I haven't used it myself so far.
Maybe Saravana could give some advice once the problem is better understood?

>> What happens if you build the driver as module with your changes applied?
> 
> On module insertion, there is no initcall level, and initialization is
> performed on insertion (AFAIK). Fact is that the system would probably
> not boot when this is built as a module, as there are no peripheral clocks
> without it.

Ok, then this is patch is not acceptable. What's buildable as module
should work as module. I don't personally build it as module either, but
removing the possibility will break users relying on it for Android GKI,
I presume.

We thus need to find a different, better, way.

Cheers,
Ahmad

> 
>>
>> Cheers,
>> Ahmad
>>
>>> +
>>> +static void __exit imx8mm_clk_exit(void)
>>> +{
>>> +     platform_driver_unregister(&imx8mm_clk_driver);
>>> +}
>>> +module_exit(imx8mm_clk_exit);
>>> +
>>>  module_param(mcore_booted, bool, S_IRUGO);
>>>  MODULE_PARM_DESC(mcore_booted, "See Cortex-M core is booted or not");
>>>
> 
> Thanks!
> Paul
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

