Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01933D6FD
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014519; cv=none; b=rwjbQxjprhbJoc1qDeex0A58qiwAmp0vZdS0aaO1SVKzkpi+k2fLm9pi2SN54dF3N3l1TYlx5vXL5IcCpp5mtuGvjI85KInLzxxKqsCWR3Go0LY/Nn2my4pcXMDTp0bpxT2CqfUdXjJ8Bk9O9yfovNrhd82VpTyikXcsKpOtBqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014519; c=relaxed/simple;
	bh=mZo9IHY+dGSIyftD98TZHewljnUEbDQ2yVAJGk71Nyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocCXgmaoIboNwt3mjE+HU+RRH6rrlWHNWF3b9MEzUZhbOCw7pX82hQwyInhp4133w2LMG64c+IRmjjomNHFBANrsmLB6NmjCudvbDTMXtGebLOTXLax0XrBInY6XSX0T0BdSeNIrbHhfRpqKAkGNIbICOpC/np0UH7hwz9mrd0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFYZyzRO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFYZyzRO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so60519695e9.0
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014517; x=1781619317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/HePIOrQIFyMx3sPM3MSE/sDre9oA/XqoIphXPjo+I=;
        b=fFYZyzROElgGdyEEVmJ8/fpO218dSz5DOZjbujV7FkSPWgHGQzfAhx914xyTm/9L2V
         PBseuK9JyhTAN8thC4kA/bZcZ9D0UBZzZT+IzOMYjnCggqpnGAhQWZ1BYukXlj1SL/ky
         tvb7Z1KU2MX0LkJ9qaGJJILAqeLjrTKF9vev4BZuebPsGpAlybfl/a+aGWSWRezqX/dO
         5Jsy/reFfuBGM/0C/5LB+PskwEP7nVwSKfUr3/zFlf7wyGaDmATCf/APaFMWaID43l18
         zc8foXTUi+ot4e6TnMRLjSZpnh6HGhTySIle8fBGlBZq7PCdBCOYvF2BBfesBV7/SLhX
         SB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014517; x=1781619317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/HePIOrQIFyMx3sPM3MSE/sDre9oA/XqoIphXPjo+I=;
        b=q/dpAvVWc5CMs/nAMjt1lfWyhP9ScG7x6ToeSL4kOGI4N8jtVvrSVysjUeynjOwtFm
         llq8AnQGc1//vxabSKdzSRIHwx0uGBYb42cFphR9paNErXunteydQbUceLhYNViWpNy9
         6Wicc0oc1bLoqTNTDM/2A7kQ2I4O6zDHxjEmbIzeNgf9vNNzM1CFUG0brF6U+31yQOxB
         4NrNkY20575Zr10sU6zw8Xya/oPDHoPBLm9WVTsz0gO4uJjJPXzojd9bYjf8R4k2Ld2o
         r7WyIdl0vfHkEpAR5XmYzJjoBizhyYX7mP9XDqV6VEs3kIkBSrkgm/vuDF5VxDpfIlxj
         JTbw==
X-Forwarded-Encrypted: i=1; AFNElJ+TFMXAi9cUctNDhxKzkd77ElhFoM/aGzof3EBVKo2eXYf2NEJN6AuE8PgRqR54RGsmLtq1DVOllN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkRE3zvMCqguhr2FEAD99w+hSo1VOs64oRJ34kipyO2RYFsjw
	A9pokqmM5afLDc2/18hUoHKe59tk8eYTK025LUjnfS/hplQzH/NvC6VDiPnYR7dSmAo=
X-Gm-Gg: Acq92OE6G2N7xXFR+wl2IdXtQl6NHE3hS6xN/Zad4HzA1IzXcwLfpnELIOeq87+mO38
	iHYlI/2m/Av4N2SIUvwq6qTwby1fGknCGdxQlqnzPawVh/S+hfHzCbSF2s33z6hyh5Wmddi5xlz
	8wzNlIimaZJmvch39fw542WsjAPR6HwSdxBc2u8NP9kKwMgijfMkJ0WhmCocNfJboZ3rKpH/JqS
	W+zSHyVQG1X79GLmbIBqZrJRn3um0UYV9h3kfEi1tJH5xQC2c7snxN6zW2cjV8Z92M7kjOmX1mR
	3sxwlnZelYbiLr+p0hGg5QGiugnNceLznhXC3tp5NJP+9tk1Uc6nitjg+bECIRN4W0+l8z98Jlx
	MXZYBxsG91KE72+0BJ18ZLdPCEnLLxabOXYS/2Y7jo93k7lH6yUXRfLFdM9rYKvVbVRt7XitwWU
	fM6Folg7+bqd8h2noNnwdMAq32DBHhY3XkfisNSFgFAlbah/g=
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr318337035e9.29.1781014516562;
        Tue, 09 Jun 2026 07:15:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:15 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:37 +0200
Subject: [PATCH 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
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

According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
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

