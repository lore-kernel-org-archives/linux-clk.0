Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180146;
	b=eLsBW/5qrmjWXZtrofKizeHORjh7gqdVy4I2qG6+NZVi68ylJB93SyuscTFB5kOThX71
	 7mYFyhmM2zCbxa2ROXTYf1ReOiPm7RoifHlhQkB0ytneMFtDRS6J+DAKCbbdJweK8Lxsw
	 MeltwDBGeTDLthHaropzpCXIHc2g6Yx3omYGmt3Qtkz//UYHUtqpj4DwX6ghyV4FjBOF9
	 jHzWeHcD2bzMY266ItbJc5WnT3VhLiLfNqmJ5MsjLimiYcDo0cmvAXTzXEegAEg/D1Hgt
	 sukaOYPTTi5WQtPiFFTj026ePdlOuxtYoWO/WvlJA1k6EPLjHm+BdoZKw7e9RbRqgKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
	b=dkvlYDccx+9cZm3H3S1QHgjFl/VFpQbaKJ1NNZx1lNX27aCYSoqE/s/GdLvksqE4SQsG
	 6QOr2yPxBp/Yzu53vAzZFs12fWIIxsC6jSm9FBCqg0S+2YES6l/xy+7mR3cUpU+iYJtSc
	 SrKgawqjGkjs1n7pC5GTDB2TmELm+1p1Nx+OYu68LrOX5bZFm9cClBBk2s1KvdX9qPac8
	 3pL3RPQzSc+NTnTyDKHrmtwdBwRR3DSY44f0guznnIjMVQ3Uz7csW8Tr9rtY6sQ/N985g
	 7ZUgdGKg9Gn92ubOoasDVa8ImV+GwhjABmqwul066TcxgyceShAHx/ZBkZGF6VqZpag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hiruiy6K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0+7hSUx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3CA606A31A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3CA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hiruiy6K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A0+7hSUx
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Jw0U3892461
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hGs8USrteTCnFgTKJDdRh8
	wPVgKar+hqcdnXt1kAxFo=; b=Hiruiy6KYkekflFte1OntuldCqpqM7L/itqkxY
	CkeekEj9xGTeu5Grz0XlY0x2PEEId+Tp+m38AI1iVuR2p2k6ld6o/xPHiGnWfR6V
	35OrAoUB61bY3jaT6XFvqBe1KVJLgzi1L7kkiqdzvPNChguNKj4Eoky6FKSYnqpp
	2rAkDemEN7fygzAiusW9aeQtnM6DLCTQip9+LA+xOOuG+WqDT6LVepmOPLaSPBP0
	zCfcSWhwUmkkiBazRMV9xtbrj4qjZF6yQiZizFNR56XZ9j72kTi7eRmLHOp2AhjF
	xUffWjlseRnJB/VadQlqN6TsiShQy3TnuQm9C9/dKhggyHvw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91s2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:35:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso696823a91.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180145; x=1793784945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
        b=A0+7hSUxUfyJBF23Vhz199WgIwSJXxOI+Fq5eMfiqe5i5/6Z+ImDBQSRMbNJDZsUa+
         CPSDVykCAA5i05RpdF4WIKDk+TglnArkalpfDLFNRlNvdg3jHRyYL6GsQSZs38i7NreA
         pnn2tkFqGXmW9ySSmSAmpgYgQY4/khfViJYSXv+qeIuE4YCcwRcqETdvR/ef5jkL6A2c
         nQjWmrpkyluSrdjWj6hFeh2iHV8lU3LAfS2l/pPrnq3f0E0CO5SQW0y6DqJwTZdlmH79
         OE8xcKBSJHvvnp2OLmB8/42LnqNSbSWk8bXUFGmO5cwU6VfWYKNCCCaecFxwyJy2hY5P
         3E8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180145; x=1793784945;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hGs8USrteTCnFgTKJDdRh8wPVgKar+hqcdnXt1kAxFo=;
        b=UpPcsw730BPJin39QXlP27H5Wj7bK5hdxp4pSSb/o9/h28UpyCM9jTfN1Ni/DYYSfW
         WNIVuGGWa0+sN4uMu+IztkBVTd/tVT2QjjN6W4q2GLxzRxrKsJ9Zsu9c8b3nZfRzO1P+
         0Ne7lKqVxBQjg7aN6LXyFEyMAgTwXmcvp+7bxzp4zUNnNdkPTYPYCilwKfKCas+XsreN
         FwQwMKXiGW+khHkU0zfPlHMLjJebNgcqLkZYb7Lv0JM35g/BpmbSfnzrX9PaWtJrUwbu
         ilSin0GTlvZkaQPKk9RSXoWyqPWLZWbbvmM5TvRzGEFXhClJiuyAKDTIbaJ0+/d6aMRC
         VMeg==
