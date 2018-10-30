Return-Path: <SRS0=0weS=NK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE11C2BC61
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 22:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B4332081B
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 22:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4332081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbeJaHI3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Oct 2018 03:08:29 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41695 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbeJaHI3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Oct 2018 03:08:29 -0400
Received: by mail-oi1-f194.google.com with SMTP id i10-v6so11912289oik.8;
        Tue, 30 Oct 2018 15:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uM3myVGgSFB2qM6FwDJoxsvHAChutm7dwBmgdOmDcKU=;
        b=XbzdjiVZDEhdlntq24ttdpF1KnAibmPgKkibSDTAd5rb9tkioZFbgWoZA+GWiNZwHm
         oU1NCz/I3fUgODxqfVqJkqOQyRxLM+TZZ1FdxXRqHakqbCPQqwzgot28Cw0GR9JK8Sd+
         YqkpXN5qyIv2uebWDshcIA9apQ6QOalWgGcnjuU+iwPRrdlRq+GiDSdVYB9eNAofDOm/
         iEquV28p7rLw9stDpG2+/yiumQ2Ze2Ft/JrmPoy0ir3kRuIHJhwcaAm0b47Eu/E2emet
         4D8Fd3vZi0w3IUlAn4xUu9ksw9AK+mSjwx5ORdwBUKuh70/d/vvW+KjBj5APnwmwp9Fu
         U+mg==
X-Gm-Message-State: AGRZ1gJwBiG7ETgam18abvs4typebNfjXmOxvbTgYX14CN3mBb7BSbws
        oD0ao6mDaGn7lZ5MVaPcVw==
X-Google-Smtp-Source: AJdET5dnEcDHcNE4rh+a5tJuPKjwNH3RxN4Fk2vpHNgNp1yk/HMGGGwxsXJ6Yh33R9vN+h925iuGVg==
X-Received: by 2002:aca:e8ca:: with SMTP id f193-v6mr356919oih.12.1540937592505;
        Tue, 30 Oct 2018 15:13:12 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g9sm2193823otj.13.2018.10.30.15.13.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Oct 2018 15:13:11 -0700 (PDT)
Date:   Tue, 30 Oct 2018 17:13:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     narmstrong@baylibre.com, jbrunet@baylibre.com,
        mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Meson8/Meson8b: introduce a HHI syscon node
Message-ID: <20181030221310.GA22640@bogus>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Oct 28, 2018 at 01:08:56PM +0100, Martin Blumenstingl wrote:
> The Meson8/Meson8b/Meson8m2 SoCs are suffering from a similar problem
> as the GXBB/GXL/GXM SoCs (see the GX series from Jerome: [0]):
> There is a register area called "HHI" which is used for multiple IP
> blocks of the SoC:
> - the system clock controller
> - a few reset lines (there is a separate reset controller, these reset
>   lines are not part of the other reset controller). this reset
>   controller is currently implemented in the clock controller driver
> - a HDMI controller

Does this have it's own clocks, resets or other resources?

> - temperature sensor calibration data (by "data" I really mean data,
>   the ADC driver has four bits for the TSC data in it's own register
>   space, however on Meson8b and Meson8m2 there is a fifth TSC bit which
>   is stored in the HHI register area)
> 
> The first three could be implemented with a single node (either in one
> big driver, or using a MFD driver which would register function-
> specific drivers).
> However, the TSC data is a big problem, because the ADC has it's own
> set of registers but needs to write one bit in the HHI register area.

Generally, that would be solved with a phandle to the HHI and maybe an 
offset cell in the ADC node. I don't see why that's a big problem.

> 
> NOTE: this series has multiple dependencies:
> - the clock controller changes depend "meson8b: add the CPU_DIV16 clock
>   for the ARM TWD" as well as "meson8b: register the clock controller
>   early" [2]
> - the dts changes depend on "fix clock controller register size on
>   Meson8/Meson8b" [3]
> 
> 
> Changes since v1 at [4]:
> - added a "amlogic,meson-hhi-sysctrl" compatible to the syscon node
>   (which is the parent of the clock controller) in patch #1 and #3
> - added Neil's Acked-by
> - rebased on top of clk-meson's meson-clk-4.20-1 tag and my other
>   series "Meson8b: fixes for the cpu_scale_div clock" from [5]
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-March/006733.html
> [1] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007890.html
> [2] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007900.html
> [3] http://lists.infradead.org/pipermail/linux-amlogic/2018-July/007897.html
> [4] https://patchwork.kernel.org/cover/10539051/
> [5] https://patchwork.kernel.org/cover/10617617/
> 
> 
> Martin Blumenstingl (3):
>   dt-bindings: clock: meson8b: use the registers from the HHI syscon
>   clk: meson: meson8b: use the HHI syscon if available
>   ARM: dts: meson: switch the clock controller to the HHI register area
> 
>  .../bindings/clock/amlogic,meson8b-clkc.txt   | 13 ++++------
>  arch/arm/boot/dts/meson.dtsi                  |  7 ++++++
>  arch/arm/boot/dts/meson8.dtsi                 | 15 ++++++------
>  arch/arm/boot/dts/meson8b.dtsi                | 15 ++++++------
>  drivers/clk/meson/meson8b.c                   | 24 ++++++++++++-------
>  5 files changed, 43 insertions(+), 31 deletions(-)
> 
> -- 
> 2.19.1
> 
