Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6EF175A80
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777120438; cv=none; b=kc7RWY0F8WGGwf3jqUodMkQK0SDKJe2OIkGFPn2QW7nOqnyZrBbbFAugN+mMnTN0Ijd2w4gMkKppF8kk0Y3xvHfleJdDsQJSXG/75i0HV2xtKyor+ZMIfbimY9KsMkP+BdjXLHWlp/NwGbDVUJPUbSn6Gshet5yJkwtiEEQliv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777120438; c=relaxed/simple;
	bh=4EHrx9O0zy+tPpiQTmGb67MVCUynxF2C7uZoBqaBbBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J4HF4uA7x85VQ8GS1zNO4VToPOTUJy5HMAUO24bNaL8TDdS3ahKPJo6n6o/XKaB0SNGAnGcjlxib++J4n24TETgLvA/y14LjThFGJXzmLtqTIZBP+LjvGmGIS4JqtvYGOpb6PlOG99meuaKlPPH/BSeM+eJyecXkFu+88CPpjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK85mPkd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FaXiYKvu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK85mPkd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FaXiYKvu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3Q8ME2366080
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 12:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=klF0v38YUv00mDFPTnwJug9xOiBA9PSH07C
	CCWnh0Ck=; b=KK85mPkdkk+neFh0+A2grw1rUEyF1JlPDySBmVQSOv05aCGsAVq
	9GKAS5iIXS6A9MWijLfQ9o7pfhaWkM4s2tLv8huxooW5q+ihzEjbB3ObQ/ka+Uqt
	CjxVw6PCZ36HkKmRdz8csN4xaoisTWWDcB1O3CN7jzNPXe9wWES8VrMen5UIqe1T
	cVgHVv0TRNgVoiE/ayyQu7BFIf+ooY6cfrAu5NWUiAl41XtuGPHtYNLQqbZKQo5a
	ZXkkwD6Jan2rPd+sDCJmxmxFG2NYNu+4ccmgHrToMlraw6/KYNiFnLcKWCV0qLvF
	lf6mCHEt95UGua5tGDq+IMw95eaKtxjOytA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw0vx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 12:33:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8ed08aa4so22012321cf.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Apr 2026 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777120435; x=1777725235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=klF0v38YUv00mDFPTnwJug9xOiBA9PSH07CCCWnh0Ck=;
        b=FaXiYKvuGX+Nu7vARWeG9qS1J4QBGhOPXPE5uydBNQmL2VIHyNOajRn9v/EeQij4bc
         rPjNpTs65n+Zg45584JL11pQCzRl5MWyHpIou0uz8Uu7EJAAtIxZQP23t2RXF381m2EZ
         4zOuwhobElZ3b/Q73R9htuiNZ7R2klvU9PNotJO1ybRdU8Q7VDov6tOdeP/2mK6GtadE
         paGo/NlDh890ZTP2jE3R5vFUaETkYO8aQoz59Q+fxJWPEEivuBv4PUMWQLnKB/67yF1N
         djuMkxcCpTATr1XlqRgSGuGJntyU7wgRWZVYb7pFAre0OHWl3hmuo3t1ABdylaexJfec
         V5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777120435; x=1777725235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klF0v38YUv00mDFPTnwJug9xOiBA9PSH07CCCWnh0Ck=;
        b=O61iEGUsTA8l1J3BiWbkVTz/CJ4G/n1KMhL1O6GJIUEajOZB9ydbrn0QYV+XZeshBE
         Fko2gaj2i5Py7pbF5I8yLUSzjcYfrR9eSxC//v0oDqJdKQN1Jz/PGmpntlhdvAmYwUo1
         UOAqBlJm4+fQVF0kRN8HbPDgxVr70YJ9CQ2aNX3pw2rj24yYOM8bJ5qzSMXIj76A5ivD
         THyB5CmD7TfeUictnhN26MMEG3i2rFP45sEu2RPPaS4VASdYzKh6vb5mn9lj/u+35Oa5
         odWkfE2zEzoKNxIP7IGwm5vAkqFbeKcxKVSvmQA5kwJjkBNlUx4l7AgpeBjpnIfNfhaN
         6yvg==
