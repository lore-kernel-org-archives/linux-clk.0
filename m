Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2A3C38145
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 14:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbiIHOhe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 10:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232120AbiIHOhb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 10:37:31 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FA9E5808;
        Thu,  8 Sep 2022 07:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662647850; x=1694183850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ug90OKgSPt4wB/1ZmaIV7HmjkMf+svSqXqp/wpq5qsQ=;
  b=AQdOWN0aRhHmcSS8Fgumct8yZCw+2Td87Dm0NnZlo4gwW+l+oNMbq6Qs
   50Ai770mEBHvcE6yHY/lafbqbAY3bIqGF4/eIg6qbWf/i6lHtECwVm8CO
   tBEwxsbMDjU4kp/vBoEqSnOMRv5XffmI6D12bIHnlBmqDkDXzp8vPuMrW
   wuArPaHjjpqul+5grKjLzbxaMhQOudbAxax5Qp9tER2s/f1FiGQSoFgJ8
   Ubul2nYZP5KEEHJssxTtCidiMRS7v6FTFSx7B7/2Ij+X18mQrIAPZJzQX
   h3eyzLV9lClQxYyyq2Ad7bfOufxzFUnrB+JNctrS2E0UXK9Cy2bj5EjQM
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="112762304"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 07:37:29 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 07:37:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 07:37:26 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Hugh Breslin <hugh.breslin@microchip.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: clk: rename mpfs-clkcfg binding
Date:   Thu, 8 Sep 2022 15:36:48 +0100
Message-ID: <20220908143651.1252601-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908143651.1252601-1-conor.dooley@microchip.com>
References: <20220908143651.1252601-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The filename for a binding is supposed to match the first compatible,
but the mpfs-clkcfg file did not follow this policy. Rename it to match
so that when other mpfs clock bindings are added things make more sense.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
rename to Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index 016a4f378b9b..212228734ffd 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/microchip,mpfs.yaml#
+$id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip PolarFire Clock Control Module Binding
-- 
2.36.1

