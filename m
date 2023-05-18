Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DE1C7EE31
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 10:12:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbjERKMp convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 06:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjERKMo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 06:12:44 -0400
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8941BDB;
        Thu, 18 May 2023 03:12:42 -0700 (PDT)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
        by ex01.ufhost.com (Postfix) with ESMTP id 07C1624E251;
        Thu, 18 May 2023 18:12:41 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 18:12:41 +0800
Received: from localhost.localdomain (113.72.146.100) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 18 May
 2023 18:12:40 +0800
From:   Xingyu Wu <xingyu.wu@starfivetech.com>
To:     <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        "Michael Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Conor Dooley <conor@kernel.org>,
        "Emil Renner Berthing" <kernel@esmil.dk>
CC:     Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Hal Feng <hal.feng@starfivetech.com>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: [PATCH v6 07/11] MAINTAINERS: Update maintainer of JH71x0 clock drivers
Date:   Thu, 18 May 2023 18:12:30 +0800
Message-ID: <20230518101234.143748-8-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
References: <20230518101234.143748-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.146.100]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a new maintainer which is in charge of StarFive JH7110
STG/ISP/VOUT clock drivers.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..2a0496448b7f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20101,6 +20101,7 @@ F:	drivers/mmc/host/dw_mmc-starfive.c
 STARFIVE JH71X0 CLOCK DRIVERS
 M:	Emil Renner Berthing <kernel@esmil.dk>
 M:	Hal Feng <hal.feng@starfivetech.com>
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/starfive,jh71*.yaml
 F:	drivers/clk/starfive/clk-starfive-jh71*
-- 
2.25.1

