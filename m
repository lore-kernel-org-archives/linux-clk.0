Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B10FCDB47E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Oct 2023 15:34:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbjJRPeS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Oct 2023 11:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjJRPeR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Oct 2023 11:34:17 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8B4114;
        Wed, 18 Oct 2023 08:34:16 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57b5f0d658dso4061743eaf.0;
        Wed, 18 Oct 2023 08:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697643255; x=1698248055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmlZgOTohheR5Sz3o+FLczWrX2zS7o2K2yAxRk2cDpU=;
        b=alZ4ou26L6vg8BAJDXWQzMFghsZDt6elNCdFUfa6mZjxHplv4AxnP5i/OWrFV/8GH1
         /2l3SRuL52mo4F5Wrj9QWeGIfyRTmY5mqy1qE6gdAPP+/fhPWJuD8QeC+rKvhe1a/Ssd
         3dKpXit3ca+BPb2JNwbDMLhd2plDD7k82ie9rYtsupwz3ou1k/cevpHTFFaFsPX+sges
         BfbnjpfWHX7OcrPLoZYw4NBa+YNN8tDN+dSL1xxVyKDhi22nAe+MDcKUZGYO7FC78QGS
         y7G1KIQrz5J/8fia+hX/i9QDwOeRrLdDU2AQSW4xROVAh/mdJFWTZ6QA29LmMLOl3iNl
         UL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697643255; x=1698248055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmlZgOTohheR5Sz3o+FLczWrX2zS7o2K2yAxRk2cDpU=;
        b=aLNfjCdpBNjQGgnpTSNM79lgvRa3TVCCOE3zk/QdF/d8EfdpQ+EGBi8i/HaySg7O9/
         qGo7tRlSiFyfxsaey8Q6ABM62jvhgIirJev+Tjfsjqk7OmywUbsv/IFE1pgA6RJYnO6c
         m3X5DOhShGB8TjtoTuU82dI/G1s3AyZmKNBDI/nDC8Vhlt9IDH9Gdra3LKEO/GtIR4f/
         +3YiknWup9DaiCiqi+ZhLx1dl9nazHplq5MzWJAli3lnsgjcoGM9b88fe6XlsmhuL7Rj
         aejfDGJ+fqWJZ6ASLVrLj+tQRj90eNWJhQUMXRFEMmx+gMdtbH5nGhYrbPqLYL5sDAvy
         HtGg==
X-Gm-Message-State: AOJu0YzjeyuV02jqhVg7lbvyhgiB/VTCCtkWAmjYeMBK90ZnEaeLXA+R
        AP30eRTHzn3szBcv3SQ2YEI=
X-Google-Smtp-Source: AGHT+IEVNbZ56UZRmNC6SHChpVibk8/f3CmobKd/aVSmcbaI5+8ojfX7HdJisupGUtNmr2zqNWv3Ug==
X-Received: by 2002:a05:6820:200e:b0:571:1fad:ebe0 with SMTP id by14-20020a056820200e00b005711fadebe0mr6705464oob.3.1697643255377;
        Wed, 18 Oct 2023 08:34:15 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id h16-20020a4ad750000000b00581e090fd1fsm523782oot.8.2023.10.18.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 08:34:12 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-rockchip@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 1/3] clk: rockchip: rk3568: Add PLL rate for 292.5MHz
Date:   Wed, 18 Oct 2023 10:33:55 -0500
Message-Id: <20231018153357.343142-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231018153357.343142-1-macroalpha82@gmail.com>
References: <20231018153357.343142-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support for a PLL rate of 292.5MHz so that the Powkiddy RGB30 panel
can run at a requested 60hz (59.96, close enough).

I have confirmed this rate fits with all the constraints
listed in the TRM for the VPLL (as an integer PLL) in Part 1 "Chapter
2 Clock & Reset Unit (CRU)."

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/clk/rockchip/clk-rk3568.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3568.c b/drivers/clk/rockchip/clk-rk3568.c
index 16dabe2b9c47..db713e1526cd 100644
--- a/drivers/clk/rockchip/clk-rk3568.c
+++ b/drivers/clk/rockchip/clk-rk3568.c
@@ -72,6 +72,7 @@ static struct rockchip_pll_rate_table rk3568_pll_rates[] = {
 	RK3036_PLL_RATE(408000000, 1, 68, 2, 2, 1, 0),
 	RK3036_PLL_RATE(312000000, 1, 78, 6, 1, 1, 0),
 	RK3036_PLL_RATE(297000000, 2, 99, 4, 1, 1, 0),
+	RK3036_PLL_RATE(292500000, 1, 195, 4, 4, 1, 0),
 	RK3036_PLL_RATE(241500000, 2, 161, 4, 2, 1, 0),
 	RK3036_PLL_RATE(216000000, 1, 72, 4, 2, 1, 0),
 	RK3036_PLL_RATE(200000000, 1, 100, 3, 4, 1, 0),
-- 
2.34.1

