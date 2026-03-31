Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6383EB80D
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947332; cv=none; b=kXRkkGzTkwLKnwpMZ9rfvgplm66E1ZmcJgKxmXzppcpGaxWdBvkCqXR3jmw8CzYPhvJ5DEEcM7JrNvznsFZ4XqOEA6M5O3UTYiYHoCmDeHMPdGMEpavUJgNb3oiwrcmXthTfwWgQRmwg4Ks0nlrUZLQebYMTXCCFuEvjSvpgN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947332; c=relaxed/simple;
	bh=VUFkyCsRpXcEf4IxHPGvbBOI/NeBAc7RjncVGxR4t8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jv70PwqqjuE4XtUHTkqIiTSY5U3flEmQWOAfOkeXolqACLg0sqmrQK7xVR0eTNLc71fEJ5sotUgi+zy43q4Ou+XOWciRnv6enHTGeq4MA5Bb7VtZjTxU/deyDeJvz2yWX0m9O5av79gOpF1E1SNzCZ3C9CN9jGqyeN3ZKp3emDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2edLbMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XD8yGjmM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2edLbMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XD8yGjmM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V60fvY1841101
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QC/GGt/5GTW+J0JKwibaaq7WGcgfH7bSyzx
	NV4zifnA=; b=i2edLbMZdGaY0qPKCTxNfIzt+U+4suF7NOkP4giZuvzH0hC8dKm
	dpsXvNP0VrWqSUwNAkcFnEcYaBXQ+9KewYABs4hSZiRd9Pbf4Cy4TSEUZHlVLBmd
	v1APsEXxOkI+moW1Ac99stomunchPxYKfWtuF+HwHrlvyqv8//XMSJ4vu3KAlwwo
	ye251oVg+RUL9ulQf+fG4X2TLswc21zST6iHd33dReHwYTumxpbLU32pOwDHfqbd
	IBW3QjAOP/37HpAYIHnvuRjzritF+oVdKR23ltShIHlQVBntw/0bYFHyI+R15AnG
	FRpcTMldrDuFuDFfya0rt//ml0sdt9x7l0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsj7rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 08:55:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b44f7b7bbso173921841cf.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774947329; x=1775552129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QC/GGt/5GTW+J0JKwibaaq7WGcgfH7bSyzxNV4zifnA=;
        b=XD8yGjmM/hDvUe8pmcuNJQHNEWd2PX8wsDoP7/1PmOEZl2vXL0IoCQd2nRLyeQaNGu
         oXfoevYrHIN818WcrlhLP0Wp+UwrmgyPi84RETWStk40UUBjQz9PBHImtQDU/ce0jSho
         L7P0//dBD2qtAytVaU31AEnOwcAGbPg/JWthvvfsW/4r5KzrFr9ROPUgoAaIPla4L81L
         fVAqPqwfke+/QT1jLQD0PYmLkKnFGirVZPr55otCWxxdkgBj8AYZ6bNYI0iXXQXT6PQR
         vu5FsjdKdBLLRZtubR/RCgi6BLOTZjNgaTibJA4dPpGFM7SUOfY6kF8mb/orOyzxchVJ
         3iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947329; x=1775552129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC/GGt/5GTW+J0JKwibaaq7WGcgfH7bSyzxNV4zifnA=;
        b=Cy4Sv4MrG9UKHkPlBeLeCii84dEZ3MWxoei6MqAqf3iEoqlFobBNLxp2OxPkPpLavP
         TCl/YBXjEcOn4a8RTH+E1Y6d4yZktnAVvKq6PGOiUm9ILI9h292UkCQRozHzUZTmKXLj
         sMcZ9w/bHe8NvKt3gCJTWOmej0vpfqIxrrcERz8uRqMD2ohPOS9YSuCb/6UD7gPDVWXx
         ptyU6gaCMxPUA1SDINJN1/rgWf2h/6ZzPoSLNAS58/GcLz9b6nsolm1zMh5cxJOEtAkt
         bWT0k6QGJ7SrDM1xaM5lmtcHOY+2W/uAuE4VHUWdCzmCe2pu08lifiSPqH//ePHy8p5q
         oSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeN3Z1GTR7xkj/uSsmsdzqvCVH+y1Urf5Frj6jhi8yBoeHVAnqpGTmMbPYRpUGS4WAebTF8oPzeas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSRUS/qpTePAKFaz8mQ6hlFZMhgqfjT1iENhEsPDeek9OhuIJe
	H+l4kCkiEfVyoyw7qKcDDSizR56yuw2DYJxTYVHme8ngGzCXa/pd04lvqr03EIVrL28TEjGTzgA
	/szC9YAEigFfNw8rLzyYmFlNNQzLgeKTDkxvF+by7vGjccRa7Co9F86HCzTCsET0LZF7k/uQ=
