Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19C0C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 16:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiDGQkQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 12:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241227AbiDGQkP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 12:40:15 -0400
X-Greylist: delayed 2401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 09:38:11 PDT
Received: from 3.mo561.mail-out.ovh.net (3.mo561.mail-out.ovh.net [46.105.44.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893AC184601
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 09:38:11 -0700 (PDT)
Received: from player796.ha.ovh.net (unknown [10.111.172.45])
        by mo561.mail-out.ovh.net (Postfix) with ESMTP id C9C2E23F25
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 15:20:00 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id EDE11293300BF;
        Thu,  7 Apr 2022 15:19:52 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G0038066544b-4782-433a-b284-babe47db37b3,
                    5995496A90EC26C6A3824F4C00BBD29EFE55D398) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 04/10] clk: max9485: use simple i2c probe function
Date:   Thu,  7 Apr 2022 17:18:25 +0200
Message-Id: <20220407151831.2371706-5-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407151831.2371706-1-steve@sk2.org>
References: <20220407151831.2371706-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 81064795355776646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeejleelvdefieeiuddtfeevkeegueehkeekvdffgedvhedugeekgfejjeekgfeugeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The i2c probe function here doesn't use the id information provided in
its second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/clk/clk-max9485.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-max9485.c b/drivers/clk/clk-max9485.c
index 5e80f3d090f3..5f85b0a32872 100644
--- a/drivers/clk/clk-max9485.c
+++ b/drivers/clk/clk-max9485.c
@@ -254,8 +254,7 @@ max9485_of_clk_get(struct of_phandle_args *clkspec, void *data)
 	return &drvdata->hw[idx].hw;
 }
 
-static int max9485_i2c_probe(struct i2c_client *client,
-			     const struct i2c_device_id *id)
+static int max9485_i2c_probe(struct i2c_client *client)
 {
 	struct max9485_driver_data *drvdata;
 	struct device *dev = &client->dev;
@@ -377,7 +376,7 @@ static struct i2c_driver max9485_driver = {
 		.pm		= &max9485_pm_ops,
 		.of_match_table	= max9485_dt_ids,
 	},
-	.probe = max9485_i2c_probe,
+	.probe_new = max9485_i2c_probe,
 	.id_table = max9485_i2c_ids,
 };
 module_i2c_driver(max9485_driver);
-- 
2.27.0

