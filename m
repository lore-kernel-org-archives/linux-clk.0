Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536F2C001DE
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 10:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjGaKkr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 06:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjGaKkr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 06:40:47 -0400
X-Greylist: delayed 1160 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 31 Jul 2023 03:40:45 PDT
Received: from mxout70.expurgate.net (mxout70.expurgate.net [194.37.255.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F591116;
        Mon, 31 Jul 2023 03:40:45 -0700 (PDT)
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <prvs=6590db4e63=fe@dev.tdt.de>)
        id 1qQPkr-00DM76-5J; Mon, 31 Jul 2023 12:03:57 +0200
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1qQPkq-00CUgR-C0; Mon, 31 Jul 2023 12:03:56 +0200
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id 57D6924004B;
        Mon, 31 Jul 2023 12:03:55 +0200 (CEST)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id A1FA524004D;
        Mon, 31 Jul 2023 12:03:54 +0200 (CEST)
Received: from localhost.localdomain (unknown [10.2.3.40])
        by mail.dev.tdt.de (Postfix) with ESMTPSA id 69F3C21055;
        Mon, 31 Jul 2023 12:03:54 +0200 (CEST)
From:   Florian Eckert <fe@dev.tdt.de>
To:     mturquette@baylibre.com, sboyd@kernel.org, yzhu@maxlinear.com,
        rtanwar@maxlinear.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Eckert.Florian@googlemail.com
Subject: [PATCH 2/2] dt-bindings: clock: intel,cgu-lgm: add mxl,control-gate option
Date:   Mon, 31 Jul 2023 12:03:49 +0200
Message-ID: <20230731100349.184553-3-fe@dev.tdt.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731100349.184553-1-fe@dev.tdt.de>
References: <20230731100349.184553-1-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate: clean
X-purgate-type: clean
X-purgate-ID: 151534::1690797837-8497C7FE-91A41898/0/0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the new option 'mxl,control-gate'. Gate clocks can be controlled
either from this cgu clk driver or directly from power management
driver/daemon. It is dependent on the power policy/profile requirements
of the end product. To take control of gate clks from this driver, add th=
e
name of the gate to this <mxl,control-gate> devicetree property.
Please refer to 'drivers/clk/x86/clk-lgm.c' source file for the gate name=
s.

Signed-off-by: Florian Eckert <fe@dev.tdt.de>
---
 .../devicetree/bindings/clock/intel,cgu-lgm.yaml      | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml b=
/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
index 76609a390429..755d13a65477 100644
--- a/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
+++ b/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
@@ -28,6 +28,16 @@ properties:
   '#clock-cells':
     const: 1
=20
+    mxl,control-gate:
+      description:
+        Gate clocks can be controlled either from this cgu clk driver or
+        directly from power management driver/daemon. It is dependent on=
 the
+        power policy/profile requirements of the end product. To take
+        control of gate clks from this driver, add the name of the gate
+        to this <mxl,control-gate> devicetree property. Please refer to
+        drivers/clk/x86/clk-lgm.c source file for the gate names.
+      $ref: /schemas/types.yaml#/definitions/string-array
+
 required:
   - compatible
   - reg
@@ -41,6 +51,7 @@ examples:
         compatible =3D "intel,cgu-lgm";
         reg =3D <0xe0200000 0x33c>;
         #clock-cells =3D <1>;
+        mxl,control-gate =3D "g_gptc0", "g_gptc1";
     };
=20
 ...
--=20
2.30.2

