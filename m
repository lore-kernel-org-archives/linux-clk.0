Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642486;
	b=ag18e169yqXYnd2Pp4dAdIWHh4LCLLoCkpgqS1EPfYV7Vem7+/IkgCvrFGamdbC5jeCU
	 6oziAEYxXNrvPsr94PcBRU3UY28xxJtyRMu7HRjO47+J+4B9yOzav7ZL98oxhD+kFq/hW
	 vwKa1XUOnIdrCKEl97vyCdumaGNkZL5E7S7vnvjxAF9utKTphdd1tWFOu90VCVvSGVPuF
	 NobvjPnboBVfEZ0Ac7akqmhqCi9hYMGjkDO/rUTygOESquKbd6eUHlKwr5tOxueimuWOt
	 wE64McdVNRYoFXHG8vM1OeCtlLxFk1EvgGo9JbfYSUBSqE22mWmf3i8UH3q8TcB6ohA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Lhr7gev5hPDk0ncM2f2gae0ff/kCYaYwyILvj7xGWHw=;
	b=uHieywcP8bKKOa0ji3S360rK7q1TujSKR4gt36K/HqmWVKViAwlvYDv6h4Q3QWZ7lWTn
	 WX6/OwRD1pdYmmpWEoOUaccchdL+FVn3gM4Y/p7tVVjALzOqsrhEnkYzsIaNzLOkyfLSN
	 o3NxVeM6x0MKfkF+QSGGtbOO4sZKFLZ+Pe2joZGZQHalph1HnpA9olByc48m5f9qXYOFb
	 i3nMPFsCV/CirkJd5N9FknKaT53Qk2f5lC5L5HPUFmp14ertDdzbSmS81++a5ZxbbcGhn
	 c6rttW2hIN+LHWq4p8h2ojDc1ffTD8g3amB+FILHpsUo4VBV4WcyRdbxatftuLXgWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=znbBLWmL;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55910606A326
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 21:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55910606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=znbBLWmL
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adf89523d8so6061071fa.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 13:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795642484; x=1796247284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lhr7gev5hPDk0ncM2f2gae0ff/kCYaYwyILvj7xGWHw=;
        b=znbBLWmL5UwJ2joItEH/0zeDn/1KtpzZB9Ji/HVsWqxRyA8GZ7wHAJGBZFpdDVsSXQ
         VF2XePRg2QHi2I3hpo9LX/53IVGZ4Z9abyVIPiW+uMdr0j0JOyk4+lj1S4imLxopCDMY
         NIfFVTfTJFT0f7HxqeF4xG/lfab8rg1QLJ8BtfhLg8/CcfadQ7S9BdKCh0GQeRceHfKH
         1AzMLj61PaQ3QWukuZQkcYfcp0sY6XoIHCIjg0fLU7bJOjrbozbSAIqU/wDKbnIgUAo0
         evNOK4y520ZU/WnkjW9NIwL9YBj68kQVx/Q3DeYcw2DcLLsmxnSkbCuQePqgMN98zArv
         cdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642484; x=1796247284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lhr7gev5hPDk0ncM2f2gae0ff/kCYaYwyILvj7xGWHw=;
        b=pEPWACABUm4/80aADRB8LwH3YodMCuTg5n/0pBXTYitXPHKo1ywmh48MYrte7hzF7+
         5JCbZpjlq+YbMGRSNimv6nz4526UWUaV3b9EUuZZTEEoeXPwfF6/NPvzPn8lUWauETvN
         GNMziDHKCkt9xkov3ymst417p3hJzWFwjSvNuj1tPApRDPYRmedxkEucC01qadJLyvRp
         ucdZrz6OCmsEMQeYg0F7tPE+pOCo7Zf/jAtjC4+SkF/J+DvKFKhiNYLzY28aUtqFazY+
         fhwLHgzoopMWqoN7ymlWbXmgHqPfY7yIPeS/hDbA3Plv5vItFYRKpuIv2JnA02+4QfcU
         XX4w==
X-Forwarded-Encrypted: i=1; AL+hErERdfRTgbRRWydmV6JIyUZsqWnE3BJV3d2yHZRDw6rfbXt+47Ck/UxD6L2FnHQAxH8ZNpgjAEjNTAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ls0ChDdq26vy0pQHD9niy+3DawV6/y0bwUESBVzAxaWidnNsI
	cxhA3iszZNU6jwUOwZCUUPB3s7UnDf0MbR2vU8qDEIkl7740yn/SATpQfmJNTrwCV8M=
