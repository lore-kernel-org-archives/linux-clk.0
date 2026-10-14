Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC24FDE47
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994769; cv=none; b=NDJsKC09ZPea3aJtQHRDzOqYLz7K4/LTuXitbjGIQrEIfysNE8ol4p7YD48Jx5x2Zv6bYSIm5ZyyczpQWkimYDVvOmuIyda7HAhc04v1mJYcGerhpYctfizik8oTQPh3s+rmr4YlaSCv8P+M2+K5Vr88eSgIPafrreumnQeuidU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994769; c=relaxed/simple;
	bh=C3SNj+o4nSmOZQcsvatoOKv0uXSF6BYXRfbVTfTvTAA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OI5L9fVeUKi8uNUU1r8nnrMCXTEq7P/K2zN5XPAe3XKnmx3+yB8n07exXt2Ol/RHq3kg8LfLZgdDlWsrQ5CPVkK6CXeVCQ10i8tzgLbP19/kfN5jXhc4cmR3T0JEbvU8sfL9w3RZB1zzQzENDeEqlsFeiYvFD2KpgNJ79dI1oeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AunjBc7u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IypHFoVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AunjBc7u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IypHFoVM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb042905393
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WLJdnOu7zalmLPYlOcnVTI
	+JOF39KQbZ+zn1YXHnHCs=; b=AunjBc7uMMq8tgxtSwxU144uc4pMa2fafLl2p2
	QoheRVaumtjh33CGvylRWezd/zUUTLxe1MlwA5LSKbk8R+Pv9jznwD4nCjQjz8v3
	h4Sidfx3ddfdW8qktcX7WeqxYftx48IjgXxBbSLU2Z2Z++OMJXxgTO1zlCivWVQ9
	frPceb7tRQtDcsPCSrC1PvyTp9AMbFtqnNRmeixxh2EECqxPBJrufAHT6Doz59RR
	RegN9B9TOkKlglSNR77P5HVVgzK57fq9nlc8fXIQ6yT7IkPxLlshiuXtvz1fOWLO
	VgjyFURJ8aDY+xECDzkAnWKLtxRKgH0Yg8oDD6Q2eP47YntQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2gxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 16:19:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so836871085a.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 09:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994764; x=1792599564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WLJdnOu7zalmLPYlOcnVTI+JOF39KQbZ+zn1YXHnHCs=;
        b=IypHFoVM8f5qVwW297OYGnEcxDaJ/ubMV35wLx/USvN6hjL87Hdw0mzljXyJKLU7wt
         yn7yk9X86C+V3rYbd+PC7GYK2ZrhYgzXTPC7OgWd+jKLeiXXyen93Sl9qBYgXXEykxZo
         TsJeM4K2gJIt7vR8hN51RMmYpl610pMFQN5bdHWqL0xPRz+xG+vgRXPLKUHocYPR6AxY
         pY7gf52dV3vv+wguetHo7vqnodE6bPP/IEvoXrD96ehmUukwWjM793P/WA7Ho2POU50f
         DeyRz7k1G/NWvKviRJa7K8z00jnrFxQnXw+3sKXF6JAgdd1MZ8KlD17qnktF2lg4LWzH
         fTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994764; x=1792599564;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WLJdnOu7zalmLPYlOcnVTI+JOF39KQbZ+zn1YXHnHCs=;
        b=QrDqJvN/eTrrA/9rYG1nEijtvUHGn0pRxO6FRS4EX+81uaRjUAvL1+n78M+QNQAY13
         z/m8FmFrfkMtWnvMYrOLeLaq+KDNAQ5BOrX0jFGY1OuXPwuNwONARV/sA72GX6V3P5n4
         4n9ExOC/DM0g3I2A7EElv0BM3moOzPhuH79Joz50mZaxfWMqesX/ow/HHKeiikPd2Z0Z
         g7EiVfjAtidP6vB4owOVt3rlXs/QpcekjrlEhcjHO+dWVCpOqOe7i8kezbYllzyc1USw
         0S9JZu95N3APNTwJRUTbOSE9tnxC86pvR9A3D5YB8Gxy2nX/A3tCiP6iJdIzuV8kVTIC
         zC+g==
