Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05229C77B6D
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 08:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjCaIgV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 04:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbjCaIf4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 04:35:56 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B08D1D912
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 01:34:59 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id i9so21597231wrp.3
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 01:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OMp6WwOFyR6l2kpiboY0lzHLUJ9UsEpV8wMZ9XLNzc=;
        b=zpVKLNXIXAV4SUprLr3FH6VaLCVrQs08gq3PR6QBskuLieXpL9pEl0DVkVsySGg93E
         yLNJD1djIn/X5/LvUUqSRHXYEJVk7SAUsDK/K0+6UH1nscr58z0a2+WLSgpgFixAZ5s+
         XVlKqZi48mQZvF/zFCrX7vIRbb+FdULZG6d/Qp1a/u+lntuoZ8GZOg6zXBoOtlqkQjTl
         +3lMm0xkV7O4U1IG/ndjeBtRyTZWsdGzqvysaQJmpBAgxoXrpXG9j7WxvA4juS55aJJJ
         PrCK1zS9C4rMDksDfoq6YqSeSBN+2DD8GmU/GVEytLphbHRPoR6o2ael1PZWW4gdS9Sx
         DYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OMp6WwOFyR6l2kpiboY0lzHLUJ9UsEpV8wMZ9XLNzc=;
        b=W0i1pjXMOc9K2Kocdhf+3vJpMKPN3jacbWqfuBfLMHG2XnJk7jq+3+OEfPQ9gpEXPa
         kOzSgQAJ9y4riTpWsuAZqNZT8BxHC/N2lvLNp+xmgS0qKBJ7hb8VeBqH2srIhhB3ZsfA
         S4V/2PBxUIo+jWKY+WVgfqBlw2pXCQ1QbnUPdF3j7QgdAcjPXrrgl/XE+yzZgxmmEWWj
         65LeriyqInNmnuthNCY82RT+RoETsro+FHLhZ6HNhQXNsd7RtA9jChIqLmfqRCN9H4FF
         BRdIq/+0shhhl5DcoY5+I7001hD+fTFLTx1KlagMNOKeZyi5c1tjV4d790lCBFjUfziY
         mcBg==
X-Gm-Message-State: AAQBX9fdCM76LgjnheEHXKYNwdOv6BjPJNBCIVOLtXkFb6eRhV47HAvv
        ltxpMsrTkcqfM1apeKtWuSWYFg==
X-Google-Smtp-Source: AKy350ZEexxOqisnl/kxib2n7RjdcPxl4zAGraKXrJ/xa8HdVJ2bLN4RGB9qBmKUKQcdJQx9dqXdRg==
X-Received: by 2002:a5d:5342:0:b0:2ca:2794:87e8 with SMTP id t2-20020a5d5342000000b002ca279487e8mr19274846wrv.21.1680251698016;
        Fri, 31 Mar 2023 01:34:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:57 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 31 Mar 2023 10:34:48 +0200
Subject: [PATCH RFC 10/20] dt-bindings: mtd: oxnas-nand: remove obsolete
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-10-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sebastian Reichel <sre@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
for OX810 and OX820 nand bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mtd/oxnas-nand.txt         | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
deleted file mode 100644
index 2ba07fc8b79c..000000000000
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS NAND Controller
-
-Please refer to nand-controller.yaml for generic information regarding MTD NAND bindings.
-
-Required properties:
- - compatible: "oxsemi,ox820-nand"
- - reg: Base address and length for NAND mapped memory.
-
-Optional Properties:
- - clocks: phandle to the NAND gate clock if needed.
- - resets: phandle to the NAND reset control if needed.
-
-Example:
-
-nandc: nand-controller@41000000 {
-	compatible = "oxsemi,ox820-nand";
-	reg = <0x41000000 0x100000>;
-	clocks = <&stdclk CLK_820_NAND>;
-	resets = <&reset RESET_NAND>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		nand-ecc-mode = "soft";
-		nand-ecc-algo = "hamming";
-
-		partition@0 {
-			label = "boot";
-			reg = <0x00000000 0x00e00000>;
-			read-only;
-		};
-
-		partition@e00000 {
-			label = "ubi";
-			reg = <0x00e00000 0x07200000>;
-		};
-	};
-};

-- 
2.34.1

