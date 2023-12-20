Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100E25550
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 13:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="TCAa6qic"
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D0F5F3F337
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703077659;
	bh=r0CdQOvCJT9PWx3Toc+lT3OhGIYfIqGUNbKWq1eVXYI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TCAa6qicb+3v71ugpp9XM6w+0IAsDWjZZb673vE5lom/+U4D3hq7Ei3OtBNqF5KmP
	 1dGq+uDoGo6et5zy3gph09A5RbdmWHM8l9QkfOIzFyiny0e6FPMLTOorIOAqPYOig4
	 fvJHAmV8r2b0ZZarN/brH+Kai6gffvVtIxg9mcv6TiioOCeeeamG1UckbPwAoQ/n8m
	 cbdfHHuMRP4rO3seAHu5FQrJZdavMcyU/3mv48ws31MDXX+HM1PmnGxC8L5Dm6qr3b
	 5axaQKlCWrzB8ucZRbyS7RMBN0WYmSQS2gY5PDrb/l53/UN3bphfcZlVgSoIaPkiu+
	 2a/14UYqmotxA==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425b4c1b67cso91567751cf.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 05:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703077658; x=1703682458;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0CdQOvCJT9PWx3Toc+lT3OhGIYfIqGUNbKWq1eVXYI=;
        b=MCW0cEUGdYH5kFmnHgvVMq3rQlXo+WCjsADMHKk1pVA0zRDe+Ox92SCe32w5HUOgC6
         B96lqbPbC5Sr9LMvepWm7NK4/fm2H0M7FukOGfGzxHiV8oCO9YJ3Z8i2Iolmu5GCRYqK
         dERoFUPW0HNGoEIpuYCBvwLA//6ylOrEuJL7f02sX9vkOWrLA2JTqU4lh2SvQAeNxvp2
         3zCUJ7gYLl4ZG/pfDBskjBetNvVN5GFQsDcFVxweiDMbcDQE0uQ7H/UxWeztPmbHyJuP
         tqRLoaFoA+b1Tat/DZh0eNDMpm/EZGQUrUwcFe+UMAmijPgyMaRel6eZ+wGrKSvBEKuq
         7k/w==
X-Gm-Message-State: AOJu0YzStlPLnW27oZ1gCOuyd8zS+fMgRhMuw38xCJgQGH0ZP39k3MAb
	/2DSshDKyrtjKbVGX+qx1R5yb94tuoQ9L/dKFTWKiyY0r5YRo+OBTH1XmhKAaxRg4buWNnzIi8h
	IVHX6A+B4TsK95MuoDrQrZ8R6w5NDivlkFj+NlhjmuRp1Xa7lm+gxXQ==
X-Received: by 2002:a05:622a:151:b0:425:4043:41bb with SMTP id v17-20020a05622a015100b00425404341bbmr28425851qtw.103.1703077658762;
        Wed, 20 Dec 2023 05:07:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJQWo5S6Twjiqv7hVGH8pnzTy4jLVodY7mu7HWHHthSbK44x6228egaTi7uxjO35ZP2F5Yea0g4Py2XxfPUWM=
X-Received: by 2002:a05:622a:151:b0:425:4043:41bb with SMTP id
 v17-20020a05622a015100b00425404341bbmr28425841qtw.103.1703077658527; Wed, 20
 Dec 2023 05:07:38 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 20 Dec 2023 05:07:38 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <07a8ac42184f440fae1b0d13db4e43cc@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com> <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <9ae86c6786bc4ac7b93c971ba00084a6@EXMBX066.cuchost.com> <CAJM55Z9GVFGuwqe=zLXQvBwDfVSz4eA2EXDd4sqWVCKJF2J+fg@mail.gmail.com>
 <07a8ac42184f440fae1b0d13db4e43cc@EXMBX066.cuchost.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 20 Dec 2023 05:07:38 -0800
Message-ID: <CAJM55Z9w3PdZMFNhTviBvu-2HE7CXdTVpLvgyecArvs=qa_J=A@mail.gmail.com>
Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "kernel@esmil.dk" <kernel@esmil.dk>, 
	"conor@kernel.org" <conor@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"

