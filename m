Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E935675B
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105097; cv=none; b=nPJ0R9nAvYSZQBwont0Gy0K3HFV5+QNpByqnwjs24xLFQnzn1LX+0Wspm+YLURLKyG6XWAFO3UUAVBzv7BsyIl9j0iFlj3RYRgz6OKQxW6uNm0xCPvH8DMDq+ZXP9kgcP7azWs7PskW3qiYvLMwG9jASoizUMqkqwKD8icwrtHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105097; c=relaxed/simple;
	bh=OboAT1fzU1RL9g+1Z78H3lsB1Jeo5VybcdwdtcDqo1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RfdcNKyEghEEE/wWto2mM5CmIsmB07wBLulaQX0//05SejOyuMFesst9ukTnTXO18uIy/0vz+16/GWRmyMU4xKa5Xyg2Zq6bXnrno2DwfrYkIM656dTYOozrNDtwx8XT1kwlSwHxjaTyFeTNiL/H6a3brHA727bEWhWCFZyNwGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azxZKtOw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FH00t3ij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azxZKtOw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FH00t3ij"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59MMv1275555
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h/3utt32KpHCL9JzNrriGj
	rBcVViSsoxRdQP6fWabUQ=; b=azxZKtOwi4OtCPMjmA4mPP+aJXj94MLfuASfnA
	/Th3cY+8+Et98s0OuARE0fqi4QyytlC1JwWNbp2df37ghNln+zj9rKm2IpAqO7Ny
	HiDK2QV0stM4gm3lxQHRfp7iovZq8jHPzN65568aCv61xoYnLbfMoWiOLTU7oGVD
	gjQPDpPdJKKo2oHyfTts2VyFO29vILECbzUHJR9qGR1nVLwZRCHCFeLiAoIAm2jK
	siBAFON+EuLb1HQ/oddXylurpIX8DNAbkvu9hjMm6n6Uap3i6Mn9km/iLYejLFZJ
	1b4KErQ1zj/V+ig4Iltm9z8XtZUpinv0z3PxuOXLOtd2CokA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32vsfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 05:11:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bfe262ef0so2212542eec.1
        for <linux-clk@vger.kernel.org>; Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105093; x=1782709893; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/3utt32KpHCL9JzNrriGjrBcVViSsoxRdQP6fWabUQ=;
        b=FH00t3iji6XvX8x/EjCn8TDCP9e09gpQaqKr38dOdtlNRYBvl9xYnls7PxKVeqqpzO
         QxRdMrpkvmBbMoJblHIA0bthJcwk4tpss2IRSlLTvwJWRwpyPrjEiO1w0OGJArBnFUoz
         VOKiN7cz1LepaOYNSQNPfyTewUJ0BmSapTGRWlvnGx+e9n7olFDl9s06S6P+n05ooxFs
         SyY6XqbjOyOtLv76wufYXqyTiB93TCTFigsjjnb9ew/bIX0m3BYnwXoFT9DUQjW818C9
         /ulnM5IMKtFEFw/HWzzhFHzTTmPDBd3GB+PLw1wbzXKna9YL4QTWVoxvnbYs1xBPXvOP
         lKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105093; x=1782709893;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/3utt32KpHCL9JzNrriGjrBcVViSsoxRdQP6fWabUQ=;
        b=HLQoG8TcXNedBuhaUy3KEQGdCz5ea7r8O7dOUQUghNXDMgULVrgxXC9V7lGPDNa6iQ
         zE9B/yrWTB4AftYfeCqst4ImqFfDb05SThvC8J01sMqdamj3LO1l586xbiknBq7uYAAY
         9PNMGx6mB11+FAIcMNNnghHZ35VvpOd4UNbuX5Ix0DnZbqVeWhtu4OmqlNiK99W0DMT/
         lBkR72GFWQqAxNYOsU5Bc5EDgIxy1jvD3GPr6s6SH6UPr2sZfh0FF8X64yKee93zWwuL
         32YZ4sH+hR+WtXY3uWgoe+f3zPvEYrnI+S79mpGU+ZSQV+nI6UW/oUChQoX8wUriNnRk
         jdgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSWXVB1WcLuvsuGxbi8Iwn3Ze8Y69HAra2xDNDoUM3qgHHkwo9c3FdUwETSfcC0z42fpMfNH04Ib0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhs9oIMvjikC0HOth9AFbxRGXzFGjJ1xc/cfifFbWfE3bdwcSN
	vABxGHK6RhGkdxrCfdvHnHzDilHVQO3S1lB5CK1WjqkBELxbWWr6sFvBAqeJoFTBg+OBlNrFCda
	OYnvcHMpu1hPBEc5DaZvIYOpdBdS8Av+6u5hON1ncgwEiCL85MZ8UhRDLfnU2+yg=
