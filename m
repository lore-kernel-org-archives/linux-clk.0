Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E325D91C
	for <linux-clk@vger.kernel.org>; Wed,  5 Mar 2025 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211066; cv=none; b=CnklRrQrKtrrIA220XHL/eXjldztmbQqtQN0l0akV2F5EeHGD3DTgt/RsleCOQxMAnfaJtsu78LDUxAus7Ee11hSgfHh132fM5z9RnRitOovvs56rcrlmaCe+ZiM2bU/xUZzsf0or3nlkXLx6kfj26xl076PCdJ6tLAJP9clmkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211066; c=relaxed/simple;
	bh=ThT1SH0NwFD4VGWTWx3zrPyEMtbDm+ytz//9/ZQ8nUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgpfYrgW4Djg3Ad2QbGwy0rlxBPhyIoF9tBCUgrx+pU3B/hP1mnnfc1nedZFGEuTVqU4N/wDM8do/3WO4123qCf83GukrfxwkBky5Amr8EzyuR63RcbMR2CiIoNaFCBOlhjtD0E5RonLF+H3q468UQdi+PMbz/+froCwQOJBT+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=epWn5zrP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="epWn5zrP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bd4ccc4c8so972165e9.2
        for <linux-clk@vger.kernel.org>; Wed, 05 Mar 2025 13:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211062; x=1741815862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqaqIA6DIiM40dv1MbN8TWQBwcTqK6nYU+kVVFGzqC0=;
        b=epWn5zrP6mXj6odttAGu/YpUTuwvBGerNEqvB8dMmwpv3b83R+WP83gaFbG9CqKmrV
         Z46MM5HtTReQ1cOwCedMJLu8gWO7ey2WVXqFaSn71OOrzde+QLqG8iHLbL2o8bs/yt5c
         9abdxg+yd0Pyurpyt63r0/hOHVVTZ3eoWhOAJu1aVZT8x4bnShuM9e/FG/wHZtBKiFHS
         eJ2/65dhAioNla9/A+ptlEyweES1vYCghTcdfUTTh+iS6mro3D0DbC2O1CoUtw1fYI7x
         GnuyXpZLcJThMIm7arrIwrSage5QatMnscSauO8DaQsbYrp6iEEPThroPzospLu8yM57
         slPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211062; x=1741815862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqaqIA6DIiM40dv1MbN8TWQBwcTqK6nYU+kVVFGzqC0=;
        b=qwvNI3hoa5QNHeVamC70Rnb2Ks2m5pLEzAD9533SZLxfmJ4/sxJSgU5SjFqYQuQm1j
         KInvyeiPkbNOlhj1/SSiV+yLAYis4fJiDy67xiiVUsxOFjKuaJVdwxpnmqtlF8jyuURb
         lP9uct+8hSxQ26IaHC43+S2Bxp3d2au8TDdVb0JBOiXvtEzbeJKIS138CcRh18UroWcE
         95AHisN7KJB6CMNce0hIos0bQG/t5UiH9y6rVX2IGMVOPbbXjpoq7tyO26ettRbAtbsN
         PeBlj0SBAvp88xC+cwT19zHIobVIDQz6r+umWXxHuOZR3SmlWS3Js0Cy14FtgWy9YYLv
         snbw==
X-Forwarded-Encrypted: i=1; AJvYcCXjwH09dz8NMQNNfwWDYqtlhG4dFAIMCucU6H1/eYO2cbHHcdjROP3/lylLAYrFQkwKl0B7KYnlZ3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUsmx8m1Xyr4RAMIvpHjaX/g/Hu0bjZpeS7niWxN9sSSu4Co/
	+kSUVHfZDd8pMUMuuReylesSAJcjS21nct33ZcHRmWj/rsdSLLY07ZTygsrNZv7Q3CZjQbEivNz
	WlRI=
X-Gm-Gg: ASbGncsHVDcNlmlReL6Lje/YxmH3ynyJJX/FpVtu3cpcCKm8Gx0gTHcCLS7ucc9aDA4
	1+mr49IjlMN6MKUYrtYNSth6bzEEhSZTpKvlBReJBPLnicnRP1bdKDoKycYCsukN52ijpDNgGgO
	COtw3u4UsKbyn/PCZbIK+aSte+/sWls4cYZvIRdasFfUj8NewNpbS7ZfuDAYmGwRUM0I7qHbSmt
	MhnXBq3onwmgfjg5+KTBMhw53ArixwEyU3UbhveSwlP7prhEwI6Edtk6N1djoYmGjGj+jHwXQIb
	8ngIDelvXuCURY9cH1s5zDA0dBIkpFOvhSdrowTdkm3LghCweWtI11s9GATq
