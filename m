Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63649C4332F
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 15:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbiDGPkd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 11:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344823AbiDGPkb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 11:40:31 -0400
X-Greylist: delayed 611 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 08:38:27 PDT
Received: from 4.mo583.mail-out.ovh.net (4.mo583.mail-out.ovh.net [178.33.111.247])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D231117066
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 08:38:26 -0700 (PDT)
Received: from player796.ha.ovh.net (unknown [10.109.138.203])
        by mo583.mail-out.ovh.net (Postfix) with ESMTP id 2CA16243B4
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 15:20:07 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player796.ha.ovh.net (Postfix) with ESMTPSA id AB6C7293300E7;
        Thu,  7 Apr 2022 15:20:00 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G0034c962ea5-ae9c-4d67-a931-d80837463e79,
                    5995496A90EC26C6A3824F4C00BBD29EFE55D398) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 05/10] clk: si514: use simple i2c probe function
Date:   Thu,  7 Apr 2022 17:18:26 +0200
Message-Id: <20220407151831.2371706-6-steve@sk2.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220407151831.2371706-1-steve@sk2.org>
References: <20220407151831.2371706-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 83035121023354502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejkedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeejleelvdefieeiuddtfeevkeegueehkeekvdffgedvhedugeekgfejjeekgfeugeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The i2c probe function here doesn't use the id information provided in
its second argument, so the single-parameter i2c probe function
("probe_new") can be used instead.

This avoids scanning the identifier tables during probes.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/clk/clk-si514.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-si514.c b/drivers/clk/clk-si514.c
index 364b62b9928d..4481c4303534 100644
--- a/drivers/clk/clk-si514.c
+++ b/drivers/clk/clk-si514.c
@@ -327,8 +327,7 @@ static const struct regmap_config si514_regmap_config = {
 	.volatile_reg = si514_regmap_is_volatile,
 };
 
-static int si514_probe(struct i2c_client *client,
-		const struct i2c_device_id *id)
+static int si514_probe(struct i2c_client *client)
 {
 	struct clk_si514 *data;
 	struct clk_init_data init;
@@ -394,7 +393,7 @@ static struct i2c_driver si514_driver = {
 		.name = "si514",
 		.of_match_table = clk_si514_of_match,
 	},
-	.probe		= si514_probe,
+	.probe_new	= si514_probe,
 	.remove		= si514_remove,
 	.id_table	= si514_id,
 };
-- 
2.27.0

