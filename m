Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1040C3DA78
	for <linux-clk@archiver.kernel.org>; Sat, 14 Jan 2023 23:56:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjANX4j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Jan 2023 18:56:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjANX4i (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Jan 2023 18:56:38 -0500
X-Greylist: delayed 1272 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 14 Jan 2023 15:56:37 PST
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091FC5269;
        Sat, 14 Jan 2023 15:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
        s=default2002; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=c6HaRC/5BFVWpEQLqi7AYsioOEhg+RGVAbybpQsqhhc=; b=lofKh7YBz5AET+NTFDJ2fihj+I
        Fj6hM/H7F5d/mSwkEbccKkAGR09HmRQInoVvZCzwoEJZG6hmJSyseFw/bVVSNinOqo3VGiC6jYs7d
        /07c6FHI2/hNzwixSy4SKtSG4zSxU4D1O3QhIrmfeYNANp6CWqO+n8XWo0Oh4N3HKqjHPjvlZf+eU
        82oqxTBtZdOO4Jz7gbb8LnAY+X1epWW9Y2R1IBLcPwSmhYIvqgkkxMMokW+SsiFlU2XrgS817c4M+
        JKy6Fvbp3ViHs7sAbkdVTOURd4gs9e8EkIGfVPJVDg/S0dq+Ec5qgpg8UnRPCfV9xQidxab8bxOfW
        VxX2ZbMg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
        by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <lars@metafoo.de>)
        id 1pGq3V-0001aE-6w; Sun, 15 Jan 2023 00:35:21 +0100
Received: from [2604:5500:c0e5:eb00:da5e:d3ff:feff:933b] (helo=lars-desktop.lan)
        by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <lars@metafoo.de>)
        id 1pGq3U-0009Au-L0; Sun, 15 Jan 2023 00:35:20 +0100
From:   Lars-Peter Clausen <lars@metafoo.de>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH 1/3] clk: vc5: Use `clamp()` to restrict PLL range
Date:   Sat, 14 Jan 2023 15:34:58 -0800
Message-Id: <20230114233500.3294789-1-lars@metafoo.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26781/Sat Jan 14 09:29:51 2023)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The VCO frequency needs to be within a certain range and the driver
enforces this.

Make use of the clamp macro to implement this instead of open-coding it.
This makes the code a bit shorter and also semanticly stronger.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/clk/clk-versaclock5.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index e9737969170e..54fee43d6564 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -449,10 +449,7 @@ static long vc5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 div_int;
 	u64 div_frc;
 
-	if (rate < VC5_PLL_VCO_MIN)
-		rate = VC5_PLL_VCO_MIN;
-	if (rate > VC5_PLL_VCO_MAX)
-		rate = VC5_PLL_VCO_MAX;
+	rate = clamp(rate, VC5_PLL_VCO_MIN, VC5_PLL_VCO_MAX);
 
 	/* Determine integer part, which is 12 bit wide */
 	div_int = rate / *parent_rate;
-- 
2.30.2

