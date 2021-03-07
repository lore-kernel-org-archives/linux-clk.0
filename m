Return-Path: <SRS0=MqlC=IF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E4EC433DB
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94CB064FF0
	for <linux-clk@archiver.kernel.org>; Sun,  7 Mar 2021 14:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhCGOSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 7 Mar 2021 09:18:23 -0500
Received: from aposti.net ([89.234.176.197]:51642 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232147AbhCGOSW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 7 Mar 2021 09:18:22 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/6] dt-bindings: clock: ingenic: Add ingenic,jz4760{,b}-cgu compatibles
Date:   Sun,  7 Mar 2021 14:17:54 +0000
Message-Id: <20210307141759.30426-2-paul@crapouillou.net>
In-Reply-To: <20210307141759.30426-1-paul@crapouillou.net>
References: <20210307141759.30426-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add ingenic,jz4760-cgu and ingenic,jz4760b-cgu compatible strings for
the JZ4760 and JZ4760B SoCs respectively.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
index c65b9458c0b6..6d6236e02c22 100644
--- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
+++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
@@ -22,6 +22,8 @@ select:
         enum:
           - ingenic,jz4740-cgu
           - ingenic,jz4725b-cgu
+          - ingenic,jz4760-cgu
+          - ingenic,jz4760b-cgu
           - ingenic,jz4770-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
@@ -49,6 +51,8 @@ properties:
       - enum:
           - ingenic,jz4740-cgu
           - ingenic,jz4725b-cgu
+          - ingenic,jz4760-cgu
+          - ingenic,jz4760b-cgu
           - ingenic,jz4770-cgu
           - ingenic,jz4780-cgu
           - ingenic,x1000-cgu
-- 
2.30.1

