Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F1847F766
	for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 14:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792246723; cv=none; b=N6PTFURvx/ERjpmhWMj/BgOmLj36TN101j9EIwTf6zhGu82iN0d19GmJ0cFgUS7aA9vQoKC3IYvfv4QhOFL3i6ccxg1Uq2XIlU//KWfMrDdDlzACkyrcnfq/PA/35IwuSLY0x0SCzBEDnsZzwT0HePj1j1nydGlx++xbLKzYmHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792246723; c=relaxed/simple;
	bh=3v+6YlSml8t8QtsLAKGyYODzduZT9ur8kesXOOK6Hpw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KBzhq0/omluNzhZgTU/vpSlXb2hL749HNxHhNxSaQtRqYO73dEvzFLEeHz7Pb5+PWjnNGZ72FB+xZOVAe1+tpiUr7uQT3hNPez/STNLJOaccivDm+W0IRjihC+2QaZzze2wOC4CCFpdNegZ2mucuIx9iqaWlnxGBebTL4S82/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LBBL1eJX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LBBL1eJX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e00eee27dso383735f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 17 Oct 2026 07:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792246718; x=1792851518; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LhpcYsG6cATtQf6GDnXL2jByxJZRscDKQUvf/bDDW4s=;
        b=LBBL1eJX1/dyhCjKZbiTgSBQDJGd1/EObQX7ISByjUwmh0UtMRPHll+MA6dBoPzX4o
         J3yo1nYcnuI42rkXruBnRTFbnb/HUR1eKPdRvKa9pHVKnmXiHiassvUzhYnnSUgB5F5T
         RKSSKvCPATBo+pWbrF8QZRfBajMLv87bYPTSpDAx8rCfc6jvM+vXbFVMUR0999LbRyxF
         +Z+Mu33sJV/WdS8egEnIeaTMzNOCV/6FryTXrMUSqoN+Sd2an8i7tcXWl/a3qHX+J6/+
         sW0QmXsAvOgFzlkOnDeS+zi3rshMWjPpiGTf8U5gMw5IXX9BXHdLhD74ymq9YfuJWwp2
         FU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246718; x=1792851518;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhpcYsG6cATtQf6GDnXL2jByxJZRscDKQUvf/bDDW4s=;
        b=chmFDp/QiI1h57Yj4KUj1Tut5Kr4mBkToYaVqM/9ZDOAEacB1wDfGJc1QxvolL7Q6O
         ZOyCTSX8lMd/0Cd2UljZYSgBmfC7+WQnMC00Ddm5zXnPwjcGGi4WX+DkutTAtK1wx2mj
         fNmlc93S4AyZNS11IUlfJGrVcGj5t0Nf40C/r7mVqKhyWPBXvXsx9JTeYLE7lfkaXZ9y
         yxxVGefpLJAkPCVIJqrHrX5t06Wpi6IIMjyAOcuJ81F1kGVqCmcOE0c9hG1RRrp+5GBb
         /YRoibCydfGlTUoSstc3XZe5aoOBRG0stWZdfqPEcZGePDBWZGW/fjBDyD6eCVzEq3uF
         /zYw==
X-Forwarded-Encrypted: i=1; AKwUvBwRd+Zbhqpb8kBJBs0TRG0F3QsJGlxTSor+zopvhoxrSmkIQX52cNLShhSf0mFi/wojcIiHxlsadFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrIaiG30pyoBM/PtI8tBXTXtyYqhDSRZHRjEC5NwIf7+vGjwNs
	HAFQi8K+9jZZZJI5+6ElwSvJ4LhZ/kfCdyPuX3PzPvFClrEZbnXN6M+dF1XSH0OMXIg=