X-Forwarded-Encrypted: i=1; AFNElJ+a6ZfBnKU2IB4NEmUGwAm+PCwYk9nXTUIViv9c36n7DcTfxkEy1d+4xIHg2/ynBd0Nqfb1cHxRx5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT95IOfqAeW5kTq9Ati+9M4H1T+KMngPwhC0cdDOXzw9dwpLH1
	PP7Rr2o4Uiy8A4tOAXU1iHxU22smQC835nUg6HqSmUqgOUL1lk/1iqaqS6gPyT5N5hz4j1NdVXm
	k+YFCidQTQ0AfWN16mkBaRwNjozA6o7IOF7JwQV5HXuoQqlGukKHvBbekqYAev+g=
X-Gm-Gg: AeBDietc7HIe8xFTRJt/KMGtVhLjeu+TW1CNpQYYekXMC7+wpYfBldjfTq/aSumb8sG
	VO7PurBLNGzMa9p8mM34J2uHe2H6qhZHkYhhyJ7bUyKFx5BlxzLr2aDZk4BoblaJ+KspnhytMdj
	6F6M5JaxK8vsku/IfDs2sxyEe+Oreo5PRYC/Mx5H+XWVcKWTFq3RC2DFpdseygYstasrBFK0C72
	1iaq8xh10FsvtNeD+Ss55WAIu3uPjYC9HSzIyqIllMTHJBAY9W5KxOaTD3NdLam/Wbwt5QvLh2n
	pD2MoPjOv6SlOmGzuvUzbCOJ6kkC83xnp1krv37vobbJ3NaqRY8RfLGMgySaJwMR6ZNO745uWez
	M7cYXx0R9NxuwpqObamHBklpKqkmZqWjF3KyGfBqwevBkisKmQz2eSvP0Qj55cz1Ms6Bl9Nn9kV
	LGN8nV4bY93A5JnAyYjfArX07A1nI0Y0DWD9oXzLDLTFA=
X-Received: by 2002:ac8:5892:0:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50e36b40e4cmr542453941cf.24.1777120435646;
        Sat, 25 Apr 2026 05:33:55 -0700 (PDT)
X-Received: by 2002:ac8:5892:0:b0:50b:2d93:97bd with SMTP id d75a77b69052e-50e36b40e4cmr542453521cf.24.1777120435235;
        Sat, 25 Apr 2026 05:33:55 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4517ef3d4sm884189666b.17.2026.04.25.05.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:33:54 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: x1e80100-dispcc: Stop disp_cc_mdss_mdp_clk_src from getting parked
Date: Sat, 25 Apr 2026 14:33:51 +0200
Message-ID: <20260425123351.6292-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDEyNiBTYWx0ZWRfX9byFXVXE4cUi
 nFtBXh9EJc4KHE71SBywNZJTcGzbWV9Kw0Yc9RcDHewFVErfM6OX+xBxWwX8q/zXxuLNLfchWZY
 kwzeuWbWMkwH88OH9cXo1rueHt8tkF07fBIYQpKcknCNIbRhnP8n7Cn9+SHtlnkyVd5Yjv3/Par
 5bOsbz0+wi3GwERpnBiLr7j2PArq/OQLXOkTOM1li1cI6B4Y5r96aw1W4AJDd8aoIRePegdipsw
 76rTkEz0DEK+ZI4uhG0+xiIjK62s5f15PA0B89bQfmZ0HMxU8G5YPC4ZtX9IRogWEXEoO2Kuwvd
 qmVDYURrPEGQ41hk/diqDJwkErM195gUSs8lvEEOXUT7yDMTAOkJQ1BhhjaY7ndEe2LkAeeEUVx
 kOoBIKtioFxhs3gDcSfo85NtiLEpdTRi2s6qU1lyR0ORLRT1e0PWkSesP2ak+il8rJYDmYtyxd4
 h/68RRMwzdy3W+eYw+w==
X-Proofpoint-ORIG-GUID: XDKH6TeL7Ppnb3gNzDHnlbYchieXyTe3
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ecb4b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=iLpfOVNSR9RCDSG3wP8A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: XDKH6TeL7Ppnb3gNzDHnlbYchieXyTe3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1011 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250126

Parking disp_cc_mdss_mdp_clk_src at 19.2MHz causing the EFI GOP framebuffer
to stop functioning. The EFI GOP framebuffer should keep working until
the msm display driver loads, to help with boot debugging and to ensure
display output when the msm module is not in the initramfs.

Switch disp_cc_mdss_mdp_clk_src over to clk_rcg2_shared_no_init_park_ops
to keep the EFI GOP working after binding the x1e80100-dispcc driver.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-x1e80100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index aa7fd43969f9..cd45bedf2649 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -580,7 +580,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_6,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_6),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_no_init_park_ops,
 	},
 };
 
-- 
2.54.0

