Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7383630BA
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785527146; cv=none; b=DxEdPKy+/tqatCIaUhjhouRMGnbs8gKyiRBER3CTHm0EvquMeh3tsBgUllXMOSKTr39xdpHvcg8OkVwQRGsgiXgQ0clz2q7fD2Kp5bm4wkcWgHlOv5p7PABuw7I4LsXaF06HjuiOO9YYaqwtSasjo035btjlTybYs6jWjztAyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785527146; c=relaxed/simple;
	bh=8OWfZoIFlR5dKYOGv5BUszplGhEdpTZq3W6WL+lSVec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ysqkuyb0jmf93G0kwS2PKunrjUCRHDZMnG5zcf85l/PaMJmJ7MFV48C3IlB51md759mbdq32XqhHBqxBxcpFxLpsnX9XFv44x7j18aL09BDlxnXEe53GpzNNuXWc5kz+tCk/Gnu29wp+KKDqgzJ8vutmEy9H1+8ycW5LtxGnHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1OtCADz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEvFYXJl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1OtCADz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEvFYXJl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VId70X516640
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:45:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b0WP9UtSycGWgT0Cka3pRW
	gg9clGjXOFM9dlEI2iaWI=; b=e1OtCADzWgCbQDeTXK1uGrKnTo6gIPRGdjQDge
	cnG/yshPP7u0HGXDaOVwf3icsLn3c5aG4GjbPrYcaMw4sDkCeMhSjCaRKjOP3IIP
	mKnWFyeW2xqoo2Db7e1nIrooqS1ykCyfhYKDj7q1k3/UlHvKgdsoVzen/pDw2IPZ
	dAfQE7h52HUTqN3H0DX+Tl31QGARe7pXttNqH0lUHzgZ1ajtW4vGGSpkFrs0HSKS
	76KgB62mxsm1h4l8CxvpZBg54AOGqvZimgxJ0ZMlKGcANS/tbgvlYEtpLeyN1RkJ
	kJPevz/sqpSH5AVJtO0BVtpqn4n6yj8tSs7ouNlcZs25Q6Cg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frtyqj7wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 19:45:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dd87656d3so1854627a91.2
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785527142; x=1786131942; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b0WP9UtSycGWgT0Cka3pRWgg9clGjXOFM9dlEI2iaWI=;
        b=CEvFYXJlHMxIWz6OhVa7m07D+coiYzZOSFDhl8CjOoh7diWJzBuhUEr7cJygFXa/pF
         9zqFhl+W2ryozD67cd2ijbeIHtcT5wjBVKpVEOXFbgfWPiQNMtniJRtVVP43SS4OzH7K
         VDliF2mfUL3ayUyQIDg5EmDy+ptruy/TSewubyTV0vRzlAlymmB9lR0CliEGozDFUBAq
         mtFiqezoJxG+WP0ruT793VZIClzZ78YtjX3+iOhhXY2akLlu4nYBIPSWeEA2QvH0bi+E
         6rUcz2zS3C0+Yuk5hPTaW9tsPHds8WqOv9VdslPVTADqr2K4yrxdVdbYAXHnyo/1aO61
         E10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785527142; x=1786131942;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b0WP9UtSycGWgT0Cka3pRWgg9clGjXOFM9dlEI2iaWI=;
        b=cOgtgWqaHXee9DYFdFgrtNUn2Po1/xSXRtaUNGI3w+wOa3t0ijdorefF3gSeiJ7iRR
         FA0HXjnZua8omuJFHLDsmU7ECrLU1xcC0PPM29PtranEz17ysnFD900CzhLHc3+DQM75
         fhYBMvd8V9NERbGo7DHo2xxg0kVDsSmOOs3a8qas3R3UUT+vLTPvd9Dy//KB4hoLFIRE
         PzW0vxED+2eWdPL1XTFpJef3RFsJAX1cf+RyBwafCYvApmMaYPXiSu0PXL/+sUpGJngj
         DkAAsi1qUx0fCfIXaI/g1H4uHBSmdqnzL6n41hz2R0O6qNUqx5YKHAgb6tWTNQihfIR5
         NrhA==
X-Forwarded-Encrypted: i=1; AHgh+RqQ4+2I40nMp+6MC3lM+eysumioeLU7kJCb0Ag/PJ7OsNrBnUfvD6e4psQDvi5D1dgdkwD5wuPbpz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmoiTQ0hqfjhyhIEUfO0LZSvwe26ILFTal7J3qhdnqa7q91XiO
	p4NeIMhkgRjJTyH5TAwvaHzV0ilV7ikXayclP0eCadhSNGkSvgZEGzEIqz24Of49cZyiMs/vspx
	HqtYmCBr13Qi5MmGQ0oNcthyslopPVNs6iP4Vij7a66OSmPi5PFRvOE9RGoJrsgY=
