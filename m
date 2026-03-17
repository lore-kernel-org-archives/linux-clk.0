Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1896B373C18
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773767688; cv=none; b=PjYDaUkeBQk9VQx6Prrtpzvy/qs+rfYbab2UrpsH/t7mAb9nllScW5UoP73xcAq4lmZcsYqMD8tvhKPmKFxUQ4J0yIcOkLlCzd4+ygKn2VidUdfN2sXfSjTQdAdMGeII65js4O+jQgsrQoiQ+FNJbHL0tUjlGz0Rdzw5AJZC6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773767688; c=relaxed/simple;
	bh=vx0w9PUU9iUocKYSf4pra+YZUvM5C2gHGYO5N/eo8QU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iDccrwt2uWRGAD3PevylOTCG/Gg2YV/sTu/qJJBRE+D5437izFknrKjoe0fqWOjTbSuoln9fAcZN2qnNtMSz+5mrTy7vagUzgZlwLyQtT3aeFVkdIbJjg7HbLLGSM+erw6I3kLAo7jpCZayQnOrJZgHowK6qfwO20Q2zKNwgEJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKi1oFx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgonHltB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKi1oFx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgonHltB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDespC3124593
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q7jsL4kfOR01N3u01XCOBm
	HY0kjj5+Rnj/VeLPkBFHY=; b=fKi1oFx91Kt+EuYmVN33Ko0q/ALbTfi9PtQQWF
	zO+xsxFa/54aJlp4UOJgO2jXJBkj8g9Mbeo6UhyMw4Rx/xz+byDZ4qTzyiOgcjsx
	V9cfat8UorvJd9Dc9uDHwc61MfKszME1jkmpCmQ0pg3UO+bE1wipReiDZdQ5AwtS
	7/ORx/iAMzIuz3Sb/c10/Wn+obyzOvEaPRX2A79OVjR+hE34fUBRzcaccxCI8pnj
	VJUwxZLDFSaOC4HO0OQT2EOqkaZfsylTdaBlpvXgj1WgWbBwMBJy1LSWuNukm0z7
	2vEWsK8TRoWmn9e3DG97yVaB+S+DzWak50jKr9EP5LFomNYg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbt7h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 17:14:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4b96c259so1175385ad.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767684; x=1774372484; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=;
        b=UgonHltBDbR6+kuqIQE7LnGxB8BLzhMia1CH4R7d8xVOd1Phg+96CZcLZwqAfyaakq
         R89XEeIG56iLQxGJu9slBABOqpZBnnAT+aq4KbD3KYpBQVoeO/CsVb4bmgW8JThU7aI2
         DqxobzkdskWP+28mO+CXrKDqBNlYVyWPc2hH4abkcjzcl1A+WXyOQ7sdfdU/WojIm3eJ
         6x6xGLLaWFR885kk7sdDYWPz0n4j0JlDwvfrqu0OHFC/N3SWo2iIRDH7ICoTO7t7RCO0
         F4PYW7LFrNh/QXfN96FIcrnsfyDfNCb+S+hdMrk1nMqfO4xbrVWKZztiGYSdF5qyBKy1
         dGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767684; x=1774372484;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q7jsL4kfOR01N3u01XCOBmHY0kjj5+Rnj/VeLPkBFHY=;
        b=UvLXYqmqb0ZXY1e8gSIirOvAeekSUApKvxY7ieq4o6D/txGjAdpRFsoxJAcHwXqnDn
         dtUI92GeV3050c6tR0XhFbBcLhEt5uZDorpOliamH6QHKHXKcOoHbKNE8Iz55QQr/M2w
         +8dqXvVtdI822f/FLXvrohADRiBeUA0Oc+VimGO5p/hxXMA5Jw6tBFTnl24xOsA0ufP6
         tPQQGSDsKwSxb2ezalATCIfZYIbmqpVpGtmCLjxQfVg+0MhBZ8aXJrLcS8gUsKdvm5wy
         qR6/bPshFcIuYLVw4E1ZTT16J0i4+UvS4SLdkTxW0Ac31bM8s1Vg0S725d4ee8uhIa4D
         PTig==
X-Forwarded-Encrypted: i=1; AJvYcCVFfkR2WuyoPnM5tzwk4EcE/yw2gdN280o5GvdbXbjYWFB6S1OEXcCR+2q41Kt0hblYSvhFZB1j9Fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8mLS8zNSb7foBIKX/IPIlPIHpkg+9wEeygW3FHUixYME7oOb
	sF9fBggqZX7eTassJ5JlCQXYD0z2xwAtCtII2PgxBM3Ybd8OouF0Mbofp4g9KMwUXEVw0pE4o2N
	KjLP2elFwrTSGFRb+gd7Ouc1UQSYsCjZthf38xGDoA4Gu/oKjHu7NMxJ/hGLL+58=
