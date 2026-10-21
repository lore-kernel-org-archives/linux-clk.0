Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792618143;
	b=nxAYERgrnCxL6njjjNQOwpSZuAi6+AEKUp5wspLHiGCNDwe9QP9xkxpoBFGvTEL5NAg7
	 eMvuC+PAUSPytAKaECd0aCDNJ3OccBnyiEcrodDQApLMjvToUgvmT5Nlk+xqtyWBByZDj
	 r7ZnJQ4uJeAmi/AvzeA8Yyn6Nh0RQZquDIsp5qvWBMswnBxHCIgo0myVaMDqpEzSPosBY
	 6nhUKXmIWgnPacbycAMXzWB0K53TCFRg0X0VDhKuNRDXaOgyU/vuPPtgArr9xmM6s/aiq
	 LOps43h2W8OpVttmea6WhY+mlRdBlGtOgoXpWP3vY1YbUQrjeV/aKUlg4+P9uye6YTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792618143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=STfXp6czP7xhamjW51To5foTWFXsqjJT8ci8C4r7ssk=;
	b=nY5M0dcdyUqem8NW52iYLEZKFaGXjP9SPSsOxu4y/ht98XNENRRZ4oTWEPolmZLIp5gA
	 mDB1iJCp+DqJH0H0Lsq/RJsnf8DenURDhKwLDRAwSwAVI2ZxtKdhei9Z86IJDhQgVPf8k
	 bJhshBv0wH1x/NRp8dyCNL5wem5xeCtXC5PeUDWnn8NbTGjqbQO1K/3SawTutU93/xg8b
	 XJb9msevyOWGpgkDQuq+TpiJz0oRGgGDeQtXJhyl6WjYWznquLL/ZGcl1eZJk6cNjKkZx
	 BiIG6S+jGPnwZuCVdYyQpx47XgIr/bnuzDe6PqMa8FQff71IrzcCaqlLANObpqPCJlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGABvHP8;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFBF606A31B
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 21:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFBF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RGABvHP8
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6faddda49e7so945780eaf.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792618142; x=1793222942; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=STfXp6czP7xhamjW51To5foTWFXsqjJT8ci8C4r7ssk=;
        b=RGABvHP8Dyk6LxsQqpxlHRr1auM08NNzKrG6Zu9WIuX6WdM63LtxwAtz6pOtXWw3c2
         drEJunJyp4FL2zEmgvD8tWcW8OmQjcHx80JXVIvlTWjgC4o/BoiWVgNiHjvCGtl5QJot
         sijZFAgPuqjVAQypJxeFhrswKukLMXdAByBXHXV2z6jtUr9SVZDloeNU5xkWTvLn0Vou
         bXB3CIzkCQQNuNMVdMZTxEYYY+wRJWKNLeOLWXQBt5X/IbzfDJtBNomWzvcsBEIeGJ16
         bIVOq+kmDddMGPxU8XtlAl9dgWH/CUSiecH9lL+eg5jHu3DVpLFGjqiW00VleCHPFGeO
         FEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792618142; x=1793222942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=STfXp6czP7xhamjW51To5foTWFXsqjJT8ci8C4r7ssk=;
        b=Zo6CPdg7uRrkFY9/Ckvo5MKtXsH8HL3XBiu7Qo45dPKX96/dX3lgfTI2zkwYs95AlD
         7rV1DRt522C8RGyx0hIX+lr/NT6oqYU3+OwBQNVyTPN1LofBl0vUOr/+vCBo6anLHTjp
         yetvLleE/39F55pdU6vO3MgHSgsNzsK4FN0DhYR8GbXxwvk/2vA5icUeJtbzElNvNiL5
         ybSMdyp8crrZFGPGccIdJLhak8D0lWbqfnMb/u/OkjIE1vLxZZ9SztdnkawMxvUrO/FF
         J/ZB2gTpacKAOHI2kL172ZhzBY7Gp+iH9QeHrdSlNkBcYnEz+MB1NQu4RarQ5PSMKKpZ
         +bYA==
X-Forwarded-Encrypted: i=1; AKwUvByh/zJ5oIU916mPeNpoAb3Pk/gnjnsFmc86JFhBDxoAYogPOItw3X5TD5QkUiWuP4EnE3cdCR9sA+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL34Fbb5CPmqD/t9EtdFagNdzahzeR36z3fTN5AqEFnqENmbxxk
	RCK1e8WP0+cGXFmVT0O0ONaPynb8lGwzc3ISh15GBlkS75aTa2mHkwT3
