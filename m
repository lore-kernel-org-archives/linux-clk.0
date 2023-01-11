Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B1CC677F1
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 15:56:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbjAKP4B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 10:56:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbjAKPz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 10:55:29 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED68272C
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 07:55:25 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:fced:c2a7:4b41:d72d])
        by andre.telenet-ops.be with bizsmtp
        id 7TvM290071ktn1N01TvMZa; Wed, 11 Jan 2023 16:55:22 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pFdRf-001aS3-Bs;
        Wed, 11 Jan 2023 16:55:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pFdRh-003sSw-5M;
        Wed, 11 Jan 2023 16:55:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Marek Vasut <marek.vasut@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration properties not required
Date:   Wed, 11 Jan 2023 16:55:17 +0100
Message-Id: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

"make dtbs_check":

    arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
    arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml

Versaclock 5 clock generators can have their configuration stored in
One-Time Programmable (OTP) memory.  Hence there is no need to specify
DT properties for manual configuration if the OTP has been programmed
before.  Likewise, the Linux driver does not touch the SD/OE bits if the
corresponding properties are not specified, cfr. commit d83e561d43bc71e5
("clk: vc5: Add properties for configuring SD/OE behavior").

Reflect this in the bindings by making the "idt,shutdown" and
"idt,output-enable-active" properties not required, just like the
various "idt,*" properties in the per-output child nodes.

Fixes: 275e4e2dc0411508 ("dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/clock/idt,versaclock5.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 61b246cf5e72aa47..a5472bbfb8d1fdcc 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -125,8 +125,6 @@ required:
   - compatible
   - reg
   - '#clock-cells'
-  - idt,shutdown
-  - idt,output-enable-active
 
 allOf:
   - if:
-- 
2.34.1