X-Forwarded-Encrypted: i=1; AKwUvBwozJg3v2dZhb8gFiOkhn2YluNR2iY46abYsrpgdd6iJa6cjFkpH074kilZo66QTKnyZIiFojXtMjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLouYgcS6iUDnjUr3H/l8thE/pNtc4GcskqNAgJuufpBbvJWj8+
	R+3veVQlAUV9uWHgD5+2emNH7LYraF3mxLMS0xgjjkCTRcZzu6QsYtRUNhn9eA9SArcMbJgCyP2
	HXbZyK/bqBWsTu0mUllKPrZ6JI1DiACkZKHP/qle3DQh6y9V6hRz3mvEW2NK/n1A=
X-Gm-Gg: AYBFou03BV//i4uek7HAmNQvpzDZqjJzLNhlz+mrCsvedtLy7ckkjA9MXJX3j4WthJO
	svZbZZDLUnn33f837tXX6sG7lWKW3lDGiAydOkPx8N3lvFwzH65IVhdInUIOPAHGCTRhs7Fdv1p
	09b7QxhtFDL7mnPAnl9iE9QtMNeC7A55CKNJEydtzMIE4fsXwsp9mnVBjx67tU/4dvsywvChHK3
	48i18fDaBLQuQCxxmMXE0Y8U+EqiUWArM9TBE/MnK6HxLoqBZvgmtVnugMROR84eGxmF1Mn6TCV
	PwHGrg/YelJI2lEgQxOj/VfHv/yHqYvJRu6wwr/60bYJETq/hsHB10ft5lTUZCOtzC19eiIJpIP
	J12dQOcdMqXFmEXl2uD2F3sF8XhLfwrC7RbJ7Ukn9nW+gRY9cfZ4J2HQ9xJecTon2gh8SP80c
X-Received: by 2002:a17:90b:2887:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ae580ff5a8mr1265551a91.27.1793180144507;
        Wed, 28 Oct 2026 02:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a8:92a3:8baa with SMTP id 98e67ed59e1d1-3ae580ff5a8mr1265536a91.27.1793180144058;
        Wed, 28 Oct 2026 02:35:44 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a5d3fccsm2255502a91.15.2026.10.28.02.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:35:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:05:32 +0530
Subject: [PATCH] clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs
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
Message-Id: <20261028-gcc_glymur_pcie-v1-1-a2163e1d2b9b@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOPB4WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyML3fTk5Pj0nMrc0qL4guTMVN0kY4tEA0tzA3Nz4xQloK6CotS0zAq
 widGxtbUAwWXGqmEAAAA=
X-Change-ID: 20261028-gcc_glymur_pcie-b38a0970773d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1c1f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h9jb8CZW5PYlqcvXSHoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX+sAyWibEl/UN
 YT1SKvA7/+zOwMEXA6K6Cm6G10DfHDV/F+CzKkVEX8lCA/Vs+3eohOrMtwOqu4FmGixS513smUc
 sdUXjeIXCA+qB+XeVF7oIdH7jKHVHlU=
