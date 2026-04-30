Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51912402B9B
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777552166; cv=none; b=daUsj30gXyU7a+G4cwdIGIrgpemZCRvgYWBzJw1lvVJVBYfEzZ5oHtOAhzHM1qE7+iW+BXOJWo2/lra/YEwitQneK5LZq0u/w2jpj7FjaHo8i2ht3l7jt5ureh4cdWrMyaj8s5gFxkQ9u+Kwsfo9zziBC9kQSrbKeA5Xrd4Y8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777552166; c=relaxed/simple;
	bh=hLqO+xOJ1W3T7VxCAgHBsnhk1OHUMBuxB086PNG/kU0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=uXXB+iW9XMryh422QGuAK7AsMqKHGkJ5TglwDky+ZEXBpGZjxK/LqOYctbCOxvV1moSirhopFozEchhPsJP6BGj4A1QGKEg1NOgD56oW2SuQ+aoY7ZNyUBuVrSn6ew06q3YVMF5TuJwkC+Qs8AXIadpoT6FA8jBfclFuKN+Iwfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UzFGzrhv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UzFGzrhv"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B43444E42B75
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 12:29:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8911F60495;
	Thu, 30 Apr 2026 12:29:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62753102F249C;
	Thu, 30 Apr 2026 14:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777552161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gzbS/Svy4jXR6YXddUHfI98wHCoQIVA1p9aVPKupdN0=;
	b=UzFGzrhvaEYAbHxCK+j2S3Wa9a09aoew2GeejVV5W+r8XrUH6uzPb1c2PWJs3SNQfCS3I5
	q4vcD48ti0hFNCZFnwR+nKGoysA941ZBqCXDR2MBoxu5yLfKIKOSA4u4V84Hy6AO/h82jK
	YPs1nrThNfJ5X3CVp03QABHHIRqQGdA5dzZe9v9UMYnK/L53TFmf5ba2e68RaBuPomMlEE
	PE4r58Ut6X8HevXesGIsA4KZ6el8SL+dxstugQyUILdndkAt1TqrAZUxDvy+7NyDSNs+j5
	JyTRI3Siu0XuNE4jiEf5EyJ+ttArXf/jOKiywWJy26WrLT6AYKSVhHOOuklNoQ==
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 14:29:19 +0200
Message-Id: <DI6HNGVRC3YT.OX7YC070Q14J@bootlin.com>
Subject: Re: Issue with Clock Parent Assignment on AM335x SoC (Watchdog
 Timer)
Cc: <linux-clk@vger.kernel.org>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Tero Kristo" <kristo@kernel.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Tony Lindgren" <tony@atomide.com>, "Stephen Boyd" <sboyd@kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <DI4RUFQNSSNP.2QMSSQWJW9I2O@bootlin.com>
 <177742766345.5403.3603095308836655844@localhost.localdomain>
 <20260430034034.GW39595@atomide.com>
In-Reply-To: <20260430034034.GW39595@atomide.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu Apr 30, 2026 at 5:40 AM CEST, Tony Lindgren wrote:
> * Stephen Boyd <sboyd@kernel.org> [260429 03:46]:
>> +Tony (author of commit)
>>=20
>> Quoting Mathieu Dubois-Briand (2026-04-28 05:03:16)
>> > Hi,
>> >=20
>> > I believe I=E2=80=99ve identified an issue with clock management on th=
e AM335x
>> > SoC and possibly other TI SoC. It can be seen while using the SoC
>> > watchdog timer, but I suspect other clocks or modules might be impacte=
d.
>> >=20
>> > While I partially understand the issue, I struggle to find a correct
>> > solution. I will describe my findings below.
>> >=20
>> > First, here is a quick way to reproduce it.
>> > - Hardware: Beagle Bone Black.
>> > - Linux kernel version: v7.1-rc1 (or anything after 5.19).
>> > - Configuration: omap2plus_defconfig + CONFIG_OMAP_WATCHDOG=3Dy
>> > - In the bootloader, I select the 32KHz clock derived from the 24MHz o=
ne
>> >   as the watchdog clock source. This is controlled by bit 1 of
>> >   CLKSEL_WDT1_CLK.
>> >   This is probably the point that differs from most use cases, and why
>> >   it hasn't been observed before. On my final setup, I do not control
>> >   the bootloader and so cannot change this value.
>> >   In u-boot, this is: mw.l 0x44e00538 1
>> > - Once the kernel is booted, I open the watchdog device node. I'm usin=
g
>> >   busybox "watchdog" command, but a simple "cat" will trigger the same
>> >   error.
>> >   watchdog /dev/watchdog0
>> > - This will result in the bus clock failing to be enabled and a failur=
e
>> >   to access the watchdog module:
>> >   [   11.677752] l4-wkup-clkctrl:00d4:0: failed to enable
>> >   [   11.686079] Unhandled fault: external abort on non-linefetch (0x1=
028) at 0xf9e35034
>> >   I'm attaching the full trace at the very end of my email.
>> >=20
>> > So, I tried to dig a bit into this issue and the reason why the
>> > l4-wkup-clkctrl:00d4:0 clock can't be enabled.

Hi Tony,

Thanks for your reply.

> Just a quick guess.. You can use assigned-clocks in the dts file to
> configure how your board is wired up.

Just to be clear: I believe this is entirely independent from how the
board is wired up. On both my custom board and the Beagle Bone Black, I
can successfully use any of the two muxing possibilities, if I manually
write the correct data into the registers. My only issue is the kernel
does not handle the clocks correctly when one these muxing possibilities
is enabled.

Yet I tried to add an assigned-clocks property to the clock-wdt1-fck@538
node. Is that what you had in mind? This had no visible effect.

> Please check the system timers configuration too, sounds like timers may
> not be configured properly either. Some timer examples can be seen with:
>
> $ git grep -A10 "Preferred " arch/arm/boot/dts/

So I had a look at existing preferred timer configurations, but they are
all applied to the "timer.*_target" [1][2] nodes, that do correspond to
SoC timers (DMTIMER.*) and I fail to see how this is linked with the
peripheral clocks involved here (in CM_PER module) and my current clock
issues.

Nevertheless, I can see these being defined in
arch/arm/boot/dts/ti/omap/am33xx.dtsi [3][4], so they are indeed applied
in my situation.

So, I believe timers configuration are correct. Should I add something
else?

Thanks again,
Mathieu

[1]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/om=
ap/am33xx-l4.dtsi#L357
[2]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/om=
ap/am33xx-l4.dtsi#L1280
[3]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/om=
ap/am33xx.dtsi#L702
[4]: https://elixir.bootlin.com/linux/v7.0.1/source/arch/arm/boot/dts/ti/om=
ap/am33xx.dtsi#L715

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

