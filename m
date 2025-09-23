Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD1A2F60AD
	for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 14:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638428; cv=none; b=tlCvzTeclyksGXwSkWsCEae3ZBnS3lMyaZnZ8tjhonDZzht5EsQJT2ms+lXz7hzinje4+gDjLWkFWSAYvqLIZpzMP/TSnzAktnywSrMK2LkPpQvDYj4BiGy+ny/9nk71qTon09/yYPY+2tcVmeqRBGR6AuWw/R/4hRAwJClbHhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638428; c=relaxed/simple;
	bh=TiAVMMX0BhZ88QrzXHt9pRkEcv8jwTCO6wBg4capGYg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rtyrtWEKNSreiSPpY4+vj7hZQ4PVf0OrG7IL+kUQOCe9BgD2dJodMGOUvcKzwHk5GUwr6wYjBTcK6JWW/kAfJkMZYWTLWzWsXAmbAe1i+S9//4ifVK6QUxowr7AhOcIqKsAHcTjT4tGkHTgCb9SlcScES9LbYK34a6iWQdk332I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewxOw7cZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewxOw7cZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758638425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttJMiiiNX3mRY18NUefNDmQ3WxdD+1OalFtqeM6LpeI=;
	b=ewxOw7cZ4cdITLig7Jpu+fXK3HL8RlF+zzVFtDvpnv4dlN3Osye8zGY5zra3HkLCaoHI6Y
	uHebh7g1uPSbjqvaKDfJsnzSyM6u9/sfsPwnIoBvx57klUck0dHEfDA2OXDzLBqaGNO93N
	ewwOamJH95bipRT7T8ecPs3EyqBKTfY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-2uieXgzUMPCKRBY8142ZUg-1; Tue, 23 Sep 2025 10:40:22 -0400
X-MC-Unique: 2uieXgzUMPCKRBY8142ZUg-1
X-Mimecast-MFC-AGG-ID: 2uieXgzUMPCKRBY8142ZUg_1758638422
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-817ecd47971so1270238485a.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Sep 2025 07:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638422; x=1759243222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttJMiiiNX3mRY18NUefNDmQ3WxdD+1OalFtqeM6LpeI=;
        b=v3/ZYH2LBy0PMiLa8OSM8WOZ/O1DENQg2VyHjWnbuZH/UuH9KogOjmaLMYrmNd5vlc
         6Ha4j2iBjpxyTgkr6btKzLkeWvtJs7QHDuAmsVkdaM99AbuSlEgB4+S3kpFj/qcabNfc
         xT25ui79Hg5kW51DNiqPWPy0J51Iw5Y1g0qp0WhmPMvzpwbZGEVx4Ac+3/W4aOF9YyBM
         IBShVgdAhTcTkGcRQ3rivu5IUYM+C0Mqcw8GEML5K18yA6b9p8wcE/0c4AcQWqCXCrV8
         Y3Vza1zggF22rGWRWL1QFAajfm9YDS+0hzwoQwYdyWrA1ZMjsqLsZ04xcbRVFKLm3byz
         zgIg==
X-Gm-Message-State: AOJu0YzCtKaZb4dPA32qQFgvzzbPkp6HkSQ4DQtw8g+/LU83G9Az/gKH
	3R7uf3j3u6hiMuPQmyDb4xXFc05J2YuvYvEBK0tboR2Np2oL475GDB5ZCZF7p/lxFWaTFiAdYup
	QLAvkJ2F4ZJM6UPjFWn25jOBQEZJJUgVnbhs22SjzWZy7hdW/PYDVSQ/HR1aXzA==
X-Gm-Gg: ASbGncsLCkOJe2r966tj6CloUnvHp2VAMWGtw6I8T2X1ZVj9rBoW/9NukfO6xAR5Hkk
	M8TRIN3UFd/XA7cksEhUiSozTYwdUvPSXiVcUgKVgDYa04Bp6BXg4C2/NLoelEh97a0c6dS02HO
	f1hxh9MWOwBfaeU+57vLc4WolOEyi+wHie1jC9lHDAQ0AO+W4NDKCNES3mStvHgSAPx97Z8YKt3
	M9TR5YoY3Y43NraRWMzTOfjZ+j1EM+0jr/Jr2JrTyoQC9ZVXm9I+gB0qx6LEIPyD1oakqzg+ITC
	RJf3wKJDsSdUlNMMCaTqef43NRQJAGkGsPonSIDC2Fz5YcHzKK4HoGJPShRST18Vz+UYaKv+y/X
	B4OEYHU6CakhkLKrSB0+gjYV6q0Jhpxlse1IBdSU=
