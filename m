Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85128C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:58:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B036214C5
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OhcedHL/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B036214C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbeIZQKM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 12:10:12 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34206 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbeIZQKM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 12:10:12 -0400
Received: by mail-wr1-f66.google.com with SMTP id t15so18426780wrx.1
        for <linux-clk@vger.kernel.org>; Wed, 26 Sep 2018 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EpBkYQes5v2ZXRz9ObcXfv9A6MvzAO55GjZKvUfhW2E=;
        b=OhcedHL/AReKF/uzUROfS2wOO34Bi6H19/TnlB6A15iydJ7hI5dxhUQvwo2YeF6G4J
         ZY4DOhHYn7FINQvoeLPKCXL/JnaxNcitX6VJtGkGGlubczEBEn/p2ahj84OXeM9uELHT
         uK/UlOeZZDCfXZDiFjV7a3gzsOOMdmAyKD37cvNxByNwsSGTk7q5utS2A59oD8L7nRwm
         9r+lC8UUuJq3ivOJAVaoAoiZJcmQDs1UQ+tpAcPt5S6uF4tSGZY8LEcmHYA/Q5zBdDzZ
         HfOVzzY41Jztw4P3cpPsJCUqFxvr+onF694Gilnrx9t1tSOftqioKekfJi2h7p+B3Tm2
         0Zkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EpBkYQes5v2ZXRz9ObcXfv9A6MvzAO55GjZKvUfhW2E=;
        b=S02os9bAvyrHwgzKwZzoXsNkM6ui9z6DjbRAx1wk5OQKMvjRtPEtxokIF22BDA0BLG
         XNDAzi5opBS5Q8VNvBGQXmbCe4I/7hqICMB++cQGbwXdhvfJv8VXRIlkqvO6B1Y+BTjL
         BKedEmPn3npolWJtuff28BGFEecgBB8Wtyi0m/3s/zL2eu7xbDtaf6WB+iH5+GEJHe06
         D2JUJZFmJaeD4YwHNz2PztISdnQi18oGXiFqrSCazGDLrQxERhfdTOFeJgEV2k9e9Hou
         biRkKJgiKey78oOPiPeYB6sDSHyMM+PJBe9pkQynQS5ccjTgql2MdBq9VydIbDxmw5WI
         WmXg==
X-Gm-Message-State: ABuFfogcvUAC9/3cr7Fgru4Bleiri/QVvqvT1QxKCmLtuSUsDHDI4mxs
        M1IJCIFU+V2J26dW4j6C4S3yXw==
X-Google-Smtp-Source: ACcGV61LdXDfTd6Y+FfDEIQMZuUxs//32GSH2/hO0grMSG6qjE/2Xs/0A9mueYCaBeQIe/jp/iODxA==
X-Received: by 2002:a5d:6a46:: with SMTP id t6-v6mr4276881wrw.192.1537955880637;
        Wed, 26 Sep 2018 02:58:00 -0700 (PDT)
Received: from boomer ([2a00:8c40:243:232:9287:a644:860c:5a1b])
        by smtp.gmail.com with ESMTPSA id z3-v6sm2485599wrh.49.2018.09.26.02.57.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 02:57:59 -0700 (PDT)
Message-ID: <712835e0336389d9d8c360bf3dec608a44ef84d0.camel@baylibre.com>
Subject: Re: [PATCH v2 0/2] meson8b: register the clock controller early
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        sboyd@kernel.org
Cc:     mturquette@baylibre.com, carlo@caione.org, khilman@baylibre.com,
        linux-clk@vger.kernel.org
Date:   Wed, 26 Sep 2018 11:57:58 +0200
In-Reply-To: <20180901162146.5656-1-martin.blumenstingl@googlemail.com>
References: <20180901162146.5656-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926095758.DuyXkn-RDWxoYNoehEjvHAQQjyTp8FthO3Y0dHwtAJQ@z>

On Sat, 2018-09-01 at 18:21 +0200, Martin Blumenstingl wrote:
> Some parts of the SoC are initialized early in the boot process, such
> as the SRAM and the TWD timer. This means that the corresponding
> drivers need to access the clock controller early as well.
> 
> Before this series the clock controller was registered as platform
> driver, which is too late for the TWD timer (just as an example).
> The reset controller (built into the clock controller driver) was
> already registered early, basically for the same reason (the reset
> lines are used to start the secondary CPUs, which is done very early
> in the boot process).
> 
> Register the clock controller early enough so we're able to use the
> TWD timer (as we need to pass a clock which is provided by this
> clock controller) in a second step.
> 
> NOTE: Neil suggested in v1 to switch to one of core_initcall,
> postcore_initcall, subsys_initcall but I couldn't find any driver
> that I could use as "reference" which registers it's clock controller
> before the device model (platform_device) is ready. this is why I'm
> still using CLK_OF_DECLARE - but I'm open to suggestions.
> 
> The second patch simplifies the reset controller (built into the clock
> controller driver) because the regmap is already available early and
> thus can be used by the reset controller driver as well.
> 
> 
> Changes since v1 at [0]:
> - switch from CLK_OF_DECLARE_DRIVER to CLK_OF_DECLARE because with
>   this series there is only one initialization function for the clock
>   controller driver (unlike before: where the reset controller was
>   registered early and the clock controller was registered as platform
>   device)
> - rebased on top of clk-meson, commit:
>   684b97b13b175a ("clk: meson-axg: pcie: drop the mpll3 clock parent")
> 
> 
> [0] https://patchwork.kernel.org/cover/10538971/

As explained earlier, the clock framework is trying to avoid CLK_OF_DECLARE*
In this case, I don't see a away around it yet so:

Rebased and Applied

but should keep trying to remove this is future, when possible.

Thx

> 
> 
> Martin Blumenstingl (2):
>   clk: meson: meson8b: register the clock controller early
>   clk: meson: meson8b: use the regmap in the internal reset controller
> 
>  drivers/clk/meson/meson8b.c | 110 +++++++++++++-----------------------
>  1 file changed, 40 insertions(+), 70 deletions(-)
> 


