Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8B24502A
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 03:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777520760; cv=none; b=NZDZhvczcUry4TjAybX8g62QZd/aRHoaF8lEZG0wt4S/kJMY1+uASFTYotUjZxIAhpzVAUkLt+b2DSSQw+7MTdyxyT9dhXr/L/HYOR2ZrlGydez4yW8Q7ERKbbncibN/MxqBMhPMZ4vXFZQhcl/H+XTZULyxOR/F4fTbMzC8lNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777520760; c=relaxed/simple;
	bh=e+6PpKxirm4O6Y8/hjrI7pgfUd9Dmt1CJR2AWOU7Qh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaSG0R0SiPyIF66Yu4JSqS4oc9oSrTsb5JhGavbKOu42dWf8LMkVd8vfy/zHgWJc7rC/nDgyFrR0+n/QuQmfchB02V1v3u1Pu2SPUey1oegC3YgDVyiQ0Bo1CUQMbdkM7w9CmXdu7G9Y21o6Swwi6OJelAxv6HToBjB2OAUmDKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=BFve9QzL; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="BFve9QzL"
Received: from localhost (84-231-218-136.elisa-mobile.fi [84.231.218.136])
	by mail5.25mail.st (Postfix) with ESMTPSA id 3EA4F60859;
	Thu, 30 Apr 2026 03:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1777520448;
	bh=e+6PpKxirm4O6Y8/hjrI7pgfUd9Dmt1CJR2AWOU7Qh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BFve9QzLByzATWFaQXX5Sfq36XFxc1G+Wo0zbfh2qQc6JDpEON2cxSsl5VU9MD5a3
	 VeR/gxFv1LmzFXiVJy4nm2Tm6LhEDXUOMYgPyFKojejlU4L7KihZl6lHrPABXmOo0a
	 iOyA+zkOVFJTx9xoQLv9E9HhWuHvudfDaw/Tp/MGGfpoTsKt8S4QEWU7JrxIv3bNLc
	 DpS0I+uXH/3tWD2duQwUvYvWwMaSuHfE2y+2T6n7MOMPlcHlAJWiE8oXsb7tb5F8gw
	 C2ML1NbN2o333zMd8Pzfr4Deq1z2V/MxK5r0vivq9bpUFu33mmfgqri5dvGx0mkj8g
	 7KEwCEXx+YR4w==
Date: Thu, 30 Apr 2026 06:40:34 +0300
From: Tony Lindgren <tony@atomide.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-clk@vger.kernel.org,
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Tero Kristo <kristo@kernel.org>
Subject: Re: Issue with Clock Parent Assignment on AM335x SoC (Watchdog Timer)
Message-ID: <20260430034034.GW39595@atomide.com>
References: <DI4RUFQNSSNP.2QMSSQWJW9I2O@bootlin.com>
 <177742766345.5403.3603095308836655844@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177742766345.5403.3603095308836655844@localhost.localdomain>

* Stephen Boyd <sboyd@kernel.org> [260429 03:46]:
> +Tony (author of commit)
> 
> Quoting Mathieu Dubois-Briand (2026-04-28 05:03:16)
> > Hi,
> > 
> > I believe I’ve identified an issue with clock management on the AM335x
> > SoC and possibly other TI SoC. It can be seen while using the SoC
> > watchdog timer, but I suspect other clocks or modules might be impacted.
> > 
> > While I partially understand the issue, I struggle to find a correct
> > solution. I will describe my findings below.
> > 
> > First, here is a quick way to reproduce it.
> > - Hardware: Beagle Bone Black.
> > - Linux kernel version: v7.1-rc1 (or anything after 5.19).
> > - Configuration: omap2plus_defconfig + CONFIG_OMAP_WATCHDOG=y
> > - In the bootloader, I select the 32KHz clock derived from the 24MHz one
> >   as the watchdog clock source. This is controlled by bit 1 of
> >   CLKSEL_WDT1_CLK.
> >   This is probably the point that differs from most use cases, and why
> >   it hasn't been observed before. On my final setup, I do not control
> >   the bootloader and so cannot change this value.
> >   In u-boot, this is: mw.l 0x44e00538 1
> > - Once the kernel is booted, I open the watchdog device node. I'm using
> >   busybox "watchdog" command, but a simple "cat" will trigger the same
> >   error.
> >   watchdog /dev/watchdog0
> > - This will result in the bus clock failing to be enabled and a failure
> >   to access the watchdog module:
> >   [   11.677752] l4-wkup-clkctrl:00d4:0: failed to enable
> >   [   11.686079] Unhandled fault: external abort on non-linefetch (0x1028) at 0xf9e35034
> >   I'm attaching the full trace at the very end of my email.
> > 
> > So, I tried to dig a bit into this issue and the reason why the
> > l4-wkup-clkctrl:00d4:0 clock can't be enabled.

Just a quick guess.. You can use assigned-clocks in the dts file to
configure how your board is wired up.

Please check the system timers configuration too, sounds like timers may
not be configured properly either. Some timer examples can be seen with:

$ git grep -A10 "Preferred " arch/arm/boot/dts/

Regards,

Tony
