Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D94C77B7C
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 06:57:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbjEJG5K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 02:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236220AbjEJG47 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 02:56:59 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D001FF7;
        Tue,  9 May 2023 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683701815; x=1715237815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CxVDbE0TwBS62jjoTPipTuAbiqqUsK9ekfQtY1fB0IE=;
  b=emvDry6qdKY8XTEeX36JQUIx6fGjNHZrhyrsEk3vh2qm3dN2m7owZ+Lw
   3Rs5SGpFbh0Jgug3xh+E+gt4WhfXuhQANAJ6LBA2ahWFiqypT3ccVi9LI
   1EYdb1FHeQP06Y5znUHel5YUzIYF4Xrz5dLTe9pXH74T+fUW/irGVE9oz
   rJK44xbFc5+pasQJCKxIFp1aGX5O7eHnwm717jQSSqW5v3o7wLTooImIg
   3ixMPkG/wKUmMVtzORP5OX6gvJbWGTnXVDVSqUy4d1jWDpsRckadKsvw7
   kRwaPQq8Zd+v0EHbioZ6NE2918gd6BmiIUQlScKULb8pLNLYZPzuFWQHM
   A==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818404"
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
  bh=CxVDbE0TwBS62jjoTPipTuAbiqqUsK9ekfQtY1fB0IE=;
  b=LGLB3hzlUlqG9E0URui/NFqZ+rtnP1hp9E6CKME2jbtF6/H9xLvHcsvr
   wbiidEfGT6k4RPQ6Jed1f45MtR6lH6lmz3RPqYkkLjTuH1V2yR53fC2+k
   PrBqQpwmbi/MlBPqVvPeXpB6/uWJRF0QN0y4b1MNUmWqQYGcHXtFgZaBk
   9JF46sXamxehKm+6/cLXRK3AxpSz7jpypuJeMges2TAw5xs7IQEXI9YSZ
   F7J3hVbldlos7Kx5vrjEZ4D5lK2l0uluqSZv2P6EPQNd+zUI96G0UpmR3
   2Cdo9qa+UPR6hiCAP4sXIdNLo1VcrPC82XiaxSEyViVF/y+bq6e5g/njC
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818402"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 May 2023 08:56:46 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id E738A280056;
        Wed, 10 May 2023 08:56:45 +0200 (CEST)
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
Subject: [PATCH 3/4] arm64: dts: imx8mn: Add CCM interrupts
Date:   Wed, 10 May 2023 08:56:43 +0200
Message-Id: <20230510065644.1317577-3-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 8be8f090e8b8..964c29701f1c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -636,6 +636,8 @@ snvs_pwrkey: snvs-powerkey {
 			clk: clock-controller@30380000 {
 				compatible = "fsl,imx8mn-ccm";
 				reg = <0x30380000 0x10000>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
 					 <&clk_ext3>, <&clk_ext4>;
-- 
2.34.1

