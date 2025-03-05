Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99425DD10
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211058; cv=none; b=V/w1rbCYE3Af32KUeBQE3qZPX+jY/BkYQZkMUqyVBSDDCbswUdaHJ6/X/xftdwlA2d7FRF/Dtxm+z3X3VvvO3Ajl4PBCoAmsh25SDJdsbBaVQQDjKabGF+XyiCwP3pjIrs2/173mRVYTumxT7JzVI7Cd3zkP5hhCgpHZ40wBFL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211058; c=relaxed/simple;
	bh=d9JTlndrDcTjpU46BcEr+6DtMEAruhkkVJ+Tehlx/b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFwSZt5J96yfUOAtC5WoiRYj0lmvLYal06x3xs9eteGN7No6NmD1bag498dZVHEojH7Piv5SZHIG0KbOXoteGv7kUB4uA9bmTBdLZQBH9rmHyeCayxK+DPMxh34ZrPY+tM6/vYOyNTPvz4AQGDbeKhQeOHgZpaM+DBBLDNR3UTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c1iQraO1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c1iQraO1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3912a28e629so2817f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211054; x=1741815854; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2s2FRzqyd1/ZQ/o1NHnLvTWcDUtW15BuFTomhPZd8o=;
        b=c1iQraO1lGJYVj0jbqUubgNfH8sLE4eSlI6Z09FrdPC1cR30etmTuFPTCv4hIdoUyZ
         J8uvBlJa7/ePkqlEuCluJMSTl5wC0rp2lI9d+lt4YvV2m6LbEppvVvtFRzNlEkgyg7NM
         9OyMBHzN4d0+nr9R4CuHgBRTOHFa5SrckK7zuDw28wYVcQY5AD87ReB5AW9XTM4DZO/f
         tpFuDEfbE92kRNo/HkaE2BmIa7RL42epsWCak03Kg1BOLvhsH5OGht3AaC7l9gp/egCz
         mbB1Ax83YR399WC18ALL0RdsblTc6z1zEPkX6osoelBPCWOElcv51ofCGvIAXDdQh/of
         kVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211054; x=1741815854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2s2FRzqyd1/ZQ/o1NHnLvTWcDUtW15BuFTomhPZd8o=;
        b=bZJzCYdZj/IHsgaM1UMyGY4+A+G+wum233QGviUIG0u2F5sCmMuNHC/usMtUfeqGVs
         i0ePf3q0Jr5pJSkgwiCAzPgAJtAvY4+i+OzLT3tGBElOHCkafNU53axj3CvLIspktcuZ
         +pyno8PZciSvxVGBJVhCIqxak1yjXVKT8bNYHdWGA3FmWZBmIOezbZBITwNIonj2Im1N
         YHjHUMIr0VTdmH/1ECXJYdFt8GggZjb/daDPxiy0QClQuZ324FhF1RrxT1P6MziFNRcL
         NWeZthKed0O7qXQsvd6CHML1MtgTzDN1dwD3XbewD0RKgy3Ops2byUOcsKkO/dRhT8jz
         oxog==
X-Forwarded-Encrypted: i=1; AJvYcCWV0D9tf45Toon9i9ij2MxXZUqd43ySY7PxkkZl38r60myO1/e9EKCHB/JzmpoGlgw5PAn5KscudgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3FwoH1VHO4hu3tHTlv9yVL69oVCRo87cIvVn5IRHAhFaLvvA
	vfF3FRW9N3xLH0lfRiKtDET4qIRlIwaoBmndZ1eSyYxMF4sns/3fsVyj5kYp6tS3c7uScz2ZLIH
	Xudk=
