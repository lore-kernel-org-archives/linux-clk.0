Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECFF37F8DC
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350178; cv=none; b=WR+p06VWqPZ/DzTtwAi7D45DtKzr6bbH/qXtcxsAPOxXDKOqHupnWuI7Jgq2maApU/X8kg7/mdWwwCYN1UkoYyXIPO+eNbxOdwqTWI0czMXzCLnj80LXefg22fLoZhdhVnzFi8cdQFsimc3RS5qt8gTZOx12C22LXYO5Y5zZmYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350178; c=relaxed/simple;
	bh=AtEZcNEb3ClBSLeLofH89FOOEW3yyy4sU/gIpI1RXy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JsAdBvEgsyA721GTulw0Wbd8y1+VC7zugkiSaUMWHAwW0IdXBQrR5DrExPTFxXmJGJPas/hFRnlgrD8M9i29hXlxHtRqCy3BSDZALDM/HobqJp56wZKJglidGuMSVOVsMIjuOmeEDJCBxahyE3VQlctbuZ5r26u/dJz0Zrd9oCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKnJy0lj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKnJy0lj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so22907485e9.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350173; x=1783954973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHOTidNjNLnwwKoun3jL+S03jKuXKaLpyrO3E7uk78g=;
        b=XKnJy0ljemOmuZXnjtfHgiKoF8mHh7e8RkevNqlAMCMRPBoc5wqgy1WeZlNENz3/WP
         CHbBqIXvm4Qo4JpdCfqlu5BR4HVZDACVrdRLwtJUWptBg8EEdo5ni1BHUcMyL5EV8uR3
         GJN8uKoFQwv74iHHzRlZlwQ1EFcpXW1VVHYCFXqoPKBol+NzUQ7s5aIT+mQwczUlJ0Hi
         gbR+u5papDw9WNy0qAFlKVm5Rlm4XTMK/ZLnY+bPGQW+Liq0J9A+qrzV6wrZ1DgVvPpM
         FdJGhnaYBQNxCiBF8y2Ajz6dK4AsK8KSIfTgmhzCnH8yG2DCoAvwtEzxrLemEAh0f7pV
         btoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350173; x=1783954973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHOTidNjNLnwwKoun3jL+S03jKuXKaLpyrO3E7uk78g=;
        b=ibGU7a2vDTNa+u9J83Y9UsjIW/zFDBUhh3JWryiVMWq5R2LnqpCTdH9QduQ/3b+7u/
         S6Zb7qcF8BrKN98L1nN0CXRfYQAzI+0uWNkfaGJ74qntsi6plHP0Wn+YC7Mw9er6ULWG
         ML2S/ISbJf/TpHgvZLzsrS2uYVn86WgZFLjXK+E6HBv6//fPuz8f6W/2v2x31Y3xNOS1
         9MTc5b/jrq4pKm4QOEcFYnSsAvDk5Igy4NJcvO5rQCJ4O54UDm4V3uJutBRQcJBZ/HBy
         beyrYp0nSzYkZHBPlDutF2ZMqWibKpOC4E1UFvzgzqdVBcvnRXEpQpM6K8Q+j5Twuqo0
         vMWA==
X-Forwarded-Encrypted: i=1; AHgh+Rrr7LeRvKJk0NRIPcmoz6GMWB6XvQhl98rHu+eHCwKnpYOrxJx64VA4B1ykGUS5U4xzxbpKiN+FPZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+tc/LfQOpfoIddEnFrZzKiXelw3mJOQycPdMDMj+5+SgOhSa
	AAmQNRxADw1q6n+kn/dV62Y0Y50SIEqwMSX3lAqIhmHPK1dsIWo+Cn0GpD+ExLG13GA=
X-Gm-Gg: AfdE7cmn50qYdMG2UUt/e4T9/0Ee7hUU12XSHMqUp0OpLhkU5uyRgk3mM/rmiMkARQr
	EwIvcX32TdywvHc4e4paJlW5m+ppFSR5Dq2YgLoWH4IoX1Fz6Su2Fg8mfWCLmTNjZwapJnpYxAv
	DywWO3nW8C0Lz901RSOre2fdNovBz0qxb0eK5z+qfxbhbEiKNVaAg9p8trz/umwM3phDGw2kumz
	vXpAjtDRzL4+rJje5UBhgWNqDTdy1Hjoh4bOqd3+UXNxiAU7FtK6z90aDeDctiFCY9LrNbXoXgg
	Mrm536GxylOzyX/C/nf/VG5k0Wwb446UGGmmVHJeC7WRGdVwoVVHS2fQmI0LOsuJFSw8rxXrLQF
	smmerNWKE4XDGznKh03hSt8i00rDosTgHscNvKSf3h0PKdCSBbK6U71iAAjdCrVC7hM+/JYtIRa
	qhCUL/5M0OLY5k7OxfDi7ahhOeNQ==
X-Received: by 2002:a05:600c:4e93:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493df0797a2mr9939925e9.34.1783350173321;
        Mon, 06 Jul 2026 08:02:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:09 +0200
Subject: [PATCH v2 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-2-745565101869@linaro.org>
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

MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..ffd7f14fcbaf 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1929,9 +1929,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
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
 			.ops = &clk_branch2_ops,

-- 
2.54.0

