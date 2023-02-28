Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD4FC7EE30
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 09:16:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjB1JQ5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 04:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230520AbjB1JQ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 04:16:56 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EFB12BEEE;
        Tue, 28 Feb 2023 01:16:55 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 7338D20934; Tue, 28 Feb 2023 17:16:49 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677575809;
        bh=FKACMzYaX4ajqnkME7t+Nf3YFy/ELpU0UjtKWf1c9Eg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=lBox6KqiZxODjaTsgyXm/xfJOqZToJvnSGkChDNfCzjv7lgmycNAB04qGnAPntZ4I
         gH5WjStpOULLwMPxGnsJeMutaxcGvgeauQEUUFr1nsn+6sXKuRtLwwS3b0IuH04sgc
         Z1BOMemeDNL2VmSs0KDgMZtFyxy+laf3y14roGuO8UyU2tgYzzEauWeFk7p8V8M+C9
         329vxV7RKRwin5J/xGHTyrmUKf6gV/P4H0xX4HuhqKSCLzwjETzyj3IIcwwpG5vHTP
         9lfLX8j/MHN6UR8YglzFra53tkiRwceTDjpYQazribBaz1i29tl1Pdalyy1NZ3g9Dz
         nK2xI6R35AF3A==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 5/5] dt-bindings: clock: ast2600: Add reset config for I3C
Date:   Tue, 28 Feb 2023 17:16:38 +0800
Message-Id: <20230228091638.206569-6-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228091638.206569-1-jk@codeconstruct.com.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add reset line definitions for the AST2600 I3C block's reset inputs.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---
v2:
 - reword commit message
---
 include/dt-bindings/clock/ast2600-clock.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index b4d69103d722..b1c129977910 100644
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