X-Gm-Gg: AYBFou208xMBH4p/r7Duu8uFoqGc7subr+1VOwOawI3NghKfV3dQHhBlBaLkbewlR2t
	Q8SgGfQ5tkg70s+gokm75YfAiHnz6JcIfbrjoIy67gcNcv36pazQJsT9K9BnK3XapjbAoj9Tx9W
	9e5GluG8GQkdZPNnkh5XO5F6H1TUHX6JK6qQeTOEkWvdkToamoEZczMrXrPwT9lkFKon3ezIngl
	YgVU3I5cv3ldR5d5zXzreMZjdHah/Kxl18yPwuymK9Qpb808mMvMy5zQF+BhFVDvIqIbYucn39k
	nIXPtyxzV32KUQWBfzEZ6gQOFrJH1FXH9+HdNBmRE5VwHvtTuyzwZ4WEAYTfEGlau+97YsJq54A
	oLcP8ClR6uA16VBxFv8pT4Bl5vna/7YJRxy7TBD5sFiAblfXbVUqz0Zl8rdubVN6796VhDpDIZ/
	8gaKKjgRhOH+Ju3bviyHfKQ6+tGwPVAXcfHZ5RBvnfyFqY51UUV1bUkw3WK5rSybNAeykmDX5dE
	WLO4mIHE61FBjWHag==
X-Received: by 2002:a05:6000:60b:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-48e0797ffddmr5343647f8f.7.1792246716907;
        Sat, 17 Oct 2026 07:18:36 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5038b8sm11600796f8f.48.2026.10.17.07.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 10/15] clk: starfive: Add StarFive JHB100
 Peripheral-0 clock driver
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
In-Reply-To: <ZQ4PR01MB120299579A8998CC303F04ADF29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-11-changhuang.liang@starfivetech.com>
 <179180050742.66744.4988353309640403131.b4-review@b4>
 <ZQ4PR01MB120299579A8998CC303F04ADF29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Sat, 17 Oct 2026 16:18:25 +0200
Message-Id: <179224670585.859276.2044951818293223404.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5393; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3v+6YlSml8t8QtsLAKGyYODzduZT9ur8kesXOOK6Hpw=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXmzft1jj56PKKzB/J3oYa8ksvHXOM+vNAufA3iw3HE
 baV2i90OkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjARmaUM/xTeLU5sqzgZ1Zj1
 yr5Df0b9kTZzx4yvTqsrMj2/dfWo/2dkuMRsMMvZ7NG1X+36OsuPhorxmS4yW3bd0lbxVbXua+Z
 8RgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-14 02:13 +0000, Changhuang Liang wrote:
