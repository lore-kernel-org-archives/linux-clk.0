Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84820E030
	for <linux-clk@vger.kernel.org>; Fri,  1 May 2026 04:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777608278; cv=none; b=M47Kp3l4k88gr/cZXM31QpHv8n4jBZrgdr61hozxRV6fq7vHXPPFC9eWijsF/TtUmnWbB3VCxdqt0bFIUF5fxXjhkBip7X00AWk/GCh+wXGE6YgY5AN9vxC8ov6G5w3sNpFALHrAimWskZF2toMLEExxaqIlpJUunKjK1vaA36o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777608278; c=relaxed/simple;
	bh=tvtQgtkqnvLHx5y70LLW7z6TviXATrCYDjxplWp8COk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS+9LD4DElkuPn0jZKgPvjiEVd2weAgKcHbpcAADsp7Nf7yuEJ8raNoNiXq+icERYMhXRU7hNBRm7X6Ip4vDOiNYY7DAICyOnVLpRllDNuensLvW0WiThOTjpOYu4ejXxivYrKUK3x9++q9ULqewZ6SEbmc2EM8aPmku+AzHlMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=Dl3uUoMJ; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="Dl3uUoMJ"
Received: from localhost (84-231-218-136.elisa-mobile.fi [84.231.218.136])
	by mail5.25mail.st (Postfix) with ESMTPSA id A3BBC60AE3;
	Fri,  1 May 2026 04:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1777608268;
	bh=tvtQgtkqnvLHx5y70LLW7z6TviXATrCYDjxplWp8COk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dl3uUoMJfIixrMguPVQ4PHPaSHEcbkZt9ctzoohdUq0nMJCLWs7ZHJGpreeE2b5wF
	 FEAOnpmY5moSXJYBNocaiGAkxndZbt83WVNjcFKmhLIKcgk3tPO1PT07anBflifc45
	 cF2fdNWmIRHVnT4OHEinYRRyXEGeAUvCy3gPDY4BTsDOKiqNcHxk66UJE1UZNTdBn5
	 uljE1GPq0k2SId5gsORTIBRz5LahjD2Oo7vKsY6/FlrQMoHY9j/69GFj8u6T8WvL9v
	 +0ojzT1Z+0/Zz/eZKGc0gX51qzeHGmRaaM+cJAqiouTVEip5RVA3Z9CE9rlGIbZNrk
	 qsYpd/hKxkRuQ==
Date: Fri, 1 May 2026 07:04:15 +0300
From: Tony Lindgren <tony@atomide.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	=?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Tero Kristo <kristo@kernel.org>
Subject: Re: Issue with Clock Parent Assignment on AM335x SoC (Watchdog Timer)
Message-ID: <20260501040415.GX39595@atomide.com>
References: <DI4RUFQNSSNP.2QMSSQWJW9I2O@bootlin.com>
 <177742766345.5403.3603095308836655844@localhost.localdomain>
 <20260430034034.GW39595@atomide.com>
 <DI6HNGVRC3YT.OX7YC070Q14J@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI6HNGVRC3YT.OX7YC070Q14J@bootlin.com>

* Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> [260430 12:29]:
> On Thu Apr 30, 2026 at 5:40 AM CEST, Tony Lindgren wrote:
> > Just a quick guess.. You can use assigned-clocks in the dts file to
> > configure how your board is wired up.
> 
> Just to be clear: I believe this is entirely independent from how the
> board is wired up. On both my custom board and the Beagle Bone Black, I
> can successfully use any of the two muxing possibilities, if I manually
> write the correct data into the registers. My only issue is the kernel
> does not handle the clocks correctly when one these muxing possibilities
> is enabled.

OK

> Yet I tried to add an assigned-clocks property to the clock-wdt1-fck@538
> node. Is that what you had in mind? This had no visible effect.

Yes I was thinking adding assigned-clocks and assigned-clock-parents
similar to what the timers do.

There's also the am33xx_dt_clk_init() reparenting of wdt1_fck that's worth
checking for why the chosen parent is not getting set.

> > Please check the system timers configuration too, sounds like timers may
> > not be configured properly either. Some timer examples can be seen with:
> >
> > $ git grep -A10 "Preferred " arch/arm/boot/dts/
> 
> So I had a look at existing preferred timer configurations, but they are
> all applied to the "timer.*_target" [1][2] nodes, that do correspond to
> SoC timers (DMTIMER.*) and I fail to see how this is linked with the
> peripheral clocks involved here (in CM_PER module) and my current clock
> issues.
> 
> Nevertheless, I can see these being defined in
> arch/arm/boot/dts/ti/omap/am33xx.dtsi [3][4], so they are indeed applied
> in my situation.
> 
> So, I believe timers configuration are correct. Should I add something
> else?

OK no, so the issue is limited to wdt1 like you described earlier.

> [1]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi#L357
> [2]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi#L1280
> [3]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/omap/am33xx.dtsi#L702
> [4]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/omap/am33xx.dtsi#L715
