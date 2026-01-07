Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85BE25CC74
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 05:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764116; cv=none; b=cDcLV+UjxtPqPqPf2LTualJV6IibFQEExLe92k6hK9h3FN9jBiAVu+smfPl4xrmokNY8pJ+DSkWKWZ/gdg2l3vcUqOAAaeVIkBRKutvvF7hcRNZC42wWZleGH3QNiR9qCqGKTxVfc8bFkk2hY8FeLOHt2I61EcvhCBkPpgreh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764116; c=relaxed/simple;
	bh=ASMSlk9UjiBi0fWyNf6kwg3unKIiesB4YrIfAVwtVjA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GNKGasf3Iyvw/FUpb1/0AvaZMbVqSHp4p1nkJdXmWwfHUamdgmBoUsYt5ccG+lT0pC+g6vOs2bPLcugmAZAi2NK4Hm3EsooGo+rLDWbBBjiQ6+XlqMyVivJLHkS+ZMY+1DXOf8OHjGvxg26tiJFwa6jsWpUJnINpjLtbMks+764=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCaYqVEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J10CRXOz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCaYqVEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J10CRXOz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073U3ko365170
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 05:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f+77550onuZ+yiKavi2Hb/
	3NPPvy4UOyg5lTrpToA/s=; b=ZCaYqVEMa4aebIidVlRfiqO+vxRppQWxU7KTNY
	or9Sn/bC6ubFKi1kCH5hXDNlkDcnsN40XnPLBZxcM3zruPBA66uS//R+nXYF8uAf
	w4jD0kVBlRV1fAF/y+zwHow/QGtV0JlNmXa7ypBxRBMm8xaXULfOVV6KPx8Fdkbl
	OgNywnsgNPoMOEIkEYoYNI28PG7Lecy17S7j7P+Dqoiur1nBgOmDzQKdQ95V/E5H
	LgJhDfUtDPxKe+sKo40Ce1XplD42G0OxotSXUpFikVx3vx7Kr5FAIN778yIdbPKd
	LvqYgEc21TqCRCoc+9t0sXocSSZrols1TlIMSQ493AXljNiQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh660syqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 05:35:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ae29a21e7eso320287eec.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 21:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764113; x=1768368913; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+77550onuZ+yiKavi2Hb/3NPPvy4UOyg5lTrpToA/s=;
        b=J10CRXOzEsCXHx0shhAeT93zb0IfJTBZtrnz3nMtN0lM5xUoz1tUtmTWWmQllXP4QL
         KLI9+T5XygxrZmOtpyVCkuiaWNoeldQnEOEw/lFbQmYdckyf8LHRlE8qnqUwn/FWUD6j
         aaFwfHokUg6eF4crm+xxkcRSbSQ7tEon4CmTkIGDLp8ZP/3wT5bJycIVC2un94c1JZCG
         P2RV8QA0WE32pedIrK/TxdLuQmsoDx1v6oRCdgpK+HizqKJURPxVtMvzDarHngrJRAFc
         2HbMx6iXHj4QCoeZrZUcHBH95YgSH2uPuyn7Nv5t7kNbRhNSAhQmr82YmIj6towptk8b
         h8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764113; x=1768368913;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+77550onuZ+yiKavi2Hb/3NPPvy4UOyg5lTrpToA/s=;
        b=SAu65iMclvVH9Nb8aGOFUe60QFeqXyIyZAao0lfYj3dezpVuUfjkfY4PCXmxDqFGG5
         9CmzaOiQf5v1hr3TB3lv9YziKUvXX1zu8TK5/yQ2pUyZLOaYVH9EZBn10nkyT79qeTAz
         40p/W7WqC+4JFNU+ifgnzCapxwF5twEHcvvD57XGmFiCD87WZZK4RNZlyIF7ppQOJC/h
         rE9BfewljY9fijUypMzJ/IT98SsWqnn2n9tgQfi3U1w30SImLbbptCKJBlcxjC84mOAJ
         yVJZSqqli/zJ9zjsPBvHLRrbIxrOeDcm5nVAnHLlwtWrEtaD2LwI0KQRA+ZuvqF6Ymgd
         Epug==
X-Forwarded-Encrypted: i=1; AJvYcCXKy5ch2PPx+CsX7R8gjOw4Q39Oxt7TqQbmfhP1phWGI19Kk0YwevWizUc3xmFkKLgD5EgL3/6oqGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAY63sjkTBeU6BTTtzbJLU3V0ai1ZncOP1Ox6vBCGhyX/Qm6M
	QUw+ZyXNMwrzRbCPWF6y/2r41kNee4TRFxT53HLiB0gVdsiuIJgaO5frt+AsTC8AZ1WF0LhZuwN
	d/Oh2dYp+dkIEodU6HsHjPww8vByIeYZObRKdAoM9WlhZE/8s3sIm5eTbiG2J20w=
X-Gm-Gg: AY/fxX6fEHcRVkI072ZMhDPLUmkxx+5h/p9uyoDyUgb0vrSJ/upGBfgrJUo5ocmtOsv
	VQKGe0G+nprMlgVfdemuONUjBLcwOagpL1dJnQmSLkWEpoG5ZUxlPYCmDHYNN8s96IiJHGw6LOd
	RYv/RrMkPklpwb5lsp4weVE5CE1qVBupkV8HXoJA4fF7jV5WFP4rRWEoF21RT9mC/NkACjlIo70
	iXD+h0ak92yydebf/57qBr8sq3+6WI8v5qw1LGtpYuLexfH7OfQO7aW5QeqbAn5cDMSaXWCt4V2
	npz16w2/dplbQhI0JPVk+Or5ScQFlSBGLaJ5M7tkdPIRObQyPc15kHyVBmccdI6gkfV5Q9dXaXR
	Xghrt4vUHlLNsPMyhlDFKN/DQbrm40mL+4quI69uWk8yFI6nVdET8
