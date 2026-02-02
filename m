Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735F35CBD2
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029822; cv=none; b=C/hwfbe8KfIWyRQQ/iGDdbO9Gn/iRISxSut737rQc0QaSs3GuoDQp7cF3IuXjIpHSGxbiQIbJsymmrVbvP1iL1PjRQ6KJzckS7pYCqKxVdMAJ5xlFDmXuVbeiuSImF4RM1Tv4oU9jG2zoz2bqGGZW++MhAXPPdZ4h/F48ycv8HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029822; c=relaxed/simple;
	bh=oBByzlgd5XJdeoOhoX8ohnoctxpjedUY79GPYnbYxZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fQhizvD6kh88QH89aNe0vpxiR57cpzUFmGrVTii0tol1miHuLKuFseTCNGCY0Q0OFCBP09EvuTptkALjk/X4h/epGcK4bSfqopousc8Bg22KZ9Ftx4kQvPJXt07UFw006mtkj9FfKz208zXNNKoPd93zWdwvYikVg8cJ2xFhqzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E84rGubN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV4W9ITF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E84rGubN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV4W9ITF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61285Fg5691981
	for <linux-clk@vger.kernel.org>; Mon, 2 Feb 2026 10:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3M5GIttaQ75t49IqSrWQ/C
	tOlMXTPDRQLMVJZb8usog=; b=E84rGubNZyH5Q42ND74l8bn9BdQl+Wdstt8Lw3
	4gq8ve+msaJdQ5KzOjX1AThk0VgYbilv3cYCoq2pMRs1LSSugqo4N1KYQeZZA4HS
	Xcr5AQWVKIMepC88m59mltRxCR3od0krcX+PkQtpnYEvNrPpG/4iuXd2TDeZwMR3
	DJcKISQK4A4a8ux+MU8ERz5diQQH8SN6E5HfSeyxLb8w+Ex/ff/S4qRS6lk3IKb4
	IgS56ajCKCc5QQW78O1Nq2SMnnJ9Fqxuffa3PhQmr2zhfzSIse/Z1nhNps6JChsV
	lQRPSLMM7xUUmiowrQZVTqbDITk4kgPhEnw2QnPL3N20jVog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avx52nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 10:57:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a755a780caso36610755ad.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 02:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029819; x=1770634619; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3M5GIttaQ75t49IqSrWQ/CtOlMXTPDRQLMVJZb8usog=;
        b=GV4W9ITFarQ4ceHkvl1OQZI1Kxau8yjXtXbujxbMJkCClXE8mnDAzWad1wz5nv8reb
         nzylk0RdzxtKxvd3s8tg0aK7PJPVoZ+e4haS6ytBRB1ZuVO7u4TN3GmcwgX2dbMwL+Zr
         /79xcVn+zyEK35yhiqN4oiUNFY23YipjIDIZDxghKyDeWXCPtPclYBCytj7Zv3VJ1pSQ
         Pw3vRCh71m/wReQRTO+5RgOKax1J17pirRlzIhxtYY9Hk9FAvm+4UOUnDf4IO7lznEpb
         FnKrHmJ0PuliaroXctik/g8jPcm2AurOJFqrqd8Xz9dDgKpHMcAQ2/euzQC/FYxXU6fG
         r+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029819; x=1770634619;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3M5GIttaQ75t49IqSrWQ/CtOlMXTPDRQLMVJZb8usog=;
        b=SN3oD6VTe8SKn6g0/onSh/wQfiYQtqnEcNGmyb6qPVOxbpfixNF5fQUGZSuErIBreR
         keZaYYHgaQ4QTzHdc1USRHAIrU6wyxq7KBaVGTEJDQffDdE15/7E6CZsekXZe3OfMN3B
         vnNlbegNc9UXtlT5Om4tFVdRrdbk+fcNzOQmbwF6SGeeOyog4XuQvbRKKytFWxWVLWhp
         wRLbwsxDI2JOYTfcCDfAbINhWB/LUjNEir3ehkUi3371b6lWqV03AeAxaxyy10i+0FGb
         lrGrPN9NGyvku9AxaAfMWGVN6QdJJPi/QFypV6Qo9Rxkv+gRiVCn73wnppxAhFUEBKl9
         sgmQ==
X-Forwarded-Encrypted: i=1; AJvYcCX27xXlcgMDQngzZhIkm6x15BbRDPD1/Wu6XJ4tA+6WBbvQR7BfxuNPWaZtr3Ndmhgwer+iaN1nAE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL8zz5yHDW5OjK77txdnXShQIjqyB/VGuHkyigHkyfZdhrR0Ac
	p1Zp1WBgLUfZtJzQRK2JXlXNvethwmxYogxwsxhJMFRDx3okxbYHdUF1IQ0M5hesZqNmSyzmRmx
	oINCb8iIdYwAheJavMwLwigt1k/9ZieeBt8W3JNfwiytnx0ERhqMQtS/JAPgcSz9sDx6wOSU=
