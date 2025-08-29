Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CA527A44D
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462529; cv=none; b=A0BLyPYFsLV16FRJRvXmRDQ3o25TmYwQBK5QQBYRYXL73GX9TMPas9900+qhq3bt6l9ypjPuvYSyhs0jKIchBCy834pODbtFTuHjdTFHiJuPGjUK7/X3YhZ9f+n0IN/wzKGa+TFaPNQinWfshDcm9mhcOTWEdnXaxejU4aj+ON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462529; c=relaxed/simple;
	bh=+7IMzm3dJQyIaL5UFTpN5Juov/HhX3fmuiG7C1O9X7M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y/BzEjC/D4wZ4j8Dy6huyYbOcyDztElvxFMP3lE0HEaD0TOme0YYwuwKoZnueGVoUYjE6zOXYEHTY1c06CYDxmpe714ALC7iiypvovDC0CmTht+bl578ryojDMNqbzn/oKkuCJRxfTqSztkqzhpxscCPOrOckpfuQGH1A4PmDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXVXEKEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXVXEKEA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85VwE029806
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1xKcaJgxrBPyjChsn3f82b
	01oSG8OtqTmJA9Agd0y7E=; b=gXVXEKEAyZQLmn38krTaE+B4AnljUj3UzCzPlX
	jPGkpGZKZb54inT1sW6t77/v+DNGZMdpV7H5X2YWRpUbDcqgEJOwxhPfhKOMnOuB
	ugXDjeA/5cAwHQlYqcyyzmsiEO/Bz1NLTLy+5h1Q+0c/pn5TOmTeFGDGNKA83/f1
	xFkLDdsSjzz0CmEYcIiQEGN8cnkyQRbjnh3Z+fLK2K1oICMYnJMgV/oEHblWtFS5
	rBWFnPA7hEuzD5As5Q3IaaAaKjvIyaFyKJ/V3/84mQdmjYZSHwXsD4DCny8E/jDf
	GLYFlyla0B1Ltt8KUrlnhr+SLeMkTSt6WI0df0qIK+SzWZCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5web8ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 10:15:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-248f86a01ceso9576155ad.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Aug 2025 03:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462524; x=1757067324;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xKcaJgxrBPyjChsn3f82b01oSG8OtqTmJA9Agd0y7E=;
        b=QbiTKX72wbQ0FQk15Q7iqz+TNSH1gY5Tg/J8sHcQDOJ046+oq8K7bjLve9rAnjsvG3
         2CSIFLAb4wp1hC9KeyYI8WNnxl2WKi/ecw1bhAp39KZDwbJUffywR6Eh7tlGdqGrPCVJ
         kNdkMUamtXl+A199FDvbT3P7aE9X6xmJbLcQ3m8ECDSV4g1dMC1kRUSPIz5vYNaRV5C4
         F74h/0tkwtljryHpP4J4uV57gT+n0shOAG32qymV8HUdH3JSNchMoC6BqBWhaLsvH1+n
         0C2D02mkKv8vJI6ND2+tbvFsezHOXaJIvuPlstt/TCcey0diAxYP/ECCJWrFiuZeTR16
         /t2g==
X-Forwarded-Encrypted: i=1; AJvYcCURYZN4Yxgh2GN/yKVIdTeFO9S6ghLz4N03akRasNOHWxb3+fFoms6/a5i1kB5YLHB+ONdoseJ9o60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9X5zoXHDWdEYM1wFGLyp58T0ryGrajpgYafKnUeuFONyQvFL4
	3qFVZhk7aZGYii6z4WlDNw7IpkYJbhUL+L7aov8I8xmnjkUhTgZJSIG5z8nlLnjQRO0R95wxrsx
	+kcB46T8I5ctfVi77jSYOKtEezxSfpJpGYIgi5WEuHcnLaUcxI1Qb407njL1Xc+E=
