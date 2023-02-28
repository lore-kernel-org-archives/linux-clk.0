Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67E9C64EC7
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 09:16:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjB1JQ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 04:16:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjB1JQx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 04:16:53 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36FE22DF3;
        Tue, 28 Feb 2023 01:16:51 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 8D4F920260; Tue, 28 Feb 2023 17:16:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677575807;
        bh=2Fbp+auGCvRHh4yggvZQpa3HffMqqxxLhK2seUldcEs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=mNLTZLtEnqYjVn/7STE1EKjkIqCAEONGI8Rg3iKZs3dGEIo7OX45+87c5VX0ibnqJ
         NfhbTbFUrIEcpQEXG/d1eYRf4uIAbvHNCcm50AV3SXzLxyXB+pckjFfHmsp5pHquou
         WjTrcQ1xdOQYbyYk1Ix+VWn6yddDfmyxJbR/huzDbBCXFAlvoY1n89BJEdqV9yWYSt
         PHcREC8lo+vm4rQ+g1Zd4SsHdc/GyNaoH/46u6bBIhNVzJGyvpnh4ViXq0vNZCIcvF
         l1r/iEAYCOYMLPoEHEVQWIffmU4Iz19h6aQa2rxInaRiflrU47+7CKN3pNR/A/lNUz
         cZpYhGM1hqCJw==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 1/5] clk: ast2600: allow empty entries in aspeed_g6_gates
Date:   Tue, 28 Feb 2023 17:16:34 +0800
Message-Id: <20230228091638.206569-2-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228091638.206569-1-jk@codeconstruct.com.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We're about to remove an entry from aspeed_g6_gates, but we won't want
to alter/reorder existing entries. Allow empty entries in this array.

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

