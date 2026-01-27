Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D4267B92
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769498320; cv=none; b=u111dJD37LaId30nwX1RCIxQBqKjGuHQlGPHVqWpep8CmqQMlbjhhZMl4JQt/Xwjtw8xCwSf2QH9noSYx6vsPKat96Ds3AouSPA7vGgIGsGEGTt5w3LNC2PysBjFhYw55qXR8ylXT4ACh+whCQloAqNRA5ew8v07uRa1CvkxAO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769498320; c=relaxed/simple;
	bh=nPIjFJWEz6cbYOAQ8erioipFaVgTTlFMfXePTF1j7ac=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qU3JE0jukmWCbn1243LcpAMKXkKBOPyhP1V5dE+ZpSlAQx9Kq1l6a8DyuYfio2EYbKTGi/9VO9D+5lZ7C/tiSCoUaMKVfaiyhvJcy5HqZJHY+YCu8PWzcIUzbWQ2cAh5u30ut5opQz8VZh4699XwyPkfRTletnW/KZ7keNJq3tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZ/5uHWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCfsEM3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZ/5uHWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCfsEM3j"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UTnE269662
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IWEnM0YBbjg+b3mhL88lQZ
	NqYkOm6EFF+BuRi3TqvyA=; b=CZ/5uHWuykzpaSqRT3qLqAPcmZawWAKCkCi/vX
	6zofSG7KuZdNBzrmk5L/w+lSRzmNbkbe2vMPhoIuJdNRyX+ahDVDE2xupXdDpthx
	tKUDU7Gtz+LSYGX6Tfff3PDvGZUzcOD42HISIa2KgBLFAhYZKZ3yRF+yhGZs1KMA
	u5Mr7GyayRfHYKy5N4EZSVAOGebbnsQhL1hTD70qKFfNh79RN4HIjzV9i5uJAor9
	J3K3C4rSVve8iEJ8mfByGrxdiysvSFxdhM8O9b4RGbor6I951g5hFSYGuhQVAk4M
	Msw41r9sD/kOqAg07PsrhyPKSv5CiDHti59SgCt49u0sZ7GQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bx0v346wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 Jan 2026 07:18:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76b0673dcso51396765ad.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 23:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769498317; x=1770103117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWEnM0YBbjg+b3mhL88lQZNqYkOm6EFF+BuRi3TqvyA=;
        b=bCfsEM3jR0emyVyLMGkzKHVy8iPIOvShY5WZIHVbAVJ3fCURt3WLpGHY6gnwrxEMrX
         Jw1mraBMsmXsTSWpcjTbzAdBFp7GOXrPcfxILVM1jCRyWrDgXapr1GsqxsD5yBk0TBsj
         OKmBN8aOx+0k7X1CJnC8iBgAItaVueQ0F9zk61PSZrDwhSJdnTo+LTVbVzTvO7eJvqHI
         TJFqFLGgR1fyrDoabrtl48Bs63vVwFtdu45oZlNYUnLkaWKTSkuNufgIU0/KfloA7BvS
         XexczFvYk6xiYrDVK8tavPNgz1zIhtTOVU9JN5wzSilY3WIKd+R+DtwJ7mbujXmZscI0
         hMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498317; x=1770103117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWEnM0YBbjg+b3mhL88lQZNqYkOm6EFF+BuRi3TqvyA=;
        b=YnIL4qa4J6NB28GBFV27qwZC+m9O2Jsk30r24eoNoZO7/mqDKlmck7E+2D0fb9xvga
         Jes1ln5YVIMP3UzBrUCZagZkxDZoyaJDYgGCNuJFy2Sy7zM8UzkdwbfM/zN9ImZF89BH
         j4ep1tCVTaTfzYsoj+78/cnMfcsUcAXsFBCgwH8Bfw+feXCsDzH6y+P+XSgYX8YDFnk6
         /nwrG+Dup0pkyfNcAbysvw8SUbJXXv8/EPqlbBik9jXhd9xENMKFsWUdy9keuVk6f3dW
         oeddGsq/penKGmXIs94LMTbmDdI4wTCZcZ8C0d/WUzr1+1SHZFMTBGcIl7qCwXQNd5oG
         MjIg==
