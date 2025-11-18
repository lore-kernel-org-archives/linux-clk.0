Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EECA2FF179
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763450248; cv=none; b=ArFYDjcm/GW1B2zkmKXTg459BDYaNwMXXa3ckulL24Uyy18UwObCmUBRVySMq/g2j89CHH23dO5i071CT5+EyXLfABbRS8qJ2AdhFdOhwWwxn6Nf1AwGK0uuTH6tQutXoHWZz6Q7v8KIGfIbXxU6lGPE12Dhj/wqfggYHVSXcVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763450248; c=relaxed/simple;
	bh=zRgKFDJUuTq7V355fIIA7jBxUvBfxYi0ycH28juOmKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEUt2F+899eRjH43GtbZLFUebxc3xZ/YTDRBrXhwrNCoE4eELs8GSFwJEcnyRcf77zzZSPXT07lUdFxcaoSSw6NF+aqFEKuDUVpjk9Z7K6Elepc6xF734cn4BXbi4cyeurqSuhSu+O+rFbY849n4O4umUa6ZyaAPJbB81flaXMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=an6YFbn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dbg06CS9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="an6YFbn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dbg06CS9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5grmQ3916501
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dFsUYpLMT7TsFiX0jB1FyVQ1vobEaNkUNDFlttYliA=; b=an6YFbn8vOUhUhIZ
	hDKFiW9nQ28uzIWm7zVk/Vv5EmKHlP41XNvdqnyTs7NQ3e4Fkg1nqvFihehU6/la
	mmmxs/A1bgxu4orjCRNJn9lG3ZJoQ7q3TKa9lLcqfjl3w7WQijJdBLTVTLupclzk
	SxlHbdsQ4UD/54UUxUEbq0O4gx0DmsXX8qGNZ8dNrDGZYyP47EADqJhar6Td57Al
	3oaCVLIuyebxwUYvXbRgSxiJ+RZrJIT1UQx+5bwEyblgggv3f8cST6HBVNcp9zmI
	MEDFWoKrU3jBgTqg+dIK0hh/EdvQIgGtp3uXPdu/YurMy7zmu13vaY7oWND+8feJ
	OI6Zow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fxb427-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 18 Nov 2025 07:17:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956cdcdc17so62638065ad.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 23:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763450244; x=1764055044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dFsUYpLMT7TsFiX0jB1FyVQ1vobEaNkUNDFlttYliA=;
        b=Dbg06CS9pAPFDWnVXMR+inK15hqLUJgz7sLSi87mrOxWT+RnbIxfApYCnRPOZfNv+g
         7iSWJ9azJLKftidMkx/bpxuU0cDZn24kPZpNo4BbRjHCeJ3WGRnwiS2NxT8laQxp4tqj
         292AIq3QVMMhVK04mzQV0kGH/4gMcuPM9KuM5v+15QlxCOo0V4TnBfO96C6fh+RlUVkJ
         BNY+4nxfTn3ClwcnHGB7y1k+SeCSP7DEJ+Rw0P0Wa2F53ana9UX8zorn2mGgfEHUq8rf
         gC6+t5vJSrOdQoef6NIxEnxK+snbN9mNdt+Ixodlq3tmr6p0lvNNkzCkrYueo2JYRGB2
         wbpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450244; x=1764055044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8dFsUYpLMT7TsFiX0jB1FyVQ1vobEaNkUNDFlttYliA=;
        b=I0RH/b26h/l/dJyKVHnTfBN0Anm5mbH9Yjvy5Xn0NVEu19tRPEOQkiayavgyEQHVXg
         qmulSDETaqZQOVB+Ps/VYiHqxfwQIIkW8kpxNlAV0bijCLnur5Kxlo5qEV76IHW9CM6s
         gAMiLDdIwHiQN6R071Unx2aKGisawRJuLS6u7a+Yzcwd3h/Q/WKaW9I3Id3xI66fO8dr
         M6QwmvNN13T3NwavYTaEI8bkTTow7wHpbohpcX9EeCThalb1nJocB8rE4P4p2eCkvK7b
         RTbjR3iCJveQxBmm2c/HrnsSbjB9/k4FxYpn2U3krC4dKd3qpMQrJXcBUmcf2WLuH63+
         EOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKtgbKpyoXw5JbXwZRelVfg7oPjviFO0+1YAqp2i+1EbwlrfjYPOXYpZNIXvvGIkbu7qjWlPd4n68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsQkuMHuDg3/HRfNxtc6JFOi5Er1SA8Gn50kbFRxJXj4mRHIj
	SThYek210TphRJ+CeRQya/zt2x/P/yD4d+mr0e70J0Ss1Yj50d22JAYOfp1k6ailFmq/7a3jBx+
	Y72c3E17KIJIcrRc9dNLoUSGZ77tsCBTDZOJlnkbeG6fRwwDShEK/CnunAzAoonhxH51nz2g=
