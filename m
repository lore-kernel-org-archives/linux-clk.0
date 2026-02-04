Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF54823184F
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 00:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770166797; cv=none; b=Ye7Tj4SXDvYNSesaVtZaBctcMlKymTsUEXU2CTMe28ek/XN7w1sRHkTWqndY6VoSbDM5JQWH5eUItxCd5SFvStxU21KB0VjtOgoe7RMuYd/aR+jf/2S914WxBTZfRBldUilVk7JLYJ/Yy5yKXHrnLXUUpDWRYERQX4T/ortu4mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770166797; c=relaxed/simple;
	bh=Gja9rC7/ll+jARYKe/0sDqDY8ostmhNW63Lo3AZnyVE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=azMcoEps7zrcjYjYrp+J3pVGrfmFWm8JTgM8+BX/i6ppNW84BTvAe8Y+UXdO3DJbTAq8OA/o8OoJZTxBuwaFT//pZNn7+T0TAnrLUA0BjQsKmnxKxuJ/RpwefRsGcUHz3IRjH5wAAcGm8IDZ14zgUTs3C/hOV1TNqrZFkAZReBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wuuq+h/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SK/kZmgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wuuq+h/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SK/kZmgH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilkf14122714
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 00:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zBvPx6FXEvB3N38gi+R6LA
	wyy8oL80YAbc2tW9ebENQ=; b=Wuuq+h/5QOH6Zo4xR6MkN8bmMvFnx4BlQ4THWy
	MiS2+GlSHAM/lBu0cyNLFoI30YmlvQf1QX6BiJ0TGjjCPHGm5J6ikUxD38ZYTPyV
	lKlaSW3s4J9EdAPsz4xiWfexiKelc+BAapnINZLT43f9hoRJfB2Tf3mxrNhdGsJG
	ImXa3S9DakVVH/GcO0IRwxg+16wXQ+3Qad0It+RMMBPN2zu4irWtoWWQloMtsDq3
	l0YiNOgfs8lVF0/jem3g7eVMrAfuknRgaN8GHUFx6bmBH8O7j7TAAXUlhosPsw4+
	E6c0M2CziyS1pQXMqrateW15vt3eC4a5Ej7Pqxf1r1j72z0w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkhxrn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 00:59:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70b6a5821so84736885a.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 16:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770166794; x=1770771594; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zBvPx6FXEvB3N38gi+R6LAwyy8oL80YAbc2tW9ebENQ=;
        b=SK/kZmgHaLVKhhSrwU4mea2beth9LUv371LEFduI43pO8+Ysq9kJJ7wlWK/fu7D3mH
         rQ1rllr0kVn1EW6OwBnG8KOg9zb7BsccCqCftMDMEmupCh+AnLHaaqy/6NSoe6NzXOU7
         weeAkoTwHuv3vSw7wlpkT/lUh7Z2vqDoe2ne/UHNwby9mFtSn4AJYU5jPCFDMCsvK3Nh
         wLvFDqiMKZTM3adXKHqZO5aEgfRc2dnGoUe4hK8V2ICbjxPEwxIKLPIeUYC87Jcy0DlG
         eVGHWbfZSSENcxnIah2IT1tVidOCbBDcLE5FSzWxs9X+VqCjZtEzcNM1d4A+gmmGcCmf
         uCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770166794; x=1770771594;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBvPx6FXEvB3N38gi+R6LAwyy8oL80YAbc2tW9ebENQ=;
        b=XWw7h/EG0FdCgDyWBeVQm/zwbcyp/eA5XEna7Om6aFNS501OwiTH5Vflebfzb5CUik
         pH67gGNNNkuZGPA3DFnettST1VW73skmytvX9mPLM4ifqBCEiYl0O8u8gmWd4ogpzR9P
         3X652IKN5IhOdble74wn53oYbYS54HTC2IjN5DLOAL81QEEV3SxAi4pMMh8TPMetKpmQ
         iTibghDPw+f0x/dtJXfhCA5EMHEDRCzK9JkXUJXlWOtVIdQbp7jFyydVFX6KFbSDpWHr
         8q5Gg+IwoNkCBb+dsqNSNYeTnDkeuJOWavsgg0r5YyTESEQLDgjGVp340uuNwFgPy/fX
         MeFA==
X-Forwarded-Encrypted: i=1; AJvYcCUMMoPsdkTKBqtIzE2pi+cy0K21bnFRPkFPGWhcfdUkLNAbMQkkerD3Mu2HOQaxYYLDqUILFFUB3tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxymRIpJLHe5FIJZ0NTgG41mJEjZZDgQqdbzURA+lVCzevkOBqj
	8xwznsD9bgRfJ0RvQukUod5hkhTKX2EUGqtcOACV0FPq9JwLqQdLT0ehY7GKB1Ss1VnB4ClUvgu
	ozAFd5G88RI2XJ4V9LCOa9TMlXx3UwVHxl4wlhYzQm9/gZ1kmfw87n1XRmCMmVRc=
