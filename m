Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABD84EE86F
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554607; cv=none; b=XlWMJgJku1qF6bX4NG2tF/1RvdmtqsWEZdSVNhoKPyBHXCJD/loidY+a9d81pw44iGEULuLGVXBvMBLakMHCiRlOw6iFiO5g2LTpUOo4q0jtiZcrYqVLSdMpviDVS0/yUY5sin7SVNCImLX3+uTt5LqmYt7jg6EMe9XWwmmy638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554607; c=relaxed/simple;
	bh=q6WsPo4Sb7dMV3C/p7zOVruxQdz3njTR2SW+b+HeblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4BTai/hptZvQu3kDuwyCzABtFZgkufp9606MIVCZUY5+1JwZJSmAbM3QLW8OOxs3S09u/GFhV8Z/QZXt9gRiv7jCGjdBdmXs7Ch3NKoX8EFgk4gW4agZB+2V8SOBTjVnz0DBNycXfPNtP2WkKdKTO9HWvPWtbis8GUOEIVeu9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNXqg58a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLuEhz+P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNXqg58a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLuEhz+P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qMF3377436
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pY8CUDObNwxHwovpcARsp1Pjr3/ZYxUlvUYEuzUE33g=; b=oNXqg58a/EOyAOuB
	rvx0QHK3rusC8/8LbkpceZ/5mNVKXRV7cP8gqIgpT8Dvw5uKgzypf8d6fonQA8JJ
	bU9Bd0UGBRYEu+Rr/ojKUniGBRcG4D89G32RM0CYAlBSq1iwtUvyzXX16jNjMCMY
	hkO8O5/ksU7alU7HLnWo9MSuOgYEwupR+6oC7dZd30pU1o5du+mQb7BCpWMOeHVD
	96SPCCOTb6Kv9SoxUc98BNtELVnCAmKXGxhmi9HQsJ2F7jEvZDAxIdYgHQ6IZhjM
	lGxaTNWyPi6D7WUEvhy6XimUxj1WP7d99YWXLU8RC46tCpuYs0+gRelLSg/F7Yca
	yLPi0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpanmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ae8e7e546so193960585a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554601; x=1790159401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pY8CUDObNwxHwovpcARsp1Pjr3/ZYxUlvUYEuzUE33g=;
        b=hLuEhz+PIhKQPAO+PNeoemtemk1LkPmBNtmbUVZHe20cNSRKWVYiS8VJQQtbx0jbq5
         KO2Rg4MZ03VAkEHZMt1b9PvvXu5ni9cNT2E5InsSXs+WdTzVgg2aYU8mlorMvqpZ2Q5d
         j2hDe9abe+JpAJKbElFP4DVL7PBciY4tKzAwqDnIVJFoADzjMzuTGwzJ/dhS0jSU2DJs
         qeRF33GfNV965+O6adXpbtOLAdJxqhjTDNCyLLsxoov9/FxxuT7mp6d7VizjFkGYjeMG
         RhXs3flldZUhzboIe0VaozPvNF2mm4oY4VqUQoXSRBBQO3emo6A0srnmPprPBfvppu5H
         vogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554601; x=1790159401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pY8CUDObNwxHwovpcARsp1Pjr3/ZYxUlvUYEuzUE33g=;
        b=TmIWzB1GLjInSxPTQPozq223Fkh2amNj0ubVenTHmynu5tdchZOLMOXchctzfVM7PM
         80k+IlrIgE0GTSGY/WLowxnJjrgGlvfQ1HN2vIVsL1zsGfmM74P/+iMNFmFBjWF98upn
         e33t2aBKe/Dsz0eaz6mgH++av5UMGfMt2eeq131vF8kT32yKtih2re9znRxOg/IdT8zz
         Brzv/mqzUtfiVyO3bkC1H3B6R1uy3XTz2otYaqC4ozQlHihoFeww/PA8y2ZzY73N6xc9
         Uiodd5lSYGHykcdAH9shYpqBM6gSDM4kOHByPQdcIsI37sdR7EAVd/MwWdxkh6svmFwR
         usrA==
X-Forwarded-Encrypted: i=1; AKwUvByxFv8u4SjgLilo/LSHvy1My0h38ZdRryqOQX1cTQk535mCqOTbuWZ/DIgOFljI0h/nHcG77NPKyRE=@vger.kernel.org
X-Gm-Message-State: AFuF++n6tOmRUgN/9B6Zmm8CSoiyIqTNr82afsJ0OxncjL9tvQD6Nf7f
	trVyyl8mylSFDGPq30k5rTA3h3RS7YBthkPhVPtml+emVE+RpuaTOxRqLYMwPLniLj/83vvOng5
	pLcilDur02jjmjb3/oAo11Pu8ii+LEcDMH0yQnv3RQGMC2w2B4TY7maZsQUo5v3I=
X-Gm-Gg: AYBFou0EijY+Xh6pAdUUOylSOnXF9QbO1jM4kn7ID91oJ/3X6RqwwuY6Ss5L2OH3NBq
	+D2tmZg7zSy6XS4++Dxs3+rjvoh4bfNA5F0rooCoc1W4l+JDaOFtU9pasCO7YVgKiWyMFLusHqE
	iGWKJNnV4Khwd0t8HeMjKevzBAxzgBIqV1JpTT5dU9DGMNgX7GQcphJqwtuMPp649oEW+mCvdu6
	6TUB5XT4Xmbn8AyPes7mLtoEhEThgmRVciLeFtFWCP2fCnSFHzBCBqoG8YU+lLjlkUfndZ9rDEZ
	K7yFCYqigbvstLm4hRq4jVMNoYWS2qUicNOX5ELDBjPsdZsj4edVA7nkXUXBu/pRQ0tN+7gIgvE
	rH2SiiBM=
