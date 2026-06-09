Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3933F58B
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014522; cv=none; b=PuEkHhPmOfv8zOcdu2bcB614E5M/RfNhKjCnyKKfg6vOOtSve0QbL/l+5vLCvgAKUTlCfgc+FFXzMjxAap5aCeQvjzFUOsNw5FEq722hkgfZRvShf3PzX2C3VVAbNihGdH83iiQF4Lbn8PT1yoxFhvCS+mkhmgCa+xPsQZhCkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014522; c=relaxed/simple;
	bh=sV0VOlGASc3Xy2ajSqvXCZMafWxAmReEzI23gc91Xdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EyKIJU3Tj5vHCRT27p8DRHHW4YswU18zOA9VOXY8MAbIKA4iLTC2pmvfI0UBCQvup1JwXwRrzaGq5V/tSEb9mAn9u9d5kaOCFLNzDUPq6JWSCXVBNDbmoEJxAfPt7cFarsJUxGRfSi/VzIn3Bxg8lJs3/8xLvieB/43M3lDHf0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HgUYKcYi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HgUYKcYi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso47672465e9.1
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014519; x=1781619319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruS6RTBjxVHuZPL4Ne2Tr/Gv3lV+oHaTmX1GUMR3Q3A=;
        b=HgUYKcYiDYSUs2oWOFKWpiWeEfZ9i9ZkJKhPQ/hqSJRmDeTGMX2EBW60GJq46lCBu5
         TWFaHlWpWhm+rlpyItAY7X2C1MyJjh2S8h1yuLlUVjDIi+uEuwR50tN+7Tp0WluaS2hV
         HC1LvjfhLK1dnMLzz8iS1vtUDRwYOwcg/ck33epBPOrm9E8IoVTQxCB2uKPRd1RAE/h+
         q6DvWa9SFnhqcwNv7cuaKm8lWYYorE6UvCjdO6bLff6Vey7kfhPpbn0bnUAicDDL4O+4
         B2l701Bt7xx5ixOenyswJ43n/BDQnCuZ7+xUUit9LCmnD/dq+xCfPXiasDCI/pdIw6m4
         aQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014519; x=1781619319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ruS6RTBjxVHuZPL4Ne2Tr/Gv3lV+oHaTmX1GUMR3Q3A=;
        b=lYS2CSI/lUt38j4tU7wriwZGhV1/08bYr7JZ8Tshxswb3Nj4iM7lS+yNT7xNTj2jMR
         vew1ez4x7FmAuNqaHAl0o6QV1DG9UeMORiKNQYbdLCVNx8SY05S/21f2VU67sYbjgNwk
         sG03qJKBtfZgRMr4t5hWikrMkDgLO4fFAkoIMu06NEkM+HgfGpsAj7qmqFXQ4ehCc4ph
         9xWfcxy1GoNujAtIYjvjh0nFrx0E3iMvF2sh7530zmwDT50kZ0Ed65s8g9Q2fXrIrgxc
         7HbyCB+hP016Vi7ljyRTQZx7aNLJxeCpNDwzSba0MT3TWavxkG/Wry0VT34xoY1Ae3wI
         bRvg==
X-Forwarded-Encrypted: i=1; AFNElJ/ai0H4Z6ylo0xIjiWJxevUuRkGUbI8X4OJMcPYCcuWr1GPbvNVnFJAyruQdvyOXavemUmhx2T/ozM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZdsWFeigo9+yrVFNxzYbGz7nX94qNBkdaGtB7oz4R5rGcCCpt
	/BtAplSwi45i0PMfJSsVFP0iw1nIY89SaoZOEwBrUVPCfGFnhdfa1qye5c+NdmVSuVM=
X-Gm-Gg: Acq92OE+Km0Xu73BSOC+0ybbqO7RsvCLfhkiLjmTsc04HeBsljuudCEUSCTfEP4fQHN
	QTE5EzY+p08PALMcrXWpjn62u11iPTzFp+CRQE8pwJl+0xEpXDqH3QINUAL94LyBTgO9LrxWMj4
	fCynVFCBmp9/RZhx69bU+JHNxgVPHdanFMZS0jyjvFvcfnNhavn5tFgs1Mq61Zz4ZI+nLMmEyYZ
	hgH+9uyMyERWaYArs/kyUccZM/YXyIDS/ZeKfMBrvyP2Y23NUBRjz3Gehtyp4wYKbmpQ0wMaISS
	1NRM+I44+REq6Yve8M4+2TlUuMgUzSOpezhlhFkneufZM2LLGi9dqaydHlG4X2F0Lf3ZIOHKRQr
	4CmKTHnWFUdVcSecC247Aj9Po3qgg3xHlO5HdhyZJ/GdFXlO1Ldow6VMOrqs8+ym2l765arGCjF
	1bXlcHA3JQEJNYFd7oc+RR5kdGWYkWnx91gkC8jjhTgvjYddQ=
X-Received: by 2002:a05:600c:83c6:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-490c25fc0e1mr353524815e9.19.1781014518840;
        Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:39 +0200
Subject: [PATCH 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-3-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 07f1b78d737a..499e0fbbfab9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -790,9 +790,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0

