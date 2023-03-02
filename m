Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32ACFC7EE33
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjCBA6s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjCBA6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:48 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF7827486;
        Wed,  1 Mar 2023 16:58:46 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 8383420261; Thu,  2 Mar 2023 08:58:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718722;
        bh=N5Z7HsucC8LM3QGloJwyH+mC2mOIy6PnE0HIavuVwIE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZlEKCApxpRtdqScDOK2OrTNdsSUitutbOiP7h6Xxjph1w5zKfaK9LrMijuk29WZrp
         xAjE3OYMcryWYKWpbfCJZtWUKJZD7oJxQ8VP+5JKrOGIIK12qImOXmwQNFTVAcXqrQ
         BNMXWVy+Jluk8MsXtxKMkVxFBPn17WFjJ++4e9TYhShq5q8J79gx0g74kyQ0g3+/qY
         mGowLtjjQTX9S06qwm67xP5htnn1imVKieIf8Tg+RdLhTLHUFo47+w5oa5ezdF5dnu
         RYcsF2/ayxIzCuSa1pwFbCHiBcqloOVGNjpnB2kudCD1RIxnYhbc6gz3CUPSo/4om+
         9V4WRwD9XTMxQ==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 2/6] dt-bindings: clock: ast2600: Add top-level I3C clock
Date:   Thu,  2 Mar 2023 08:58:30 +0800
Message-Id: <20230302005834.13171-3-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The ast2600 hardware has a top-level clock for all i3c controller
peripherals (then gated to each individual controller), so add a
top-level i3c clock line to control this.

This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
from Aspeed's own tree, originally by Dylan Hung
<dylan_hung@aspeedtech.com>.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v4:
 - use contiguous clock index
v3:
 - split into separate bindings & clk changes
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index d8b0db2f7a7d..dd1581bfdf58 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,6 +87,7 @@
 #define ASPEED_CLK_MAC2RCLK		68
 #define ASPEED_CLK_MAC3RCLK		69
 #define ASPEED_CLK_MAC4RCLK		70
+#define ASPEED_CLK_I3C			71
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.39.1

