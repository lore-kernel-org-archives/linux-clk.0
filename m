Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBC03CAE9D
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286753; cv=none; b=C3TPiZbMu0IUzYWNtn74IVgQNOoT13Ku/7CFKW6MSyj34aHXZpWyjyoeLF9xArgPGYNvV+OP3XNUjX0p/0aqaN9RHJ62HObn6U2skH+PDgf2VAbU1pE+3XjeloRiVK4aa5udsfLgolUxhXXqsBZ9oSyyB9WOBxS4RDpHT0cUmEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286753; c=relaxed/simple;
	bh=WDIE7lt2EMyOXFUD9TIulldMehjU0ziYiCpz80CIxbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCcxgPNlN9SZ07kgNWYudlDlURWbMiHW1LJpz8L5EZr0O5VKhZd/HNbs4BiUd+KN5Vhy73Sm8/gfgtU3oqDEIAtzeX/3AOWAZ717mh1uBt51UC4UnosQ8DtWfu9W7VLIwV02nS3kIaBHR53Dzy7wYU2jJ88alp6yo/SqEwKHI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DT7gatn2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+mw5ojE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DT7gatn2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+mw5ojE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3ukp7lwYjI/rsNx0zgB5rYQ+pIaxNH93AMrhUusdCA=;
	b=DT7gatn2iH0XD+79rM5aB2hlAv3ZrTae0tO6Od8BKHA3wTPMBC1Dcw4p8ewotrzzmH4GYb
	zg8dF0HxoevAB+xMvf45koHhE1WG4ye14LBIRXJQW+lAjiY+vuedQOP9e2bvCdQc4k3Gqc
	z5/qZciL5+WeN2paiZjmvfPcIDhcqS8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-wi_1LDd8OceU1sfr8fEKlg-1; Mon, 23 Mar 2026 13:25:49 -0400
X-MC-Unique: wi_1LDd8OceU1sfr8fEKlg-1
X-Mimecast-MFC-AGG-ID: wi_1LDd8OceU1sfr8fEKlg_1774286749
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so21245441cf.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 10:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774286749; x=1774891549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3ukp7lwYjI/rsNx0zgB5rYQ+pIaxNH93AMrhUusdCA=;
        b=Z+mw5ojEWSaTmJ3OfOY6NJYvSXX4f7BvjJSejfP6zwMYn1ny8BpirjUrL9ebq6Qkv6
         840y7SHbpN4Y9O80gRqDOp97lDdjNTuoUOw6HF461H0tn+ad60Ysu70dDpVUFB89Z0NR
         acWNNihC2TJoO7iXmeiTpzbUZlvqx2gBDTRcXtZBzWbnB4LZQ6w5JH801zgpsYtxt6my
         QIejadYxy/WuXyEv9/c3iq241m1AWa5My9+QPIMHLVSTnlLCgM9bNFCmJDxVezgztlYC
         GzvAb5sO+uMoq6n3gtWM+BbnSz7KSfXVIN3bRnk6BMBS0LzdeZp1nAgRSZkf0zk3Bduw
         Xvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774286749; x=1774891549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3ukp7lwYjI/rsNx0zgB5rYQ+pIaxNH93AMrhUusdCA=;
        b=HWYP7MahfjPZQ25QAq++UEOhqDqIKdgY6fvXlVPabJoGpOm05lDF8URN8cZQYWXpBS
         y+1B4Py36WmdCTa9WzIOReb3IhSOiISqPvumCNxsETMZTkCmotYSS94QGw36EJ8KgUjb
         mexg9tgACfHMh15hdrtyLN0V+czIfkA660Q7bdT/Y5nAlIiGPSxiNH4jhzYLwhRsaUHd
         YD8qKlQyevDpmf+hBWMAIU8yhucEsPBR22sT248/nc6Z4jcqUNxGMQUYD5SDdwZJgaEO
         gyeOCM3NMc14KXBPMWjAbizYvdvsMeI1zKRdyEudp3WZPn5NAaSf/tvQ3+5G+LWWWPWc
         XW3A==
