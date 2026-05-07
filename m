Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B831E837
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 05:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778132332; cv=none; b=GyP0fPuIa2a7PjdYTXwfTwvR7AD/UiNmT+Hylohw+TLf5Fa5kfc7CSiSVZs00cm6OAFp+IFFJviLUl9XEpX391zRFlMrQbC9x38nqJq4J4DOxQOgl/cs441V0E5BhxWRaNKEHr3kNApcGMbfdNrxFIMvDLTPhGHLzf9rcFPYtNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778132332; c=relaxed/simple;
	bh=824iZPXR5T7sNtjo7RhCDvws+USZKLZd9qGCT+2bGro=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BNSTbgCNxQmjYgnEUZzDDB1jDekJi0aDVLfp5QrlTw3GRTmlC0M8DUtZiUPG2mANVbLxPETWcExBMmqBuPUcENLOJ3xCyW/sxyFIYKY74lPBxE7wY7USMOEZPHYUjMs5NqWc8yx1UQy1UopuokB/+zK+vxnTJlAGxHxx2m3LaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd9mD16/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1pcmuKp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fd9mD16/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h1pcmuKp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64746Hic880640
	for <linux-clk@vger.kernel.org>; Thu, 7 May 2026 05:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RKz5HvkdreumAR9FKqyW85
	CfPz2KorGQzkOYz1ENI9Y=; b=fd9mD16//YQcDqgdbmRpowyHKt1xcRHuz/tdQM
	+FedF0Bs5twM3OzIkKx2iJtwNTxEYxKmhS9Gq59B1A2ONnn3Wrdyql8RMHM56W4X
	q4E+WbIijNkd9yWhJVWALGYAGQ29AnFGl1b8DTB/A10FoWyvaqCE8s9ao1V+y5zi
	HaG5UQSbaytU3JIlBEJAC9p9pUz24/lQcJoRx2zQzGoJ272Ua/fUZHo8dzMyHU7T
	3xW1DC6bYcUkuAtwrhwXCwLYUlHZAhF9S8TCHma/X6RYR5VQktg2xgQKW369eOIg
	5j4RAzR9lfNFYE30oiVw/usKm0zxojLNQ/jGGGSmzCDFtKzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq08f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:38:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8230d6d54a5so1083077b3a.1
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 22:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778132329; x=1778737129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKz5HvkdreumAR9FKqyW85CfPz2KorGQzkOYz1ENI9Y=;
        b=h1pcmuKpI5nMJ94A3RtD5RsCYuSYQ0Jgj9AuVxP6xlTm6IMWGIJFOXM5F7BTkMHDCO
         iGHvabFj5h0gmD8/dx25daiI8jqwaCKvR1otEwT6qOELKzp9HbuMl5vASbXa2DIFvur9
         q9+LDxvCsn5U50vE1i0LzDLRHt4cE6P3Lzu54461kYWCuJfHnCyeiV456pHNiU9lPkBW
         IdWD3WnjEKxJMtKmje+cQWvKehJmrTeI2E6wtESJns3lC5bT1EELIV7vvulXa1zYLXkY
         voe+W7ImRRy8Ph8jC58Dr1PIa/xtlUF5hyISk2QRDfOEiTWDNlrwssU/RavzdRwFmwV9
         9h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778132329; x=1778737129;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKz5HvkdreumAR9FKqyW85CfPz2KorGQzkOYz1ENI9Y=;
        b=qRYpMZ2Owcdz12Sh49irJ/cPLfwNFGOtRFKpA2+yYOC66Fnf9T7dcJ7PCeSKv1yP8j
         t/wXS/jIpOaW0VNAvdX0s62cal8a5zj3EqN+hedpzB5kuL+9I8iHZpkR+2n7fD3LWV5Q
         nIDvukVm9orHM86/33Wq1Dn4DE8UNS+O7knqwOCU8iMvVVZfcKF1gC1pBU4mCxWh3b3o
         SYCAripYjTTcxshKRQQ+g+hcxmaWKRgZg1jmFP5o04JhM2IxkUZPwsEhVe/SfP3qK7gx
         azH8N7w2vhbSLOg1vCbbaPZiARnBRJjUVbUiVoAGbJDW67MHKRkvgBTvIkqq4RG88tm8
         cgCg==