X-Forwarded-Encrypted: i=1; AJvYcCWswaqiJUmkCCzsp56rzqB/Fzp43Gz2lpWkp/pkqWusVhKd6NmEXZTG7SW3hBdewJBCltF79XEeCZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkEA8v84R1oSeBDjlRI+VWwZqyyapWkb5rLdIahjVM7OvG+g7E
	dVHlbbBRX5yZlmwQ0UtZ+M9iaRGdFnNh/xeU23APBwJd9PrYW4MeZFIbwKhHbIJA1yKDXV57ht2
	7RRtF1JHy/2XzYEUotmXVR8seUEL/JeR22sK9f5I0XjkBAFkrNs+DULVy1sbOrmw=
X-Gm-Gg: AZuq6aIICU5qI0FNNIoV8wLIJa5tgi8t9Uoy6nI06H+16ESmw/FF3UioiBXLNHpxY+4
	TtLUKKiEEgapE7g28FWwv0kNLTvx/f52ZbXLajS0uZsMWyML5AN/qI3smLbVH0+Lsx+V/46iAuZ
	GyjBDcMOYhwmATuVZ/DcFYSStZ7X9FkI5pDscTQdK4QLAMtORspNUMaqfXHCGbnSbGJOeA6vr6b
	utiSCmpiTI8SLli3zzgLVQ+Q26CG1ZSqAp+ng8pTeby+d9Cfuah6F3ErVEZ+HHKaVfI3xPawgvS
	HPGG2z10VNyI8cHR0euKTR8EkndmepteYEBB4Dn4wHtxg0nvhlNJK4PgJHQAB3KTrgY4qypsS9u
	lj09dRpEgdl80yh43JCcedud3WyPhwHzyMQ==
X-Received: by 2002:a17:903:ac7:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a870e8d1e3mr9505685ad.54.1769498316969;
        Mon, 26 Jan 2026 23:18:36 -0800 (PST)
X-Received: by 2002:a17:903:ac7:b0:2a0:c1e4:e25 with SMTP id d9443c01a7336-2a870e8d1e3mr9505515ad.54.1769498316443;
        Mon, 26 Jan 2026 23:18:36 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a817f21707sm88084525ad.28.2026.01.26.23.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:18:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add support for GPUCC and GXCLK for Glymur
Date: Tue, 27 Jan 2026 12:45:48 +0530
Message-Id: <20260127-glymur_gpucc-v1-0-547334c81ba2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACRmeGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMT3fScytzSovj0gtLkZN1Uc5O0NFOj5DRDYwsloJaCotS0zAqwcdG
 xtbUAWOuIlV4AAAA=
X-Change-ID: 20260124-glymur_gpucc-e74ff52cf138
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA1OCBTYWx0ZWRfX/beOTjIMX9Bs
 LsQ+x73vFfUEBYZ8RLq0+6FKksA/jGa4Lb0Wn0aImUUJrlVpxXN7HyWCc71OoQxsJnicSNV8Bmv
 HzfxcD9e0XoRurfnQPg7H8iRM6gpFnACEMrzxyeYLCfvXuh8Igfnw7sb7Tz/LNa02F2nt+cu2OB
 ENGJtlXDVWiuCoTyGMjKJgjVp2TfBZaj8cuIz4zhEqDwgxfKjeiYaNFgojN8EatjHIDRRMsEwZf
 WAWcRxfU/pHz817ax6Lr3MMMMi2oNAdsozzTwPU03l7NsmrFz/oURzogM/Tc9RthC9pSNxf3m/K
 D7anx2sRY60dE1DEbFXpBqzgyg4TZZ+O9ua0WKlLFp3bsBY/xO3Y9q2G986yhdOA0+fPt0eGZEm
 ve+4Dzw/EfCSe8DKJbu0S+SKvcWTXCWXYoKi+5BeAmCCKVvK1KbAc9UFJccKwt+0VRIva7JEwHp
 LD6hhEulfZwaSQPYtow==
X-Proofpoint-GUID: Dhd0SKzBkiqgWpcsiDDeBq9AZV4Z0skC
X-Proofpoint-ORIG-GUID: Dhd0SKzBkiqgWpcsiDDeBq9AZV4Z0skC
X-Authority-Analysis: v=2.4 cv=JYyxbEKV c=1 sm=1 tr=0 ts=697866cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8BAK5ul3PV33nhPFZ3EA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270058

Support the graphics clock controller for Glymur for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: document the Glymur GPU Clock Controller
      clk: qcom: Add support for GPUCC and GXCLK for Glymur

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   4 +-
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-glymur.c                    | 619 +++++++++++++++++++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   1 +
 include/dt-bindings/clock/qcom,glymur-gpucc.h      |  51 ++
 7 files changed, 685 insertions(+), 1 deletion(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260124-glymur_gpucc-e74ff52cf138

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