X-Gm-Gg: ATEYQzzik/tQVwazffznDurXeR435sWTX29OrgBSlUstSZZlwKfPtAE26MWJ1JQIAEP
	fTmoMPpirrkS1IuAPndab+2h4XCxIiysF6TwoZy6H1LWIz/Q/ttWFUDiuzGl6AmKzByXIo3nQ6B
	flET4eHGugByg8/gGzEfO8ZgzsBAgZErWDt5WosVDJHJO1QTKkptHh/o+O9x/kPVY2gPSHvUBg7
	qr3ol8vpgpCLbN60z/DDGrsLe0k+3J7+4bxt+gdvAhCAPj+Qa7BtSHZInWKALS9zhtL6caHqLDs
	j4LLlwTeLQEFbOPF6UkLbwh3kciDnsSBEKwrX6ZGjf/tRaq4IOmIK8XRtDNZkCyVT4qeYz1H7IH
	BvsPKU/xRaCiwnUoqsfQDcKv6cJEWDPtgyEVLTzAyOdPnag==
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35bb9964818mr360760a91.3.1773767683992;
        Tue, 17 Mar 2026 10:14:43 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8c:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35bb9964818mr360731a91.3.1773767683454;
        Tue, 17 Mar 2026 10:14:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
Date: Tue, 17 Mar 2026 22:44:21 +0530
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO6LuWkC/yWNQW7CMBBFrxJ53Ykcg3EaIdR7VMhypgO1sGPwJ
 FZVxN0xZPOl9xfv3QVT9sRiaO4iU/Hs01Sh+2gE/rrpTOB/Kgsl1U5uOgMU/L+zMVoMCS8W0zT
 nFAJltqUDov6kkFRnpBbVcc108n9v//dx5Uy3pWbm9RSRmN07MzT7tSI1nK8LouXYGy1tUVA0S
 DC9+lTjVo5Sb74Sc3tbXMAUY1vn8MqNjglej5+HpphWQsatOD4eT+UX+sXoAAAA
X-Change-ID: 20260317-eliza_mm_clock_controllers_v1-ee8f2ce21705
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: zSdenDF-5_Hmx9XR33f6k7W7bSlXyNrj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfXyzgycW/CZpeH
 qxTSTbnGu9CKkOvdh2k7yP2GVqdWbIEqZak+mctEEKCqnE48EnNr2qmQdJMU3EqNceqziRoAdBc
 ZWN6kyPWfAmSkaASt5thKfp3d20d8YGK31OETfxppafQCoIi9mfI7q8Nju4i/3DfLFc/fJ245va
 nnKucthUD1hYBwxfMgWhGyb0402zLYWESTZjSXFQEIwg7P+DDA4j1srfllQipGUPb13W83y6/jx
 RFsmL7665+nFGEdp3PDymsrnvZimoma85SolI2A/5WE9Ljt88Baa613O5IdodR8sPX1ZCwpjsHN
 Hb45ZWdr2s5fExO+JuWX72nzKlHeIYDUf/BN8Zi9R9wXy7SabmPYzBg4f6QsGEgG2R6IXptisg8
 VAiz/OoJvbZLt3LagQTJeLB9Sq6WFifQn/HqsqpPGrDo2GgRGBVne9ZKdt6bqyMHnWqt1tOG2oq
 wIMkUsBqBH5WCmAh/Cw==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b98c05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=O432ggMcIDbDob6sqXIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: zSdenDF-5_Hmx9XR33f6k7W7bSlXyNrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170152

Add driver for Eliza SoC camera, graphics and Video clock controllers.
The camera clock controller supports the cambist clock controller and
the regular camera clock controller.

Dependency:
https://lore.kernel.org/lkml/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
      dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
      dt-bindings: clock: qcom: Add support for CAMCC for Eliza
      clk: qcom: videocc: Add video clock controller driver for Eliza
      clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
      clk: qcom: camcc: Add support for camera clock controller for Eliza
      arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    5 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    3 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |   16 +
 arch/arm64/configs/defconfig                       |    5 +
 drivers/clk/qcom/Kconfig                           |   28 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/cambistmclkcc-eliza.c             |  467 ++++
 drivers/clk/qcom/camcc-eliza.c                     | 2805 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-eliza.c                     |  630 +++++
 drivers/clk/qcom/videocc-eliza.c                   |  404 +++
 .../dt-bindings/clock/qcom,eliza-cambistmclkcc.h   |   32 +
 include/dt-bindings/clock/qcom,eliza-camcc.h       |  151 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       |   52 +
 include/dt-bindings/clock/qcom,eliza-videocc.h     |   37 +
 14 files changed, 4638 insertions(+)
---
base-commit: 34cb4f916af10153c87fabaf6c34e4cafa170427
change-id: 20260317-eliza_mm_clock_controllers_v1-ee8f2ce21705
prerequisite-message-id: <20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com>
prerequisite-patch-id: 6a8e7d82a3210a06ca00766dcb091d9ccb0ebc35
prerequisite-patch-id: 5705b420f0f4987aa8dad89118aa0c354c6a3d6d
prerequisite-patch-id: 8f7f73eb125f508dba66bf2373280048f62e44e3

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

