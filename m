Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1B3389DE6
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 19:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639968; cv=none; b=ZNMHwSqX8Bv2cMxbjzPX6uQml+X70doBAn+qXhn9YQU4nilNFafCxCx1kFc533JkDQPsuYLY9AqPwZMBoTDJri5ZAMjVWvU+457lirO/MPuHi0tDyS8aOqA2J4w1hr99SGHkiZsPeoQAxQpbdkBWYaepdXvEAozKI+Q+ry0biRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639968; c=relaxed/simple;
	bh=6+2kBP0xFMlyP7Rqf4y/vpPGQhqSzW8u5Cx4E55/a6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1KYbq1pWTMJjPfGcblQQ7JpFHZKa9gu8clmzfduqWHvhKZJm72PAC9XL/15VCpfgZXtejb0U97LVn8ios2ebA0glPbfjWl8iTP5VE6bx8CNWdwr7KFUaxY7QG6FMo88lyyLxTioMVz6LfzsD5/Bvy9qg1maBkuJsNtqJ6nA8pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cxhdJrrF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=I/uQPNtu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cxhdJrrF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="I/uQPNtu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774639956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2Xju4230th3m0bCLEm7u/PVwZF8WftpyZTqnsQeR4Q=;
	b=cxhdJrrF0EJziKFThBSQQLUQMaFWbZWvnFmmP3BirpMZ33kvZjk74AGboYyHNCe3Wzr8OD
	JWYxgAtOva8xXDrE2Qcx6Pb12YXNPENMcDa4Wxq0w7tNg9ihjnO/2/Iie0GAQD+iad2DvP
	9n9ipBg0u57e3aQU5HxbpdYoRfcs3u0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-xancZHlYOjSFmMqOmmAxTA-1; Fri, 27 Mar 2026 15:32:35 -0400
X-MC-Unique: xancZHlYOjSFmMqOmmAxTA-1
X-Mimecast-MFC-AGG-ID: xancZHlYOjSFmMqOmmAxTA_1774639955
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso73357271cf.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 12:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774639955; x=1775244755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2Xju4230th3m0bCLEm7u/PVwZF8WftpyZTqnsQeR4Q=;
        b=I/uQPNtu5pkryilhGBv2We+zfqtfmphvTl/FoMLHKYV6mNSXKAbRLv+h3Z5bVnx3+/
         Dk/4kVtaNRkipAJFFykl4XLSsLByUZ0EMC0sFB78VZmwDUnIljdOYOGp1QobfM8RcQsf
         K0SznOI06v6QRGw6UFTQk8q5z+NNk6uwGUDjJnaBy62bXvEJbRyiaIIxEZpPkbkI7dj1
         m+IJXZXmFxDRI/pd8ai5RaxE85IaCS1xzmEkjKfzT5eD4LUvsHv8VhBT8okxIbqwVGsF
         e6FFm5KajO9CyKKTv0hLcsriEEzuaYc5cCDURI+SDBn6q00Lk3+WyPHbnulOej7xx4KD
         5jHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639955; x=1775244755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2Xju4230th3m0bCLEm7u/PVwZF8WftpyZTqnsQeR4Q=;
        b=FDunzU95T+UhGnLWCMURQddGOifpR9y0aifgFcJ9w/dHkUzPzzFmoAfYsPN6kLDut8
         SekBednE/iWRo/689omXl8SWecdsDMf7bubl/1sZDGckHqkjZG59RGpPSz93Qkbi+RY/
         9XRwfsOo1ky0HzWDxzq44AYhmKOt8Td/AtGbJnIpfjCky+8qLHvmUXD6qqDqlGYnziHQ
         eBsSPzgFTaem6cSDmKoAg3K+9BKODU9r+LQiYATMsJl+iepSwAIxnwZ0ERcG6gMp7eU0
         M7+PRnU45U+KNEgv75rt1hjkcFXhhAuJrOL05/rwG8QZB6kHrNJ6ta80Dulzio98QPNf
         RQiA==
X-Gm-Message-State: AOJu0Yyaochj3x83xSXrKeMRAG/xTuGrAfmqv25aDSyhEAs23+wdjxi2
	rbFeb2yL52soTbK5+EajHE6/tdO4sp3AAwfXHSIw0mjeRWsJGVRIt1UBWjfCVkHt8YmLLCb+VlL
	YZ/VNces6ymx2ePnL9G4SKdF17m1Ir9poA9xT6/CctTda+nkuvwZrT5DITAdkgA==
