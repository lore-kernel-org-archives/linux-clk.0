Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC814283137
	for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769359; cv=none; b=HRPPb7Qe0ztX3CfkY0oqOYuhsSt+OVyQ/KQDxxszu7SY2ekVYaSxKZnpSZcwbqxosXcfv6VsxFXLolY6WowkIaxkcL3USawF776P/6rhgDEnJUou0kg9n2VBynR8RlnpLrMWbZVWMiVzOJYCaWpcgMByJjKSRammtb5EpdSj6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769359; c=relaxed/simple;
	bh=qagXFyX6DO6npNhzgmzI9I31xIac0rqUc3ReIXNHMFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Umk8eXJfDFq55ZpFvjnRofozmlOr2Ov9iTZ8gY7ZwRiz15vxkVfmsVa0uBaruHBYRKNTw/+VonO6Y/mJLCNhhlU0g7NHJKb3qbnzu8dabZp+Y9kVTPjDSAHcPIdLZU3ugn27JatQ6SqZfJ55Pzm8hh0MOlcj0gFdvHP8hRwHE9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RX7980iu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RX7980iu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747769355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaG/a22ktjUKI8Hs7U5t2PNfBfvcukOkCUv/Mno8b50=;
	b=RX7980iuVXcgm14lfCnYQFKML2gM8uDGNczByaxS6tR0xg9gN0VnGtu9cNRhX7VmJU6c0P
	TfTJ0m8Ng5bxEwVUzEfuH8ZUT4LPtRtqwNtzC9h7p3DdQk+EbPECld3cpuH5BI0/lNA0H2
	LH5YMptMWSZ9u1suB8ZvPT+015FNj7g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-y-jITRA7N0-XdegJprnBmA-1; Tue, 20 May 2025 15:29:14 -0400
X-MC-Unique: y-jITRA7N0-XdegJprnBmA-1
X-Mimecast-MFC-AGG-ID: y-jITRA7N0-XdegJprnBmA_1747769354
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d3f48f35so49419466d6.0
        for <linux-clk@vger.kernel.org>; Tue, 20 May 2025 12:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769353; x=1748374153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaG/a22ktjUKI8Hs7U5t2PNfBfvcukOkCUv/Mno8b50=;
        b=PD2yQhbidCpPzNGWgTwty7M6pB9m8RaTAqi1/NXX2Z5cVjkH9m5IEck7Q8AdIk7xNk
         lhlY8HOIqUDJO3UhPl88VZVeY6rk1hyhZfcBU0dSmk4xJfcI3CJkbuPiNe+xEZzb984x
         UqVUEFg0ncf04mnrhIthj0WMAGRvANTGRYkAuC3VD+IijaDdtgkug5zTZKvvv1CApc3M
         vGtYvhkYXKJPkY7HlkGzRDgeGULJCSn+O+GQj5VgD+dKMSO2YTZ28zt3O9o3++rmBeTU
         ymUEUuueM8NRFg39mRC95f6x8rkgzUxaORENLDOqoBtdm6hs9DGC8u12+z6Zmhnd8G7N
         f4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVmHTDpNGgaJBRY9cIA98dZy7QrElWYmyhWUCxgXuS3dpmBNrZg8C3f2PRBevPODrsjERuqCPvCQk0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz15cb3O2G2i8G6+8vrH5sGLXDyq4WtyzXOh26NbvN/xeAN4iTd
	6gVCVzs7/dereJFlX1qB/eTh/c73+G908egpBa9mO14BGlx/JBUIKMU5xwlsXU45/9NutsghFUC
	p4XOFYkh9Vb23ItSRzW1VxWqfRYShZGRO3d1UGafoZ8B+G/78a7Nn1u3gJLFS1U7brl7/ow==
X-Gm-Gg: ASbGncsuNXrDj6rnWqciCPWNLtESiMDmpsmLaOzoymf8oj+QhUkvxVEKb8POy4tEuMk
	J+9aDy5WHIV1SCD2js2oLjwIVnSfq5x8W1sm2XN81u5p3WP9W06hZPKXmlWVlXVrftLi19L8yU8
	lAmiV5WRTPRHVGe9RqmZ0oMjmunnGpX7U5YyzwFLUZrXyprEARbRvS8/tHCxYo99HMq9weVaqOy
	OEIggwmsuHBvO1G6HEwoICHdRXI4ynk0YNQboFyrNWvNpgsNtUxjwziq7Mj2x+I8+Foua+xYIIN
	5tIp
X-Received: by 2002:a05:6214:20c7:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f8b093931emr289978586d6.40.1747769352788;
        Tue, 20 May 2025 12:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbLVlWn6eZEm4rwwsdeKPX+/GO84p7UP4Xe1oM6j3/NOiH/TWKYpu6JmSovQ9dYJLVtYCUBQ==
X-Received: by 2002:a05:6214:20c7:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f8b093931emr289978166d6.40.1747769352325;
        Tue, 20 May 2025 12:29:12 -0700 (PDT)
Received: from x13s.. ([2600:382:810a:a775:a7c2:b4b2:4756:68b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac502sm76018156d6.42.2025.05.20.12.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:29:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	mripard@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: test: remove kunit_skip() for divider tests that have been fixed
Date: Tue, 20 May 2025 15:28:46 -0400
Message-ID: <20250520192846.9614-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520192846.9614-1-bmasney@redhat.com>
References: <20250520192846.9614-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

These issues have been fixed in the clk core, so let's remove the
kunit_skip().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index e6df1d2274b2..3f0bc44c06fd 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -788,8 +788,6 @@ static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -808,8 +806,6 @@ static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_16_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-- 
2.49.0

