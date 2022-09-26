Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDB9C32771
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 10:46:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235414AbiIZKqy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 06:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236852AbiIZKow (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 06:44:52 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0325256B89
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 03:25:51 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id c24so5832017plo.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Sep 2022 03:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ZcjMxa2oa+nNSgVobg8BYi3nOn8RkspzQwdQr25nofU=;
        b=OMxiqQX8klwSiTnH9e9oVMFD2NRMrLyCvdOnToTR9NqWO8Xje08UhWK3SnMI7HlfEv
         ZqBipRTznMLPjzOZ5r4GDjpC8pG8OM/dmLUNbzZoT9ZhDagkPSMnRlwbwTrUyhHRpTRn
         XrYyoxSWMX3clEunMXnmZ1a8x5VnLM46a9gms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ZcjMxa2oa+nNSgVobg8BYi3nOn8RkspzQwdQr25nofU=;
        b=Welv0QDYpTSABTzCZ8yU4HGWK4G57s01UFfWE20izDpgqpg8S6zRsbzjHHbKJfvF5A
         8EPkkehIQzE6Dle1hgX/FTYnYnWIO4xBw7PSQw+v/oBYSE0rsZ/LdRR7vzfaXIGx0wIu
         O30EyvGfExOXspQrIy0syE/E4j0X6cbl41at2kyJs1rYC9MRG1psAObvFrFaMvnlgCj7
         t2N8RPnuiOHQiCIPsCeHlS4zIPBRZ6ug31bjTjSHraCv615pxrbgiwxuHNCOzuAeSch6
         8ZsmnQrGBbCPetmEZKaYpCLWEXWlko4YfvxHK26VtGLEmPkKR2T/mcHy+ej0HkOt2Q2a
         Fl7Q==
X-Gm-Message-State: ACrzQf2R/I12IXIW3aRkk3g/nuzCJMqTXP+NAzMZ6FMr2Anq2qylzv5w
        sJkzgJX91ukroI0m1jqg3UhJwA==
X-Google-Smtp-Source: AMsMyM7rm/4uF8tsgKbxdB8WUvp8S7VPaRGhX5QYj4RqmRAMsvZnozyIL13tvcR0AVrdkEnDbmUMqw==
X-Received: by 2002:a17:902:d4ce:b0:177:fe49:19eb with SMTP id o14-20020a170902d4ce00b00177fe4919ebmr21053793plg.170.1664187950840;
        Mon, 26 Sep 2022 03:25:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:48 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: mediatek: mt8192: Avoid duplicate OF clk provider for topckgen
Date:   Mon, 26 Sep 2022 18:25:21 +0800
Message-Id: <20220926102523.2367530-5-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
References: <20220926102523.2367530-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MT8192 topckgen clock driver is split into two parts, an early
CLK_OF_DECLARE_DRIVER() part which registers one clock solely for the
system timer, and a standard platform driver part that handles the rest.

In both parts, of_clk_hw_add_provider() is called, causing the clk
provider to be added twice. While this doesn't cause issues, it isn't
clean either.

Remove the existing entry before calling of_clk_hw_add_provider() in
the platform driver probe function. This ensures that there is only
one entry, and the OF related code still runs on the full set of
clocks.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index e39012583675..c2ce72df6db0 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1246,6 +1246,12 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (r)
 		return r;
 
+	/*
+	 * Remove clock provider set in clk_mt8192_top_init_early() first
+	 * to avoid duplicate entry, and re-add it so the OF related code
+	 * gets run again with the full set of clocks.
+	 */
+	of_clk_del_provider(node);
 	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
 				      top_clk_data);
 }
-- 
2.37.3.998.g577e59143f-goog

