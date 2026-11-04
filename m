Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793768921;
	b=ikVJy5cxC+boVsdzDphSwYrDcA/u5/yLgW5l96UPEEaj6LUjXPpbDKEQzFA6FS2Kms3t
	 68UWCsUkWF4vnoCUjpuCHXBnSVpwDPxf7v/XnSX3WM9YzwqVLL/moZl+DIPjUWkGcw8dQ
	 DGRaT0/cs41t/LoZFqCY/8VKtyvTxYCoCpbcKbQcDwM+Y3kcVYjSFiUZF4fZR6Kh8WkTW
	 PJKfzrDxkWmqA7BALVBOf/mxns4UjCNyhxt9xO3awZ9/rbCkrgTqrs/HL+NmE7kDzgKO9
	 ivw7j6gcYQ9io5PMY2ILDQHLXebBjpAgBS95ULaYB0XmELQnl1+qbJk4QI0BYjgJf8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793768921;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
	b=wzgdqKQda8oPXfPE3UGiKa3IwoqQqhGQVnfccdZaI+0AL7SdBdgUci07lMBAvyRcMED6
	 vJpdk5fr+71WevHPQc2oJjRI7QG8UsfjpH2ENLqj/cEpNUasoqvzu3s/dFEVGCBjHuHkz
	 +DWhytU2B8OBB8lFTkcFhNBJ5xt3dfRpGOJ637dPGAVI0+y706WGGUfj6QtOuvdeA3ZOX
	 b5i5NKIRf7DuM9lWaviLVQULz3EU/7W8YwTEWcKcrwHMvAqFi45ZGXYU8dDJOxx/PjkHg
	 a7w+PsbsEmo/jBDLnQn4AgiCzpvNO/7rk1efKWDSZNBI1LQf+/lDjpreOn6RAX/N+WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dApBqP/z";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bd9NGKhE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D50606A326
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 05:08:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04D50606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dApBqP/z;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bd9NGKhE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40R1rs1248004
	for <linux-clk@vger.kernel.org>; Wed, 4 Nov 2026 05:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=; b=dApBqP/zi35tWyBL
	GnwmcjMiUGY9Ml/e2dUMzlQdO6JiAx7f4Ia7kPSN3Twv3LhKRhMh0fYyGoyTQjjk
	NVrc5yOLsHFbIRUsQNHrkxuS0SntNVgpAYlq8hAV/mE1atV2xGJIOWMHB9i7MlLB
	0d3I2NDaZdEw9uj3PyUi+f3CfMthwPv/U90HJIaN34EDeTVH7KEy3EqgyrYK5rV4
	9Thwyx6iHTKrlnTrlXKBMR1DyLOafcKeVTiXfvxi9UNGHgEubnxBp1IBVQTNSKgO
	2hKuWvApNqeDRR+Ou0z9YApcWGvn0E07eJtHd2nzuKdukXb3hA0cjvxTjfJraUw3
	iKBQKQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv9m5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 05:08:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso423087a91.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 21:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793768918; x=1794373718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
        b=Bd9NGKhEcppd7kWKWohbJngaUbDTKHtWzUjVD17hiD3+3ShaJpSM/0H2lLCVS0iJw4
         81TNf1NuJzjCtv4VhAT08/PIgk4L133+yzyNoHYCzWNS1NvjWIelYXmKNJJ/ciuHaCy1
         4zVDYMOVdc17/cgKP6vTG02GEUSqry66t/q7k/6M5Sp1ij2d84IC82uG0uKlyeRZeBX/
         yexMbxt6NmhLKPqR6XA97DY1IYdw4pm+VJjQpbpzNgtjl9lF5N0F45v64F8nuc+9frYh
         PWUIBHW93fIE4epsTWV8P1J2NDexnwhIJy1owZbq+nji7rvGQnf8MuLwV06KN0LzFV8C
         o3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793768918; x=1794373718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXf60khD4xm4ghWC2I5fQ6xv/vNYQy6l4tQ87H0eYaM=;
        b=qi6Os0m/eP4NI3hhppZxO4ZZHYKredruqavGEpggFdVG8ld8LdI4Q4+vvhG6+qhCDT
         joxFHDh/4uKpWsNwJqYoj4DHvvGFHRVJ7IuHRdigBw1huzu4agTodyugK1s0zySWbJ6s
         so7NCBW4akvYt46GQXHDJ5bruGFWi3oHUJjkiOItaT1TTu/7XBl6HKHBV4b0GItn9vj0
         3vnIbnedDrO/UkCQLtaB6edH79RRTb5/5UHK65n6ePAZsfsDjjRl//wJixoAsqq44Wli
         QXdt7S0ZLO0SoDe2yfDK5+HZA2H29EyaLMu5ho0DZgcwLlmJltVAE2cRjorV5a9KQPTn
         L4vg==
X-Forwarded-Encrypted: i=1; AKwUvBzOXK35UCWsTb3CCKKLEkv8xsx4U2AfbZvJq3E334WPC24EdY5cDLomn2ox7iY33FEIeqWHtpA7G00=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xf6GsbNRnO+emr1dzwb+UStIEhYv5cWdzOtbsJ5yWE03qOOFe
	4yEukh+Oe8J5ThXXa+PtSeLRoo39xQHZrH3H8c3qthLOCuTGU15k7DMzx6Q0LmaZujlXgxAR2eG
	ogzVQSch8y1DHRBiJ2UBA7beXGctTrv0KBc4+2xKtk7K0CLw/pJzUW7OuQhLmWBU=