X-Forwarded-Encrypted: i=1; AKwUvBxJ2lNGiBQ+KGEj2YDshLMmKt/jgXtZeNhf5GK+s2TsSoBMQyZeiMujuGd6FdxQIbflM8Rat64Cn98=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt3rY1NymiFcXxB+kzPt6uBnUE7otWBf50Qb+GPhTTCBQ2xk5A
	Dtrg47lInu3ralBXddjBLV0sSoy94abuLiiKRg9ZnS+cSO48oPcjHIog1AKvSzBOpciol3DBzey
	KVzc/xaFyxQfqQdTVpxECvMK8VTW85s83Cqt9ZuTn1AEqREuHK+R9u0S8rPYFQzM=
X-Gm-Gg: AYBFou0/u7Ibg5Sf8UkQ/SzFW6xvz8Xh2zOUKMEcuyTO53FG/n6oO8vFZVpH0r9qopV
	cAUa24Dpojv6VldKd8RYKIaC0FHOb65tPU40ndrp40i7qadkR5JYrQf6uxHHqReBXBywveib7wm
	jJP9rt3OfbjAbJToYpwDm1msGxr6D7gz1g5kpOChYTjtdUX8RnFSO6k66fDWOdeCUlTnJJ99KRa
	QaGakcAz3fM9aOtA3PY3c/v4I0RMm0m7wK2XP2OOReaBeVzQ0f8tsuAXe5VTFGthoxy+DKp79vE
	kdrdMJBUhSTOV10UgFixL9EMlrJl3HV1Fh09Q8NpTxNYs5f9+yWEFIooxyp+xY2MwhNAvJZIwAT
	QL90Pp3DwdufYQ1woEJmjQ4x/jxnppjyzm21osfOJL4Wk2ONoxkz+Np7W9BpiZjmmzR6DD/UMch
	WRhnoGX2Ty08GH
X-Received: by 2002:a05:620a:1789:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93ebd233be3mr2728370485a.43.1791994764214;
        Wed, 14 Oct 2026 09:19:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1789:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93ebd233be3mr2728364485a.43.1791994763716;
        Wed, 14 Oct 2026 09:19:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: dts: qcom: support SDM845 HDK
Date: Wed, 14 Oct 2026 19:19:15 +0300
Message-Id: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIOrz2oC/03MQQ6CMBCF4auQWVvSjnQAV97DsCCltY1CtaNEQ
 7i7FTduJvkned8CbFOwDIdigWTnwCFOOXBXgPH9dLYiDLkBJZJUiIKHsam08MNFtBWR3ktTIdW
 QB7dkXXht2KnL7QM/Ynpv9qy+3x+Dqv5nZiWkaIicakk76+pjZC7vz/5q4jiW+UC3rusHLitGb
 KsAAAA=
X-Change-ID: 20260122-sdm845-hdk-9466530c4267
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2523;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=C3SNj+o4nSmOZQcsvatoOKv0uXSF6BYXRfbVTfTvTAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uGjdwxsEiRA5wBpZhF5ZT2usgjG6+BD2jxf
 iz4Y2so3fuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+rhgAKCRCLPIo+Aiko
 1WDpCACBIarplL/y0Mo5vOtfypBdG1ZflLKgW1wwjSJPLPPT3rgF41+93qBvGYJPAnePANm+c+C
 SqLqLNMIzhslGqMJ84RvxMbjS8B87r1uRmjFSCDvPzfH+/U/hlbkquIPBGLGx5fSwMEU2yXvu5l
 Clyn7wGI7zpk5cQBqhLSj2KLjE3XP1aXpqU2dN3p7Q1Y3DkQYskeJ7GbA5htdvEYdjUrNVfChTA
 0/tVGXTiRvLCZbGDlt8U6d3eGWejGYzrdrqlsRFh9icm6Nz+eqBgi18s4pzyEIPFYNtXJAmbIKP
 SdaMy5KlHFO5BnPWPzyNZDwQW2ig1+MQSfd3uIR7Z6kCJbTY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX+f+4Ku5DZzGX
 rmkTVRU5Yso2OIJfQAKduRErHFjD0kiMVUhzVDr1FD1O3wwihc5VyMFkcTr+CJTw7ocBImIOD/h
 9chaQkwcRSHSvvvUcC4+hP1W3EXthQM=
