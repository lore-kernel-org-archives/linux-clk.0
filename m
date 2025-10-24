Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3AD288C22
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761279886; cv=none; b=L/ylOps4/CAZKHr+2T8J5fLyUDj+2jXCkd9coch2LGQyGC64Z6r39NK+PY5MIjiY0LnFeihqIlSvqyjr/bbdZA9NRS54JIn4pGXa/myTm5JqlyB/NKsLd7mrggGV4Fq8diLuy1/J043me1V/R011t5NnGivWfxOtWqx8eY7MUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761279886; c=relaxed/simple;
	bh=q1zNPpbPYWl8i8nB9vHp0/I2P8lqD1fLeEkyHobNBFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmA/bGifdZCKovlcTsn3mrB2S48VnlpzypWHAMaDCVyhcseyr/4WG9rNQ10uLjfS01hRJ63+/QsF9+Foii3xNGCWo/cLDqPs0ZdFpR3dZJynMxjj6naEJ29/B+7CH3pK7WDmD+m4mfJwmpCvrBROUEPOQbi8zj2kj7vNfwot8L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VDyxrD/k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VDyxrD/k"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3Fixh003946
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 04:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IKaH1U9CFsqzQ564a4PPEXgGEodmv8byZ6U+CXUHG4M=; b=VDyxrD/kMs/fJVT1
	YUzNfreFbrpuWzLl+fC2fkfD7TRvc0PUB/t9ft5sFq4WXLRGg73WbSRgWK053NHi
	/8s9JhUNW+sbebJDgEDyDjJMekTgSH2G3REUyMpUhLL6n5qqgpxf6CSISI1iilKg
	Z9wdMKeQy62VCcPqdAzHZSgVMvEfSgRqxoOTySg9IQxNsv+SsuOQX5q7WGOR1V1M
	Nqqt/6OXe2/6nreyalfIkT7I78Ktp1JuGIVhKBWN4t1htvwJjq5EIO5AJCAc4BgS
	CpaAL2SfLm0ZmAeUMmKxO/KsJr28lUnwN0d+EkGGQLXtB8rQ4r3zhvpm4ybwZ7Ry
	CFYE6g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gearjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Oct 2025 04:24:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5a013bc46dso1213262a12.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Oct 2025 21:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761279882; x=1761884682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKaH1U9CFsqzQ564a4PPEXgGEodmv8byZ6U+CXUHG4M=;
        b=d3H/jEuDJyx1zAxfnTf/d5rLYBP95SrXdhmCG0ZuhJM7A/p1XKvdLpbO7kjy4AzUZv
         lcAnjzUFXaUXHDo91p3prdZ3gLyZcwoMhtwZS2raPfB152d7FU+FUJsvsEzer+AWEU/m
         DFpbG399chc5d44uxLS1I6AX3TogIzrgdsbvJb8iYhMzULiBSrsSq8aiXeyudA6KEwvj
         GiDiogZJY5sq3PxUarQKnl30nM0ZqrPSesdtj+7n/tp8MvEmxdm/jXOb/AroC0WAd1pi
         oSclDSWgNz1+d09WqN3l1i5TAjuz5W8rhPt7Xs7BBwhNYPPeVaFQd6njQ9zsf3kAHbf4
         NzYg==
X-Forwarded-Encrypted: i=1; AJvYcCVg0wzZf+IPfXosL6TeD4gWxkUF79i+cYAjeB7LqajP8Dawj1OWGo6HZ6Pg129rgDi/cYlCfzyG7gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTM5/ycXWQg1K9p8ESAHGTVIjlgKJzJY7IqrqrP+NZoEwS5xf0
	/KMPU8PxTrx2VEqA7IjHysLCWaUJVPhQ2AKEYCem/lV3v6pOtAnD190IUHyGyvmxaCtZDcuUSX8
	wowgPZowwb/WzLTaXQuOxYCeAPbPqbuC10XlCCfkIPmcq79ueLJcVXvaenKlM4z8=
