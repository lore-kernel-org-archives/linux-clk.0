Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5F5C7EE24
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 06:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236208AbjEJG5J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 02:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbjEJG46 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 02:56:58 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E6710D0;
        Tue,  9 May 2023 23:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683701813; x=1715237813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=29RKwdSliS89d4ZqJY4C3XObEFTFu9PqO7qNhrMoerQ=;
  b=UOSmx61QIi9KJPhl09vZE1jYVRkV0vIWDKfsuMp54EYVclb5RzuRIzph
   Gn/tNpUt+94CzCsgWlmFYxSrVRzqTTxzOUBHNF6RJXZRpqMeGMSk+OvrO
   CG+SMeUsekWV4cHs5YfgIBwhamT3jMIA+sdTOdhH+y9dD7FQ2dYW/0Dhe
   JMEjv09k37rA7VXN6DC4jMrxluAwp3LVwqPR1bUOSeEqsuiO8bhl0fNxe
   IBhRsvz79p+zWVg8Yx5zCILSWs2aJUsjwA/D5NhbIpUtsnKQCcYlwXemo
   c1jnnijSFPhN64qBgrZZHJGXVTqf24t9zlDjTWF6hdwTEQ/t0inbNigF3
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818403"
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
  bh=29RKwdSliS89d4ZqJY4C3XObEFTFu9PqO7qNhrMoerQ=;
  b=GK5f5LccaZIytS4io8AltMJ7boEkdl+CeJzd1s4fnVpP4vLcr1tWf4DR
   Q68awzxVh5bPC3GoJ1HLg5uv0wl9vCIF4jEHdVGjZX/v+gDPi9/BR/fX3
   EIEja0GB3plSsHYs3Fb+FIl+QnT4EuiL9HcPw/vI6lFADy2BgR6/wP8F1
   C6msspACrPLd8ooeKjIS8lpDprN3IcMn596sCTcTa6yCcg5pxuWTC36Kg
   R9qCd8nGCuW9zW5LuXA6vKrA+nu2kSYCcJ82Ka46v9q5l8r4htNYHciob
   A8gKRv+j48hXQLtfWSmqiQMkNrAw4Ch18tdEHdYbYtZ58bvGPFbsZcCPT
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818401"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 May 2023 08:56:46 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 9ED85280072;
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
Subject: [PATCH 2/4] arm64: dts: imx8mp: Add CCM interrupts
Date:   Wed, 10 May 2023 08:56:42 +0200
Message-Id: <20230510065644.1317577-2-alexander.stein@ew.tq-group.com>
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b94942305b4c..7a3243bad41f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -528,6 +528,8 @@ snvs_lpgpr: snvs-lpgpr {
 			clk: clock-controller@30380000 {
 				compatible = "fsl,imx8mp-ccm";
 				reg = <0x30380000 0x10000>;
+				interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
 					 <&clk_ext3>, <&clk_ext4>;
-- 
2.34.1

