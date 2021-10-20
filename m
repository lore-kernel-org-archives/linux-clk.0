Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1195C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 08:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF52461212
	for <linux-clk@archiver.kernel.org>; Wed, 20 Oct 2021 08:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhJTIwn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Oct 2021 04:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbhJTIwm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Oct 2021 04:52:42 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E895C06161C;
        Wed, 20 Oct 2021 01:50:28 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B312A82F9E;
        Wed, 20 Oct 2021 10:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634719826;
        bh=HzN4VwCev1h0HKzqcm7IiINVPE1vhUzyaNSEfQ58SfA=;
        h=From:To:Cc:Subject:Date:From;
        b=PrinXZrndEL6CTZt/2hVmn3+J/TjvbJv8zhu0Wu8HX8fwmvmgb7wko8lpC8Ps8bja
         3IqbVqYjHaAnj1pSjdVXFO+riuOgU6CzNgVtXoSP52Tx9BBGQg7Myd8XHnDNczZ3qI
         WeEYlFvIVFkGc0uh+XzmLZ8Xy2EsMiIYz4a0QHGtNZn5V7F3sMkKh1BbSe8/HQVjvY
         azq8+oRnFG8FQ3335H93Md8uNRaa7PUXA1LPAiphyGHqM4wNWV+Vnp8BDDLOVihgcj
         E2VRHXe4YQtWnFvLlSzuZHfQWLF0uMLT8AVXF9KUW3VAZQ7Dq7D2SqdOzR7Bfi6J8s
         au4FoU2tmTZPg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: [PATCH 1/2] dt-bindings: mfd: rohm,bd71847-pmic: Document rohm,clock-output-is-critical property
Date:   Wed, 20 Oct 2021 10:49:55 +0200
Message-Id: <20211020084956.83041-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the possibility to configure PMIC 32kHz output clock as CRITICAL,
so that they are never gated off. This is useful in case those clock
supply some vital clock net, which requires the clock to always run.

The iMX8M RTC XTAL input is one such example, if the clock are ever
gated off, the system locks up completely. The clock must be present
and enabled even if the RTC is unused.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-power@fi.rohmeurope.com
To: linux-clk@vger.kernel.org
---
 Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
index 5d531051a153..2497ade2bbd0 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
@@ -41,6 +41,11 @@ properties:
   clock-output-names:
     maxItems: 1
 
+  rohm,clock-output-is-critical:
+    description:
+      Never gate off C32K_OUT clock.
+    type: boolean
+
 # The BD71847 abd BD71850 support two different HW states as reset target
 # states. States are called as SNVS and READY. At READY state all the PMIC
 # power outputs go down and OTP is reload. At the SNVS state all other logic
-- 
2.33.0