JeeHeng Sia wrote:
>
>
> > -----Original Message-----
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Sent: Wednesday, December 13, 2023 7:57 PM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; Emil Renner Berthing <emil.renner.berthing@canonical.com>; kernel@esmil.dk;
> > conor@kernel.org; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu; mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; Hal Feng
> > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>
> > Subject: RE: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> >
> > JeeHeng Sia wrote:
> > > > -----Original Message-----
> > > > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > > > Sent: Saturday, December 9, 2023 12:25 AM
> > > > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> > > > krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > > > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> > > > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > > > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon
> > Tan
> > > > <leyfoon.tan@starfivetech.com>
> > > > Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> > > >
> > > > Sia Jee Heng wrote:
> > > > > Add support for JH8100 System clock generator.
> > > > >
> > > > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > > > ---
> > > > >  MAINTAINERS                                   |   8 +
> > > > >  drivers/clk/starfive/Kconfig                  |   9 +
> > > > >  drivers/clk/starfive/Makefile                 |   1 +
> > > > >  drivers/clk/starfive/clk-starfive-common.h    |   9 +-
> > > > >  drivers/clk/starfive/jh8100/Makefile          |   3 +
> > > > >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> > > > >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++++++
> > > > >  7 files changed, 495 insertions(+), 1 deletion(-)
> > > > >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> > > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> > > > >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
> > ...
> > > > > diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> > > > > index 012f7ee83f8e..6cb3ce823330 100644
> > > > > --- a/drivers/clk/starfive/Makefile
> > > > > +++ b/drivers/clk/starfive/Makefile
> > > > > @@ -10,3 +10,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
> > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > > > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> > > > > +obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= jh8100/
> > > >
> > > > I don't really see why do you need a special subdirectory for the JH8100? The
> > > > JH7110 drivers do fine without it.
> > > Each subfolder can represent a different platform, making it easier to
> > > locate and maintain platform-specific code. Since the code is expected
> > > to grow in the future, let's start organizing it in a folder-based structure
> > > for easier maintenance at a later stage.
> >
> > Yes, but that's not what you're doing here. You're making just one of the 3
> > almost identical drivers be different for no good reason.
> >
> > > > > diff --git a/drivers/clk/starfive/clk-starfive-common.h b/drivers/clk/starfive/clk-starfive-common.h
> > > > > index fed45311360c..ec30af0658cf 100644
> > > > > --- a/drivers/clk/starfive/clk-starfive-common.h
> > > > > +++ b/drivers/clk/starfive/clk-starfive-common.h
> > > > > @@ -103,6 +103,13 @@ struct starfive_clk_data {
> > > > >  	.parents = { [0] = _parent },						\
> > > > >  }
> > > > >
> > > > > +#define STARFIVE_GINV(_idx, _name, _flags, _parent)[_idx] = {			\
> > > > > +	.name = _name,								\
> > > > > +	.flags = _flags,							\
> > > > > +	.max = STARFIVE_CLK_ENABLE | STARFIVE_CLK_INVERT,			\
> > > > > +	.parents = { [0] = _parent },						\
> > > > > +}
> > > > > +
> > > > >  struct starfive_clk {
> > > > >  	struct clk_hw hw;
> > > > >  	unsigned int idx;
> > > > > @@ -114,7 +121,7 @@ struct starfive_clk_priv {
> > > > >  	spinlock_t rmw_lock;
> > > > >  	struct device *dev;
> > > > >  	void __iomem *base;
> > > > > -	struct clk_hw *pll[3];
> > > > > +	struct clk_hw *pll[8];
> > > >
> > > > These extra slots are just used for fixed factor dummy PLLs right now, similar
> > > > to how the JH7110 first used them and later had to rework drivers and device
> > > > trees for the proper PLL driver.
> > > Yes, its intention is similar to JH8100. We will submit other clock
> > > domains and PLL at later stage but not so soon.
> > > >
> > > > This time around I'd much rather you work on getting the PLL driver in first,
> > > > so we don't need all that churn.
> > > I am sorry but we started development on FPGA. Unfortunately, the PLL driver
> > > and other domains are planned to be finished at a later stage. I have tried
> > > to minimize the churn as much as possible.
> >
> > It's awesome that you're beginning upstreaming early, but if you don't have
> > this in silicon yet, how do you even know that this driver works?
> >
> > If you're just using this for testing on FPGAs you can create dummy fixed
> > clocks in the device tree for the PLLs that this driver can consume.  Then
> > later when you have a PLL driver you can replace those fixed clocks with the
> > output of that driver.
> The PLL fixed clocks were created in the C code. I interpret this message
> as a suggestion to create a PLL fixed clock in the DT?

Yes, then you don't need to change the clock driver and its bindings but just
need to update the clock references to the PLL driver once you have that.

/Emil