X-Gm-Gg: AYBFou1kr9MfOJWCtv5J7nExlbEveA9kIH0lo4qMFYFh+eS6ZoiwgG0MJtduOUGmly/
	Pls0JAagMIJHQ7/CaumqW2a9vdB2TUOqdyv9ELYDzEpc6dB3miG/PiXmIvYCY8fnVz92iNhEASb
	3vEmWgSS50P2Nm/4qOsNBj6CbixYAPVRf2XTHgVplybpANUq+E1XCe6nPvfLYw46UQCOShBy15b
	4I5Es10rJ+Di5EqoBKwOzZNGguc/YqiKpC83QOtE0M9kt60306ewv3/TcmwJXxd1DFEkbN6Mxow
	faMkAehyHE2aljBLwRUSYgBNJR6twDpju70WdmacaA+Wi5xZcPTe035+nG+AO3CCXT/ocUHp6lQ
	mbY5L0e5R4LXB6AHE2oI/D7XDwR/9rVRshpXW7KFW5OJQBaKVX5jT3i96abK0iSPlzcGbpCv1h5
	plDhrPSoKGoAekFUOZ6wVqWj7QT+jF2ZTFCtbUDUpU16jwH65S7FpAEZs6TIkEQDamYgzosh9Tx
	T+OjF7nMM/GxvoIMrszOqa70k8wmCyLuxMc/pQcN7nZAMoqOduy31ZbCRZoFgrjN124jNP4uXwB
	O23zzyIzVxXXpRW3Y4576JrjljPE/RJ5fWQ1Oa/lzTh9Y8E+v3qYFfdNs1kRxDbYL+z3PYMS0hY
	Jv+0k8k1MUio7L4nllsYptLtcRPL3gACMtDHmKfAQ+FoLxurdhzphIdGFupf6+ArDViAu4hEdN/
	7ClYRGpK6iO+0sV4YFbL1yCBTT
X-Received: by 2002:a05:6820:f023:b0:6d7:4f30:8f6c with SMTP id 006d021491bc7-7093fdb91e1mr2332072eaf.28.1792618141647;
        Wed, 21 Oct 2026 14:29:01 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-709043a60bfsm2960339eaf.13.2026.10.21.14.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:29:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 21 Oct 2026 15:28:48 -0600
Subject: [PATCH] clk: send abort notifications when a parent change is
 vetoed
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
Message-Id: <20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM3Q6CMAyG4VshPbaRjcSot2I86LYi9WeQbhITw
 r2zyeHb9HsWSKzCCa7NAsqzJBljCXNowA8UH4wSSoNt7cm01mD6uo9k9O8XTqQcM5IbNeNs0F1
 sZ8mfuxAMFGBS7uX3x2/3vcv6yT5XsX44SoxOKfqhngp6rPC+WtcNsR+8e54AAAA=
X-Change-ID: 20261021-submit-clk-parent-abort-v1-b9232ac83dd1
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Mike Turquette <mturquette@linaro.org>, Thomas Gleixner <tglx@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

clk_core_set_parent_nolock() returns directly when a PRE_RATE_CHANGE
notifier rejects the proposed parent. Consumers notified before the veto
do not receive ABORT_RATE_CHANGE, even though they may have stopped I/O
or reserved resources until the transition finishes. The caller also
receives a positive notifier return value instead of a negative errno.

Recalculate and notify the unchanged subtree with ABORT_RATE_CHANGE before
returning -EBUSY, as for other failed parent changes. This lets prepared
consumers unwind without changing the parent or its rate.

Extend the mux notifier tests to cover both a self-veto and a later
notifier vetoing after the first consumer accepted the change. Check the
abort notification, errno and unchanged parent/rate in both cases.

Fixes: b2476490ef11 ("clk: introduce the common clock framework")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/clk/clk.c      |  5 +++-
 drivers/clk/clk_test.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..a9620d9e0db1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2983,8 +2983,11 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	ret = __clk_speculate_rates(core, p_rate);
 
 	/* abort if a driver objects */