X-Gm-Gg: AR+sD12xnYPaOlZbWRpEg9g+bPbYgkpemXWKl3IbPiNBxDPey+MZiwKbiOZuVXKJE8o
	jVFsHDpTS+jch6ZjDQbMa5Pkz1flbnRTGMGUDc6bBaJVo1iGn5KmxATt3q7W88JcL/Wzo6pIjY1
	89NdO24cUMZbcnLx/3zIgdL/gGofUeZ3aROjIPdOZEBLcFK8j5bnPS3tVWIDhMa2FkbcgWNnFyh
	knxjFlaZpFqKd/VQNwTzKqJpPQyFEAqbW0MlSFi9ko3lf7i0gOB88f+XcZ2552JsgTPHxoVmX6V
	WKsGGnJr+EkJRr1lo5bbJ5mPFdvrzD66i+EljwVg6NbvostLm3SS7N1fq9WxLv9udI17HJO5/n0
	xTbMRob9Hn66S2JgKAuYGcmGH60Z+X9A=
X-Received: by 2002:a05:6a21:920d:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c92a543d28mr1058849637.3.1785527141874;
        Fri, 31 Jul 2026 12:45:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:920d:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3c92a543d28mr1058816637.3.1785527141362;
        Fri, 31 Jul 2026 12:45:41 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddda5d9sm11489915eec.13.2026.07.31.12.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 12:45:40 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 01:15:07 +0530
Subject: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEL7bGoC/x2MWwqAIBAArxL73YKJPa8SfZittlAmChGEd0/6n
 IGZFxJFpgRT9UKkmxNfvkBTV2B27R0hb4VBCtmJXo5o9ImRb9Yew3Ggubxlh5YfpFavalBqFd0
 GpQ+Riv7f85LzBwOGvbtrAAAA
X-Change-ID: 20260729-cam-rivian-pll-config-fix-e5ab4844b06d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE1MCBTYWx0ZWRfX0HMpM+7mZTQA
 2eWPkP959yLysyX5wko02wCGxkmQWuJS976vZdKAJtcNajk9E/4Ks4efbV/ggcbhgR1CanM4diT
 tzs92KNvbp8e8Z0l3a9qO3riYSiMyh3/9iCSou0u/8NuvR474F5os0PR2dNmYlZxufNb4DvVBjG
 QmHn0VCZGxdO/EbxyjSxG5MqJnpJ9Q1CmirwQxyMljw9O+C1pGuldvoh/MJj+B4hDQHDhOghCH3
 y4f9fuGazzqVPV9whLKSaHhxRIlkUpGFF0t7HXHOcL2CEPYP1Vcnsc2daHWAfkzyT3acDBxkrWv
 o333rYY8JfBCO5ZJkVHud0I5lVZag1asy/vYsVP7LwLCy2TE5pZCNMC2ecql/ddfqTGy9ygfKVC
 NzId3t7gbIQDmTRZfKzEjMQkXHB/WkD8UM5gEGrzrn6TFU9yhTnY6O3W8RoSNf3CHVfJX9kwkHM
 lDH6CT7vdfc1Q29JA/Q==
X-Proofpoint-ORIG-GUID: VKkc5JfIVNOtkVTNpOtEDpPlPvIDVQDb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE1MCBTYWx0ZWRfX1O9rOztN1Zfy
 3kPZ73gZUSybXPkgSGo5IFZQgwokg8kvsWyz4LYq28BnfEkwy/84DVmpBTQlpeWklbsHVDGcneo
 6Q3Ri2gL5ntam0+RIAKFlF6k0hHfulg=
X-Authority-Analysis: v=2.4 cv=YaGNIQRf c=1 sm=1 tr=0 ts=6a6cfb67 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=orJqCwW2HSwFgp0icTcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: VKkc5JfIVNOtkVTNpOtEDpPlPvIDVQDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310150

clk_alpha_pll_write_config() in the PLL configure function skips writes
to PLL registers when the configured value is 0. However, hardware
requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
for a few rivian PLLs.

Add a clk_regs_configure() callback to ensure these rivian PLL registers
are correctly initialized on Glymur, SM8750, and Kaanapali platforms.