X-Gm-Gg: ASbGncv9UlT25Su9qdge69WNaGbL+FhhgPH5amQ1nS4aFHziY0gODmM0MWtL8vLBnGk
	X4Pj7M+ptlLVQ1rmd3NlCo2f1t2weeUW/yAzX48kLBYvGpDmHDOURbYXo57IaVU2UrloW1rJr2U
	FcvW4ze7ntLfBHRwfJsPgC9Lx5zKhZKQ91gqh2eppuX7PciGyLV7jNz+2ELFNK3b+5QmkzogvAT
	BZQcZctoDRYQl7S3iM5TSl2Ux9MtLB7jf3Y1+qSMipKk9eQjUDuLYcz3kVMTBh93q6Dr+YvwEax
	UAcXAYvX70Q204UzRj+4e8MGOK10EqmhEFxxei0qMyZQx/3tt/0OrPox0O3ZYrI9dBONf4Xjv3o
	A/fKWf7482r/kVoC8glpS1L8=
X-Received: by 2002:a17:902:c942:b0:293:623:3241 with SMTP id d9443c01a7336-293062336a1mr108197035ad.58.1761279881935;
        Thu, 23 Oct 2025 21:24:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1riNMFIcwIFmzhJ6jOazcTXihD/RIxAL6oNUPoK+MbnVob4/j9u9k2RmZMS6OkEv9bRNV5Q==
X-Received: by 2002:a17:902:c942:b0:293:623:3241 with SMTP id d9443c01a7336-293062336a1mr108196735ad.58.1761279881411;
        Thu, 23 Oct 2025 21:24:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfd0576sm40259805ad.67.2025.10.23.21.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 21:24:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 09:54:23 +0530
Subject: [PATCH v3 2/4] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-sm8750-videocc-v2-v3-2-6286bbda3c8e@oss.qualcomm.com>
References: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
In-Reply-To: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX55cPNmppvgQj
 s7raJKSsvw15HXPOUwHmYiaQvyJvsVS0XW5MaStWPWh1IVq9uRJeSfCg6ZKW0heLNnHRMO4hkZY
 xHkMIDHS4ZG5/3VcHg67x48AhDJbfy74W0lgT7R3mtXR8aO9E8JomRsMk1EA+5BwcyGzZMBnrgg
 fJFuJqBkZdknAXu8gsv23SXiW7u7Lq075iTB7RVgmGOsicMqxVBw/SaX2L2NFF5jpJHFTIknIyt
 GZtc9yH4IkeQuL47SFuL6ajt9B+W2cbQForKWbK9q5eevdkDC4/d58BwXLHw2QlRkDN9zxtq2I+
 K4DaeWRF+mHaeU+2hFPzOpg60UEQLhnlwt8SJJbrxDACPBSh3o8ObC1Ay45FZlFvAKs9uHGR3zu
 hGM1sEfOhwTFqKrkDMvSpI2iPljktw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68faff8b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NS9l2Nidr_7M3kv-azwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 3DDzSBhxN6yWV9dYGvbhIh_qLietrqCJ
X-Proofpoint-ORIG-GUID: 3DDzSBhxN6yWV9dYGvbhIh_qLietrqCJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

