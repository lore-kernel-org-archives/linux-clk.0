Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0203FCB14
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802317; cv=none; b=RxEf+5pjC6uHEfRTVD7p1LskfvraglKvR1dCZmpYgtr4wmqXZ+pZfz6RW4YNDL3sw8wjxhseO99K+V0UMqruo5MrqGMHXOKoJFtEV82cgqNALds4s6zeTy0jdNi7qa4y6bMBCVFMG7qGv36USGcUEBWoK34wvFeO3KrbHHUjRoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802317; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Flq73zNJmnyiTM/uGGURJlogIiECdYfvl/L0XknXtAyDdtDiyonsAurniKpvTVgu46PGcy13anTWy4yNPb8zXM3gjbz6U0IXcDgTeasmIjm+D3hFw2XjAQZTRdZdk0/Vp3PMLfWa7ybOIxh+q5KiOgpoF3zonkRAKrEoNIXxyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FaFpYZiY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FaFpYZiY"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44e5624c053so6349043f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 06:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802308; x=1780407108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=FaFpYZiYG8kkPPU8xAUK0V1ai0Yrr41pASF/JQ+2Ywq7KfHjbjK9CWyTrczbjy04Pt
         DLq8Oxg1534SpO1GC5aMMNMIE90jX6JvXqHP0+eoBA6H0HoMaBX7pvW/nUrar+YKMtYc
         iPbwNUPNemE6g1gJ6YVrQ1iyYXdu7JfafFLgfJtrFy6NhgiQUZR81y+1y3087PhFbqZW
         uXg9kNrku8POn98YwlSrcaKysrobJ+7YKFMZej+oyHkY8u7+fi6xBbhiW6jDJjmzRHmk
         0iKD8hVITO3N1AEOM5nILjyAemFyrbZiVwyTe5OVvNSLuyx2+XAdcPQOVIvWTOkHgIT8
         ixWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802308; x=1780407108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=EfHcpAtmJQXA2YzFIGk43jeaRqhIr4FbQu9ogL8GzSwX4s0QSW8ENTFCv07X8QiV0p
         SuWg98IYO0ZwLa/a1+gfTvdoLAsz6x0Crro1/5gCJVEYtCUrZqRjs0iz4NNgDMiduIzI
         9QKIH1bZCWVRqcQ+fkyYBLz+nrMoyYtjjVKsK+r+x9bY+MnL/wgK8fvlggXk9uDViepD
         xljTXeynRo0+nuAKMgmTQBN5Z88LV8ae9uxbqW/mZet+2mrb3sFh6C8blmtjuThqRXAB
         f43K7eIdfAqraz3hJmy32OLaSwEF1ixMESEbU4ReVeL6daex+BrsA5y37utao1FOrAOP
         ymkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zUQsm4zu5GzSp6rdCN943tvcZ98sOIwIr0DSnanAQVXtRZ4gLxSwDx42Qv//H3121BUnaiAp2eG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHeMNkwwPUqOBknPalUCoUDs2ZIug//wFuNEgmA1AVrlYJkj3Q
	yQAp42mFhusgDAYY0U6jxnMuEHVA2kYwpD+lVvsUPYAqZfwkcurDxZfy
X-Gm-Gg: Acq92OFPv7n2xblGIpJIRlDX5MfPYtUCZDhqDadmKqq18Bw0lq5s2Ikj3f+kAH7Mi9W
	b7zXS424E2R3EQ61JjDGnZxjtG0iHi0b9BCoj3jEiHba1H4NCaJY1YMa9vUPmovnAFbAer3RAXK
	QknaP5BQoDqqQ5o9nhPltAz6oMUM8S7+1Z5MjZlqaJmEbkjw0Aqz7PM49CzU4WC2oQpk+oC0rNJ
	aNO3YJ73t1mDNRyqkSUo25TbJdE9o9tXpMl4GYr6SaDGl3xdahE6coDypJycAsz4yd0Hl0kByZU
	i6l1YyoXX/Ia3xV7RrlA2enzTvalHhlklD9xPYLP/aQOtFAzkFCb7kjpGOI31giUv40+Bm+pvJq
	lAgq2i2uGecl8qfP2Ua055VQdhdR3HCEXkh4OVGXJUHfu9QXjpdOeztqkoXAu1RQL210PMp4lKw
	0S8OuFvesd0LsjgTAAhzZCDPpzSw==
X-Received: by 2002:a05:600c:a402:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490426c5be8mr262860365e9.16.1779802307589;
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:47 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:31 +0300
Subject: [PATCH v9 8/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-msm8939-venus-rfc-v9-8-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

