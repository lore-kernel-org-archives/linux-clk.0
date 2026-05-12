Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9053C2797
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618465; cv=none; b=ERdlW0fMDdbeFmEs3twxwBrV9zan9Ve78r2KQ/kZLP824kluvSvlWe0f6/M+TDX7M++QWQtmRyBq07IRw5Po4sc7HpjiKwrlkqj5Vd5vWB0+bsslc5RdFUiHxmuzexJtSrRhIEjLzHVCi7TPyEU6WKUc9YCf/ASpiDsyjOHfgTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618465; c=relaxed/simple;
	bh=H0RLb9c0LURxO6koeJTD/k16aT3guXED0HIliuxHbOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kozoP0p5y0KDBQjTl4oUGx/ZolEyRI0b/Od4Yoea6o1DVer5BjA6kFfkY64p/GkfCouU1pflfd+0feINikcxT9vsMZqnzdow+xi1ZorNziC1OkvJKBFJmA9+Gx/R4GEmyyHLpghmoGfwn6G4xr2h/jjuhi1kChlXLX73i4kBHdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eVuYCVem; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eVuYCVem"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so39750005e9.0
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778618462; x=1779223262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mroWW2HaShkmhTulJgY1nxFyaBNcYTZGN03Y3cw9Xbk=;
        b=eVuYCVemeNu5EUSDrhQRjFPYxKv/YI4VG1JQOjgmMYNbQt0ycs+Y+iV9Sic/Vxpzx5
         pRQVluTcHEKVfY3fOZ3ghgJmG7OxX5PAzWMD21EyJUBWOvLiQ6UD7n1PXIzpRVMyPgyM
         ojiMDV6OH8Fy+U0TQ5IQP2lLrF+0av4AokqcqTH8MYvsh4N912m1yLj5T2/VfPpcvDEf
         MnT0GE+d7YDhxYwQP/unln+kzZmBxHh4mL0yPAStUOXrR5WlBy5Dtftg1/+T3PHNi9xw
         XdqjNESCP8+pySNC1WeS/1nEDssEYMMKOQDUo1ieoQRgevVCB0LLx+aOb4v7ov7hKty5
         5Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778618462; x=1779223262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mroWW2HaShkmhTulJgY1nxFyaBNcYTZGN03Y3cw9Xbk=;
        b=env7Q+KtxtCP5Lea7YZk8sXOrNhcL16DIeG6r1o5VY7FMkXImJNje0hhREqEsQj0Rk
         as/u2DIIYAL+ORTY7O81ppnW9qjKEG2egB/EGKCzvykNN2UXIyyJ9OKxbHCh42OeU6aq
         Mz2in4WwFQgJ364cZUxRlu6UQJodMusYtnPDGDZbK8sSUKeApk2DvN+c1VggEm2RjPWs
         IA92Kk/pbG1x0BcxChFJ/OAiSlCDwWm60A47Tb62osg5hlPGH/dyhtCr8eWjsRM+PGUy
         +KPiMn89Jk8cyvN+YsKIEo8lqaV1nP23azs/NvlrJ4liXF+yxemc8qZSMNakB17iGRpV
         16hA==
X-Forwarded-Encrypted: i=1; AFNElJ9UqRxruV7JxgMkTWow32IYkGtgI1nJo0pbpWlLwm9aZsw9Fl6Zmb/PK/k/PE2cVYpVg74ggTgJ01Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPa/jnUEIC2VTPXvIGO7AwZNg3Qk1kc3/cBvT34yCx3b0nI2VJ
	TmmVjF1KU2139D/VB/BpC6hi/WZ3kjNozxftsMotzf1ZkcKKYZzyeYI31s3qL69tZgn6tcoU5wr
	SRPYZps8=
X-Gm-Gg: Acq92OECXLKcLaiwt9bOYyrUDvpnpNFd3TSdNqDnR5I+2/4yv4YLJ+hU18Yu5uHcnII
	Ta4t6361DwkV4HU07TxqNzFlcoLa38iPjyk3wIj5Sj3h48Rja+AqGMJ6ZrCFuTD9QbdJuahI+0x
	GbzQsLSq1juHEeSU8LT9WF98a+XQX8+GZ71dbZpSWuZ8XGljyq98VLv87xewZHrv+gA60YVzD9T
	DdxGOMYji0qXs3HtpiP3GJN1U+Zpmx2nSypuYU0pGwgmkbJq464R6wXgXPf8XZG1+LwHX75ob5o
	jcT/F34fzWZehDPo/9SVT+OuTGWUV7J8xffgqBsyv6bZvkstZ9TdOUt5duz1IFFwINZ3IH0pDuC
	mHjBhFcqOItcWQhVD+C+FpDTcBa7BPossGEUbNmCfvtTKCUx9iuaYsLnFu9nFFpksVRV+sv9JUc
	gohS7MuDIJnxoBdCDuTHgNEv1riPJomhhnev6ynEMAW+n1ei53ZoC3u5OGhLHN8UJunDqXESQqp
	CFWk+pDq0y0vSKx
X-Received: by 2002:a05:600c:45cd:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48fc971f0ecmr6871455e9.2.1778618462098;
        Tue, 12 May 2026 13:41:02 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d21c72sm18788095e9.7.2026.05.12.13.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:41:00 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 12 May 2026 21:40:49 +0100
Subject: [PATCH 2/2] clk: samsung: acpm: add initial Exynos850 support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-exynos850-acpm-clk-v1-2-837532ddbf38@linaro.org>
References: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
In-Reply-To: <20260512-exynos850-acpm-clk-v1-0-837532ddbf38@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

The Exynos850 SoC utilizes the APM co-processor for clock management
via ACPM, similar to the GS101 SoC.

Add the Exynos850-specific clock variant array (including mif, int,
cpucl0, cpucl1, g3d, aud, cam, disp, and cp) and wire it up to the
driver data infrastructure. Add the "exynos850-acpm-clk" device ID
to enable dynamic instantiation of these clocks during probe().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 604604b5b814..d9b2604db03a 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -40,6 +40,18 @@ struct acpm_clk_driver_data {
 		.name		= cname,		\
 	}
 
+static const struct acpm_clk_variant exynos850_acpm_clks[] = {
+	ACPM_CLK("mif"),
+	ACPM_CLK("int"),
+	ACPM_CLK("cpucl0"),
+	ACPM_CLK("cpucl1"),
+	ACPM_CLK("g3d"),
+	ACPM_CLK("aud"),
+	ACPM_CLK("cam"),
+	ACPM_CLK("disp"),
+	ACPM_CLK("cp"),
+};
+
 static const struct acpm_clk_variant gs101_acpm_clks[] = {
 	ACPM_CLK("mif"),
 	ACPM_CLK("int"),
@@ -57,6 +69,12 @@ static const struct acpm_clk_variant gs101_acpm_clks[] = {
 	ACPM_CLK("bo"),
 };
 
+static const struct acpm_clk_driver_data acpm_clk_exynos850 = {
+	.clks = exynos850_acpm_clks,
+	.nr_clks = ARRAY_SIZE(exynos850_acpm_clks),
+	.mbox_chan_id = 0,
+};
+
 static const struct acpm_clk_driver_data acpm_clk_gs101 = {
 	.clks = gs101_acpm_clks,
 	.nr_clks = ARRAY_SIZE(gs101_acpm_clks),
@@ -173,6 +191,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id acpm_clk_id[] = {
+	{ "exynos850-acpm-clk", (kernel_ulong_t)&acpm_clk_exynos850 },
 	{ "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
 	{}
 };

-- 
2.51.0