X-Google-Smtp-Source: AGHT+IEVp6P3XNQLXM9Hx/K3uZ+HnS9dPsCoQK9L1YtJ5wzYA+CRMMsBsg9ueYhyVV77oKnbD55vCA==
X-Received: by 2002:a05:6000:1562:b0:391:1319:9007 with SMTP id ffacd0b85a97d-3911f74bddemr1659044f8f.5.1741211062229;
        Wed, 05 Mar 2025 13:44:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:42 +0100
Subject: [PATCH RFC/RFT 07/12] clk: samsung: exynos8895: Use
 platform_driver_probe() to avoid __refdata
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-7-a4e03a019306@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ThT1SH0NwFD4VGWTWx3zrPyEMtbDm+ytz//9/ZQ8nUk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWcznuiVaZj5D5PkbxaSqlYTXI6VdUv5dQr3
 3jWHqptK+uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFnAAKCRDBN2bmhouD
 1wb1D/4sp79hXYVSfV8BQMsYsRJU3nTGmpey/905/X3p67OR94ygRIo10cvnrFQo3N9tB2mLH+w
 2xvHb4FPpONotoITcu6fvz7SEsLPxI4tLEncYuSARGtUV039v9lix15mkB7qOVvQQn2NIbOi9mH
 Yu4aD23/ZMSMtBiOfZ4YzAuyHMAA1CK6glkpx+ysjIHFaMpdzn1NupBhCm+9PMA6qLcZFwlfJfx
 XUf4zWqubHHwP5h/bqH629lX5IT/TwlXSvkSAgNMQ0vZn125aw2cJ22TURiHYYUYnozi4yphJZ4
 WDkSMEXbJlvglud4K1ozSdRYv+uEFUTeLAhjZ31DtsjiDSGzXjinLXAg/eIpyDFqFWKoeq9cPCu
 mXx4gsLucE8+lMlYjiJ/ZFwvsoQC/8lh3KiENQYhs8O7scIfvEKwq7jcwqP1OMdzxz6dnJbpnA/
 2yTGzdqYwWWQCPReBJE0jpiHnnE2w5z/OG5AXpbCpQ5aszUlE9w2jmxaBTwCzS2Hd19OOyWKrIq
 PW2sTrZviRz+XUAt+o2KC60Yihxaf1vBgG+sYFDq6dC4wBsP7eI1MQwkHiZR75SDKZsA7bcmwcd
 aGtseMM5BbhCajXkwq6UiCAGQbRB56Ln0fB65AQcQrs5upLx7KTncMVvN3kGBucEsQstZHO15IC
 7hMZyEQzN6OFiWg==
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
 drivers/clk/samsung/clk-exynos8895.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos8895.c b/drivers/clk/samsung/clk-exynos8895.c
index 29ec0c4a863524fe3fc5c223d762da87e5f13013..6b85d917871d20fd3a3f6768937eb5694760ffd2 100644
--- a/drivers/clk/samsung/clk-exynos8895.c
+++ b/drivers/clk/samsung/clk-exynos8895.c
@@ -2787,17 +2787,16 @@ static const struct of_device_id exynos8895_cmu_of_match[] = {
 	{ }
 };
 
-static struct platform_driver exynos8895_cmu_driver __refdata = {
+static struct platform_driver exynos8895_cmu_driver __initdata = {
 	.driver = {
 		.name = "exynos8895-cmu",
 		.of_match_table = exynos8895_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos8895_cmu_probe,
 };
 
 static int __init exynos8895_cmu_init(void)
 {
-	return platform_driver_register(&exynos8895_cmu_driver);
+	return platform_driver_probe(&exynos8895_cmu_driver, exynos8895_cmu_probe);
 }
-core_initcall(exynos8895_cmu_init);
+subsys_initcall(exynos8895_cmu_init);

-- 
2.43.0