X-Gm-Gg: AYBFou31CSd0bTpuzPCvxanK3maxIQ5wNPZasSkqwlfAQm43uJlEiAbY9X0HXaUd/Ey
	OhrTq4Ds/5kVPCBn6QQCXLchopusGcTwaMzZPHHRCS7xMtdQ6zsSyaWAbpIS5dZEqFBUfEaeV+j
	E8CK3BNxw0FpG11BdFM49IKLU2/C5n29p4OGRBlXjyF+coyLbteh4jdxrQW+Mj0bBf+ljP260tv
	Z/uciJxndbXi/SblPLD9GqYdsImDr+DHTEFhYyiyuunyzjo2ZqN2/3YsxkNBe+qvTCuFX1zGV62
	12BlDuyeAJ5TxIIshTS/TSkX8OeeiDOLKTr8cwW4fd/5dLjNiMIATLOcFUUOzjSLnzp0JpqR4lW
	ncnmvDfMeVgcHorwHTBLS+tLD5J4ApDp5pTPj4vzLiuU/i3NnKrCN2+svhd+9t15uedzQSQPJE1
	sRa/g=
X-Received: by 2002:a17:90b:2891:b0:3ac:a11a:7c8d with SMTP id 98e67ed59e1d1-3ae897d5fb3mr11245272a91.59.1793768918368;
        Tue, 03 Nov 2026 21:08:38 -0800 (PST)
X-Received: by 2002:a17:90b:2891:b0:3ac:a11a:7c8d with SMTP id 98e67ed59e1d1-3ae897d5fb3mr11245255a91.59.1793768917849;
        Tue, 03 Nov 2026 21:08:37 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b095314e85sm1830242a91.15.2026.11.03.21.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:08:37 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 10:37:33 +0530
Subject: [PATCH v2 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-glymur-av1ecc-v2-1-7c25a73fe811@oss.qualcomm.com>
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeabdd7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4K9S_alWPkThguqFwX8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: cKFEd2AOge2klUN93RrcwbkWRaALWuGo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfX4nPKt3npQMaC
 hYuruzMVQaoG1Tapy5EDf2y7tSleYEpDOlIxYjOZ8ZqQrBmCxOpo2D2BnDODCs+TIf9ZTOVNMdd
 yk3oMDAde0gp8QvwNuiK9PAMaNO6M6A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMCBTYWx0ZWRfXw+ZEz6V1gLfv
 Yd++9TQyr9DMXIDJlYxBfIjFNzxKzANzL2esahf+zeNLxgL+PCOuM2dg6nZsDM+P1XGNsgX6TQU
 d8dRAsffLYpFpFENC/DTpufi1AfAeQmsahO3jw/dWk35VSuDEtUZXhwxcAoOHs0Yd+VN9zHv1MU
 /lnNhnXXXhWSLklGcinp51GJHv5Dddr44jjbj5hl/VP0xYRdUGaoEvgssCBuKy+Pm0toICkHiJ7
 2Jhg0JpJ3tCSigcHICb5txkqE0OgRkP3CfoFWa00DLdVk43sCkM1/SzZvY2ivlBSDL0jEADKbsi
 Yq3++cQ2YSsMO0btHZ9OKOGu5NWYG56XoIG3raQZzHMrUHtul6g9d9tTvZEEJZ6cpixjGs+FikD
 Ao9LPtSsTbI9f8yfQumppktUgMBh0pqZBSQi0TY2yaKfPljpIkt1E7ALOUdjfCWb1b3Oeoo3vMp
 PUE1RZieznWfnpROJFw==
X-Proofpoint-GUID: cKFEd2AOge2klUN93RrcwbkWRaALWuGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040020

The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
Hence remove their clock modelling and add them to the GCC critical
clock list.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
 1 file changed, 2 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..9418a9b2bbde4be8a28b6ba4405baa780de654e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -3373,21 +3373,6 @@ static struct clk_branch gcc_aggre_usb4_2_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_ahb_clk = {
-	.halt_reg = 0x9b02c,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x9b02c,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x9b02c,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_av1e_axi_clk = {
 	.halt_reg = 0x9b030,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -3403,19 +3388,6 @@ static struct clk_branch gcc_av1e_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_av1e_xo_clk = {
-	.halt_reg = 0x9b044,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x9b044,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_av1e_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_boot_rom_ahb_clk = {
 	.halt_reg = 0x34038,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -7915,9 +7887,7 @@ static struct clk_regmap *gcc_glymur_clocks[] = {
 	[GCC_AGGRE_USB4_0_AXI_CLK] = &gcc_aggre_usb4_0_axi_clk.clkr,
 	[GCC_AGGRE_USB4_1_AXI_CLK] = &gcc_aggre_usb4_1_axi_clk.clkr,
 	[GCC_AGGRE_USB4_2_AXI_CLK] = &gcc_aggre_usb4_2_axi_clk.clkr,
-	[GCC_AV1E_AHB_CLK] = &gcc_av1e_ahb_clk.clkr,
 	[GCC_AV1E_AXI_CLK] = &gcc_av1e_axi_clk.clkr,
-	[GCC_AV1E_XO_CLK] = &gcc_av1e_xo_clk.clkr,
 	[GCC_BOOT_ROM_AHB_CLK] = &gcc_boot_rom_ahb_clk.clkr,
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
@@ -8483,6 +8453,8 @@ static const u32 gcc_glymur_critical_cbcrs[] = {
 	0x32058, /* GCC_VIDEO_XO_CLK */
 	0x9b004, /* GCC_EVA_AHB_CLK */
 	0x9b024, /* GCC_EVA_XO_CLK */
+	0x9b02c, /* GCC_AV1E_AHB_CLK */
+	0x9b044, /* GCC_AV1E_XO_CLK */
 };
 
 static const struct regmap_config gcc_glymur_regmap_config = {

-- 
2.56.0

