Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744562BEC34
	for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783870951; cv=pass; b=DmjguArKba8maCixBDK+sJapS542sxDdYvXknipr6RhYrrxtrN4sH+WwieVsjsTO7u28Z6FgcjNKEPOMDFipEz8MoVo9/YMxqyR7xWvBt8fPg2FBFZJeLzo9uRdTMw7fhW5WNiEPKp7Gg3p3ebYLlji/KDk11T2enhycg1+yWic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783870951; c=relaxed/simple;
	bh=gSc879GHO7OM65polMl8z6uADAnwPXUOGNB/VtrXRjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm7adUeVqGViDectsb38CImnTWOjIYOVFEVudogqOadFRfyvlgtUjGF5XXyBDDcriQZ38r/zCYCSYvImXnaPzPPssI8Uhro5M4xRALB9cC4Peyq1/uNQNMgqOgL72BDexHDUsFPmTf2+PHbGzw0IXUtxyVz1+/Nu6yBjmqQdKUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUr+5aKt; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUr+5aKt"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad8076b01so28259615ad.2
        for <linux-clk@vger.kernel.org>; Sun, 12 Jul 2026 08:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783870950; cv=none;
        d=google.com; s=arc-20260327;
        b=WMaPVUraeHeM9xFEqAmNgv4NeO3p5U/UHCATMyIQfRVRkXIESFSeviOMwqxt1nrQdN
         VR4il8Q+Mxwsv1wv6KooHYZmoUgDd+Pu5WiigBGgeEtQ+H2c+utuozCkO71QqSUnrMtm
         KXF8OUOzEF5znZuAETGRj3KRhsOZkE5IY/j2w+cnp5PMXHTA+US0M09qSCgsSr9WrLCE
         ldlZkDlTWbx1SWN6d5Xfyd/OLmfLM0ayihxdW+YwUl2nTNMVca569Dimu3XBDElTyjST
         VDBkIG2NV2yeRp7EGvqhUZXowXVoI61jcxhKqdwcRMGspImEuMTAevRr7jEBKGK/PcJc
         Xdgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        fh=2kO4TbkPALu89EvcUyQqWnzYeVrDwHaL84fIALDrLEI=;
        b=Z1ELU6WzAisqBmBonmMC+zfDo0iWEP3NAHt0XiK36zVNDSRzruBf4rgWxRG9xB2OPm
         v6Ea6ttjWB8Ap29BgI7r6Cm0hqX7f0ve/n/LQe6eqObPV1M/siugx6SXjhR8wdotIC54
         IRN5r4kz5qbfw4KO0CJ6PleJZBCGKMeCUAyOg8WRhydUtaLbFQaNQLrixntOQyp2m7J+
         bD9JIsK1boYJ4jbV1gWE6I1xFPaZb0v6pB0abHpWSuHqWFq2+qCJzakJ6dWlz33A9N1K
         +1kQ7F1d4487+QpnRJ0d5J/ai9KRL8wKeaWh+YwXjoGqnc/qh9TT44637HDNmFS8LiOj
         65yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783870950; x=1784475750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        b=cUr+5aKtwfW8UxLR3Nl4MNT7sLEw/E6Gw9OYI9Ph6lGw+MJbO8ghWMKEnPUiDwplca
         R9U986zCWFpNCmbAOmZPifBV0PdZATCI5ZEUpraoLmBjOEv8yCQTRj5BbnRJdrICMdRd
         rbJMt5OhZCcyda4jv48CIsYjN7eCk2yl+t+i8cgw5ckkk9wxbY9z376spcqRkgHlC9vN
         4/fWDdYhkTogYZbAjwfJV8eSxsqMavmKTn3uaPtwsV+hOUr3mD7Q2tpn97U4c2DeTtgi
         Tevkxeag8lmBJVm60jpjzpDZogB2wvRxM5uzdh5IlKpIeg4MPHutLmrcx5JMJ0vMFX0H
         ssHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783870950; x=1784475750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wbo1q8mEUKrWsXK/f5GIgIPFSibN2PA5ipDDYRbQQeY=;
        b=V3fg7ejtJCttOoPlXHp2uEF1rxEo3B0Md3W+JAgeudoAOByc0OXI+DZge7w98L9E29
         AyQNXOFPz8bSAA98Lrf+gwSUl3W3EP23uIGv9KoZJwO1xbl5lJC8Vpggl2u4PBn9WzHz
         HU02YOXSw3+eLebkGUD1fPe0RrUZHHTo9lLQW9MkNFYYGTNYV+IpVoifcZXkkDoltqH+
         Tk/x+JTxjNqD+8jOL1HmTJqzfRQUKJVqRlWhCuH5dj5jW9lhdEXqyOaWWGkZesWGkI72
         w4javTMcqkpWbXXf1T1H44m5iImHO8DLbR3miEN13OTJ2J6m7yG8BTibpjbjYbAGfanc
         +CdA==
