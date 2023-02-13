Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0195FC64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbjBMNYq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjBMNYj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:24:39 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9D31A4B8;
        Mon, 13 Feb 2023 05:24:38 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 697512024A; Mon, 13 Feb 2023 21:24:36 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676294676;
        bh=2Fbp+auGCvRHh4yggvZQpa3HffMqqxxLhK2seUldcEs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=YmBp5KWYocmRtyS2Uu+lv9MrgzPdtodMl9j6xDdAlP9C7mLah/gZTp3JudFJZPIlq
         1mmKM9xHSWpidOC4+pJIzLvP8PUYJGUAI11EPL+/+f3cpA6gNy+a//zCNYtmD8/DKf
         0/vBB01A1D3kZBfR/4wwsW9jsbk11QuZEyuuK1pSlb1mDZTUGP61JKClN9TzwkNdug
         4E6iblfxEHY4cmVwsjAi0/hUGP5WNplN5rczz4f0fcIh7NEXpnO0CHvNvaoHKAJ01R
         rgiFPKiv9GomJ9fbff6wnwZPP3X9/aqOVmIqG5s36wQFV3lTR01KJw5rkVk7uY21Xp
         XPy8nLIQFMZyQ==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 1/5] clk: ast2600: allow empty entries in aspeed_g6_gates
Date:   Mon, 13 Feb 2023 21:24:17 +0800
Message-Id: <bb1ef5ea4973466442e9d8c9a932117b840b1211.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676294433.git.jk@codeconstruct.com.au>
References: <cover.1676294433.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're about to remove an entry from aspeed_g6_gates, but we won't want
to alter/reorder existing entries. Allow empty entries in this array.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v3:
 - reword commit message
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

