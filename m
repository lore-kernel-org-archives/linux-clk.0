Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2269130274D
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787143996; cv=none; b=oR5xr3gBhNt4V8rih5yjX8GBRtrUMomuMVgwCNOrVkFpXvZJSnaARl0P/sqATEKdrM9rU9GL0EIr6sY2EktIO9GrS2rMR5RVrzdpC/QcGBPRqv7ghc4qY/rIz5WT+dk7AkRQZXey4xgY/IJExVEFDe58oT3LaJ5XrawgqJ7Om1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787143996; c=relaxed/simple;
	bh=aocfws8Kf4eH/Sw8YBlJiavOC8ubRD9ZJHDiRz8wOdQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GJfLWBW9OZfci0bK1lHEePcuRI97YIDJPGs9I4EFtjn8DhClYjWQEuSKZoM66/6a1OAb9TAfrBTteeYZz6LZKieC/gngkcyNnf0npVvK7oX6FaZaREg59bsmbbwhwi2raiuXhuJXoaYGwpmwrkTMnuP2OTLXss/er8B22Zm3EJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mtr60RZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gEn4/P9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mtr60RZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gEn4/P9z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClPdd663167
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W4Xj50xooKVvZ41LfzpQRG
	7HYPYstHlBe1B3U8mLEO0=; b=Mtr60RZzKx7Vi4+bEoyhNS7qjhyaYU3eEfVlkr
	F1nFZyzU5c64qBW631XDKV3er+PjEgu5mwiU4puMCDklqwhwCn1/4boHHGmMWoWf
	eWSZqRvga+lF+PxtW3VrQkUDRhdkF/AZ9yC2RAP5/Xxppa6B30v3SLG9HBEb2Wfz
	TTKt1yn4+Wv0QAsTmYrr9kj5RfZiOFMSx1TkXwB3+LImsJ2Bd6noe1hwaEN+ezgx
	asYaBbsF7GIHC7qMdhnVHrEBm9yfvTMnIlJhNErUXLBSkREBzUlyWf5XZaAcyt5+
	IdAnfn0Az5KsMGHkHSaSk8M3txs3jqeuE6NlmBbuLHJ64K/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfmb7r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 12:53:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936a796a23aso87764785a.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 05:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787143993; x=1787748793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W4Xj50xooKVvZ41LfzpQRG7HYPYstHlBe1B3U8mLEO0=;
        b=gEn4/P9zpkJ8fMiArJmsvD4MoklPtP3TPi5/LK154jB+BfRPPiinH82CEzRIZNVV42
         ltl8u6DbcaPdDnB8QsulxWeBOl67D4YbUBiAcqAeCRRC9LYzO3ZdD3PO8wVwdebWrJzd
         xlIuPgPO1Id1db0i9EuUQfm5mGlksy6IO4buhQOLSZfYIjXLGZEkWkzL/97BtTTK0YvI
         CkEJxDMRPjB/WgLUlCMWhmVSNnMyGOV78wgOcu/prqvJdpZ/MPnek4gwHMWDDJ03hPR9
         PoUiKSHvvYinp3vnzfW6O0KqTpQS+XOrRoQo1nfwxqXlmMecH0pQQWHJNkOg1NjZUox2
         gBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787143993; x=1787748793;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W4Xj50xooKVvZ41LfzpQRG7HYPYstHlBe1B3U8mLEO0=;
        b=HOfOMAySngsxCPqdodKyP0zsEghMgYseYOHA2FYCbdCONoBUPJw8d9ORwuqq7yqZA2
         HvPNI7bowXFSNNT5F0/Ytajl91x9aGWG+020TnzTRBNP7WsHa0enOoC5JFZAxq+EGkti
         YgcH8SJXC734+uA7G9Ac24NJvW8ebC5sMcVVXiW3te3TeDz1xDFMnzR+cY0QywI7N/xX
         mGOQoDa/CdXvlCsfc1w1euZMrASVTyS/HKuWrdRgjAGP+HqDuT0xoZnekzVgDuxNi+7X
         Qwu+MC/Au8sL+cibEL5dj+XuGq1zECp5qhVfnAgcgo4sUjkTQ/UO8i8i2XM/2ScWzBbZ
         L4DA==