X-Received: by 2002:a05:620a:3905:b0:84f:fa6f:8dae with SMTP id af79cd13be357-851b786ab49mr314754585a.30.1758638421489;
        Tue, 23 Sep 2025 07:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUK/M1zsnzUN9MP0pcbn4lT/oOtPlFmMyQzwG6v93P6G8aw82V54M2ccRD4QNt3HkJwTzLZQ==
X-Received: by 2002:a05:620a:3905:b0:84f:fa6f:8dae with SMTP id af79cd13be357-851b786ab49mr314751885a.30.1758638421010;
        Tue, 23 Sep 2025 07:40:21 -0700 (PDT)
Received: from [10.175.117.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-84f2f6f3c25sm230272985a.49.2025.09.23.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:40:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 23 Sep 2025 10:39:30 -0400
Subject: [PATCH RFC v4 11/12] clk: test: introduce negotiate_rates() op for
 clk_dummy and clk_dummy_div
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-clk-tests-docs-v4-11-9205cb3d3cba@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
In-Reply-To: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=TiAVMMX0BhZ88QrzXHt9pRkEcv8jwTCO6wBg4capGYg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIubTS4dPWjtbXpB9tlnQwnJMKmrP7TWLkzU2FljPjRP
 +9Psz2531HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE5ugx/M/qvHHrxuJr7Bse
 f3+m9FUgwG/XuecNl06o2Bw5xSv1aUYSI8M7hUCrhjl3p7Dq/F/LJPDL3myq7j8N3oql3yMUBCL
 fzGcBAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This is needed for the v2 rate negotiation code where the parent works
with all of it's children to find the best suitable rate.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 32defaf1972c28224108c32aef1e74796aae8bc0..7c4d1a50a7dd0bfb66e021ba314a9a9709813d97 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -29,6 +29,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	unsigned long negotiate_step_size;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -97,10 +98,31 @@ static u8 clk_dummy_single_get_parent(struct clk_hw *hw)
 	return 0;
 }
 
+static bool clk_dummy_negotiate_rates(struct clk_hw *hw,
+				      struct clk_rate_request *req,
+				      bool (*check_rate)(struct clk_core *, unsigned long))
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	if (WARN_ON_ONCE(!ctx->negotiate_step_size))
+		return false;
+
+	for (unsigned long rate = req->min_rate;
+	     rate <= req->max_rate;
+	     rate += ctx->negotiate_step_size) {
+		if (check_rate(req->core, rate))
+			return true;
+	}
+
+	return false;
+}
+
 static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.negotiate_rates = clk_dummy_negotiate_rates,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
@@ -175,10 +197,28 @@ static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
+static bool clk_dummy_div_negotiate_rates(struct clk_hw *hw,
+					  struct clk_rate_request *req,
+					  bool (*check_rate)(struct clk_core *, unsigned long))
+{
+	unsigned long rate;
+
+	for (int i = 0; i < BIT(CLK_DUMMY_DIV_WIDTH + 1); i++) {
+		rate = divider_recalc_rate(hw, req->best_parent_rate, i, NULL,
+					   CLK_DIVIDER_ROUND_CLOSEST,
+					   CLK_DUMMY_DIV_WIDTH);
+		if (check_rate(req->core, rate))
+			return true;
+	}
+
+	return false;
+}
+
 static const struct clk_ops clk_dummy_div_ops = {
 	.recalc_rate = clk_dummy_div_recalc_rate,
 	.determine_rate = clk_dummy_div_determine_rate,
 	.set_rate = clk_dummy_div_set_rate,
+	.negotiate_rates = clk_dummy_div_negotiate_rates,
 };
 
 struct clk_dummy_gate {

-- 
2.51.0

