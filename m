Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09D742BEA5
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784890530; cv=none; b=KqfjVpxMYlE9yuc27NXyOOxBuL79yi4J1fAWGMD3JONtnjgtYsG9DytPATnE7aN/oFH9Iaib1MghIpjdotaC1F0j/69nPtBPRIf0VEBIxdQ5rlSp1ZM4vr1943oU+ql0vncNVT5LwbKEFeMcNF5BQ7DIqm6WuIgWuyTjVHIIm5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784890530; c=relaxed/simple;
	bh=6/SrIvu511Ew8yNShOQH0A6hfHtttk9gaoPCPnFUUf4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c8FDFpkBBmy5JX4YaK/DXUSw5Em3p3IYiKowIKBDYT4AyRL1R0bxglDkmrRVszylFETryLEdtRTmUzArPs4Gl+7nL8vDVgqmr+QtX1gpuwumprpYLwPI/pmHe18k835zG2Ot1iI+SfyO8sNniEtRqdBG22CLHuGLM/bXcZp6fPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gw0sO2ap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bm9DubYW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gw0sO2ap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bm9DubYW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADeRN2629866
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sIBkVPY+a7xVOM4Mf5JfZsERfdUtWfBKPUsQLf4y5n4=; b=gw0sO2apOmjhL/hK
	XNE1gX0sK1SgPT6cWnLj9RmOEHChp8AyhpPfV5OTMDC+XwV7J9ES2+iCFxX/jjNc
	xGXPdSHB+Iin3ESZfjTvNHLWPOcfGw1XYWcxI5TDLiOApvuDOXCfaWKGi44U0Whs
	qQXETDMUnwg1qjnhC3orxOcB9q2WGSTfBkiWBrVmqYmeOWT4yvh0hXT5Mv+O1W1G
	r+0IL2Jq+4tWKpsyKWrBOKnG+HXL85xMZfO6TEDtkSczb2Snxe2Q8cYwFos3JCqA
	H+LA5QJFPqo5rn/Bkzuj/RnC2Hum4HBKW4fB8iJx1QUNslEombMQZF51HzMzPjjZ
	zIszGg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm1em98u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:55:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso4972935ad.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890527; x=1785495327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIBkVPY+a7xVOM4Mf5JfZsERfdUtWfBKPUsQLf4y5n4=;
        b=Bm9DubYW9QVinN7d97PqfdkYuELyeffVUruFK9e2kpJnTu3SLMxnkCMv1MunJy/kOY
         s1RxvQHnFRpfFZ1MlkHAt6oWmZ9PKro6KAqLvbdAuLDctdzdY3srKZLDLBf/8KotMSbB
         38l2Z+Zo+/Q6jkjb0EMwJdF+EEn3gY2aLkONtN0AKclJ7pRvlPlaVmEXdIts4ZYRV9YI
         xXJZ4O+rR/zqQlLlANnD41XxgKRzzrI2NTEi6XnS1naV/LV8OwUJTbvmks1MvJtMtX47
         OSY/WV41zED/TmC1CcejvAESXWRio4+0mJA0H48Tr4LGtm4zc2Q8SGLTgokLr9DuB6uv
         2Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890527; x=1785495327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIBkVPY+a7xVOM4Mf5JfZsERfdUtWfBKPUsQLf4y5n4=;
        b=moDQrNXva3l6CnqL9esY51Wg0rAsAwscyCGeg+JI93ejUw5Gf+PqokczTID/qADg8U
         XNfWfDGUC9wAsFM3bRQORw5TIAq6Ljc4zhkW2ZqbireVK5wehwLDUk6LG3YRTbFLGwpi
         WI8Qn2ufyKO743EtmKeFCEilbENXq0O8Ujn7ib4q7xb/JtIPForpjiqArLadLuIkgxho
         rm23yo9Y1SA9j6+fwVXAuCasmkM8YVz17DVCy5bJksYydjvvWHBD65nw0+tFWempmlE9
         VZGBy8XQuxfIPVpVubG7xc6AnjysLM3VNh8CqVph79zFFdrPK/sfG84RLd7r2AqA40yC
         /QZQ==
X-Forwarded-Encrypted: i=1; AHgh+RruotJg1DGl94mL+dlXMrYVxTh35NStg3jq9n2uBSq8dV5CiCwoPNU1sY2XbhR+18VNLUTK5Kys3zo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1btKUtBA4cm1wkrGLpyrZDFhv2yKa7RrV2E1uXuS3otSftSey
	vfHA6y54339H+iI2LWQytXdO7Qt/Y0sgI8bXco2cQeKMjTTqL29y0p6fgrE3q6oeRLdU7Wnyr3L
	9UO6tteamoATZA6K3QvAz+fiDTCH9tilUL6U/7kU4kO4b1EfzrNbp9Rm42bxAuMQ=
X-Gm-Gg: AR+sD10EprnRK/vp0C+Cq5Zh4/kuVs3eaE4TXKajT9GOliaXr/NO0QHh2YpFPEVcz3V
	2vmqUNTJwYTrXVIrLuEDje5BdcZCizD0UOnNdXOomniiv4IuoSD+peMY8tyX5jOj6x8GHVyQoLa
	6xc6utgyLo2lK4MotiMPbZkyASlFTTUeW1aFwQIqQrX/sej0ocTeS1YPYaZgQ+zDIRCMs0dulgu
	Z8m2M08xiBecsVp4meFIiRfPhdzmsEpSK9ZGCFD7Unvrfm+jXYQV3t/b549E0vjf/0fN7Rx7aAM
	3wGSym+Qfk+ZWR2QzaTKrRM8d7mMIlPbU4sMY1PiCq72sML7MEgfBYkR5rfa+F4G05XdWi0Dlxx
	k+nNAekvXblvh1ehviVXH3hlC