Fixes: 97255eedd690 ("clk: qcom: camcc-glymur: Add camera clock controller driver")
Fixes: f9580bafd39c ("clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC")
Fixes: 92aae35f667c ("clk: qcom: camcc: Add support for camera clock controller for Kaanapali")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 7 +++++++
 drivers/clk/qcom/cambistmclkcc-sm8750.c    | 7 +++++++
 drivers/clk/qcom/camcc-glymur.c            | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index c96e9196d908e5d20f24ecaf94393633f63b6ab6..b5bafc1e7d428567cfec1eaf3c044bfe90059151 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -394,11 +394,18 @@ static const struct regmap_config cam_bist_mclk_cc_kaanapali_regmap_config = {
 	.fast_io = true,
 };
 
+static void cam_bist_mclk_cc_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_write(regmap, 0x18, 0); /* CAM_BIST_MCLK_CC_PLL0_USER_CTL_U */
+	regmap_write(regmap, 0x28, 0); /* CAM_BIST_MCLK_CC_PLL0_CONFIG_CTL_U2 */
+}
+
 static const struct qcom_cc_driver_data cam_bist_mclk_cc_kaanapali_driver_data = {
 	.alpha_plls = cam_bist_mclk_cc_kaanapali_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_plls),
 	.clk_cbcrs = cam_bist_mclk_cc_kaanapali_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_kaanapali_critical_cbcrs),
+	.clk_regs_configure = cam_bist_mclk_cc_kaanapali_regs_configure,
 };
 
 static const struct qcom_cc_desc cam_bist_mclk_cc_kaanapali_desc = {
diff --git a/drivers/clk/qcom/cambistmclkcc-sm8750.c b/drivers/clk/qcom/cambistmclkcc-sm8750.c
index 69abb756c04f2afba45db2dd371ee12f7b4366e4..45788ddb9dcc62a7c5d8efe086a235a337a18a05 100644
--- a/drivers/clk/qcom/cambistmclkcc-sm8750.c
+++ b/drivers/clk/qcom/cambistmclkcc-sm8750.c
@@ -413,11 +413,18 @@ static const struct regmap_config cam_bist_mclk_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static void cam_bist_mclk_cc_sm8750_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_write(regmap, 0x18, 0); /* CAM_BIST_MCLK_CC_PLL0_USER_CTL_U */
+	regmap_write(regmap, 0x28, 0); /* CAM_BIST_MCLK_CC_PLL0_CONFIG_CTL_U2 */
+}
+
 static const struct qcom_cc_driver_data cam_bist_mclk_cc_sm8750_driver_data = {
 	.alpha_plls = cam_bist_mclk_cc_sm8750_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_plls),
 	.clk_cbcrs = cam_bist_mclk_cc_sm8750_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_bist_mclk_cc_sm8750_critical_cbcrs),
+	.clk_regs_configure = cam_bist_mclk_cc_sm8750_regs_configure,
 };
 
 static const struct qcom_cc_desc cam_bist_mclk_cc_sm8750_desc = {
diff --git a/drivers/clk/qcom/camcc-glymur.c b/drivers/clk/qcom/camcc-glymur.c
index 81c1e102b110e5baca82db42bb0479d8db28db1c..6d022bbd2ce2ef5a7040abc2d5efe806ea45f0d9 100644
--- a/drivers/clk/qcom/camcc-glymur.c
+++ b/drivers/clk/qcom/camcc-glymur.c
@@ -2235,11 +2235,18 @@ static const struct regmap_config cam_cc_glymur_regmap_config = {
 	.fast_io = true,
 };
 
+static void cam_cc_glymur_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_write(regmap, 0x2018, 0); /* CAM_CC_PLL2_PLL_USER_CTL_U */
+	regmap_write(regmap, 0x2028, 0); /* CAM_CC_PLL2_PLL_CONFIG_CTL_U2 */
+}
+
 static const struct qcom_cc_driver_data cam_cc_glymur_driver_data = {
 	.alpha_plls = cam_cc_glymur_plls,
 	.num_alpha_plls = ARRAY_SIZE(cam_cc_glymur_plls),
 	.clk_cbcrs = cam_cc_glymur_critical_cbcrs,
 	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_glymur_critical_cbcrs),
+	.clk_regs_configure = cam_cc_glymur_regs_configure,
 };
 
 static const struct qcom_cc_desc cam_cc_glymur_desc = {

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260729-cam-rivian-pll-config-fix-e5ab4844b06d

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

