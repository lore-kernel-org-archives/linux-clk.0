Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FDE34F462
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 18:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761070192; cv=none; b=FLBgysCR1JKwZhy+qP2iD1zM1DQipfWJTwJBkZseEFk4s52UITScbJeB2z+zPqN2mXV3tFFwflykaAVLPNh7qdA6um+aOSTw3KMM7XBvoQWhLYa/xvu7/c0FDC+AXVeAnR6HZhTPRTaisZ+SUYiV/fi3S3RGJ2Bw/oVzgDWVRO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761070192; c=relaxed/simple;
	bh=ZGXcHkmbv56726TD7p8UHQeGT1lZPP7DN45mrJa7mZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VK7/kxMK0oV8nRMVkExoq1j0hPa3j+DzYTzpMRH67YRxs177n5YxUVu3BFUS5Fv2zdfj8jczYNS6ot+Rg5TUwoaX/Is6I6ldm4/9x49GJw3airbNXFfUDTrZQWCmmUTExJS+HxXj6cIq+0WwgmwSMHYjPJksp3nI8w3oPh5LCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OcBXuJSM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OcBXuJSM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d2ef066c7so2384366b.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1761070189; x=1761674989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YfaUIno/O6RD7wQ5yEegdmcS8V7ZlB/+cNbw2kl/R4=;
        b=OcBXuJSMqpr8xn1UgL2kwTzT1/KDvwgTWuHKSY/rCOLVJjv2lImhtHrSG6WA1f4d6o
         HjFqBFw3FsXE28cK3PGoK8bPhGuGTNupn+rNmIp7ACGVmJ+nb+r8kJ4sQLHiG5lMHc89
         13GvZlgUF2Yiy/9xXABoiredxFIDzzqCtcOtjyKMiFdhpI4waDxEadThwmrRqXQq0nJV
         BncgXf92rVUN4Fe/Z7+a1nBTOeKe5Uz9g3ZKSwTqx4cjjzBWz8WxuvCntGPRVgwn9Ivc
         UhKfIGrczs21z9MDVznfHQcV+seJhx0IJQtDoMBz98uObeQs+l6mzgHu7doONAANxo2z
         hWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761070189; x=1761674989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YfaUIno/O6RD7wQ5yEegdmcS8V7ZlB/+cNbw2kl/R4=;
        b=XntAssgFXzBnLeuNAfk0+7KhzuljAeP8VtKAOwKDQ4SzCGtRH6gbMC3Abr1vFDlz3m
         XdvdS3wt6DfWD8dh/ih78RXI/e85gYhsZog6jFg9XXNmX/0XMbycJKMQU+bAlIe17TtN
         4iK9DUA3mg184affgYA5/ne504CcELirm5v/5rs7b3++EY3VzB+YKksX2Nt1SoSuo+ms
         SK+pQuI/Jxn3wE5F8JV+lAypOlNre5iGfMMEI7dyzsbPpvAixNk47t6fxigNpO912xO5
         IvPZNnSOA82yNijCpoWMbJvc4XI9hTMRpAjhbgVIO/xZYb4hWaVKvxaCFuuwxLQ4KHX3
         nSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbqIaGABoxMakEpKw+qVUVVKW4HQwlzku6hsZ7SwoK35jnGlB35fYV8+VPGtXAgTNiD3sF118EJqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiS0lG3EGiqn8lSLUZQ/R2/rh/0xAAofTS9DO7xCY4eNSD9Rxm
	KI6PCQxHPKRh7QkLzN6AkVBkn6TfIo1HQcn85xfgPTkx9AWJGU+nqPUKD0VQk10ucKk=
X-Gm-Gg: ASbGncvO6RKbMtYA6KCcxA33TK/hJ6mm+xzsHNMP8DrmDAJc8mp9pGK9QXjiU5BzTeM
	9W835XCa4OPar1ePJb9T8OMI0I9Ym6b55arpjfqs1xq5PaDqBdz1CDj4Cn6yt5M0pKijTozMS2f
	0AbRJP4WfhTWAUsNjWMAEoUWSjaMd5SGHiC2wNUUKHkEIE0lD+omLwpcX1fw6s8BPG5w6gMlFiu
	X6MjuED8u3ZLAxOpRhZXWPOj0JKzO01NgKtOTVuLpQnIJm68JEhBHDjp+L8HSSQcYhroVtnxwH6
	+ljO2KA1pZ9Nw3pn25pjkYT0Yw4rwIVLNNLAONPWOqx3LSE/r4PrANQbEy5yN/XmsFq/lq5S1GO
	LCE7Iv0dse018psje42Q74jPW/PEGsG+oJYBs51KwtSNO01TG4Co69x3zr0E9DGmS0vsx9ZQVV0
	RUaLLU2zeaS1v1Hs3ZsQ==
X-Google-Smtp-Source: AGHT+IH0GvSCHSJ20rzTQIYXRIwE1CXZMXwC+rc2yBk+UDlF2kTkV8GiuD1hoeoFg1MLq44vUKK9vw==
X-Received: by 2002:a17:907:3e95:b0:b3e:e16a:8cdb with SMTP id a640c23a62f3a-b6472d5bb74mr2145989666b.12.1761070188807;
        Tue, 21 Oct 2025 11:09:48 -0700 (PDT)
Received: from otso.local ([213.208.157.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8393778sm1116758166b.24.2025.10.21.11.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 11:09:48 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 21 Oct 2025 20:08:54 +0200
Subject: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@jiaxyga.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761070183; l=1397;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZGXcHkmbv56726TD7p8UHQeGT1lZPP7DN45mrJa7mZg=;
 b=UzHql+ztd4+bmvd4/QcSLSyY9exbAqVYLuqxHcofhDRwOY1qW3O6zhiRfnGAwZqLYAQZfD8eu
 vuR4eKcKjnKC0i4M+G1CukRWENcz3btSloxO6iim5OpczIPdnaBQV3p
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
parameters that are provided in the vendor driver. Instead the upstream
configuration should provide the final user_ctl value that is written to
the USER_CTL register.

Fix the config so that the PLL is configured correctly, and fixes
CAMCC_MCLK* being stuck off.

Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-sm6350.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index 8aac97d29ce3..87806392a59d 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -145,15 +145,11 @@ static struct clk_alpha_pll_postdiv camcc_pll1_out_even = {
 static const struct alpha_pll_config camcc_pll2_config = {
 	.l = 0x64,
 	.alpha = 0x0,
-	.post_div_val = 0x3 << 8,
-	.post_div_mask = 0x3 << 8,
-	.aux_output_mask = BIT(1),
-	.main_output_mask = BIT(0),
-	.early_output_mask = BIT(3),
 	.config_ctl_val = 0x20000800,
 	.config_ctl_hi_val = 0x400003d2,
 	.test_ctl_val = 0x04000400,
 	.test_ctl_hi_val = 0x00004000,
+	.user_ctl_val = 0x0000030b,
 };
 
 static struct clk_alpha_pll camcc_pll2 = {

-- 
2.51.1