X-Gm-Gg: AZFdTZcWaQzYSbdWGW5VXLYVna4RcxqLMGw7rvUbzD9i3IygYmfLowBFcXWi1l/WCXW
	4FrRf2q3kBSBNTFreQPEY9NDnjqiMJxRSEW3rbsItZG2eJY88V4VUaQ01wCvym8ZSOm+agJ6Tnb
	hhKc3IgsY2G/UJc5fPMo/ss0MHfC+I1moznvx6uWnO1odC+twI2KMczvKwAJw7itj2Ipb3ts37i
	1Pd6+oqsx2Vi5XUrLRvpGB0/eNd+NeHg19MZmo2DmNzRgl2scYFdT8OoJXJEEVYvhE4LtY+CgJd
	50k5Ike23nWYPMtV34UnsdBOJ3LzdKQwo213bFQiCNPOe1fZsJMgmqwf3fwSyCiivPP5Bs8x96M
	k7+QacgZjGwsdg8k31HvA7Z6Goat1t6se32T0VDvWlXXqBSJM0KbZlN4d2ZGFSCKLq1K2kcCxNx
	0HtAVyxObJt1OAJ34ZDNXq40ZnyW2GeRSgxNY6it2oFg5Tlqi8BrUFnM7EfZwqV9On2tcvWiA+X
	4tYPeofLLv/wtS8oh8OqoAKuboKu0kWC0I1EIaDt4lYRMhIY01zijwJ6b382cBPa2o8gJY6vZoy
	ZbA4gB06NOnA2Rvga/AMwZ7vN52CXYJ1pjaqwIR2yPogwVYs5oRr5IDupV53N8TQicxLOA==
X-Received: by 2002:a05:6512:318d:b0:5bf:d00a:b6c0 with SMTP id 2adb3069b0e04-5c1bc78eb99mr7209496e87.3.1795642484502;
        Wed, 25 Nov 2026 13:34:44 -0800 (PST)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf3338fsm4845422e87.3.2026.11.25.13.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:34:44 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: camcc-sc8280xp: Add sentinels to post divider tables
Date: Wed, 25 Nov 2026 23:34:32 +0200
Message-ID: <20261125213433.1438537-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PLL post divider tables are passed to divider_determine_rate() from
.determine_rate of clk_alpha_pll_postdiv_lucid_ops, and the generic
clock divider helpers iterate over a table until they find an entry with
a zero divider, however the tables are not terminated by an empty entry.

This may lead to the out-of-bounds access by setting a rate of a clock,
which is supplied by a PLL post divider, for instance a rate change of
IFE, BPS or IPE clocks propagates to camcc_pll{0,3,4,5,6}_out_even
clocks, since the RCGs and post dividers have CLK_SET_RATE_PARENT flag.

Adding the missing sentinels to all post divider tables fixes the issue.

Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index b0f1d40d1df5..131e5d1a1879 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -85,6 +85,7 @@ static struct clk_alpha_pll camcc_pll0 = {
 
 static const struct clk_div_table post_div_table_camcc_pll0_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll0_out_even = {
@@ -107,6 +108,7 @@ static struct clk_alpha_pll_postdiv camcc_pll0_out_even = {
 
 static const struct clk_div_table post_div_table_camcc_pll0_out_odd[] = {
 	{ 0x3, 3 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll0_out_odd = {
@@ -160,6 +162,7 @@ static struct clk_alpha_pll camcc_pll1 = {
 
 static const struct clk_div_table post_div_table_camcc_pll1_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll1_out_even = {
@@ -238,6 +241,7 @@ static struct clk_alpha_pll camcc_pll3 = {
 
 static const struct clk_div_table post_div_table_camcc_pll3_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll3_out_even = {
@@ -291,6 +295,7 @@ static struct clk_alpha_pll camcc_pll4 = {
 
 static const struct clk_div_table post_div_table_camcc_pll4_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll4_out_even = {
@@ -344,6 +349,7 @@ static struct clk_alpha_pll camcc_pll5 = {
 
 static const struct clk_div_table post_div_table_camcc_pll5_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll5_out_even = {
@@ -397,6 +403,7 @@ static struct clk_alpha_pll camcc_pll6 = {
 
 static const struct clk_div_table post_div_table_camcc_pll6_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll6_out_even = {
@@ -450,6 +457,7 @@ static struct clk_alpha_pll camcc_pll7 = {
 
 static const struct clk_div_table post_div_table_camcc_pll7_out_even[] = {
 	{ 0x1, 2 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll7_out_even = {
@@ -472,6 +480,7 @@ static struct clk_alpha_pll_postdiv camcc_pll7_out_even = {
 
 static const struct clk_div_table post_div_table_camcc_pll7_out_odd[] = {
 	{ 0x3, 3 },
+	{ }
 };
 
 static struct clk_alpha_pll_postdiv camcc_pll7_out_odd = {
-- 
2.53.0

