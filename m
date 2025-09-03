Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF30225A59
	for <linux-clk@vger.kernel.org>; Wed,  3 Sep 2025 15:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756912534; cv=none; b=hyBsChWI7Dtat0PYKU8atchprUF8Ddidd3Ser/boTO5fUr+7yamDVCBH8Ud0Xc15ZT5m9uIWw+CNGB5SRdY/rOhXgnzQb+ADOjMl0HS92nzi/Deu7wSkkAEloXBUlz24dmh27TywZn8WVssfTST7q9O8GzGdXcQjZXKy/I3TxXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756912534; c=relaxed/simple;
	bh=PJVq4/87gTFJLoaD4HfGqwXTByrz5pGbdwRq3T0o3FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXjpislXFKDHHTH5cCNgF8A/AAVczT1rJ0kj4Bp6fNxrSnGpgwPMyMJ0b27fR1MsJuphI7j+LxFTtCOKryZstxdulsD1AbVq8iwX8ez/Plq+vCsfWoxWIx/kZAUJgtMZcGrZdG1LwliBxogKAca+gkG647+KpaUWH0J3VszHPAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNNb6KH2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNNb6KH2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756912531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k0AC2DCErmz+n/xWKWMBVqT/GGNRgWxc5CPFdstVaL8=;
	b=FNNb6KH2Qv6wE+9odQn1WN2b2I+xSm2P76FihSY9Mo/IU+0BbSAZ1UKtaBBiz5HBwVoDRe
	zIlNlXJ2WCqiiRSRkW6905JTrbkw+At5AsUWiZgjBWYruftRfXZ4rSwRz6mB21M5F1m1cR
	fxq5xaYOLBhd55VuZHu5fG1sGes5yn8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-JSnKEFvoMDS1hA6eVYkUqw-1; Wed, 03 Sep 2025 11:15:30 -0400
X-MC-Unique: JSnKEFvoMDS1hA6eVYkUqw-1
X-Mimecast-MFC-AGG-ID: JSnKEFvoMDS1hA6eVYkUqw_1756912530
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72048b6e864so22663936d6.3
        for <linux-clk@vger.kernel.org>; Wed, 03 Sep 2025 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756912530; x=1757517330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0AC2DCErmz+n/xWKWMBVqT/GGNRgWxc5CPFdstVaL8=;
        b=nxq6lcgda9ROD2LbJa3sX/PU8CIw1iuY5fwWnRl0wIN8HOEU3WkzGWg40CbVhZyODx
         Wo+KbAfxOZqAL18zhCOivd/kGb21yup4VyMogR+lbQBBcN/K+8AIiptk5ono1G2TQQJj
         RPZ2gqOWQXkuV3jW2DvXtIL2s9KClLFo63KIOY2y5WXuLf5tJtfPrf14QRAAN930K/y6
         YSYy70RK+0t975uypkfqkTYM+dUB8VyTTGrPLCujq0XIUriQBc1LgSrimP+Ac4zu7ndJ
         oxmGfdQEFeBAf1KaUErri4M/HD2aFE+Hali96CwFHOaVb/XGAp4MwclvHWP2+AC+Vvdi
         9Srg==
X-Gm-Message-State: AOJu0YyVLwgaTK6hrBSHOmGp1UTAkL1qPT0qJ+oNvV3eeG3RLqzVyIiW
	8AATewTCzDI6CBF6nTbaPVWpFht0fHRbSRvmf1bQVGBf+OPpRXocL3rb2q8q+dvfwdbuT2n1TLu
	Ts9EZbdl+4Y+r14eoXuK0EPt+y5PNXvIH3eC8KS6CiqVCU7mAfIkVZqGG+86Akg==
