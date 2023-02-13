Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF82C678D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjBMNYr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:24:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230297AbjBMNYk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:24:40 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25021A960;
        Mon, 13 Feb 2023 05:24:38 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 2466920260; Mon, 13 Feb 2023 21:24:37 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676294677;
        bh=KxCJhgCD147FONaRQXGIowuXrZg+dpJaJ8MxOzByVg0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=SsbW8jVcJV2aA+/K/4MURd74QFs1nkOp8yFD5RM/CVK22emQWYHczK1nsl01AOobS
         Y4ilfjfNQdosnu8iysmauqkMoInZJ2AwBxSuLEKzZCZr3si330mls+uhJqqx55P8gI
         OfShowVshDUpWU0s8aZVP2gvXWoYBm7xOtl+yEJQQM2LzX0hbrXthC/S3kK3CdpYGd
         vsnHNMhMxbBIJLDmX9pkfCOMAF02+N+amN5/IacBxBQJRaxTpRQDJrBeQbX9i6770d
         MCef5U3PAENM0v+rgMNFYE9RKvjCT7ql1BcQDHYyPPeEmljWeJlS5XZ4wF8h0FL+q7
         JJnnUIBJ+R7Ow==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 2/5] dt-bindings: clock: ast2600: Add top-level I3C clock
Date:   Mon, 13 Feb 2023 21:24:18 +0800
Message-Id: <cfa142894e3e3a2895ae1ef7dce9bc89c493b9f4.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676294433.git.jk@codeconstruct.com.au>
References: <cover.1676294433.git.jk@codeconstruct.com.au>
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

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v3:
 - split into separate bindings & clk changes
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index d8b0db2f7a7d..608ce576e63e 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,6 +87,7 @@
 #define ASPEED_CLK_MAC2RCLK		68
 #define ASPEED_CLK_MAC3RCLK		69
 #define ASPEED_CLK_MAC4RCLK		70
+#define ASPEED_CLK_I3C			74
 
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
-- 
2.39.1

