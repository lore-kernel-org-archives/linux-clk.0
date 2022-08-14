Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73820C25B0F
	for <linux-clk@archiver.kernel.org>; Sun, 14 Aug 2022 21:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240739AbiHNV0c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 14 Aug 2022 17:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbiHNV0U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 14 Aug 2022 17:26:20 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D5321A9
        for <linux-clk@vger.kernel.org>; Sun, 14 Aug 2022 14:24:48 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id qn6so10642089ejc.11
        for <linux-clk@vger.kernel.org>; Sun, 14 Aug 2022 14:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=Xs2VrrzvmLsyH+hJRZNUJZgI2UgrYiUWsrlPMZ36jPPYAVszv08PHRLhLjfLp6Bfrv
         YZOhQ3dGW54YvbbVI9tCJAF6OByRQXWgI/a4pZlQfhgn12nBHzwz+omjpjy79e39MhUF
         YmERME28kY5R85B5Afu7ZAchrc9WEKGtxRHkF5eGN6RGOfDADBMdTtJv8gPFB99wi8S/
         V9ptLemIPoQQ4OmXhQkS0A4LPZdktDltawbfOo6KS2VEYGheC2Tk5BQj7Z1lFNqFh+CR
         ND0ZbnFFpVmm5V1J23akX6FNxYuD9Y9PyLlwBRTAkipaEfyHi0wvug36z27Rly2to0HG
         lBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=xQQcsinkBD55XZnA3Rx8KZUstdukRPl8F+heSycPoHI=;
        b=EA/nIObEKUVAopZaIT+5RPgGVwR4i8UpGOpmTGYaaFqU9dGQsKulRMBIXwc4niFuXJ
         9TcUFl8JHbDwRBRYZD2efQjxn/PBNorD3tMKhVQP8GHuG3POsjglLQlGArQunDXxmUF3
         fG9M0GyKHIYZAHrmjXQB4xWHsgVUky9JRllz/HY6U/yj6xpFCecQWkEC44RMqHtCFl58
         9J37212yRWBtC9WkurU94/Qan5Bh6Qy2QAVoPq7Fx3c7HKjQRp8Bbv7ZORVcDpSDqXZd
         nNOVgwobRSl37VsnY3fltWKlhPgVvZ0K+iqXxXEXzXsgvo+TCP6gA/Rm6pH5QXfGK/WL
         9hVA==
X-Gm-Message-State: ACgBeo1O+QIga5ILUTdj+HsK0dvAyD/asWCt1ETWnQIYLq7g+mGmoZwG
        adZ1ik+WqjVoRWCy/RklXqBX4MS0LYs=
X-Google-Smtp-Source: AA6agR4qBFMCJH3ypksedrohz+KCGvROtq1GbZ4RYBN5NpUdX40/VFaL7P6q9Ww7l1Wy6FhKV+KPvw==
X-Received: by 2002:a17:907:2c4a:b0:730:87ff:b69 with SMTP id hf10-20020a1709072c4a00b0073087ff0b69mr8585364ejc.116.1660512286556;
        Sun, 14 Aug 2022 14:24:46 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id dk19-20020a0564021d9300b0043df042bfc6sm5409260edb.47.2022.08.14.14.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:24:46 -0700 (PDT)
Message-ID: <c31a2f7e-4506-5b83-be5b-674980777859@gmail.com>
Date:   Sun, 14 Aug 2022 23:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: clk: meson: pll: copy retry workaround from vendor driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On a S905X4-based system this call fails randomly.
The vendor driver has a retry mechanism and on my system
the second attempt is successful always.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/clk/meson/clk-pll.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 9e55617bc..daa025b6d 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 
 static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
 {
-	meson_clk_pll_init(hw);
+	int retries = 10;
 
-	if (meson_clk_pll_wait_lock(hw))
-		return -EIO;
+	do {
+		meson_clk_pll_init(hw);
+		if (!meson_clk_pll_wait_lock(hw))
+			return 0;
+		pr_info("Retry enabling PCIe PLL clock\n");
+	} while (--retries);
 
-	return 0;
+	return -EIO;
 }
 
 static int meson_clk_pll_enable(struct clk_hw *hw)
-- 
2.37.2

