Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34BD1DE882
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564499; cv=none; b=ZPtI+OJLURam0rIxCd3eRTf5a8d4GqpqHU0Uj1AVdVp/YVO0+yacFE/pViO5xsxF5QHNBH34iyS3NVWgyuwqzP8xH84D5fJ81ao8YPrv2nCYE9B+tgCZQsRY087kWAXB7aNlqN+BW/ZvxYnuCe3Zg2gmWB4LpX9g+w92NLGKqeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564499; c=relaxed/simple;
	bh=Z7++30TD1WmbfjieiAupUdh4f35xRHDtfmGwybMNOtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYQ8RQSLKMQVXoLMvWuPco/ZhCpI6seW65HHlTKBkhZi9yRtPzbqDB4am2A98LmoIz0FXCJhios4QkT6n9xep30cIbEVPz7i1GQOo0StQKx29uIfZ7tOjdenoc/WzpoTCyFJDee8as3HW0rclxQuI9TtrYLhu/qk21ZVJ0g+eGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=IoQ04YqQ; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="IoQ04YqQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738564495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BDOCwL8pLKC2TmvC1CWEJmLmPkxxpASjltOSZmJ9Ck4=;
	b=IoQ04YqQ4zV6NLZ22zmNVp7rXA5+Qhgs5gP968t5WPuxpJthM21mKrzOLtvgL/7cIzRLBx
	OI7dVI8aaBUnzgmtFmQwfmLTpKH3j9ev5lxwCN5DPlot+zOPtHWgIjJvro7GdvGsTj9Zkq
	ZSfBzZHVHvsnwy9LChMAVsNZ2xcTHTky+MAjalS+jZTkJWEAA/BAb28Yt8BEPK9c9TFPvU
	rBQEMEW3tvdSI7lwbk8MYrkoi9ylbJPjf8l4tpwH+Q2Y8uyFGDNQ+asb6URurKpyORgoZb
	W57CbYYlLFSl8p0pWCdxgmhDJaKUjhxpFcF5ozfcfOGSW5Q+tn9lNLvc6GX/Cg==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/3] clk: qcom: gcc-sdm660: Add missing SDCC block resets
Date: Mon,  3 Feb 2025 09:34:25 +0300
Message-ID: <20250203063427.358327-3-alexeymin@postmarketos.org>
In-Reply-To: <20250203063427.358327-1-alexeymin@postmarketos.org>
References: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This will allow linux to properly reset eMMC/SD blocks.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---

v3: dropped "Fixes:" tag since no user-observable bug is being fixed.

 drivers/clk/qcom/gcc-sdm660.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index df79298a1a25..01a76f1b5b4c 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2420,6 +2420,8 @@ static struct gdsc *gcc_sdm660_gdscs[] = {
 static const struct qcom_reset_map gcc_sdm660_resets[] = {
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x12000 },
 	[GCC_QUSB2PHY_SEC_BCR] = { 0x12004 },
+	[GCC_SDCC2_BCR] = { 0x14000 },
+	[GCC_SDCC1_BCR] = { 0x16000 },
 	[GCC_UFS_BCR] = { 0x75000 },
 	[GCC_USB3_DP_PHY_BCR] = { 0x50028 },
 	[GCC_USB3_PHY_BCR] = { 0x50020 },
-- 
2.45.3

