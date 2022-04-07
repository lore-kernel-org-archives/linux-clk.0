Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA245C43219
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 15:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345459AbiDGQAT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 12:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345464AbiDGQAP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 12:00:15 -0400
X-Greylist: delayed 2239 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 08:58:13 PDT
Received: from 11.mo583.mail-out.ovh.net (11.mo583.mail-out.ovh.net [46.105.47.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBD4DD960
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 08:58:12 -0700 (PDT)
Received: from player796.ha.ovh.net (unknown [10.111.172.147])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id 586B1245A4
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 15:20:48 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id 2CD432933024D;
        Thu,  7 Apr 2022 15:20:39 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003d16187d4-fb51-4483-a7dc-35d224eb3c4e,
                    5995496A90EC26C6A3824F4C00BBD29EFE55D398) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 10/10] clk: renesas-pcie: use simple i2c probe function
Date:   Thu,  7 Apr 2022 17:18:31 +0200
Message-Id: <20220407151831.2371706-11-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407151831.2371706-1-steve@sk2.org>
References: <20220407151831.2371706-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 94575596027086470
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeejleelvdefieeiuddtfeevkeegueehkeekvdffgedvhedugeekgfejjeekgfeugeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The i2c probe function here doesn't use the id information provided in
its second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/clk/clk-renesas-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-pcie.c
index 59d9cf0053eb..4f5df1fc74b4 100644
--- a/drivers/clk/clk-renesas-pcie.c
+++ b/drivers/clk/clk-renesas-pcie.c
@@ -213,7 +213,7 @@ rs9_of_clk_get(struct of_phandle_args *clkspec, void *data)
 	return rs9->clk_dif[idx];
 }
 
-static int rs9_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int rs9_probe(struct i2c_client *client)
 {
 	unsigned char name[5] = "DIF0";
 	struct rs9_driver_data *rs9;
@@ -312,7 +312,7 @@ static struct i2c_driver rs9_driver = {
 		.pm	= &rs9_pm_ops,
 		.of_match_table = clk_rs9_of_match,
 	},
-	.probe		= rs9_probe,
+	.probe_new	= rs9_probe,
 	.id_table	= rs9_id,
 };
 module_i2c_driver(rs9_driver);
-- 
2.27.0

