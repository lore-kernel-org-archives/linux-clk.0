Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B17E26FD93
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659315; cv=none; b=rVS37LbshbITiB97f9sHD6dRvqMfFX4oLrNdB30LEuZ1B3dgrGW7DnXFiidOKPFCSAQVIoUHFpD2fbQkNdGRv2nbyMHkid8OhnR/2EVCNduoEdox7hzM2c3v1JwyYESp1OJvTHXpGpWgZjfNi0xaBCqk1cPX4XI2jF+3WmrXhLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659315; c=relaxed/simple;
	bh=5z9G36iGlG864HrYcLSh3Ez+Ivcm6CAWx83vQSgXOtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ItKH3BiY7jzSGs60UsrXcYWqqPB8I3GfVqxNpK3n38URHqgHO/WvqcVpnXJ8/VWrDr/nzJTff1P1E26VLpgWBFuQkZoI9lYqWPdckJ2w82fE89mTBfPDxfhXhR/y1gt9H7/Gdtz5cY3Hw1IhLYfE7f2hwJmP8t46Gb7rliMcvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTiUKfT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xc3CatKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTiUKfT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xc3CatKS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G7mq80041563
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oXqsxQLD4Ub2Q5AUDVebom
	b6fFMyxal9uPvsIKprlMM=; b=RTiUKfT94BAOeKrNTYUUs6cYqXTH7tt3ANuiip
	nSOKB/BkZhtscuQbG+NJxgN+n9BIp2uRNrEFPDyUaw6hZqEm3OV5RsZB9nvVJ8cB
	1DqwrlqkznFNuLoI9Pu2F3p6GNVv6ksCJLBn8jTLkmhniri98A29SQ6Ekc4xvOPU
	XwAfiwN/MEB11jyhEG6Srmm1qunJi2aOyGhbjUDgVa9jDEMtECd20uyJZs0UV8Bf
	YF3iUTpRqdHodF/jhBiqdL+RB9uO11JFLFEsqMHKAilGH8SE0wFD/IFHPL8zGXLh
	s+4La30cVWkkj6AB/4s3bqVYwCi7Du6e1oBR9hpfpxCcFOyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt80qg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 11:08:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b059511554so52701225ad.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 04:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773659313; x=1774264113; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oXqsxQLD4Ub2Q5AUDVebomb6fFMyxal9uPvsIKprlMM=;
        b=Xc3CatKSpyyFJ+IA2xR0jw0Bh3+JDJT+kTKdtG1vRiAf7+8xsBkhT/qSKGPjpC/Ig2
         38c6FZmS5Nu0OQgPpaBmWV8m9c+oU8soSVRgRR1iioJr5jNHbc5LuK2B7TxmuoSdASlj
         2nyTqvqcyH/HmKQ5vk3jXBVzg5MkAMwS0J59OI9EYEnHBR2vYD0V3jD4HTnCuRhJW3a6
         eUMtrbK2++ryfDeW8qwkbS/fpDokEPV6jEKWafxEyr0dUikIaISNCcAJTQsUIANcNeRP
         BvBjNd9m25vwtmyYJaK6jjXzblN/gOYl/m9Th2M7pRXwHKoKzFOTEFxqUqRNgZj9hllz
         sGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659313; x=1774264113;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXqsxQLD4Ub2Q5AUDVebomb6fFMyxal9uPvsIKprlMM=;
        b=eOREEzJcTagNt6z8ZY1qdmHfKg3Qz1btZlrQsqOLeUFgqxIktcZUjsUlNIJPxnDQ8h
         dmHaBg9i4gujOVVFG+bdj7u8mQjOsRBfXaJjJj0rqz8jkpTSLT8NAaAGgyNtqMpbH6Fh
         6tAE2Ff/5y8w9hYGZH5nmgOCJ8HxxYrKEGipL1Kv04S4jTtI/Oa8gJrb7CeZTFdA2U/h
         XlX+NqnmfK2zh0ZJQgoSRUdOi4L0PHd0qSQ+KqMqWlMg0xxQwqQKpJRPQCepa7goE79N
         USGS97BdOoYR4OhOv60HVCZwYDLo8IXpTIb0/XJUrWolrrJokZy7o3+AcmFJHEXUr3XD
         5N6A==
X-Forwarded-Encrypted: i=1; AJvYcCW1bfMxo8xM8w83uwgpcE54lreRZD8dscAHiLIaQ2LT96WGkQ1YwbBiG3yIwWTbCwwf8yVwfCRb3tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx85MRIuK3xTAx6SqKNPv6npce847KY0l/tsuKaIWpXqsxhiToC
	XtVugzbVDXnjqyN1HCoEtbT5meIvDKkPHVxCCEhvS3k9vsbhbhhY9RskvqQzBEoK7ZlSlw3XPfj
	iYIUoquSqOr72XH52jaSqt1S14YAOry+zyBpZE32N8JVtXdDcGYXOemlc77zpb5o=
