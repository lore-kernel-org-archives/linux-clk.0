Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B53DFC6A
	for <linux-clk@vger.kernel.org>; Fri,  2 Oct 2026 18:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967120; cv=none; b=HFMcL/l8bvWuaKA3QR9IjqhKXbHHCMxIQIr2uElI5WzNRckLs3Jh96w6LVR5we0o5KDOSZxE3lzjhMLRQcjguuW4/QSLXPAHXJnTPCAeaGmxPR7gZ5Bi+YOsUD/1m0uCHKEh3nx4LDOycBJzTRmwcrN69chf55AjDln6OiVN9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967120; c=relaxed/simple;
	bh=z5nIZYok1fhLZRQ7QC3TZVSMxWJtY/Swhyul/D70q5M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eQX82WAf5MhHDY5exOpKyd/rwo7MxNx4f/9Aa31wLikGn6K0Fsv1sm9HEpxSsF5ZW5256tjnsADF3tejDffTVSnyCt92iRJLX4oFpoB0PxpgjwW2IdxAwzUWc9OVpCn9Om2vY7ja7vBLMryZgIEIVMxZPYL2jY1QYolsY+9EUo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hpvjLq9y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iKxP7m9m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hpvjLq9y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iKxP7m9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFsvLQiLKfq21A28GjN0uk1v82NHBHz0YcGin5ZMxfw=;
	b=hpvjLq9ygg80g19rbCrxhZjHqgEQrWNNJPf0Z9RDZmu6d2q1lv74CdIIZs3Ylq14r5wTMW
	djawX43iI1lrPkDHPxV9dr6A3tBIX4Gpf695wysthnHGYi+thRiy938o48Na7ijPDZiE1l
	XLDbk1GdKBlblw1Ft7R91u0KAQXCJNY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-fSMqdFohNfmPGvu01N0G5A-1; Fri, 02 Oct 2026 14:51:54 -0400
X-MC-Unique: fSMqdFohNfmPGvu01N0G5A-1
X-Mimecast-MFC-AGG-ID: fSMqdFohNfmPGvu01N0G5A_1790967114
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so197537485a.0
        for <linux-clk@vger.kernel.org>; Fri, 02 Oct 2026 11:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790967113; x=1791571913; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sFsvLQiLKfq21A28GjN0uk1v82NHBHz0YcGin5ZMxfw=;
        b=iKxP7m9mYrQ/F/Gc4TKs+NXh1BPqFrDSqtmeQt9Euv1inhWYKUikYH80l7WPhvCBei
         tbad4AUV/KhJK61aEqRF939mFaIfQFwCCebUc5C1ocvDyP8kxffKjLGXdx1K1AYwjdWX
         pcz/m4YqthW1h7oMtcyohxeiVI6woNm/xwWTEGtS71Dz/rkWRrBdGjFErb/k77ZCypRw
         4kTmMJI3so8BLRBcnbZPSWe3XdIpu1b5QBZOksXItHwPbqKFfa0dE39zQhDYVKyMJaYU
         MFKzDWLpGfbYAtcHx+XXV+tITPJZuEPTbvzK7GkeaCqfCNkRF8++GKWmCXgKfbr2nVHw
         zKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967113; x=1791571913;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sFsvLQiLKfq21A28GjN0uk1v82NHBHz0YcGin5ZMxfw=;
        b=hWS/oF72QHQPpLrHiidaJ4VcBbZV2SHp4TWHk54FmGHN1ba0dx2Dnxq+/2BNQeBssB
         NTLqyYhQNAuF97bUJ1lHzMblUFqzS7J3mtFKsGImu23VxZPjAAURlzBhwWVYJvFvHMet
         OcKD0BRuin74JXR+gVlTL4fxRLzZOPFudMzdtJLKZC1f6+nWBxZhXSk6A+OiBzADFkec
         UH6A5ZhHxeY0qs2wTSWonU1esMWR2MiuQzZnjRiAndlV8sI/bcwGc96AiTiwDc2WJIrM
         wZ0hTFMGCaUnkGdv/TXHZmOFD1mmE2B+U3+P15+i28HIsEFsVuu0arzsRlejG0uwI8QA
         4nMA==
