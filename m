Return-Path: <SRS0=NsDS=XS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122FFC04EBF
	for <linux-clk@archiver.kernel.org>; Mon, 23 Sep 2019 10:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D470420820
	for <linux-clk@archiver.kernel.org>; Mon, 23 Sep 2019 10:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WC9lw/G4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436802AbfIWKGZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Sep 2019 06:06:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35610 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436762AbfIWKGZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Sep 2019 06:06:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id y21so8609876wmi.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2019 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=efP++C+n842ztdoruWHDsU5t7UYA9AhqrH+sQr0d664=;
        b=WC9lw/G4j9t7XfO7TyQQ+hQwJ2ffDW97T4DSfot/iXZ28CL777HiBBFAXG72dy3Xp/
         qBCUZFBu3ifqNu7HsTfJAg1/QfIzikeAXdne7P0iP6wKqE7joi4zx56TH6xqHy51C5e+
         53pQbs3zcWxdoKDXbZcmIsdLLGblPgAN7jVTknzeleIIR6dGZxC0YVniDjjFnvt419YH
         YBvdsaqx4r0HU0oLhLTwO0NzXSZF5KA+nEn3DOxdEQbJZ+6hsPxnWj6z+1Y6JA++yGcH
         WpF9gYtNUAoOcabk2M3GM4Exu56zcPS5sOpzP4PmmGXJomuH4VHZuA14bTmGPxLv4TsE
         LXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=efP++C+n842ztdoruWHDsU5t7UYA9AhqrH+sQr0d664=;
        b=MqMvGsuwewKKWCCha12PhEi4e1gah40NkOIpd0xaizbfu5jzGVEk80V7KzqgRBmm28
         x2UQPL4eJZAx+0DvYEp+He43uZ9iUIHI3oCEjp5hm3TbfSC4LGG+Q0v43m9ukpT5oPoC
         b84x1WXrub4F3iQOt8uf/5YDjRlRA/gPgByRfw3JVX951kIRjoMSpIo+PFaHeCw5mEer
         L5OSqdvbsyds8LeqIc0ZFzBqfOP+NHmZnR8GQGAJD3B45B5CXdLke4lli/DwA7gzVVKj
         M4nG863XPV4m+SQspp5eDPLrg15V52DApyRyS/7J8Dxl1K+1YV0VD/4U+bhWKyNa5h3a
         aeVw==
X-Gm-Message-State: APjAAAWgYigdYMcguKeBGsQvTzm62NLtEZeN+50Rz3dFRUt+Sw7oq8xW
        825DfeVXmt5Jgd36+w26amxBFg==
X-Google-Smtp-Source: APXvYqz2luNiHMrLwslAQi441uViJJb8E2s1paCFVoS208d5LL0ax7NHmxfoN7H9JcWe1ml1uW1Kiw==
X-Received: by 2002:a1c:6841:: with SMTP id d62mr13297447wmc.48.1569233182680;
        Mon, 23 Sep 2019 03:06:22 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t1sm9644294wrn.57.2019.09.23.03.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 03:06:22 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        khilman@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Date:   Mon, 23 Sep 2019 12:06:21 +0200
Message-ID: <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 21 Sep 2019 at 17:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
> registers. This series:
> - adds support for this DDR clock controller (patches 0 and 1)
> - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)

Have you been able to validate somehow that DDR rate calculated by CCF
is the actual rate that gets to the audio clocks ?

While I understand the interest for completeness, I suspect the having
the DDR clock as an audio parent was just for debugging purpose. IOW,
I'm not sure if adding this parent is useful to an actual audio use
case. As far as audio would be concerned, I think we are better of
without this parent.

> - adds the DDR clock controller to meson8.dtsi and meson8b.dtsi
>

Could you please separate the driver and DT series in the future ? Those
take different paths and are meant for different maintainers.

> Special thanks go out to Alexandre Mergnat for switching the Amlogic
> clock drivers over to parent_hws and parent_data. That made this series
> a lot easier for me!
>
> This series depends on my other series from [0]:
> "provide the XTAL clock via OF on Meson8/8b/8m2"
>
>
> [0] https://patchwork.kernel.org/cover/11155515/
>
>
> Martin Blumenstingl (6):
>   dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
>     binding
>   clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
>   clk: meson: meson8b: use of_clk_hw_register to register the clocks
>   clk: meson: meson8b: add the ddr_pll input for the audio clocks
>   ARM: dts: meson8: add the DDR clock controller
>   ARM: dts: meson8b: add the DDR clock controller
>
>  .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
>  arch/arm/boot/dts/meson8.dtsi                 |  13 +-
>  arch/arm/boot/dts/meson8b.dtsi                |  13 +-
>  drivers/clk/meson/Makefile                    |   2 +-
>  drivers/clk/meson/meson8-ddr.c                | 153 ++++++++++++++++++
>  drivers/clk/meson/meson8b.c                   |  36 ++---
>  include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
>  7 files changed, 245 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 drivers/clk/meson/meson8-ddr.c
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h
>
> -- 
> 2.23.0
