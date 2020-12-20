Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64740C4361B
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 08:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2930F22DFA
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 08:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbgLTI7P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 03:59:15 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:36597 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727407AbgLTI7P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Dec 2020 03:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608454755; x=1639990755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dexAGsPwcLF7Rp2Ug6yi7qKYWhXCqiGibm/yO29ueOo=;
  b=RCMXKsx3NwK48Fqn2FZFLsKVa/6O0LKdCF3S1CTqJmoEx3tevg+Ir7RG
   KlaqGqzO0gNbcXZyu1UfBMA2rOvjnXR7xU2DFP5GgNWXVdTVFspbvFBhJ
   YNErOzOa9+uAhxtYc8Ai2lsF7DX9fIIB0XXrxaJC6X8onIiUqFvM/q1Hl
   QnCyRYzXpSl3oS77vVWGpJf+Oxyh/A2qUPL24+IZyRXKGH6QZWfDRfF5T
   gOlhEmrFLXUVIKHCoVAVzgfmVP3TBA/Y8ecc9ehcMGnq9Mep43pdmq4eF
   2p5xiL2nGdqQKhapmdGz49xiq+Ls7hlkxWZZuRLiWS2oHB0AkyT6Mlzzm
   g==;
IronPort-SDR: iET+S48DfaXlQX4eji2632acRPqvasl2btjmkHwIgkMWz+gJDCO1rOmnUllvNLofUkgjZRwTlH
 rlF6YMjIa13bieufTsxN3pAuPwRko+9/iHBDP5xMFkSheRss1lB9s4MeHVNTXBmnvIwamBUQud
 xnwpW61AMw++2aVcXB/2AxJiz56de0DCjONndWRak5xj0zJk1hX2qMv0BCHaOXtRigtkNyKlyk
 OzY76z++/cN9CcT11lV7F0y5uW6JNz1FAyl2sWQZ6egI44LRuSGH4PL+pcG9FCsnsoeUgHq4Ru
 3js=
X-IronPort-AV: E=Sophos;i="5.78,434,1599494400"; 
   d="scan'208";a="155618013"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2020 16:57:30 +0800
IronPort-SDR: D6LAVp/h4BbcDrVwwx7j7GCS9UJIY4f5RZUET3tf4V7qheFREd1uRlvY6bIdOmG2GN2izvXrH6
 0JdEmgzkAOWFyOjdn5Td7/EdO6JoO+7d2KMMI32LszEdoKLo0GUshz/To0k6Of98ty4tiNpThg
 takoCUWPhpqs+P124tXNpb4C9VvOvsPjWFsprTDy4ieQx5iRJ0Bv2UaXOMFBM+7KEBAWM7Vo3g
 K1BgNugF307aUpCFVF7Vs5oJKylj4YDyT1TkNMHQpI44rW8/+V0ZIFhe3erD74vDYg+WE7iyqG
 tadvnJtdUqOCfEXI7qY8n/SH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 00:42:43 -0800
IronPort-SDR: rZyt6782PnQs1XA3wVu3QoxQ7AGgNwbQqkFsQi0hpG+qJVq3uuvzyo6GSakCZWZzQY0SVqwJf8
 dd34kNS+3+A6Su3R3qRtpJ8B7lkFONOTV9ryf7H6OsD8WPUds4668nWJd3I/0ls5sTUF1lXNde
 OiJGF10LuWWj18PncSe3hNMOT5VKYmkaNqhXToc5Ag9BavlQ7d8vFSJwP2kaZhmYNJE5Oe5RfP
 Fyhx44mVf202Dc5JOS6Cmp9bUeREu4eNJMWKPEz6eScIOGHRljbrEfYSrJeom+Dq9ZxOasA0gA
 IhE=
WDCIronportException: Internal
Received: from twf009363.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.70.7])
  by uls-op-cesaip02.wdc.com with ESMTP; 20 Dec 2020 00:57:30 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 1/2] dt-bindings: Add Canaan vendor prefix
Date:   Sun, 20 Dec 2020 17:57:24 +0900
Message-Id: <20201220085725.19545-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220085725.19545-1-damien.lemoal@wdc.com>
References: <20201220085725.19545-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ffaf833b97ee..041ae90b0d8f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -187,6 +187,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.29.2

