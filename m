Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793653658;
	b=lUiXXxna/jJ/lM4N6LBEOeEaRUAJgFZdKW8PwUOJyjG+Ew/MXwx56MdEMCKwj9zeXpM4
	 lqerAGdKSg4WsIo2d3hxGDw5m2pZ+MWp8po/QchUnAUe6CSSbAMGnTtNcpKtnbabnTuZx
	 Fg6rN1waRYEvS5m+oReuzIlLYcJmy2Va3y4WLqBKqOOOE4GS8LYtl9U79UCnDKl2n2z7G
	 fWBpfsImq86cduuhcWlo54VfAwYsN14KE1Q+km2s6Nk9cmybroG5moJNbRfDje0XFi95G
	 fQ9UOqWX0d7UJZGYC4g55VuGqsZU6FVm6mD9VII4889503iT+zt0WBj+RwwPqQ/Uo5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793653658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aSSDxY+9CyiEWW00k2jnJIS31DCHlCWmIQW8C6STWxc=;
	b=JFTvh0w2h18JDCM35aidgVNDYfZyYDF7W7BN/jEe4Pq1X67Pz2B9z8zohUgF0SzGUBsS
	 cSGlvM27Uzw8Xq+4YjT416AQxKxorZkAHyIr+/iFavSYCV/B2qAljhpJN9GFN64IH8DGU
	 GNoF+RDkBHzD01epErwkEtxFxG7/9swfy3nGnv2dK4tpvY6kv1PBAydm3TzhHveesbw/q
	 qMwYNUSh7kgR+K2bO0tIPtDAN3CQ8W78KZQgRVW7w6S9T0bwvM8I5uMchJtiC1KzxpoGs
	 kTaIop9FtGQVNn4tEwBTIjqa4Oy/xOzNKj1NSsAsDg1a7Zw0RryoqLB6yLF5fZO0X1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Xl56kX5B;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577F2606D808
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 21:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577F2606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Xl56kX5B
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b042c0759so1815155f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2026 13:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793653657; x=1794258457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSSDxY+9CyiEWW00k2jnJIS31DCHlCWmIQW8C6STWxc=;
        b=Xl56kX5BcVWqeAIlmfad96f99F/wo4b7MJAwN+QI72NRYb+SjjKVcF/hrUy3sznTnQ
         9g90qrNncmlF8NkXvcuqOWbs8gzhqO3tNvH8aomb9LJMhwF+LRhWQsqgHuwScxvnyS8J
         t09Fv0v6+b9vWq51ip2uMR8NIfB5a4yzlHYIdAp+Nuja+Mpo2rVP3qrLjbwZhsLTGQGh
         2+PCdF6X9SQlaSQFOe+5foFwM/jo+XTdzoCLnQBtyYlu4WnkJJ0MgPEu733Bf1P7RSk/
         5B+pPB3COeFtqQ0VUt/49nxnyt5dmqy9LRZ3Oc4VLEFTQUsI/qyfdOSLw5Jrt4q4eSBU
         5bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793653657; x=1794258457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSSDxY+9CyiEWW00k2jnJIS31DCHlCWmIQW8C6STWxc=;
        b=zg0ZZaEybiJKTQbFl+alYbmVbN7Kv3jDScU0R8npd/mdUYO/8tup5uAPq9dM7l5XhE
         u3Qyk7whsFflc9NmjewoO2PkQtacavK4MT4PKfN7BYb/4hSbqUImSIAPweIt56KKLvNm
         nVIAEBXhnLT9Qy8QMGNvxTIQUqGaiX1Na6RnyaPEkgjMY8OdjAkjRPxHlMFgMwGJ9f7C
         uQ2a1OxZinIVNx2xr24LlrgM7P36xteEPSdUthvVv6RDOmjbf3OMqLirBsvVSNy/rxjy
         XKGq+NCQEPuR4S5ylZBLBJGYP45TAhrTmFO8SffXEmGIanWsUieVzerNdeCk8Ejh11Cx
         6RDw==
