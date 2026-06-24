Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2242FF164
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312675; cv=none; b=AryusaFH6kAXwB1PhZfqkOZ9clW2SjRwcGmqUswVte0t9iW3KTgyjoC/QZK/DOqSVGRka9G8cnydIgm1xrhI2wOVUrJyssYSrVEULtbrlK1P0CbDE+iMt13BY2HnAukYoEUjYEJBfi9aOE4afZMPyPlySdvZvZn28r0Al3hFonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312675; c=relaxed/simple;
	bh=Z8QjadXgIGtPgACTtDMUk5aa0NamCujq+Tig0aGsLdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TR7OH3WF9Wqpv5yJRkouQBkJeHLMOrvRJoP2hYlvKk0IcrLhHQ/YdxE3X45HxIUJ8gVPq0q4OWfn3NiwGXMuyGra/3UwhdWBREz/inSIuaCgTQT/XkSrPJf5aupYcmPtn4YWyEr2/86lAkg516fFx1kTRh7j/oHT879UxU8kt38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bk4ok15U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZX43UpH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bk4ok15U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZX43UpH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfLNp3076034
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QdRom3OlZUqLYrHE52lKlo
	KF1BLACd/ghD9VVvw0yJw=; b=Bk4ok15UkoJD9ZtBz0DcsxzFesht5vH6CauZTu
	zF/6yalTIzKOTnoKTImDoG510/zbUPHy3Fss9T6EQELhASJ+K8jc6Z9bp4q3Wa58
	AnAUZ6V/5BcTENHHqcJCmLu785Dv0M9oqDV6KlJ41IrIzGaK0ZmUwTBvjHwWenHL
	w69KLyAfHXe1tE68B8KxGaIxRdI+GX8b8chDB2yQRm/HL6dPDoe8KB7KrsDU7wMF
	mScFDeSOzGGV9hgdsfCWJDCwGqzAFOKofiHr8/Hibwcz7LooHhv3VxXSVHnmeiVw
	FvcxcJvTUphMgQF1aJEECJ4O2RIrXbOPfadAi5N+zDPmcPdw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d451571-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8428384f31fso908066b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312672; x=1782917472; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdRom3OlZUqLYrHE52lKloKF1BLACd/ghD9VVvw0yJw=;
        b=MZX43UpHLjytAB5Bqr/fb+BpOvsEjLojUig4D2WfVUbqefYttJtETlVran9ERjpHkx
         DzYgcT9zMm9UDx3uM3SR80hqx05Qk2nfzO+6gozut1utms2Pfy5n2Z/9LjCOSE32lcyL
         hWdx5Hn8jbDo4pCaQAblE5WITvzomxeeqab+xfYwJXB0np+d9nRdlLD0W5WzMFALAmKy
         F0BlkI2Z0p7gXkk5t5rZwwtTv4diPRIe+zfVyQjqNBUZ7vVoPNB575rxjeLYj3aoLAVt
         0iRpjqV504+PGG2pvRb2DbLe22m921Tl7gs26YItvRg+BCE3Yzzl1z15GmIid18Fg5KU
         49DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312672; x=1782917472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QdRom3OlZUqLYrHE52lKloKF1BLACd/ghD9VVvw0yJw=;
        b=njwd5clylGvVjC3ST4FSdzbSWa3uyTWxbOE+xYFTq7PV0o7E+fmHmLCHaf79QSen1P
         XbMjOuhSQUJqIs8Ny90kqmvjfhnP4HVmidKH7Xy8L4P+I7XanhiqLzKrMqfcl9UCaXUR
         Y6P0s9/7uD0RXGzU52NblJ+zutsbI2TCh4OvQB+1PqB6+4tCzZo/20Orl+Ju+0Mj2AoY
         QZUTRLNQIqlPoWZCTVK7AwuB34nTLB0yDPWFsrOKjZY9ZI07JzcKY35vzvCz8rnu5MD8
         obi5TMVD/8bww3oAGpgkbuT3Z2A1XDL3GCvQGy/7+Elx3kyaUudVnnNmOwSvqEhwexZ9
         eqSA==
X-Forwarded-Encrypted: i=1; AFNElJ8JYne1bHWBkwFQBc1XVUXbNHwSfcSbv2rBBnt/TwA0ABOmp51Z1r6zPeqJ/6puAYv+2UebSuyKugY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL3YjeYRwkLy63+eltwoixkBpPIaFgjHj99eeGGVhw2LzUAD3y
	Ni6EAEjzjAYz41Zxjz2kIahEXFMpRvYJXypDjJUQR5/qeYAY7EnjUdw/WHw0O2wP149gcLyM4Xv
	rjhh22Vc5pvAHCxhNWkHLsupSPuQYGOBuIcSvP6xWnybqTBBJUelINZ8OL3w4jcA=
