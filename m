Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FD36C9D4
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 21:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041323; cv=none; b=ho9ZBMkcNsPkCMVfx7HKJjvt1oRI/tO8A/jdIZN8WkvRCufSlul+em/r8DI/0agteTV79dofIYaxj7UsqzthF5OvETU8UWYr4o9oSi6dZTo6SeIe8hfPbiqRGSQxPEogmd+9W0xDSIT3aBUDfiWTesWXv78kh3RFVa8rV9Jjics=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041323; c=relaxed/simple;
	bh=dEU+HYL4TUwumpvS92ZlG5R5HRevhTdXiDojFGzKHrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNetCy1quh3FdgG84p8bCpcBFfk4y4cVq+Hhe3g+Ru2YE94Wcb2wNy36ApeegNoZ3qeK3VO4r5ryvqaNiFW3fOwrKXnWGV/WHkz/Ul6/iwsV6Jms31gYQiOt+oVWHQjd/9qEL4KNTp6kSYVT+iU0uejeyqAzJxFsJLhrXT2waYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D7qABObA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D7qABObA"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so2383528f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041319; x=1774646119; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=D7qABObAoGDRhhLk+D5vmA8P419PGsiK5yGrtkwcD3JVxZ7wczNEWqVEM2A3F9IJ42
         uoHm1iYVudSVZFdptiCOJrEihcXsLiPSZ4BitsyMg+lSBTdIefTawE3rqi6i/gOvXXJZ
         PPvg3d+yknSAUiCQwmZW7MeQP9tkYf16+3x49olTk3SrPkkW5IsiVBHPh0TwOAztL6kQ
         MxoRL1+F66Soqhjukow5qjzsiLXKsWtxrL7hSDfGQiivWCnmqoFExJ8MmalhLaE17of2
         iX5QkSIWlLiA+pC8eAOpZQKEfEDK8IC6WEB3LIGYDfzQlgQtSu5DYQi9BpbE8I9iBo6O
         dQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041319; x=1774646119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z9RV3BC7qTYEhYVVUcSNrC1vYSoZKUA0ZmqsXI7LOh0=;
        b=NoK/ToSPBf7pdT4mMz8s2iL/rUx51uToYeNWApyZPjYXuwBfedVrhR/YG9apLyN1W6
         q02GFlIhpOz5kudjQttOvoZFg+SU/uBuJ96QvBA8d1wXs/oVVERz6FCk3f+WWsNM+TF1
         3WmDCVdWPF9ZiqMEjHJ8oIuKyDwuY9NbD/A1ID6/dtE5GAVAwqMS1hg+My4JXnu0+d69
         LcE3wXIRepCAdU6erqfMC6bkRsLTzkMKqMxzeuQEWFcJZZzM4EfdKLgniv1bTF3jqva7
         +CsaTvBoFBjTEBNTtOh3wdfYMVyih2umwMrcjf18yyEzOEeIJhSNbtBf2bh4rreSSvJ8
         O6NA==
X-Forwarded-Encrypted: i=1; AJvYcCV5VCCeDhkosX/a45Y+QLhVm2dCe5ijlWf0Kx/pSFd05EiQhNakVkPKMDvxDtrKMKc6Tr3aZA2+Evs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsZOuOMKkyCpnUWXuNwsdMtPB8YhYFJCLR2Sqo0jkouE0rmb5G
	aVIZbwHkyp29WnHpEAy8h2sq318o4j4j9h/Gc17XxtK6Uc0Jkh7zlLPuZr71/PF4Vmc=
X-Gm-Gg: ATEYQzwvbposRZmVJEdCHAp2/NJ9uT7oveXXDG9UTqc9R85+jzTBTJzdE9vvIGqiTKl
	BQ7E+0uf9XoaEmwem7NIE773RXAlXBVRhqOSr7C+piXPy/r2tsZCLKalLdi/IffxhQ5DYn2W6nx
	hxZLi4anH70b5hApHH1+kHmcY2LSbssKto62gc4spShgyUgPbA4hMEZdWz/vua5bhtKlTcTRU02
	Lap1SbK3jGR9ZGyT3XbwhigZhWE/xbSBsV6UVquqSdSXpqPuF9+Dib+4HOtUqnts/wKSoAD0xWB
	pAF89lnZ7IH7X0X3AvdibcpNgOJxllhwCYGHLlywVl2SE+JPNNsIMvBRPXWS4qW7hSdwM41Gmzc
	1+vkJtnVv+WXos1wJrJsB8Asu3JoLKmpEc77oluUNX34O7OU9RU0RAw4puAPhc0YCgbHIaXqFvY
	1BRZGvMyU6UNeM9CvW84qRRwzOX24Bhz5wfgXRVP/Cnsvaxsm/rmPeyX6fKUP843CUXW7IHfdzi
	8SDi6GGvShups0=
X-Received: by 2002:a05:6000:2011:b0:43b:4909:203c with SMTP id ffacd0b85a97d-43b6427d8c5mr8221726f8f.21.1774041319466;
        Fri, 20 Mar 2026 14:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:18 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:14 +0000
Subject: [PATCH 2/5] clk: samsung: exynos850: Add APM-to-AP mailbox clock
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-2-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Add APM mailbox clock for communicating between APM and main application
CPUs in CMU_APM unit. This clock is needed to access this mailbox
registers. This mailbox is used for ACPM communication between kernel
and APM co-processor.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 56f27697c76b..eb9c80b60225 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -19,7 +19,7 @@
 
 /* NOTE: Must be equal to the last clock ID increased by one */
 #define CLKS_NR_TOP			(CLK_DOUT_CPUCL1_SWITCH + 1)
-#define CLKS_NR_APM			(CLK_GOUT_SYSREG_APM_PCLK + 1)
+#define CLKS_NR_APM			(CLK_GOUT_MAILBOX_APM_AP_PCLK + 1)
 #define CLKS_NR_AUD			(CLK_GOUT_AUD_CMU_AUD_PCLK + 1)
 #define CLKS_NR_CMGP			(CLK_GOUT_SYSREG_CMGP_PCLK + 1)
 #define CLKS_NR_CPUCL0			(CLK_CLUSTER0_SCLK + 1)
@@ -604,6 +604,7 @@ CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 #define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK		0x2028
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK	0x2034
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK	0x2038
+#define CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK	0x2060
 #define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK		0x20bc
 #define CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK		0x20c0
 
@@ -628,6 +629,7 @@ static const unsigned long apm_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
 	CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
 	CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK,
+	CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_APM */
@@ -698,6 +700,9 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_MAILBOX_APM_AP_PCLK, "gout_mailbox_apm_ap_pclk",
+	     "dout_apm_func",
+	     CLK_CON_GAT_GOUT_APM_MAILBOX_APM_AP_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {

-- 
2.51.0

