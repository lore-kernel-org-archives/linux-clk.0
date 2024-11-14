Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15C15FA7B
	for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731598886; cv=none; b=nYCeMN5xKIDuYsUj3Ve5xAZdjOvGhFunjhnmikwB8WEniewM3Cs4PTko7Y3AdsRAHvHuVXXt8/FA+gLZ13U5n1glhc7gz7oRRCbSvHj+2wdtgOE9PNn0PiPXxMO+ofjyobf7qgVM//o9EPwPLWEpvERbOJgeK3F2EhXQVjk8n1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731598886; c=relaxed/simple;
	bh=1jU+6FRiK8iU2xVcgYuGMa7M+TUxh7iPXDHVCdFmJPA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWdun+kwIXXTjqm0ijxEVNgli1sQ7Jp4PY5alUtS8hWRir62OXC1PTlPYPL+Gg1MBa+11Vn1vX6qeg0A3RkygIltaqgJupBgnmDKgvy16gfx8g+jCGzjQjFOZXufUsx9A/MAO5KX2GUXTj9Hu0+ebvVOCzAdoXPdfeC2D8YXqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J+gOGN7m; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J+gOGN7m"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so8086851fa.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Nov 2024 07:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731598881; x=1732203681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NBFMQhIIT6ymbEv39KxcdDxNSIvYaJrZK6T6Q4vz58=;
        b=J+gOGN7mVonLscJpOo7jYiH0g9Js1oieDBuECXafhK04t2kaDbUXKxajX54kq7kp7d
         xHaITZ/Ni6LP9RtZVlB7zMq3BC0zY0ebA3ocCmeY1BRLKCvIBIc9q2mLe0I9pg0oprsA
         blq/7tSmgOgrxcJGWs2Pn8ehG3YiF6lWopSjWb814DI0n0/VFvFpaywJwt+FBM+4tp/o
         XOJiK0fKKCs3pedHZEGDUVTaKNxDaUjfOVd0jcLPBVimpLqaOG4NNJsAV7J4VFFR1pwo
         vuGWpJXTVcVs5rfBN75b5aMnQbWv74yKklVAlM6ozlZ+PNkzLQ9OtrsESAsWk4j/vpg0
         GNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598881; x=1732203681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NBFMQhIIT6ymbEv39KxcdDxNSIvYaJrZK6T6Q4vz58=;
        b=H1uPDehVSqDr+E1C3gf3sJeUJgfBFo753G5Vog1/+ptEZvwF65kh9LmTUuZDwJWk9m
         pFzPUsBg6eFmxTuz16u6PXD7HOWvYc8uqKLzc0IlT8YG1l38L+2x2XO74BEQNmGeT5/G
         ysS2QD9TQPdH4aNAlT/GFjZn2IpqBCPrGnwwDJdwgj9OYoDxwuGrcVYRwOAecb+SNeQ9
         +/3NMwQ4tigZQ9U0c87jWqN8FnjArXC+5TC7FKMJwPm8Zhf1fvKsKHgyUoPjvus9N9dl
         IYawmZb+s31ms0M4497kdk6icdz8HbqlYWxRxVTSXxp+ygcn8lBU9s/grdVQI7mSRB1F
         oR6w==
X-Forwarded-Encrypted: i=1; AJvYcCVKiFueKDFLqFVYyRnu2w4Lkg6542rrZUmQzrg1bFEte+R4qKI2bjy/366Czltp4Q1qEQVancPQDys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1vyrHKMTkPN92KqlVN3q4JJvtwfOvjuHZ3lAMs7ZLec+bMoYh
	Rgjv0xnZLRZX6u8+wckHdcgBTveDF33kfm2oKD3zo8D78CzmxiPlgRIz+RV7cBI=
X-Google-Smtp-Source: AGHT+IE3AJId58tpidJfEutc3uS9bz9dQSqU2NqlB5syKnjI4F1dHTAie1yyXTx7nGeaNXqvKGaGyw==
X-Received: by 2002:a05:651c:2122:b0:2fa:de52:f03c with SMTP id 38308e7fff4ca-2ff2015249fmr130795541fa.5.1731598881346;
        Thu, 14 Nov 2024 07:41:21 -0800 (PST)
