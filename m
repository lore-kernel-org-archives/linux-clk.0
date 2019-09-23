Return-Path: <SRS0=NsDS=XS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BACC3A5A6
	for <linux-clk@archiver.kernel.org>; Mon, 23 Sep 2019 09:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DB0E20673
	for <linux-clk@archiver.kernel.org>; Mon, 23 Sep 2019 09:29:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i37B/Zfl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391582AbfIWJ3G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Sep 2019 05:29:06 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37754 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390883AbfIWJ3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Sep 2019 05:29:05 -0400
Received: by mail-wm1-f65.google.com with SMTP id f22so1311604wmc.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Sep 2019 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=GEpINich1yHe3dgZoPsu7jVZJFRHWW9gHMhxo+QabyU=;
        b=i37B/ZflJfkoKuajMXjNBpIfwnDxpv2aCG8IlKdAD2ERPODOixf2OFXEjZMczk7Rbg
         uQLUHo8E1xjO/JL9H0/3eszTjCSzplCQRPgPQnJFhFCFiLcxFh48ai1/KWwFfNWe0vZB
         2nrg6RtcVBh9xq04+xtpyxGbxKhLWFyJ4PXvghuAvXqJK4fpELjI22nwS8Br6ZJFSEqI
         0Ob7+mzq5cLJcSN5kyfDi7lNDh8b0gVoLhy9eaKKdUmbIvj+hR6PfTnwpEU9Y7Jf++bk
         5cVo/4ER7i0Dsz5syGQl5IQvxwpNc1yKuo5BPmbMtu+q2DyJIZpwObIkNpcSG+Gsvx+B
         0qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=GEpINich1yHe3dgZoPsu7jVZJFRHWW9gHMhxo+QabyU=;
        b=N0Ag2hm/WskWGZB06He1rv8nFiZYcuxtc74ldmXN9AdGPBDZ5MZmC2H0tDHI7/Mix5
         Vs5sXYUyYMpJlcrKD+SeMEkOIfvbYIyrQzgeFpXyGRdVhwQNuIFhn5wxDnHnsvLdoccJ
         Ec4uJpQzYj9naTbjK9oIW3gtVGUfWViCKYgmskk3ELSW+Jc85zcyzetQr05zq1ivFev5
         oTPwli5IeAeXXxtrLb8xIFLWE3vuLE1OLNUQOTxeZrtsq3V86cUtioCKV1XJ1TYO8UqJ
         V6RhUopfxYopKfIR8UY7tiGut5dG/9oU9CiufKJWLz2xX5q3lZuTNLGiDMum2xaoVaDE
         8RSg==
X-Gm-Message-State: APjAAAWs6RMyZccea+ZeS8nBfMY+dUoSv2vrq6TpNOKE2fimjoXpqk/s
        dWXxm3QaPx+YbJYu7EWcSPRm3w==
X-Google-Smtp-Source: APXvYqzJCTFPvn4OkSp1B7p5RsJXP7ouCiApbSz9+KpAzUBc/BCRGheeUmLPmjYjv5eRZC9qVVnXRA==
X-Received: by 2002:a1c:4384:: with SMTP id q126mr14214521wma.153.1569230943323;
        Mon, 23 Sep 2019 02:29:03 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b194sm18418427wmg.46.2019.09.23.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 02:29:02 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        khilman@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
In-Reply-To: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
Date:   Mon, 23 Sep 2019 11:29:01 +0200
Message-ID: <1jzhivs6n6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> So far the HHI clock controller has been providing the XTAL clock on
> Amlogic Meson8/Meson8b/Meson8m2 SoCs.
> This is not correct because the XTAL is actually a crystal on the
> boards and the SoC has a dedicated input for it.
>
> This updates the dt-bindings of the HHI clock controller and defines
> a fixed-clock in meson.dtsi (along with switching everything over to
> use this clock).
> The clock driver needs three updates to use this:
> - patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
>   the explicit reference to CLKID_XTAL while at the same time making
>   the code much easier (thanks to Neil for providing this new method
>   as part of the G12A CPU clock bringup!)
> - patch #3 ensures that the clock driver doesn't rely on it's internal
>   XTAL clock while not losing support for older .dtbs that don't have
>   the XTAL clock input yet
> - with patch #4 the clock controller's own XTAL clock is not registered
>   anymore when a clock input is provided via OF
>
> This series is a functional no-op. It's main goal is to better represent
> how the actual hardware looks like.

I'm a bit unsure about this series.

On one hand, I totally agree with you ... having the xtal in DT is the
right way to do it ... when done from the start

On the other hand, things have been this way for years, they are working
and going for xtal in DT does not solve any pending issue. Doing this
means adding complexity in the driver to support both methods. It is
also quite a significant change in DT :/

I'll defer this one to Kevin

>
>
> Martin Blumenstingl (5):
>   dt-bindings: clock: meson8b: add the clock inputs
>   clk: meson: meson8b: use clk_hw_set_parent in the CPU clock notifier
>   clk: meson: meson8b: change references to the XTAL clock to use the
>     name
>   clk: meson: meson8b: don't register the XTAL clock when provided via
>     OF
>   ARM: dts: meson: provide the XTAL clock using a fixed-clock
>
>  .../bindings/clock/amlogic,meson8b-clkc.txt   |   5 +
>  arch/arm/boot/dts/meson.dtsi                  |   7 ++
>  arch/arm/boot/dts/meson6.dtsi                 |   7 --
>  arch/arm/boot/dts/meson8.dtsi                 |  15 +--
>  arch/arm/boot/dts/meson8b-ec100.dts           |   2 +-
>  arch/arm/boot/dts/meson8b-mxq.dts             |   2 +-
>  arch/arm/boot/dts/meson8b-odroidc1.dts        |   2 +-
>  arch/arm/boot/dts/meson8b.dtsi                |  15 +--
>  drivers/clk/meson/meson8b.c                   | 106 +++++++++---------
>  9 files changed, 87 insertions(+), 74 deletions(-)
>
> -- 
> 2.23.0