X-Forwarded-Encrypted: i=1; AHgh+RqHKTZLPeG/g0POdOOF10KT1qrBcPeA5ovDiogYTGaz8KrtoYwyKbqdP5x0lr/M3KfTeXm7Y47EwBk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNzOtnhkQ/SqfRb+HrHq6lmGZ8570q6xQvB3X6CAKrnJBU05h4
	l8jMno8P3W5/Z9PWrEzE/iQ6it3xcefyc7M3+1BL8/dERYEKLJEBWF4iAVJhkKnZhCH8+1/nqJL
	13RNOyh5Fiqa7GB3zvd1H4EYOTZpVano=
X-Gm-Gg: AfdE7cloS/guKHNVyf2SRgbhlzIES5VlbLHrSwuMQ2kfGG2QThCp3HrfSHwcjUKDAjP
	HAO9oj5yNODT7tb4ZG2reb27JiYxpke6Djq9b3WJlUwHl/Z+0wewF+fm2Z/8Pgi+siHAhUar5Wy
	/hdANUGJmJgXXo8LRUtVZpXmc7Um7imOXTGObKzv1ZYCc8VeFe4lI58c62QuMlKeFzeYLF77pyT
	gIFDx6WC7Jg/SxIyDevCOBBoz2nl8rbRvCCj+LffgYYNikpBW3bRMx101Fr3nS+DFUc1F6mmnQX
	cQOS3RRSdSvg15ZYRqwH/rTiKsX6OXY=
X-Received: by 2002:a17:903:28c:b0:2ca:6eca:492f with SMTP id
 d9443c01a7336-2ce9e9b9e78mr56293415ad.14.1783870949569; Sun, 12 Jul 2026
 08:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <27fb93d0e61704d495e3adf4ed614edac1642267.1782909323.git.mazziesaccount@gmail.com>
 <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
In-Reply-To: <CAMRc=MccLRKb8ZjChcR7WK3TqV3=waSnKX=UX9LR=5hOT=_tsg@mail.gmail.com>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Date: Sun, 12 Jul 2026 18:42:17 +0300
X-Gm-Features: AVVi8Cc6tt66W5dgLObqCo-hlb2IRsmOzx4mUkw5K5KParLVQP-uA6p1X9UaJlM
Message-ID: <CANhJrGM9ciyBfgGWBwOM3kNmcXGSq4QVM6a6Js+wtbr9ANtSJA@mail.gmail.com>
Subject: Re: [PATCH 7/8] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="UTF-8"