X-Forwarded-Encrypted: i=1; AHgh+RoZDBvwEK+6wNXf9O4HEdoRK8Q3UOcSeIJI8VZ3RT8ds4RGy+vbqjLs2+Dglz5Cf2u+GcxWVi1Fp8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyuAXdUNIYj/n0pvudxGs5w9GHLExGsGOUTpgy0d4jeQs244pd
	BZImigx6EzaoFKN+pHdH0IcIgwI/Mr0rJkHiEGHBVQiOmquvJcoZ6PwHET7MAYnjIDiyzE2arbo
	Z8H1qZFTkAi/uxtlVGJaAW8qBOi1q7xuzoouSJnK7WYc5lt3vBHE6xutkkxpGnKw=
X-Gm-Gg: AR+sD11mfJ6CpZ3D38x2yEU78XrYeGPUIwz165MGWsXVmjiSDzS/IcprHAbl0jN6pwG
	rFIQMpS90s8xVF1Hq0iDGhz/luMVUymaYt4O6ZsvQOu4nH4oxJ4sgMLy7j3IQx1I0kCQVqDfjcr
	hzeknVrygzuOTU7S7zKTGdLnGHIbs4spLaRnJI3IKd3lGnautmaQMfMGLeRsj0D3AahfPfL5xBX
	esunp1Wo3cwa8AOTNGFP2tLvFl/iIncSpn4fh2lXRf18Hk7U59Ko75xVcUxBHYCNyd8PMsuU0z5
	SaTbSmWhICgUBWcSbChFFN3eKpMDBXc8vE5lQCS+FsoOWnRoPVQcETZNGwzfb21R7RqVe3j7ooa
	y/H8dFhy4
X-Received: by 2002:a05:620a:3712:b0:936:e3c3:8cb8 with SMTP id af79cd13be357-9371e6b89d4mr353298285a.45.1787143992978;
        Wed, 19 Aug 2026 05:53:12 -0700 (PDT)
X-Received: by 2002:a05:620a:3712:b0:936:e3c3:8cb8 with SMTP id af79cd13be357-9371e6b89d4mr353286085a.45.1787143991242;
        Wed, 19 Aug 2026 05:53:11 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:10 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 00/16] clk: qcom: Tie CX power domains to GCCs
Date: Wed, 19 Aug 2026 15:51:45 +0300
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGmhWoC/yXMTQqDQAxA4atI1g34g7HjVYoLjdGmoKMzowji3
 Tuty2/x3glenIqHOjnBya5e7RyRPRLgdzuPgtpHQ57mlD4zgyvbCYMK8oHB4siMVAmRqagwXQk
 xXJwMevynr+a237qPcPid4Lq+X4pV9XYAAAA=
X-Change-ID: 20260819-qcom-tie-cx-to-gcc-67e6697639b5
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aocfws8Kf4eH/Sw8YBlJiavOC8ubRD9ZJHDiRz8wOdQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhabmcGAQo+AgyO+pdhoONhZ96Vq0a3hnMoZKN
 g7CUF4C/LuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm5gAKCRAbX0TJAJUV
 VhhOEACw96knL/mvjuEArdHD8XF9el94DR2ie/OGimOQCGjS4UnVDeHFms65M9aJiugfzzu7UIi
 6f9VHM7oe5NwcnMbLIlTkj6aJ5eOWZy9pcZX6iH9V+STHEoiIHYnvdsneoJk8maac1P+j45J4ms
 cbaAtFakeFa6CYlsLfa1vdPVZc5haeh2ZsMVi5TetvkRulyzik1P63SxOWt4wV1NMjTjxoQw7Cd
 9ykT7hPuYQCbl7CPpXLqQI7sYajeiB2T/Jtjc7VgMknYlByHXT4+zHVBPtDuBP7feuqlLXLQp5Z
 mWTvx4x3Q/3DCLZoh3ucBvysGko7n/DFPFzh6YTXCT4RGwloFB7MMoJMxXOX7wJvKcTvIu7iTYs
 TMx4dTjr+iP0GLrGZgQvocLPv0JtXzBfp5lkpjvyxz1UEE/R66aJdFIgl8CmImoRz2TyhZob1qc
 F6ov9pSq4tNKyLRNaqU2ZmMvau/LZSqKZJgFIxU6veI4FzIaRqK5Qhv7GnTbbZNaS7uyV8hRoat
 87sgdhazgKwf6UdbK4Rt7vCVm7KAb5xkfafHRgTzeNC40RF5n5dgchmfmQqoT5/7st/dCQ71/vD
 y+ny/gacIeziz4PYm9TqspKqbFiMxjI+PuZOXZvoaWY0l7PuLlRavzFMzjJ2f+2/R5U1yBzsktj
 r+rO2buiRCodKcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: RmQPRMk6X9qVbMch82P30dIrCH1H23KF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX73Bv7pcuDfmI
 NiZi0iPWEpclUztwO+qQC6DtjUUHJqpT3hwRlaGyA0pKtdfLh8OQPeqbstA26RYarmUthIbN0mW
 cho17RZ4EpiYHP+MkcPkF+TrO1p5w2U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX8yFIBegSu4eC
 GGVxg/n1KDlivXi4fjPrJ3LU8Jzs01eQN4SaDX+EDdG1M5v3pM6yckMIlg6AuLmElrDviHu9XE1
 oHKMjSDWH4zFWzLCv6ssfOa8GE5gZBQltW4ABGPnexH+htGhHnyoeUn8F2ydt4DMdyxeJeV0TNB
 GuZ7WEBzktLF+MIDhmAMTM/IyN79Lt0EXQdTz213NUcVHTcP9B305CjA8jI+4OwbRdrTVCqb3WO
 12sx+nu7q9LSIKIdiqUfngvvdHcKMTJ3ifUJTm+aKwTa74Ta70psn8eEQKto2987qIpAkTxjKIA
 kiB0qvGUiOkIA1EJxK7Bvbo8dMqrUbDV8sAxB506xQm5CA5zSJ+JmFrY9fBb6zLrr8UTzXHauHm
 /ADensfDYY8kK3peQgc0sr8SVnlKCTc12sWrjOdv0gimy0AzF2d0ruPjSEu4CKKkols4Mtr2DeG
 OSDmX7F6/2ihFRzGZdw==
