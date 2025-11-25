Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E031EC01B
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092733; cv=none; b=NQLfaKkyEwRHPKifhc13vG9BWMh9LjtDYVAxZs6vditS8Lz3Ugna061LMZeHTAqyP9oUAsjJ9ClN/c/vxau7edSeeE3WWBONGoY7Nxu7CfjnKyKCe7uO040bsHVQZ992CaHaxpJU3SNumM0rd6UbNPEdfZ1XbLIOOA0ySnRuY5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092733; c=relaxed/simple;
	bh=Zvng1DpAfVYTGvhffV1QBXILr+kFx3ACwyUh8CW6xwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Uy7++5guW+8aPkRTDmKsBJJPWtYkKykFSZydJD10xAylt1A1rNKJD4eeuRB3v+uQiKlH9fraA+31Xj9lyIDczX/+aH/McZWJw9y3RVm2Zg6ONqo6MWMg3xup+mJoa9eQDcGeLSGmR+NulHzUlC5CUbkfjkttW5q/K4bCgyolt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hACGw8Mc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPxjfZ5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hACGw8Mc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPxjfZ5K"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APBKlDs1672147
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BLB/dgVhe3BEdpj5a0hsuy
	Dq7Jx3wTKbCXCAOZWt9d4=; b=hACGw8Mc7aY7u017oxdLcJkj9dcYd6NSMsYLx4
	xrMiLYHKiUz8Po21hEjoAu3JakrHxUNPbZ/sS4O97Fm0HM+zFUeV2YuqkwL7sKnp
	+TgPiI8yBZWEWGKOoyp9UF+/ate4TR6FlwdYR6F1SW2z4RMU6nxXprE77FESVW4d
	DWybg/+0skKxZaSq/mGy8W9FuDxIWZnAAEQeDucICxmsIm/o7J589ObFx7p1xJBz
	NcT6K5/refG3HvOUzRgFCU2+elwPT0Dv0RNu9Y7GykiyKbm5B5OvsD6f+gU2BzCW
	rASXdGHwi8oAz2vbv5GHVO+67/2VfLa25vgg9ZoVK+GSclSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w82bbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 17:45:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2982b47ce35so61371175ad.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764092730; x=1764697530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=;
        b=SPxjfZ5KnBvGn4BFGfnyRKRgnlX1iiiKf76RNeK4u/A0B7gy7XIK59n4imqiLSWkZ1
         nyqWqrTpuztboy/dPh6BMVKNvuT6weocQatB1kCQzrDYAOJEiNVvllRItZ3bWuWE/1LW
         7N2WKdWvbn6seGzH0EjuSGsOi0U7vdw6DIfgC9pVOi1wJL+pXQNg6tAPbCgZwV/N7j6Y
         xjQW7zqLjY5LWYxXoDsQb9wbdBH+mu+d9ZwRQqztLu1TKAcS57+dHKaAkkg8wxxN7U4N
         5QeG/Bxa0v0WirKcHZ1MLBqIc9nq5gWSuxgXS4P8xnUp0QN3BYVlFWdGv6/4FgcZI7Jf
         TiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764092730; x=1764697530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLB/dgVhe3BEdpj5a0hsuyDq7Jx3wTKbCXCAOZWt9d4=;
        b=om2A12FdPvetHHBuo/S++GnSVPVEcVPU68Pcy5zO9hSSQzrltjQv/NZbjaQAOUSipT
         44VPynVuKZyxnDOzQ5280K2I7k0qLW+cExFQBwPB7IkX+GlmctrwcEY74NAwPQUQz9ku
         dpKZJ7v3m0CTFwgEwlqKz30sId+TUgxC3ykbWOWVBPGG4QmpBaFrTBGw5q16SzfPz0J/
         OSBMuB8nS+VLp9rfTELW4WLfFkWhHZ1K8PsdzH9Em8x0kgpZ/irJ87XdHcCvlbMaxoLe
         39aMA6KDiOfbVFvu9WHgOcoUVYi+/WNJgI3tw6ppPm5SgzCE3L1BRWa29PAy2ePKR2h7
         6g8w==
X-Forwarded-Encrypted: i=1; AJvYcCXd3yqvvMYhdzPbuQfXDz+RNTjGArJGpUo/g9Tpdk4HIANnUhATbSpQ8y4zTQdqtPw+q12xXdBrvsk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tP7sC8O51+beom6Lpn/SUEmlDjkM9tEWdxnp4indevh70W9P
	ILftkhzaEYtOZ86Dt3OxKH/HOx5CI3kZhEUtmFe7fr+ZSot31yRFicmliyrxcY7Nm6B9Vtzce5O
	l/Mzx9JYpc8fcIAp8NReYxbN1Ln4i3oajY9E2xKpfRuUUEXDN5AIKhlCQj2DQJ4I=
X-Gm-Gg: ASbGncvdI/konv9qgHkCb/7KF3Il0JbeMtXvlm5WK8Jn2jEYkYBPSfjAaMZs6n1yQ5x
	POdCgS4y6VB0XErO0pmumA8KDXNIFVpPYrGEv1VhO4PttX29AJ0W8qAi52/xWF/IvHEno31sL0o
	74o9WtLtA+t0Y65Ywr0OucnDw8eoYnKsiBc38jVpaF+L5kNMW59myZngzhQUl5a5fqxlvvXO5zb
	wPvN6FtTJzD3vPA8GoIWNJc0IobB+Cgqt+BV5HCXrZiOF0kXGdkrd58pk5AsLXQhyNSSZbj3Twk
	4DXRdpkDmQ0lMImIPAv1GB4zMCg3e5DRIEUskPA3o8yDK/x2m8bTOAuUQiBkDo65pFA8sM7hgl8
	NRwvjbB5DWZYGSrT9bls=
