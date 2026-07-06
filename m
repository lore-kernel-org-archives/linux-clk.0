Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D9937F732
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350175; cv=none; b=lMPHdqxGhL2XHPqANHz86CA4suLEpx2ZGpDXwP+xfoAH2r4gCqv4jjemUmUgA7/ja98qfQZI2cLE5kd0pPZlzNuZLYRRN6b5I0kIW0uXfmgXRfbSoAax5T6aByqyI7FKwv+po/i4FGuslWTyv2pPn4t6o/i9uEhm8zvfw0DpnmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350175; c=relaxed/simple;
	bh=ddXLZ+HAKriga+ZifOzvmEJGEglXjZ9S0Udn0vu+zgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/ZYeAMz3srtNArUmql1uwHMTC2vASWsoMDxwzEe7A325A7+KUYjQXMly903EX6PnipbhuX7fj7CYclOKuDmp3bUmwna3yVBHen4uAK6XwKWVOx5q8jr13zZXWECi0Q7fcAUSylcLkAoyhMDiVm38rqDUPgN84PNx2l1xRI75lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w5IfcsvN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w5IfcsvN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso30579105e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350172; x=1783954972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eER6i8TYh3jl5VZ7OJH5TeeR2E0/0LIEAZOr3oq+xIc=;
        b=w5IfcsvNwg8EyotaJ/fXkXdxJUINvZzavp5qZ9LKR3T4tcZp4O2ifrePS4UvkQMYSN
         Zub43qy0vIQUAscmFyV6+qsiVV4hZNanKg/mMrok2UeJEVfBjAHlb61SGF+Gqez5dwmx
         rkVjHnh8YCfIu5ZXW6wYDQRtraEL2LsLOyltR/UytZllnyb1ORpJYoQuSx1b/cA2d6Zu
         blpCq86CG141YwDfUrvhYl9oKqQqYsxnJoR9/7WFBbn5yMqjuE7jM4iGqJvsxcrpF+a8
         yBMLJTI2LYNiMCqA2UNgyiCPRbBP8L/i/ESRfZXVEuOnGenBkvhvKDnLT5AAxQnRioHw
         9bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350172; x=1783954972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eER6i8TYh3jl5VZ7OJH5TeeR2E0/0LIEAZOr3oq+xIc=;
        b=gdPzHHJBudEanXAm2M5PgxpA+s3H3sY4s23lfbENnUBTxOZA6jsjD9mfm1KQn4SVeQ
         JeBz0qK/WY2sJO9KK/2Un3fAhAXZCT5GLRndralXfHDX6D13b4EvtJ4n/3AP3uIrciV6
         MqyXYDfNymf853SS0ygwQ6l1+/miPtHbShj6Yf0MlCCT8Oweilez9LRHHE5lq7AsEWBZ
         GamLhc6Pv3YQyXxnbNf3l5HcYvvYgZrEo9ofbnQVuQlLkYBOOMlCgN5jVxxvFwJOh82L
         jzVENHYZmMLzKTX1RMVF0PwtT99gLQ2XrYyW+esyyjm87EIEIkmSTmYF2jnnZWPDu925
         LBUQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+CZ5jnlAnq/bRk6i8nbgeQthjIDSL4oPb9Fpxu+hIQ340EZaR1wp8RBsqqDNYxr/yEiYRtaGD/PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlWQqngXDzPNlF5hrz1BSepiBDtuh1dYy8Hqmge7NvsVFXaMUD
	DPk9wA4lRUxAf+4l4slwXs3wX+9OX83616ztxgkbH0OBCc0FFBMtLdt8I+vBYnprEVY=
X-Gm-Gg: AfdE7cnXpAfyXsdrSuwPTHVGcCbf4FLCKT2OM2DGqnjriQ82/SfFGWGEoq/VQ7xdpOt
	mYc0xzWfF2vZCNDFEuPeL21EDWQpJeiak5Fp009rASbUIrJjC+OGMmsekLyR/SxFKM3CKyMjNN8
	aR5g1MuBbl/BDsm2dGs8alYdkyDt8K1iorYVSHvRWfx4m9sW12qUvU7trBwfe+m/m0anw/KqOkN
	ABV7OnxyrFv4VVJKkaLRuEKy1A3isrKxKhgMd2VYkst1e9pcRJngT8RTPNqbqzBVY12VqO2rkZu
	ZpFH+NgbsOmYedHr64Qea6wak8Bhb6+kiN0DxNwQrhpP5HbgGUHvNAv5pm1I91j4P+Oc4Swndsq
	etG5EZtbA1K8n2cMTF3pk2g9//kLrDPqdDz3nAfLF9zgx8iBddY2grtDhFLcR93K4OZ5O8DRLgo
	jABEUC45n3/hd1ThbGcPc5sh6HrQ==
X-Received: by 2002:a05:600c:c3dc:20b0:493:be36:94b3 with SMTP id 5b1f17b1804b1-493df08b968mr8675745e9.13.1783350172207;
        Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:51 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:08 +0200
Subject: [PATCH v2 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-1-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9c7c6b23ce32..e91406e6f527 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1589,9 +1589,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x01004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x01004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0