X-Received: by 2002:a17:903:2351:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2cfa71de7c3mr78543795ad.20.1784890527483;
        Fri, 24 Jul 2026 03:55:27 -0700 (PDT)
X-Received: by 2002:a17:903:2351:b0:2cf:906c:7d1 with SMTP id d9443c01a7336-2cfa71de7c3mr78543505ad.20.1784890527067;
        Fri, 24 Jul 2026 03:55:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f310644sm49314775ad.55.2026.07.24.03.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:55:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:25:06 +0530
Subject: [PATCH v3 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-nords_mm_v1-v3-2-32b45232217f@oss.qualcomm.com>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
In-Reply-To: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX4ABYKKVmEZvz
 bmDl69ZUcGQDDOoSNRgbpZ9YI2PaA1HfPrLPM3kjajLB//JyugXqTO/ZkazyerIEqTd2kj7CVOv
 WkrqKV1H1z8XDLTpj0WAuAYw6lJmbbA=
X-Authority-Analysis: v=2.4 cv=BIODalQG c=1 sm=1 tr=0 ts=6a6344a0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8 a=mEVXwad1GdBeBoogAroA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-ORIG-GUID: 5bsMZzihv8o93e55nglIVHJxRX_3oi8x
X-Proofpoint-GUID: 5bsMZzihv8o93e55nglIVHJxRX_3oi8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5OSBTYWx0ZWRfX5B+5/7z+Pooe
 bWQOdSC216J9exUB3XqftJvVkfD142MSB6p5sJdYRFgdHyDh+zuGUvp3qL4WWX6Xd1p2uYNyomr
 dCiLpWpdvwNFICP5xynV9cs6nEq/E8DryGCpvyEnacRy81vEwq+hAlhmREYilzGrTZNKptgrJFb
 A7znoHX3cL4O26PduH8diYUMncoX+wQ2PrHFJxfPDXJNWfwgaIjQFm2IrQkK8l0gpEUTRu1lvzv
 iIWJXD4I3QTTTuLQWM/iZxzbIPbfj3jyZujMit1aK59rQ0A0P1/OJR2EnsYKS3QNYwBk964Ti7b
 PWSrX9cqL5t4q2mHErZ27NTmv8R4JFd6yZJwqTnA21SaBnTvUDBJ3Dx/supNR1AbynxpfEYNWFD
 Qni0vti09of3e5cd1K5vmYI17dwRUrXFmEYLxx3uunC/ZMxfQLWp8l3V3izpN8mXv2+oYPfG2Y7
 mrvBVUleFfyyp42ZzOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240099

The GPU2 CFG clock must remain enabled for correct operation and
should not be exposed as a controllable clk_branch.

Remove the clk_branch and mark its CBCR as critical instead to
prevent unintended gating. This follows the same approach as
'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
Qualcomm CC drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 2e653ef0fe0e304f09ed354d5578fdbed9151d20..bc4d478d5606ad7478431573f98b62f6f9b7d9fb 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -952,21 +952,6 @@ static struct clk_branch ne_gcc_gp2_clk = {
 	},
 };
 
-static struct clk_branch ne_gcc_gpu_2_cfg_clk = {
-	.halt_reg = 0x34004,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x34004,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x34004,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "ne_gcc_gpu_2_cfg_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch ne_gcc_gpu_2_gpll0_clk_src = {
 	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
@@ -1817,7 +1802,6 @@ static struct clk_regmap *ne_gcc_nord_clocks[] = {
 	[NE_GCC_GPLL0] = &ne_gcc_gpll0.clkr,
 	[NE_GCC_GPLL0_OUT_EVEN] = &ne_gcc_gpll0_out_even.clkr,
 	[NE_GCC_GPLL2] = &ne_gcc_gpll2.clkr,
-	[NE_GCC_GPU_2_CFG_CLK] = &ne_gcc_gpu_2_cfg_clk.clkr,
 	[NE_GCC_GPU_2_GPLL0_CLK_SRC] = &ne_gcc_gpu_2_gpll0_clk_src.clkr,
 	[NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC] = &ne_gcc_gpu_2_gpll0_div_clk_src.clkr,
 	[NE_GCC_GPU_2_HSCNOC_GFX_CLK] = &ne_gcc_gpu_2_hscnoc_gfx_clk.clkr,
@@ -1946,10 +1930,16 @@ static void clk_nord_regs_configure(struct device *dev, struct regmap *regmap)
 	qcom_branch_set_force_mem_core(regmap, ne_gcc_ufs_phy_axi_clk, true);
 }
 
+static const u32 ne_gcc_nord_critical_cbcrs[] = {
+	0x34004, /* NE_GCC_GPU_2_CFG_CLK */
+};
+
 static const struct qcom_cc_driver_data ne_gcc_nord_driver_data = {
 	.dfs_rcgs = ne_gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(ne_gcc_nord_dfs_clocks),
 	.clk_regs_configure = clk_nord_regs_configure,
+	.clk_cbcrs = ne_gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(ne_gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc ne_gcc_nord_desc = {

-- 
2.34.1

