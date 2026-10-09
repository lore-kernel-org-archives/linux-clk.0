Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D251A146
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570600; cv=none; b=h4Op0tVrDu7MCw75tlYJTt5gk9WgE6CpfaJtnAA4DE1K60LNBpUC/yRt3OYX6j8Re+HCgBO5AFd+moUaXIMdg4zF4fy4jp/RAbUpXuDP9nIkizrg2ArrvEzRFUsBktRrEaDOqff1ygmTKh0hKbRCHcSopJEpbTKYbKGcYzaeIao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570600; c=relaxed/simple;
	bh=809ruaTMybxoBOwSxW5LNdKvnaeznfCg43/YlBzIRDs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=bSnWcW5k/DXaWVH/XEt0WTzyhPvhBp6QFOH+USKL0Uir5Jj/0WigG09g6JK2hoQoqEjDHPwysQayyx89KOVHnNM4yEWci415xObB5qE0HSPGvPTBXEPPpyJu9cuPE+Tx4yIr1UQTB9gkdOxtwu4IBfxvAoDAlW4caH/wkrbKkmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=olu8H1ZP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="olu8H1ZP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ff680331aso1211555e9.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570589; x=1792175389; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=;
        b=olu8H1ZP2F9ofx8bANTSZ/xbDwAf/R9DqO+PpJjuN/+ah3QNpCe2FZ6MbJ7rzLb+fW
         bmC2XdNtFNVqdX7oSLwg+cgFoA37PmlXrcgsVNjyVCzz56IFnDQESpyPsNiG8VRdxGH2
         H5CNS0QkD63LgLBDZzXybnyBrzaOhcHBv3ICRYAGGfActagZGlwrIPBkB4XiV35rEq88
         gSRMHQCSU6Ww2L7ReP2cMgn6tPyahzjXUJ9dfymBrlvuCDIAIMn7+sO9YNNPhsD/hQMu
         FZoDsV2B2pG60y+OZkjjCVINFXyPjE8fWIMxpkgS/j55cnV3rhc3p8ZExonea0ocF08y
         EvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570589; x=1792175389;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=;
        b=GAQlcObnP/xa49O8v6qZ/6ZcERdj6E34j02aKqEGBAx4XUtlonUDNVeO9hi/M4eEHr
         iKD2JHyHOPFwY6fo5RlPF1ABYs4qFROreoOmZk5yu9dUGjN1jt76knPMGT9QOoJdo7X6
         jk9No6vltVsAqWkWSkRULS2qWTwndzaXWkZaXFSUkCVQVjjJkCmyixYBbZ63/0WIg+vL
         rajrBf+E7UENuNLU+686PVnkzUD4JQwJ7HhHudQkirhQ9XwAr+gYQSVfP9m0trQwl2Es
         qBbqqFfKMrh1C1cov35PzpimwqiXf8XILLnHJE2clXE25mU1Bp8Xyrr4EMAgxO/u+u4J
         C9bw==
X-Forwarded-Encrypted: i=1; AKwUvBzrTHIVVQR990gX2bDHNBm92aLmqZnP8baIups+Z46PSZC1s6sJVxkQw8UJx+KnCLOvgNOMMK86ko0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXjSPjCElYFBdRmmQ9L8bp2A2XOu6c+iOh0rbSMP4ZvyYlqiC5
	qkn1miEY4bbB7GTEWtEXTrV4NvhyuZrEt/XMuziXoKVZuStY69PiF1RDK5RlKoyCz+M=
X-Gm-Gg: AYBFou1oybhbz+sgFjDs3L5He2V4qY+WTkye666vUw616w1EC2sA756rpL71JO7aDdE
	EbqjmkpNAxTKVW632nAZ4o3nOx5LBTOtHF6Tqr9HM+xXPRtQRZHx7s8n8NCFbgFefWOmZDqut/m
	1m4tNE4l/kUV6uCwpZrNuTUy2SWhS46UP4jPhUjSCz8nTS3a0OHcofJ56GV/UOPdjDrnFnJ5M0H
	+dHkTEgqUPkArrmmT9VtlWkCaO7c3RR0Rn5PhdES3iSz0jmWUSFeo0vr8UJytRo9Uw/IDr9h/P8
	9gCXkVJ6IFgOE2Ddmn27zkDF0VZvvuf0Rg3MTpMr3IhXicbElar8HxQx5VREumGesSRtZXHYbfc
	OMDySiWNpeazMmRMIlx7BKGhvPRE3w+VcL6Gz81tEBISrs94ga2qhUa6qBKG8r+RU9rsnIj6laP
	eS2ic+UiZxkUvTIJwzPMu2mkwAKrXUpsRUrazOaQA3oSfTxauDO7R3QXYezHEJJP22UpygJgrSC
	KVwU5EnB8Nf0FcGEA==
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id 5b1f17b1804b1-4a18e4b15e5mr55128945e9.35.1791570589461;
        Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm114582245e9.9.2026.10.09.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-11-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-11-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057525.266328.2342228871690409432.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=809ruaTMybxoBOwSxW5LNdKvnaeznfCg43/YlBzIRDs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaalPH3NE2e0yVH3ywbj/cU+LJf2Wv+Lbl9w5tQLk
 95SgX19HaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIq16GP7zHCkMuaij6vE4R
 b+Ccd8/F7X+5hcDml62ex02ePJoewMjwT33THh+p0KV5z6X4exWsLCetKYj4Unk0aG+CsF1j3Bo
 eRgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 52d5d1b18104..e8d9017098d3 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -9,3 +9,4 @@ clk-rtk-y += freq_table.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
>  obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
> new file mode 100644
> index 000000000000..cd520c6e1259
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_S_CLK_MAX	5
> +
> +static RTK_CLK_REGMAP_GATE(clk_en_usb_p4, "clk_sys", 0, 0x8c, 0, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_usb_p3, "clk_sys", 0, 0x8c, 1, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x8c, 2, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbusrx_sys, "clk_sys", 0, 0x8c, 3, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbustx_sys, "clk_sys", 0, 0x8c, 4, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbus_sys, "clk_sys", 0, 0x8c, 5, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbus_osc, "osc27m", 0, 0x8c, 6, 0);

You are requesting your input by global here. This is wrong.
DT names are stable, internal CCF are not. You should not rely on this.

Either give it a name in your bindings and use fw_name or use index

Same applies to the other controller

-- 
Jerome

