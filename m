Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71989C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 07:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234476AbhLPHPy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 02:15:54 -0500
Received: from mx1.cqplus1.com ([113.204.237.245]:52272 "EHLO test.cqplus1.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234568AbhLPHPv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Dec 2021 02:15:51 -0500
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
        LIVER,40,3)
Received: from 172.28.114.216
        by mx1.cqplus1.com with MailGates ESMTP Server V5.0(4825:0:AUTH_RELAY)
        (envelope-from <qinjian@cqplus1.com>); Thu, 16 Dec 2021 15:08:24 +0800 (CST)
From:   Qin Jian <qinjian@cqplus1.com>
To:     robh+dt@kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, tglx@linutronix.de,
        maz@kernel.org, p.zabel@pengutronix.de, linux@armlinux.org.uk,
        broonie@kernel.org, arnd@arndb.de, stefan.wahren@i2se.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        wells.lu@sunplus.com, Qin Jian <qinjian@cqplus1.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 01/10] dt-bindings: vendor-prefixes: Add Sunplus
Date:   Thu, 16 Dec 2021 15:08:03 +0800
Message-Id: <2e74a1339a5ea54d92fdc4d1998a2b169e23b82b.1639560427.git.qinjian@cqplus1.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639560427.git.qinjian@cqplus1.com>
References: <cover.1639560427.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add vendor prefix for Sunplus Technology Co., Ltd. (http://www.sunplus.com)

Acked-by: Rob Herring <robh@kernel.org>
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

