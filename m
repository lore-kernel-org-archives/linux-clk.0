Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4B038550E
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 14:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246933; cv=none; b=fR5vmeMcOZuAsZZ/Vd9m6EIhYIzjJjm8BFEeq6KYwp8/e6ZcrVWP6QrdFE9lPBUQhwBWqdKS34EJ+/9xsRdO/j/9yrUU5IFwgi9f9ioaXl9K7RuRJo+vXEPz3mZEi4RVZDyswj9uSluSds/1EkO8On7bMFRh3griaMIIAD3ksfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246933; c=relaxed/simple;
	bh=9VB+n9r8SAtE7pgAuVrM0JM4YuxP7Q20SYsFzX4ewR8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=kV5e63R9yZM84sOfUmSzp2qr2IjeqGV3ln+igDFLqUaZHXTyuspmld1bwo0sr/kLTjaNjclRXgSGC9ZhLHhU02DMSa/Bdrdfu/DdAsOD5DtXl2t5Fb/4uYQ1IkMIO58g60UsOffi5uaSr551R//MNfTTk02Y5lUCzLDpwPwvcSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LSQsroSL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LSQsroSL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso8909235e9.2
        for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792246930; x=1792851730; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ANOLOg5W5PGeejHJ7V1Gxk93nPDi6EIUyW6A+VPSJto=;
        b=LSQsroSLbiOxsN5Ba0/zHf3o4IhtrzVqlfSldw7Klh+o4XnSxhMmfqMOS4RwUxT+VC
         CJS1ttsgbcwrVIfzJK1z5Dx3b6OIu1HwCHEtYlA7/VJQ06LKWlrVBX+v5A1SR30qTAOo
         3kNweOsHY6QEhT3pFW5HjvuW2c/pmLMrruD9CkcD16A8zIhxgSa8ii2cPqMRn9eodhom
         ubSvs/blPYdB7QDdXBKmFWaPwgYVtk9q0+l5N2E+tEzM+OJ/PrgQGpQBVGnwjgKLQ+t4
         DLFEHkJmxomIhbR7jMUrCINrCwWnPWfb0TjGm+GLvz2YHd92QLCYeek1OYMZDrJFRB9m
         QKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246930; x=1792851730;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANOLOg5W5PGeejHJ7V1Gxk93nPDi6EIUyW6A+VPSJto=;
        b=iWM09C6sgXuWp7elhZ6B/5RehHjeXiMVDWQqY1CMpT9FMI4eAgB9jF9zJYg1n8X8iX
         wI5EByY9B6J3mYjGKI1xjA6I9ghWMzMr9d6ZoH+E9XkMXlBi7kzf12pbjo4ceoAif48j
         FKIZtti1sfXsNkj5i4pq1CFrR/6rydhdCaa/udUFd8A359EGifxx8QOTUGuRivHhrGvS
         1eB6AaQcKxQvZzhfq/cnhMceV0ddOlLlnbN6jl2GrqZmN9Q2GJFZzupR8dEDCMsEvpft
         YgrwXvVyEcWuGL+lVDmAlzTkO4rYyqzbGSDPdXUBUAHmWYFfzBrgA2UiH21YnYVgyjQu
         uxhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQGpGzoHh//boekv3olu+5QCFuxNcvVc1Cr/22TvuyNR8KSojGhfhrp3RfsDPlkSaUZs3NYr7THkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeGD+QkBddQ8qtF1ondxXGrqtuBKXx0kMaHv0jN4r4nBMAEyGw
	qmE9XRcDpXv+ST4rKHRg+XN80pnazToW2vorJO3ViUUVxCwRk+aNSyIcEwL7S58V+Tw=