X-Gm-Gg: ATEYQzwM/EMB///RrJB8xPm6N54tCHps24vCZF+kFT+xx7e4I9/PZDeI+YVTA1uEJ58
	9pHQH47eLx7MPgRxWkNjzePAKw9fM1cVbQP+32MzmSHvwtIcph1bX8gWu+weEktyHgByxB1tx7e
	IupyymbuROGiTI3J7fe1PafrZ7sZzeL4eAKsBnDN881OvGmrYCUHHgRN0qyrR+rieXo5lf3X8lW
	bDT83IAXw7VPiCuK5HLrHUx0SiWfSRc+yfSFmqjF3cOLmr+kWySM9tct81mZ+pSDWIfnK5TiWav
	bvxjnAsxN1By9pw6zwBwigTWTMv/L2EBu6pEaePgBmRkSEOs3aVuCVXHTvIKBtYahumdPOTgBYE
	QcDCZhpet2btl+MUZhTun2FggAyW1hkQelViB
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr228817691cf.18.1774947329565;
        Tue, 31 Mar 2026 01:55:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa1:b0:509:13a9:552f with SMTP id d75a77b69052e-50ba37f68b6mr228817471cf.18.1774947329053;
        Tue, 31 Mar 2026 01:55:29 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887a630922sm37511085e9.0.2026.03.31.01.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 01:55:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: videocc-glymur: Constify qcom_cc_desc
Date: Tue, 31 Mar 2026 10:55:22 +0200
Message-ID: <20260331085521.37337-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VUFkyCsRpXcEf4IxHPGvbBOI/NeBAc7RjncVGxR4t8I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpy4v5hxDYWXsSeN/r4xpfmHNyBA9Q0+4xtfiD/
 6aKBTEbwk+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacuL+QAKCRDBN2bmhouD
 16HbD/9weaLMUdsIasvqFSAY/JQXP7HJ+FqpKZkOaKB/IeH96lnkY02JdZt8+23SFbQirjkz+fE
 dd4De8pFDaqm38Ie2NJEPaQa3YXKd7RjirVzMS1UAbARcoe28YCSBZexTxAuC4knYCHuZR60Z35
 K21DhHZMnSDZNkGqtCk1I3JaKAf6tqS12aRbrmWkgeBOv6zdNI1+2Copb7F5XyknnMHhaXe5O9G
 +BtqHhK7zPXbb4uFWAnSx0FquNhLl/4oP/vfADUUYW8Sk4XmD3MM6K1A6R1a5ULbuhzesFfAQQn
 S0OobIN9Juj4ln5dVyu1atIdRXC7IIhgWt0cEbx3CI9m7ejgCBeTohrK2d0Lk2ywtANy4Mu4rLw
 BB8aXoNcH5Ns3kLm9J6x8DeNFUApJ2oocODI/xdSJfB77aZ1wXymZMb46AmPsCt0yEtbkoCyr68
 yxMOYgfsca4VEnPeCWI5poW1CyOB7PUhkkpc4TF+fKwSPFqxtLQMAI6yrz3gJ2cGA6bvji5HIPq
 2c0tOQAPQq/oGUuKWy4toemauz5hCug4lNgHkg0wZ9LLcpU2Psgke/aaLAEdJuRzfIPMAIxGfKJ
 pUsv7N9So6feK5XJpGjuStR2LHd0abhYcPMg+O0cvK0/iUA3Hx2kwsQz7aUuGQpLdW7oyawSpmo FOjSRD5RK9kZJOw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: acbpaCZtN0Qw-qIZX8Z5Wlsg8v-dcT5S
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cb8c02 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0UI9pEyUeAJalpk3AhwA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: acbpaCZtN0Qw-qIZX8Z5Wlsg8v-dcT5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NSBTYWx0ZWRfX6cFWSb8o1XP2
 IBB8/AO9vU9FGSoo/NzTzAAZyiwcnVqScaqSjzOiA0E7IfxDbZJOcFTKoquqNecvi5FV1mRqF5a
 ZmqRsFC6IUfAP4HP8cv842GOQQUainsxxqKo0BtvicAPrwRqGDINyoYpZLcd3xiU0gQGhvaydB+
 hkaKiu4wO2pOp1KQBd9ri32qlCtUNn+yWts/e2hlRYQVyOcWzQy5LQBuAcgUUsSXWVWW7uX8g9l
 Bm5Q2Ty56aaued1Q9ZhUfc1K/UtFbR3Os9E2Noia5+jejesxnYVPq0jpbPm9zSAmT714x4Q8X2w
 Xj5PYIQYZ44F9a8xNkxweIWJ/331KR9J0ej0M1Ry+YpPSr0/OadJdKZ2WZt8F3itesQfKYproQm
 hhYUgBoxU3n/zpBPpQcuumiWYvKKQwqD3cGFmuA/XkveQkG99c7UPo84F2HdVZpypdKB/Ihc3Nm
 1i9xDcNJmULBbtvEJlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310085

Static 'struct qcom_cc_desc' is not modified by drivers and can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Drivers for SM8750 video cc had the same issue. It would be nice if new
code is being built on top of UPSTREAM code, not downstream.
---
 drivers/clk/qcom/videocc-glymur.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-glymur.c b/drivers/clk/qcom/videocc-glymur.c
index bb3aae6b8396..ea20605dd1e5 100644
--- a/drivers/clk/qcom/videocc-glymur.c
+++ b/drivers/clk/qcom/videocc-glymur.c
@@ -495,7 +495,7 @@ static struct qcom_cc_driver_data video_cc_glymur_driver_data = {
 	.clk_regs_configure = clk_glymur_regs_configure,
 };
 
-static struct qcom_cc_desc video_cc_glymur_desc = {
+static const struct qcom_cc_desc video_cc_glymur_desc = {
 	.config = &video_cc_glymur_regmap_config,
 	.clks = video_cc_glymur_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_glymur_clocks),
-- 
2.51.0

