Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24CEC64ED9
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 06:02:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjBMGCi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 01:02:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjBMGCg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 01:02:36 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6981EFA7;
        Sun, 12 Feb 2023 22:02:34 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 42284202DA; Mon, 13 Feb 2023 14:02:33 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676268153;
        bh=eLUPAGT631b5vX2q9I73MK63Lf+Bgpoyf5/+0x8s3ik=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FgUuQAGLoAEGwzQboFMDhqrlXaR04dkNKLyIkOj5LNE4I8PKx4HY2D4oVf/QBdprh
         G/68qdLRdSn2cS1HwumYHALIgdoGlCJ8jq3TPRRmctEhdie6JaGqZrclrs+ybknMUB
         Ovp/OTuZu/W010kW+Qu+C1x/qS0r5ATViVOUuvokBiD7YWEuH2kyE6Q20eQfbiOKyC
         CeavgQJq0HjItnGYCt7clFRIpZUhgboKl/Zb9CKdavLDBR5WP1phtja66TxkI7jMAj
         9RhV3WfIh+MUy6J6wLdYJ3jZZIHB1Jn9M37wzWzvo9UBEjNSRkuI3RKV/6P1BfxPaU
         FtDy8/Wc0lOMw==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
Date:   Mon, 13 Feb 2023 14:02:08 +0800
Message-Id: <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676267865.git.jk@codeconstruct.com.au>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This change adds the reset line definitions for the AST2600 I3C block's
reset inputs.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
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