pe 3.7.2026 klo 16.11 Bartosz Golaszewski (brgl@kernel.org) kirjoitti:
>
> On Wed, 1 Jul 2026 14:43:25 +0200, Matti Vaittinen
> <matti.vaittinen@linux.dev> said:
> > From: Matti Vaittinen <mazziesaccount@gmail.com>
> >
> > The ROHM BD73800 PMIC has 4 pins (named GPIO1, CLKOUT, FAULT_B and
> > EXTEN_OUT) which might have been set to operate as a GPI or GPO when OTP
> > (One Time Programmable memory) is written at device manufacturing.
> > Support the GPI/GPO use-case via GPIO framework.
> >
> > The default OTP for these pins is to not use any of them as GPI or GPO.
> > (The GPIO1 defaults as an ADC input regardless the naming). Hence the
> > driver assumes none of these pins is a GPI/GPO unless explicitly pointed
> > as GPI or GPO via device tree.
> >
> > Furthermore, pin's direction can't be changed after OTP configuration is
> > done. Also the default drive type for a GPO (CMOS / Open Drain) is set
> > by the OTP configuration. The BD73800 has a set of undocumented test
> > registers which should allow changing the drive type. Access to the test
> > register area or the test registers aren't documented and so this driver
> > does not support configuring the drive type even though it might be
> > doable.
> >
> > Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> > ---

Thanks for the review! I appreciate it!

> > +static int bd73800_gpio_get_pins(struct bd73800_gpio *g)
> > +{
> > +     static const char * const properties[] = {"rohm,pin-gpio1",
> > +             "rohm,pin-clkout", "rohm,pin-fault-b", "rohm,pin-exten"};
> > +     const char *val;
> > +     int i, ret;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(properties); i++) {
> > +             ret = fwnode_property_read_string(dev_fwnode(g->dev->parent),
>
> It would be cleaner with device_property_read_string(g->dev->parent, ...)

True.


> > +
> > +static int gpo_bd73800_probe(struct platform_device *pdev)
> > +{
> > +     struct bd73800_gpio *g;
>
> May I suggest a slightly more descriptive name for driver data? Maybe at the
> very least... "data"? :)

Ok.

> > +     struct device *parent, *dev;
> > +     int ret;
> > +
> > +     /*
> > +      * Bind devm lifetime to this platform device => use dev for devm.
> > +      * also the prints should originate from this device.
> > +      */
>
> Why would you need to comment on it though? It's very much the standard
> approach, isn't it?

Sure. I might have had this comment combined with the one below. Idea
has probably been to explain why we use both this device and the
parent. Can't bind lifetime to parent while needing it for regmap and
dt. Well, I agree that this device's comment is really not required.
I'll keep the comment about parent while removing this. Thanks.

> > +     dev = &pdev->dev;
> > +     /* The device-tree and regmap come from MFD => use parent for that */
> > +     parent = dev->parent;
> > +
> > +     g = devm_kzalloc(dev, sizeof(*g), GFP_KERNEL);
> > +     if (!g)
> > +             return -ENOMEM;
> > +
> > +     g->chip = bd73800gpio_chip;
> > +     g->chip.base = -1;
> > +     g->chip.parent = parent;
> > +     g->regmap = dev_get_regmap(parent, NULL);
> > +     g->dev = dev;
> > +
> > +     ret = bd73800_gpio_get_pins(g);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!g->num_pins) {
> > +             /*
> > +              * The BD73800 may or may not have pins allocated for GPIO
> > +              * depending on the OTP used at manufacturing. Free the memory
> > +              * and go out if there is no pins as then we have nothing to do
> > +              */
> > +             dev_dbg(dev, "no GPIO pins\n");
> > +             devm_kfree(dev, g);
>
> No need for that, because...
>
> > +             return 0;
>
> ... this will still leave a bound device in the system, I'm not sure we want
> it? The correct error code in this case is -ENODEV.

I am a bit uncertain. This isn't really an error. It should be very
much Ok to configure the support for PMICs with GPIOs to be compiled -
and also very much Ok to have a PMIC with no GPIOs. Returning an error
doesn't feel right. Furthermore, I am afraid that returning an error
might hurt the system start-up? Do you see some really problematic
consequences if we return Ok without registering the GPIOs. I'd assume
that wastes some bytes but I don't see other really severe
consequences.

As noted when sending - I am mostly offline during July so my replies
may arrive a bit late and next version is unlikely to be sent before
August.

Yours,
    -- Matti

-- 

Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
