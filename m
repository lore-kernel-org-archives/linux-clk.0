Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BDCC636CC
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 03:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBMDt1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Feb 2023 22:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjBMDt1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Feb 2023 22:49:27 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3E8210A;
        Sun, 12 Feb 2023 19:49:26 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 961DB20260; Mon, 13 Feb 2023 11:49:21 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676260161;
        bh=OWW6CPxhYNTq68sFSQPTpAgBBBW4oBWfagM/TWRLx1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eQ4372S589NB6/pkPZgcWOuAkVEZGRl7mL0+7TfyIzv3WO42+c03xegh18tXR0Kun
         5SrM3ZwoPRsxDkPrJknjdmQMePDS1OXghApDYtz57I1/j3M9s3B0ymX6KxZjW/pVrF
         62+flPJCcUfHDSWSCXj6wnerLlY/4a3LigqMsi9yrS+8lnyXNTl4ClHPQyX9/iaMJr
         O8jCXm5KGuVJ2ndYWyTjugL9b/KXOYEuZ5bfKIY3eDb1TuU9DOTEn0xj23TbcBp/3v
         pI9Z34itu8EYafaMafwH9RYrHp5r1Czr0lGObta5BEJ46xR5goNvAeh/UyjQdZhcuX
         Lk4K3APxGk8/w==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <jms@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] dts: ast2600: Add reset config for I3C
Date:   Mon, 13 Feb 2023 11:48:33 +0800
Message-Id: <ee5f26309453d6957b7908fd0db36728b20ea822.1676259904.git.jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676259904.git.jk@codeconstruct.com.au>
References: <cover.1676259904.git.jk@codeconstruct.com.au>
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
index 98dc82702755..b3cc8c6fdcef 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -91,6 +91,12 @@
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

