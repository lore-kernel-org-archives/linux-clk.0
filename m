Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DB0EB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 27 Jul 2023 05:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbjG0Ffc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Jul 2023 01:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbjG0Fe4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Jul 2023 01:34:56 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BFC30DF
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:34:34 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8b4749013so4382745ad.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Jul 2023 22:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436072; x=1691040872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebMv2zCUuI7+v0WKO0rdWUfZu6i4M/aH4M1ZWTbcC5E=;
        b=UESfxiMcGDxlM1+U0+b3DvIMqaPqSBSzUy3qM/gkfnnNlkWAG3ZdIzl53O0z4qltun
         Wl/n+L6woG9wbC3LMG3mtRaejY5DGnpaqLKSvRN9Rw3k8nLKJg3Y49JO0chE1iXgG1YB
         nNNBIDDYt2qO0F9ettcIpre/DqAds659sTcWeJm/E+rTrvvX6dThgvGHB/o57lkUJFG9
         DHK6Unam/w1yTXcjLk3krIxIdDZvFslyF3c6yillKuUBGh91LxQ7aWQITjc9n4KV2ddT
         hyp6s5V8DI/vhTaTeaq6h+/mexJOq3Z6zy6CF7VlBcLVSNp/3cURn4TcWHk8mO77eaCN
         j2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436072; x=1691040872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ebMv2zCUuI7+v0WKO0rdWUfZu6i4M/aH4M1ZWTbcC5E=;
        b=aPpyzKE/iDCXcCMY47vtGTqXjxCvwAEhFUnsgb40zuGAC0pBg5zFySI84jbLgwJfFp
         E7V6BmyHbYiKpvr7LlE0eoVamYlRfiFdGKvLDsQT4LYLodiOGACZhtF9YojRSTtNJbo0
         vSAmbcjNqzR8MVHJjG4uDGkniDKfxy8waO/SpcTKqyjec3csmrMqmsK1aTDi/QKrGIEL
         m36cYQjbIyGqfpZew1C2SdrkQ6DFtpFkOWKlo7CuxCiGQl7HNyvUKH73H8d4gXbButHx
         KpxfN53ZZ5ComVmdcAbvW7xwIFjli1V4tkVPqhikUTcVgWkadkefhdoJPtv11Z3eM4zK
         AGQQ==
X-Gm-Message-State: ABy/qLZhVNe5HOHznhg47MayKx4BhmwMBvQCFPT1vjv4UNlc+kuyMgRP
        5rVdg2l0s4BUH7s9KVaWRJGPVg==
X-Google-Smtp-Source: APBJJlH/rWJB689lBz7rTzs6xmQVeNVmFZwhaM3Q5OCgAtFY95fFTFrJS86LuDHuBedkbLwcj1MiDw==
X-Received: by 2002:a17:903:22d1:b0:1b8:b2c6:7e8d with SMTP id y17-20020a17090322d100b001b8b2c67e8dmr4820694plg.66.1690436072684;
        Wed, 26 Jul 2023 22:34:32 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001bb889530adsm319059pli.217.2023.07.26.22.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:34:32 -0700 (PDT)
From:   Claudiu Beznea <claudiu.beznea@tuxon.dev>
To:     mturquette@baylibre.com, sboyd@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        mripard@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 17/42] clk: at91: at91rm9200: fix checkpatch.pl check
Date:   Thu, 27 Jul 2023 08:31:31 +0300
Message-Id: <20230727053156.13587-18-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix the following checkpatch.pl check:
drivers/clk/at91/at91rm9200.c:100: CHECK: Alignment should match open parenthesis

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 drivers/clk/at91/at91rm9200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/at91/at91rm9200.c b/drivers/clk/at91/at91rm9200.c
index 87fd7b1609bd..a862a0a18972 100644
--- a/drivers/clk/at91/at91rm9200.c
+++ b/drivers/clk/at91/at91rm9200.c
@@ -106,8 +106,8 @@ static void __init at91rm9200_pmc_setup(struct device_node *np)
 		return;
 
 	at91rm9200_pmc = pmc_data_allocate(PMC_PLLBCK + 1,
-					    nck(at91rm9200_systemck),
-					    nck(at91rm9200_periphck), 0, 4);
+					   nck(at91rm9200_systemck),
+					   nck(at91rm9200_periphck), 0, 4);
 	if (!at91rm9200_pmc)
 		return;
 
-- 
2.39.2

