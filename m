Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9D82C08BC
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 21:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752183959; cv=none; b=b0iEW6R4tV8ihTKLZjQUZzIIl0NwhXvUrzYzOC57FbeCJEzcvtaVq9yro7ss2tl6XZbzCPpv5C55UyYStxXG5A0IVaTF6R2N1EgfVYG7YYXtnV5UG9ewD+t1yZJCsUehdLtGRjABqzvScCf7A6JRyy3Dxzzn8bjtmIndKDG6r3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752183959; c=relaxed/simple;
	bh=KPpqxrbRKKtVjqm1nuEddEThifN10snLNmWpwUh/Uvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d2O65HlxEbeY7f47fOuIH3txhb4F50RVEUaCRHrAgm5qo3/b6L+JQx4dSfqK8CArt8o4d1ImtrWPymXfALMQtuHL4Ui8XJh6M9Y4BJEuA5707KzBjUiibDXVXAr2PFZdZoiDC9bCOAdyeKFHf3u8WuLzFd5UL0rb7vSh2OVSuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RJPEipA3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RJPEipA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752183957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SiuANl0911cYF+BhoCl7EPbqAqIzSbNjca7mdJo3NkA=;
	b=RJPEipA3pN1jcGJtGuG00OwkaUeg45PO+MC14sYIvfU23zgZzsqht6VQCq1TdzzFa8QWzr
	ZpW74Cu2drLSrfsTWmG96bdmCkVLOG0tDGnW//Z/XPDxw3Or1GW5ZfTXqFmN13tfxxYWNK
	4FYsPyt8Oij0ya/RaJ7HC0LgPMEPtjs=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-HPi6buaiPp2GW0bdqayZ8A-1; Thu, 10 Jul 2025 17:45:55 -0400
X-MC-Unique: HPi6buaiPp2GW0bdqayZ8A-1
X-Mimecast-MFC-AGG-ID: HPi6buaiPp2GW0bdqayZ8A_1752183955
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40b6a97ccb9so1028314b6e.0
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 14:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752183955; x=1752788755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiuANl0911cYF+BhoCl7EPbqAqIzSbNjca7mdJo3NkA=;
        b=CV5fVIeR9ibDYA7Q5fn7514CmnHuRt+SRO3/KW1CnB4Ko0kK9hd7LAruWgxahOj+8X
         Pw+iM4RBi9c8TzQRdKBZ4A1/9IywNUk2R6yf3mJdFuSKnLXy8BQXAk6SnXeBCs5SU2+4
         V0UmISuK7eRKj6MEZeYO4O8a7OdaZcBeYQ1mpmVkL1eGg5JUFXimzkwD3NXRr11LDPan
         PIEeBp0D/no9qDdZ7v3FWAr3JgMX7URhCnIwUEnhGiK3kV5TDWIgVr16n5EzOdO1425h
         w0/LXX1MwUDaAkMclsf9V1M2STASjYLZGsA4XmiGP+V5FATgie9fB4YAbF1cKvAV0Wlq
         zY6g==
X-Gm-Message-State: AOJu0YyLNzx+jLNvrqL3VKuBrgC5t5kMtCTSVjJllYZApFViasNfXA+k
	10RZZ0AfKamq8L3tNLvb/FZSpETdfoE4zcHrJhelGXXL+Nx4pBFO/VdH8zcoNNYNibBZtovooIl
	f4P2IFyq/cADmphreFyS9PNIPhrVU1Hcgd0CK1w8KOB6owIF4A3sgbWPFBMHOdw==
X-Gm-Gg: ASbGnctpezawOTP4cT0c93DDmP+EUUiNz4+zwf8MrFVV+6C198iIQr3PwQznjQTZL4e
	DXLUFZ0LicnSChbvRoWkMeedDWwsr008hmiUredO5SVgQKeuRO4wovoD3PqOSrFoNtjpsWc3caa
	X79UUgTIxknhzTi4JXWsc5Kc33hqmPN8HRZI8usV5QyaegOLecAD9A0gLsLUX+4S5h3yJxr4zrz
	KimCFWQIvwEkDODowkcBdocTKL3PIrpPh0jktSdB7PDikH1kpKC9ZaDzSQJXd05G4g41XgmHfOE
	62b9pXrjKzrNVl0bFH8birJXSAKOkBixJ1SG8ayZvyGF
X-Received: by 2002:a05:6808:4fe3:b0:407:77e9:a104 with SMTP id 5614622812f47-4151017fdabmr894464b6e.17.1752183954849;
        Thu, 10 Jul 2025 14:45:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsgW24lNzV6jS3iGpzMSHW5KHXnsxCI6LXpGqmrnkTpsx3BaTOZsXCDQI+JDSCYr9GcAZDTA==
X-Received: by 2002:a05:6808:4fe3:b0:407:77e9:a104 with SMTP id 5614622812f47-4151017fdabmr894442b6e.17.1752183954370;
        Thu, 10 Jul 2025 14:45:54 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:8102:a87a:c1c4:9ad5:f0c:c0f7])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41419baa00dsm345483b6e.22.2025.07.10.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:45:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:45:16 -0400
