Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66428AB03
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547388; cv=none; b=SjiEyUy9BVOyt3BCcSH18tCmZ+GdkWv52YWazbO9XXryK5WjLCOIqnE4RhUVTGEPVR3MQsvR8Dlari798ze5OIzgVditye6Be5rsALu6cx+9adlx4+PlFp+yvPLOUoyqSsdV/6hx2tzSruzFYHkEQw2m73atuubpbYeO9q6I994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547388; c=relaxed/simple;
	bh=BrwzmbE0nlXZo2u5wP4qMUU/ogZemB5/wN8SRT7Nf/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OAxaxkMax46isB4JhY+w96K9gTc4J5DKXEgBojz3k9ED52xCu0Z37YOrk9OVaBGS4O1qSn+k6TKP2LDvkeFn34V8C0bKSTYoW+9KWZ23JW0CasRiKkOt5VmX5lD+P31x4FaVQeAorPIPUiAGq7knEhWc1UeGz0YUgcc5SPUmkh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N5+nf6vg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N5+nf6vg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A7jq0d011530
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 09:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dBlW2s9G99YWiYw1EC3EnOoyTrJ2dk7OaDq
	AZpT/RB4=; b=N5+nf6vgw54WTMflhCELOqjbDVZSOI9NRUc5vKgOOTTWQSwFzbg
	3jOo9qzwE/UdvGv0vxWVtFMYgZp5WCm6UXX4oqhITkLoXFppbyX1d7Ugwzfl6m3+
	S42F28jcJ3ir0aeysagR9KE6C8svVNP7pPB0PC1aUutA0CRF4DSAlUDv6lU2ky7e
	gNqD1JjxRP0PvHmRWJ1GkT53oZJW96jpouynfPO4kZbtin6tUsn/AlMKkaDRmBHV
	Ej1WUDCFL8mmoLzesahAFkn67WCmGDIAuAAQKHTGqVl7S7VIUJ3gukfPJpMtC508
	N8kxax3immduRFKHdArD7kdv1I9GjDBzhug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxs4q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 09:23:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so4384309a91.0
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 02:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749547384; x=1750152184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBlW2s9G99YWiYw1EC3EnOoyTrJ2dk7OaDqAZpT/RB4=;
        b=QbgCLdooeG4aRQG6yZitTnLjs+9rJR3DXvGp4I90eth05c/7mglBWHhQLEfIkEfYLh
         s/mo9ea6SAdXyEeDuzznBRSmqdbCu26uG1XR/Apmf0xZCUntuZUyJoSdAQqvFr9VHwXA
         A/ISwmAlerjHd7/5oAwqYEa3fveFmWdpc1kB0JXe+kP1tn78fqsyPELoqi6+vaIGmnrJ
         JDyjnlm0PnEfiB99xlBfzrI41IPY/Xww3qUxRqtQysMnasklvDDVerv93PK/DzrOpTZU
         a9qy+CQFerd6mvbBKYxn3kE/+DW2z6gdJcqQsC+VSwOH8P+fNksxMNGYVZlbNLlIQIcR
         iH5A==
X-Forwarded-Encrypted: i=1; AJvYcCWFK9q55XHJkJ8g22/or+q3dSXSZYAta9249azG3Tc26ibvGFaLM/FkpDJdJczqm+pCLJonphOmsCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEP+1WA7Or9M4zfg3QfRgYkRorbT6R7h0gGIX3aSKw4t2rLbi
	FsXvkaoB27BDsWz90F1MOt0iN+PawWQ54VjmUzJIRXA9g2r5njvWwk+pTJqY6j5INnRB5vKal4b
	EfOnt+36exRAJAHWKm9Q1UB8b1tyl7Arjdy0+Ny2S85LkzwpdRE5FP6ZzJjUPPOA=
X-Gm-Gg: ASbGncsyc9hyRyXzg0qwyRgCwhbkjc5EMHUU24ewuQRBjmF0yInbycrmzkzG5lyaAdD
	62YTRRjICsloJNNiTUgtVo50qURKkqyIY144rVmpydp0pCUdYhe0xklLtFA0wP4wUZ2ZRt1uIm5
	kydZDg0sivq5dfqFC+kC4BFpby6WvOAV7F4yrN1ZBWwYcIVZuWn7K+Q+BYRJ+rAUYhMjUG1wAcq
	yQ88Gnnh1VC6VSS0nZYiopK9sLdcXTzTXrOtR8IKJacIgEo4TXZ58MZxET1vZ2YQjgEtsM7L+Xj
	mE344oXVXsIOaccccDZJ24+RWxua/Hikv6D4pvVMHHqvv/gTY+dnx3dsXXUO
X-Received: by 2002:a17:90b:3f88:b0:311:b0ec:134b with SMTP id 98e67ed59e1d1-31347696e63mr21258044a91.32.1749547383910;
        Tue, 10 Jun 2025 02:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPVCzLQUq9faGGNOAxaWEeymfX66o3KZGZkwyDaHmcm7rXQTFoAJ7KB62UpxbFmiq9l581OA==
X-Received: by 2002:a17:90b:3f88:b0:311:b0ec:134b with SMTP id 98e67ed59e1d1-31347696e63mr21258009a91.32.1749547383508;
        Tue, 10 Jun 2025 02:23:03 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b5a1d06sm7575212a91.17.2025.06.10.02.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:23:03 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] clk: qcom: sm8450: Enable retention for usb controller gdsc
Date: Tue, 10 Jun 2025 14:52:53 +0530
Message-Id: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IrLBJ0aXR38pIrhVxVtFRnXeaU-3QZfA
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6847f979 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wx1DGt_w6qtLseO9XWYA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: IrLBJ0aXR38pIrhVxVtFRnXeaU-3QZfA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MSBTYWx0ZWRfX34dfXNppZhKX
 0Iu0n3+eJ/2Rc07S2Vf0qXLJaPYyuFpMYS3f+c+KxPOTM2b5TGxRIgMUWzhVFkatn9FREHHX/oZ
 E2sb5g3NA07uO818JinOQzs7J3RJolFDXqaeaWaECsCxI+ZGaE5eGpST8E53f8B4aBc40+o50YM
 UaoI6jIlh1FbaUP7iXbICJVqvRY6sWXLhQYZk9cBmaFbK91QtJ5iCQ3pCuwsmFRHHxBABVkyFIu
 O3nbnz3faS10IlSilt2JL8k/jilujoAZ7aYBQSu31OjD4juA7sptUlesYPfgF/+JOD55iLfV0wK
 ZFmm+MMs6C/YNxKF5O1JBZOcpOFXcG8ZXxzREdv7SWusq+Hdqx9WXrYOO4BD5ArEzdI38W9auv1
 0OfJhGc/XleDzm+s5U+BWlDEhe587jLk42SCe7l3kEwV/lqtWSWKEhezg1n3KXJ6TMTei7fZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100071

When USB controller enters runtime suspend while operating in host
mode, then wakeup because of cable disconnect or a button press of
a headset causes the following kind of errors:

Error after button press on a connected headset :

[  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
[  355.725844] usb 1-1: device not accepting address 2, error -108

Error on removal of headset device from usb port:

[  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
[  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
SID=0x0
[  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
PLVL=1]
[  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
[  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error

Enabling retention on usb controller GDSC fixes the above issues.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---

Note:
The above mentioned issues pop up after I enabled runtime suspend after
applying [1].
[1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

 drivers/clk/qcom/gcc-sm8450.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 65d7d52bce03..f94da4a1c921 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 };
 
 static struct clk_regmap *gcc_sm8450_clocks[] = {
-- 
2.34.1