X-Received: by 2002:a05:620a:6008:b0:923:7821:dc0d with SMTP id af79cd13be357-93bb787cce2mr310412685a.33.1789554601083;
        Wed, 16 Sep 2026 03:30:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6008:b0:923:7821:dc0d with SMTP id af79cd13be357-93bb787cce2mr310408985a.33.1789554600585;
        Wed, 16 Sep 2026 03:30:00 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:39 +0300
Subject: [PATCH 23/48] clk: qcom: gcc-sdx55: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-23-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2331;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=q6WsPo4Sb7dMV3C/p7zOVruxQdz3njTR2SW+b+HeblE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9h3El7ODq+vNnP0tl/+8g+kXxkCs6h3spem
 7aV51gpoyeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvYQAKCRAbX0TJAJUV
 VldwD/4m0Hwwxs8iai4qsYgB6V/DjyJTqFopMxAOJynBtlcbwL2wiElQG3ZCkQjou4uxgA1E0n2
 3cIOZw9qJeBGwdlJOg8DzJ2RY6MkV678lxmv72HRTFSNy4+hthAqoL7GbmoGeMfOS2qhldoB4R2
 CXqkgZ/VVZk3QPED+TiPBy+yjP7157Ft75ejcktgNhGnXTCwnEj3aj1IQ+qXdCOsw1m9ar6/Jhv
 ER1hgal1zrNGoXcFYtlXk0ZkRgpmKnHC099ECdhC2rw+Pm9v2R1tpFJ7ElhmzH9b59h+2+nE680
 S8bF6g7JHgH3Zh+XUzd850jQ7D3etEm9QW1zcScuLa/pB/vDHV9lxBDZgTCM95+F4fvfQ/eh6OT
 4cM55wBDjk6E5BFmm+IEVmUjvZAFxI7HlM7jYuNEk57oOApPaOr6tObh8zI3sI75FnbRAa7qvnm
 1YOkrVlUL/lmMbXfffYWh83kDlRIe98K+UaO+tMzByVbHP4v+6/NCTE0Wb+K3jR9CeOfITdvfRk
 3juu8vajoDiFNBROweIaD2GWTHMUuPADo6Cu6rDlFrypdodBB4kbsL4xJ8S5GoMUEgguXjpdCHM
 A0F19oyx8T74CkIcsNW2EE4UvoFFbu/+TmNgtERT4YgZzC0tOwP0D8aMqqO6z99CQ1ttdsWzYeC
 UD6mjgc63ArWQHw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0bJgzPAGKxXy
 LsB2vZkW26sUFVb3aAa70mdy2QgAb4gSOoMH6SvOVJj34p6WvbvcYsEKkEeXk5mOA/aHW0noPyb
 tYxqdX67qjxqBAXpMfakim9ryjfyTrQ=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa6faa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XazbkJH4cJJKrr3KiP8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: u9zNDA6HUgriIvaZcrFvhnIHIhvBkWtW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3CC8k4xJarBF
 QgTVeTJUuF/bakUf5xd3S5TX1tp4pY7940iqCs20JI+pWbIIJX/4FwOvbP7p84ItqehIx1oKpn/
 /WaGldFFJkLPQhXeGYflAGXukhLiRPjF1iUgZbsRxPvKWDN3Z264DN51YP47gmQXpkFQO3jHC8w
 xsR+HTComunCPHJQpv748lhNr5KC94MO6ES9/rAwlATydk4XUggH7FjMYIzezShi6e+le41Lpdg
 zchwZIGtc2JAnwx0f5wfIOEenjsjQuMSKLj7OvgCVN8PtCcgQ/c0Yy13yF+LWuRl66+EbZUyJ/k
 VNpuneGo/VN2XODr8YD7E/S7NXEQk6AGaWyRFJtS9yWOxLP7mdu6Q82FdNms7pZuPDzhgx6AAvA
 v5UPsILd1lhx2ybcsG990n+0R5Qc5IaSRnMBfju571ZWOyhPCBWqUvO04A/T6mzfZ7l0YNuMS6D
 mNuxYcIEKiyasLx1OJQ==
X-Proofpoint-GUID: u9zNDA6HUgriIvaZcrFvhnIHIhvBkWtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and move the register programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx55.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
index 84c507656e8f..7cede6d38747 100644
--- a/drivers/clk/qcom/gcc-sdx55.c
+++ b/drivers/clk/qcom/gcc-sdx55.c
@@ -1587,7 +1587,25 @@ static const struct regmap_config gcc_sdx55_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sdx55_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx55_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx55_driver_data = {
+	.clk_cbcrs = gcc_sdx55_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx55_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx55_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx55_desc = {
+	.driver_data = &gcc_sdx55_driver_data,
 	.config = &gcc_sdx55_regmap_config,
 	.clks = gcc_sdx55_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx55_clocks),
@@ -1605,18 +1623,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx55_match_table);
 
 static int gcc_sdx55_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx55_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx55_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx55_desc);
 }
 
 static struct platform_driver gcc_sdx55_driver = {

-- 
2.54.0

