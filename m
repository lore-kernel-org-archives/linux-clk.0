Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8E253B5F
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031595; cv=none; b=Pq1zwCLa2J0zpBCrEBTs/bQCEJDSigmr4EpTgfAkRpEMi3AdTcGKQS8DA6Fcwh20zPxTtNuqbT4aR9VEvA4LDlYUCzBn9Ldcoi4Sg8xtE5Urr47ks25Gsoj5p3HS99U4MQaG0qUSTWrV7u+YzlmKFNIa/FSyBJUDot9eR/tMsQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031595; c=relaxed/simple;
	bh=7eX6vU70kWv6aUWi8R4b9wN+zN2bOhSNdyX7zLBgvhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=cOxL9CNFYCfm37OC+8aTwPJ/IyHKGuSH1c8pO+6bsyPPvXFypPwRpo2sthG8U5eBOW9chXF/B8IGmv5X/X2leBr5+07KsXVpJbf5xWb/KIx+m6vUyg0CLYVdwV9hwExxJhYGCBy4dgdtVJtsxfNlHEw7iZkmkiHABaBJS1uoIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CekVyWKt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CekVyWKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9lCnalV/KwjMC4bFuYLU7hw0fDsHdehp4fkHlEXRtM=;
	b=CekVyWKtuvvZVrWMgmkuP2OJBFh+qfeqKP9eAIUZqEV7XKobZXQHpa6M3gHOF2s7ccwaq7
	LtJ3J4O/gaQptHH0XTVB0Hm27JPxHtAiv8phd0MlytOcbld0vbaM3I314oq49RcFVQia6m
	N67u1LzibzWbbh1lgxJGgdbGvO6VVXA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-2_D6ZyghNb-RqwpEdIBy1g-1; Mon, 07 Apr 2025 09:13:11 -0400
X-MC-Unique: 2_D6ZyghNb-RqwpEdIBy1g-1
X-Mimecast-MFC-AGG-ID: 2_D6ZyghNb-RqwpEdIBy1g_1744031591
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8ed78717eso79254566d6.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031590; x=1744636390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9lCnalV/KwjMC4bFuYLU7hw0fDsHdehp4fkHlEXRtM=;
        b=JG6nKMci0w836eyny/To7xACR/9f1oyiryapZa4ZnLAIeRvZY7cbyAfT511M5ICCwG
         yQHcEjgZvND/mqsWrhHei5wpnvHJNG1hrJRCbqtozYOHJ76qbst3XVCz3OqT9MnrmTkC
         2M9y22jwN/3w8v77vgkTZPeinsZRwNWlpOid1/edVrYPzTDvuYeoy0cVmYJ1e/YBRfGh
         M4wSJHQ9RACWZHDEB1A1F5AWC5l0tV/2Sc5LKZvVtKZlxJ0rd4xelqwzydVmPxOzyeKr
         f2TGbbVzBU5Z7gDSjaeFIccDD8Fs5ZLPBxNZZCXy34nZDJL9Vf9WVpf0bpCKOB308uDx
         KQIQ==
X-Gm-Message-State: AOJu0YxRVWyFz0hHoarAw4fATxyVnuQ8We2Jf7/njMAGXt3uyUIb773w
	/RTmbLpvSHJy/LqwO/VZzsW5DKR2TwoO4Q6W2JYm0JssdizDlSDTCBJ4EXSo+qFrt1N2TG5p50y
	fv0i8X7YAlmDi1QqdhnDqkJ4gowcViryumwByFGL/4l4sfWtvbvEqWdX1RQ==
X-Gm-Gg: ASbGnctq8r3k82PRYmeitsFfSyxu2EgIWcMElfhKLJ81ts6/u79HFDjiNBOoSQtA4IL
	l6aiRFnzhhKnhlIrw3HgqzVqol1ZmCZWy7kY3yMPUD009hCXiHWMBt41EBmTAf/mdyjUokjudc+
	lGbJgN/H/tAmVwTKn09Gi1dKOU9EtFbV1mhf0YktkL+tOosLzrwo5PogrFeTXSvurCTl24M/gvs
	KREfvGPxvowgr1hLmQKXVyP4Ck6tED7w6VuGSaFgzWIczlACuDhCQGuWR3NCxIyBfrEH9WI/XwW
	wMMrj6tlcbQkUVfcWhnQlb76zPIE0uCQw3Cf5MiqMA==
X-Received: by 2002:ad4:5f4a:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f00deb6471mr216309776d6.15.1744031590770;
        Mon, 07 Apr 2025 06:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJVA5cdvPfMT1cbbV0KBVMgtp43I7rMfUHFXHZZtE9t1ke1BHH9yVmlIS35qB8irghkIqLjQ==
X-Received: by 2002:ad4:5f4a:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f00deb6471mr216309396d6.15.1744031590508;
        Mon, 07 Apr 2025 06:13:10 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 1/8] clk: test: introduce a few specific rate constants for mock testing
Date: Mon,  7 Apr 2025 09:12:51 -0400
Message-ID: <20250407131258.70638-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Some of the mock tests care about the relationship between two
different rates, and the specific numbers are important, such as for
mocking a divider.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f08feeaa3750..1b34d54ec9c6 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -24,6 +24,10 @@ static const struct clk_ops empty_clk_ops = { };
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_6_MHZ	(6 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_16_MHZ	(16 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_24_MHZ	(24 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_48_MHZ	(48 * 1000 * 1000)
 
 struct clk_dummy_context {
 	struct clk_hw hw;
-- 
2.49.0

