Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="KwXv+gHr"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74209D5
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 03:56:55 -0800 (PST)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B17533F183
	for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702468613;
	bh=fEKA5YHCYnGRm2G7PXjnR2dxRPk0aRjVN0bpJvT3Tb0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=KwXv+gHrEQ5KU7gee+gbabDgrebWmU4MzMuXXWJuyoq4YthDUjceSqRmQSUXOr4k1
	 35ZIV3/6nfM8vzpDi9egx7MYSuCS63NfBXoVzXxg/X2rw0F20eLk6KGqEMG7RC8pqM
	 aZPP+iExyJtiCdpF8+kbQHcO9oVLRE+9n8CEHPf8JCcQmGzESuLXxXcpaFv6RWyxwE
	 ZsCbHs+rKp7Yt6/sdV9tZYM+v9b9xUj+2jrZLkTrA+jyJByUksAKC9RvT3N84BsO70
	 0PG4ccQLnAmy3LCczxTR8OIX8v9Fj7oZbtvOa6O/6/SuBp3e1hXMgMowohkesz/9H7
	 5zEpMLhIYW6uw==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77f4fd94d77so700443085a.3
        for <linux-clk@vger.kernel.org>; Wed, 13 Dec 2023 03:56:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702468612; x=1703073412;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fEKA5YHCYnGRm2G7PXjnR2dxRPk0aRjVN0bpJvT3Tb0=;
        b=O+VSkP2gP1aO18zt4+so/68tcfEc5eg5yVvIfqccfQHL0R2nVe1p3yp4FJCBUJ+lE4
         TK62P8p1vJl5sRwu2+HLdJIiQ38/KVXgGlsXJ3iUG7aGln2RgZG9pj77bnEKZE4lD0xL
         jd9Cbyduk6V+roej50y3KDbY0tfDRCWLXwV0AmD6JZp/4JXEj0hY1eKfF9hciAk6hUzL
         TYXa/GqX10HbE+DHm5XV1uG7OR9ufnsSfUrhYdrWB5ZZD312qHaymQQDf53J1Ksyo/Cy
         WmRb67pV5JBWzxYxgoWaQfTfVNyv/qm0t9yxTRrxidU9VqeCIrsEjL0oI0BxwFTCfT45
         n+GA==
X-Gm-Message-State: AOJu0YzU4/KxxRQSufVx4FTlOkkfIp73Tk4N/uywOxFC++LOHgY5zV+y
	ZyqUffI1yAFRfD7q3ItJHlgAuzvtMZi4Vd1XhVwjbL2bCtbZ5bQeLkwHF7AQcPXkEDcNo6V4Nkm
	mJEq1N51tu/uNnD2l4lRKRIJYsJehC2REmfjzasKbDPeSrog4ndwPQw==
X-Received: by 2002:a05:622a:181a:b0:425:a0b5:5d43 with SMTP id t26-20020a05622a181a00b00425a0b55d43mr11488976qtc.63.1702468612606;
        Wed, 13 Dec 2023 03:56:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBkVFLBJC/0risE5Kv5CrCtwd+gtryIUOxD+I5QRMHIbkz3Zh7EYMwe0cp/xekG+Qh3sh2S9fxIZKLyq5ska0=
X-Received: by 2002:a05:622a:181a:b0:425:a0b5:5d43 with SMTP id
 t26-20020a05622a181a00b00425a0b55d43mr11488962qtc.63.1702468612273; Wed, 13
 Dec 2023 03:56:52 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 03:56:51 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <9ae86c6786bc4ac7b93c971ba00084a6@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-7-jeeheng.sia@starfivetech.com> <CAJM55Z_VgBGvCPuvwmQahMcMfuWKnOKpZ9bBbbhei_Teu5Apeg@mail.gmail.com>
 <9ae86c6786bc4ac7b93c971ba00084a6@EXMBX066.cuchost.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 13 Dec 2023 03:56:51 -0800
