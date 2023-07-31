Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7215EC001DE
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 10:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjGaKmJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 06:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjGaKmJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 06:42:09 -0400
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24552116
        for <linux-clk@vger.kernel.org>; Mon, 31 Jul 2023 03:42:08 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=6590db4e63=fe@dev.tdt.de>)
        id 1qQPkr-00DM71-2w; Mon, 31 Jul 2023 12:03:57 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1qQPkq-00CUgM-3b; Mon, 31 Jul 2023 12:03:56 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 187AC240053;
        Mon, 31 Jul 2023 12:03:55 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 6B60524004B;
        Mon, 31 Jul 2023 12:03:54 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id E9C61312A1;
        Mon, 31 Jul 2023 12:03:53 +0200 (CEST)
From:   Florian Eckert <fe@dev.tdt.de>
To:     mturquette@baylibre.com, sboyd@kernel.org, yzhu@maxlinear.com,
        rtanwar@maxlinear.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Eckert.Florian@googlemail.com
Subject: [PATCH 1/2] clk: mxl: add mxl,control-gate dts property
Date:   Mon, 31 Jul 2023 12:03:48 +0200
Message-ID: <20230731100349.184553-2-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731100349.184553-1-fe@dev.tdt.de>
References: <20230731100349.184553-1-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1690797836-8497C7FE-F6D7048A/0/0
X-purgate-type: clean
X-purgate: clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Gate clocks can be controlled either from this cgu clk driver or directly
from power management driver/daemon. It is dependent on the power
policy/profile requirements of the end product. To take control of gate
clks from this driver.

Until now, the source code had to be changed for this purpose by adding
the flag 'GATE_CLK_HW' to the LGM_GATE macro in the source file
'drivers/clk/x86/clk-lgm.c'.

This can be better handled via the device tree, so that the source no
longer needs to be changed. For this purpose, a new option
'mxl,control-gate' is added, which specifies that the gate is controlled
by this driver.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 drivers/clk/x86/clk-cgu.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index 89b53f280aee..cb4e92ea54bf 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -339,6 +339,8 @@ int lgm_clk_register_branches(struct lgm_clk_provider=
 *ctx,
 {
 	struct clk_hw *hw;
 	unsigned int idx;
+	const char *name;
+	unsigned int count, i;
=20
 	for (idx =3D 0; idx < nr_clk; idx++, list++) {
 		switch (list->type) {
@@ -355,19 +357,21 @@ int lgm_clk_register_branches(struct lgm_clk_provid=
er *ctx,
 			hw =3D lgm_clk_register_fixed_factor(ctx, list);
 			break;
 		case CLK_TYPE_GATE:
-			if (list->gate_flags & GATE_CLK_HW) {
-				hw =3D lgm_clk_register_gate(ctx, list);
-			} else {
-				/*
-				 * GATE_CLKs can be controlled either from
-				 * CGU clk driver i.e. this driver or directly
-				 * from power management driver/daemon. It is
-				 * dependent on the power policy/profile requirements
-				 * of the end product. To override control of gate
-				 * clks from this driver, provide NULL for this index
-				 * of gate clk provider.
-				 */
-				hw =3D NULL;
+			/* Check if cgu should control the gate clock */
+			hw =3D NULL;
+			count =3D of_property_count_strings(ctx->np,
+							  "mxl,control-gate");
+			if (count <=3D 0)
+				break;
+			for (i =3D 0; i < count; i++) {
+				of_property_read_string_index(ctx->np,
+							      "mxl,control-gate",
+							      i, &name);
+				if (!strncmp(list->name, name, strlen(list->name))) {
+					dev_err(ctx->dev, "enable gate control for %s\n",
+						list->name);
+					hw =3D lgm_clk_register_gate(ctx, list);
+				}
 			}
 			break;
=20
--=20
2.30.2

