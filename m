Return-Path: <SRS0=n/Bj=25=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F907C33CA1
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 20:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6E2220643
	for <linux-clk@archiver.kernel.org>; Wed,  8 Jan 2020 20:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1578514688;
	bh=k29/a7uEuYqNAIhFsBFDfjAE0p9XzbeHTZjXgbV00jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dUfVEaTBoBIdc7rCQeKNsC31u97PtoGnI9NTFMVOjZYo8cnUG0snl1/SdjpL0c3ad
	 Cp0jl5h2I+l+Zb1/3MS7OHmiFq8QXXFSaCyN7zQVkylHPLVMpuXaWYN/HmB4Vmfn5d
	 DDl5kFilkjuIASltDI2ljkmEA1vUcYIfmdyOpJLY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbgAHUSH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Jan 2020 15:18:07 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46731 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgAHUSH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Jan 2020 15:18:07 -0500
Received: by mail-oi1-f195.google.com with SMTP id 13so1954334oij.13
        for <linux-clk@vger.kernel.org>; Wed, 08 Jan 2020 12:18:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UM9Yhyyn+nTPYkkQGog0oC/YJwVnBTJCjtlyMYqJ2Ow=;
        b=ucU+yooYDpoOevywun9Fw+c83NiBrlawFUiVOLqwJubU4FqFJckehwUdHvukMsJwHQ
         ymIpexNb82VMfUD+5Bu5Uv9OcAKvUeQU7lUI/or0dArdWtiEaZoVwKUKljOddxx2NFRb
         /9Z51PbuWLCr+82el5VjlvvnQTfSMfmS+moG1egSpp49uty2bMvWgzIY7B4lajyrGCdo
         NvY3SAnXiDWr4G6a1KHeWK4LwbyHV42j+pAiTmHDVJ7ungaqMAifQJ8VylAC45vsnZe4
         Kk7o8rpGeWQVyDhlws1uzfL5S9gXJvUNSX1PPxyyCRqVorSzYox40QSfHBJhrLdzZ/xi
         6xLw==
X-Gm-Message-State: APjAAAX4nBUjfaJ7ttrdAtOWN03y7E5SP5ut1whUyi4WkX8GBxLImF9u
        zszyfQkLhy8Fyeaa8w2/pA71crI=
X-Google-Smtp-Source: APXvYqzcfxZBNn4sxxyFpCsbXfa6ZIYGHuqrbGgWIwAH8CosGuRDxBjxxWylo2OMhkLv6sNbke74NA==
X-Received: by 2002:a54:4713:: with SMTP id k19mr302888oik.113.1578514681945;
        Wed, 08 Jan 2020 12:18:01 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x17sm1467059oix.18.2020.01.08.12.18.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 12:18:00 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 14:17:59 -0600
Date:   Wed, 8 Jan 2020 14:17:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-acpi@vger.kernel.org, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>,
        linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code
 check
Message-ID: <20200108201759.GA28519@bogus>
References: <20200106045833.1725-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon,  6 Jan 2020 13:58:33 +0900, Masahiro Yamada wrote:
> 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
> 
> The semantic patch that generates this commit is as follows:
> 
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> +PTR_ERR(ptr) == - error_code
> // </smpl>
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  crypto/af_alg.c                      | 2 +-
>  drivers/acpi/scan.c                  | 2 +-
>  drivers/char/hw_random/bcm2835-rng.c | 2 +-
>  drivers/char/hw_random/omap-rng.c    | 4 ++--
>  drivers/clk/clk.c                    | 2 +-
>  drivers/dma/mv_xor_v2.c              | 2 +-
>  drivers/gpio/gpiolib-devres.c        | 2 +-
>  drivers/gpio/gpiolib-of.c            | 8 ++++----
>  drivers/gpio/gpiolib.c               | 2 +-
>  drivers/i2c/busses/i2c-mv64xxx.c     | 5 ++---
>  drivers/i2c/busses/i2c-synquacer.c   | 2 +-
>  drivers/mtd/ubi/build.c              | 2 +-
>  drivers/of/device.c                  | 2 +-
>  drivers/pci/controller/pci-tegra.c   | 2 +-
>  drivers/phy/phy-core.c               | 4 ++--
>  drivers/spi/spi-orion.c              | 3 +--
>  drivers/video/fbdev/imxfb.c          | 2 +-
>  fs/ext4/super.c                      | 2 +-
>  fs/f2fs/node.c                       | 2 +-
>  fs/ocfs2/suballoc.c                  | 2 +-
>  fs/sysfs/group.c                     | 2 +-
>  net/core/dev.c                       | 2 +-
>  net/core/filter.c                    | 2 +-
>  net/xfrm/xfrm_policy.c               | 2 +-
>  sound/soc/codecs/ak4104.c            | 3 +--
>  sound/soc/codecs/cs4270.c            | 3 +--
>  sound/soc/codecs/tlv320aic32x4.c     | 6 ++----
>  sound/soc/sunxi/sun4i-spdif.c        | 2 +-
>  28 files changed, 35 insertions(+), 41 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