Subject: [PATCH 4/6] clk: tegra: pll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-clk-tegra-round-rate-v1-4-e48ac3df4279@redhat.com>
References: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
In-Reply-To: <20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752183937; l=5341;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=KPpqxrbRKKtVjqm1nuEddEThifN10snLNmWpwUh/Uvs=;
 b=yzOoQ3uzLNxqoYnFziSeszgFxpPsWTe7tkm4m/HTchEdsPmjZ3XQkmqaNSIzmmbMQ6U1VsYAE
 f/NUcfe/LUbCUPqAKhArpAtwhdj4Q5kmOsH0mNm09fzJyqbuwWp2H3P
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/tegra/clk-pll.c | 52 +++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 100b5d9b7e26e906f71963152ad50bd0a89d14d6..591b9f0c155a033ab46fbb0a1de742efed560b5c 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -840,8 +840,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
@@ -849,15 +849,20 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (pll->params->flags & TEGRA_PLL_FIXED) {
 		/* PLLM/MB are used for memory; we do not change rate */
 		if (pll->params->flags & (TEGRA_PLLM | TEGRA_PLLMB))
-			return clk_hw_get_rate(hw);
-		return pll->params->fixed_rate;
+			req->rate = clk_hw_get_rate(hw);
+		else
+			req->rate = pll->params->fixed_rate;
+
+		return 0;
 	}
 
-	if (_get_table_rate(hw, &cfg, rate, *prate) &&
-	    pll->params->calc_rate(hw, &cfg, rate, *prate))
+	if (_get_table_rate(hw, &cfg, req->rate, req->best_parent_rate) &&
+	    pll->params->calc_rate(hw, &cfg, req->rate, req->best_parent_rate))
 		return -EINVAL;
 
-	return cfg.output_rate;
+	req->rate = cfg.output_rate;
+
+	return 0;
 }
 
 static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
@@ -1057,7 +1062,7 @@ const struct clk_ops tegra_clk_pll_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 	.restore_context = tegra_clk_pll_restore_context,
 };
@@ -1195,7 +1200,7 @@ static const struct clk_ops tegra_clk_pllu_ops = {
 	.enable = clk_pllu_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate = clk_pll_set_rate,
 };
 
@@ -1353,15 +1358,15 @@ static int clk_pllxc_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
-static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_pll_ramp_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 	struct tegra_clk_pll_freq_table cfg;
 	int ret, p_div;
-	u64 output_rate = *prate;
+	u64 output_rate = req->best_parent_rate;
 
-	ret = _pll_ramp_calc_pll(hw, &cfg, rate, *prate);
+	ret = _pll_ramp_calc_pll(hw, &cfg, req->rate, req->best_parent_rate);
 	if (ret < 0)
 		return ret;
 
@@ -1375,7 +1380,9 @@ static long clk_pll_ramp_round_rate(struct clk_hw *hw, unsigned long rate,
 	output_rate *= cfg.n;
 	do_div(output_rate, cfg.m * p_div);
 
-	return output_rate;
+	req->rate = output_rate;
+
+	return 0;
 }
 
 static void _pllcx_strobe(struct tegra_clk_pll *pll)
@@ -1598,12 +1605,15 @@ static unsigned long clk_pllre_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_pllre_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllre_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
 
-	return _pllre_calc_rate(pll, NULL, rate, *prate);
+	req->rate = _pllre_calc_rate(pll, NULL, req->rate,
+				     req->best_parent_rate);
+
+	return 0;
 }
 
 static int clk_plle_tegra114_enable(struct clk_hw *hw)
@@ -2003,7 +2013,7 @@ static const struct clk_ops tegra_clk_pllxc_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllxc_set_rate,
 };
 
@@ -2012,7 +2022,7 @@ static const struct clk_ops tegra_clk_pllc_ops = {
 	.enable = clk_pllc_enable,
 	.disable = clk_pllc_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllc_set_rate,
 };
 
@@ -2021,7 +2031,7 @@ static const struct clk_ops tegra_clk_pllre_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pllre_recalc_rate,
-	.round_rate = clk_pllre_round_rate,
+	.determine_rate = clk_pllre_determine_rate,
 	.set_rate = clk_pllre_set_rate,
 };
 
@@ -2321,7 +2331,7 @@ static const struct clk_ops tegra_clk_pllss_ops = {
 	.enable = clk_pll_enable,
 	.disable = clk_pll_disable,
 	.recalc_rate = clk_pll_recalc_rate,
-	.round_rate = clk_pll_ramp_round_rate,
+	.determine_rate = clk_pll_ramp_determine_rate,
 	.set_rate = clk_pllxc_set_rate,
 	.restore_context = tegra_clk_pll_restore_context,
 };

-- 
2.50.0