X-Gm-Gg: AfdE7ck0+ocvrGtBXcr3lLO7yW+WznFpkQqc8LfEgXjN4IgS1PatHJIr7jOGZEfEGE+
	w/x0RQUA+Vavuh7RLMth30AkO9X4N2bqp6cn6INflfhKpnfVjChW8irwynBqdMOqG4eBq6vhdCT
	m8Oa59qgPBtgAwC104NYfvrEdY0NSfYZQlPRaInDkq50PjvaXhpRVuWPjLuHClskjr2hjiYUcPw
	0bPiwtY07Qpq8w7SUdt7ebTN0Zbo1utaBvS0d93MhmbtCCPChK3pUA6U95HyJ7y75LVbOEaOf0F
	bFdkfUq7gsQc11Mmxk2v65WU/Fn8ljph2NdX0QIjhb6VqbJ7ITjvA1LfchpuixnUNT8QAZjtIs3
	cr8XhYFFFTouw5rtbwFih9on31sO6U4BjlxprAPOgWbj0c4BWK0Ad07y0WQ==
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr7803025eec.9.1782105093441;
        Sun, 21 Jun 2026 22:11:33 -0700 (PDT)
X-Received: by 2002:a05:7300:6d23:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30c0798b7ddmr7803002eec.9.1782105092836;
        Sun, 21 Jun 2026 22:11:32 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:32 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v6 0/8] clk: qcom: Add common clkref support and migrate
 Glymur and Mahua
Date: Sun, 21 Jun 2026 22:11:23 -0700
Message-Id: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvDOGoC/yXM3QpAQBCG4VvRHNtamzbciiS7BuPAzw5Scu8Gh
 09f33sBYyBkKKILAh7ENE8CG0fgh2bqUVErBqON1dYkavMc6jVgVwuNcjpPXNZo26U5yGmRhc4
 vWFa/eXcj+u2twH0//soEUHIAAAA=
X-Change-ID: 20260621-tcsr_qref_0622-b091b8a06f49
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=4630;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=OboAT1fzU1RL9g+1Z78H3lsB1Jeo5VybcdwdtcDqo1s=;
 b=FmejGKbN/I0MJ+V7iqsoTZzZ3QSDvONIWkj7+rCWYnej79k87aCp1XJA+O1IYrnAkcL20i6Ws
 I3TZRHN7KwBA3W+keTmHPGLbvMjMmvonFrl+1wT42rOYunoLK6GJCyf
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: wdwnmRQY5NfF8Vh3BgmdL3TqOoq2dGR-
X-Proofpoint-ORIG-GUID: wdwnmRQY5NfF8Vh3BgmdL3TqOoq2dGR-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX2cPrJbHlU1k6
 ZLiLfZJTb/Uelr+5nWQEmsNXZ1mddk8MQc3K4JyqsSOdS8O2S4Jn04Lnx0W0b8mn2drZKHb8Aab
 hbYVGXE9HqRpXSRMQ9Vzs0eaclHVIsQ=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a38c406 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=sASZlnxNsQdz-UvrQywA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=xwnAI6pc5liRhupp6brZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXyg/1BDWOtlAI
 piC/HbuTvh2bWUS4d9Ltncw8ciroCzQGY65GQ93ijUdDy9tH4QNzMKPMP5xbWvt/UejQ0UHN43P
 j/mIoFfgGNLiR94gSi1I8CCLqX/S+qO5ZO8jQVXNSXTEyDb7TB1xY/4pYOJbG/sYsZJIwrYTBRC
 gJbmf7KGHuE8JqUxwkhwH2iMftdB2WE1hg3pz/7NAtsNxWeSWbPyjZNxCoRGUeDkZ3ZsHmrzUpa
 wZxLLTF6vjkJL6qAOWve0FfliIbOJUoAIJX6csUtn5KYGYTfqvO2a8V3uKzxTC9CG9C9sIN1arh
 tkaA4jVo3Kb+kYXaVA0midrxOtOZkzgcSD5c5VdfRCljl7Os3hUn8wvcGf3RC8CnisL7tdnuGuN
 M3voqQOC7nzm6KKdN7f446e3luGpFyXD7QtdehUjgAGrCjBd82t62TFXDzN0ZM7nND1nm6Qeats
 T6II6j+J+eh3+QB1SWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047

