Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B58C77B7D
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 06:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236207AbjEJG4z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 02:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236206AbjEJG4x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 02:56:53 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407D72D70;
        Tue,  9 May 2023 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683701808; x=1715237808;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZFhKAZ4HZaDBzYaP83HkJGOS7RcADsAIbf0ZWOh4a5I=;
  b=PQQ92uIdPC5jhyqDRkG7P+ft/Di5lRxvZc9UIaozaXeg/aFqFRBATsw3
   MSxUt8oBEECT8nv0sSjEWhSSu2aQAID5gsVMwo2KkbtQXc+0Za+PiiyS/
   juqScWIRZvIpCWL7d8pOw1v53VoJSFuHPtlaWEApC4SYcXGChOolUt7kp
   An7XLH4KVXZ+RYgM95usKcDDdA9RwzAQPZ1BxeZgwWA/33flAFOHiHUAB
   i9i1gymSfETipSaNiPhhKBV3vTq5l/Dyx8FKLYVfEG4fksnk10jg+pU0+
   qQ56zdyzkfZpJrH/4kNVpvDgaYO1SfruzgeXlSn0N5lHKP0JkulPJ8fvr
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818400"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 10 May 2023 08:56:45 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 10 May 2023 08:56:45 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 10 May 2023 08:56:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1683701805; x=1715237805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZFhKAZ4HZaDBzYaP83HkJGOS7RcADsAIbf0ZWOh4a5I=;
  b=G/jYDDOwSiumTBO6cZhsUVVTqktRiReSkGU4GqAGJUld2wAe7pvNkUGR
   +Z8JSFMOQBef7pC3tec8Xg4BzZ4RubVgpm7npHXF79RojZOICdNOPKUEu
   bhlNTrNClgqp1xRI/01xnUvq0iAq5RXj8K2lejT7PXqSyhtY7S+4+BHMo
   GNEq4LDJ21B/1BZOXJmlnWshPVsUerO5e93zaB6E7icj0el/p0rfFQZhw
   pTRkG3FcH7PszbhpovfkfY0T4D2oEMppYs7uHxRDIxNUoFZM8abS1PWyx
   Z5uWU4Y9DTzwMJtaJzfIboJJPsjMAY4fAimvCXEJeOgXOUoJvQkJm/d+G
   A==;
X-IronPort-AV: E=Sophos;i="5.99,264,1677538800"; 
   d="scan'208";a="30818399"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 May 2023 08:56:45 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5F867280056;
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
Subject: [PATCH 1/4] dt-bindings: clock: imx8m: Add missing interrupt property
Date:   Wed, 10 May 2023 08:56:41 +0200
Message-Id: <20230510065644.1317577-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

All i.MX8M SoC have 2 CCM interrupts, called:
* Interrupt Request 1
* Interrupt Request 2

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Admittedly despite listing them in the interrupt list, there is no
further description.
If it is deemed these IRQs are useless, the corresponding property in
imx8mq.dtsi should be removed instead.

 Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
index 0dbc1433fede..80539f88bc27 100644
--- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
@@ -24,6 +24,9 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 2
+
   clocks:
     minItems: 6
     maxItems: 7
-- 
2.34.1

