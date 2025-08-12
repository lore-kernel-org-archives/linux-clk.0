Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1710F2D9EDD
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968314; cv=none; b=Ma8pQusRZsFXxTNANlx4GPWA5jHbKCYEvmBQN+FANZM+S0umgUeh3vJYL7jJd8wGKDOdd2H6KoG64DHw7IW2MCssWQ+3NoqYJEXvBacsUEdJOIm3DLEu1U0aYIIv34cK2BuuQqF7AML9tbxr+GjIwQszKkuTJxf1CGNJ5nIONKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968314; c=relaxed/simple;
	bh=8khlXtaflpZlnDLhiEfY7BGqjnGu+2kL/Rh6j0ZMjrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKKNn2s52Bu0eoitHH4eK/F7mdGnkn0PESrhkD5iPUODtGkpJwv1WqkoSEmuCmmlnA9v44BAgPaAloNX2DpQY/dn1429aQSYzdhvHbigai27jfBvIC29B5y9xc8r/WnbyW9MV0rgYDc/4Br8xtHUVut/fVX/UFeiaNBVQ9WO9n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pMbJitXU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pMbJitXU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJID1Y008406
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M6vIPQkq2rJdlBAm8nyeGplItg2V3tbO5nIx+nlKXA4=; b=pMbJitXUOAb7STVT
	756M5gJ4kweSQHHT3y7h5J6ErUp9FoxwYqu9fAPYNq+1KrKV13BYs8PuG8Sdk1zm
	iPehzuG8kaGSfcw2JDeds3NQtD2j6HKV73HD3r/6M6TRigm1V2iu0uORZY7GHgyK
	/8oI3D7ZwE1ihwFQRiLFreQUVbmcjT3F7bKIFCUAFQj8FF1EOGVQNJpD9ay4N+2N
	juEjNmeofyCRXy+8LjoqwfXVOc2PlYG6nByPoxP+E84Jov30Rexk44jWGHR+fDEs
	9sWTL5W2lKGQqunSIqHjO1tpUriIrBsZcqq+P3glVIRCJK5ofuRzl11j+wgWmYua
	9huXUw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjjdwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 Aug 2025 03:11:51 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2e933923303so7441130fac.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968311; x=1755573111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6vIPQkq2rJdlBAm8nyeGplItg2V3tbO5nIx+nlKXA4=;
        b=XrSqjqPrb733Icftzgx57vQ5rg7nWr0lx4lV3hiyAzvvWJc3lJb7CN9HDxgEMat8aa
         2Ox5XqBXQWrJZ1lSFXIYFNoqI3YcyMlD5LHxIaXVCJ6H3A3Gg5NJrK+eO3NFDMTZi5d+
         RMpfMYY6VTRT5lAxeydMQRIfm68yHofKtDVZ5mcqBaxQeDDcfTe/fvibrSUaANkcOKH6
         X90pwpRMrE429SMnab+A6y/FeH0AlQeFOJKwzcxuFIriuLBNxjBi5znk5w4GQlvMEjK7
         sjvJfnj2USMQ2ucvl3gJWvR6QKTZRVuL/og1zxHhqzxPrjcx5Mk7sQRI9bptML6Pc+F8
         YCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs5PMEMTVx3KtWMnokllfcr8OW+exHuvAsFxegtouBvJJM64e383NzXAtpcgb4YLXWrMKLPrcEupI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW+tfKqaODfijnpom4PXO5OHPb/q7y1Uk8tn7XJx3ciL4hRQKc
	9GQXrdrUez+izV3+wnDspKnfqs/dhuTbHHVmXWrwYhUF3qzNVYD+lAyey4w98nUD2dFqaQQ0ewm
	9AGrlzX1Z0B2liw/WDPsCOwP8pwqsINWRjGn7nCBVjUJ8cYIi+ezR075BzxZGkYw=
X-Gm-Gg: ASbGncumYj4C0YNs+K41gwoGa+ewkugBnkxbvKaAAamAqAQhjm9Dl0FIu8it5lg0+pS
	b3Uh4M3zvCIc3lp2ypMbWMx497dYGzEWxFYYlO2ZoFtXKMvupNp2gm17bFANv1eSZqooZJV7jRs
	5ATjp3itX7uOiOM54/WKX6m3c8BhObxj1+D1zjzHCYlzhqzrGzHqCGCzsmgKfENK817T8XonM/f
	Yp4uAHmygNip1/wT7eUuBQLIdpU0cVBCrapWSK1d2DNuLf31AHb0BvtLHKnk6lGMmkpjEk39pk9
	fJbkZBSMi4RyfOrPsR1g2ddbJQSX//lPpGMCmxS7h03kkaz8cWFW5YSkQUflrCjmzIowXBGdQJs
	DxLhdDEz8/Ta9w7ZL0Ol7vpXS9akwbODHKfocuZE=
X-Received: by 2002:a05:6870:ed90:b0:2eb:a8fb:8622 with SMTP id 586e51a60fabf-30c20f1f6b6mr9511981fac.15.1754968310951;
        Mon, 11 Aug 2025 20:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWG949UeJNB/dhYO6IDB8lMza4+9YPIklCm3HhlwRTMD9tvEnXoYd4roOyUgQzD76SyR7tYA==
