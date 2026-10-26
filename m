Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014187;
	b=hhOaGbDVjHubpjzV7+Gfdu04AiXEdJWf9RjbdQFRw9Tc1rlaIGbp2rSenXLcw7CTCG84
	 i9lwz/Uj+rbNBx744lsfCTeL0y8EF8PB/2NSKsR9ysQtatnmw5XRzXkdy+CXeiZPv7u7u
	 Y/8WHHJq7A7hXrNeYafhP/rL10XXBgM5+q46OZDCBx6XIkqSzchJspZ/RlZw/w9v53i/l
	 9ZpksUaYUv9BSDtfD8Pv41u0z7Iq3DU+lj2yWjh0NqsRKB8xUFItoXqt5qwuqGbc0us2e
	 fDR3GDwbuS6p9PEjh325V7InERUp/tFRicMXAMGpCcqRiGv179hqAiv1N63ZqUTDGdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
	b=zDFvwQmsfuNk39RPyvN/6waEJFhDAfRnj4uDOvR2ghaM9XgIrGAOWubiupwCRhFsvagg
	 4cqEwMp3d3fXf0Db7GVXXKeHNiEEOLpp4iSUlA2dHQY8ivwT879tUaIa553ndC4VSuP5F
	 pFhBnZWhs1Ypz+Iuwy7qGxmKZ1Y20O6VWEuyd9j9l7sRiBC74exfCu7EgU2qgB+cakm8E
	 eBmqknWHnxCa++oATM/xMLZ1EOwdCJDFRr82ukvah9un3ZsCvUKYWcJkjqzBiL+ZOtnjW
	 L6jDGJREJ/qG/NzdPI8/w2moHbNQPVPEFOn8WeMFbKnOiJZnb0n2af+AbZnXcB6KnfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blqXwfgS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL8R2nuA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718B606A324
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9718B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=blqXwfgS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OL8R2nuA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt1QM3034199
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EgS7rlrHOii3FAy2HYTyjW
	wgaqj9VRF1aAlcU4nCDOo=; b=blqXwfgSmGPnFecDf5eHP87wbJvjRAdQpGtJ1a
	thP2nefizXcBBGF+Ai3Pr9+omWsITyfH7UY/Zm/thYcfjODphgBUuRTN/0jtPRV+
	rs0dvOkXqlj3qkUYIYMZhdD+1257xDNKpcl1WSEuRz33zqmvOlbUulfdt03fXnNX
	Vwd/VDUOu7hWiQUUwqjNyDBadqN85oHRuBHP6xzLTF2CYmWyyDSE/VBeNiQO9t11
	RlcJRwQR2tCwsikGfbeZNCWoMDWigQl5NCW0FHCvZk1OuBh+epRkOHxOnzUxGysV
	yLNDSJhm0MNsawJ0reMK0iy6l84MEasDivVcq2K6SGrCvY8g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y065r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:29:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso1943270a12.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014184; x=1793618984; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
        b=OL8R2nuA6WGlRM+lng7TdnKvHwNY6GPt/5UGr6b1KxGU2UPrCkhpp5GInH77I6RSiL
         32dX7sDCCLQWCdOjZuE40tFGSZ16YOqsxkWaSo3+Clf809j7KMRGoOiKmP+PLqqRzWYp
         lS8CUVYaYiha37A27yl3yOZ3PAJdN36VliXX1HlKAUmqLflq3irQ/Lagx1i9/3XQiVJZ
         iSRGyawcB3febcnv0AeOP8vb/+OLwL0+fBLREqZZaPrcN434U3KY7VlMC6zqmEUP6HMO
         IudssRwDQ1qx14zRINRvPwGbCIggDDLi3Rf4WVSSWa7d6h8te6IWvJhHZv7p7Mr4L4ZO
         WDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014184; x=1793618984;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EgS7rlrHOii3FAy2HYTyjWwgaqj9VRF1aAlcU4nCDOo=;
        b=FiUHYEKD1acDSd/ebu/ZVCFLNK1pDs/x7CaGBFWYuqsK2vE/wD6H2Fah7H5wKP6FMx
         dkuPxnbw5e3eU3P74xM44y43wcNa4/0DGZESIQ9rbSVzsh2NbE7/NX4OhRCzEf63EwVV
         1lFyWtlYt6i52KqDUte5egqF7I99zwDsPJYWth6A5ZC/ckfH4S+aOP+AM6CgYNBBuIZY
         hF9j7xkYuQpFdWBbHB2Tc5RLyEQ2yEyGw883JDUkcIoms18ygWSUIOvykDeOA2JiA8v3
         2eXSdAEbQC/nh/VCiieNRu9RdgrLWA/iyJMmqbhDiiy7RdECfL5bADL0lTvZNzPKvRiS
         zZ2w==
