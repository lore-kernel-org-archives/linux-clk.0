Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED91C7EE26
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 06:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbjEJG5M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 02:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236247AbjEJG5I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 02:57:08 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C2EE0;
        Tue,  9 May 2023 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683701818; x=1715237818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qvpvXVoD5oa71/tUsH8l5qk5L7RfOsuYx7ypoqxESoI=;
  b=pDjFFL8tIfeT0QKCsyPQVjQywHPe4HXm0d1SOI0HSmdwVn/8C7l4KlJX
   BR0JAgKdFKTs1eoDbP222B9B+F2Iew5BUjPtAnd5A9vvRQvPKJseztvT+
   61f+CmO/nFv0XrxtLVUl7E3C3WDN3OMayV7joaG2tRu4FgCWEOyQXVi0c
   Ua/FZb7DM8mIBIpJxBebAGyDO3N8X7jd7iYDWxMiJwyRUOgGoowiSh0rj
   o27qAJo9RSDpTnXgYYwni3KUjcXIiYz05gyuwAI521kIuaux8x4NAleSd
   4b2CxmWEzf5Q8j0mf3l4Q4rDhFp3mL4voNc4kZSOKlEJs/LL9uUjldti0
   A==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818406"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 May 2023 08:56:46 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 10 May 2023 08:56:46 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 10 May 2023 08:56:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683701806; x=1715237806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qvpvXVoD5oa71/tUsH8l5qk5L7RfOsuYx7ypoqxESoI=;
  b=n67dBp73tAttvXWUeBEyqrDA5M+e/WHw6Fk4sh/9atbAheON/QoyWbis
   Rou1LyN0oy3Uj6Im7NlODb5AkZbiu2j8RXm8r3EW85zcoClpg0MNbK48G
   jI5kzOKgrxkuIr+5irNljFzogaEpZ6Id5t4ah+J1SoVNALKkAqnUGE62s
   OyiwRu7Xg0e7045w4R1mUGh23Pv0jIijmvq/sY++UrxsXzd6eU/BuIbAO
   llI81F0rHFDarwi6cBdGvf7NsS9/0AgoC0BprO+6UKfRgtE2NaFQJJLdg
   ZR8VXsDcR2QIiMxZOjdgBS49xA+tGspLMNNgR3oQ7kA0aW92eG3+NYG7V
   g==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818405"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 May 2023 08:56:46 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 3C46B280073;
        Wed, 10 May 2023 08:56:46 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: dts: imx8mm: Add CCM interrupts
Date:   Wed, 10 May 2023 08:56:44 +0200
Message-Id: <20230510065644.1317577-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
References: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add both CCM interrupts as mentioned in RM.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index d6b36f04f3dc..f56baa52bd10 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -635,6 +635,8 @@ snvs_lpgpr: snvs-lpgpr {
 			clk: clock-controller@30380000 {
 				compatible = "fsl,imx8mm-ccm";
 				reg = <0x30380000 0x10000>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
 					 <&clk_ext3>, <&clk_ext4>;
-- 
2.34.1

