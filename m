Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA24570F4;
	Tue, 18 Aug 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049907; cv=none; b=rLXWIk6e/XD1E7SYJNw72n2i1bwjOdCIRE+ttlSjRJlKHMq/ABVKjJiwF9EFdfyIhEUwZFuKuFaRTGMZhpq5LHu/JwPd5V9HLAyH5WPNMT9g8Uc4wAydiBhcmQdRKzF0EJqFJB1RpQxKKo63QiHdjelGLByPT8/Mm/YYRpqDtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049907; c=relaxed/simple;
	bh=0E2pJqsHjMejhpykpdh03QS2mjuGf09d052pmsWLEC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FHr37DUzv1sEFkXfvCV+Q6iqjqyHw5RtwkDZcCP/L6Xwmwop8hqnbkPtwf9TXqHrVrz0nW25jddwzx/r872G406HW622Lcr3sfasoWFEldExu4t+Tdj2jeZZypRwMqglr+r0ODMgj1F6j0Qas6nZXIHLg6/lz2pk4YwerfuLTtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcUYOlcx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcUYOlcx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F761F00A3A;
	Tue, 18 Aug 2026 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049904;
	bh=R7XopOM92Sm30wwgmYOVBeNFaaq0vzy7rYuxx2pzxgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bcUYOlcxNY2unaGsdpV/PNxN6CGNb+Fi4kkDuvjx/BmOz6nrwMgbZMe6bZedkM3lN
	 pZa3iziIzoyfIK8R4t5xZ21YktpzlM7lW3/uFMaCGHcpJAvYNw8Defp1XFnYNKJ74U
	 O9fHRsEjRiacyRFHeVFKUki5p6F9y5qlYA5ISnN/VmBityDfbymawIOnkxuFhOZyIN
	 qbMFbKI1nqlHCM/sMHQs23ihdQTXg6LXSP7NHI4v5+2PYnKCVnUytMYuABzFGPqOZs
	 XNXhYLFF4cDr3G0Vl99zEpo0RpA+owsKfimICBoA820+YxNyVDZd/InT6by42xOayx
	 ZYSEGnxtqkxqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/12] gpio: pl061: add Ambarella CV75 register
 layout variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260818-cv75-v5-v5-8-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-8-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:45:04 +0000
Message-Id: <20260818104504.82F761F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware state corruption: `pl061_resume` forcefully claims all pi=
ns as GPIOs, glitching active alternate functions.
- [High] Unlocked restoration of the `mask` register in `pl061_resume` race=
s with consumer IRQ handlers.
- [High] Silent removal of implicit memory barriers by substituting `_relax=
ed` I/O accessors.
--

--- Patch [8]: [PATCH v5 08/12] gpio: pl061: add Ambarella CV75 register la=
yout variant ---
commit 507564f23a0859a6fc4454b94d3ad422721665ac
Author: Long Zhao <longzhao@ambarella.com>

gpio: pl061: add Ambarella CV75 register layout variant

This commit extends gpio-pl061 with a per-variant register layout. This=20
allows the Ambarella CV75 GPIO banks to reuse the PL061 driver instead of=20
adding a duplicate driver.

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590f..7002ddbc97138 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -50,15 +50,17 @@
[ ... ]
> +static u32 pl061_read(struct pl061 *pl061, u32 offset)
> +{
> +	if (pl061->variant->access_32bit)
> +		return readl_relaxed(pl061->base + offset);
> +
> +	return readb_relaxed(pl061->base + offset);
> +}
> +
> +static void pl061_write(struct pl061 *pl061, u32 value, u32 offset)
> +{
> +	if (pl061->variant->access_32bit)
> +		writel_relaxed(value, pl061->base + offset);
> +	else
> +		writeb_relaxed(value, pl061->base + offset);
> +}

[Severity: High]
Does this substitution of standard I/O accessors with their relaxed variants
silently remove implicit memory barriers?

Previously, the driver used readb() and writeb(), which include memory
barriers. By switching to the relaxed accessors, if a driver updates a DMA
buffer and then calls gpiod_set_value() to trigger the hardware, the CPU
could reorder the GPIO write before the memory write.=20

Could this cause the device to observe the GPIO edge before the DMA data
actually reaches memory?

[ ... ]
> @@ -389,7 +512,7 @@ static int pl061_resume(struct device *dev)
>  	struct pl061 *pl061 =3D dev_get_drvdata(dev);
>  	int offset;
> =20
> -	for (offset =3D 0; offset < PL061_GPIO_NR; offset++) {
> +	for (offset =3D 0; offset < pl061->gc.ngpio; offset++) {
>  		if (pl061->csave_regs.gpio_dir & (BIT(offset)))
>  			pl061_direction_output(&pl061->gc, offset,
>  					pl061->csave_regs.gpio_data &
>  					(BIT(offset)));
>  		else
>  			pl061_direction_input(&pl061->gc, offset);
>  	}

[Severity: High]
Can this loop corrupt the hardware state of alternate function pins during
system resume?

This loop unconditionally calls pl061_direction_output() or
pl061_direction_input() on all pins. Since this patch now makes those
functions call pl061_claim_gpio(), which clears the alternate function sele=
ct
(afsel) bit:

pl061_direction_output() -> pl061_claim_gpio():
    afsel =3D pl061_read(pl061, pl061->variant->afsel);
    if (afsel & BIT(offset))
        pl061_write(pl061, afsel & ~BIT(offset),
                    pl061->variant->afsel);

Won't this forcefully claim active alternate function pins (like UART or SP=
I)
as GPIOs and momentarily glitch their interfaces until afsel is eventually
restored below?

[ ... ]
> -	writeb(pl061->csave_regs.gpio_is, pl061->base + GPIOIS);
> -	writeb(pl061->csave_regs.gpio_ibe, pl061->base + GPIOIBE);
> -	writeb(pl061->csave_regs.gpio_iev, pl061->base + GPIOIEV);
> -	writeb(pl061->csave_regs.gpio_ie, pl061->base + GPIOIE);
> +	pl061_write(pl061, pl061->csave_regs.gpio_is,
> +		    pl061->variant->is);
> +	pl061_write(pl061, pl061->csave_regs.gpio_ibe,
> +		    pl061->variant->ibe);
> +	pl061_write(pl061, pl061->csave_regs.gpio_iev,
> +		    pl061->variant->iev);
> +	pl061_write(pl061, pl061->csave_regs.gpio_ie,
> +		    pl061->variant->ie);
> +	if (pl061->variant->afsel !=3D PL061_REG_NONE)
> +		pl061_write(pl061, pl061->csave_regs.gpio_afsel,
> +			    pl061->variant->afsel);
> +	if (pl061->variant->mask !=3D PL061_REG_NONE)
> +		pl061_write(pl061, pl061->csave_regs.gpio_mask,
> +			    pl061->variant->mask);

[Severity: High]
Is there a race condition between restoring the interrupt enable register a=
nd
the mask register?

When pl061_resume() restores gpio_ie, it immediately enables device
interrupts. It then proceeds to restore the mask register without holding
pl061->lock.

If a consumer IRQ handler executes concurrently and accesses a GPIO, it will
acquire the lock and write its target bit to the mask register, which acts =
as
an address pointer in pl061_set_data(). The unlocked pl061_resume() could
then overwrite this mask register just before the IRQ handler accesses the
data register, potentially misdirecting the GPIO operation.

Should the mask be restored before gpio_ie, or should this section be
protected by the lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D8