X-Forwarded-Encrypted: i=1; AKwUvBwQzGUBLKyxdhLs5W6vmABYV0biys1VcTy14tOWFRkuhXNowS7SIH9T02mn5Vov0z41H+rji/h48fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKopc+bRm2WbGOZV9YgQRR5Nbun24W/919wfQWrHo3avYHb5cx7
	KmWZ8ft6qe9gy5BlWNm2iab9H6Qeb6J/Neofk80y1ZMgUnLQ6nSAYLYtBWia6yLCm7PjwgKZufd
	kjpyzo9O1m+Lca3P7WUcIR5LaS5z/q8kuR8CaxjH3q2/IbbmtyRlgrWzsJgMZGqk=
X-Gm-Gg: AYBFou08XwHJR6rsHv87x8jyPBMgW7JQfQdWg6b0caGDABbYt2+8TmYHE3BTFWtEXQB
	AxPdNOAaNwwG3GI/3oxIzy7/pBM0XyRtIK3x0ovyZvxPjZsrf85SD/HnH6K8jwhMBanSqrQc64t
	DDVdbi8qN3DlL0KHxriObeivlYPLy2BdNES5oExoiLFhvglJWbneK733QZZX8IuqRXYmQDDZ6ks
	r6q0/BKMHfyl0Zx6vP240ZAPbgRPSo0DEGPshowvGp1qAwlFE9LVyGklRJPI6IkfmJg05Vum74O
	dBnT4wFoD59R/yxVMFnboitIfrAcVxl6kiEo0vnILHQCVYVAnONdDrqx5Yw7Di8v+fH4LgKHE/k
	fLtWLAZ/uDkj2lvl8vB4Bh/w=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3576431a91.1.1793014184348;
        Mon, 26 Oct 2026 04:29:44 -0700 (PDT)
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3576406a91.1.1793014183889;
        Mon, 26 Oct 2026 04:29:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:43 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 00/12] clk: qcom: Add PDM GP_MN fractional clock divider
 driver and DT support
Date: Mon, 26 Oct 2026 16:59:26 +0530
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJY532oC/x3MQQqAIBBA0avErBNKQ7CrRIiNUw2ViUIE0d2Tl
 m/x/wOZElOGvnog0cWZz1Ag6wpwdWEhwb4YZCN127RKTJ2I/rC4b3aJ9gjeXlIYo5TRM2p0CCW
 NiWa+/+0wvu8HpzBdEGYAAAA=
X-Change-ID: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXwcPz9uZ+RahV
 Zm2SWq+F9h5ZBUiGviVSdOqD7Dta+H69x+UANRRHNbHBWYpyD6KFRUtVM+VyLEX7aoV8oAhb4v3
 C8W4ibnieqNzNfi4E2HyrEaTwpw4XFo=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf39a9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Szwu85aThXN4zbkuBwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXy+kJYCahhZAU
 dWccrzKInFc0gTeRkKXuVgfZrSY/ZsamwFWFcqNYNkjDblNEjE7zGXIP/pPO7OZC1blqs8HlZcC
 VpZBJeWzZ9fkkOaN6JtzcTqr8AbH8uFuUDJHZWYgB4LkaXbjPoCe2OsJxcWVaSirh7kZAUef4LK
 VnTobXNxL4HL9b5A5pdDCbFji19NEk4bifCNYIzRhgjSJKjLccS2nQM4qB4a7ditVluOAs4eBqO
 Lcaqo9d2ZYrk0CMiTBtLFIA0EOYZ6QY1RE52Mo1kbOaRyDGoJckh/S4Xd7UMDnTk+nyl+yrMFJr
 mDMx55Fesnx0b2RxV00J3fgybt7jRSZrj6ApmypdSqxu/HS2cNZtMii36V+M/Uyncf3EN6OlNrV
 tSXBzu9+FK2M30besjxzWQPAwTVkA4zkbeg/picQGjcYWW2RYRHh8DrRGwecUK4TvucLh+4X2Ke
 XkECjcdaSXSQYK8z+7Q==
