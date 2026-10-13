Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26543A0B24
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882333; cv=none; b=HU/ZuWpatwalurl6Tfs7i0rmaCITklY/ax6uWWbatKlSPMNsv62IEawXMv9hmeiC96m3BzTA6v3tTGF6UNSuUgHMOany72b/TJA0FTibhVZf5d7NAR3AsZIFVeXUhyqt5IIRyHW+xS9CC75poYEyrbVtbzYRh2093IJVMhGch3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882333; c=relaxed/simple;
	bh=mcDuyv5VV8y1u8HIkjifl6NSJsYbz2oQBovItDT06wU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CfwIizI2hJeJiF8IHUax7rO0b9p+69RDbWOO9s1pcj9FRdL6U99KYaQqwJ0f2d9ZsQLlCQkRtdyD9wQORSOA97Ss0EnxpjzAFXQeoC54EnV2IYFXb9zlXM8OGbhRZWsI0r4sshPA5Ou9HXAN52aN2GDwEYdXUDnBM8IwQBA+mP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=kuFIYKS+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="kuFIYKS+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so624716f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791882328; x=1792487128; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=;
        b=kuFIYKS+z25bs0Gwjcq62NEOIl0fnSOlXxjRpd73ZrRd3MxzR3/SJNnu+J4lbqBEQg
         pKLozfQUZYNtb+8GGFxAkaRFDQp02daD3/aY4j1iZjdO+D5LQG98ZGoc6HvGDGIL/7BK
         0aiO/TXZjW5iGlQBCr4TXGXuVxiaw7ZghirkHlg+47rnI28k2lGXjUUPf5Cs8CxNJWQ2
         hrVcK43BF7DzUjREfqmBdHz1hg5Dsif/jtqjpcOAMA7VX35dsPkShIG24szs4zk4PcvC
         mcVcPUdAs85jicDF/6lckhuxNPZcBgJH2Lw63uIFoLMaGDFcLRki3xHf2h6IxWQBFzu3
         UYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882328; x=1792487128;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iZjRkbq5W/7t5bYSMSsHGWHFlPOzNbExBo1Z2x1DxZ0=;
        b=kGJKZ5j3RN2MwfG1kkm/jJyPRmm/3RGDOLGwg81Bma9AKZlXs5qbVtaJiRQEql/OUu
         qz/yxRd3+/uSkoU42j+YVvOMh9eboSr1rgH3G6n20kMDdvha5o8ER97zfkuoolV7LXLz
         42a0UfAyZr6w9AswwvuioaVIsMaLB/3OR9FtQBBBt2PcbG103yOLUM0J3GergvmWDKjd
         Lb4aCFzB75OKd30dSkdqk1ivdvt7GVs2aV6OCvxcttDR7IYSyKpvsSbQE9HOTek7lolt
         lBHUyEKQk3whq0v7FVd+g/dcKGWRcp9x3BSXd87fHFJfAGEyfB8Kv86vf0S+SUVnUlFa
         6RgQ==
X-Forwarded-Encrypted: i=1; AKwUvByIcpscEq4UvGiLjnP/gOoycBpg6+cte5Mx49ooVucvjDKcagrVBW0Hf4e8/zympn6Hw9xBzNwWOoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY7IQ6K4X/nG5FnlhhNVIoQvSfdnK3NLt6gCpGdKsI3E6rWThj
	jTFZm4FRcB5IEhgvnELBZse1GBIYslp3TrvzjAIRfSZ0pJSJzVBlPshFG4nuzLr7ajE=
X-Gm-Gg: AYBFou2N3znYqWoPDdV8tQpxcmaiMvAjmgCnjvjN06dEOKbM3zRRrg3QWHwNwInCJm1
	I03J6yLtplbTLm1gZjMPTjXpVUw9XNu/TpU4MGmG4zChmrTgZF49iPI0KZAVmmb3jwg/GFvmjws
	+Ov7zd9af1sNDFBPetSc3GBwPWXsvrKi3IwSdWsMbqeXBUTvp1Lq8C99uyH0x1bFXTokFPcrvjr
	FFKNIk2x2ONUsH4YH+Xy2RXftQrd6zfah8gn2+st7PXJmZ3NN1cLd2ZYuQu7O4Aj5UblVgz1BIf
	jRlm3d/e9/7YLyHi1vizYfFEQHmziXkq/yqtBaEGxL+9Bmzp2euVK+IL/6rUCyCB5m6tfE6Ql9l
	bxabpZxxzXMrD+qWaukesnUUlUIXJs+yXqBpU9A/VWEwFsVcoshHqksCgVzFuDmbFwNJ2ThVyy/
	62raXeTjBrAOv81BJ8w5OhusRaTeGEDcPTeTFqbF5RKVxKszVHEFf/m7VV0MHuq6Z2PFgmlAlB0
	cAX2pPl17OW72ctJA==
X-Received: by 2002:a05:6000:40e0:b0:48c:6a4d:3b67 with SMTP id ffacd0b85a97d-48dbaceb433mr22277898f8f.19.1791882328049;
        Tue, 13 Oct 2026 02:05:28 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab6361sm3495503f8f.32.2026.10.13.02.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:05:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock
 generator driver
