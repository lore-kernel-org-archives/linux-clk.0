Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296F2ED163
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009663; cv=none; b=SrW7F1LzyALaB3SZsdm7+7DzF/CRqO1w4Rm78PsSYw9rRgO8bxtAGVaruh59eJxyNLd52M7xRPWpmqt5EmW1jnyTn/C/ONsy3R3JPkmjJbFx34xhyIwKiizbANIMT3vLb+zcO70vGOpvK1JJm4/uT7y+QMPtHi/m7QlwODGTUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009663; c=relaxed/simple;
	bh=sXw8h0lALjsD5VKwkwWy/O2FfwzxhOoSuFOjrsFYzhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y0F0FQLvaZnZMIaPk2jJZJowuSsIwjyYD2aiuKSXH5zxApDE0BJgt4oLZKh6jDerZm/v1dLiWVneo1rOOakjC7kdYA2NsFbq33TGCl99nmvNidGAQSfuhsOqtI40rhvJtBQeuieZ+yiObTA2cbfypuBXFjLWM3+UPhvK35LypeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvnQTDYA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvnQTDYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755009661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1Rzrz4pTd6XDm1us2+sKdj8djgo5S2Rno1TtobaTIk=;
	b=YvnQTDYAiG6GKZETtpe0AXfr2bLyntg0IsJTDPp0XL/0s0A53Sq1zDTeJ4RoEX4JN6zOvA
	NSSCrwKKepk0TgrXdQzv+rKTUfVgb99RzCGOVe4/ddVTVI3jEF78EBfGOFfCkCxwRcdg/x
	rsSyd1WkKZ6QEuCgiHbymj5wzdhnNhk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-C5avsqe3Oqy02-90dMpvCg-1; Tue, 12 Aug 2025 10:40:59 -0400
X-MC-Unique: C5avsqe3Oqy02-90dMpvCg-1
X-Mimecast-MFC-AGG-ID: C5avsqe3Oqy02-90dMpvCg_1755009659
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-478f78ff9beso200558531cf.1
        for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 07:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755009659; x=1755614459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1Rzrz4pTd6XDm1us2+sKdj8djgo5S2Rno1TtobaTIk=;
        b=FbJYTzc4Le8M55+XVMACjW5TgaQQqFV3VLJU8rbSLKZvVSHfdcTgRTXP/fNHzevWsE
         69he4gGNZRhnjJldR0vBUFkrVtluZ3Jubw0xZqXaeqDK1JXb9XoSNfMOaPU0qiidMtNz
         MppA6EG0nYdrmiVL3cJqLL806ydyxL++DVswCx+ZeaI7EUKuyYicOPLay5oB9a8ZzZ+z
         yxXwBt7eX6h+8R0Rj0bz1c7nZqCuSr03p7yeBEthbLuGtDKe94nnmbwiwiLZvd7LGGl+
         4k2UrerSyHVnAsbn/FlLvCp1IPgKkpR6YIc5n8ofrHil4mseji7pz35CF+x03Kbce4EJ
         eI3Q==
X-Gm-Message-State: AOJu0Yyms5q7A7ZP+AZoLSGsIPMPKKX9BCYazXZNaX9sePpreHxnF6tS
	ieJH01w8Id2mW0sTw+Ab3bsRKj0shZXkv8Aqzyz4nDiwvv5Kuibb3PypHMY6siYyhhHhmrOO7vr
	vbmPR2dlR4THCaJ6Gakh1I7ygmojeWz3nlmUDC4pIkxv1gD3XDrJhGUiYbnITaA==
X-Gm-Gg: ASbGnct1hqcaeDnIfZtDm1VUB/Ptz/p4BPr7JfrP0c+c8rcPjFYk9R2qdHGydQl22DQ
	tGNFpxpHEwPia4bEJz6pR96kFBodViQ8YkK8AfAMSFZVsnEDvv2yB/MTlMO+XNLMxSXCJFWDuFV
	FwZ/PK9fxX2whlNBjs6d0yD9EMuPIWZVNC+wSjkRthwTvkFee9UKe5iBRJIhfOnscuQ4wuFWfVO
	c/a9ptQ8pYrfkH3CC9Mx6cuBERWl+KCs63YVCU+kJ6DK/nZATCSJFk4B9J8gUbVoozCN51FoUYi
	cKrhdaeraz3BrWn5feotSy0+nhjLs6LBLBvqwRdA75uXJQJ+Bp6e3Odu6QhqHWI8RwoTiYYtXK8
	9Ig==
X-Received: by 2002:ac8:5a50:0:b0:4b0:658e:bd88 with SMTP id d75a77b69052e-4b0ecba2f11mr64091371cf.7.1755009659222;
        Tue, 12 Aug 2025 07:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFyDPYRrKn9oCmhsWvHECMNxAjJDrMvLAlZG03rhl03ybjGnMZl+gPzAxGBHO4A/Oa0MKNJw==
X-Received: by 2002:ac8:5a50:0:b0:4b0:658e:bd88 with SMTP id d75a77b69052e-4b0ecba2f11mr64090861cf.7.1755009658805;
        Tue, 12 Aug 2025 07:40:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm76186821cf.8.2025.08.12.07.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 07:40:56 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 12 Aug 2025 10:40:33 -0400
Subject: [PATCH v3 3/9] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-clk-tests-docs-v3-3-054aed58dcd3@redhat.com>
References: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
In-Reply-To: <20250812-clk-tests-docs-v3-0-054aed58dcd3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755009649; l=1985;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=sXw8h0lALjsD5VKwkwWy/O2FfwzxhOoSuFOjrsFYzhQ=;
 b=gACoo/bgoeAjMP5T4HlHRzvTtPX3bFCCeOj+ESgvfN4r2olnMmu6i0I/No579AFXVqJEsZ8jj
 ULumme+QsH6Dn0S/m70MzjIRjTxzoowfL91FY3Dq6nHPbvp1GgpPOtJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index fafa736ca32144a2feae75a8d641abca3162d42d..61668fcd7203c4cef9f22b8c0c5bb5a50d331f53 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -137,6 +137,48 @@ static const struct clk_ops clk_dummy_single_parent_ops = {
 	.get_parent = clk_dummy_single_get_parent,
 };
 
+// 4 ought to be enough for anybody
+#define CLK_DUMMY_DIV_WIDTH 4
+#define CLK_DUMMY_DIV_FLAGS (CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST)
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
+				   CLK_DUMMY_DIV_FLAGS, CLK_DUMMY_DIV_WIDTH);
+}
+
+static long clk_dummy_div_round_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long *parent_rate)
+{
+	return divider_round_rate(hw, rate, parent_rate, NULL,
+				  CLK_DUMMY_DIV_WIDTH, CLK_DUMMY_DIV_FLAGS);
+}
+
+static int clk_dummy_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long parent_rate)
+{
+	struct clk_dummy_div *div = container_of(hw, struct clk_dummy_div, hw);
+
+	div->div = divider_get_val(rate, parent_rate, NULL, CLK_DUMMY_DIV_WIDTH,
+				   CLK_DUMMY_DIV_FLAGS);
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
2.50.1