-	if (ret & NOTIFY_STOP_MASK)
+	if (ret & NOTIFY_STOP_MASK) {
+		__clk_recalc_rates(core, true, ABORT_RATE_CHANGE);
+		ret = -EBUSY;
 		goto runtime_put;
+	}
 
 	/* do the re-parent */
 	ret = __clk_set_parent(core, parent, p_index);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1c5c8b7c1f3c..e9d0d6f5084b 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -2364,6 +2364,8 @@ struct clk_mux_notifier_ctx {
 	struct notifier_block clk_nb;
 	struct clk_mux_notifier_rate_change pre_rate_change;
 	struct clk_mux_notifier_rate_change post_rate_change;
+	bool veto;
+	bool aborted;
 };
 
 #define NOTIFIER_TIMEOUT_MS 100
@@ -2381,6 +2383,8 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 		ctx->pre_rate_change.new_rate = clk_data->new_rate;
 		ctx->pre_rate_change.done = true;
 		wake_up_interruptible(&ctx->pre_rate_change.wq);
+		if (ctx->veto)
+			return NOTIFY_BAD;
 	}
 
 	if (action & POST_RATE_CHANGE) {
@@ -2390,7 +2394,10 @@ static int clk_mux_notifier_callback(struct notifier_block *nb,
 		wake_up_interruptible(&ctx->post_rate_change.wq);
 	}
 
-	return 0;
+	if (action == ABORT_RATE_CHANGE)
+		ctx->aborted = true;
+
+	return NOTIFY_OK;
 }
 
 static int clk_mux_notifier_test_init(struct kunit *test)
@@ -2488,8 +2495,61 @@ static void clk_mux_notifier_set_parent_test(struct kunit *test)
 	clk_put(clk);
 }
 
+static void clk_mux_notifier_veto_parent_test(struct kunit *test)
+{
+	struct clk_mux_notifier_ctx *ctx = test->priv;
+	struct clk *parent = clk_hw_get_clk(&ctx->mux_ctx.parents_ctx[1].hw, NULL);
+	int ret;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+	ctx->veto = true;
+	ret = clk_set_parent(ctx->clk, parent);
+	clk_put(parent);
+
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	KUNIT_EXPECT_TRUE(test, ctx->pre_rate_change.done);
+	KUNIT_EXPECT_TRUE(test, ctx->aborted);
+	KUNIT_EXPECT_FALSE(test, ctx->post_rate_change.done);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk), DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, ctx->mux_ctx.current_parent, 0);
+}
+
+static int clk_mux_veto_callback(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	return action == PRE_RATE_CHANGE ? NOTIFY_BAD : NOTIFY_OK;
+}
+
+static void clk_mux_notifier_abort_parent_test(struct kunit *test)
+{
+	struct clk_mux_notifier_ctx *ctx = test->priv;
+	struct notifier_block veto = { .notifier_call = clk_mux_veto_callback };
+	struct clk *parent = clk_hw_get_clk(&ctx->mux_ctx.parents_ctx[1].hw, NULL);
+	int ret;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+	ret = clk_notifier_register(ctx->clk, &veto);
+	if (ret)
+		clk_put(parent);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/* The first consumer accepts PRE before the second consumer vetoes it. */
+	ret = clk_set_parent(ctx->clk, parent);
+	clk_put(parent);
+	clk_notifier_unregister(ctx->clk, &veto);
+
+	KUNIT_EXPECT_EQ(test, ret, -EBUSY);
+	KUNIT_EXPECT_TRUE(test, ctx->pre_rate_change.done);
+	KUNIT_EXPECT_TRUE(test, ctx->aborted);
+	KUNIT_EXPECT_FALSE(test, ctx->post_rate_change.done);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->clk), DUMMY_CLOCK_RATE_1);
+	KUNIT_EXPECT_EQ(test, ctx->mux_ctx.current_parent, 0);
+}
+
 static struct kunit_case clk_mux_notifier_test_cases[] = {
 	KUNIT_CASE(clk_mux_notifier_set_parent_test),
+	KUNIT_CASE(clk_mux_notifier_veto_parent_test),
+	KUNIT_CASE(clk_mux_notifier_abort_parent_test),
 	{}
 };
 

---
base-commit: 81493c1dd1b1ebecb2843a7815973a5bd9a37e5a
change-id: 20261021-submit-clk-parent-abort-v1-b9232ac83dd1

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