X-Received: by 2002:a05:6870:ed90:b0:2eb:a8fb:8622 with SMTP id 586e51a60fabf-30c20f1f6b6mr9511971fac.15.1754968310656;
        Mon, 11 Aug 2025 20:11:50 -0700 (PDT)
Received: from [192.168.86.68] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a717f0c9sm8174531fac.13.2025.08.11.20.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:11:50 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 22:11:34 -0500
Subject: [PATCH 2/3] clk: qcom: dispcc-sc7280: Add dispcc resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-sc7280-mdss-reset-v1-2-83ceff1d48de@oss.qualcomm.com>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=8khlXtaflpZlnDLhiEfY7BGqjnGu+2kL/Rh6j0ZMjrU=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBomrDzSqU/NM8jmSnSjzTdqUtn5wqfjecU3n6mO
 h7DlhCi5sGJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaJqw8xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXcaA//cYeSoAPeEiSTb34yx3JFUugrCvYZV+1g0hsCCMa
 DXdQ0+v7+S5VVLcAPkgUB30wWDqz3lblMwxoJAuU9cQ4fsEA41/G38mqrzlGOuwtJsbFsxu5OII
 8O4wop8UjHGoQquHIdnRPNYse4leEhzOd4/KEwebrFL+eja1zPEnbBm4twTRrPu3X0tDF0uhYv9
 mg/HHFImT4cMSll0kwQD9wsfBcSCVR8iA1GihmqJYB7CjOyEtZBogoMbR1MZxBW9dGrpcrH3qqo
 5tLphSEx0WLMEG9+/lJL5pkkPy+C2l3lk7jROehc8bTzjxwfr/b873Wf2C6233sUg3Rwh6Gxnrv
 E++NojgPXnh35RMtnouvto3/cNrp0eTUzTBSN1dZOp2HjJ/3kV5JlATXXxB0wIShho9M2+j3DYV
 AwtXolgw7NgT2UgIZQnwNFzK1mHof7yEu+05+eCGTa/0AJrHZ03v9lVWO1WzPMCF3zxgDYMy/6b
 sQfeb6Dfn7S3zsRCSNCbzkmzGu6UcdU4ogq5JxrEbGAwcXJb/jLZTgZe/q/IBVZM62k+MQEsZ+0
 opvFyU9VWMxAY5GPZoHFGXF1ls2mGT38S2L/odx1XWEaN9zrHqoOJxB/QVuVExvEKHUAJR65bTD
 q1TyiBh/bUbKrOdegRTp7MzbUDdLkT/fHVGu9/r1XxUw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX+BorUg6vWGyw
 XVX46SwIQKoUiRU4sk5KABj+v/9xvJO6qDY+SWMTooXnYk011YvDzdvEQR3sC7hbEH2phqe4y7o
 kBezsbsV+OH6RoLGt6CC9a1l5Cdh1KbgYfWdDtKkt8UOeTcm6WOT5qaaDRI1r0gUCsiS1F9yegv
 bGSRVYEkkH+jqODnw1EtQUZ1Fa5FpYCvFivRn/u63Iwr/2DolkXmiQjILfHE6hi1mOpmlqMbm3T
 nf39EjzIlH2ZagZbvtcBXBRpz+Ht/0aK2bV9H5Why88UeIs6NCU4HBUpCcU3Lqnn831rQwenV8J
 FGRtUdTltVIRvZSItWJAExlrPqZlfwnAYo8sJ/kkUL26aznohgXP6LmS/OOgDtQZFPf+2bsjU4k
 G60wpLJX
X-Proofpoint-GUID: wq1GTp_FFo9wbuZTBHks4mJe6vtVv7np
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689ab0f7 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=12A6hGN33XcstJ_aBzoA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: wq1GTp_FFo9wbuZTBHks4mJe6vtVv7np
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

Like many other platforms the sc7280 display clock controller provides
a couple of resets for the display subsystem. In particular the
MDSS_CORE_BCR is useful to reset the display subsystem to a known state
during boot, so add these.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc7280.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index 8bdf57734a3d47fdf8bd2053640d8ef462677556..465dc06c87128182348a4e0ea384af779647bd84 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -17,6 +17,7 @@
 #include "clk-regmap-divider.h"
 #include "common.h"
 #include "gdsc.h"
+#include "reset.h"
 
 enum {
 	P_BI_TCXO,
@@ -847,6 +848,11 @@ static struct gdsc *disp_cc_sc7280_gdscs[] = {
 	[DISP_CC_MDSS_CORE_GDSC] = &disp_cc_mdss_core_gdsc,
 };
 
+static const struct qcom_reset_map disp_cc_sc7280_resets[] = {
+	[DISP_CC_MDSS_CORE_BCR] = { 0x1000 },
+	[DISP_CC_MDSS_RSCC_BCR] = { 0x2000 },
+};
+
 static const struct regmap_config disp_cc_sc7280_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -861,6 +867,8 @@ static const struct qcom_cc_desc disp_cc_sc7280_desc = {
 	.num_clks = ARRAY_SIZE(disp_cc_sc7280_clocks),
 	.gdscs = disp_cc_sc7280_gdscs,
 	.num_gdscs = ARRAY_SIZE(disp_cc_sc7280_gdscs),
+	.resets = disp_cc_sc7280_resets,
+	.num_resets = ARRAY_SIZE(disp_cc_sc7280_resets),
 };
 
 static const struct of_device_id disp_cc_sc7280_match_table[] = {

-- 
2.49.0

