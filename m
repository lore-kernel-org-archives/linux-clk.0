Return-Path: <SRS0=1MK8=ZV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B19C43215
	for <linux-clk@archiver.kernel.org>; Fri, 29 Nov 2019 15:28:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C986F2176D
	for <linux-clk@archiver.kernel.org>; Fri, 29 Nov 2019 15:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fybemh1f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfK2P2d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Nov 2019 10:28:33 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40096 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfK2P2d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Nov 2019 10:28:33 -0500
Received: by mail-wr1-f67.google.com with SMTP id c14so11060818wrn.7
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2019 07:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=QBYK1E+SFEUtR4nuF0Hq1/Zl0vxT8rcgdq12kebEYCw=;
        b=fybemh1fl5FELIMmoJZnWKoGU6gkjl55CTvBtsMkTjKBe9+9q5azX3vK7CrnWlD4+m
         ATTa/+yYn808n2UnMe0zSU27V/ALJzcfyewxcwoGDLMpE+3nRgHaRQI6DA94AukXUiJB
         hjsqV4+jtcmEmj/BDh8dLZ/DRjse6sDrT0bCl7ecTrNNyYBw6BwzfFzs7Ti5p0v23MnE
         +fDRYLnLSJ559SpDXDxTsKfDHmPdDwfAe4/MCFncI1Wzvl2k8yyzbCe3Y5158WP0Gpt4
         xntmd2a+Rl7Oonw3WrC2tR2S9zGYEskSnvLdMeDrEhklUgWbep0gTuvPx0qYaX4l87Lz
         Gxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=QBYK1E+SFEUtR4nuF0Hq1/Zl0vxT8rcgdq12kebEYCw=;
        b=dnX53ggtiY3FFltbqW1r7WSqHlNdPA9mn4KRPHENeJ6WhzXf6BJchGPt6thFMtoyVE
         RePEaKaOf6gadLyz023sbKqL6RG5FoScNB9ZNAnHkS048soYW/jH2glUuMrxU4XAKPE+
         0M+t4ZqiD+ujfIc3dpgfgFEZpgUHWy4Ex+/3lQcrXGX+IsJ6y4sBMpZeD/xErd65aunj
         VOIOsjmfsA/ofhnXoO0zPrKgGk7b3gsn7BVRNsJ4pNLHb9Df1fD6aiKsGT960bQIo8PE
         0HCrwcdWKaji/DdbJ8X8K0/hqDRdNaHUQOcXxOpQ0dNyR9PD4ex1XS/1CZrD6JocPEwJ
         Ry4w==
X-Gm-Message-State: APjAAAUHb1PbGvnE/WKDAg2dbCYuhsG7CSoaavnMKypfE7TN4MvIFrB1
        sNl9rUxdbCCUevGkagVwKKVDFg==
X-Google-Smtp-Source: APXvYqwp522ZQItIPDw0UZZeNpADWsIPr6wHnrqJzszsiD5Ngr1SfU1KzHkCvXFfBFKhk2oWIkEzYw==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr10405744wru.6.1575041310867;
        Fri, 29 Nov 2019 07:28:30 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id m3sm27328570wrw.20.2019.11.29.07.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 07:28:30 -0800 (PST)
References: <20191129144605.182774-1-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Jian Hu <jian.hu@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "Rob Herring" <robh@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Chandle Zou <chandle.zou@amlogic.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/7] add Amlogic A1 clock controller driver
In-reply-to: <20191129144605.182774-1-jian.hu@amlogic.com>
Date:   Fri, 29 Nov 2019 16:28:29 +0100
Message-ID: <1jwobi7lcy.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Fri 29 Nov 2019 at 15:45, Jian Hu <jian.hu@amlogic.com> wrote:

> add support for Amlogic A1 clock driver, the clock includes 
> three parts: peripheral clocks, pll clocks, CPU clocks.
> sys pll and CPU clocks will be sent in next patch.
>
> Changes since v1 at [2]:

v2 or v1 ??

> -add probe function for A1
> -seperate the clock driver into two patch
> -change some clock flags and ops
> -add support for a1 PLL ops
> -add A1 clock node
>
> Changes since v1 at [1]:
> -place A1 config alphabetically
> -add actual reason for RO ops, CLK_IS_CRITICAL, CLK_IGNORE_UNUSED
> -separate the driver into two driver: peripheral and pll driver
> -delete CLK_IGNORE_UNUSED flag for pwm b/c/d/e/f clock, dsp clock
> -delete the change in Kconfig.platforms, address to Kevin alone
> -remove the useless comments
> -modify the meson pll driver to support A1 PLLs
>
> [1] https://lkml.kernel.org/r/1569411888-98116-1-git-send-email-jian.hu@amlogic.com
> [2] https://lkml.kernel.org/r/1571382865-41978-1-git-send-email-jian.hu@amlogic.com
>
> Jian Hu (7):
>   dt-bindings: clock: meson: add A1 PLL clock controller bindings
>   clk: meson: add support for A1 PLL clock ops
>   clk: meson: eeclk: refactor eeclk common driver to support A1
>   clk: meson: a1: add support for Amlogic A1 PLL clock driver
>   dt-bindings: clock: meson: add A1 peripheral clock controller bindings
>   clk: meson: a1: add support for Amlogic A1 Peripheral clock driver
>   arm64: dts: meson: add A1 PLL and periphs clock controller

The arm64 is for the DT maintainer. Please send it separately after this
series is applied (if it gets applied)

> Please fix the underlying issue, then you can post your series again.

This was a comment on your v2. Did you fix the orphan/ordering issue ?
If you did, you probably should mention it here.
If you did not, I'm probably not going to review this further until you do.

>
>  .../bindings/clock/amlogic,a1-clkc.yaml       |   70 +
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   |   56 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   26 +
>  drivers/clk/meson/Kconfig                     |   20 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/a1-pll.c                    |  334 +++
>  drivers/clk/meson/a1-pll.h                    |   56 +
>  drivers/clk/meson/a1.c                        | 2309 +++++++++++++++++
>  drivers/clk/meson/a1.h                        |  120 +
>  drivers/clk/meson/clk-pll.c                   |   21 +
>  drivers/clk/meson/clk-pll.h                   |    1 +
>  drivers/clk/meson/meson-eeclk.c               |   59 +-
>  drivers/clk/meson/meson-eeclk.h               |    2 +
>  drivers/clk/meson/parm.h                      |    1 +
>  include/dt-bindings/clock/a1-clkc.h           |   98 +
>  include/dt-bindings/clock/a1-pll-clkc.h       |   16 +
>  16 files changed, 3181 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/a1-pll.c
>  create mode 100644 drivers/clk/meson/a1-pll.h
>  create mode 100644 drivers/clk/meson/a1.c
>  create mode 100644 drivers/clk/meson/a1.h
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h