X-Gm-Gg: AZuq6aKbLtztp21hlVEPuMU52Tz/+uyh16hxM6ZT9q/20IL2dOU9t8I/VdR5yrMSQTH
	ywZdIYIMpWkx4E5V55QNOVBWggAgV6pQWF66jgFwDEDqsdDDwcTI6LqpFDjXTBipHJxVOxHLK9+
	B74ersHSa9yFhN1FMlVEnTkMu8I0t2+KlQJOGT8YEh6piQrEWoqZ0p/O/zL9QU/hdEeffIG76CE
	bt3GpFbVm1WBBWmBuTJt5dMcDQb4y9N6qRARpmI17/WIlXeerVFq1DZxUidX/deSEPJYc+xhw+2
	0XaLpl33Q0yKGh2qrnTLlyWxXXtD6JN9VQ9aTeMlCgXoetY3D84KlwBpsVKeO2SCTnSRGRMhhld
	9TKjiaGDm3mPVb1YTZxtpdaAnn/gfbYjEMY5GYCf3Eu4H9kUY6zldiiPWC/JUbx47IjjDewut9q
	wwaKtK4Nh5JEugsZ3jAx72aUM=
X-Received: by 2002:a05:620a:2a01:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8ca2f853a63mr189990885a.34.1770166794126;
        Tue, 03 Feb 2026 16:59:54 -0800 (PST)
X-Received: by 2002:a05:620a:2a01:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8ca2f853a63mr189987485a.34.1770166793659;
        Tue, 03 Feb 2026 16:59:53 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e386ff563sm253405e87.1.2026.02.03.16.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 16:59:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/7] media: qcom: iris/venus: fix power domain handling
 on SM8250
Date: Wed, 04 Feb 2026 02:59:48 +0200
Message-Id: <20260204-iris-venus-fix-sm8250-v3-0-70fa68e57f96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASagmkC/4WQQQ6CQAxFr0JmbXUYYARW3sO4QCjaRECmw0Rjv
 LtFFm40bpr89vf1pw/F6AhZldFDOQzENPQiklWk6nPVnxCoEa2MNlbHSQzkiCFgPzG0dAPucpN
 paIskR1PgNi22SnavDmX65u4Pos/EfnD395kQz91/xBCDhqNNMkRrTZ7Wu4F5PU7VpR66bi1Fz
 eBgPjCjf8KMwGyb6kZsWZ0XX2DPJbbDcZIv+CW7OlaMMJvIl1GPN7/pKvboxP98AUtl5wk9AQA
 A
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gja9rC7/ll+jARYKe/0sDqDY8ostmhNW63Lo3AZnyVE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpgpoHLs2+1JYjNlpk+G1issAWNflEbLxVyAcKb
 Lvy1iBDfyyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaYKaBwAKCRCLPIo+Aiko
 1SuHB/9TqxNQb81Cm9h7+DiXyZJRzUASa+M185ht/VGGRwg21nnaGSyzxdSYP5q1IBujMbNr7Wk
 Sz3I53lHmuoq40bfEOclzNEBM8WJUieLg/nql/qA+yUsckJbBzYYiDwcMXkdrMFhRNwNNUGTFr2
 jys7IgKspb07B7FYM7gTtjEC9k6Cy8dwRLFnag0yFHL8oiMWCb3bmQVwhEz1cJw34XNa/lTG2Y0
 5QVlCauig2MqaqVBR2pCR4hWkNxN0B6rkgGIL3Q5eBPjT/CQDih0ofTr4FCZ6qSdpq65AVs6SAk
 rdg5lmlekjXcZoDkMOKE5yy9SSJDW2+4F4/dlAYvBj/CJdkA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 4OhEhAN8LrYoigshR4RwOfBl9IWkfuLX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAwNCBTYWx0ZWRfX+273B+dWg6VI
 rKGg61ytmKMbglZGcKkJnphup8rbq/pRtoo5mlESOtkLpE8zf/7LGWcqHwtm7dfmJonUGlRSgWM
 rLptVKli6097lhds03BRiRh1mONJ5kU3yfIHQ5WUqQDFjnJVHf/xdPdnqGgvislaDuzN3tWExol
 2u+PGo8lqq750X8Wq/KaeJymq1dN5vP3FuYHCbbwgpG44eIfbBh8WDGyN/+znTgd6uzc7/Jeg7q
 Nt0htDqCJvey4thDLlFS64HFl19MIro1QG9T4T1KyUlO33s9vMd3/+l1UPIA2AVYOjy+I2j7YhB
 1ucmZ0boxqICr6xWdU14YmIwPelUEDd32ty6ZJqGev5Fg5URS2/MkNlnVlBBcVDOaD25C38kMF8
 urJu5wKOezjt/fUPWlEGWM2jsCjgR11kMNaVmQ1Mu5KtbXfZ/oARLcEE4sp2+OquHKyPuioTFn0
 oIAi4E3R0DKwRuy0CNA==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=69829a0b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cvYA71F9yvrgsMZaK7wA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4OhEhAN8LrYoigshR4RwOfBl9IWkfuLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040004

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

The videocc patches (DT, DTS) can be applied during -rc, the rest of the
patches should go for the next -rc1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Dropped applied patch
- Fixed typos in the commit messages (Dikshita, Konrad)
- Corrected MX OPP levels (Dikshita)
- Switched Konrad from Suggested-by to Reported-by (Konrad)
- Link to v2: https://lore.kernel.org/r/20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com

Changes in v2:
- Fixed example in the new sm8250-videocc schema
- Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com

---
Dmitry Baryshkov (7):
      dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      arm64: dts: qcom: sm8250: add MX power domain to the video CC
      arm64: dts: qcom: sm8250: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
 .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
 drivers/media/platform/qcom/venus/core.c           |  7 +-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
 9 files changed, 138 insertions(+), 44 deletions(-)
---
base-commit: 5c009020744fe129e4728e71c44a6c7816c9105e
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
-- 
With best wishes
Dmitry