X-Forwarded-Encrypted: i=1; AFNElJ8nH9ZE4GFtmOhRW9oF8xN2qS4Egl66JwSpQQAUezUeY68QkvY6m9tL4QUP6AdWVvyvoys0T3qLGYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6q0YyreadyxzeUn7druyg/lE0SMK2GZzhPtuTzjMkMQFSKeuj
	Am7Yl58UXpHKWFR+j7QAX3EKhYgvGZsEckB6ByUaH1C61j9a+DwJ8GyU8NKvoVVKcoy/NcOJRTG
	5KpNmwQRja47uoVmDhWdrwMIXIl+q9r5g/z0DyXHe+chxfjHJ5x6oqId1cIdH/JA=
X-Gm-Gg: AeBDieuK+17aCetyyjADEH8NoSIe07LRL7K14BT4P/OQYQajprM/f0gr0ZFahqAQejZ
	+P+RU09hhuhUEsuRjWka1xsohvKD9RyXoxcW//KF9ArMoWMhcNdMmbE/2NUFLWoh05IKYV2Prsx
	0xmMpNlwD7icmnYz9lg8UHXrlzShqETzOW6vLwfesVQqkfd/W10wOfzT1ZAIc3EcwnvTBqsnkhD
	AOCEz9TERmwtZ8Vwi9QTgZmy0jZPFelHC4kqBiNrCbbDy0p1HtbwockEBpYo1Vl3yvpwpEh48p3
	E4d7PEnjxYVlRFbcgpgE3jqcXXEnvYYzWcxePzAvcQHALvKyS0HaKYYdiHegOcFioHYl/k8XC2R
	d2c+a4e3b33dg1+SGcv6OIk0LLnjsSen19QzQFmP4lSMxKBzf7gLhowgr+ITuZyk=
X-Received: by 2002:a05:6a00:a219:b0:835:7c0e:b530 with SMTP id d2e1a72fcca58-83bb3d7835dmr1334320b3a.0.1778132328798;
        Wed, 06 May 2026 22:38:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:a219:b0:835:7c0e:b530 with SMTP id d2e1a72fcca58-83bb3d7835dmr1334294b3a.0.1778132328272;
        Wed, 06 May 2026 22:38:48 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563ac51sm7389962b3a.2.2026.05.06.22.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:38:47 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v5 0/6] Add support for videocc and camcc on X1P42100
 platform
Date: Thu, 07 May 2026 11:08:25 +0530
Message-Id: <20260507-purwa-videocc-camcc-v5-0-fc3af4130282@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEl/GkC/3XNwW4CIRAG4FcxnIuBAXa3PfkexgMwQyXpigWlb
 cy+e1EPesDLn/yT/N9cWKEcqbCP1YVlqrHEdGjFvK2Y39vDJ/GIrTMQMAgjBn485x/La0RK3nN
 v55aBgtBqhJG0Z215zBTi703d7lrfx3JK+e/2pMrr9e5JmLpelVxwBwrJjBiMs5tUyvr7bL98m
 ud1C3ZlKzwoJXSfgkahcwgIZnI4vKDUE6Vkn1KNGtB6KydhtZMvKP2gtHjvU7pRxk5kAiBqBx1
 qWZZ/as1p8p4BAAA=
