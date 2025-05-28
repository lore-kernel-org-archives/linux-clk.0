Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F139223DE9
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474245; cv=none; b=UVdkw2AxWp+JscXE9hNAJBwDWO3iSKccoaRKlffnzm0ZBBejBxf6fHBxTNoCkaDHp5BpVLsPKIgsUPi13x29TXA5VdUQ8dTaJ6CY00R5KynjEWF55pq4YA/NQsJmbbyq/NBUfqVcSM+eLVSa5YBvhIpv91U/85ONYz4X4/YqjIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474245; c=relaxed/simple;
	bh=NMZgKVeLZ9BZ3EE3JsxTf6VRGRDkv/GJpoUMl51QAYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2MgQZn2LVj44UVgHD9GQFQWiGsYAHOIzZXFWX060+UP7BrP9j4JZmSr4hjt2sHgwAD2IV/TylNXouCl+FWYLMaoOJuyXaxAN3IkvLrA6JQVara5cgjsrYzxZ6WqvFJ7LWV3fFZDKWOtFLB1vtREcKg2DFTcIJsaEynmLu0suvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g7xVV7pU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g7xVV7pU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29v6CJsABJh/4ImLVM3b21hkbzQBqCF7iCRKt/uRkcY=;
	b=g7xVV7pUW1PhlCAh8peehUKPssMSYdu9Oi3NTwauJg5cp8C9yUPsdAwnH87YEydrAVnlcn
	geIURtxfYOJ0Wwd4bdVal/FrruuyKiqk5Oo1QSlgnkxLCk6a93ccaUjSCY5ZXRM6rvjz53
	K3xmqlHZQHJQAPRHBJ/dJ72d58TpHrs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-AoFOOsbOMB6kDIXHvhrl-g-1; Wed, 28 May 2025 19:17:20 -0400
X-MC-Unique: AoFOOsbOMB6kDIXHvhrl-g-1
X-Mimecast-MFC-AGG-ID: AoFOOsbOMB6kDIXHvhrl-g_1748474238
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so55143285a.3
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474238; x=1749079038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29v6CJsABJh/4ImLVM3b21hkbzQBqCF7iCRKt/uRkcY=;
        b=BRK7sq6bE76871cZt4EQvYbcsPa+0BmgZHwxWEtSgbVNcLE4V0HKHwh997DwlQl0k5
         uMt95xLzSZu/B8ETSKQQj1om0ASuQv/Mc7ZaHnxJBHRjz5r2IIWKccystnkcbE8bTZkF
         YSipSaE7wb/uXAbompMvG6A0K4nNV351QDdZ6RQAAnOPYkWBKRKdu+kr+qUhI1D8BnHO
         G/iI9hbKImRcBfg6pcAV9kHb5Un10ZPDPQiDOFsjjKJExCt2EBBxkbvhsNJWyI1FdPKz
         xtaJ5H0lMj3l6FHUoEZfRsYhFlrWgBi97P/oojXcIu0CGqU4XYwVQyFN2RUvL4VbGCtY
         c88w==
X-Gm-Message-State: AOJu0YyoSrPVeIqMIauyh//uWUv1k4HJD1TCL/XJ+nTvag9/ZYgQi8UF
	sOcmXy6LeyAq+8V5fjpMbLSbeOuVwDuLXAG5eIOuu3dxuTpAPH1VK8EhQR6cq8R9zxG2RlMAX51
	0JUL+W+stsmuptzkSJZx0kwTx2MSMupAAKGGAdMPaSWr2dXXEAjR94ma6QmIEPQ==
X-Gm-Gg: ASbGncuUYskxz5LuNWRXs+yB+DpL/wD1P/pjg74PPbrYDtKHGQ8zO/GZSCt9O3fhw6m
	zoo+ZwzBDEBlgFn7AmueM8uwnUTzJR564H9jSBRBB05fRU1mUxm582QU+bC6lJvkpLRRth8Keh8
	bFwYNsIDK9O2cpv95z+CJesE8lf049pYh/c6o6YobmLBakIKGX3hmcYuhMUVHeHxtpz9rhdRcFB
	gBXp5oo/MFeFgbSF23oN2brpHGVfcDwIXvH1sjqEPvAKgTJC5MGUCjsjPbqiKk/g936kW7dLWbI
	y9dtOWhJOMLmZQGc8tadEqZRYZdg+PM8qF7uDeWxCljMKiI5FQ==
X-Received: by 2002:a05:620a:414f:b0:7cc:ffaf:60a5 with SMTP id af79cd13be357-7ceecc02cdcmr2551789585a.3.1748474238051;
        Wed, 28 May 2025 16:17:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1t9M4pOfH0S3pZYhTRp4meGn/CJPubd3PS059JGUUzP7kiltXd6n6C+dsbqUaBTsPDyK/bA==
X-Received: by 2002:a05:620a:414f:b0:7cc:ffaf:60a5 with SMTP id af79cd13be357-7ceecc02cdcmr2551786885a.3.1748474237721;
        Wed, 28 May 2025 16:17:17 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:16 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:50 -0400
Subject: [PATCH v2 04/10] clk: test: introduce clk_dummy_div for a mock
 divider
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-4-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=1920;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NMZgKVeLZ9BZ3EE3JsxTf6VRGRDkv/GJpoUMl51QAYU=;
 b=7U3GXBVbw3VpE22HalTtWkfkALmHE40v5SBTBw0dk1ipNXxawmTZsR9pCL6LvFDd6hYFh0Dmf
 f02/OZZLs4VBd0plkjqo/QAKFk+Hf3I9vF4QvoRCRaTlSsczLvHnoGw
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

This is used to mock up a divider in the clk kunit tests.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1b34d54ec9c610ffa3e91b06f5a5180e0395e26f..4908fb9c0c46e34063ecf696e49b48510da44538 100644
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

