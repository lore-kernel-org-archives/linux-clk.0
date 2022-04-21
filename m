Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF9EC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 21 Apr 2022 04:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbiDUEHY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 00:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiDUEHX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 00:07:23 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 837CFDEA6
        for <linux-clk@vger.kernel.org>; Wed, 20 Apr 2022 21:04:35 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y14so3053564pfe.10
        for <linux-clk@vger.kernel.org>; Wed, 20 Apr 2022 21:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tpfDonpRUmG38e9TnYZ913heAJIMSDn888Zn5gQcpGg=;
        b=dDXjEiQhDkUIA+u25W7rod+UdShPVr5Yk71YCFjRgk42t8ZDQAMbc4FxwT9Bpd6xwF
         GxYv2Yr0aPvc7HfTzlcCNtBn7bVAWINfi8fdat6iCpvgWjtuqt06OQIWuNOjbZIS2/rX
         d1QmyubJNsIeFkuPf3KuBqJeuBlguRFbB01h3KWgUDiVlq0a5KZ8N1OpyuhtFDGWuYi2
         ng5nh8Eh1Inu9tSUN9RfJGiR5NgHLSEg1nJHSqbK30IQ5DKENt/t3b5P5EzOUtk4cx25
         iz+jjX0Nfg1EibxMi8mO1xtQDBwW6c4B8Q17qRfE/mxuMCc35rOUKcHuq/ns6XGnByvX
         Opbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=tpfDonpRUmG38e9TnYZ913heAJIMSDn888Zn5gQcpGg=;
        b=s+hAnU/5eWc3xlMUJ+2qj5UBUd0nA35XIvxCzdCqNz5X6OCtaP9OkNAGH/+8joTfs7
         LngCIs2NeUHQ4FgLN/SgLVEiaIwa6iMZ701o5B9qZ1B86zvjHn4PPLAI3v5pW77h5z55
         tcpBX+sN9Y4OtAlss6FE0zfjQ+vLlYy4YQPaQTAn4zllRGGhyqDhc2zJe+kCeG4WzTSZ
         coDdG+lfBHme2/K2KUWFougstW+3p5m3SV97fcCrQx8x7G+VvsISSUnFOJVSODfhxuf5
         q0OU4ys2lfRGU/k1WoiSICX8k6O6K+35ffXK9GCfb1KZ99/AWnAAKzu/TJAOH2tFn521
         tG/w==
X-Gm-Message-State: AOAM5328qjDD/lwd45vVW8Sky4SGY5x7Xxhiruy9kAvx3wJYnBODkV5Q
        DHoyErgY9Bz0XarYUmpTyBgEfJVxjX4=
X-Google-Smtp-Source: ABdhPJx+hV59qQDmAFHtCXedOW4O+iea2nBUbk26jY4E2agRgCJlLBhb9wtgGyAYmqbyxlqYKKSkDQ==
X-Received: by 2002:a05:6a00:10c7:b0:4fd:9ee6:4130 with SMTP id d7-20020a056a0010c700b004fd9ee64130mr27392367pfu.84.1650513874912;
        Wed, 20 Apr 2022 21:04:34 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id p12-20020a634f4c000000b003a94e71ca01sm13184040pgl.46.2022.04.20.21.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 21:04:33 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>, BMC-SW@aspeedtech.com
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: ast2600: BCLK comes from EPLL
Date:   Thu, 21 Apr 2022 13:34:26 +0930
Message-Id: <20220421040426.171256-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This correction was made in the u-boot SDK recently. There are no
in-tree users of this clock so the impact is minimal.

Fixes: d3d04f6c330a ("clk: Add support for AST2600 SoC")
Link: https://github.com/AspeedTech-BMC/u-boot/commit/8ad54a5ae15f27fea5e894cc2539a20d90019717
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/clk/clk-ast2600.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 24dab2312bc6..9c3305bcb27a 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -622,7 +622,7 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 	regmap_write(map, 0x308, 0x12000); /* 3x3 = 9 */
 
 	/* P-Bus (BCLK) clock divider */
-	hw = clk_hw_register_divider_table(dev, "bclk", "hpll", 0,
+	hw = clk_hw_register_divider_table(dev, "bclk", "epll", 0,
 			scu_g6_base + ASPEED_G6_CLK_SELECTION1, 20, 3, 0,
 			ast2600_div_table,
 			&aspeed_g6_clk_lock);
-- 
2.35.1

