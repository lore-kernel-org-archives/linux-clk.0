Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEA22D6407
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175451; cv=none; b=Sb3qIjEFq/oNdfqbkhebwtCEg68/HjyNt32x9va1ptRXj1RdVjYUOKwIf9Pm711aOgF7W0x73VKFOqNlPi/Y3aBs5CoeLlq7MzuqKmxJ0LMDKBZW/kShDSt+pvjx8vYiK3eEXbOl8G5rHCnC3s9BH2cOyvDUkF6cPt6LeYQbO9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175451; c=relaxed/simple;
	bh=8PZjtwCE74zlt56WmLIGgDcsh+itaMCXKEAloYDRiJU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Rz1udd4DeMGzQ99U0OwToOTu34JbWmeBLXOhTfesm7wCYHff4+PWwG6UgLzUcbcwhK+rqkPsSGABsFwbzqiArFq2/f77VUzpG89RuKx94pVtzzc90WYjkJZxQl9K7BfWnTliBDFPpXOcuk4S4g2er93N8IeEi1Hgva1YWkaIm3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKA4vml2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGyR8lBT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKA4vml2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGyR8lBT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N8feEc3649248
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ho5Ky5QdPw80jp6iOPH/I
	8edNUckcYBGFFXot+7RG4=; b=AKA4vml2gKrDb8Mh5tq9MR0iYouPCM4DDTeuzO
	j4g2bCECi2IuLGMLReqKcQ0qFFBes+MLEmS91n2Pepi5WVMlJHUr7gHmsnButkGd
	ejU1Flv2XcVXhw3TcVn8mJRgaz7WwgJkeLWlfglT5wXD6pGGATqxXvO7EOGquoCu
	UWdCEbtMXLgnHTC5ABfo6yl+6BBPyKWdzRnwmK1oubwHz6OiJcSZWD6HuDiPCbM7
	viV4d4PXsTqImdh7ESClBf8FmoGrCo3KS2/dmyX1zI6NMvQqhcgCJAXL8z8KQKk9
	R55vQhMdo9XBhrDiYZ1H9swrFDv1hXFtWHB+x/LZVpRLFFLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4ntg3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:37:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52af6855fso290008585a.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 05:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769175449; x=1769780249; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ho5Ky5QdPw80jp6iOPH/I8edNUckcYBGFFXot+7RG4=;
        b=gGyR8lBTR20Sl5BN8yda6tVGmPIi6fK/86rVjlEFqXFwpaPIYCK+HbfCX5fAW99wwo
         EH+zGLRiubXgBxLerb/AoR15RL6iEhncQLLrnFNVQFX6l/fYQ44b71gRg3b9hkXZBL29
         IVQqxd32xwdLM03D//XhtltrGe/jXiRcpkfRTp64LLKTKuozldTwkIva4WaOF8/9ezHu
         6YruhN/5cMUl7B3JKfIefto2TiAWLN6FC9NMC2fSS0CNZj2X0BY67dbxVrHaX+5C5fNc
         AsdDjEFW3Gf8uptTdMttTZGVD14gro6zxeqEDiL90MrYqEnGidTdw/bSTcKTs1Xyggqq
         8uYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175449; x=1769780249;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ho5Ky5QdPw80jp6iOPH/I8edNUckcYBGFFXot+7RG4=;
        b=diXPMezafrz7ma0038iJYpPaSf5l8AfrtkticE6S6ADPVW3cBfYtOr2RINJM92s4PY
         /aW2CpJhQysPqkkClVcxSh99CCBL5oj8IfZlzdkU4l2dFVmHQpxtlamig/7J8PCuh/eD
         5nyz/3Cwlj8WmEzg94k35Cq9EtVNofPIJpKqVxfTsCXZJkb5PBFjVaIdYc8o3U28JX8p
         CrBpv4vE5qSUq4AJv37psjVZ5YM6USyKxwgbmDJ+jSIQOxtUxVgTqW15OuaNE4LF+q2t
         ep1/NwyKMhIR8w1Eq2HRPHGeaI98sH2hwas7LkYeAsAv1/bS+GuDISxF3/xEpk7PQfEo
         UiEw==
X-Forwarded-Encrypted: i=1; AJvYcCVZE94TCz/p28UG2gUsDoTAjNQyuTzx2nsPU6VOCkR5u90+l2N7MVj1CbSRSR8/uIiS4qTuttkGO6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMz6DOznCoIjXYFbg71LY05L5WMcsZbQCQ5ZaprQqOBzgMR0Z
	SMsqQGatXb//Ua71X+ChluxptRH6up8Q+Sc5ycFhZ2qgHLpFAmZcnaRXM6fqOamP5m7XPW4LBDs
	7K8cmcgR3VhrJEY8YPZgNK9ldbEqlxcHLblbv+46rkzt8dgKEG5I97P5ImAypyYU=
