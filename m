Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5E4C43381
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 15:33:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86C642083D
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 15:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfCLPc7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 11:32:59 -0400
Received: from hermes.aosc.io ([199.195.250.187]:40108 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbfCLPc6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 12 Mar 2019 11:32:58 -0400
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender: icenowy@aosc.io)
        by hermes.aosc.io (Postfix) with ESMTPSA id 6AA2715FCC3;
        Tue, 12 Mar 2019 15:26:07 +0000 (UTC)
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 09/14] dt-bindings: vendor-prefixes: add SoChip
Date:   Tue, 12 Mar 2019 23:22:51 +0800
Message-Id: <20190312152256.35574-10-icenowy@aosc.io>
In-Reply-To: <20190312152256.35574-1-icenowy@aosc.io>
References: <20190312152256.35574-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Shenzhen SoChip Technology Co., Ltd. is a hardware vendor that produces
EVBs with Allwinner chips. There's also a SoC named S3 that is developed
by Allwinner (based on Allwinner V3/V3s) but branded SoChip.

Add the vendor prefix for SoChip.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index bb6f6e8a2eee..b03a2a49440b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -377,6 +377,7 @@ sitronix	Sitronix Technology Corporation
 skyworks	Skyworks Solutions, Inc.
 smsc	Standard Microsystems Corporation
 snps	Synopsys, Inc.
+sochip	Shenzhen SoChip Technology Co., Ltd.
 socionext	Socionext Inc.
 solidrun	SolidRun
 solomon        Solomon Systech Limited
-- 
2.18.1

