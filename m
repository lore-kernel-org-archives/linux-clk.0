Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F296C64EC4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 06:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjBMGCh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 01:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBMGCg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 01:02:36 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CF7EF98;
        Sun, 12 Feb 2023 22:02:34 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 540462024A; Mon, 13 Feb 2023 14:02:32 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676268152;
        bh=sv8EKlV5lNFHM7GS5Q5Z4eAY78xrpru15nGhLditR3s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=g5zASt6PCK7ArcsIu1oprGRB0KLK4aEvyXS8s5ml5TYAr5cumGvVSfGIvnR+aa/2X
         4Mx0yWRuePayhdm/QqLux6dkBe8oOrX2DPeFlhrpxaV1Ye/jCEqGmDGvVbfybXCf3G
         +swNZX9hWdNECfWhXBe0DqKFweNhtNruLWPez7xtskGrF7YvSkK20VFL+xDiWmFYjo
         f0uOawTu2xhtslu27CWisY5gmzGXxCAfVopAA1PYes/cdhzCouCVkpCBS6yM4QNeaq
         JjcmXt/LTZsQjRx5eaycYJ4GeuFNdJfIuIaFEkokFdLFZ1kmchfExRIEiXP2wa92Bc
         cQnbq++gCQ+ag==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 1/3] clk: ast2600: allow empty entries in aspeed_g6_gates
Date:   Mon, 13 Feb 2023 14:02:06 +0800
Message-Id: <db255ca1934f82955df103011ab4c7ad406ba459.1676267865.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676267865.git.jk@codeconstruct.com.au>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're about to remove an entry from aspeed_g6_gates, but we won't want
to alter existing entries. This change allows empty entries in the gates
array.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/clk/clk-ast2600.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 9c3305bcb27a..1f08ff3c60fa 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -652,6 +652,9 @@ static int aspeed_g6_clk_probe(struct platform_device *pdev)
 		const struct aspeed_gate_data *gd = &aspeed_g6_gates[i];
 		u32 gate_flags;
 
+		if (!gd->name)
+			continue;
+
 		/*
 		 * Special case: the USB port 1 clock (bit 14) is always
 		 * working the opposite way from the other ones.
-- 
2.39.1