X-Gm-Gg: ATEYQzygzfv1mcryLhRRyek/3EcPKjQKJNtO+8ztqBIC9RL5UA7yRCpARZpE4S3h3M9
	mKm22vmGznt0O0Cm23tXOJNiPxiY/FKc41XU6DUEDJ4wf9y+R0FX61nvaJL6QulhuqJFmiJrQNw
	AKjS6aPk2OzzPGazcPsZCeYgXEC4EeRWOfSYLOqGCVpPyUNWU3gVLt/UXJ9pIZdOp0BvQWZFFVC
	PRu+bsj4GEGjWzXuHk0p9cAyrsyLUKiQngGiOyFVTgPl89eC2xkKzLY63ePPW24W0TyaoP6h+r9
	Ruw0On2x8h1rE1VrqYrck/I5YN485M2dUHsIM3jYydV983X0HpBaMXEktpvFv2TCkZNmQEUuoyB
	s+3bViJfjCT5y/lIrx722ZStWG20RE+u/JtJzGIt/aPrv2PMdpw5E40t0e147
X-Received: by 2002:a05:622a:10a:b0:50b:3d9f:3846 with SMTP id d75a77b69052e-50ba38e6dcemr49601361cf.50.1774639954666;
        Fri, 27 Mar 2026 12:32:34 -0700 (PDT)
X-Received: by 2002:a05:622a:10a:b0:50b:3d9f:3846 with SMTP id d75a77b69052e-50ba38e6dcemr49600981cf.50.1774639954182;
        Fri, 27 Mar 2026 12:32:34 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c678e9sm2037551cf.6.2026.03.27.12.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:32:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 27 Mar 2026 15:32:03 -0400
Subject: [PATCH v8 8/8] clk: divider: test: mark some tests as supporting
 only v1 negotiation
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-clk-scaling-v8-8-86cd0aba3c5f@redhat.com>
References: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
In-Reply-To: <20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Alberto Ruiz <aruiz@redhat.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=6+2kBP0xFMlyP7Rqf4y/vpPGQhqSzW8u5Cx4E55/a6I=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKP3XaK2NLdx2Ugd9FG46zFttpNfQH3G/Vtzj+auNB1b
 cSR/W0CHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEwkxZuR4Z1U9auiv38O3d02
 O9fZo3DqhruMAQ9KTJxcdTcwKa9+fpmR4ezTjYt17+2Z+LzTfuKuj/7fTnyT8/fiemN2p2pjMYe
 ZNxMA
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
index b55c822dfff018452f0a3acd4ad7ccec6f1259d4..e985b19a2b5ea4b8e7a1ba78631f7ba3a19f625b 100644
--- a/drivers/clk/clk-divider_test.c
+++ b/drivers/clk/clk-divider_test.c
@@ -59,6 +59,15 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.set_rate = clk_dummy_div_set_rate,
 };
 
+/*
+ * clk-divider.c has support for v2 rate negotiation, and setting the parent
+ * based on the LCM, however we need to be able to test just setting the parent
+ * rate based on the LCM, and not set the v2 rate negotiation flag. This is to
+ * demonstrate existing behavior in the clk core when a parent rate that's
+ * suitable for all children is selected, a sibling will still have its rate
+ * negatively affected. Some boards may be unknowingly dependent on this
+ * behavior, and we want to ensure this behavior stays the same.
+ */
 static int clk_dummy_div_lcm_determine_rate(struct clk_hw *hw,
 					    struct clk_rate_request *req)
 {
@@ -184,6 +193,7 @@ static void clk_test_rate_change_divider_1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	/* This test is expected to work with both v1 and v2 rate negotiation. */
 
 	ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -216,6 +226,8 @@ static void clk_test_rate_change_divider_2_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
@@ -252,6 +264,8 @@ static void clk_test_rate_change_divider_3_v1(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->child1.div, 1);
 	KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
 	KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child1_clk));
+	KUNIT_ASSERT_FALSE(test, __clk_has_v2_negotiation(ctx->child2_clk));
 
 	ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);

-- 
2.53.0

