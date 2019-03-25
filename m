Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E725C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 09:54:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6779920879
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 09:54:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OFeRfTYN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbfCYJyx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 05:54:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38620 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730330AbfCYJyw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 05:54:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id k11so1908357wro.5
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2019 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=aIjqM24c2LO+vY7cm+Vdv0ng2cthwTTr3CbZK+Vjb4E=;
        b=OFeRfTYN8zmSc9/yXPtt3achkb22KSydKR0P+401Jxi5pyFw3BDQBTnZAH+3AG4LKF
         +wRCH0WaDitz4htAWPG28vMhVhlbvHDLCBQ+y24/5uxQlG6lF1b/NU/5KpTehMRsE28+
         RsBAW/AAlCuhmyW2mAr4XdTDuUq4woAWYmPdG21C+A/s32O87wGdz79DJymsS6FqqKZ4
         TbhB3zAoRK4ZZCc0A0JA1Ae5TZSjBoPc8QcnV5a9ZoNSRyJEGe2w1TXb6uaf4cQwOab1
         q+j/T+SdqzZkcImRHpcnJNlBOP6SY5/nkKAcvGTM67aSo3SULUg4yziiUXc8+SxPMKmP
         Mgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aIjqM24c2LO+vY7cm+Vdv0ng2cthwTTr3CbZK+Vjb4E=;
        b=ebhc03e7JmPOhxJXR9KdcWVjQqkIU5OFXmr4wsPsBhUtiPpX9c05HSW+WLW/FHn68R
         ju0o1LJAz8IljSAmcAS9x9PXae+RdhPlKywIkSHI5vRvhqqxHDsQQA7l6VFERUzGqhwO
         rIuoEVDt6qIxN7P0TlXga9WcqLZolKSeu96OVZXG3TFFLVvx1aXDTaS2BeoLd3gn7BlC
         pwKNnf88jgtSPzv7sbZoqJd6YuVnmo+ppb95x5OHVLQ1iYE912BqgiMd+olyr7qcacOF
         cuWDXIAe3Zvz5bxShe9EGJb/vkxUQTQ4yRMgjBZkLirsK74VfKoU3onPdIMqepVXgnxM
         r1/A==
X-Gm-Message-State: APjAAAWYxHLbSA2mzYUkcOR598cn0sjtr2ITINJrp3Llac+5ph9V8DA4
        /7FWYwi4AunzVMYj8+1eSC6Sig==
X-Google-Smtp-Source: APXvYqwCctG5WqwtJOCuczYlgOhzvTAx5K7iS6oR8G78Hc8qzc66b0TY1jTBOZBV4UIhm2PZF84D+A==
X-Received: by 2002:adf:f451:: with SMTP id f17mr11398539wrp.272.1553507690860;
        Mon, 25 Mar 2019 02:54:50 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id f128sm29137484wme.28.2019.03.25.02.54.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 25 Mar 2019 02:54:50 -0700 (PDT)
Message-ID: <2cdcecddbadc41f6e94876c519153f071738f272.camel@baylibre.com>
Subject: Re: [PATCH v2 0/4] clk: meson8b: add the VPU clock tree
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 25 Mar 2019 10:54:48 +0100
In-Reply-To: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
References: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 2019-03-24 at 16:11 +0100, Martin Blumenstingl wrote:
> This adds the VPU clock tree for Meson8, Meson8b and Meson8m2.
> The VPU clock tree is slightly different on all three SoCs. The details
> are explained in patch #4.
> 
> Meson8m2 requires the previously unsupported "gp_pll" PLL. This PLL only
> exists on Meson8m2 - Meson8 and Meson8b don't have it.
> A separate clk_hw_onecell_data is introduced for Meson8m2 (using the
> compatible string which is already available) to account for this SoC
> specific clock setup.
> 
> dependencies:
> This series is meant to be applied on top of my other patch from [0]:
>   dt-bindings: clock: meson8b: drop the "ABP" clock definition
> 
> changes since v1 at [1]:
> - fixed typo in the subject of patch #2 (spotted by Neil)
> - collected Reviewed-by tags from Neil (thank you!)
> 
> 
> [0] https://patchwork.kernel.org/patch/10860387/
> [1] https://patchwork.kernel.org/cover/10860401/
> 
> 
> Martin Blumenstingl (4):
>   dt-bindings: clock: meson8b: export the VPU clock
>   clk: meson: meson8b: use a separate clock table for Meson8m2
>   clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
>   clk: meson: meson8b: add the VPU clock trees
> 
>  drivers/clk/meson/meson8b.c              | 422 ++++++++++++++++++++++-
>  drivers/clk/meson/meson8b.h              |  12 +-
>  include/dt-bindings/clock/meson8b-clkc.h |   1 +
>  3 files changed, 433 insertions(+), 2 deletions(-)
> 

Looks sane.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

