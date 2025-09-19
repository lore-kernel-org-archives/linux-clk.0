Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ADE2F60AC
	for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275965; cv=none; b=cVbVlPG+nTQIW3Cpqjj40BBaU4zh0+pUHISab6T+s9vxH0Oq1S2l83lEoD30e3o6PHex2u/Fj8QXuxf8Q/u9cnqEWl1/zr97RijdH2V0GKjux0S3TdCCgFPJTHANOU9M37fhxlQzl6KyOlU+CFPMr6DY4PSQoylk8CTCQNHqDyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275965; c=relaxed/simple;
	bh=vbP03XlE1h7xnXHsE6YxSmU4t7foc5GMAXHOnth1Kak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onIZaMjFUaMZJ/QVSEbh8rD5aVlww0XDRegzklBjwR/tZdpAx6s/9+g3vvIqYuHdJo6uVTbSYwxj+naC0PIygQ1UR5TDx7rXPnOjs4QhFsEYo4Chso28Czla5bKwR9CFuQ8/scjev3osNJPDgD1h+R4vzHDUW0+YJMlT7vN3ICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ljLPR3hH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ljLPR3hH"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso603096a12.0
        for <linux-clk@vger.kernel.org>; Fri, 19 Sep 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275960; x=1758880760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRCjBM+UZmtDkzaHBLv8yNwvYcdqAmpzBt7Gyq2DkH8=;
        b=ljLPR3hHzSJXcJkUGL+iM62KIUPeW37CxYkOshGTYxeCiUOHiN9PY2r0PrSwCj1cUh
         BAphtPA3BKJcN6atFC39OCHXAjVU29ubGTvrG87/BziM4hAMHrlCqcjInisWvVR2XwL5
         yqHi0sEgurQ89N8rRfSrF9T2VEYRNiKIWw0seIcrQbMl5zg2/BhOyFlpNbzPKl9kDTzv
         6R60C2qXmWR5QJsOsuWeJ+m5Iw6koacaRCu31tM4HDPCZM+hGze3B2ABpoXIFfpf0OGT
         l22Kyrh1XkJP4oY9XUbVC/gX+m0dYMwqOvj7e5Mtns9wpwHwyg/Mf0KmMlUcANqq2apD
         I/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275960; x=1758880760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRCjBM+UZmtDkzaHBLv8yNwvYcdqAmpzBt7Gyq2DkH8=;
        b=Hqy9LhKQh1sqAVu3iEixVV4Or4tvkH4NdeiIdgIFtQFh25Xc9zhE/itqSOQF0/xUOy
         EUpvdCd3JfVRgW1plBAR0kQn0WUFySkihWVNALmQ/yAhCFWBlH6hPt5gdA/vxUH8MEhG
         sdArqsNl0qEtPZBeXumeuZ+WPtQIu4HpkjLZpUhwqjtmnffGpcM1Ew3EQUtcOw8yT05c
         UpEvmjnhReAj7DYm8R9Kv1Yx7bq6906J/4LLuyLFAR669jncD48C9fFwQ8gNB7ZfXdq9
         lJParUAGmbakyN7f2B/BFhzCvTAKiEWWfNPAVORTMFRtY/lW2qbi0ldqaTzsTI6bJ4aD
         l5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWhBGheJ5uTB1X41Bu8rUFZsUmNzVEgOT7EDtxdIxkE5ojiSvoiVmzGQksbk6AzlT+HLTU7gSxnMhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6aTRX67V37oy4v6kLNfvhqwbpwDJfV4uV6wywjtVJE0E8VeNN
	TMEK8hdrqOb3D8EjtHY/JQjulMpmzmWwle+cL+DiV59dwS4Pfld5iY3BqK6EY4AY90I=
X-Gm-Gg: ASbGncvrCkAAFAch20l2tl/akj7brXAFE2TU2JYmkKzkR0PY03iqy356HAs+NGkJEeH
	IOIywV2dEloBOmopZpf9P5hSmeKiFrADJDBF7a4Rg2uwmVhcQvokDpYrdPZihXLjytRf5WDJvQ4
	sUFthNZCpAoUXKTbtlUYWdiDKJbOIy0Gm9yGJ2hw6cylco2NE1Lq58x99CcbuPvx/7Gy6Dl2POS
	wuEH38d0x66qBXb/oqmTBTv/F1GDYBTMcr//UWKIQvoa+Lsqm/rqzUIabclKEgYE0Ap8XQ9ZRuk
	Idg6QN30A6ri4t/779YQpmfHndgmNZw7kL8wWzlf25+Dc00KVgOPWLE3kXMeYdg3WqHRDvtEKFV
	4sj3QQyCQ3t0bouyp379ffdqfIioy+6YdP6d41wq7zrX5TqgsxUlYzKke2Vb4DZkB7eiueQ==
X-Google-Smtp-Source: AGHT+IFgmVd41y35n12dNNDHlT8B0lvOLEpxp28IQxQRb5l7rrryU13J2m4N5veYjKoNAlTvU8u3FA==
X-Received: by 2002:a05:6402:20cd:b0:62f:a06a:5359 with SMTP id 4fb4d7f45d1cf-62fbe458ab3mr2516436a12.11.1758275959599;
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:24 +0200
Subject: [PATCH 2/3] clk: qcom: dispcc-sm6350: Add MDSS_CORE & MDSS_RSCC
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-2-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=1177;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=vbP03XlE1h7xnXHsE6YxSmU4t7foc5GMAXHOnth1Kak=;
 b=oKNSfmdNf301nQfc/PDdXbR7+ZlQdp0XSLyKqYLiOBuBW9hrNj940/clNKq7jd1x61ljxPbO4
 4Zuv5gmqejyAEbeikZjWbZe8LVq/5JdMsfAnMcmLjFGp5mtmJrE06iX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the offsets for two resets inside the dispcc on SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/dispcc-sm6350.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index b0bd163a449ccd2b27751e32eb17a982facf07d8..5b1d8f86515f251d90e01a4f3cb3b5582b5db683 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -679,6 +679,11 @@ static struct clk_branch disp_cc_xo_clk = {
 	},
 };
 
+static const struct qcom_reset_map disp_cc_sm6350_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x1000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0x2000 },
+};
+
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x1004,
 	.en_rest_wait_val = 0x2,
@@ -746,6 +751,8 @@ static const struct qcom_cc_desc disp_cc_sm6350_desc = {
 	.num_clks = ARRAY_SIZE(disp_cc_sm6350_clocks),
 	.gdscs = disp_cc_sm6350_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sm6350_gdscs),
+	.resets = disp_cc_sm6350_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sm6350_resets),
 };
 
 static const struct of_device_id disp_cc_sm6350_match_table[] = {

-- 
2.51.0

