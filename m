Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08FDC7EE2E
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:28:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231897AbjEEL22 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbjEEL2V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:28:21 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9001A49B
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:28:19 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 8691D32008FB;
        Fri,  5 May 2023 07:28:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683286098; x=1683372498; bh=ZEcqZ1zEpZiT/ye8OZXPzspFpxe6CFVMI8F
        +hIwDKmg=; b=qYogqhmI/nEuLQpRiiZ842ekL5RvX7IkQAKEo9GbgVAZJYoGJ2n
        QA6Q4RBlpzMeDoz7DoX0Rkf7HKrq932Ax1ANhw5RO7yGKvyIRXzOgrLNGto/HO2j
        w/dfcFf+Zg88RWrgMnA0k/Qqi+aGBKxXXqH2JxemNdgdomwU1n92d6BQkLY5zn4E
        dXCdGJ6Nxi1taXDrmRB+dIkWnDEaFg9M1pD/nEadFPByke2vMLxPvvmmSknL1tfq
        H4Fd+FKbg7p2N7854ZfrcuklYtXLyz7k9WLhPS6jCrK5iiAq7yjXtaAGhAmnMw6A
        Yv1ntVU4kIRuQ+Xa0XhqK0yWt+mL3IZCKEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683286098; x=1683372498; bh=ZEcqZ1zEpZiT/ye8OZXPzspFpxe6CFVMI8F
        +hIwDKmg=; b=eh2nSRkUhD42r87ppu7cJKwJ074i0VgSUxZYd9m9sjyb6L6/ak1
        pu7tnDOkxl4eebH9eheXrtiuSOEFfYk1t4MoRxmlCC+Ns82WfFZP5utqPS0jTHtS
        9xKEK+ZzyWao2Ipo5TyEWXOWl1df5OX3alvMaonNGagGRH6lSrPczvgqqV2KUw/x
        OOVHmW0qL01G3NLfUeViJN9rHWO0Q6Y4RXAL48JK4itiPsi8UsW4FGF5R+hWvbl9
        ZWcr6IRrYbLYbHANnvtshfNzTgYsqryugbbDYLXNXuzCrsKkTKW/b5JxwHHq2Qzo
        0R6pNgIZQPEKTkrO6TvjY046dTLXqM7alYQ==
X-ME-Sender: <xms:UuhUZO-SlNEQ5c6Vkh1LYMb1CwwNCBQZuM2TJ-18_YrdCEMAjWXo8w>
    <xme:UuhUZOtlj7YbJihRnhKE2h7vWG7TcIkJ0egOgqmjXtRbbBlTtxHkDQ9i11RHEO68J
    YqBPS6EKq78XyRgDb0>
X-ME-Received: <xmr:UuhUZEDfo0a58dJumc7tfcW3SXpBoTvZzfk1dMFEHJbTV0ONQwIaEQw0zZahsDfu6AtxxF6Wbjf6GvXUGzOIsu2VJavFFFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepuddtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UuhUZGf6POKWw37ZibQpWQ5oQ-ACKDg4ysgu_izaLqzTPCjM-mZskw>
    <xmx:UuhUZDPsJoJOjO5V6d0UKZ6Cf-26lYzmc4VFDyKFfFw4q3T6Jwermw>
    <xmx:UuhUZAkAs9xI0lzDsfP7q9M-i4DOooU7q0BZxA4d1fJ79dG6t7yJqQ>
    <xmx:UuhUZMr9DR46Up0H5sajhUZHQZ3jsVrqGQNdo2lojFg4RxRyBZgZkg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:28:17 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:53 +0200
Subject: [PATCH v4 51/68] clk: cdce706: divider: Switch to determine_rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-51-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Max Filippov <jcmvbkbc@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=nAbW1sEMOOMuQjPHOFRKtN94gFBW+nEdxy6krENBKJ8=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhz5daKopV6smzbFfYH7Y3Jmqda7TP0SYOxthr2zWX823l
 YentKGVhEONikBVTZIkRNl8Sd2rW6042vnkwc1iZQIYwcHEKwER6FzL84V/iZ9nMMFteVlDSsFG7+8
 PfRTP1DIVmiS2R7lR2UTjCyPC/OnXzkddsEx+cEQ59tZSnqGE+h+G/kkydf+97XnX1Tz3IBwA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The cdce706 divider clocks implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The driver does implement round_rate() though, which means that we can
change the rate of the clock, but we will never get to change the
parent.

However, It's hard to tell whether it's been done on purpose or not.

Since we'll start mandating a determine_rate() implementation, let's
convert the round_rate() implementation to a determine_rate(), which
will also make the current behavior explicit. And if it was an
oversight, the clock behaviour can be adjusted later on.

Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-cdce706.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-cdce706.c b/drivers/clk/clk-cdce706.c
index 139aa0954cc1..1c112bb51be6 100644
--- a/drivers/clk/clk-cdce706.c
+++ b/drivers/clk/clk-cdce706.c
@@ -288,18 +288,19 @@ static unsigned long cdce706_divider_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				       unsigned long *parent_rate)
+static int cdce706_divider_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct cdce706_hw_data *hwd = to_hw_data(hw);
 	struct cdce706_dev_data *cdce = hwd->dev_data;
+	unsigned long rate = req->rate;
 	unsigned long mul, div;
 
 	dev_dbg(&hwd->dev_data->client->dev,
 		"%s, rate: %lu, parent_rate: %lu\n",
-		__func__, rate, *parent_rate);
+		__func__, rate, req->best_parent_rate);
 
-	rational_best_approximation(rate, *parent_rate,
+	rational_best_approximation(rate, req->best_parent_rate,
 				    1, CDCE706_DIVIDER_DIVIDER_MAX,
 				    &mul, &div);
 	if (!mul)
@@ -344,8 +345,8 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 
 		dev_dbg(&hwd->dev_data->client->dev,
 			"%s, altering parent rate: %lu -> %lu\n",
-			__func__, *parent_rate, rate * div);
-		*parent_rate = rate * div;
+			__func__, req->best_parent_rate, rate * div);
+		req->best_parent_rate = rate * div;
 	}
 	hwd->div = div;
 
@@ -353,7 +354,8 @@ static long cdce706_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		"%s, divider: %d, div: %lu\n",
 		__func__, hwd->idx, div);
 
-	return *parent_rate / div;
+	req->rate = req->best_parent_rate / div;
+	return 0;
 }
 
 static int cdce706_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -375,7 +377,7 @@ static const struct clk_ops cdce706_divider_ops = {
 	.set_parent = cdce706_divider_set_parent,
 	.get_parent = cdce706_divider_get_parent,
 	.recalc_rate = cdce706_divider_recalc_rate,
-	.round_rate = cdce706_divider_round_rate,
+	.determine_rate = cdce706_divider_determine_rate,
 	.set_rate = cdce706_divider_set_rate,
 };
 

-- 
2.40.0