Received: from localhost (host-79-19-144-50.retail.telecomitalia.it. [79.19.144.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf79bb3579sm679369a12.37.2024.11.14.07.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 07:41:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 14 Nov 2024 16:41:49 +0100
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	St efan Wahren <wahrenst@gmx.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/14] clk: rp1: Add support for clocks provided by RP1
Message-ID: <ZzYaPZcohzMma84A@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <022cf4920f8147cc720eaf02fd52c0fa56f565c5.1728300189.git.andrea.porta@suse.com>
 <611de50b5f083ea4c260f920ccc0e300.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <611de50b5f083ea4c260f920ccc0e300.sboyd@kernel.org>

Hi Stephen,

On 15:08 Wed 09 Oct     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2024-10-07 05:39:51)
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index 299bc678ed1b..537019987f0c 100644

Here's below the kind response from RaspberryPi guys...
...

> > +       clockman_write(clockman, data->pwr_reg, fbdiv_frac ? 0 : PLL_PWR_DSMPD);
> > +       clockman_write(clockman, data->fbdiv_int_reg, fbdiv_int);
> > +       clockman_write(clockman, data->fbdiv_frac_reg, fbdiv_frac);
> > +       spin_unlock(&clockman->regs_lock);
> > +
> > +       /* Check that reference frequency is no greater than VCO / 16. */
> 
> Why is '16' special?

16 is a hardware requirement.
The lowest feedback divisor in the PLL is 16, so the minimum output
frequency is ref_freq * 16.

...

> > +static unsigned long rp1_pll_core_recalc_rate(struct clk_hw *hw,
> > +                                             unsigned long parent_rate)
> > +{
> > +       struct rp1_pll_core *pll_core = container_of(hw, struct rp1_pll_core, hw);
> > +       struct rp1_clockman *clockman = pll_core->clockman;
> > +       const struct rp1_pll_core_data *data = pll_core->data;
> > +       u32 fbdiv_int, fbdiv_frac;
> > +       unsigned long calc_rate;
> > +
> > +       fbdiv_int = clockman_read(clockman, data->fbdiv_int_reg);
> > +       fbdiv_frac = clockman_read(clockman, data->fbdiv_frac_reg);
> > +       calc_rate =
> > +               ((u64)parent_rate * (((u64)fbdiv_int << 24) + fbdiv_frac) + (1 << 23)) >> 24;
> 
> Where does '24' come from? Can you simplify this line somehow? Maybe
> break it up into multiple lines?

The dividers have an 8 bit integer and (optional) 24 bit fractional
part to the divider value.
The two parts are split across two registers (int_reg and frac_reg),
with the value stored in the bottom bits of both.

...

> > +static int rp1_clock_determine_rate(struct clk_hw *hw,
> > +                                   struct clk_rate_request *req)
> > +{
> > +       struct clk_hw *parent, *best_parent = NULL;
> > +       unsigned long best_rate = 0;
> > +       unsigned long best_prate = 0;
> > +       unsigned long best_rate_diff = ULONG_MAX;
> > +       unsigned long prate, calc_rate;
> > +       size_t i;
> > +
> > +       /*
> > +        * If the NO_REPARENT flag is set, try to use existing parent.
> > +        */
> > +       if ((clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT)) {
> 
> Is this flag ever set?

In future patches more clocks will be added (namely DPI, DSI (x2) and VEC).
All have the CLK_SET_RATE_NO_REPARENT flag set.
As those peripherals are sensitive to the accuracy of the clocks, the intent
is that the driver will have set the parent, and it isn't expected to change.

...

> > +       divider->div.reg = clockman->regs + divider_data->ctrl_reg;
> > +       divider->div.shift = PLL_SEC_DIV_SHIFT;
> > +       divider->div.width = PLL_SEC_DIV_WIDTH;
> > +       divider->div.flags = CLK_DIVIDER_ROUND_CLOSEST;
> > +       divider->div.flags |= CLK_IS_CRITICAL;
> 
> Is everything critical? The usage of this flag and CLK_IGNORE_UNUSED is
> suspicious and likely working around some problems elsewhere.

the next patchset revision will drop as many of those CRITICAL flags as possible,
and all of the IGNORE_UNUSED flags. That was legacy code needed on bcm-clk2835
since some clocks were enabled by the firmware, and therefore disabling them
had the potential for locking the firmware up. This does no longer apply to RP1.

...

Many thanks,
Andrea