X-Gm-Message-State: AOJu0YyHC2K5gJXBRPJaA4CW4bB33aXw0oRhO353KFIaF21XQfdiBACy
	jgiHznAigiMssPWdgw7L195b31xo4Xez/ZIwM3UdsmtX1r6QeL9w6yiVqUHCEOlkRyWZ8oW3f/U
	q+F51avhZ2jSHIi54JJIBCeBLaNDJhKtvFUjKbSBfg/OuCoduAgPThvbx0FsP0g==
X-Gm-Gg: ATEYQzxDk71Q7pyno3/KnX3bIfneYPE5WLzmoD7Ubz7Dg4r56oKV1O1Hd/ECIocPyra
	P7b94zjEWwLQ3l3a7fQJ6n2zJXFVPQkNsq+yxjbdgoGW/yBEvoKrtvhemvZ7QTe2tElS/RmaPZa
	x1683XrtfRNimampJLNSzHWEGIt7fEOZcDQj+kQfXmmX0jeKdQShaIfa/BrpbujlpJpCrQzBUzj
	k1X6pSUA+uhSz8/vT0o4Ovd/FXHoYBixwN4KzpEQdepmryrREIJzF7XrncYqaS1/X6dM2197CDt
	PNrjgNH4zGeByGsdOuvuBo3BAcKkuvCAHPGok9RPey6TCQhbNEOOyKg4neW/5La5JxzUQuOvgck
	zrG1Q4Tth7qvF0nsugmO2GoiOCOEIdYZXXSS4Dzwn1XAStsTzLGhVXsAIBbVP
X-Received: by 2002:a05:622a:1b91:b0:50b:3895:facc with SMTP id d75a77b69052e-50b38964598mr190997821cf.14.1774286748526;
        Mon, 23 Mar 2026 10:25:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1b91:b0:50b:3895:facc with SMTP id d75a77b69052e-50b38964598mr190997271cf.14.1774286747947;
        Mon, 23 Mar 2026 10:25:47 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36e34f8bsm108249661cf.15.2026.03.23.10.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 10:25:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 23 Mar 2026 13:24:59 -0400
Subject: [PATCH v7 8/8] clk: divider: test: mark some tests as supporting
 only v1 negotiation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-clk-scaling-v7-8-8e7193dc9405@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2824; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=WDIE7lt2EMyOXFUD9TIulldMehjU0ziYiCpz80CIxbU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIPlnd7nekL2qX8bduML9Myd8kVr5HjsOVqK7KZxF29k
 rlZa411RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABPpEWL4K/78FOOH2VHrQj+u
 Upsw6VKjbPkOA56bPlKvJI1/feTt72H4p1jnZVS79fZtlqqAm6tSlVaureJJenehqH12x6e6Bwc
 TmAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Mark the tests that only support v1 negotiation to make it clear exactly
which behavior is under test.

Link: https://lore.kernel.org/linux-clk/aUSWU7UymULCXOeF@redhat.com/
Link: https://lpc.events/event/19/contributions/2152/
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk-divider_test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/clk-divider_test.c b/drivers/clk/clk-divider_test.c
index a16c04d5d8a86952b42750d326f88754fbc91eb7..646307f1d78a08130a8a552b57874e21b07f7b4a 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -54,6 +54,15 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+/*
+ * clk-divider.c has support for v2 rate negotiation, and setting the parent
+ * based on the LCM, however we need to be able to test just setting the parent
+ * rate based on the LCM, and not set the v2 rate negotiation flag. This is to
+ * demonstrate existing behavior in the clk core when a parent rate that's
+ * suitable for all children is selected, a sibling will still have it's rate
+ * negatively affected. Some boards may be unknowingly dependent on this
+ * behavior, and we want to ensure this behavior stays the same.
+ */
 static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
 					    struct clk_rate_request *req)
 {
@@ -197,6 +206,7 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	/* This test is expected to work with both v1 and v2 rate negotiation. */
 
 	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -229,6 +239,8 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -265,6 +277,8 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_TRUE(test, !__clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);

-- 
2.53.0

