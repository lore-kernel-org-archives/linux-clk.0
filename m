Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A1253B51
	for <linux-clk@vger.kernel.org>; Mon,  7 Apr 2025 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031598; cv=none; b=q88ek5ulFbe6c4xpOSycNF99J0GW4/rFgVY1VU5XHnDlbAr4dOWtvOoYggYxODkI64JJnPfNSOBPwPDC4bS8hwX1N4E1h6XHuP/AkwLM1xa98T/7wxKKxmHkNrBnhHpwbYBLxmvBeF2u2DHZSOxfZf2iSoZQ48N9/V4r8s6b1Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031598; c=relaxed/simple;
	bh=wlO2M5Iffb0ZdGXwHjBV+tKDbXC9cX8F+bfsNcUAoXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=d7qiMwo1VhmKvl4GbQgUbM/wk/K4ERoE5+Chml6Fu9tsSHEUlBbN6V3STKPhBbfYtSCijjKACigjZhyUfdVl4v5s3rIUEejoF971u1Lfz8knFC3Q0mB1E76WPcBGbDnt29OjxEofgTioDJzwNt5bIKNfauQF70Ttx3ZZC6g01TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MpsFgg/I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MpsFgg/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SPeRRdg+oYji3tLFW/edfVgnk/6p+M7V8UpTleI7ZF0=;
	b=MpsFgg/I0Rq7YNtyefVH3atlJwdQ9gyWHsxVVK/2WOwLBSap88pi++3IzSGGFyQJSzyepB
	lfODMCOo4FKmWJtbwc5ofsLRcN3fEDu2aKYTNwfVg98GlJBtbgzzpOwz+4tynSU7YoCvND
	DSrj+qr6cF+klYWSmYakmF4cQN9sBOM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-GQYgajz3OG6YHdpSGi3F3w-1; Mon, 07 Apr 2025 09:13:13 -0400
X-MC-Unique: GQYgajz3OG6YHdpSGi3F3w-1
X-Mimecast-MFC-AGG-ID: GQYgajz3OG6YHdpSGi3F3w_1744031593
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e905e89798so59514796d6.3
        for <linux-clk@vger.kernel.org>; Mon, 07 Apr 2025 06:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031593; x=1744636393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPeRRdg+oYji3tLFW/edfVgnk/6p+M7V8UpTleI7ZF0=;
        b=vQUo/6SA+5tocRw5KKjQnq8Z+IIzbhXXHuhx8l06+7QIL74TfwySREdlj/AiLrsQca
         2KRUdFubn7VNYqKjf6j5AmqJarg6heX2B0n0amwyz+L3ojQ1YZixRWAf9dn5H5CV93vH
         Fl3ThT7pJcLjMGYHutFME4sCjD80NsZww+myXEfe8V3tZHFh3S/PqIt9fz/6CyPBAiQg
         qmjFZEcoy00K0JZykwPY7sVyawJ8n3PoGOYREAUfitucMi1ZgAK/uU8i+5CNd93Z596I
         BaIKSix5YMqmqxD9jOXCKRl156mTX63u96HzmR5uuh1dGN7d1nwEM2U1qJUWh259qBu6
         u7JA==
X-Gm-Message-State: AOJu0YzBPN9UIPfrUnVcluzItMmulEfhmxWWY3PYPgIr+SBh9z+5rj1b
	fE9Gr3K52styrBVXnxzU/CUvmW0y7f5qH8CC5TWhckYO4BNR2XTs/iQCNbbbZM97SM0WuoK57Lm
	AadDnnMW5qvcgedqnVAUfKnHsEydBwmeSfTTvGYioyjUpxpCY2oxlfHXg5A==
X-Gm-Gg: ASbGnctbHfCIg0i1CU9qV2/SWLC/hZlrgHvi9zbdxpC0z5q5lu15h8zJDLKlnRLqnja
	7pmd+LDB4jd0oyR7wCjxRG7bc2wV3QgCzBpXHjHuDMKLMIa4ctKt9r9qpvq/wmTGya3fyQ7tDRi
	WVXOQmVqWL8NNlSA+QaVPcVZ93FqnVJcG3kcQoU7TtW//QbOIi7HElVnZraxqUZBehWli1qEYx2
	c8oHVopMI0A0plMQeO3Y3Tw0SstC9fo8iP5WI/NY65NaUJtzYy2EazpURwfkPPuiJYXxdpwmafQ
	KSvl9e8YsH56S33e8VObGL0dlgVLc0KX7ZQ5ooGvlw==
X-Received: by 2002:a05:6214:f27:b0:6ef:eb:a42 with SMTP id 6a1803df08f44-6f0b74f697fmr155461106d6.28.1744031592981;
        Mon, 07 Apr 2025 06:13:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnMH67qk17ML1Xxl6I5rVLhnarS2cRcaURH5/qJHB2dqvoAJCYELgv7syc1xm8QgsFtGxTTA==
X-Received: by 2002:a05:6214:f27:b0:6ef:eb:a42 with SMTP id 6a1803df08f44-6f0b74f697fmr155460846d6.28.1744031592686;
        Mon, 07 Apr 2025 06:13:12 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 2/8] clk: test: introduce clk_dummy_div for a mock divider
Date: Mon,  7 Apr 2025 09:12:52 -0400
Message-ID: <20250407131258.70638-3-bmasney@redhat.com>
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

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1b34d54ec9c6..4908fb9c0c46 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -140,6 +140,47 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+// 4 ought to be enough for anybody
+#define CLK_DUMMY_DIV_WIDTH 4
+
+struct clk_dummy_div {
+	struct clk_hw hw;
+	unsigned int div;
+};
+
+static unsigned long clk_dummy_div_recalc_rate(struct clk_hw *hw,
+					       unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	return divider_recalc_rate(hw, parent_rate, div->div, NULL,
+				   CLK_DIVIDER_ROUND_CLOSEST, CLK_DUMMY_DIV_WIDTH);
+}
+
+static long clk_dummy_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	return divider_round_rate(hw, rate, parent_rate, NULL,
+				  CLK_DUMMY_DIV_WIDTH, CLK_DIVIDER_ROUND_CLOSEST);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DIVIDER_ROUND_CLOSEST);
+
+	return 0;
+}
+
+static const struct clk_ops clk_dummy_div_ops = {
+	.recalc_rate = clk_dummy_div_recalc_rate,
+	.round_rate = clk_dummy_div_round_rate,
+	.set_rate = clk_dummy_div_set_rate,
+};
+
 struct clk_multiple_parent_ctx {
 	struct clk_dummy_context parents_ctx[2];
 	struct clk_hw hw;
-- 
2.49.0

