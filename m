Return-Path: <SRS0=W7GY=NE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E3EC67863
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 08:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64CE920824
	for <linux-clk@archiver.kernel.org>; Wed, 24 Oct 2018 08:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pIdOmhiy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64CE920824
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbeJXR0B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Oct 2018 13:26:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54703 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbeJXR0A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Oct 2018 13:26:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id r63-v6so4512305wma.4
        for <linux-clk@vger.kernel.org>; Wed, 24 Oct 2018 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XBv6KqGIf71xyXRnMQYrzKLmuKH14/ChKXMZjZ3eXhg=;
        b=pIdOmhiytNqGY1viYBaD+wa730cuLSDcFI6Y7FPYd7XiX6TzYZN8lAXRVcuQ2poVbF
         XMTCcDMRaGeJBKzl4cgxXMmU6O7QXtWCDmllfILWuplVN78EMY7sHk+F7gQ5h3cUTmYF
         bOgIl3UEboWcJQ/CoZCGziag/OMgx6z5BWO6Zb2cKA2KdjhvGo9Tnehn/RsSBdJBRQXr
         VMZo4VZg8eTbK09bfWj9etv7O2Ip5bXVnTq/dMQdMs7ZJ812x5MJpE7OvZQz326NWOpi
         6oUq/l2ZV1UXEOIFvghSYI2Gy7unsZzDM65b517dUivAHDp1/I41eWfBzqssAgXC2KVV
         ELPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XBv6KqGIf71xyXRnMQYrzKLmuKH14/ChKXMZjZ3eXhg=;
        b=Jr9s/JznvNLFrY+x6CkdC2JsfD+UQrkY4WdW9q/bpBUOpSQpMAg/0TvZSusRlU5/EI
         fF3RQU9KvWd76OR2LsUYF2Vx7/tvQkajwdJlWxdZs6Mqr/5Q2p786eeQ1iqLmwbr+laR
         dDxEc9nKBT/XRZC3DvtK3elaKA8Ejxuvte7ZSG4NRO25WJvqJmNZvBzCegBgelLKEXC9
         6p2LIzsFQhVCjsIbRSfgYLRXsmuBClPBLlqWrPh1iEvzX4d5ig9JejRncXPccvrWLVSH
         ObuOBj24DWHKrYrurkjDgBXHe9xJIr+91qvaY7TI/WOv3XHJv35nIRiyXH78YXDM05fw
         rDKQ==
X-Gm-Message-State: AGRZ1gJSvgB9KwtlstRu4BPGGPzOzQl621dJ20hhMipXcyqhOH4ag5ze
        OXkQgmtcnF30tkgpLsAqrB4PQA==
X-Google-Smtp-Source: AJdET5faUMCU2fgXlITT1tjr3yXkb/P4QCBtu9H6/5eglaaqiGKyG6v4SXMhK8hSwGwtV0XiLc1JGQ==
X-Received: by 2002:a1c:1752:: with SMTP id 79-v6mr1730730wmx.145.1540371524476;
        Wed, 24 Oct 2018 01:58:44 -0700 (PDT)
Received: from boomer ([90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o201-v6sm4885975wmg.16.2018.10.24.01.58.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Oct 2018 01:58:43 -0700 (PDT)
Message-ID: <ca95948abd58876a23b2eb3e52b96124e9eed793.camel@baylibre.com>
Subject: Re: [PATCH v5 2/3] clk: meson: add DT documentation for emmc clock
 controller
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Yixun Lan <yixun.lan@amlogic.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Wed, 24 Oct 2018 10:58:42 +0200
In-Reply-To: <1539839245-13793-3-git-send-email-jianxin.pan@amlogic.com>
References: <1539839245-13793-1-git-send-email-jianxin.pan@amlogic.com>
         <1539839245-13793-3-git-send-email-jianxin.pan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2018-10-18 at 13:07 +0800, Jianxin Pan wrote:
> From: Yixun Lan <yixun.lan@amlogic.com>
> 
> Document the MMC sub clock controller driver, the potential consumer
> of this driver is MMC or NAND. Also add four clock bindings IDs which
> provided by this driver.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  .../devicetree/bindings/clock/amlogic,mmc-clkc.txt | 31 ++++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,mmc-clkc.h       | 17 ++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
>  create mode 100644 include/dt-bindings/clock/amlogic,mmc-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
> new file mode 100644
> index 0000000..9e6d343
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,mmc-clkc.txt
> @@ -0,0 +1,31 @@
> +* Amlogic MMC Sub Clock Controller Driver
> +
> +The Amlogic MMC clock controller generates and supplies clock to support
> +MMC and NAND controller
> +
> +Required Properties:
> +
> +- compatible: should be:
> +		"amlogic,gx-mmc-clkc"
> +		"amlogic,axg-mmc-clkc"
> +
> +- #clock-cells: should be 1.
> +- clocks: phandles to clocks corresponding to the clock-names property
> +- clock-names: list of parent clock names
> +	- "clkin0", "clkin1"
> +
> +Parent node should have the following properties :
> +- compatible: "amlogic,axg-mmc-clkc", "syscon".
> +- reg: base address and size of the MMC control register space.

I get why Stephen is confused by your description, I am too. The example
contradict the documentation.

The  documentation above says that the parent node should be a syscon with the
mmc register space.

But your example shows this in the node itself.

> +
> +Example: Clock controller node:
> +
> +sd_mmc_c_clkc: clock-controller@7000 {
> +	compatible = "amlogic,axg-mmc-clkc", "syscon";
> +	reg = <0x0 0x7000 0x0 0x4>;
> +	#clock-cells = <1>;
> +
> +	clock-names = "clkin0", "clkin1";
> +	clocks = <&clkc CLKID_SD_MMC_C_CLK0>,
> +		 <&clkc CLKID_FCLK_DIV2>;
> +};
> diff --git a/include/dt-bindings/clock/amlogic,mmc-clkc.h b/include/dt-bindings/clock/amlogic,mmc-clkc.h
> new file mode 100644
> index 0000000..162b949
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,mmc-clkc.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Meson MMC sub clock tree IDs
> + *
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> + */
> +
> +#ifndef __MMC_CLKC_H
> +#define __MMC_CLKC_H
> +
> +#define CLKID_MMC_DIV				1
> +#define CLKID_MMC_PHASE_CORE			2
> +#define CLKID_MMC_PHASE_TX			3
> +#define CLKID_MMC_PHASE_RX			4
> +
> +#endif