X-Received: by 2002:a05:7300:fb95:b0:2ae:4c8c:2b6b with SMTP id 5a478bee46e88-2b17c78a4ccmr1081481eec.8.1767764113124;
        Tue, 06 Jan 2026 21:35:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+H/7CHO6IFJ1t6J1rM75SzTDeRS8Tr9J8IukN6ntL9Ff4XA2rG26v3WoAJf7taFR/KyXYIg==
X-Received: by 2002:a05:7300:fb95:b0:2ae:4c8c:2b6b with SMTP id 5a478bee46e88-2b17c78a4ccmr1081471eec.8.1767764112539;
        Tue, 06 Jan 2026 21:35:12 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:12 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Subject: [PATCH v2 0/5] Add CMN PLL clock controller support for IPQ5332
Date: Tue, 06 Jan 2026 21:35:09 -0800
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI3wXWkC/22NQQqDMBBFryKzbiQZmypd9R5FJCZpHVCjSSst4
 t07Fbrr5sP7zLy/QvKRfIJztkL0CyUKIwMeMrCdGe9ekGMGlKiVwlLMNgwNTbMuCmzsME59L1q
 LpZdHdLJywJ9T9Dd67dZrzdxReoT43kcW9W1/vuqvb1FCCq15rjWVPqniElLK56fp+XjIOaDet
 u0Dj29Ip70AAAA=
X-Change-ID: 20251127-qcom_ipq5332_cmnpll-bc27e042d08d
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=2244;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=ASMSlk9UjiBi0fWyNf6kwg3unKIiesB4YrIfAVwtVjA=;
 b=xNtf6jnuf+kTlQMeATA57cmtAc3xuBwh8UaB6R4sH+dpf+BfSg6iaHYz5YbI8GJuZqUKLchZ2
 ZAgUUhIe2EZCEMdM7xBYMHnol9YGG+bEIzCptEgx8sA3URky76dxHFJ
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=695df092 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=-DZapK9TY56_rVS7fsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 2pkb3937z2ZwGZuJemhXiRiY2enhHQui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MyBTYWx0ZWRfX7D+iK2AEf9QG
 eE+bf3GXhivQ3AUStk94F54YdnEWhK0TJjMFVWD9uFhHBnjBrEVha4EbNVtk0pqWFIq6OYEVO0e
 9VQ4Mrql6b/NOxQ27nkdV0EHr9W9yQDBwFwSfKDV/Sqzf3C/Hql/11FoiK8oJods7+gPtEHt7Ff
 k40YkqPrly28bgd2CvoosKJC0y+/1Ho3k+CYSYnpt6L0WdAIeusBSpJBG2sXpDSy3vT0d8OoU5N
 1mu4b6OoUbkmGxfR4ZcZQmdjCw/q0JRjp9tjxlWzaTuhwGpwsADzv5OHykOUrN6N0pfpCjLCOZ1
 spBzKP0hjR193of1BK8eA9jnN+OC6uvZic/RtvBgESOV8fuOZdMbQGwcSahZWv3zGtfu0PmF3sa
 klA1vRXVgoSzCWlNbzsE8+nERz719KLSjmmOVdfCHpjpXCoWPEXZNA5KiWF4JILoIS+Py+Eyzsr
 7BZCa7M/Kwi6tQXO0ow==
X-Proofpoint-GUID: 2pkb3937z2ZwGZuJemhXiRiY2enhHQui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070043

This patch series adds support for the CMN PLL block on the IPQ5332 SoC.
The CMN PLL implementation in IPQ5332 is largely similar to that of
IPQ9574, which is already supported by the driver. The primary difference
is that the fixed output clocks to PPE from the CMN PLL operate at 200 MHz.

Additionally, IPQ5332 provides a single 50 MHz clock to both UNIPHY (PCS)
instances, which in turn supply either 25 MHz or 50 MHz to the connected
Ethernet PHY or switch.

This series also introduces a SoC-specific header file to export the CMN
PLL output clock specifiers for IPQ5332. A new table of output clocks for
the CMN PLL is added, and the appropriate clocks are acquired from the
device based on the compatible string.

Account for the CMN PLL reference divider when calculating CMN PLL output
rate. This fixes the doubled rate observed on IPQ5332 and is a no-op on
earlier platforms where ref_div = 1.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
Changes in v2:
- Use WARN_ON() to catch a factor or divider value of 0.
- Update DTS clock names to use 1 line per entry to align with corresponding
  clock definitions.
- Collect the Reviewed-by tags.
- Link to v1: https://patch.msgid.link/20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com

---
Luo Jie (5):
      clk: qcom: cmnpll: Account for reference clock divider
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5332 SoC
      clk: qcom: cmnpll: Add IPQ5332 SoC support
      arm64: dts: ipq5332: Add CMN PLL node for networking hardware
      arm64: dts: qcom: Represent xo_board as fixed-factor clock on IPQ5332

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   | 24 +++++++++++++++--
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              | 29 ++++++++++++++++++++-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 30 +++++++++++++++++++---
 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h   | 19 ++++++++++++++
 5 files changed, 97 insertions(+), 6 deletions(-)
---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20251127-qcom_ipq5332_cmnpll-bc27e042d08d

Best regards,
--  
Luo Jie <jie.luo@oss.qualcomm.com>