X-Forwarded-Encrypted: i=1; AKwUvBw2Fwl3dEWbsdfS8kCSiTb8g6h1rvhbwxTQjimHckTW2D6YAM3IFyk8C+0bs+cp0IM5Nipn1mboxx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BNqkPWPTRQqv+xCOxxkWSbSw+hsvf/w+QDMis/hCFXzSk59WU
	eqo8x5FtkNkd1ujft5J6PHH4RfOay/WzsyVgOK5FIsUqf6toaDNgKqubbz+O8vr6ZCQ=
X-Gm-Gg: AYBFou0yMAbyl4JCz21zEt+cixmK9lYMMRBa3C0scEE1OOVuZUyc3wNk9WBk/Mz47K4
	kHJj1PmWoI9XxXqva3fXHwySHD+7uX++AYRLlZ9crMc5EFCM2VguavNbbdBGKs3c3BY1Qd8/8Ez
	uZEi94bEJeeGBQ0kB5L9XB30n5X5uZ10vjbwQqq5gNSrhsMQ8dk3xTB8q1AJSYM02Wr9W1Tn75u
	4ectQwroFuwsgUDS6Hl0yChMk6YPK+/n/fl5vjTX+V5fv7cWSPzXD7jDDiU5XQFdvuFzNHWlvDA
	IGCmhH2kc/1LcvFXcDD+WYpdzIVz+hDWsagNRtbiWeS7NmMz3yB1fToQ1QX/0L2zqBLQdcv9PQc
	sOj40ehZWTGuVtOJKPlMT4gOCymmAogC1aKheytGoi/agHSKIExGahvNGUmMQr/XoT1uX715jWN
	BwuZYDQSf/82l6xSI/lRKS8ud6KYzCP+DvIuqIBodjBzKKyhry5l81KiDGLBNaHiO5GX5q4Yrds
	C1ssqgOdk/AU37f9HQiuZ+dcD740uMnUoonsEIQRiCNEGZvbcBylKWZpmQhXHcW41mRDnKuC99p
	YNLcFJ3vEOl4RUw4Joevm0ZwmPNKY+Gku4pn6XTRRRcFXc6g6hztdPlzdc6mP8OyCJEcMTuv3e3
	aehgo+njPNi28eD54BzU=
X-Received: by 2002:a05:6000:46c5:b0:48e:5db7:fd6c with SMTP id ffacd0b85a97d-48e6e2bde59mr15156967f8f.4.1793653656732;
        Mon, 02 Nov 2026 13:07:36 -0800 (PST)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm21765308f8f.38.2026.11.02.13.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:07:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 02 Nov 2026 22:07:21 +0100
Subject: [PATCH 2/2] clk: divider: test: Add tests for rates above 4.29 GHz
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-upstream-clk-divider-large-rates-v1-2-eb17035bfad2@baylibre.com>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
In-Reply-To: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On 64-bit platforms, the divider truncated rates above 4.29 GHz when
computing a divisor.

Add tests rounding and setting such rates on a divider with a 6 GHz
parent, one for each divisor computation. They are skipped on 32-bit
platforms, where rates cannot exceed 4.29 GHz.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/clk-divider_test.c | 117 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 115 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index 8ee1614128d0..fc96ac07ecff 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -1,16 +1,19 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * KUnit tests for clk_divider_bestdiv()
+ * KUnit tests for clk divider
  */
+#include <kunit/clk.h>
 #include <kunit/test.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <linux/limits.h>
 #include <linux/units.h>
 
 #define PARENT_RATE_1GHZ	GIGA
 #define PARENT_RATE_2GHZ	(2 * GIGA)
 #define PARENT_RATE_4GHZ	(4 * GIGA)
+#define PARENT_RATE_6GHZ	(6 * GIGA)
 
 KUNIT_DEFINE_ACTION_WRAPPER(clk_hw_unregister_fixed_rate_wrapper,
 			    clk_hw_unregister_fixed_rate, struct clk_hw *);
