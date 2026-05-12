Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A363E1735
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591147; cv=none; b=FijRYch1yLF7QAuTLHROFYCbRJ7fT401ZJx2wDTL1MZ1Xnc8ltsHI3W6i8H9JcL39AKPZqfZVoo58WFXTcMSXArKchAXmFA3+nnT+fyCgr5JoIH3k3lPQJu6r8HL03hWd/W59+b2R9kfX8uHYWkboh+avCTEy8hOjEWN9lsMOho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591147; c=relaxed/simple;
	bh=E6HTe7QhWugVTgCEx16GCBmY8B1fRy9ivVI2YY8eg8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WOBZSqvZwF21Vp3SsK9JuvtP4deXW7MEqDpBRZL9m54/jpRxYrxu5SOPQ8Gi7QajQJb1DhPm4kV7tR8G6Rt28WBVIXc+S7WO8S4hEa0CSByBZL+qGzcMULoEkmoDDzdn4Te28aofNk2R/NlATfZuUTwcAvhwv7EXGze5QqnwkLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9JtV2wp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyUc6BdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9JtV2wp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyUc6BdK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkYEV739985
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5rK6KbR466mqH0pAQLxyFa
	oUgNlu3VncNyO+h/5FL40=; b=P9JtV2wpam6BStfEJjDS32ktWUaQauosANpT/I
	raA/tO3Av7QuNTS6Chn5WMCAX6I37OvzKvLO66r3Wi87DtFR6nxJfzZBq7efhG5L
	RX1g5TvvwEMY5bvNuiDnoC7/uDsaOdPXy6EI7WISYDZFQhOc61Cpf8LbmV+VuGJx
	VA/1i4IWYZdJKkZYLI+jldwwVZPFjmYWX4yPbKUhK+eLugRhJbajiqjGRNSpRAh5
	Yz72Fv/xRk/PLQ9PZG4cWLwgSQi17DPjle5xt9OQD9JYdjah9FyEx5FAFgvlwcE4
	hVhAkNPnAA9gREdKbOMRApPT7llvgo+ANNU9bjRnKOA5r8CA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrkhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 13:05:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7748d0aso48439515ad.1
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 06:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591144; x=1779195944; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rK6KbR466mqH0pAQLxyFaoUgNlu3VncNyO+h/5FL40=;
        b=GyUc6BdK6iO0FPe3wvDz+q22BJ5JRTS0aoDCd2lqOPw1HoS3TbovwEUcc8SM2IupzA
         9ddpaWMiTZL6VNBve4miMyHGabLmV90/6fP2o7KvyFBHUSuIUuA33HXfbNMUJzuMAgfd
         qOhMduqJDm4FrtkYGwCBtQuOhYfJD/b1VTpK6czgihvUPbKzb2Sdgcyd1+Ie1lUd148V
         U5K3bFi5otdSIZ8Wkcj/LZEUzSQrbIQiZqj8CyM0Ux3lmt8qhhlEHOVx+9mFEQgUV0Wc
         msgFK7ZWtoE4pKQ7fj+F6SWIvZhSYCmJr6ym3AMvzhBz+FdW0xEUhArjWAhFQoiuzN91
         vSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591144; x=1779195944;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rK6KbR466mqH0pAQLxyFaoUgNlu3VncNyO+h/5FL40=;
        b=WKuSXDpRKCMlg7O5m2MeZD2RJAL9NjgQhemCo3NKFWz0qScfVOdi33ZJ9nHI7FEuYE
         LV8gbCzD017f8bxfHCuN391NcrgXDO8j0jqqRaunXNX9/5nTm99m+o+7Dqx3M49buwuo
         7VjTmzm2ps+62mQx0FPT1bOVI+Kmm4GfkPDlfidE5EYtUQO7aWGxTKYrhkLfS4DZgdHN
         i0kLBeejPsfYAqfHcOI4+goXyrivHOFMe6cEowi6ILnv6aJUgnRW+zFJAr5pckI56i4U
         u9esgIm+LlTo83fDxWv53sAtlYXpVTUB+tmXNA+4E3XiPqg9rLOyS3HDHh831+1noIIc
         eL1w==
X-Forwarded-Encrypted: i=1; AFNElJ+flQu3O28iyPu1V4Lggo3oodXgKXRkCgwWkKL9sJ90mTCCi4Sf0V/g5AVOE8ShMOi+7j1w4Gt+LxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5bAhHk1CShLEBEJ5ERd1/vOhQzIvBDGNK83/h2pUaQ8durez
	DNHj/EYhok3zQb5w8TOxVlsBdtfqj7MTeFh2ojdAmiVCaALCifsZKS9ir5c0oRUOGk40Ex5mBhr
	pLFsrdy2uc47Q6EOINF25VY6sgZH3YILNXV2lgmaro+9qW8JhrO8TVZrcpoOtXzo=
