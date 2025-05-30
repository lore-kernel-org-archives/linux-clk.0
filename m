Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89F7276047
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627272; cv=none; b=DeuxqzoZI32Vuo2tNidlDEXbSDi8kanA7gvSLROdZYPHxvlZ5z3JuYrfrjCM4l23dzeY7N2iFlQx0Z75RNbWcmp3vFPqtz/Cl8RfvoB3L45ZpjFjrgcfA1cxRtFxOvjPX/V4t42Hbf7f33r5S+pnWwja1L4yVGykIncSXrub8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627272; c=relaxed/simple;
	bh=6uc2UGeYDKojb28VLnUtXsaqjBTpOdr4JI5m+IvoZFs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=myxiCarNV9AAGYDhCdZIwoklfyKrqOMQCZlzWrIQrrjkC7aa0zZXcwYJlwoEJluqbPv5zK7ByarP0y2stADRWNi1l5UgtJw3+0sQm9bVDaalnI2uOSvo//RUgglWnsNwmdH/sIWNbxgfnR2jz08z9BgxgvIdqoeX/jxQZVVr0j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpWsG+t3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpWsG+t3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBqJSj006960
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 17:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B+2KkEfWLodMGyIjftnj/+
	LVncTbtgVzzVqk00GViSE=; b=mpWsG+t3plv5e6+19mI7H1/k9Xc2PbY3Srvl80
	D5zBneLrIWg0mnVpuUI8G4tf0+fyNEHsnMfY7WCElXGVHSQa1nG4/d+g7nqbI1ox
	CjUb4JN8+XQHmKJqVYNTSXFcmFnwBHOmLh3vvDEZmffrsbUR9M0VUtt2axHK9FK9
	mti9+nRt3jDtJXxXgwueMG8obGlA91fe/dpbrqram7qw9Hf7C5lRVSn99cKAjR8Z
	68WrbUQYL7ZFIPEd8dcdRU5WZtwAZ66pGDRdyZMNajqdsDddAo7dcgghHMnqwyJP
	tR58ycXdv0YICv8dfMgLyRrmO7RZSDjhrQAjoc1y899xcv3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqj5f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 17:47:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30a39fa0765so3223895a91.3
        for <linux-clk@vger.kernel.org>; Fri, 30 May 2025 10:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627263; x=1749232063;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+2KkEfWLodMGyIjftnj/+LVncTbtgVzzVqk00GViSE=;
        b=GhnNzmEbtA9HRT2Pt0TuciiQUPZytB7FYkDTNq0Y74uqnpjGLsmikcaJ5xRhDNO/MX
         R4cOaQHmxuPV/kIop5Er7d30gU/uny9namZfSCNvnP0xlZV8jG2nbCgDu1DqfooxQbNe
         yTebVcFeWLMLQVOQuD9/olbvK2cB41PRE5YbdyOZWmCqnkrigPIUw407xvfRmwTuosHP
         zpbiy6IW4bjDM+zgB4Gvc82Y64LZbeLEskbHttj+IUL+DuNQtLFIa8pzixq+ULqcXxmz
         Bbxk13aqoTgUDmWMhRAT8hF4F36Qi45RXzi3/s67oWZNt3w/n7EMmYZoyYrTYOx5IF+M
         xhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6IHiBYolRIy9Xz3L7qBTAdZ6eU0FQKAlMqKlZyVqmLnSxQxrqSfLDS5nUYzrwdRFsHwpZ3DuLOcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLibhtKdmJFWP9v4bd+mqtCr1eyWIDqhITkohhKE8I32wSrT7P
	2S1QKHmODkGUGkTe3RNGue+GKg1IoW6MHvJY0WAeiW+uVhfmJmglKYkbr9Y08feSo3TsKBWN+DH
	mLodk8eLjv47rxYIdKgooMSnxP9hCeYDdjNLaxG26B7Jpb74rjaYIQoGCrAG5/4M=