X-Gm-Gg: ASbGncvYhUZ3YGfyGahoN0RBLkAYC2Vxbdui9zshgqCAcWu2DeSRMeE2uQA0QRhX/Gi
	UacV5ThbdvQCT3mHHTBq6D0I4GeEMmV7AYvw8VJow768OUvH/Z1YPlWia22P0AfCRx9z3b62Kt0
	zPTN9PQ+h/BmOzbt6mWw/AYQVa25kL2za2T4f1UG89Di0cwLHAllgOdzb72IJx1lFZnbBn/exk8
	BeXpF3pITuELCTYetW3Q1/kB7HaqUTR1tFNT2Haozvp4kvZ8SMyMYni/hv3eD8Lb55iTmEo133g
	rIAZWNUgwWbuslT6t6t0tA57VFbzp9tt4qhwekPWCgoaXZSig2MG3KA748X8P37ZpapXxjvv4f0
	=
X-Received: by 2002:a0c:f083:0:20b0:726:97c8:a6b1 with SMTP id 6a1803df08f44-72697c8a854mr18870796d6.54.1756912529844;
        Wed, 03 Sep 2025 08:15:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED8E16uAVeM+5vJ137ALVYC0Wh9vbBPAcITc26atyl6FkjgZTLRJMpDAJJZtvLcuHhPJ8whg==
X-Received: by 2002:a0c:f083:0:20b0:726:97c8:a6b1 with SMTP id 6a1803df08f44-72697c8a854mr18870126d6.54.1756912529305;
        Wed, 03 Sep 2025 08:15:29 -0700 (PDT)
Received: from [10.12.114.224] ([2600:382:850c:786a:ff8e:13a:e47c:3472])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de16sm30827706d6.3.2025.09.03.08.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 08:15:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 03 Sep 2025 11:15:03 -0400
Subject: [PATCH v2 2/6] clk: tegra: divider: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-clk-tegra-round-rate-v2-v2-2-3126d321d4e4@redhat.com>
References: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
In-Reply-To: <20250903-clk-tegra-round-rate-v2-v2-0-3126d321d4e4@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756912523; l=2145;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=PJVq4/87gTFJLoaD4HfGqwXTByrz5pGbdwRq3T0o3FM=;
 b=j1kIFJz9wqZzE3zyvQjx9E1DS9XfHi59LnAkJFgAkMN4jfnDPzUCTDEe/f0U42GNwYY8e/rpk
 4odgRZo7fFfA9qPfKqfNveGuLPoi7WmNRviBXe3OJ7PGswYotuYAW0k
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Link: https://lore.kernel.org/r/20250710-clk-tegra-round-rate-v1-2-e48ac3df4279@redhat.com
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-divider.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 38daf483ddf171293666cea25179a9c8809d8c3f..37439fcb3ac0dd9ff672a9e9339ed6d5429dabaf 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -58,23 +58,31 @@ static unsigned long clk_frac_div_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_frac_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *prate)
+static int clk_frac_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
 	int div, mul;
-	unsigned long output_rate = *prate;
+	unsigned long output_rate = req->best_parent_rate;
 
-	if (!rate)
-		return output_rate;
+	if (!req->rate) {
+		req->rate = output_rate;
 
-	div = get_div(divider, rate, output_rate);
-	if (div < 0)
-		return *prate;
+		return 0;
+	}
+
+	div = get_div(divider, req->rate, output_rate);
+	if (div < 0) {
+		req->rate = req->best_parent_rate;
+
+		return 0;
+	}
 
 	mul = get_mul(divider);
 
-	return DIV_ROUND_UP(output_rate * mul, div + mul);
+	req->rate = DIV_ROUND_UP(output_rate * mul, div + mul);
+
+	return 0;
 }
 
 static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -127,7 +135,7 @@ static void clk_divider_restore_context(struct clk_hw *hw)
 const struct clk_ops tegra_clk_frac_div_ops = {
 	.recalc_rate = clk_frac_div_recalc_rate,
 	.set_rate = clk_frac_div_set_rate,
-	.round_rate = clk_frac_div_round_rate,
+	.determine_rate = clk_frac_div_determine_rate,
 	.restore_context = clk_divider_restore_context,
 };
 

-- 
2.50.1

