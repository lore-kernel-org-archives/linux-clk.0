Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6F18641
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245034; cv=none; b=EMeg/gBvUvOOpyQBfJExcF0Fyh05NSJDowNm4PCpQ6dmJprZEBCkpThnXjVKaRUrqCHd+LeeYRF/isUuGUvCUKVefHaywQmGU9dnBvSv5WCfy1Tg2SkKLYbmhMUQYQyq1GyWgfqdX9ngba7aXWwfxM3pX2p3Geisj4A+4hmQ4MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245034; c=relaxed/simple;
	bh=EXwKkMgBsd8MhiHSlPwnGXPooFCi9B6+ZF9m99buTKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guK0yz0U/vQwzMbcIadv8Eynh81DRvvyb+Oqq6sw9Yc2+seJfJZXzl7rtiX2gIOo/Z0csPnuWrKThLn3sdBk8DRdRutNmhf+2PTTLJciObY1XQhqaaiscPHTfbKkIkqxL88IW/EhaMhhKhjuiqJiZdRqzj7O0uv6Y0UIxsj2BB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcED3LfK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcED3LfK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3566c0309fso729925166b.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245031; x=1707849831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt7VV0Ge1sC3yLt62kaXgrxl4JcnOpSTrN15pKlZhq4=;
        b=zcED3LfKRNHgGI+xAuGGM/Rj52WvA4O9WC7K4+HYfPUbjg51eM3smZBuVD4JRY3vDM
         AWCGNwgtigG9YTcElv9ShdtwiF8DK7mPLi12TjRlyeIDxIRpIFVYgkzW6rfRriqiXs1x
         CQV5NNDIrg9Jmq3pob9YNOSK5jRJnYujKDQmaNHMcILCrYhQQnX5kvMXX6+v3Iqr9L9c
         Ce87c0/gyov013hOaHI3iaJafLuuRY/CjJhbWQFTtuyz3hQ30jU0gHg7qg0KzLPnmIy6
         9ScJfzBhUvuyAFHxcSxjBNc/rcf0WgA7f70RyLv7nVO37L5bqOHCjhwW2p1zezIkmrST
         y1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245031; x=1707849831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt7VV0Ge1sC3yLt62kaXgrxl4JcnOpSTrN15pKlZhq4=;
        b=KtQLEFH7+AZoOIUyIyE5HOy93u4ttaz/dWlFjzgK9PPW6cw83lK/L7oM8yEuJfjBZT
         VGOxN3/1cearZTWmsBKFlnYGSfeaow2LiKMLF4gf+rfKY1giaGVAjF2J8uvAZn+K1swH
         Fhz/qFIaGIvWyMcq0fMiJ0dZE7JxrGhNgjuoUedOEdPo28MtJhbfY7GY8c2nkQgHRwXJ
         y/E6nOt5fkbGcTpYqcbn9OHlz4KbtZB/drKYD8o88eSanJ9ywGH5N+OvBcbGOV1OA+Z3
         7KLIwuzc8k8iVuZeGPoNiR4QpNKV6VyMvQD4l0axYYs3C2ePvsS7FoPkPeVBi3MT9YSi
         4qog==
X-Gm-Message-State: AOJu0Ywj7xnJfZoB4oOh24I7lP6GMrBkNSpSvPSsxou/H/vrPGEGh9W/
	cfhgKgUmMujVyVN+P2mdws7+l23XiYfQyu3C2VsauQO30ihckCcBNUPZeRRorso=
X-Google-Smtp-Source: AGHT+IGLfPHIcth7V1P8PHbajyViGTDYG4qmty2wAY9eOATHRzTNHZtvs1iVdBf+F24UxgSsQgLcxg==
X-Received: by 2002:a17:906:191:b0:a38:53df:4c5d with SMTP id 17-20020a170906019100b00a3853df4c5dmr556223ejb.34.1707245031242;
        Tue, 06 Feb 2024 10:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVHrf5Y2GiDBabUY+/8vt4kdCuTVp1aDu+19FnW5BYlpFBCOQEcJdG9Ji5bo2AXr7jcBJYiBt3NNLv4roYU2UTqkXfgnZyiDIdlM62GxPp+gesRznRiJg5x5loFV3tkulS4hMb/UP6zMhwmDeXakAibCSsI1FMt2VPJJqo+h7foAZdUB0Qa/mAopZEFSh1SrXz2EtkMy325uRh79nvNMCIyRhnacAa8W2wZ1+n+QcHdVkeLm40ITmRtUQU9dxLWZot4d52YcH8GWJdSAzmrm9pONdyBIxlNKLdjV4UDZm+HKvt121wXxe4pCad1pUZCDSzXzm3m+EUnmtoX8jT/ZykkXMiiGZm0p6SoyvK/EDWBYBxjV2ziF4WrEILR21IWFf+oh9WXRNqPKmLzjHYgKBVOLYfgB/LX2BmAGnIeY4NnzUbdpZ+wxZIgrcZqRPtWaThYixyRX6U8
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:41 +0100
Subject: [PATCH v2 08/18] clk: qcom: gcc-sm7150: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-8-c37eba13b5ce@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1091;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EXwKkMgBsd8MhiHSlPwnGXPooFCi9B6+ZF9m99buTKM=;
 b=5v2USoyqmz+31QwL5rklkv0hk80+UpMpJDRSY6WqLzqv1L+b6x6kof5JtwD1gvITaGLk1Q1Bn
 UF2KxonNmu3DCGXVaEhn5mnHhFxkmTUBqcgxevSC2cboEDLKEmDAwDO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value was obtained by referencing the msm-4.14/19 driver, which uses a
single value for all platforms [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/blob/LA.UM.9.15.c26/msm/vidc/hfi_common.c?ref_type=heads#L3662-3663
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index d9983bb27475..7c5596331c30 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -2918,7 +2918,7 @@ static const struct qcom_reset_map gcc_sm7150_resets[] = {
 	[GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
 	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x26000 },
-	[GCC_VIDEO_AXI_CLK_BCR] = { 0xb01c, 2 },
+	[GCC_VIDEO_AXI_CLK_BCR] = { .reg = 0xb01c, .bit = 2, .udelay = 150 },
 };
 
 static const struct clk_rcg_dfs_data gcc_sm7150_dfs_desc[] = {

-- 
2.43.0