X-Gm-Gg: AZuq6aKGxX41W9FouEey1rUhc0iMz5iIw4fq2S6ntV6srTjDK49g9oN7+NvItGGFhbq
	GglryDIgz1c/HNXKPBRXNAJ26xD/uYXgmQTBN9FqZ2Ul8f7lELAz1UsQmaosJcEwdaglJk5N2Ss
	TdcJ0Xig3HpTj/Nezvg/AiBV3AQnFzS8dcbUUc4Hv2lZ2RgRrrXxt7iMvqwi9CeFDUBgNmEuXt7
	qlWlCH9AqRKwl+KCw7pOmGcU2cAWOvyBwsfbB3H4xP2r+NuEAFtwlMS+kok8KmocV0tVYNuR7hN
	TtUYOPcN80ZBgrl6U0MEpT+YVfCZ6Z2i11I0Obj0PvMyuTsmWP7AtAGv4gbIDLwMU8sa1yrcfw8
	XJsn6aSw4Q1NwESV8QA==
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e12e with SMTP id af79cd13be357-8c6e2d837f9mr343338085a.2.1769175448650;
        Fri, 23 Jan 2026 05:37:28 -0800 (PST)
X-Received: by 2002:a05:620a:4154:b0:8c6:a22b:e12e with SMTP id af79cd13be357-8c6e2d837f9mr343333485a.2.1769175447903;
        Fri, 23 Jan 2026 05:37:27 -0800 (PST)
Received: from hackbox.lan ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm6649882f8f.20.2026.01.23.05.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 05:37:27 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add support for basic clocks providers on
 Eliza SoC
Date: Fri, 23 Jan 2026 15:37:12 +0200
Message-Id: <20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIh5c2kC/yXMQQqDMBBG4avIrA3EQCv2KsWFTv7qqGjJqBTFu
 5vq8lu8t5MiCJReyU4Bq6hMY0SWJsRtNTYw4qPJWfe0mbMGg2yV4WHiXs0DyMGFt8gLisk34CO
 /a/cub+tSd+D5/6DjOAGFVuh8cAAAAA==
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8PZjtwCE74zlt56WmLIGgDcsh+itaMCXKEAloYDRiJU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpc3mQPhR/1QpguvzVD3DuqG/0YITvQnoXi57eM
 6IYz9U7oQ2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaXN5kAAKCRAbX0TJAJUV
 VqdOD/9CrbHiPslEUGvKacKsEsYTiwXNF9pL7r+UEIpxhPrcIf1TBBEyczqwzm8deNux5yJj7X1
 00gCR4MbiG0PhtBNYZeaaQ93KbagTxV/0Hnr/UbQoyGfupLQI8EJqgwpH4Lwn9LqcCnIO7Umht3
 Aq0zKXY15NDL8ccdUssFbvuNmau43MTyz6bMTXfCbyX1i+qrEpdRQvJjSm/IQBNMQm6xgH70B97
 dDtkq6r+XBoG9im6NROzFYMTcBlnU+P2vxgJ/dil8gDRDMNqc/gUcTVKurusJGFXHXY1RY8UQqH
 ULaULP0o+bOpCwLloq1dX6CwJZxozbufoJlrUrqRiJ2l2/UEyba9wmEdTRQSMI4I/8bAaTfOwdi
 BT+42l3XCHduNolStwGoIifpSy/PrIFW7+ghBQ2JPBbMcnSINYyE3PpzNfMiEPDrWoxCCTF3AY9
 Wr+yNKzKl1PesMjDT33HKt7MqiNC5p94dlEFBPwhST3MNNIyBTqFdQ2vQEWxEBysOEq4fZ15Dn4
 Nmy42UZPtO/itJ6bPtJfP4AJD/seVJf8QEXoDTvrl/AMTePhJoULMg2pWxchTP/CiOWxmpSUqph
 oDv0+Fmf+wxD/Zvdo0NA/1jDB1E+fTZ+AZDvJJ0QIwBF1McfsPf4HAOHYsY0PBDUcUTpnwF6vpg
 rBofnpN/We0Zgag==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: IGwcsthTNB1cKxNkpPSi80HXRko4xNvY
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=69737999 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_s2lmL9ZJNBb6SD5BL8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IGwcsthTNB1cKxNkpPSi80HXRko4xNvY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDExMiBTYWx0ZWRfXzq0IhObPqoew
 9+Y6wcPHf/U2l8CFGz1f0StlUsNLmxL4FIfm6zOidsOcW9kirvu0Nd26VQNwsfYcNTkbxPgNORH
 PvrjdPo7G2kjJUd3ZpK9D4WbBXc09IjlO1LkVnNvSFs7w+XjZUAFAqN4KCKDCF0sBFoyFNsjKNF
 bC3VgJMMgJuyulLJoy8a2uvj1bG8c8oze9k6lp78oztb1Bu4sS226ueBi2MKQ6SOPAnu8ItUBA0
 FJ8y5ojVe9TTqMJHn9mGOwuk7o6cmvPOAL9fA/dB5sZ95is0Jx4kRPoc2P8KrVhy9e274z0Uk9h
 gkDBK05E7hTo+eUuue9njCAiMMHVnzeDbCzlWYL9Iidg8Qg4m0GSMM09psbFWYvEUuYNHD7azBS
 k0XA0U0ETeDZIXUqI0pqHsjx8SQSuKTB7GsF8I6FmmRPWUXFQvPaH4qOUwjLZphopjmCbFQJtot
 0CuSyoaV80bkaCLNZqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230112

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: Add base clock controllers for Eliza SoC

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   20 +
 drivers/clk/qcom/gcc-eliza.c                       | 3160 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  131 +
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  218 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   15 +
 10 files changed, 3573 insertions(+), 2 deletions(-)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