X-Gm-Gg: ASbGncteH2FXoxAea5RrrTGnVgdNA7BnQMM7kuCm+bA8CJPf+hJ47HPzzVPjpoG097X
	FUK4sbCsQWDQJqalBGlAn431VyhfOiVH6ydTxSEm/PZpkDNBMkVeJ2blWu8gF34+llE2fOIvS8a
	I/wzfXlDjQYnau8YOLx297OCmDg87Ybqma9kMjLUd+JXpS8EkRiAdTGx/OrSlIWrn08yNPZ4Pxy
	O4M4i2aKTv5Jj6XALHGjjxSLen5aQiHhA459TaFjfVrxlMDftMJklgNnK9XuO8GU0DH8FKk7+Ja
	T5/uRTVydsSOl1pZTtIIupo1FRyibmhpk9CZJSHh+SPBxh42puSaubklh8Ej
X-Google-Smtp-Source: AGHT+IGrfptGh2oqKNwjoju5jcZ833IP58nBTOtC0kImA1tMF8jS9CFcYX7dHyHVQvdhzbGQlFlgAQ==
X-Received: by 2002:a05:6000:1f88:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-3911f7b2c38mr1483805f8f.8.1741211054280;
        Wed, 05 Mar 2025 13:44:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:39 +0100
Subject: [PATCH RFC/RFT 04/12] clk: samsung: exynos7870: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-4-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1525;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d9JTlndrDcTjpU46BcEr+6DtMEAruhkkVJ+Tehlx/b4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWZXZ+MDoZuAIim26MjaX2wbo5pHyJx2aGP7
 +7n3QYxF1qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmQAKCRDBN2bmhouD
 1yluD/4zpqkFYSPfgklTIdAU4mducTvJkw4WZ9iKGe3BouxOxS4r9q6CPrsB+b6AuIA8AaamNUl
 K8KM9/wKHiXEWw8el32x1OvGj8RaKC8ka7nsN3cGI5jIA45N5p32ja9U+rsSVlSIoimUfZnwASS
 0GzxT8ezrVQSE4YBqHAEA6ZjZbQq2cFxfEgbGnZ1zq2Pd2wnb5SOgAwTnpAwShY1H19v8SJHATV
 GuGACEnZyVlDPT9oA/8R87oo0ri9hbxmK6n49xUCVVRuqyCBBosf9ZQUr7X21OxgOXR64ssjD0L
 gjg+DCgkJx1xMqGqU3Xi5OvoeCNp+VztXV/SUnQN1pukrBy4XNtFyuTfn9agLPN+RdiKHYBB0QT
 w1Z5teFwdFPP8HZul+jiOI0UHR/kZ5AnxdkbD4XML4YexmQiI0YjVk1NmDcZEgu6M5RyQgbmsT4
 veIx7tCTwfOrJWJ7eHO1Rd5b6mSna0v3u/XGNHXzaPyyD+v4T34w5vCvFCrEVq4rFyUEbpefqKg
 t/2xIenKXNew3xIhpSrailWBO4QFhwInECmBDoCsXH100k9CzbX6CdEf7LH6WwmNAwYMxhNwWou
 8d4mimDkv6jcxTd4LUx6QoZSjNKGZih2NfU5oeFxpw9GXCoIqWnsnb4ABL1umYPPt5EgdnczdN2
 HB5xAcPjXReV/DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos7870.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7870.c b/drivers/clk/samsung/clk-exynos7870.c
index 2ec4a4e489be30bd1cd2e6deac006bb8ac5bdc57..c3d7d816cab673518c7b01ce35b0faf249692835 100644
--- a/drivers/clk/samsung/clk-exynos7870.c
+++ b/drivers/clk/samsung/clk-exynos7870.c
@@ -1814,17 +1814,16 @@ static const struct of_device_id exynos7870_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynos7870_cmu_driver __refdata = {
+static struct platform_driver exynos7870_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynos7870-cmu",
 		.of_match_table = exynos7870_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos7870_cmu_probe,
 };
 
 static int __init exynos7870_cmu_init(void)
 {
-	return platform_driver_register(&exynos7870_cmu_driver);
+	return platform_driver_probe(&exynos7870_cmu_driver, exynos7870_cmu_probe);
 }
-core_initcall(exynos7870_cmu_init);
+subsys_initcall(exynos7870_cmu_init);

-- 
2.43.0

