Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54812C7EE30
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjCBA6t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjCBA6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:48 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1E628232;
        Wed,  1 Mar 2023 16:58:46 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id F3CD120260; Thu,  2 Mar 2023 08:58:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718722;
        bh=lj2XbEVvAW8qMsoBYzYsEfYf9ChYAdVkw9cUGu5B5L4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GYI5WmV7svHrO0MWrwsejU3Zmd1sjAiDyrW1LQKAtP3P2FK4niMHMQxaBYnstCFMq
         jHkqgAYpckgL6seXz6Svg3RxjylLzLZf4v5BxPKDqDpI9SNANOVtbwV68ZZ9eMU4C/
         B+pGXpdfMA9xDPTM/GIQHOJtIqEo+oTBcv7s4bgMW1jr9QW2sr3EDngUSL1GuDjSWW
         uisEnwoib1oYsD4OrGzG8aVxYoP4kTqltKukHIx0DjnmQmrCIuLzxSvyWQXhqKnX6U
         yybmFhXXBeSsvTYDLM8lfsmSK/D4DZP0RyWOJNh5zOTj0B35G7Pc13mDw2yi22k2/m
         160RQ9jmq0HIg==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 1/6] clk: ast2600: allow empty entries in aspeed_g6_gates
Date:   Thu,  2 Mar 2023 08:58:29 +0800
Message-Id: <20230302005834.13171-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're about to remove an entry from aspeed_g6_gates, but we won't want
to alter/reorder existing entries. Allow empty entries in this array.

Reviewed-by: Joel Stanley <joel@jms.id.au>
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