X-Proofpoint-ORIG-GUID: NHW6jW42lBMM-Ygn7mW_MxOye_aPfJbF
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfab8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=e5mUnYsNAAAA:8 a=S_NnZ3hT_RIKTG7XCKUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX+ImIMryp++re
 TP5I/g/9SUgScGU01HvxZvQ+YkdUnjMQaTEfpl9CkLrro8KMSuInTqgyyfCUIWhEp/pmwV7apjC
 r9N6goiCLuQchMQnPeOpeeHU+smYL1VtdAnWIVhJLRwaSGQRX0QoqnoUHNSo+RazQuLco15JhqU
 Gxx2fgllzZwC9yjOPZJbDe4/jLbdoF9cy48gloIf5lHQc38VoBD0tOcsxnjSHL/tvWyD73wKAN8
 HomjI0PNMVd3Zr0pJZDfQWs/svdo3x6JfE4uD2geEIV/VGm/Ph9mrIW/7+yFJ7QHZvj65Em2/Sb
 Y25ibEFJ60zZDnJa8ycmmcCpsYZer6uILTyLWZbOf3tt3Y/hTXBQSnjGpLwChZ3FVZVQUHGBJ4G
 B2fd7rY2t8+qCagV6VqC7OBArqZAwuczHNDi1AljBv0lgiVWxWSNqKxq4cbN86A+q7Ss7Ukk2xA
 uoqFCUzQ+17URMN7GZQ==
X-Proofpoint-GUID: NHW6jW42lBMM-Ygn7mW_MxOye_aPfJbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064

Lantronix HDK845 aka Qualcomm SDM845-HDK is a hardware development kit
for the Qualcomm SDM845 / SDA845 platform. It uses the modem-less
version of the chip (SDA845) and provides a rich set of the peripherals
and connectors. The DSI panel is an optional addon, so it is being split
to a separate overlay. To (hopefully) ease merging, the overlay is split
to a separate patch as it depends on the panel. The base DT doesn't have
external dependencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Dropped MDSS reset patch (Konrad)
- Added panel driver and the display card overlay.
- Link to v1: https://lore.kernel.org/r/20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Dmitry Baryshkov (5):
      dt-bindings: display: panel: add Truly NT36850 WQHD panel
      drm/panel: add Novatek NT36850 panel driver
      dt-bindings: arm: qcom: add Qualcomm SDM845 HDK
      arm64: dts: qcom: add device tree for SDM845-HDK
      arm64: dts: qcom: sdm845-hdk: add display card overlay

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../display/panel/truly,wqhd60-nt36850.yaml        |  98 +++
 arch/arm64/boot/dts/qcom/Makefile                  |   5 +
 .../boot/dts/qcom/sdm845-hdk-display-card.dtso     | 109 +++
 arch/arm64/boot/dts/qcom/sdm845-hdk.dts            | 820 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt36850.c      | 343 +++++++++
 8 files changed, 1387 insertions(+)
---
base-commit: a7d52d51b31a58da686320f5e4edac74e2dad682
change-id: 20260122-sdm845-hdk-9466530c4267

Best regards,
--  
With best wishes
Dmitry

