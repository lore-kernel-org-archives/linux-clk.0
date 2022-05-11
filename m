Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9349C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 05:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241651AbiEKFfN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 01:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240862AbiEKFfM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 01:35:12 -0400
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9121244F2A;
        Tue, 10 May 2022 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
         s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=4u/eAvfXIRWynOVm2yX/K2nHB5D3HrlUBcNN2O+qlwI=; b=LZTpFSbGa8ca6fDqhX4S11BFlb
        J+c5GyB12FVW6SGN9bOTyMCdmWPLY3+Bobwzm+MnZIfZIXiJ/BONqTRtJ7ya6UdgkEUS0begn/vk9
        es8G4/6ZCSF8svx0zII8THrBZP/Wi8GjRK0s6UrYm6NBk8DkZPd9t9IBizy7sR+NPGQg=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:62614 helo=localhost.localdomain)
        by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <matthias.fend@emfend.at>)
        id 1nof02-00Ch9T-W9; Wed, 11 May 2022 07:35:03 +0200
From:   Matthias Fend <matthias.fend@emfend.at>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        matthias.fend@emfend.at
Subject: [PATCH v2 2/2] clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975
Date:   Wed, 11 May 2022 07:34:55 +0200
Message-Id: <20220511053455.360335-2-matthias.fend@emfend.at>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511053455.360335-1-matthias.fend@emfend.at>
References: <20220511053455.360335-1-matthias.fend@emfend.at>
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
 drivers/clk/clk-versaclock5.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

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

