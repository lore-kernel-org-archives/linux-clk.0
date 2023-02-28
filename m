Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E70EC64EC7
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 09:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjB1JQy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 04:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjB1JQx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 04:16:53 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FC12BEEE;
        Tue, 28 Feb 2023 01:16:51 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id F04EB20576; Tue, 28 Feb 2023 17:16:48 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1677575808;
        bh=KIHINMPGbtJjsv3S4RJmD/8f8C4tzkRdHYGEAu/4ejs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Pj0FWN23Jy13asHJzPyqToinZKl2Q5AXdYK05Bs0CQmrZ/yp3VxwBMHlxpMDSWMwv
         5YevFjMkkhEzr60rUDmODgy2YVG5uJrQLRlaJltnc9R0JzuINJxvEm/lwuNrBOu77w
         sNcn0d0xvJfzxa7gAPvxs2dkznIIslrSdF4+g+9KPqud+f2K39CiYm6Nr3tRRWSOBa
         +hx8Nil70YsBs92a4FZDC9w0k+VQSNs53/9WEKMhb4GrPz3riYZUTsgxElyVcTTLgo
         4JARM+ciVEbmvowjLYg8Q0s1CKrSYyqWNA7TSswIej6bzPfqWxkXynseo/gNZWTw0V
         qx/ceG8LlwFWA==
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 4/5] dt-bindings: clock: ast2600: remove IC36 & I3C7 clock definitions
Date:   Tue, 28 Feb 2023 17:16:37 +0800
Message-Id: <20230228091638.206569-5-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230228091638.206569-1-jk@codeconstruct.com.au>
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
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

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

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