@@ -147,7 +150,117 @@ static struct kunit_suite clk_divider_bestdiv_test_suite = {
 	.test_cases = clk_divider_bestdiv_test_cases,
 };
 
-kunit_test_suite(clk_divider_bestdiv_test_suite);
+/*
+ * Register a 6 GHz fixed-rate parent and a 3-bit divider (/1 to /8) using
+ * @fake_reg as its register.
+ */
+static struct clk_hw *clk_divider_large_rate_init(struct kunit *test,
+						  u32 *fake_reg,
+						  unsigned long flags,
+						  u8 div_flags)
+{
+	struct clk_hw *parent_hw, *div_hw;
+
+	if (BITS_PER_LONG < 64)
+		kunit_skip(test, "rates above 4.29 GHz need a 64-bit unsigned long");
+
+	parent_hw = clk_hw_register_fixed_rate(NULL, "large-rate-parent",
+					       NULL, 0, PARENT_RATE_6GHZ);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_fixed_rate_wrapper,
+						  parent_hw));
+
+	div_hw = clk_hw_register_divider(NULL, "large-rate-div",
+					 "large-rate-parent", flags,
+					 (void __iomem __force *)fake_reg,
+					 0, 3, div_flags, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, div_hw);
+	KUNIT_ASSERT_EQ(test, 0,
+			kunit_add_action_or_reset(test, clk_hw_unregister_divider_wrapper,
+						  div_hw));
+
+	return div_hw;
+}
+
+/*
+ * Test that rounding a rate above 4.29 GHz computes the divisor from the
+ * full rate: the parent rate needs /1.
+ */
+static void clk_divider_large_rate_round_up(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg, 0, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, PARENT_RATE_6GHZ),
+			PARENT_RATE_6GHZ);
+}
+
+/*
+ * Same with CLK_DIVIDER_ROUND_CLOSEST: 4.4 GHz is closer to 3 GHz (/2) than
+ * to 6 GHz (/1).
+ */
+static void clk_divider_large_rate_round_closest(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg, 0,
+					     CLK_DIVIDER_ROUND_CLOSEST);
+
+	KUNIT_EXPECT_EQ(test, clk_hw_round_rate(div_hw, 4400 * MEGA),
+			PARENT_RATE_6GHZ / 2);
+}
+
+/*
+ * Test that setting a rate above 4.29 GHz programs the right divisor.
+ * With CLK_SET_RATE_PARENT the rounding searches the parent rates and
+ * finds /1, so this only checks the set_rate path.
+ */
+static void clk_divider_large_rate_set_rate(struct kunit *test)
+{
+	struct clk_hw *div_hw;
+	struct clk *clk;
+	u32 *fake_reg;
+
+	fake_reg = kunit_kzalloc(test, sizeof(*fake_reg), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fake_reg);
+
+	/* Start from /2 */
+	writel(1, (void __iomem __force *)fake_reg);
+
+	div_hw = clk_divider_large_rate_init(test, fake_reg,
+					     CLK_SET_RATE_PARENT, 0);
+	clk = clk_hw_get_clk_kunit(test, div_hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, clk);
+
+	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, PARENT_RATE_6GHZ), 0);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(clk), PARENT_RATE_6GHZ);
+	KUNIT_EXPECT_EQ(test, *fake_reg, 0);
+}
+
+static struct kunit_case clk_divider_large_rate_test_cases[] = {
+	KUNIT_CASE(clk_divider_large_rate_round_up),
+	KUNIT_CASE(clk_divider_large_rate_round_closest),
+	KUNIT_CASE(clk_divider_large_rate_set_rate),
+	{}
+};
+
+static struct kunit_suite clk_divider_large_rate_test_suite = {
+	.name = "clk_divider_large_rate",
+	.test_cases = clk_divider_large_rate_test_cases,
+};
+
+kunit_test_suites(&clk_divider_bestdiv_test_suite,
+		  &clk_divider_large_rate_test_suite);
 
 MODULE_DESCRIPTION("KUnit tests for clk divider");
 MODULE_LICENSE("GPL");

-- 
2.56.0