X-Gm-Gg: AZuq6aIK31pbzQnlCAS/TiNnWuCiuqqmUiWDzeFOsQYX9KJd5unYEe6V9C3j6RDPIJR
	NKXuCg4+N2uom86WrC1q/INhiTlzK31PtWZ8BfqMjNcMU7fbfRlEf3VTMIQtzpgRqf8rkh20X93
	Emhudm2srShAFnmrNpkL42DcaWWp7W0Q9pQYX7HxZ/NykvIH3UXCJnuupnYglMkDeQPAfSPpQo6
	jfEnQu6wblVSLoLPUGjy1ekOR4g8gTRpnTjPobv/oRB0Pojht4GqCug7+wJnnyAfEBoHYpphggL
	RSbWvGbkpkBKRvIKQeMqDghSu514th+TwrFwNLDePjRGJXWY5tLcF46EUAn1HRVkYj5Gv3Yvcnv
	IHuSQKEB7VanL5MRodYqTPE2UtG9xfjM70w==
X-Received: by 2002:a17:903:380b:b0:2a0:89c6:1824 with SMTP id d9443c01a7336-2a8bd410e7dmr152931925ad.8.1770029819029;
        Mon, 02 Feb 2026 02:56:59 -0800 (PST)
X-Received: by 2002:a17:903:380b:b0:2a0:89c6:1824 with SMTP id d9443c01a7336-2a8bd410e7dmr152931675ad.8.1770029818508;
        Mon, 02 Feb 2026 02:56:58 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c4665sm143981225ad.64.2026.02.02.02.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:56:58 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add the support for Glymur Video clock controller
Date: Mon, 02 Feb 2026 16:26:49 +0530
Message-Id: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGCgGkC/13MQQ6CMBCF4auQWVtCC47oynsYYmgZYBKg2kojI
 dzdSuLGzST/JO9bwZNj8nBJVnAU2LOdYqhDAqavp44EN7FBZQozqXLRDcs4u3vghqwxQupjUWK
 rJZ4Q4ujhqOX3Dt6q2D37l3XL7gf5/f6o4p8KUmQCsWxLfTaYa7pa79PnXA/GjmMaD1Tbtn0Ax
 kG2H7MAAAA=
X-Change-ID: 20260123-glymur_videocc-1b5486fb1676
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: n7wMP3IcdWfBkV3qeA0L1-Sg79mnLpAY
X-Proofpoint-GUID: n7wMP3IcdWfBkV3qeA0L1-Sg79mnLpAY
X-Authority-Analysis: v=2.4 cv=P4w3RyAu c=1 sm=1 tr=0 ts=698082fc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fIyPvZiF_eL1qQs3ZgoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfX2ebi837gRPc/
 E+rNm8JZksLq2ANGUN84H2yISFN/rsHe2aP33msddRTiwZQ8Nle+EAODI/pxl86Zvwso0ukVZal
 ARJSsK5IIblmMWK9DE7/gWcven3rRgOTlD1/L1v3AK4I+pOM0EJ6Od5iRDrwiP1ZWgNzPHvvo2b
 BcTO9UpT1sHW1tXySgTfiVQGh4R86Y8KOYkIWXVV4GqFTDL5JhHMevYc6ccmOORlQp9z/1UAjnW
 qf4aOdR/TtKxd/jgKpnf3pJ2vx0Ot22a9OIThJhi9RYXhRS819oWIybZ2y+WNS4RT7BcFbUgBj8
 vJtniiw9dW9dPpsHKQQlYKtWHiVp98TsUaRp+hR+sNjV1emjOjP0vND96ud4Fg04Q/j2O2fN35/
 dRGR6cpy1PRYPtnEShyQdjo9NhHNAIz5eSJZdWevFzkexu6mTTW5PEbBIN4sQm9WRr1Do2GY6uU
 72l+Jcspdrae3WV6MGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020088

Support the Video clock controller for Glymur Qualcomm SoC.

Changes in v2:
- Split the GCC reset clock additions in a separate patches[Dmitry].
- Link to v1: https://lore.kernel.org/r/20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      dt-bindings: clock: qcom: Add GCC video axi reset clock for Glymur
      dt-bindings: clock: qcom: Add video clock controller on Glymur SoC
      clk: qcom: gcc-glymur: Add video axi clock resets for glymur
      clk: qcom: videocc-glymur: Add video clock controller driver for Glymur

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   3 +
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gcc-glymur.c                      |   1 +
 drivers/clk/qcom/videocc-glymur.c                  | 533 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-gcc.h        |   1 +
 include/dt-bindings/clock/qcom,glymur-videocc.h    |  45 ++
 7 files changed, 593 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-glymur_videocc-1b5486fb1676

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

