Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676661CF9A
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245048; cv=none; b=G84qA5Cyw1CDPWMl3881Ne355fexymTLS6eaLKspStO/Hf2LwvZi8l6miw7vsAXzI01vMTQ77ZutQ2QojbcsT05AvqcRYOhNkrBlhblWLOkh3hDlCyKtBNa2BQDxHPxs4K49U0tuMnbotUDWeAkZmfMsmeKVHjI3ZRO9/xCfrZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245048; c=relaxed/simple;
	bh=zaeCrdSIZdnQrOpfJSqYQ9Ck7vw9+mDCXs61VSh8KsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzWaRtmvBOpcgjWoDhwp6VfxKJAPFcUGkgixlugmkVFM7+p4XYIIRZsp3JMZ3wOnhluhB1fFalQ5yLKOcNI41BYfWgriq9d5MKWSMem/IjPUZ97g6KjCM0i6v08vr+0Pz+rQ/aPzhaOAQhtuSBt5VVQw+rS0y0jyNro+KpdsKhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Appa5qAa; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Appa5qAa"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a383016f428so103270466b.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245045; x=1707849845; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KEnAB/est+J1SeDFEencX7BVcJohlePYLBUnIFqHdQ=;
        b=Appa5qAaG6JjR/Dm1x+cH64nGklznSiLH9J6+EexMEB4/6vpPn/SYcoq+8XGLQmJO2
         KnNFzA9K/iUaLMyy11c6Lr0d7b3RJGu1KiODzLyebdIwtXlC/pmmEmJ9MGl2ouwA23pN
         cawSrOIJn9p+k8mwt/YohjTjyynh/JJLTM5SXRdqvTuMskq/KTTMgxEjK6DXv3Uz3R2R
         l5ahFG4TV8jih+72r6J0F5sO96w1+9top+iiUSDonElGOmVkdFggFAKFooqV/NU2FpoH
         jh5iqTQpTT8ZXP0Ec7GjjFBIBq9e7Kl5CvY8kw9ppPZ9yFd1RR/8Pzn21aO/uUF9oqTU
         pisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245045; x=1707849845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KEnAB/est+J1SeDFEencX7BVcJohlePYLBUnIFqHdQ=;
        b=RTDW8zr/r1d2mlwyx4coiDF7j4VXW3/xud12fbf4jyYWzlvcKkX3NtTFimR1TfUNHN
         ZjwvK1Q3cHHFaxMyraoU0K925MKIRYNY5V0H0QpNtzpYxwO6ToOb3InYYZqaBwU07DeF
         KJCXYQ7Sr5BVCqF74Ji1jMGupIiBeD0WrtSGoQZmBM4jD7MVaSlMHPllZfmBlTe0aA51
         S2v0E3tDVvkns8Jkb8xkvpPpUbAkIxnDFcpzH/dhLrma/Ojp9oqkZUOgeskNHfjXCUjB
         Dju3buKU0+uO+2eurTrJQYP4HqYQwkmYjinnk6jyyX/qFgBHZx5FeZiaDE01PPTI8BZJ
         pSaQ==
X-Gm-Message-State: AOJu0YzgvKMT88XRtR6ph6q/nPZxkMiv6ONAJ3CAe7BpR22M2FiiikDD
	iIig4/63XqtL8J/Co1jQviJmVoigZX06xVXcy75Rs/KL0Z+MmaclHI4ITZ588C4=
X-Google-Smtp-Source: AGHT+IEwSDm6nuBUElg3xGBgKVwVcWEiOWHkBVITRzKTgjxLIhYvCsU0/ng/Iax0Q8vQt60UZcLlDQ==
X-Received: by 2002:a17:906:704a:b0:a37:22a5:50d5 with SMTP id r10-20020a170906704a00b00a3722a550d5mr2476690ejj.54.1707245044858;
        Tue, 06 Feb 2024 10:44:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXb+lVRLzyZP76/IktTGnMRqeUucGJP8JxDl9gdo+QqnwoJ/JXSL9aOXKGw3BZPqSMGqX2fSPt8VK0wCj5wHQwrIIunNAX43yQuc/cDyRh+NPJNe+QslArFff81Hadoomba/4af3M1IY6iGDqNxByKzg69MqbEminGfLNhoxBkdDjjoeEEYaLm+wtjBY82gXqOI6US4t8NlsYXky8UckFYq+L0fXqSC/t+nQYcBR7vD7H6UcgyhET5gu/aHFzvJaAmrOwgQUoGzninGh/tUq3C+S2I+bMbu8zevdClTD3ARGKmpgjSY8ok6aovYWvgksMbWMCPCY4DRkGOS7mtHkwdE9kRHT4mftiJ+ZUyceccZWWzGKW7obEh0HlK/WeqD/WFMkNROVk+7VCKNqGZSTSNH4g50TbxMuZKquYfTE3SE4rOXunt+uEK0VJS1La9YMl9zOao8RAHP
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:44:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:50 +0100
Subject: [PATCH v2 17/18] clk: qcom: videocc-sm8450: Set delay for Venus
 CLK resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-17-c37eba13b5ce@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1158;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zaeCrdSIZdnQrOpfJSqYQ9Ck7vw9+mDCXs61VSh8KsU=;
 b=gAjYN4kZvcLr/Jv2d1Ru1N8PYvkeDBd1lv8wL36Fm8wIxdb5F/6CFQKx+SJAI+jQjzqqSJPKn
 K9LFK1EAOleDa6zshRxR50X2VJYvve/1+D2EdEHxnFwyUdQbu8kFanZ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value is known for SM8450, see [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/commit/d0730ea5867264ee50b793f6700eb6a376ddcbbb
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
index 16a61146e619..67ca302a0737 100644
--- a/drivers/clk/qcom/videocc-sm8450.c
+++ b/drivers/clk/qcom/videocc-sm8450.c
@@ -373,8 +373,8 @@ static const struct qcom_reset_map video_cc_sm8450_resets[] = {
 	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
 	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80bc },
 	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8070 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x808c, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { .reg = 0x8064, .bit = 2, .udelay = 1000 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0x808c, .bit = 2, .udelay = 1000 },
 };
 
 static const struct regmap_config video_cc_sm8450_regmap_config = {

-- 
2.43.0

