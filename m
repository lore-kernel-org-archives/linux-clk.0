Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B133C43217
	for <linux-clk@archiver.kernel.org>; Mon,  1 Nov 2021 05:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07085610CA
	for <linux-clk@archiver.kernel.org>; Mon,  1 Nov 2021 05:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhKAFXk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Nov 2021 01:23:40 -0400
Received: from [113.204.237.245] ([113.204.237.245]:39242 "EHLO
        test.cqplus1.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231267AbhKAFX2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 1 Nov 2021 01:23:28 -0400
X-MailGates: (compute_score:DELIVER,40,3)
Received: from 172.28.114.216
        by cqmailgates with MailGates ESMTP Server V5.0(16723:0:AUTH_RELAY)
        (envelope-from <qinjian@cqplus1.com>); Mon, 01 Nov 2021 13:02:43 +0800 (CST)
From:   Qin Jian <qinjian@cqplus1.com>
To:     robh+dt@kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, maz@kernel.org,
        p.zabel@pengutronix.de, broonie@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        wells.lu@sunplus.com, Qin Jian <qinjian@cqplus1.com>
Subject: [PATCH v3 1/8] dt-bindings: vendor-prefixes: Add Sunplus
Date:   Mon,  1 Nov 2021 13:01:51 +0800
Message-Id: <1a5f86dbfd1e4053cd2a69111fc7b277a49bc98a.1635737544.git.qinjian@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1635737544.git.qinjian@cqplus1.com>
References: <cover.1635737544.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add vendor prefix for Sunplus Technology Co., Ltd. (http://www.sunplus.com)

Signed-off-by: Qin Jian <qinjian@cqplus1.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102..50d4ee5ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1131,6 +1131,8 @@ patternProperties:
     description: Summit microelectronics
   "^sunchip,.*":
     description: Shenzhen Sunchip Technology Co., Ltd
+  "^sunplus,.*":
+    description: Sunplus Technology Co., Ltd.
   "^SUNW,.*":
     description: Sun Microsystems, Inc
   "^supermicro,.*":
-- 
2.33.1