X-Forwarded-Encrypted: i=1; AKwUvBzg33P9+S94WVMrM39OZNGFyBWyeKqNginJ+CGHz3a9lZK5OSpk17/dvL61XNny/eMA2Hf/c2sJ5Ow=@vger.kernel.org
X-Gm-Message-State: AFuF++kYJhP9bOnzme7xp+C2NrpJOqwKN2b4Ftmn5967nVdrOalrriVk
	gGf8ba3F0qy5nWY7iY0iXD/J9kJkmkXRP0BWVyZcIfqusKMgZaTvG/GFX2NSJKkNSSo5nObGnZd
	dW8ElM3igc04phqv7vhqtNjPGVg5Lxxg2LYXuh8QS18xrivBFj4UiJMYqC5vncw==
X-Gm-Gg: AYBFou3Ds4rSfh9W19eyET7x6QiiHuu6Mr4pGRfpX16PJTXLHSnJ477/BNnsdjeaFSO
	7SK7iCAB4sKv8/UqHKxDk/GbB4eKDLoehwfqyQr1e+irGZoqZTIeNWZJ9KSlwEFRbNfX7v+tBqP
	tQIAJdjFAMZY8GaJgLMGuPxXWF32HVtcxGCsX57LZ0jg/MXz0PweDTsQf5DnlbcYNQdsIa8m4Dr
	8bqsUXxcCm3luLF0SdlRA444KC6aI4xvWijy8m/++mNWH6/p0HbATygMMUJf2Bg6nSICaDHNWUz
	7BH5RvoL9aN1TYh97w2Z5yuq71dRVWpZdHYoRbass/Wdmk5WSY3cMihMMGlViJD7KdyuN8tLQCa
	wxVJhCUvKdG7+mQ==
X-Received: by 2002:a05:620a:1984:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93cf189c270mr681522785a.54.1790967113555;
        Fri, 02 Oct 2026 11:51:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1984:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93cf189c270mr681517785a.54.1790967112966;
        Fri, 02 Oct 2026 11:51:52 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 10/23] clk: starfive: Add JHB100 System-2 clock
 generator driver
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-11-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-11-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707365.821688.712584426844385414.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=z5nIZYok1fhLZRQ7QC3TZVSMxWJtY/Swhyul/D70q5M=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7XmcHX65ip36MSC8m+bH/Q2KG5etNSV+ef2F7bvy
 u7EOFlP7ShlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiWvEM/wuePzdyPLAh2H83
 d0Jandj25LP1dgoer/dF3uqZr6C9axojw2meCs535p3fj//U/hfPvWHpVNPKItOIU/u3X/rCZ6D
 myQ0A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Changhuang,

> Add support for JHB100 System-2 clock generator (SYS2CRG).
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>
> diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
> index 11da8bcc4046..cfaac934a8e0 100644
> --- a/drivers/clk/starfive/Kconfig
> +++ b/drivers/clk/starfive/Kconfig
> @@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
>  	help
>  	  Say yes here to support the system-1 clock controller on the
>  	  StarFive JHB100 SoC.
> +
> +config CLK_STARFIVE_JHB100_SYS2
> +	bool "StarFive JHB100 system-2 clock support"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select CLK_STARFIVE_JH71X0
> +	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
> +	default ARCH_STARFIVE
> +	help
> +	  Say yes here to support the system-2 clock controller on the
> +	  StarFive JHB100 SoC.
> diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
> index 0061550e0f7e..29cdef20575e 100644
> --- a/drivers/clk/starfive/Makefile
> +++ b/drivers/clk/starfive/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
>  
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
>  obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
> +obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> new file mode 100644
> index 000000000000..a2c7e8eba9b6
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-2 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +
> +#include "clk-starfive-jh71x0.h"
> +
> +#define JHB100_SYS2CLK_NUM_CLKS			(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
> +
> +/* external clocks */
> +#define JHB100_SYS2CLK_OSC			(JHB100_SYS2CLK_NUM_CLKS + 0)
> +#define JHB100_SYS2CLK_PLL1			(JHB100_SYS2CLK_NUM_CLKS + 1)
> +#define JHB100_SYS2CLK_GPU0_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 2)
> +#define JHB100_SYS2CLK_GPU1_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 3)
> +
> +static const char * const jhb100_sys2_ext_clk[] = {
> +	"osc",
> +	"pll1",
> +	"gpu0_ncnoc_init",
> +	"gpu1_ncnoc_init",
> +};
> +
> +static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
> +	/* jtag mst*/
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_ATPG", 12,
> +		    JHB100_SYS2CLK_PLL1),
> +	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_ATPG", 12,
> +		    JHB100_SYS2CLK_PLL1),

The ATPG portion of the clock name is uppercase. Can this be lowercase
for consistency?

Brian

-- 
Brian Masney <bmasney@redhat.com>