X-Gm-Gg: ATEYQzy6GJHv+GMUVw5jKJV7I79iFVgDIfKlwO4c7bGWWUrJ2X/pF86caP413KwG+fO
	KBfZYslti63AJblKpbeUpeu4IXV1jlcaF8ikqxmerfK26xFXF69mEsvt95UbY8obgHyUVy0NmjV
	Ed/ztVKma/pj1TmIkYbKz0NhYfRoqPOhUE3kGXwi25ZIBcQvNoPDEKLcFpcSpP/t6nv3pSxJmVx
	8ksbVE8AahNU3sGfi7Vq00uVaVhj0L747KJKUuBtAYdirfAUrTDmQgHu91MxCKgiQ4RmZnbQ391
	rl07f3wtqCfSQ8Nx4L7AD3BYMlki9ihHv7xtSF4yDh+NDGo6XWK3g5hQSQyENYERG/RFoyYu7/n
	ucsdVTQEDXnfcqoUMJh6NcnrGAfPzy4nsm6qw95n1BETMvhC7bVWi
X-Received: by 2002:a17:902:e74a:b0:2ae:cefd:18d6 with SMTP id d9443c01a7336-2aecefd216bmr128510115ad.2.1773659312010;
        Mon, 16 Mar 2026 04:08:32 -0700 (PDT)
X-Received: by 2002:a17:902:e74a:b0:2ae:cefd:18d6 with SMTP id d9443c01a7336-2aecefd216bmr128509855ad.2.1773659311598;
        Mon, 16 Mar 2026 04:08:31 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece7ed6cfsm134447115ad.59.2026.03.16.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 04:08:31 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:38:21 +0530
Subject: [PATCH] clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-hamoa-usb-qtb-clk-always-on-v1-1-a29ac94f20f5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKTkt2kC/x3MOw6DMAwA0Ksgz1gC0jD0KqiDk5hiFZISQz9C3
 L1Rx7e8A5SzsMK1OiDzS1RSLGjrCvxE8c4ooRi6pusb0/Y40ZIId3W4bg79/ECa3/RVTBGdDxe
 2o7HWMJThmXmUz38fbuf5AziVEnxtAAAA
X-Change-ID: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: ZSXOeGZOEv0QoTTRyEm_-L-M88aknyuB
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b7e4b1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4CI3Usps31ucNWVHWDoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ZSXOeGZOEv0QoTTRyEm_-L-M88aknyuB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NSBTYWx0ZWRfXz+ghBLRL9gwV
 bi3Sr4HPGTHqaWDzOYXUbJoU8k0L+AuutpaiOxFVUnMBf/8vDO9TCb05zuDk+FOgdWQj3CrxNZu
 1OqEEoh9HEpNDNUhd5zjP5zL5il/mv1UniPXwyUzMvRXwEUkRWMj9EemxC2CzBK52Ev9wjEY1XS
 WGcvK+OyCU0ZDFosNlULYub+qM4GwbNdotbHquLRUE4EX3syAi1bXHxfQ622CTboghXEqB8kDdh
 EG/blS/dnUlO2Zkd+FhWeH/HK8ie1PPFwVfrMVHF9ie/BbMUTaZAbdg8fsRnOjdnHCL6rToabhE
 nmHLZSn8iLF/UKNzkJ25Az1/3nSOgW3P98NbtoloeBUxXudmcsnbHZkVsVJJKABFakmcuFtpmlB
 SUAJcOJWlc+tUvi7yQMHe9Wume5ThirCBkCiyldgRbJPRQvXCEa4DDbAXfHzE0OBtM6j9rx7V0c
 fh1kWeh75hYkgPPtXHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160085

Keep GCC USB QTB clock always ON which is required for SMMU
invalidation on X1E80100 platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 74afd12c158c01c121d9aecd56e65c0c302d7cd0..73a2a5112623e5190f41129af7fd76a86603557b 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7480,6 +7480,7 @@ static int gcc_x1e80100_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
+	qcom_branch_set_clk_en(regmap, 0x7d01c); /* GCC_HLOS1_VOTE_AGGRE_NOC_MMU_USB_QTB_CLK */
 
 	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
 	regmap_write(regmap, 0x52224, 0x0);

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-hamoa-usb-qtb-clk-always-on-bcd4e5f3553e

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