X-Gm-Gg: ASbGncuUM5svz4+GPZ5U1Q0bMnke4U6DD/VjhTxp2P9eBd5Th6nFVEo7vnSvI6dgU45
	fAKPl+1F0Z8icuiWCk9w7Bm7IM249Thm1QWYtVJt7H19bpRVcVswK3ysrjL/32Au3ugfyej0yhj
	gQlqg+Zfqh5bhnytOtHrybJDpyzkZmlkZAj+u1ZDo8pa+7k5wG5CTajW7ae9Ulr4qJU3bcrY1SE
	iC/Tz1zwtQ9rhhDAx5zDr1YO541oUV9FPTdnHfWSlpiG5gV5vQWUZiLyVQVklZX84XrC+OAfzy0
	hKs+Y1uDkEaardfeZZXcRzymyUfbEaabJXBJeaSnul9hPuydUyyG5P6mppQ+Qfvb
X-Received: by 2002:a17:902:e88e:b0:246:cfc4:9a34 with SMTP id d9443c01a7336-24875395b1amr151492545ad.26.1756462524367;
        Fri, 29 Aug 2025 03:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtgp+U+U5uatmdSx8ZasbDdBwKl1/vpZfFJ8DY7f9DIPtySa4vUKP/SOhlyw4v7Y/wEaDn1Q==
X-Received: by 2002:a17:902:e88e:b0:246:cfc4:9a34 with SMTP id d9443c01a7336-24875395b1amr151492045ad.26.1756462523776;
        Fri, 29 Aug 2025 03:15:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065d1b19sm20102775ad.131.2025.08.29.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 03:15:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add the support for SM8750 Video clock controller
Date: Fri, 29 Aug 2025 15:45:16 +0530
Message-Id: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALR9sWgC/x3MSQqAMAxA0atI1gZqap2uIi60ppqFAy0UoXh3i
 8u3+D9BYC8cYCgSeI4S5DozqCzA7vO5McqaDaTIqI56DEfXGoVRVr6sxUjY6KpatK5dO/eQu9u
 zk+d/jtP7fhmE2LljAAAA
X-Change-ID: 20250829-sm8750-videocc-v2-6311b334f7a9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: yL0ixPb3eShoEp61zbbK1bmIFWazOukC
X-Proofpoint-ORIG-GUID: yL0ixPb3eShoEp61zbbK1bmIFWazOukC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXz/a303CbfNG1
 vnA30+219eRaCXczgoxr19UkJz2a5z/B3T9pcE48L9d7xngvgirwqqVEHwX6ELb5E334wEtD5mb
 dt/pT7Cv/nwF6rjxsFs/erxJTC25Rqs9t51LpP6F0BU5MjApk1EHNes0sNtLhIt3J5NgraCGU7p
 qxeBzNyQ3JSnxTn5XfveSTfckgBkiw+GATq3uVQbTPeCaVQqswBTuMp0mlWaOcA6yVVRHqYYMzl
 3feyfuMyPtaezgFpDatzkFLhUXfVZ6U9zBd1JbVRsw9BqMqBVs9h/7COQX4jZ4AToUkgZJtFBkg
 VyY+ObNJ7lkfDyTulgy/Ew5CXXOO8yg6RstwnOFELkQyBvz5LP6O6gP2WS7E1GTXLViBjPy3Q0r
 arQ1YiH1
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b17dbd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=1P1wqcGgztCMLUttUvsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

Support the Video clock controller for SM8750 Qualcomm SoC. It includes
the extended logic for branch clocks with mem_ops which requires the
inverted logic.

Changes in v2:
 - Update the commit message for the invert branch mem ops [Dmitry]
 - Update the email to 'oss' and also update copyright.
 - update the RB-by tag from Rob.
 - Link to v1: https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: branch: Extend invert logic for branch2 mem clocks
      dt-bindings: clock: qcom: Add SM8750 video clock controller
      clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   5 +-
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-branch.c                      |  14 +-
 drivers/clk/qcom/clk-branch.h                      |   4 +
 drivers/clk/qcom/videocc-sm8750.c                  | 472 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-videocc.h    |  40 ++
 7 files changed, 543 insertions(+), 4 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250829-sm8750-videocc-v2-6311b334f7a9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