X-Proofpoint-GUID: -mm1W2hurEIsDv6dsLmUxGuh4Op9k9Wn
X-Proofpoint-ORIG-GUID: -mm1W2hurEIsDv6dsLmUxGuh4Op9k9Wn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX+lP7Aal1K7XV
 RFtNeLermXeiqHhuO/JtneX78hY5A4DfrLuZ4xr/Qv+tGh5qV1FNr7UP4kp+UYF+Xpo9FP6r1Iu
 xZz9sEFwYDPnCx9JB0ywAnDJL2dxWDvqrXseQ7ZxoFAukLJqHobS7Wu6DAp1+jFGr6Udo8M6AVq
 VJwC4ADrxL2mNu+flkUoH1CravvmH1VOMRoZgsUwcoJM+LPkYHyCMh/BuNb2NhMlHUpVMWK64yH
 402fixHdYoFVZn/bxgT/bd2ZBFcrearF77+neKnMEKoZoFvdHuqa/phVwaao3a+ExX6b8klbfql
 29/HwLbKcGo0DrP1zp83bHm8jpaI+pmO4mhVZRSLMn51xOK9hHHjsgQWCdUQIfy+wFkcD2jBfbg
 7aztUK40WHEamXthwucgaiE2dcKI/70ZK2ggjetw9IuNggYCbf6ojP3aSO1EUJDpQoiSn+AeKA4
 6Zn2cFKQofPnLmh77Qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038

The PCIe GDSCs can be shared with other masters and should use the APCS
collapse-vote register when updating the power state.

This is also needed to disable power domains that boot firmware enabled
through the vote register.

Describe the collapse-vote register and mask for every PCIe and PCIe PHY
GDSC.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..11be8fa7c7de7c26cc3f69279cc3d5608bbb89a7 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7581,6 +7581,8 @@ static struct gdsc gcc_pcie_0_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(2),
 	.pd = {
 		.name = "gcc_pcie_0_tunnel_gdsc",
 	},
@@ -7593,6 +7595,8 @@ static struct gdsc gcc_pcie_1_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(1),
 	.pd = {
 		.name = "gcc_pcie_1_tunnel_gdsc",
 	},
@@ -7605,6 +7609,8 @@ static struct gdsc gcc_pcie_2_tunnel_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(3),
 	.pd = {
 		.name = "gcc_pcie_2_tunnel_gdsc",
 	},
@@ -7617,6 +7623,8 @@ static struct gdsc gcc_pcie_3a_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(4),
 	.pd = {
 		.name = "gcc_pcie_3a_gdsc",
 	},
@@ -7629,6 +7637,8 @@ static struct gdsc gcc_pcie_3a_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(5),
 	.pd = {
 		.name = "gcc_pcie_3a_phy_gdsc",
 	},
@@ -7641,6 +7651,8 @@ static struct gdsc gcc_pcie_3b_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(6),
 	.pd = {
 		.name = "gcc_pcie_3b_gdsc",
 	},
@@ -7653,6 +7665,8 @@ static struct gdsc gcc_pcie_3b_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(7),
 	.pd = {
 		.name = "gcc_pcie_3b_phy_gdsc",
 	},
@@ -7665,6 +7679,8 @@ static struct gdsc gcc_pcie_4_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(10),
 	.pd = {
 		.name = "gcc_pcie_4_gdsc",
 	},
@@ -7677,6 +7693,8 @@ static struct gdsc gcc_pcie_4_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(11),
 	.pd = {
 		.name = "gcc_pcie_4_phy_gdsc",
 	},
@@ -7689,6 +7707,8 @@ static struct gdsc gcc_pcie_5_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(8),
 	.pd = {
 		.name = "gcc_pcie_5_gdsc",
 	},
@@ -7701,6 +7721,8 @@ static struct gdsc gcc_pcie_5_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(9),
 	.pd = {
 		.name = "gcc_pcie_5_phy_gdsc",
 	},
@@ -7713,6 +7735,8 @@ static struct gdsc gcc_pcie_6_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0xf,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(12),
 	.pd = {
 		.name = "gcc_pcie_6_gdsc",
 	},
@@ -7725,6 +7749,8 @@ static struct gdsc gcc_pcie_6_phy_gdsc = {
 	.en_rest_wait_val = 0x2,
 	.en_few_wait_val = 0x2,
 	.clk_dis_wait_val = 0x2,
+	.collapse_ctrl = 0x6214c,
+	.collapse_mask = BIT(13),
 	.pd = {
 		.name = "gcc_pcie_6_phy_gdsc",
 	},

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-gcc_glymur_pcie-b38a0970773d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