In-Reply-To: <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-6-changhuang.liang@starfivetech.com>
 <179180050742.66744.1321848308971146208.b4-review@b4>
 <ZQ4PR01MB1202DE124DED06ECEC948B89F29E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Tue, 13 Oct 2026 11:05:26 +0200
Message-ID: <1jzewiezs9.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mar. 13 oct. 2026 at 05:29, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Jerome
>
>> > Add support for JHB100 System-0 clock generator (SYS0CRG).
>> >
>> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > ---
>> >  MAINTAINERS                                   |   7 +
>> >  drivers/clk/starfive/Kconfig                  |  10 ++
>> >  drivers/clk/starfive/Makefile                 |   2 +
>> >  .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
>> >  4 files changed, 175 insertions(+)
>> >  create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> >
>> > diff --git a/MAINTAINERS b/MAINTAINERS index
>> > 66d6c15f1dd2..dff8b819f83e 100644
>> > --- a/MAINTAINERS
>> > +++ b/MAINTAINERS
>> > @@ -26217,6 +26217,13 @@ F:
>> 	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
>> >  F:	drivers/phy/starfive/phy-jh7110-pcie.c
>> >  F:	drivers/phy/starfive/phy-jh7110-usb.c
>> >
>> > +STARFIVE JHB100 CLOCK DRIVERS
>> > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>> > +S:	Supported
>> > +F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
>> > +F:	drivers/clk/starfive/clk-starfive-jhb1*
>> > +F:	include/dt-bindings/clock/starfive,jhb1*.h
>> > +
>> >  STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
>> >  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>> >  S:	Supported
>> > diff --git a/drivers/clk/starfive/Kconfig
>> > b/drivers/clk/starfive/Kconfig index 51716655554f..cd5b7754403e 100644
>> > --- a/drivers/clk/starfive/Kconfig
>> > +++ b/drivers/clk/starfive/Kconfig
>> > @@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
>> >  	help
>> >  	  Say yes here to support the Video-Output clock controller
>> >  	  on the StarFive JH7110 SoC.
>> > +
>> > +config CLK_STARFIVE_JHB100_SYS0
>> > +	bool "StarFive JHB100 system-0 clock support"
>> > +	depends on ARCH_STARFIVE || COMPILE_TEST
>> > +	select CLK_STARFIVE_JH71X0
>> > +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
>> 
>> just imply RESET_STARFIVE_JHB100 ?
>> 
>> It can be disabled if RESET_CONTROLLER is not set, so it is kind of weak
>> already.
>> 
>> > +	default ARCH_STARFIVE
>> > +	help
>> > +	  Say yes here to support the system-0 clock controller on the
>> > +	  StarFive JHB100 SoC.
>> > diff --git a/drivers/clk/starfive/Makefile
>> > b/drivers/clk/starfive/Makefile index 199ac0f37a2f..d2ba83d7d02c
>> > 100644
>> > --- a/drivers/clk/starfive/Makefile
>> > +++ b/drivers/clk/starfive/Makefile
>> > @@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+=
>> clk-starfive-jh7110-aon.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
>> >  obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+=
>> clk-starfive-jh7110-vout.o
>> > +
>> > +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+=
>> clk-starfive-jhb100-sys0.o
>> > diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > new file mode 100644
>> > index 000000000000..edab54f228ad
>> > --- /dev/null
>> > +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
>> > @@ -0,0 +1,156 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +/*
>> > + * StarFive JHB100 System-0 Clock Driver
>> > + *
>> > + * Copyright (C) 2024 StarFive Technology Co., Ltd.
>> > + *
>> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > + *
>> > + */
>> > +
>> > +#include <dt-bindings/clock/starfive,jhb100-crg.h>
>> > +#include <linux/init.h>
>> > +#include <linux/platform_device.h>
>> > +
>> > +#include "clk-starfive-jh71x0.h"
>> > +
>> > +#define JHB100_SYS0CLK_NUM_CLKS
>> 	(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
>> > +
>> > +/* external clocks */
>> > +#define JHB100_SYS0CLK_OSC
>> 	(JHB100_SYS0CLK_NUM_CLKS + 0)
>> > +#define JHB100_SYS0CLK_PLL0
>> 	(JHB100_SYS0CLK_NUM_CLKS + 1)
>> > +#define JHB100_SYS0CLK_PLL1
>> 	(JHB100_SYS0CLK_NUM_CLKS + 2)
>> > +#define JHB100_SYS0CLK_PLL2
>> 	(JHB100_SYS0CLK_NUM_CLKS + 3)
>> 
>> Does this mean that if the you ever find out you've forgot an internal clock
>> (which does happen fairly often) the whole external block will shift ?
>> 
>
> Later, I will introduce the following macros to define the external clock, which can avoid this problem.
>
> #define JH71X0_EXT_CLK_FLAG	BIT(15)
> #define JH71X0_EXT_CLK(_n) 	(JH71X0_EXT_CLK_FLAG | (_n))
>

hummm okay ... still seems hackish to me.

>

-- 
Jerome