X-Gm-Gg: ASbGncsPkwmorO3DQtAdLVy6VoN5/32gta98e7HGaYjuXw1HS6zqSvdDe1z/GfsC2Ch
	GX/582yYXaCDhfhNmJTYZYh0sqSstEwyQxNu46EY+Xu0pRGSrzb1Z+mxr2DrOSyWNrUrCpA3Rip
	wV5qOvyFvKLKub0aHi0gFXywUR9ZHELNChbIeyWFPYSVaXloyHHFYdXPLxa0eYBdLjxRbPlz3x6
	Fs5BAIl3K4zxi8NhNWLyZwqClnQ5fWtLMAITilCfDwZNSatiUONFLai+4x3Ia9r4K2yVUFb5+jG
	ubUbpGmjQPiSVKI+DwZAo+wKGbo1DYHX+LTUzdqdgBPUchwEacXW5t070U8BCS/6UqE1BlHwIxd
	e/jEVGTT3tko503xAIlq5zcBPXfy4cS1fmg==
X-Received: by 2002:a17:902:d60d:b0:27d:c542:fe25 with SMTP id d9443c01a7336-2986a7509eamr149564145ad.41.1763450243453;
        Mon, 17 Nov 2025 23:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/SLEUe3E6fEfwBF72FyJpUo2FrhhB+u+/DbI/xRe93kPgCkMM5Se+pd8407X3y40jH+kV4w==
X-Received: by 2002:a17:902:d60d:b0:27d:c542:fe25 with SMTP id d9443c01a7336-2986a7509eamr149563765ad.41.1763450242978;
        Mon, 17 Nov 2025 23:17:22 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm129955285ad.79.2025.11.17.23.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:22 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 12:47:06 +0530
Subject: [PATCH v4 2/5] clk: qcom: ecpricc-qdu100: Add mem_enable_mask to
 the clock memory branch
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251118-sm8750-videocc-v2-v4-2-049882a70c9f@oss.qualcomm.com>
References: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
In-Reply-To: <20251118-sm8750-videocc-v2-v4-0-049882a70c9f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gJyBeBMbKLtW7tBbM6ZJ_X-04UZSvoNV
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691c1d85 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=02cEW-DpipR3T3ESWNEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: gJyBeBMbKLtW7tBbM6ZJ_X-04UZSvoNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA1NiBTYWx0ZWRfXzprZsyLcQxj+
 UApRqPxD1ksnP9596JGSoTH9QeDrQKyv/1ItJ2Cs+yzBqVwR7Y4BvnleIaiEfXLmXhxHsx2paA5
 6RfKqtd4nAfG48iNh3DEv/6q0O+dSnA6PFYEsDfD7YM4mH/FwWGHZjIPKklwC0pAcSAIEe/ajwB
 5ozKsTlw2/FktlAfEheFhHW66PBE4GyYc07hmZ8L1txHciL0TSrM6hZno0xaP2hcyReyQ2UoU9K
 F2F1zMDVpZGHzX179fP+Ns/YCLtr4aLv55AnPWuBPb4YWRoFtJhrDV9Ou42VPXJNVtpPc7Fv3VK
 O7DVaf5ZyQAi7xDZ5YhTMYy1M43aQajvSB1CJ5/PqYXVDWUSIxD1lvEmxHwJr0g7teQ/hKm7EkZ
 5yfaB1e5f/22zGzUBEA596Fu1scbLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180056

The ECPRI clock controller’s mem_ops clocks used the mem_enable_ack_mask
directly for both setting and polling.
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