X-Change-ID: 20260506-purwa-videocc-camcc-fef043727e4c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc256a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-aA_EJKQ9c9Fm2tRs6UA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 74hwqvlqzkSzLWsWpgcoJIwUJDqDYGAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA1MiBTYWx0ZWRfX5zr8Y8zLYRDW
 C1rcPDn80XaZQAJwFK3qLXOuSQTifmPYLwZBofBFuDI30DqP+nYCTWNFnkF1+BCORGMaA7TvwTA
 mbmg1IHiMEqUprbzMsgYS+0KyEi5fUFwT+vcIWbdRmIJhc/MEnDMbKQ1dVBDTStWMi8AAl1k+dE
 NNgDL9mjbnMTMZNnriIrJePr7DscVP2n+FpFt2VYbhpa084A7ECTAhZEwiWaz9jHSd3SZU7lOeN
 gTZjqa/JBpRr2WGhFPw5uVYZU0Q8rLPDBcEtbQ7BaSDIn/F4o7FCwr61pKjuIFEcxOskMNl+WHF
 PAxYlY6e/gOjqEnUlOuUuf1Yk1h91FdMQLWFZ3Q60lDb+2Ed6Pi0TaWi4c6iBPXbknslRsilqtF
 eOshR2qkwYJPNVHPXuaOELfyfOBCjOfSbfncSr0WmubgK0P+cx6++R7V/6XvnEj2QwIVHbnczpO
 jivldTU1QD3EDWgmt9w==
X-Proofpoint-GUID: 74hwqvlqzkSzLWsWpgcoJIwUJDqDYGAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070052

Add support for video and camera clock controllers on
X1P42100 platform.

The purwa(X1P42100) platform includes the hamoa dtsi file
and camcc node is already posted upstream on hamoa(X1E80100)
platform in Bryan's series[1]. Hence included the camcc node
patch[PATCH 06/15] from Bryan's series[1] and extended it for
purwa(X1P42100).

[1]: https://lore.kernel.org/all/20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-6-0bc5da82f526@linaro.org/

The camcc node was added in x1e80100.dtsi in above Bryan's series
but moved it to hamoa.dtsi in this series to align as per the latest
changes.

The series also adds the camera QDSS debug clocks support for X1E80100.
This change updates the X1E80100 camcc ABI, so X1E80100 camcc bindings
and driver changes need to be picked together.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v5:
- Dropped defconfig change[PATCH 7] and marked the drivers as modules
  from Kconfig itself
- In DT change[PATCH 6], used hex for 0's and sorted videocc in purwa.dtsi
- Link to v4: https://lore.kernel.org/r/20260409-purwa-videocc-camcc-v4-0-5a8e5f2dd4b2@oss.qualcomm.com

Changes in v4:
- Added R-By tags received on v3
- Included x1e80100 camcc header file in hamoa dtsi which was missed in
  v3.
- Link to v3: https://lore.kernel.org/r/20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com

Changes in v3:
- Added a sepearate new header for Purwa videocc
- Dropped the fixes tags added in v2, since no user observable bug
- Updated the commit text for few patches
- Added R-By tags recieved on v2
- Link to v2: https://lore.kernel.org/r/20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com

Changes in v2:
- Dropped new header file for X1P42100 videocc and included
  additional clocks and resets in SM8650 videocc header file
- Updated commit text for videocc and camcc driver patches
- Squashed Purwa videocc & camcc DT compatible update into previous
  camcc node patch based on review comments
- Added R-By tags received on v1
- Added Fixes tags based on review comments
- Link to v1: https://lore.kernel.org/r/20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com

---
Bryan O'Donoghue (1):
      arm64: dts: qcom: x1e80100: Add CAMCC block definition

Jagadeesh Kona (5):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller

 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   17 +
 arch/arm64/boot/dts/qcom/purwa.dtsi                |   10 +
 drivers/clk/qcom/Kconfig                           |   22 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++++++++++
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++++
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   48 +
 11 files changed, 2978 insertions(+)
---
base-commit: 735d2f48cadaa9a87e7c7601667878de70c771c5
change-id: 20260506-purwa-videocc-camcc-fef043727e4c

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