X-Authority-Analysis: v=2.4 cv=aNrAb79m c=1 sm=1 tr=0 ts=6a85a739 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=iXTosI6WrnVeENpZgjcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: RmQPRMk6X9qVbMch82P30dIrCH1H23KF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Tie the CX power domain to GCC clock controller for SM8250, SM8350,
SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.

Also enable the runtime PM in each of the GCC provider drivers.

The existing common GCC schema accepts the standard power-domains property,
so the bindings require no update.

Only Kaanapali requires a Fixes tag, as runtime PM support was not
available when the other platforms were upstreamed.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (16):
      clk: qcom: gcc-sm8250: Tie the CX power domain to controller
      clk: qcom: gcc-sm8350: Tie the CX power domain to controller
      clk: qcom: gcc-sm8450: Tie the CX power domain to controller
      clk: qcom: gcc-sm8550: Tie the CX power domain to controller
      clk: qcom: gcc-sm8650: Tie the CX power domain to controller
      clk: qcom: gcc-sm8750: Tie the CX power domain to controller
      clk: qcom: gcc-kaanapali: Tie the CX power domain to controller
      clk: qcom: gcc-qcs615: Tie the CX power domain to controller
      arm64: dts: qcom: sm8250: Add GCC CX power domain
      arm64: dts: qcom: sm8350: Add GCC CX power domain
      arm64: dts: qcom: sm8450: Add GCC CX power domain
      arm64: dts: qcom: sm8550: Add GCC CX power domain
      arm64: dts: qcom: sm8650: Add GCC CX power domain
      arm64: dts: qcom: sm8750: Add GCC CX power domain
      arm64: dts: qcom: kaanapali: Add GCC CX power domain
      arm64: dts: qcom: talos: Add GCC CX power domain

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 arch/arm64/boot/dts/qcom/talos.dtsi     | 2 ++
 drivers/clk/qcom/gcc-kaanapali.c        | 1 +
 drivers/clk/qcom/gcc-qcs615.c           | 1 +
 drivers/clk/qcom/gcc-sm8250.c           | 1 +
 drivers/clk/qcom/gcc-sm8350.c           | 1 +
 drivers/clk/qcom/gcc-sm8450.c           | 1 +
 drivers/clk/qcom/gcc-sm8550.c           | 1 +
 drivers/clk/qcom/gcc-sm8650.c           | 1 +
 drivers/clk/qcom/gcc-sm8750.c           | 1 +
 16 files changed, 20 insertions(+)
---
base-commit: 5453bc3279e9f8578ac3e534d476240e40c879e1
change-id: 20260819-qcom-tie-cx-to-gcc-67e6697639b5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

