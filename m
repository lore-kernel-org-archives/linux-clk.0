Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC2CC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbiJMNTK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiJMNTJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:19:09 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8523212FF8C;
        Thu, 13 Oct 2022 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667147; x=1697203147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYBIOkvt4Y99qzPx8FvyXgnJ4cBOivAmdhVoTShP2rQ=;
  b=nkoa+9jXUMLNV20QDrGZRYYcvj/zRnIYVBKEb0mh81vrgWHpXG1z3Q7h
   5D7V2anL4nknikTzVK45MJzCf6dYU5UOkiG5iLeiq6Mrq5BeOtxhxB3Eh
   +GLGw3GTOqdDvvxbU0aMtE3Vl736JDhu/LWLzIKWOuq1ZmJ2mRbPw9Jdj
   3Y8VxqCHGZ9QFcGJ47XZ9u2QwEnx7VU7DS2WFv57avhuFws3UzKYX2TPi
   O+lXsBDEV7yadDuDHlTLfY8ekZbwYWIWwWEClqbu/BmEkR690zGyxakbK
   d77pdN7qYeUFoo8e1UTJy3UO9zamxY+mPfWfUAqhT+ScVHUsguKL8ptiC
   g==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736849"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 13 Oct 2022 15:19:03 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 13 Oct 2022 15:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1665667143; x=1697203143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYBIOkvt4Y99qzPx8FvyXgnJ4cBOivAmdhVoTShP2rQ=;
  b=FFUOMtuEwtQx6NHpQjGrt7ka1iSsd1JYkld3IkvP7sEDoDqkyn14W1kI
   nK+8JNUjLSu7SF23jqi2/0deCGiGBnOp7rp49hap9p86qDTKIfbp+BoLt
   UWorws2rfmOYlviAK+crq+eIqoGTfBLcCqhA7mdxxWLltKkzh/mCJP8f1
   /Ws+JshjZ8zFYl0j/ENMC9ntn4WkGGNHY2+77abxL5kQeXZrbHvdGKVDh
   F94mErrvpVJI31zAOdjk3dGcV1dn5t+6q8rAO9pVZX/djY9miI8DgszlK
   OKpSOqoMkUX9rBS465mLhdZ2qN5c/AqXnzP8BvFU5Ps7jy2AAzuB/vfRt
   A==;
X-IronPort-AV: E=Sophos;i="5.95,180,1661810400"; 
   d="scan'208";a="26736848"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Oct 2022 15:19:03 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id BAF37280072;
        Thu, 13 Oct 2022 15:19:02 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: clock: Add ipp_di0 and ipp_di1 clocks to i.MX6Q bindings
Date:   Thu, 13 Oct 2022 15:18:36 +0200
Message-Id: <20221013131839.1365394-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These are alternative input clocks for IPU available as external inputs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/clock/imx6q-clock.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
index 4f4637eddb8b..329e4cb95dc0 100644
--- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
@@ -34,6 +34,8 @@ properties:
       - description: ckih1 clock input
       - description: anaclk1 clock input
       - description: anaclk2 clock input
+      - description: ipp_di0 clock input
+      - description: ipp_di1 clock input
 
   clock-names:
     items:
@@ -42,6 +44,8 @@ properties:
       - const: ckih1
       - const: anaclk1
       - const: anaclk2
+      - const: ipp_di0
+      - const: ipp_di1
 
   fsl,pmic-stby-poweroff:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.25.1

