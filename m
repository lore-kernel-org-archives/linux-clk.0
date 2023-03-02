Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0353C7EE39
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjCBA6u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjCBA6s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:48 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B97629E1C;
        Wed,  1 Mar 2023 16:58:46 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 9919C202D2; Thu,  2 Mar 2023 08:58:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718723;
        bh=IEyFZLfpA1uEgXR5ZyX8y5d2It4TK6VtIYulUQ+dyPU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ieKdFh1BGAmeC5/SJGVl64xyVMLPZ0RbTVjRD8qTRHFaUNz2Ztpe7QtyTuN1EuLwh
         4pmX+9hATTxIDPauCb/OYcm+eb1rtqy7HPF3cmbw2pNsNkWvoaywGaD3qp1Q6AHGps
         DA4lSKnE9tddYOGh84irszykD3LxGg6MUicFMAYpJ0e7wT9w03Jx9oxpOfO0RoUDXI
         iDJqvLtmhYO88kM1ec0ukWDoQE4FFRyg/OaRLJ5/d5p6+OP5DQqYwNr1Rx/jzrp4r/
         BeX9+4qzq5O02iVfMshWPBbkOrG4WGSjIWsQqJCmqfuExNjiELmjtjqmwGpq/wUtl+
         qiRZLmpAebj/Q==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 4/6] dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
Date:   Thu,  2 Mar 2023 08:58:32 +0800
Message-Id: <20230302005834.13171-5-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The current ast2600 clock definitions include entries for i3c6 and i3c7
devices, which don't exist: there are no clock control lines documented
for these, and only i3c devices 0 through 5 are present.

So, remove the definitions for I3C6 and I3C7. Although this is a
potential ABI-breaking change, there are no in-tree users of these, and
any references would be broken anyway, as the hardware doesn't exist.

This is a partial cherry-pick and rework of ed44b8cdfdb and 1a35eb926d7
from Aspeed's own tree, originally by Dylan Hung
<dylan_hung@aspeedtech.com>.

Reviewed-by: Joel Stanley <joel@jms.id.au>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>

---
v3:
 - split dt-bindings and clk changes
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index dd1581bfdf58..b4d69103d722 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -57,8 +57,6 @@
 #define ASPEED_CLK_GATE_I3C3CLK		40
 #define ASPEED_CLK_GATE_I3C4CLK		41
 #define ASPEED_CLK_GATE_I3C5CLK		42
-#define ASPEED_CLK_GATE_I3C6CLK		43
-#define ASPEED_CLK_GATE_I3C7CLK		44
 
 #define ASPEED_CLK_GATE_FSICLK		45
 
-- 
2.39.1