> Hi, Jerome
> 
> > > Add driver for the StarFive JHB100 Peripheral-0 clock controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/Kconfig                  |  10 +
> > >  drivers/clk/starfive/Makefile                 |   1 +
> > >  .../clk/starfive/clk-starfive-jhb100-per0.c   | 617 ++++++++++++++++++
> > >  3 files changed, 628 insertions(+)
> > >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > >
> > > diff --git a/drivers/clk/starfive/Kconfig
> > > b/drivers/clk/starfive/Kconfig index cfaac934a8e0..b2a05bbb450f 100644
> > > --- a/drivers/clk/starfive/Kconfig
> > > +++ b/drivers/clk/starfive/Kconfig
> > > @@ -73,6 +73,16 @@ config CLK_STARFIVE_JH7110_VOUT
> > >  	  Say yes here to support the Video-Output clock controller
> > >  	  on the StarFive JH7110 SoC.
> > >
> > > +config CLK_STARFIVE_JHB100_PER0
> > > +	bool "StarFive JHB100 peripheral-0 clock support"
> > > +	depends on ARCH_STARFIVE || COMPILE_TEST
> > > +	select CLK_STARFIVE_JH71X0
> > > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> > > +	default ARCH_STARFIVE
> > > +	help
> > > +	  Say yes here to support the peripheral-0 clock controller
> > > +	  on the StarFive JHB100 SoC.
> > > +
> > >  config CLK_STARFIVE_JHB100_SYS0
> > >  	bool "StarFive JHB100 system-0 clock support"
> > >  	depends on ARCH_STARFIVE || COMPILE_TEST diff --git
> > > a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile index
> > > 29cdef20575e..352717886295 100644
> > > --- a/drivers/clk/starfive/Makefile
> > > +++ b/drivers/clk/starfive/Makefile
> > > @@ -11,6 +11,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+=
> > clk-starfive-jh7110-stg.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
> > clk-starfive-jh7110-vout.o
> > >
> > > +obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+=
> > clk-starfive-jhb100-per0.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
> > clk-starfive-jhb100-sys0.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+=
> > clk-starfive-jhb100-sys1.o
> > >  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+=
> > clk-starfive-jhb100-sys2.o
> > > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > > b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > > new file mode 100644
> > > index 000000000000..ef6e6906cd2f
> > > --- /dev/null
> > > +++ b/drivers/clk/starfive/clk-starfive-jhb100-per0.c
> > > @@ -0,0 +1,617 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * StarFive JHB100 Peripheral-0 Clock Driver
> > > + *
> > > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> > > + *
> > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > + *
> > > + */
> > > +
> > > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> > > +#include <linux/platform_device.h>
> > > +
> > > +#include "clk-starfive-jh71x0.h"
> > > +
> > > +#define JHB100_PER0CLK_NUM_CLKS
> > 	(JHB100_PER0CLK_MAIN_ICG_EN_TRNG + 1)
> > > +
> > > +/* external clocks */
> > > +#define JHB100_PER0CLK_OSC
> > 	(JHB100_PER0CLK_NUM_CLKS + 0)
> > > +#define JHB100_PER0CLK_PLL6
> > 	(JHB100_PER0CLK_NUM_CLKS + 1)
> > > +#define JHB100_PER0CLK_CFG_400
> > 	(JHB100_PER0CLK_NUM_CLKS + 2)
> > > +#define JHB100_PER0CLK_CFG_800
> > 	(JHB100_PER0CLK_NUM_CLKS + 3)
> > > +#define JHB100_PER0CLK_NCNOC_INIT
> > 	(JHB100_PER0CLK_NUM_CLKS + 4)
> > > +#define JHB100_PER0CLK_NCNOC_TARG
> > 	(JHB100_PER0CLK_NUM_CLKS + 5)
> > > +
> > > +static const char * const jhb100_per0_ext_clk[] = {
> > > +	"osc",
> > > +	"pll6",
> > > +	"cfg_400",
> > > +	"cfg_800",
> > > +	"ncnoc_init",
> > > +	"ncnoc_targ",
> > > +};
> > > +
> > > +/*
> > > + * Regarding the CLK_IS_CRITICAL flag:
> > > + *   What is special here is the UART*-related clocks. On the JHB100, the
> > secure
> > > + *   core may consume one UART, while the AP core consumes another.
> > Different
> > > + *   core boards may select different UARTs, so we usually want to keep
> > all UART*
> > > + *   clocks always on to prevent the AP core from turning off the clock for
> > the
> > > + *   secure core's UART.
> > > + *   UART0-3 are usually used by the HOST side, and there will be no
> > driver on
> > > + *   the BMC side to consume these clocks. Therefore, these clocks need
> > to be
> > > + *   enabled for the host to consume.
> > 
> > So you are forcefully enabling 14 clocks for 1 to 4 clocks that may or may not
> > be used.
> > This is not how this should work. You just enable clock randomly hoping it will
> > cover your use case. If you are managing the clock for these secure core, it
> > clearly shows you need a driver for it.
> 
> Can I keep the clocks for uart0-3 as CLK_IS_CRITICAL here? On the JHB100 BMC SoC, 
> uart0-3 are provided for the host to read and write registers via eSPI. On our BMC 
> side, we need to ensure the clocks are always on to provide host access.
>

It would be less problematic, but still I do not understand why a uart end up being
critical.

If you are letting the host map the uart memory region and implement some
'userspace' driver, you already know what you are doing is bad. So it is
hardly a good reason.

-- 
Jerome

