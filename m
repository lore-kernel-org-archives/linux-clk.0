Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B5E5578D
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZvfrBL6"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so1886895a12.1
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717181; x=1705321981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK26HotwUpgahbJ9EX5x/C3bT14krI/fYq92tviseyE=;
        b=WZvfrBL6Ae9YuubkMjUU6Wv09BGnSh93kpR3MR58rxNpwcB+JUe/GPQJ7crZRfjqtX
         Vjj49pVg8QWqG05DAI4V8/x1bys8v8+e4vd+2Jeu7PViSazrbXIfHzcbSzZd9MwtE6i5
         UwbWy51tUVyNmjTO1qA2ru58U2VOYeJkZozOzEAO+kgTAWX9OVYxN7CloYcdeGeMjyAn
         JGsDdwiCiyqFxF7ypU/ady+hvLTFxGW991yIpDkar8YNT/EObVFGjzGhqHPbB0kg1d74
         UNe4HL+xwIpIrJ+v2xUc6rMDtWq+NMp4F3+vkd5gg7yyXfA0y09a9TDTGM59VnIPmIWQ
         HY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717181; x=1705321981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SK26HotwUpgahbJ9EX5x/C3bT14krI/fYq92tviseyE=;
        b=bOzHdSikE2JXJazsl5o+dnR3jAVgDYr/uNKp0MddCsboIU4QgYI0WjWev/5V2hCHFc
         6GcZ53m8fkRf63Ske0uSgf9PuBUfr4jFXgt7BuDRrymJANvA4YSTfOtbczVZ+wNvP0tQ
         B1dl4ZiHqkL/++RHeAPJ0NbNsxGXHxn9CIC9uUhLKgNROU+Vl+g/R0Phe0agXfk1IRUK
         ipNoNLHOf/a6Oz1f08/btQ6ORDf0fcMIlhiFI4SCWzASYORQZFaKp9yhQLZMrFX4pSQp
         ZJL7VBv2v3XnyE0Zx6SkXr7f27Px1zoIT4U85pqK9j1kdri41m36YXqHZHlSOx7r0HD2
         cSfw==
X-Gm-Message-State: AOJu0Yz4i3t6eABt06eKgIhn46fwHdWzNi1J0Hw9I7wVY4ihBNSt+2ba
	QEqKpdPF2Nl9cl96h98TV/uYqJCldSRCLA==
X-Google-Smtp-Source: AGHT+IFP5toUqJ2PsQh5sURXL5AJbn5HeLIcwq8psbcWs8Nx+5z7izOF90UKuJtQUmoOMEDusD4Jpw==
X-Received: by 2002:a17:906:c00c:b0:a28:27cd:966f with SMTP id e12-20020a170906c00c00b00a2827cd966fmr1365932ejz.66.1704717181156;
        Mon, 08 Jan 2024 04:33:01 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:33:00 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:34 +0100
Subject: [PATCH 17/18] clk: qcom: videocc-sm8450: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-17-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=986;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=feC9+GWvv8xnYn7InxxSn/5ZFRq5Aoh8gmZgqG+eDBw=;
 b=OPV3N3uzB/vrUgOyJfIOwt2UGKoUYpVGHHCkKZ+OpReIfDnf163UoQ4KTPgw/s9RjIpwPFhU4
 uO7lSiA4A73CXaZcJNFOfcwIDYDGpzGxS44UDPUUEk8dTeZf0putT0I
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

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

