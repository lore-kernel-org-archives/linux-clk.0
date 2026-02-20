Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EAF2AD25
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 05:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566873; cv=none; b=lbcN+v0ok0XarPWQ8kHJ/zSyhn5dx2RcV/9jtb/2DK8oFK5fJ6j7FnFbpqCBMediRcA6hX19HZ1E1Lkxasp8OWiVrtcpu+4eczieg55S0CxQLRkuD23g7zzhNmvDJgsf9pAjHhJw9HUA+KVJ1nmHqdWrs8kpXViM5XTIwsgytnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566873; c=relaxed/simple;
	bh=fV5WWPdwufBIXt9mpDliWUdFwg3X3zqkLcIQSSqZUBM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gFrqO1m4OPUuDQMbmG3vASDcRu+pVdSyuCsd9u1E0SGyOc9o2c+XadpLaIBqcUQx2npuST/pMSfcG7Nb2E63IrvY5efRZnsD7j4ZEiygw0Baugl1gxzBRLtTP6rjHZYVMbouZAkuGFMsNqtG4bACEkCE8SI75SujUOsC1ZceKmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUkYIZju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1hYm2yU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUkYIZju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1hYm2yU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RtXG3034430
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 05:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3dHqnbi3dJpAvR79pUJ1zF
	Mqox5b0Yk4I1PRd7BpHz8=; b=kUkYIZjuTS7euGicBSTSOaVr1eNUpomhxyKmKX
	cM9BisEdp87fIir8VVe2TSCZeur+pIbf7wJaelyyjfjI9PLZlp0oypYaMImy5FdY
	cNCPEfEU2mLqFOKNVQKZaMRqG7nEhyqRwx2uH7YyO1Kw1WA0vmj0F0JNxO1Rice7
	aYjSx9WUbkzrNebEWCEPbBmlnhai40+kPG4nhXjxLhM6q54rdELbzXcN5muDC2LB
	KQEkCn+05UUV+vyvhv2zvoIefO1t1mcc1GGbufWBQvbSKBMtu9mqtUs77XTG6yYz
	w1l9TQEyFB1FQ4WHx5JYjy7pVBs88fy9VtbwsA+po/Nc3toA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce6k01vqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Feb 2026 05:54:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a7d7b87977so19188575ad.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Feb 2026 21:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771566869; x=1772171669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3dHqnbi3dJpAvR79pUJ1zFMqox5b0Yk4I1PRd7BpHz8=;
        b=L1hYm2yU6PTIYFzLYaFkFnkZdWddCVwxs5/i2oDuLtlfVot1fGNoti0ExhgDgn/Er9
         4TobzdDjw4QJyThCpccN08+0hU6e6vBuCz6DDZCBsl1zd2sE2x9wlh4aX547dXMpSLh7
         B4W2sh6+7R2UUvW1PUE4XTtGpd9KOdUw1ICRr0m8TIasZkxd1w+KOehPscOIHmu+gO+n
         aotf8UOcP6/2eF4UfiW8gbHIkCUuAxuQl9AWGoFQU2gNFCWZSuy4U4zj70oqjpIazDd9
         KcO4EcC4WGmRFeBCCjixWoMOeDA/JxRbOXthxuMSyJ7J67p9m849jmXHb8IWFa1q4uc0
         zTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566869; x=1772171669;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dHqnbi3dJpAvR79pUJ1zFMqox5b0Yk4I1PRd7BpHz8=;
        b=caXgjS0hLcaLgC957xLoPPUWWJm+iFLP/TQ9XK86ngVOOHREza7rOCq90t+idzZp+4
         1tduEc0LOEr/3lFlYioa5OuWXD6g/uZ+XbAVHO4rcqXq8cVYD2b1Ro56P+jXLfT6gAYg
         CDbKWdQndli5uQCviSEyfpjyUexk4qlYJvpnJOA4CZEzcVM59MwiwQOU5wvKEJQqmNxw
         NVgONi8ZbLh0weljORv6E3s82Q5BRPoo3N/gp0g9IwIUxzgU9SyDzbzctYoKAqBw2YdC
         wmsb5TTwtVcwkXMLUCa66GeXJyc4d9cZgAiqF8X1y85zU3Rp3LCov/hO0ATLApVL/fXN
         uE0w==