X-Gm-Gg: ASbGncvYyg+6q6JpS17XhXMW4xW1DQg2eNzzghv9suyYGADbbPWqiiNNWADCCAbNxW+
	iW9yNGk4As16k2BVXFit6VJeDAPfbXc3HggtKJUCJYZ3xevpPKhAspzzhtg3ctemi5jembwBexc
	Bts+0aY6r1twf3HfSClR9qksZSsOo8Cz7q5k15/iGwxERSkbM3JObAeWFH0mdRcwMMJa0jHoUff
	Jh3DGFAU+CH33rJ+mCFp6/UfNLdx3/xiH112MXVvXM4OE+xz692lKWVF4Iz1GY/IIPKP1A70mc1
	LsQB5Q6task6RPVMoCOep0+h0sMtFHqRC1qdotgF4ezfud1kPxAq66ro4MglbqtVL2qnP48+EI+
	TCkNUQv0=
X-Received: by 2002:a17:90b:4a08:b0:312:db8:dbdc with SMTP id 98e67ed59e1d1-31241528e77mr6199222a91.20.1748627262835;
        Fri, 30 May 2025 10:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPUUx78SralXxw5BzFba2DK55mhWLzeD99fXJp8xlfnHba499BNeIUSlq76/cXvpfZXgfQg==
X-Received: by 2002:a17:90b:4a08:b0:312:db8:dbdc with SMTP id 98e67ed59e1d1-31241528e77mr6199174a91.20.1748627262304;
        Fri, 30 May 2025 10:47:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dt-bindings: msm/dp: add support for pixel clock to
 driver another stream
Date: Fri, 30 May 2025 10:47:23 -0700
Message-Id: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvvOWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbUhCfW1wSn5SZl5KZl16sa25qbJaWlmyZmGqUpgTUVVCUmpZZATY
 xOra2FgDlnKS/YQAAAA==
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=2624;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=6uc2UGeYDKojb28VLnUtXsaqjBTpOdr4JI5m+IvoZFs=;
 b=B4JARvTLryhXsb9dR+6G59wuZvScg2Y7mSDEApXdzmOtc2rUFkH0me1aDfAEfkCSfEPjF2sfe
 TCooErK5xB4Bc/Yi3hAq/l+BrCIKAkTYbHRNCwluTVfQot2e0Z9hwj7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: PVfTDY6LsEB0rVktMEDejNeEEf9kuprF
X-Proofpoint-ORIG-GUID: PVfTDY6LsEB0rVktMEDejNeEEf9kuprF
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6839ef40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BHNpFwMvo4D9IzoZi8gA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX/GWpK2TFd5km
 UZViTX4pOwlF0IVVXGiCiygMwbs0J4zuQN83SOcFfZH+nPzs8M2U+5S6CmEodj6VIYkwDRjsdJu
 kJuZ6CtJsHqpnIGxVm7gMeDAC6LYeVWGZK2FB3TY1bi/q/nwSTSTNzTJLToZ4AuHwYFGpfTcsju
 d+OT338Eli3lZMA1rQBPR8QfNkFH4Fdfw4zZuZVXh18KmR+7eLRJ5Sf7tekrcUoeeJ2dAeVLGhO
 X2n6SAvgPUNE1gdZMcqHarCdWjorkv181xAQzEjhwt6nP59EHxSA+cr693rhcx970m56lMJsEul
 jfMc6LzeaIkfd72nn6nC5qUgPlgiIuZQx3HzvTviqUUjfmcYdSI4Xx9o+X0k8Lg1eboQSRx2bsT
 FLYTICzIFFahVUP8Hip00W5HoBrvzp2WEtGEig+951ydMoFdCC2YzzdPbONtNYa3INml9VBi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=893
 mlxscore=0 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300156

On some MSM chipsets, the display port controller is capable of supporting
two streams. To drive the second stream, the pixel clock for the
corresponding stream needs to be enabled. In order to add the bindings for
the pixel clock for the second stream, fixup the documentation of some of
the bindings to clarify exactly which stream they correspond to, then add
the new bindings and make corresponding changes to the relevant device
trees.

---
Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Remove assigned-clock-parents from sm7150-mdss.yaml
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)

---
Abhinav Kumar (4):
      dt-bindings: Fixup x1e80100 to add DP MST support
      dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream 1 pixel clock binding

Jessica Zhang (1):
      arm64: dts: qcom: Add pixel 1 stream for displayport

 .../bindings/display/msm/dp-controller.yaml        | 45 +++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 +--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  1 -
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 11 ++--
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  2 -
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 18 +++---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 26 +++++---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 31 +++++++---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
 16 files changed, 197 insertions(+), 92 deletions(-)
---
base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