Message-ID: <CAJM55Z9GVFGuwqe=zLXQvBwDfVSz4eA2EXDd4sqWVCKJF2J+fg@mail.gmail.com>
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
> > -----Original Message-----
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > Sent: Saturday, December 9, 2023 12:25 AM
> > To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> > krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> > mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> > <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> > Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>
> > Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH8100 System clock generator driver
> >
> > Sia Jee Heng wrote:
> > > Add support for JH8100 System clock generator.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > ---
> > >  MAINTAINERS                                   |   8 +
> > >  drivers/clk/starfive/Kconfig                  |   9 +
> > >  drivers/clk/starfive/Makefile                 |   1 +
> > >  drivers/clk/starfive/clk-starfive-common.h    |   9 +-
> > >  drivers/clk/starfive/jh8100/Makefile          |   3 +
> > >  .../clk/starfive/jh8100/clk-starfive-jh8100.h |  11 +
> > >  drivers/clk/starfive/jh8100/clk-sys.c         | 455 ++++++++++++++++++
> > >  7 files changed, 495 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/clk/starfive/jh8100/Makefile
> > >  create mode 100644 drivers/clk/starfive/jh8100/clk-starfive-jh8100.h
> > >  create mode 100644 drivers/clk/starfive/jh8100/clk-sys.c
...
> > > diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> > > index 012f7ee83f8e..6cb3ce823330 100644
> > > --- a/drivers/clk/starfive/Makefile
> > > +++ b/drivers/clk/starfive/Makefile
> > > @@ -10,3 +10,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
> > > +obj-$(CONFIG_CLK_STARFIVE_JH8100_SYS)	+= jh8100/
> >
> > I don't really see why do you need a special subdirectory for the JH8100? The
> > JH7110 drivers do fine without it.
> Each subfolder can represent a different platform, making it easier to
> locate and maintain platform-specific code. Since the code is expected
> to grow in the future, let's start organizing it in a folder-based structure
> for easier maintenance at a later stage.

Yes, but that's not what you're doing here. You're making just one of the 3
almost identical drivers be different for no good reason.

> > > diff --git a/drivers/clk/starfive/clk-starfive-common.h b/drivers/clk/starfive/clk-starfive-common.h
> > > index fed45311360c..ec30af0658cf 100644
> > > --- a/drivers/clk/starfive/clk-starfive-common.h
> > > +++ b/drivers/clk/starfive/clk-starfive-common.h
> > > @@ -103,6 +103,13 @@ struct starfive_clk_data {
> > >  	.parents = { [0] = _parent },						\
> > >  }
> > >
> > > +#define STARFIVE_GINV(_idx, _name, _flags, _parent)[_idx] = {			\
> > > +	.name = _name,								\
> > > +	.flags = _flags,							\
> > > +	.max = STARFIVE_CLK_ENABLE | STARFIVE_CLK_INVERT,			\
> > > +	.parents = { [0] = _parent },						\
> > > +}
> > > +
> > >  struct starfive_clk {
> > >  	struct clk_hw hw;
> > >  	unsigned int idx;
> > > @@ -114,7 +121,7 @@ struct starfive_clk_priv {
> > >  	spinlock_t rmw_lock;
> > >  	struct device *dev;
> > >  	void __iomem *base;
> > > -	struct clk_hw *pll[3];
> > > +	struct clk_hw *pll[8];
> >
> > These extra slots are just used for fixed factor dummy PLLs right now, similar
> > to how the JH7110 first used them and later had to rework drivers and device
> > trees for the proper PLL driver.
> Yes, its intention is similar to JH8100. We will submit other clock
> domains and PLL at later stage but not so soon.
> >
> > This time around I'd much rather you work on getting the PLL driver in first,
> > so we don't need all that churn.
> I am sorry but we started development on FPGA. Unfortunately, the PLL driver
> and other domains are planned to be finished at a later stage. I have tried
> to minimize the churn as much as possible.

It's awesome that you're beginning upstreaming early, but if you don't have
this in silicon yet, how do you even know that this driver works?

If you're just using this for testing on FPGAs you can create dummy fixed
clocks in the device tree for the PLLs that this driver can consume.  Then
later when you have a PLL driver you can replace those fixed clocks with the
output of that driver.

/Emil
