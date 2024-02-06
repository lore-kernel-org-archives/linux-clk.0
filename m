Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9113FE4
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245027; cv=none; b=JAr1GLi+psrKU7dDcjh0GPGvnusVMuX3ZgrsOdcgcfKYYHHuXPaaEEEzLqwi60S4ejc6i2jteMtB6MM6CGpO6knuoGX524t0ggA7bl/xT6HXjiEIrL/1qwJqBiNwjm5OCOCbFa60az/ObwORYzB8tdJxR0VofUIbKl+Ye3DdO9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245027; c=relaxed/simple;
	bh=XwCgSZpLR0e1PPyOXyw9iz+BwYBf4ZHexOSsfIVdxQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Opo4wf17SF185my+N/NaANUv6izLc4qVyE+1evXLneIdEumrYqFMG/vqcFRHxU1a5CKg4cikPljCDMT/jo9pmw7Fin53ziNP47r2JNrsJscIB70SOi1lq5oWrX0Uve4XPdkfB87UEXRbYaxR4b468hBSopf7JLfc94xNT+Kc61A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n88zmfA1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n88zmfA1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso172256966b.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245023; x=1707849823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hvL5qVc53pRM2ItjtrWEvKCgIea1KTM6jFEXiD2pTIk=;
        b=n88zmfA16tac3dTriWwFjbFeppDs3QCehS3dS9zYc6ISdsqi/+N7kYa8RVdk7PrG3V
         JHVd+fGdNvr8dYF/b3lZ2LuAvAn6vQ+ISxAHLRd3Td3dIzJCa4/JkqRtftbwRLg93Ja7
         ZdS0iL/SaqjeHZcUVj73ubTEbWbev/8mPkFjJjJYDZZgwTOUS8/CzRIjCWEuE1bnBsvG
         HhJ1G8HZwFmObUd7znj6gCCXlBLzp1qdJijj8flCbLkXXIkTTart4jOJX2RJo9Il2atq
         ETVk+QWMQ6MzEJp6ZKJg6bhzjoejLap/VGQuG8QSPHKKh6R7C6P/q2fupy8BTqbVHnPN
         tFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245023; x=1707849823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvL5qVc53pRM2ItjtrWEvKCgIea1KTM6jFEXiD2pTIk=;
        b=QliSCMlumWUehtq2yOTpqhGCWwri8U1Q9b1MQynq5GCRJOcOHDHn1sbDmgDQmAWMVp
         ZGBVnfBLvvACCNxeeG2Jaew3e2LbKg+cAU3JCf07LCjDXhPLnU0hPvg4owfTl0tO6bYh
         4OwsSDRP5eex+d/9Sm+4r4neA62WG98Ea9APtubwQpLxzPYeEgeycBhqFAYa6LbqPt+X
         0hRgVwFddav8Znf9/BmpT899TW52rEjZoPwH4cRNEN6swPoOHW5WDlNFctBjntvhdXt9
         59uR0uej4Pa3sDozAUz33wwzlfrHASZiO0ndmNPpm5+MsX4JK+sD8sIKsMqdUe1Mxjg5
         wwhA==
X-Gm-Message-State: AOJu0YyHE8kMU5FDBzpj9L13VH1Iq893QuuEWyl9kk3Yd7ENmBbtXaXc
	EntSMjgVwknfkWvkuISJavutRiJbtARLoRKcG0iw6ih/vsXdmMqXQBnaEKBQBdE=
X-Google-Smtp-Source: AGHT+IEwcGzkit3UG7RgaJhKZBhIWNsb1zukExW6YjVWP6FLguEvzUDQXDK8pJXm4ibakI9xGX20fA==
X-Received: by 2002:a17:906:5290:b0:a31:83a2:463c with SMTP id c16-20020a170906529000b00a3183a2463cmr2821529ejm.34.1707245023306;
        Tue, 06 Feb 2024 10:43:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWzBwgE40NoQJNzoN6JSw4Wjez8/Ag0DcojFpjommyB40AgMlUE/2XqAEx8GzyqQRu0n+Gf6BPPBtw0GJk5JHQhpqnm9wTanHLkqAFGNEu9StIqpimJ3LQ/bh/choLxc9xYvIslXMUyNrY61oIAjPhXTck3pQDC3OFqGLXAFx/TIN6rxWNRnLl80REIXNm+H3LWvFfoHxYHliZ1b9Cd6Z8qWIxWNz28bbjp874R4NzcK4HaJPXy8u14SqljSDsQrMCSy9WfeYwae54IR4lpNeZcjYCgKl0toBqdAzeEWdi5p6i08NE4A/IeL2gwgUisfg5IsdlgXA4KSzvf1vmfsL4BBtBTJbSf5KNssuSrsYrfPg3umt1i6MAG8r11TtQZdMAC35PIbJJgHuTLP0vc/N+7NYdxkR5syNN31BkE+v98az+z1IISEBMTlSD9hRllymVU34Asv/su
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:43 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:36 +0100
Subject: [PATCH v2 03/18] clk: qcom: reset: Ensure write completion on
 reset de/assertion
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-3-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1253;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XwCgSZpLR0e1PPyOXyw9iz+BwYBf4ZHexOSsfIVdxQU=;
 b=Tq60ALVlciDLkdivYsIcmrQF748EJR+pUE1IufXNafFGsZuOAbb9f/rPSAB0nnwQSqzg3qqQb
 6l7lLfFExgEDOXPfLnpXb/GSuu3ptYAHeuizJ30cBnCMswdh1J1/Bz5
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Trying to toggle the resets in a rapid fashion can lead to the changes
not actually arriving at the clock controller block when we expect them
to. This was observed at least on SM8250.

Read back the value after regmap_update_bits to ensure write completion.

Fixes: db1029814f1f ("clk: qcom: reset: Ensure write completion on reset de/assertion")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/reset.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/reset.c b/drivers/clk/qcom/reset.c
index 20d1d35aaf22..d96c96a9089f 100644
--- a/drivers/clk/qcom/reset.c
+++ b/drivers/clk/qcom/reset.c
@@ -33,7 +33,12 @@ static int qcom_reset_set_assert(struct reset_controller_dev *rcdev,
 	map = &rst->reset_map[id];
 	mask = map->bitmask ? map->bitmask : BIT(map->bit);
 
-	return regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
+	regmap_update_bits(rst->regmap, map->reg, mask, assert ? mask : 0);
+
+	/* Read back the register to ensure write completion, ignore the value */
+	regmap_read(rst->regmap, map->reg, &mask);
+
+	return 0;
 }
 
 static int qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)

-- 
2.43.0

