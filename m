Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D99C64ED9
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 13:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjBMNYs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 08:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230324AbjBMNYl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 08:24:41 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E6935FF4;
        Mon, 13 Feb 2023 05:24:41 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id D5C112035B; Mon, 13 Feb 2023 21:24:38 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676294678;
        bh=5PxLrMDn/dYNEzqEiYFSmslE1pxFn8IWWRuK6ldS/Oc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=DnMh/K7bJO0hZNUbAA9RBlOV6QhOuDNC/ThRc2itAqDgLI/L6M9F7q4k0+ihKqMSz
         2/c9Z3dDvDy5FWT89GXxLkOu6HKOuML7wwD3C08G5bpuWcVgDnSVcrk0jZkOK8RaHD
         y4739CP8fC7wFUFLWJhiHIh6KLHbJnaf5FGH2h2UG20LrLg7HqJWH2OBt2QBhQzn3C
         a93YAmPjh9tYPx+ljGBSfYbzRQjSinmhY7AtRpO+xJvO8r0zfdj8FDAscZ4V3LMS39
         VZ4GpMHJS5lVb+pPDjn0M9VvQiqPfEoeK0v9Ma0IYgjfEz0Av1qeCqtBUCHbbDTIt2
         Le9txVougpxuA==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v3 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
Date:   Mon, 13 Feb 2023 21:24:21 +0800
Message-Id: <3aad8dc671a65e65f0cced648847c504514f5b0e.1676294433.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676294433.git.jk@codeconstruct.com.au>
References: <cover.1676294433.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add reset line definitions for the AST2600 I3C block's reset inputs.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index 600549d7bee8..16b7389bbb9c 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -90,6 +90,12 @@
 /* Only list resets here that are not part of a gate */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
+#define ASPEED_RESET_I3C5		45
+#define ASPEED_RESET_I3C4		44
+#define ASPEED_RESET_I3C3		43
+#define ASPEED_RESET_I3C2		42
+#define ASPEED_RESET_I3C1		41
+#define ASPEED_RESET_I3C0		40
 #define ASPEED_RESET_I3C_DMA		39
 #define ASPEED_RESET_PWM		37
 #define ASPEED_RESET_PECI		36
-- 
2.39.1