X-Forwarded-Encrypted: i=1; AJvYcCWbpgYJ6BcQmxOssK4H61L+1wv5vBPV8sWXo8MQIam/2lrTHcQakqp1rnuSjYi452sV18MZqqIHlm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI+3oyDDsF7PvQn8MLysQe89tGlH5QShmvxwTy3WkZHgSu11CE
	KxX5/ood1nnv0XYWWQbf4nAIXkq8ziwze3WYys8SenpaN+MR6WvY7rpDKE1YHuYCbcwwXT2VDwc
	Uo8WgbfwPLTTYHgn04Gdz/S8byzA1752rmlk7nI+Xk343xcF8qjmoL2dg/Y6gErk=
X-Gm-Gg: AZuq6aKLsx528KpCIzC9Hp1p8DHeI2ZUSYN1OewPM60jMY7HSuOuwRU+ySimbRWPFd2
	bDItABQB/0FTrRw5W1PzXgxgo7Kl8C7tz6IiI05vzXKozewR4/EgsEj/PdBKexiK6TWlcnEvq0b
	rFg7/HEaEecF0f1U1pn6ZBXVir0q8TJzRoxv5g57rkSI6SwkaSsM7UciLzOQOWSpV7S5oT2e9Ng
	4+K8LhG6mQkurTsXYvUDzrCfOtOek5pRtC2AlEXQRmcCRn65BlSoJXEJ/DZdo+VeaYK0MW2ZyAp
	9eaQ79qrQXc/zq5R5tFdlcPtKT1rLLvNmOmLzuMBbhX880fYAoHx/8O94nd5S6Q0qT0QVOZoWrn
	mAfqObskaX6CYxvxIDia75z6MrTYH6ulZe5hh5zPkjwGA6w==
X-Received: by 2002:a17:902:e74f:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2ad50ed0db0mr69116085ad.24.1771566869174;
        Thu, 19 Feb 2026 21:54:29 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2ad50ed0db0mr69115855ad.24.1771566868553;
        Thu, 19 Feb 2026 21:54:28 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa326sm197949665ad.1.2026.02.19.21.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 21:54:28 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for GPUCC and GXCLK for SM8750
Date: Fri, 20 Feb 2026 11:24:19 +0530
Message-Id: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAv3l2kC/x3MQQqAIBBA0avIrBPMcIyuEiFhU80iE6UIwrsnL
 d/i/xcyJaYMg3gh0c2Zz1DRNQL8PoeNJC/VoJVGpVsrt3h57/LRW6PcrWWPaCyiNeusoFYx0cr
 PfxynUj5DNvRUYQAAAA==
X-Change-ID: 20260217-gpucc_sm8750_v2-866576675fa0
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA0OCBTYWx0ZWRfXw4UotDm26XDs
 8Hw4BHlm3XmXL2EX5WeWuy35PIQk5CN3x778DdLilFmqp21nkRfHE6S8z+He6LkhH8UOqC45bY1
 +CsZVU5+dULl7PzMBzFgFoU+xtFtkkjQqHMBtZTnz5mh08Tc0V5dzjm0sahKzuKEYw7aG5qwKsB
 LMs/uDS2xoQaifV7jNtgF0h9LxAPKeU7MU8pDjCYmyDkECAZxXrdVPpBs+PQYwV7+uEeZgiVr89
 jsOA3zvEzYZn4SL5ohtZ1U9OQc+013+6FRwWQdY2GBNEbP7ZMxRO/GD07TTY+No4IIADKJhpTrd
 K0KOTGWfixtA39UaPp20fqnBURv3yvv7jVKAR5+740eO3We5At4SetOBIt3eBYwN1Lot8deR1y1
 VfrT9bDPwfaMdESVIcvujvm4zgZmTLoK/JtZAnAU4KuJOngEwhX52iXPws/UpQOlDvf1N/yx+f9
 4h/vk1RkYDSKAbHtPSQ==
X-Proofpoint-ORIG-GUID: cffddNd0-xE4kxew09RcGivCiVC1dKF6
X-Authority-Analysis: v=2.4 cv=K6Ev3iWI c=1 sm=1 tr=0 ts=6997f715 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BAK5ul3PV33nhPFZ3EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cffddNd0-xE4kxew09RcGivCiVC1dKF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200048

Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Changes in v3:
- SM8750 GX controller is reuse of Kaanapali SW driver, update the
  bindings.
- Remove 'qcom,sm8750-gxcc.yaml' as it reuses the driver.
- Cleanup the 'gpucc-sm8750.c' to remove the GX clock controller
  reference.
- Add the corresponding changes in Makefile for gxclkctl-kaanapali.o
- Update the device node for GX clock controller.
- Link to v2: https://lore.kernel.org/all/20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com/

Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  64 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 472 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  50 +++
 7 files changed, 599 insertions(+)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-gpucc_sm8750_v2-866576675fa0

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

