Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9331DC7EE33
	for <linux-clk@archiver.kernel.org>; Thu,  2 Mar 2023 00:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjCBA6w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 19:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbjCBA6v (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 19:58:51 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A3325960;
        Wed,  1 Mar 2023 16:58:49 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 9F3F7203F9; Thu,  2 Mar 2023 08:58:44 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677718724;
        bh=P2sKYF+UVnJfCwBMz5b/csD9Fw/yLMWPestEYUU2PLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=WtO1rIic/nbBWB3idTxHeKjtfBT3WdNO6rg5lWEi5Xl4+R/JvfNXaQ+mz44UKe6J1
         hfg+rier0wXdJKf2kyaHwTlNereve2DCCZe1HKEq+Dgy5whywxoug1fRKRae4nNAbk
         lKQG86UmaAHyK4wpmkZTgmxxaW3jelvw9GPBdKkrH5QVN2DJy2uGQHd4g14+/yxLSH
         ZLjmd6eD4KY5en3+OZBBtwts8hLfiQC3/qOlVNypQkKc60L9ASzqQAEbddgSYil/TS
         AuQ0JXqs1Mnvxe5tcvoFn4CJKyBigoPqhIyBJJltTT4jyWEKg//2DVqh/dn9j6eV5z
         2yH55iPWxo1kw==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-clk@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v5 6/6] dt-bindings: clock: ast2600: Expand comment on reset definitions
Date:   Thu,  2 Mar 2023 08:58:34 +0800
Message-Id: <20230302005834.13171-7-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302005834.13171-1-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The current "not part of a gate" is a little ambiguous. Expand this a
little to clarify the reference to the paired clock + reset control.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 include/dt-bindings/clock/ast2600-clock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index b4d69103d722..e149eee61588 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -87,7 +87,7 @@
 #define ASPEED_CLK_MAC4RCLK		70
 #define ASPEED_CLK_I3C			71
 
-/* Only list resets here that are not part of a gate */
+/* Only list resets here that are not part of a clock gate + reset pair */
 #define ASPEED_RESET_ADC		55
 #define ASPEED_RESET_JTAG_MASTER2	54
 #define ASPEED_RESET_I3C_DMA		39
-- 
2.39.1