X-Gm-Gg: Acq92OGyWEP0xw9DibAC8qxOmEOUG9mxT7DpasHn0LYwEJQGIFq0Dfhd3q0bBykW5tR
	XjqYffh85NJ4sSAwWPoQYOYmCbAaioRWMuSjdwiL1cKF3/FRdXw1CGyra27hFUtpL7V0Xl/ItLW
	zGGFZDC6CEo9jkaq/ntjcTMGUemoSDokwoST0oyQ2VSxQK2s4HeHCfENpoQwo80TeGwx21fL1Jt
	Bf7iupRbwV623Aqu5ynmcN/Yqn/GfYgaGRvCpeVZWu1yYolrK7f7QCFFOzF3CF8VmVzNntSrLxR
	6MkH9RkNL0CkO8CdMSX+FypouP6RuaNzhIvt/yT39uhGY59LhEAlIqN/+ZgT8WCMWq/vdCBojBF
	t0q/m5C3mhuivsp/1aUmDF7Utqytp0L12oTp8NYfQridJI4BRNDTv
X-Received: by 2002:a17:903:3b45:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bce299510fmr52780065ad.18.1778591143588;
        Tue, 12 May 2026 06:05:43 -0700 (PDT)
X-Received: by 2002:a17:903:3b45:b0:2bc:e299:4c9e with SMTP id d9443c01a7336-2bce299510fmr52779605ad.18.1778591143065;
        Tue, 12 May 2026 06:05:43 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e36c65sm137630785ad.40.2026.05.12.06.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:05:42 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add camera clock controller support on Glymur
 platform
Date: Tue, 12 May 2026 18:35:25 +0530
Message-Id: <20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUlA2oC/23M3wqCMBTH8VeRXTfZjn+mXfUeETG3qQPnasuRi
 O/eFIKKbg58D/w+C/LKaeXRMVmQU0F7bccY2SFBoudjp7CWsREQKElOKO6G2UzuKrgRAksFlOW
 FbIqqQXFyc6rVz507X2L32j+sm3c90O37huAbChQTrCrJScGBSs5O1vv0PvFBWGPSeNDmBfgwo
 P4xIBpEZK2kNWNVWf8x1nV9AYHNHPTzAAAA
X-Change-ID: 20260401-glymur_camcc-de21745db58b
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNCBTYWx0ZWRfXzpotyqNbU1M4
 Hawns2F3E3WBWdsIsWyZBhzjKJJbvNu8Am6IoF48V4wLyYVX2knjOjgm4OnPvNnOsvlf6WU5Uix
 w5v07PJNKatEy2Rs1770jA/As7B251yRQx+dogFpfHVK/RU6ezB/vos77XmdEmTwSVMt3yQHN7T
 yV4H2v5SxeJfesEGC5jmEv4np0gRC5lmI6w5BgDzLQ6uTAAcvDcEQydiW8H4RsLaD29WrOSe+I+
 lbYxNxXUJ3MZ6JocXsgwM4v5IRXSngWdFJJoLGq/ohCcvmIqfb3VXui2ORsWBPTkNvtkrg5/OdY
 D6usE774VLNOSTh/MfTsAVZvZhebk+Se27u7HP+taWa0YAjqq/3yy1Z9VUK2JO7iMu3jmSLiuoQ
 Y7dtZ34XKpSIVHGaChwncqhnozu+7smvtOsdAruK68vyl8jAeofIMUcmNR1OzAGk1jJDjYFU0W5
 ZVvyksKE2jzQoj/mDLQ==
X-Proofpoint-GUID: wQ5756txItxN-CGgieYv5FXNZMPVG_EY
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a0325a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z_Sb7eu1-GLCsw485GQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: wQ5756txItxN-CGgieYv5FXNZMPVG_EY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120134

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v3:
- Dropped separate defconfig change[PATCH4] and included it in Kconfig
  itself [Krzysztof]
- Included glymur camcc header file in the DT patch
- Added R-By tags received on v2
- Link to v2: https://lore.kernel.org/r/20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com

Changes in v2:
- Updated DT node reg property to use hex for 0 also [Krzysztof]
- Added R-By tags received on v1
- Link to v1: https://lore.kernel.org/r/20260402-glymur_camcc-v1-0-e8da05a21da7@oss.qualcomm.com

---
Jagadeesh Kona (3):
      dt-bindings: clock: qcom: Add Glymur camera clock controller
      clk: qcom: camcc-glymur: Add camera clock controller driver
      arm64: dts: qcom: glymur: Add camera clock controller support

 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    3 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               |   17 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/camcc-glymur.c                    | 2280 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,glymur-camcc.h      |  122 ++
 6 files changed, 2434 insertions(+)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260401-glymur_camcc-de21745db58b

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