X-Proofpoint-GUID: 4EknwDiUEAsJewUAXzELf2B6BZr_cfnP
X-Proofpoint-ORIG-GUID: 4EknwDiUEAsJewUAXzELf2B6BZr_cfnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

The Peripheral Web PDM block on several Qualcomm SoCs contains a GP_MN
fractional divider that generates a clock output from the PDM XO4 clock.
The output can be routed to a dedicated GPIO pin for use as an external
reference clock.

This series adds the binding, a runtime PM-aware GP_MN divider driver,
and the GCC, pinctrl, and DT support needed on QCS615, QCS8300, SA8775P,
and SC7280. GP_MN controller nodes are disabled by default so boards must
explicitly opt in before the output pin is muxed.

Changes in v2:
- Add SoC-specific compatible strings with a qcom,sc7280-gp-mnd
  fallback, map the 0x1000-byte register region, and document the PDM
  source rates. [#Konrad Dybcio]
- Use runtime PM and pm_clk for AHB register-access clock management,
  rely on the pinctrl core's default-state selection, and generate the
  output-clock name. [#Dmitry Baryshkov]
- Enforce valid GP_MN duty-cycle constraints and report high-phase duty
  cycles through the common clock framework.
- Add and register configurable PDM XO4 divider clocks and their public
  IDs for all supported SoCs, allowing the source rate to be configured.
- Split the pinctrl changes by SoC, retain Reviewed-by tags, and combine
  each SoC's pin state and controller node into one DTS patch.
  [#Konrad Dybcio]
- Correct the SC7280 output to gpio60 and disable every GP_MN controller
  node by default. Add QCS615 support as well. [#Luca Weiss]
- Link[v1]: https://lore.kernel.org/lkml/20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com/

The series is organized as follows:

  1. DT binding for the PDM GP_MN divider
  2. GCC PDM XO4 divider clock IDs
  3. PDM GP_MN divider driver
  4. GCC PDM XO4 divider clocks
  5-8. GP_MN pin mux support for QCS8300, SA8775P, SC7280, and QCS615
  9-12. GP_MN DT support for QCS8300, SA8775P, SC7280, and QCS615

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (12):
      dt-bindings: clock: qcom: Add bindings for PDM GP_MN clock divider
      dt-bindings: clock: qcom: Add PDM XO4 divider clock IDs
      clk: qcom: Add a driver for PDM GP_MN fractional clock divider
      clk: qcom: gcc: Add configurable PDM XO4 div clocks across targets
      pinctrl: qcom: qcs8300: Add gp_mn mux function
      pinctrl: qcom: sa8775p: Add gp_mn mux function
      pinctrl: qcom: sc7280: Add gp_mn mux function
      pinctrl: qcom: qcs615: Add gp_mn mux function
      arm64: dts: qcom: qcs8300: Add GP M/N clock controller
      arm64: dts: qcom: sa8775p: Add GP M/N clock controller
      arm64: dts: qcom: sc7280: Add GP M/N clock controller
      arm64: dts: qcom: qcs615: Add GP M/N clock controller

 .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml |  98 ++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  21 ++
 arch/arm64/boot/dts/qcom/talos.dtsi                |  21 ++
 drivers/clk/qcom/Kconfig                           |  15 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-gp-mnd.c                      | 333 +++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs615.c                      |  20 ++
 drivers/clk/qcom/gcc-qcs8300.c                     |  20 ++
 drivers/clk/qcom/gcc-sa8775p.c                     |  20 ++
 drivers/clk/qcom/gcc-sc7280.c                      |  20 ++
 drivers/pinctrl/qcom/pinctrl-qcs615.c              |   8 +-
 drivers/pinctrl/qcom/pinctrl-qcs8300.c             |   9 +-
 drivers/pinctrl/qcom/pinctrl-sa8775p.c             |   8 +-
 drivers/pinctrl/qcom/pinctrl-sc7280.c              |   8 +-
 include/dt-bindings/clock/qcom,gcc-sc7280.h        |   1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |   2 +
 include/dt-bindings/clock/qcom,qcs8300-gcc.h       |   1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h       |   1 +
 20 files changed, 645 insertions(+), 4 deletions(-)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20261013-b4-pdm_clk_gp_mnd_v2-993396fc6cac

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

