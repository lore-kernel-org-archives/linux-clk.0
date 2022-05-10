Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADDBC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 07:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237967AbiEJHg1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 03:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240204AbiEJHTO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 03:19:14 -0400
X-Greylist: delayed 1388 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 10 May 2022 00:15:15 PDT
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 614EB2B09E1;
        Tue, 10 May 2022 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:
        From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=H9MNs8c+dgDksSLRebLpiv376FzTY2gU/4Sxfoz0hmA=; b=ecSWK0nWmhv0PX8iVtWS+rK0MS
        CEUMGDUdJqrSWXdX6fmzAzz0rLmcnv8JcT0ThnhvOOLjWOXkZvGpny0Gd0t+7aStMb+jaROkYqsbB
        fPTEX8gshd/Yz0uz/I7T/C2UZNcR3rkDkhNL432AbacXRtjmE5oieO71wgQISecmGG6Y=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:53135 helo=localhost.localdomain)
        by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <matthias.fend@emfend.at>)
        id 1noJiz-00HK68-16; Tue, 10 May 2022 08:52:01 +0200
From:   Matthias Fend <matthias.fend@emfend.at>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH] clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975
Date:   Tue, 10 May 2022 08:51:50 +0200
Message-Id: <20220510065150.278349-1-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update IDT VersaClock 5 driver to support 5P49V6975. The 5P49V6975 is a
member of the VersaClock 6E family and supports four fractional dividers
(FODs), five clock outputs and an internal oscillator.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 .../devicetree/bindings/clock/idt,versaclock5.yaml    |  2 ++
 drivers/clk/clk-versaclock5.c                         | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index be66f1e8b547..2476ce265f84 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -56,6 +56,7 @@ properties:
       - idt,5p49v5935
       - idt,5p49v6901
       - idt,5p49v6965
+      - idt,5p49v6975
 
   reg:
     description: I2C device address
@@ -134,6 +135,7 @@ allOf:
           enum:
             - idt,5p49v5933
             - idt,5p49v5935
+            - idt,5p49v6975
     then:
       # Devices with builtin crystal + optional external input
       properties:
diff --git a/drivers/clk/clk-versaclock5.c b/drivers/clk/clk-versaclock5.c
index e7be3e54b9be..04fe64d0bd10 100644
--- a/drivers/clk/clk-versaclock5.c
+++ b/drivers/clk/clk-versaclock5.c
@@ -153,6 +153,7 @@ enum vc5_model {
 	IDT_VC5_5P49V5935,
 	IDT_VC6_5P49V6901,
 	IDT_VC6_5P49V6965,
+	IDT_VC6_5P49V6975,
 };
 
 /* Structure to describe features of a particular VC5 model */
@@ -725,6 +726,7 @@ static int vc5_map_index_to_output(const enum vc5_model model,
 	case IDT_VC5_5P49V5935:
 	case IDT_VC6_5P49V6901:
 	case IDT_VC6_5P49V6965:
+	case IDT_VC6_5P49V6975:
 	default:
 		return n;
 	}
@@ -1214,6 +1216,13 @@ static const struct vc5_chip_info idt_5p49v6965_info = {
 	.flags = VC5_HAS_BYPASS_SYNC_BIT,
 };
 
+static const struct vc5_chip_info idt_5p49v6975_info = {
+	.model = IDT_VC6_5P49V6975,
+	.clk_fod_cnt = 4,
+	.clk_out_cnt = 5,
+	.flags = VC5_HAS_BYPASS_SYNC_BIT | VC5_HAS_INTERNAL_XTAL,
+};
+
 static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5923", .driver_data = IDT_VC5_5P49V5923 },
 	{ "5p49v5925", .driver_data = IDT_VC5_5P49V5925 },
@@ -1221,6 +1230,7 @@ static const struct i2c_device_id vc5_id[] = {
 	{ "5p49v5935", .driver_data = IDT_VC5_5P49V5935 },
 	{ "5p49v6901", .driver_data = IDT_VC6_5P49V6901 },
 	{ "5p49v6965", .driver_data = IDT_VC6_5P49V6965 },
+	{ "5p49v6975", .driver_data = IDT_VC6_5P49V6975 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, vc5_id);
@@ -1232,6 +1242,7 @@ static const struct of_device_id clk_vc5_of_match[] = {
 	{ .compatible = "idt,5p49v5935", .data = &idt_5p49v5935_info },
 	{ .compatible = "idt,5p49v6901", .data = &idt_5p49v6901_info },
 	{ .compatible = "idt,5p49v6965", .data = &idt_5p49v6965_info },
+	{ .compatible = "idt,5p49v6975", .data = &idt_5p49v6975_info },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, clk_vc5_of_match);
-- 
2.25.1

