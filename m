Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0890C678D4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjCBA6w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjCBA6v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:51 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C614923C6F;
        Wed,  1 Mar 2023 16:58:49 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 20338202DE; Thu,  2 Mar 2023 08:58:44 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718724;
        bh=rcWE5yATsN5CfBHBjwN3Th7/mIbe+8zUJTNmVPXeGSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bULp4tHX9LvWEoD+O0tDbtQG3s4oDme2J0Q/FAYByKN6kKE+O4di106eh3zw7xeXY
         4rlZfJ8B/TlrNAdkJ3rvffN8C+9lHrnLQq92YBkxf/ikcmy25H4wk/yw+QnbPOyFIp
         xqIoItmevyq2D36UtWBsrdbdhbxVFAfKud7CcWXTVgUKN76Y9gNOJCTMe73x92Ov1F
         TmgByEfqaadAVsk6VKRis4K82MwT2W3M6opqFUirqoTCoEWZUkTV4vZmucnviqLIkt
         lJ3El5uwroMfTEWlMYiju1C2LvBuLd8lCseHHS3qf5QJcHHAaSvxiWHJnmeH3/2DOu
         vapF6dTn4SuGA==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 5/6] clk: ast2600: Add comment about combined clock + reset handling
Date:   Thu,  2 Mar 2023 08:58:33 +0800
Message-Id: <20230302005834.13171-6-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a little description about how reset lines can be implicit with
clock enable/disable. This is mostly based on the commit message
from the original submission in 15ed8ce5f8.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/clk/clk-ast2600.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/clk-ast2600.c b/drivers/clk/clk-ast2600.c
index 09f26ab5f9af..a094a2601a37 100644
--- a/drivers/clk/clk-ast2600.c
+++ b/drivers/clk/clk-ast2600.c
@@ -73,6 +73,27 @@ static void __iomem *scu_g6_base;
 static u8 soc_rev;
 
 /*
+ * The majority of the clocks in the system are gates paired with a reset
+ * controller that holds the IP in reset; this is represented by the @reset_idx
+ * member of entries here.
+ *
+ * This borrows from clk_hw_register_gate, but registers two 'gates', one
+ * to control the clock enable register and the other to control the reset
+ * IP. This allows us to enforce the ordering:
+ *
+ * 1. Place IP in reset
+ * 2. Enable clock
+ * 3. Delay
+ * 4. Release reset
+ *
+ * Consequently, if reset_idx is set, reset control is implicit: the clock
+ * consumer does not need its own reset handling, as enabling the clock will
+ * also deassert reset.
+ *
+ * There are some gates that do not have an associated reset; these are
+ * handled by using -1 as the index for the reset, and the consumer must
+ * explictly assert/deassert reset lines as required.
+ *
  * Clocks marked with CLK_IS_CRITICAL:
  *
  *  ref0 and ref1 are essential for the SoC to operate
-- 
2.39.1