Add the newly introduced 'mem_enable_mask' to the memory control branch
clocks of ECPRI clock controller to align to the new mem_ops handling.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/ecpricc-qdu1000.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/ecpricc-qdu1000.c b/drivers/clk/qcom/ecpricc-qdu1000.c
index dbc11260479b6d25d52a7d00cfce78d4e35be224..c2a16616ed64508355a3d54557295cef24dfdf2f 100644
--- a/drivers/clk/qcom/ecpricc-qdu1000.c
+++ b/drivers/clk/qcom/ecpricc-qdu1000.c
@@ -920,6 +920,7 @@ static struct clk_branch ecpri_cc_eth_100g_c2c1_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x80b4,
@@ -943,6 +944,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x80bc,
@@ -966,6 +968,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_c2c_0_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_c2c_hm_macsec_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x80ac,
@@ -989,6 +992,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_c2c_hm_macsec_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_dbg_c2c_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x80d8,
@@ -1012,6 +1016,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_dbg_c2c_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_dbg_c2c_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x80e0,
@@ -1053,6 +1058,7 @@ static struct clk_branch ecpri_cc_eth_100g_dbg_c2c_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x800c,
@@ -1076,6 +1082,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x8014,
@@ -1099,6 +1106,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_2_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(2),
 	.mem_enable_ack_mask = BIT(2),
 	.branch = {
 		.halt_reg = 0x801c,
@@ -1122,6 +1130,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_0_hm_ff_3_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(3),
 	.mem_enable_ack_mask = BIT(3),
 	.branch = {
 		.halt_reg = 0x8024,
@@ -1163,6 +1172,7 @@ static struct clk_branch ecpri_cc_eth_100g_fh_0_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_0_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x8044,
@@ -1186,6 +1196,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_1_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x804c,
@@ -1209,6 +1220,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_2_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(2),
 	.mem_enable_ack_mask = BIT(2),
 	.branch = {
 		.halt_reg = 0x8054,
@@ -1232,6 +1244,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_1_hm_ff_3_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(3),
 	.mem_enable_ack_mask = BIT(3),
 	.branch = {
 		.halt_reg = 0x805c,
@@ -1273,6 +1286,7 @@ static struct clk_branch ecpri_cc_eth_100g_fh_1_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_0_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(0),
 	.mem_enable_ack_mask = BIT(0),
 	.branch = {
 		.halt_reg = 0x807c,
@@ -1296,6 +1310,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_1_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(1),
 	.mem_enable_ack_mask = BIT(1),
 	.branch = {
 		.halt_reg = 0x8084,
@@ -1319,6 +1334,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_2_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(2),
 	.mem_enable_ack_mask = BIT(2),
 	.branch = {
 		.halt_reg = 0x808c,
@@ -1342,6 +1358,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_2_hm_ff_3_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(3),
 	.mem_enable_ack_mask = BIT(3),
 	.branch = {
 		.halt_reg = 0x8094,
@@ -1383,6 +1400,7 @@ static struct clk_branch ecpri_cc_eth_100g_fh_2_udp_fifo_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_0_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x8004,
@@ -1406,6 +1424,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_0_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_1_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x803c,
@@ -1429,6 +1448,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_1_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_2_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(4),
 	.mem_enable_ack_mask = BIT(4),
 	.branch = {
 		.halt_reg = 0x8074,
@@ -1452,6 +1472,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_fh_macsec_2_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_c2c_hm_ref_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x80c4,
@@ -1475,6 +1496,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_c2c_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_dbg_c2c_hm_ref_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x80e8,
@@ -1498,6 +1520,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_dbg_c2c_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh0_hm_ref_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x802c,
@@ -1521,6 +1544,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh0_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh1_hm_ref_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841c,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x8064,
@@ -1544,6 +1568,7 @@ static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh1_hm_ref_clk = {
 static struct clk_mem_branch ecpri_cc_eth_100g_mac_fh2_hm_ref_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(5),
 	.mem_enable_ack_mask = BIT(5),
 	.branch = {
 		.halt_reg = 0x809c,
@@ -1603,6 +1628,7 @@ static struct clk_branch ecpri_cc_eth_dbg_noc_axi_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_0_ock_sram_clk = {
 	.mem_enable_reg = 0x8404,
 	.mem_ack_reg = 0x8418,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd140,
@@ -1621,6 +1647,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_0_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_1_ock_sram_clk = {
 	.mem_enable_reg = 0x8408,
 	.mem_ack_reg = 0x841C,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd148,
@@ -1639,6 +1666,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_1_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_2_ock_sram_clk = {
 	.mem_enable_reg = 0x840c,
 	.mem_ack_reg = 0x8420,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd150,
@@ -1657,6 +1685,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_2_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_3_ock_sram_clk = {
 	.mem_enable_reg = 0x8410,
 	.mem_ack_reg = 0x8424,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd158,
@@ -1675,6 +1704,7 @@ static struct clk_mem_branch ecpri_cc_eth_phy_3_ock_sram_clk = {
 static struct clk_mem_branch ecpri_cc_eth_phy_4_ock_sram_clk = {
 	.mem_enable_reg = 0x8414,
 	.mem_ack_reg = 0x8428,
+	.mem_enable_mask = BIT(6),
 	.mem_enable_ack_mask = BIT(6),
 	.branch = {
 		.halt_reg = 0xd160,

-- 
2.34.1