X-Received: by 2002:a17:903:b4f:b0:295:5613:c19f with SMTP id d9443c01a7336-29b6c68d7dfmr203097345ad.42.1764092730243;
        Tue, 25 Nov 2025 09:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfgOyK3bt2O6uanwsFHJxsoyo9esFMOv6LtZKMFgNWt+4F89Wuduzs1jP5jU4DJqm9YWhHUA==
X-Received: by 2002:a17:903:b4f:b0:295:5613:c19f with SMTP id d9443c01a7336-29b6c68d7dfmr203096895ad.42.1764092729738;
        Tue, 25 Nov 2025 09:45:29 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13964dsm174500785ad.38.2025.11.25.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 09:45:29 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 00/11] Add support for Multimedia Clock controllers for
 Kaanapali
Date: Tue, 25 Nov 2025 23:15:09 +0530
Message-Id: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbrJWkC/y3MQQqDMBCF4avIrDtghgahVxEX02SsgzVqoiKId
 2/QLr8H7z8gSVRJ8CoOiLJp0jFk0KMA13H4CKrPBirJGkMWe+bAE38Vh8E53AjL1liyz6ry8ob
 8m6K0ul/NurkdZV5zevmP5/kDqNS03HgAAAA=
X-Change-ID: 20251125-kaanapali-mmcc-v2-0f1525477deb
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0NyBTYWx0ZWRfXxAHTQRlCxgMY
 Bui5HhcQHNzgO68zsZOBRJwuD6Li1cHIpKEWz/YJ23hx1TXA/WCMO9nbBLuOTBjZs5nMHa+s7Kf
 fguhApPZm4FYHyZfNXdXwzeIyyamK/sVWgbIR/WGJPLICMC4Kp1RvIO196V5pqFZyT4xOYpxFpw
 +ZZVO+sTxbn94tGYdwwpDGH8n3aHX2pFs3HYd5OA1le9SXBRz7Cyfq2tkNcR7SPHep7HmKnzs27
 AKpxhFmWCY8PDinWEOHyNZB64EuwHtioSivoXNxphCvQP+KK5CbSi/ar53xAUqdhyg7MiiwOw38
 F1Iihsb2oPZCuLIA1XAY7PTpBVfALMXYERcWE1OBw==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925eb3b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b2bYCZbHhW0TxhAsxsEA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: b0ko4Dq18GersIb1DEpA0nlWuGdSkq68
X-Proofpoint-GUID: b0ko4Dq18GersIb1DEpA0nlWuGdSkq68
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511250147

Add support for Display clock controller, Video, Camera and GPU
clock controller for the Qualcomm Kaanapali SoC.

context dependency: https://lore.kernel.org/lkml/20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com/

Changes in v2:
 - bring in the PLL related code from https://lore.kernel.org/all/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
   to this series.
 - Add RB tag for DISPCC dt-bindings [Krzysztof]
 - Remove the patch 'Remove sc8280xp camcc to from sm8450 camcc' as this
   series has no functional dependency.
 - Add RB tag for VIDEOCC dt-bindings [Krzysztof , Bryan D]
 - Add RB tag for GPUCC dt-bindings [Bryan D]
 - Fix the commit log for camera cc driver and add RB tag [Byran D]
 - Add comment for using 'ACCU_CFG_MASK' in video cc driver [Bryan D]
 - Describe GXCLKCTL the newly introduced clock controller in the commit
   log [Bjorn]
 - Move the 'gx_clkctl' driver from subsys initlevel to module.
 - Link to v1: https://lore.kernel.org/lkml/20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (11):
      clk: qcom: clk-alpha-pll: Update the PLL support for cal_l
      clk: qcom: clk-alpha-pll: Add support for controlling Pongo EKO_T PLL
      clk: qcom: clk-alpha-pll: Add support for controlling Rivian PLL
      dt-bindings: clock: qcom: document Kaanapali DISPCC clock controller
      dt-bindings: clock: qcom: Add support for CAMCC for Kaanapali
      dt-bindings: clock: qcom: Add Kaanapali video clock controller
      dt-bindings: clock: qcom: document the Kaanapali GPU Clock Controller
      clk: qcom: dispcc: Add support for display clock controller Kaanapali
      clk: qcom: camcc: Add support for camera clock controller for Kaanapali
      clk: qcom: Add support for VideoCC driver for Kaanapali
      clk: qcom: Add support for GPUCC and GXCLK for Kaanapali

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   63 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    6 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    2 +
 drivers/clk/qcom/Kconfig                           |   38 +
 drivers/clk/qcom/Makefile                          |    4 +
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |  437 ++++
 drivers/clk/qcom/camcc-kaanapali.c                 | 2661 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   20 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |    7 +
 drivers/clk/qcom/dispcc-kaanapali.c                | 1956 ++++++++++++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |  494 ++++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |   76 +
 drivers/clk/qcom/videocc-kaanapali.c               |  821 ++++++
 .../clock/qcom,kaanapali-cambistmclkcc.h           |   33 +
 include/dt-bindings/clock/qcom,kaanapali-camcc.h   |  147 ++
 include/dt-bindings/clock/qcom,kaanapali-dispcc.h  |  109 +
 include/dt-bindings/clock/qcom,kaanapali-gpucc.h   |   47 +
 .../dt-bindings/clock/qcom,kaanapali-gxclkctl.h    |   12 +
 include/dt-bindings/clock/qcom,kaanapali-videocc.h |   58 +
 21 files changed, 6995 insertions(+), 1 deletion(-)
---
base-commit: 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
change-id: 20251125-kaanapali-mmcc-v2-0f1525477deb

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