X-Gm-Gg: AYBFou1Y0jiZTlPk1B1/I+b2h28vsYriUfifZ11EYSBrNmXjeXe2ZMSdkCBl4AWZ47i
	AHr3LN9eZp8thD9U+4A34Rnc+jbcCzYDxWGFegNNVYQ/hN7EUW8Th7bfQ+0P8FEhrO+4W3800dA
	zfbQTRVkWhQIpfz+dzfzShZzcxKWwfIMmhsn0Tjx6wh8Zpa5YQ5wHNvNHqujn8v6RHtpQQI2gT3
	5RfXfnqStzZUMEl71wV3eg9pLJaCjyWvSSDQB4ItP3Fya/QgnuS896IC1UY6Z49I3Wv4yeyHWL2
	o0nIpFH7dE6UIL9S/1f9516ajOM03Y3Ae/4cGJTexTIBgUPgY7+3+rG4EvUaWuwscwoZs5dVPGg
	+D1M+7iF0LxzF0usR8FWQEz3GF0ZuhtexQk0aUZIons1cSwpAah8twaZ3sa2tiPP+XjCj422v0a
	oYkVGLs6GD152Hd9gs0hQ8clMaPsDzhmoKbrQSt1OAQHd1JF22Ykss+DXcEprFlIdlv9gwh0Mxx
	Rtj0N4PksZ0OzaX6w==
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a1d76224f0mr59164765e9.31.1792246928866;
        Sat, 17 Oct 2026 07:22:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm74285205e9.2.2026.10.17.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for
 inverted divider clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
 <179180050742.66744.154947682767663962.b4-review@b4>
 <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Sat, 17 Oct 2026 16:22:06 +0200
Message-Id: <179224692686.859276.1840996329833650526.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9VB+n9r8SAtE7pgAuVrM0JM4YuxP7Q20SYsFzX4ewR8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXW/oNnjycuHTRz/v1c2U2/gvJidgvcJGDpzn+6vMVi
 Yu3nfG931HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJfBBkZFiYnqcvt4u5xWle
 87Sy9Vx/fue/UZFpWx/sIWTUVtNQu5qRoX3yom1vHzbEr0ya/SfXNfJScmZv15uZvXxlWbXSNta
 B7AA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-14 03:16 +0000, Changhuang Liang wrote:
> Hi, Jerome
> 
> > > Some StarFive clocks only advertise the divider and invert
> > > capabilities (via JH71X0_CLK_INVERT, without ENABLE). Add the
> > > JH71X0_IDIV() macro to declare such clocks, and jh71x0_clk_idiv_ops,
> > > which combines the divider rate operations with get_phase/set_phase.
> > >
> > 
> > Please rephrase, I don't understand what you mean
> > 
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
> > > drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
> > >  2 files changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > index c5ee82db3c92..224fcc3d08db 100644
> > > --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > @@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
> > >  	.debug_init = jh71x0_clk_debug_init,  };
> > >
> > > +static const struct clk_ops jh71x0_clk_idiv_ops = {
> > > +	.get_phase = jh71x0_clk_get_phase,
> > > +	.set_phase = jh71x0_clk_set_phase,
> > > +	.recalc_rate = jh71x0_clk_recalc_rate,
> > > +	.determine_rate = jh71x0_clk_determine_rate,
> > > +	.set_rate = jh71x0_clk_set_rate,
> > > +	.debug_init = jh71x0_clk_debug_init,
> > 
> > Instead of trying to cover all the combination that could exist, can you just
> > chain 2 elements ?
> > a div then an inv ?
> 
> This may require introducing quite a few new changes.
> 
> In the current code, struct clk_hw *hw is used to obtain struct jh71x0_clk *clk through hw, and then the register offset is obtained through clk->idx.
> 
> static void jh71x0_clk_reg_rmw(struct jh71x0_clk *clk, u32 mask, u32 value)
> {
> 	struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
> 	void __iomem *reg = priv->base + 4 * clk->idx;
> 	unsigned long flags;
> 
> 	spin_lock_irqsave(&priv->rmw_lock, flags);
> 	value |= readl_relaxed(reg) & ~mask;
> 	writel_relaxed(value, reg);
> 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
> }
> 
> static int jh71x0_clk_enable(struct clk_hw *hw)
> {
> 	struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> 
> 	jh71x0_clk_reg_rmw(clk, JH71X0_CLK_ENABLE, JH71X0_CLK_ENABLE);
> 	return 0;
> }
> 
> Therefore, the existing code has one struct clk_hw corresponding to one register offset.
> 
> If it is split into a div and an inv, two struct clk_hw descriptions will be needed.
> The jh71x0_crg_probe() will need to implement different branches for different clocks:
> 
> if (a div and an inv) {
>     devm_clk_hw_register (div)
>     devm_clk_hw_register (inv)
> } else {
>     devm_clk_hw_register (other)
> }
> 
> Do you need me to make this part of the adjustment?

No, it is ok this time around but understand that if this patterns repeats, you will have to
fix this. Best would be to start thinking about it at least.

-- 
Jerome

