Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA2F54BEF
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0xjjUrj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a28a6cef709so167708466b.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717177; x=1705321977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muMibjVOlrdUaMKZav4q1ZM93Uv09LtyKsx1ZeFf7Ds=;
        b=b0xjjUrjL9DFSFXL/wLA/LY+j+ceplfKfYGxRZCWSSkf4KrFMByto3tQAnWG7WF3Oo
         qNhgxVD626dYQBqeGeTAs0JjZXeT92kdQ7M8BNh8Encuaixa8170JAJi8DJboQ15/GK+
         tCFSvnSCRPHBsON8SwxHpHxgE4XsKOgVtBee5LEk9o2xIZY7HWvccu8bRGkohnO7EFZw
         g3QMEM3XGTEFBnpV0EipkLSmhCVhGKvcNuJbaVsUN3umiavj6C02+hd8aXwkk+SuEIx6
         zm2sC5DiZMVAZgEZH6fGe1ZmeWO9VYExp4LYfuu2owfKE7vs+3KCHcxfCDjGwc02i/mD
         U9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717177; x=1705321977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muMibjVOlrdUaMKZav4q1ZM93Uv09LtyKsx1ZeFf7Ds=;
        b=OziASZ3xDzmNfsfieYPUQOkh8gdMtpeYJTC1I5i1B/q8M9BLG54CYbjbzKZUklxKuP
         DrlZVzq/V9VVsyjeUceXYZI8dQwh6mceciBmCf2flO8IA0xh1HpFjtgCu+Q1DQWRnPLl
         O6JlNt9BxLD2EFCn0YJfb731qYHE0QjHdVwstSNxkQItbeycPsRQ4YB45n7c+FSsW8I1
         ygb9XdJKFEF+WwszszsLOl1UcR6xvjBaRSsyiAD/bN48s1bo8xz8iNeLrhla+NRBAk0n
         3231d/dsleWWOFZ6+irSAUGpjcKApjkXjQskVX8paw3D/z4wr4+VP8AI+gEOdwu80z4S
         vZEw==
X-Gm-Message-State: AOJu0Yxac53tLPvIxA59+Pbvie6kvRLAndx9NSDy0axYJBvXYv0kKsO0
	NQuyy/W3QkvyZb+mcobhuHXD4FFtdU5uKA==
X-Google-Smtp-Source: AGHT+IEQsSRheGxkkY3GrjQPlqIAGXYcg8bZfwQ+m0y791JrsvBZnusA7jjqQpqLw7bCQ2jIeJ0r6g==
X-Received: by 2002:a17:906:d9c7:b0:a27:5343:d3e8 with SMTP id qk7-20020a170906d9c700b00a275343d3e8mr1565354ejb.97.1704717177663;
        Mon, 08 Jan 2024 04:32:57 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:32 +0100
Subject: [PATCH 15/18] clk: qcom: videocc-sm8250: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-15-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=1037;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2KXDcxNc+90aqcYluynodpAmNWUtQOGZRI7j2BxqGMQ=;
 b=WN9XeTGGuiUfbvj4nBcDQjejD3CIJUS6NiBRUbn2FemiDEACbGE4J96REq+UinjEvvWivtYQu
 602fsQTEwZlDE93JNX8sWGYvvf9MY83qr1tEbqLarWRc2WKK42w+u6U
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index ad46c4014a40..51b9816ec458 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -323,10 +323,10 @@ static struct clk_regmap *video_cc_sm8250_clocks[] = {
 static const struct qcom_reset_map video_cc_sm8250_resets[] = {
 	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
 	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
 	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
 };
 

-- 
2.43.0

