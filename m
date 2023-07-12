Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEF4EB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jul 2023 11:55:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233338AbjGLLzN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbjGLLyv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jul 2023 07:54:51 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ECF626BB
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 04:54:00 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1b776754932so76767fac.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Jul 2023 04:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689162792; x=1689767592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzbz0hc2TWNvLrywr/bdFJaS83jkhqY5GQagZ14q+5M=;
        b=pHYiCJNf6rQn4QA3loFIU96JV9M5tD6sn5G+/nD7kM1VLUZhRkKKjn6oZXca8/psz1
         7kW8UgYyxdGTaSOkPTVanMAK+29MDUem0kNVaquJ2vUXtRK112AWANNRcm3bO22x/kJa
         RaPtkAKIx8KJNTm9kGlAAZ8T8FyWcsHm61uYT+/5B1+lMowQW3E1VrjUVzdWI3bHf/Hk
         k5bR33BqMe6N6via32+8onAzcSf5iPdOZ7Mx9+g9EobxJOfy4P87JHXbHOUNk6cEVvsl
         5HNK/yRlDLx4CQNpsC244UE9AlvvhjmI5Y270td7UgPkSfquNnK5v2UPusYEcukJvmj8
         Efkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162792; x=1689767592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzbz0hc2TWNvLrywr/bdFJaS83jkhqY5GQagZ14q+5M=;
        b=L324TPZvqh51h2E4A5++DTIx/4YMlxmiQYCqrL86LuVdhRae7zBzr3g05HA1LkOHZ6
         OyFqqU/wBRIT1xE4Q3KBH6dznyYxYJwi2GJjRnpwpCYQJNJ45KlVzzxg2+baiYrmUFMX
         HQg62UAvoyQiQyCIlUg2qUr3ujPY09hWLR8jXDPOX8BqchGy8B7UZJjoKbx6G75wFXKL
         AWiZIUR4F0hWKGGsKFfMryHI6E1SCAGlZNjgqz6NkkqVVC5V50pLDWZTOflCDdN3fbyk
         zE5PmFoTHcNhVaQXHYf4g2CBc4Y44cV9//oV12A2SEnqExfWyqoqKV/QGTJ/NRT7HEan
         LwtQ==
X-Gm-Message-State: ABy/qLadiEHkPSjKQISaLb/aDNSKmz+g8nMQw+EgaXYcSdelfNLz70m4
        BWivZYgc/bSxUesHhsBA1dE=
X-Google-Smtp-Source: APBJJlEaara2sS8sPaw9c00SpEacflV6uILENpS/lJQD/UOpWlL/WSIiqyQ2lYO041Jwy22lZeFxxA==
X-Received: by 2002:a05:6870:548d:b0:1b7:5f4b:c686 with SMTP id f13-20020a056870548d00b001b75f4bc686mr3464544oan.2.1689162792213;
        Wed, 12 Jul 2023 04:53:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ce5f:dbc6:1eb6:2900])
        by smtp.gmail.com with ESMTPSA id zh27-20020a0568716b9b00b001a663e49523sm1905890oab.36.2023.07.12.04.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:53:11 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     shawnguo@kernel.org
Cc:     hs@denx.de, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
        abelvesa@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 2/3] ARM: dts: imx6sx: Describe the default LCDIF1 parent
Date:   Wed, 12 Jul 2023 08:53:00 -0300
Message-Id: <20230712115301.690714-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712115301.690714-1-festevam@gmail.com>
References: <20230712115301.690714-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

A suitable default for the LCDIF parent is the PLL5 clock, so
describe it in the device tree.

The imx6sx clock driver harcodes PLL5 as the LCDIF1 parent, but
in preparation for removing such hardcoding, describe the parent
relationship via devicetree.

There are some boards that may want to use a different parent
for the LCDIF due to EMI reasons, for example.

With this approch, the user can change the LCDIF parent in the board
devicetree if needed.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Rebased against 6.5-rc1.

 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index 41c900929758..0d549e1f3ced 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -1305,6 +1305,10 @@ lcdif1: lcdif@2220000 {
 						 <&clks IMX6SX_CLK_LCDIF_APB>,
 						 <&clks IMX6SX_CLK_DISPLAY_AXI>;
 					clock-names = "pix", "axi", "disp_axi";
+					assigned-clocks = <&clks IMX6SX_CLK_LCDIF1_PRE_SEL>,
+							  <&clks IMX6SX_CLK_LCDIF1_SEL>;
+					assigned-clock-parents = <&clks IMX6SX_CLK_PLL5_VIDEO_DIV>,
+								 <&clks IMX6SX_CLK_LCDIF1_PODF>;
 					power-domains = <&pd_disp>;
 					status = "disabled";
 
-- 
2.34.1