This series adds a common clkref_en implementation and converts glymur
and mahua to use it, along with the related binding and DTS updates.

The PCIe clkref clocks on Glymur and Mahua gate the QREF block which
provides reference clocks to the PCIe PHYs. QREF requires LDO supplies
and a reference voltage from the refgen block to operate. The refgen
block itself requires vdda-refgen_0p9 and vdda-refgen_1p2 LDOs to
function.

Previously, these QREF votes were done in PHY drivers. In earlier
discussion [1], the feedback was that this is the wrong ownership point:
those supplies are for the QREF controlled by clkref registers, not for
the PHY directly. Based on that feedback, this series keeps the
regulator handling with the clkref control path.

Another reason for this series is reuse. clkref_en registers may live in
different blocks across platforms (for example TCSR on Glymur, TLMM on
SM8750 [2]), while the behavior is the same. The common helper lets each
driver provide simple descriptors (name, offset, optional supplies) and
reuse shared registration and runtime logic.

Glymur and Mahua share the same QREF TX/RPT/RX component naming but
have different PCIe QREF topologies. Both are handled in tcsrcc-glymur.c
via match_data to select the correct descriptor table per compatible.

[1] https://lore.kernel.org/lkml/aEBfV2M-ZqDF7aRz@hovoldconsulting.com/
[2] https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com/

Changes in v6:
- Split dt-bindings patch into two: one to move glymur-tcsr to its own
  binding file, and one to add mahua support
- Use regmap_set_bits()/regmap_clear_bits() instead of regmap_update_bits()
  in clk-ref.c
- Move clk_init_data from struct qcom_clk_ref to a stack variable in
  qcom_clk_ref_register()
- Add Co-developed-by/Reviewed-by tags from Konrad Dybcio
- Add missing regulator supplies for EDP and USB clkref_en on glymur
- Link to v5: https://patch.msgid.link/20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com

Changes in v5:
- Return 0 if regmap_read fail
- Add a separate file for glymur-tcsr and mahua-tcsr
- Link to v4: https://patch.msgid.link/20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com

Changes in v4:
- Add mahua QREF support (binding, driver, DTS) to avoid dtb check error
- Override pcie5_phy ref clock to RPMH_CXO_CLK on mahua since
  TCSR_PCIE_1_CLKREF_EN is not available
- Rename regulator arrays to topology-based names and merge duplicates
- Remove else: false blocks from binding
- Sort supply properties alphabetically in binding and DTS
- Link to v3: https://lore.kernel.org/all/20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com/

Changes in v3:
- Fix dtb check error: allOf:0: 'then' is a dependency of 'if'.
- Link to v2: https://lore.kernel.org/all/20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com/

Changes in v2:
- RFC tag dropped
- Changed back to additionalProperties: false
- Moved all Glymur supply properties into top-level properties so they are explicitly defined.
- Link to v1: https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (8):
      dt-bindings: clock: qcom: Move glymur TCSR to own binding
      dt-bindings: clock: qcom,glymur-tcsr: Add mahua support
      clk: qcom: Add generic clkref_en support
      clk: qcom: tcsrcc-glymur: Add regulator supplies and migrate to clk_ref helper
      clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator support
      arm64: dts: qcom: glymur: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Add QREF regulator supplies to TCSR
      arm64: dts: qcom: mahua: Switch pcie5_phy ref clock to RPMH_CXO_CLK

 .../bindings/clock/qcom,glymur-tcsr.yaml           | 146 +++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  20 +
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |  15 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  13 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-ref.c                         | 205 ++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   | 438 ++++++++++-----------
 include/linux/clk/qcom.h                           |  67 ++++
 9 files changed, 668 insertions(+), 239 deletions(-)
---
base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
change-id: 20260621-tcsr_qref_0622-b091b8a06f49

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