X-Gm-Gg: AfdE7cmhaNS3FVOFqyFyIvyfib47JIX4eh0Vvadvha79rEGpf5wKyBEzqyVFX/3z6Ei
	6ISw+TqDXk8k22qiQ2akh+jxhjtCUHQTgdKTl7M41KxlDQzhUWiHJ7I4EgS74EW0JoY0fkK7F6B
	KAo/3KVByzgp0ab1okkV+ehG+vAV9mv6VIToHGsoGgo6zbHcPPdjSg/t3p81iUdaKnsY60YKA/L
	kVFwwsm8SMUYedcbjDcwugY/5SLj9jW6ZR15HNi/Pck0YthD/Lu8faaXfdvtPPFNNkuuqfJ0O+j
	il5bVj3tnFZMToqxbLw7j1nJMnFs2fuBfKDJvOQs9Frv/6zQvOdmTIRV2vUkpsBbogPrU1Tyr1g
	Yn1tmnkKLITqACv1JhH+HuPlbp4mCjYLcXuEz/pbHjw==
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr3912298b3a.34.1782312672287;
        Wed, 24 Jun 2026 07:51:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:4210:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845a2c7d835mr3912264b3a.34.1782312671733;
        Wed, 24 Jun 2026 07:51:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v5 0/3] Add camera clock controller support on Glymur
 platform
Date: Wed, 24 Jun 2026 20:20:28 +0530
Message-Id: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALXuO2oC/3XQwYoCMQwG4FeRnreSpjNT68n3kGWpTaoFx9F2L
 Ssy727Vw7rDegn8gXwkuYrMKXIWy9lVJC4xx+FQQ/sxE37nDluWkWoWCNhBq4zc7i/9OX1513s
 vGTWQ2lDQpEUdOSYO8efBrT9r3sX8PaTLQy/q3n1CDeBfqCgJkhfkoHWoyJnVkPP8dHZ7P/T9v
 BZx9wq+GGgnBlYDvA6krDGLzr4x9K/RqukeuhrOKNsFZjTmndG8GpOnlKYalgCcD4E24b9bxnG
 8ASboMlB7AQAA
X-Change-ID: 20260517-glymur_camcc-e230d1bdf3d3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfXwkVoupQn8A7c
 6OP5/hp3Gs836OUalSMbw1JGt05Zvwr0vL12xC62vZfrvLqrZvL+Kiu8kqPGuWTUqcyE61KziZe
 7zrneU0HzHuKmtc+oS/CesxgaIJ1Xl8=
X-Proofpoint-GUID: w1X7n6-AIn1K_rMBPcRw9jzCuk0pnm5S
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3beee0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NfzWakH2hsC1MMCkln4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: w1X7n6-AIn1K_rMBPcRw9jzCuk0pnm5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX+n+8NPaU9por
 E/E7KtkewPu6QbRCk2AhF8rhCaE5PJXFReO3RkSEXipgX5K8RCNvL8ELap8AvVU+uXq5/4pF+0F
 +6w0/iOd5zQGnfQXYQ+lv4HzhcsJT95ajql34M7bK9oCYOdgP+0DTKcUdQlLlurObTOiqHpvp6L
 iJEFe+5A4tm3PzYexwiq06IAr+UMGl1A7bRnCj3rs5JD/AoYChOj+Q1bXsaPCFXCvTf+sQSE3lk
 po5F9HomPwvlb2YIRef/Tf4roie8z7lVsvLgRWcrahLbYwYqdhe2mM1axfpUu4oXgnRgDjW6d99
 r/LpyTVUsYQ+gWyAoQU8RHg/0UqLK6utCFhhinp2Kf/a/PkzAFcvGot/x3Q8cyeWQOrnkOlOlTJ
 ERy+25aWCgWl3nR7kFEm66eEnHIJxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240124

Add support for camera clock controller on Glymur platform
for camera clients to be able to request for camcc clocks.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v5:
- Rebased on top of latest linux-next
- Added R-By tags received in v4
- Kept PLL configuration settings as is, since defining these fields isn't
  really meaningful to end user & they vary significantly across PLL types.
  Link to discussion: https://lore.kernel.org/all/23e910f0-f996-49b4-9ba8-5acc3bef2172@oss.qualcomm.com/
- Link to v4: https://lore.kernel.org/r/20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com

Changes in v4:
- Fixed parent src in ftbl_cam_cc_xo_clk_src to align with it's parent map
  [Reported by sashiko-bot:
   https://lore.kernel.org/all/20260513215441.E17B8C19425@smtp.kernel.org/#t]
- Added R-By tags received in v3
- Link to v3: https://lore.kernel.org/r/20260512-glymur_camcc-v3-0-a7196fee2779@oss.qualcomm.com

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
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260517-glymur_camcc-e230d1bdf3d3

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

