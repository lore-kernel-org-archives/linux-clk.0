Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741E3C9ED4
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773240428; cv=none; b=CvlzZR53AxhuEPalsp/B2Za9jkANUIc8gnKYdVbuaQ6A1yfMl2Jq4Niv+/iKhCE+VMKLrDNSs7Gby5m7TxJiB0qLsem9dIQ6/8ZFaAO0mzZxbjSzKfvH1RIwY62skdMcfCwuxP5nDws+BeLJvgqXdB+e75ec7KkY0Z//FeLsjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773240428; c=relaxed/simple;
	bh=/XsqeV+d9dblP9p/uC98m/HzXGPxUoriHQmCCn2ae7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uQw8d0H8IPIQfgSmShue4vNu3Qd7u6d60dNz3dN1f7SypK4txgXqIWeOMI4xEBA/KVpH60Lsw91/oH5NvZ35a/5fGu5Hy9gXvV/kfpVZixwXMTic2pGBiHYGJFWCFsJjhL7eoc9269JDWV0tDO/kWJ4svAScRWTEo1aZvGxPDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exKbdLM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfF9bHjE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exKbdLM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfF9bHjE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA5esl294279
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=300Km5ID9tzfCP3u9XYQMj
	OHFV4q6WeAOXJezcq6Eyo=; b=exKbdLM8vJLnRxfEMoEIe2EXWoG5WrndLktz/r
	2XKi+O4c0jogYE52n5AU7NwW7+yCj7MJlN5vA6bWjj8BCvInaSXeHMvVJBcbAFY3
	UFMKZYG4atpP9i5NLvNyfGU0giRTdjJHTj39qpk7+14KfkjDq6886hq+ypKGkz9T
	olGCTOX3N/5USDl4VR/Pp2q0AAPpeD4TYEoOYWh5Wjp1zhV08vz8+BCNPEQrLv5G
	O3j9KnT1O2XSX3MR5cuLwvrMThy3G16lZXbiAH98mTU5qG3N0UvYzzd2sxCRGyDf
	9eSsNnYByNgN518XKHH1RmivFSVEYHoHjXmxQlcW0so3SKGg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6bb8yy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 14:47:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd781c0d90so586730385a.1
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 07:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773240426; x=1773845226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=300Km5ID9tzfCP3u9XYQMjOHFV4q6WeAOXJezcq6Eyo=;
        b=ZfF9bHjEZB8IXOqXWutuFV0da5qZodRmJGXJzepVDkf/sF5WzMAq7RzeStkuzWHdeV
         0kFu8bf4JUBqnd6ryQcgHqBudNl+vrS5sIRje8M1nRbfe2SvOlxJuW2CstEdcGqR8xri
         BFh3HTWaJ37J/BgmWvPstG4px3weXRxtFr5a/iPewJDdS37wDMO+7NyNOXlozMKrR9aP
         2BRJfXJEkUxsOqXqi4aDAjRV2MC7ENuVYc8ts0L0jXMJ7vBIV/yokC8wXUPe1PKFoj7r
         6/51KnDFxlna2OwszC+hrEVV85xam2rFCzxvMen5Em8RuSIzWZSGlkYQy3oCOTx/0IQS
         KpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773240426; x=1773845226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=300Km5ID9tzfCP3u9XYQMjOHFV4q6WeAOXJezcq6Eyo=;
        b=Z0Gc7+0l2O/bTSL8Kf3nZbJAV47uryVUkIagvDg77rWO0CxDdt3+K5wttJx9erX9cf
         1UtEkLb5zJ/pcIh6yL9ssB7tYBe0ZXIMctcy+rqAU59++4DMJRHnHJiBok6dk7YvvV9p
         EnxyCQajW28ban7H/WF0yAa023aT5qwog7SX67iseCFmin4IC7iOmVepYZUC3X1DbHz3
         4fTRWcHvAn/fRy+SwI7dAjL17Y3hk2/F1UZy+XMQXBGtZ0XGU2g5ktVYNbZuvzrRioQk
         wwDCyMaItavGFZTWMBGqVZpPVbCb36btjKRjNWOEnSEfXNgxJF3rZv1gr7jINrD/E+7b
         H8nw==
X-Forwarded-Encrypted: i=1; AJvYcCVIWegSpJ9UBv+y1zSLEztj6Mo4beLTy+umJOA9S4sr/Tk4vPQkZHnmSM4OJ9Li94TtqCfNhD8/rmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3IFvumrDBdj0kDrUCmQJBrAgHpWTkj/SJzdm32BDCMa8uPaLP
	CGQx/c/aD/W9UhqjE+AFtp1fYNqDEBEGwfa0PSinSgkPesxA8xwsBXLYPcmZgElcrtYgf3a1+Ne
	TUNfceiOqiVhWGcBFkWNOnbDuLypfhyOieubBl1AD69SidaxT2WhYbEMbTF9M4UM=
X-Gm-Gg: ATEYQzx5jXQBvckYINLjjG3JrzKeyhis8Ubdkw8d5dNFu9rE0mwDKv/sgmZ4m7CA9y5
	KcCA+RxKW3nOEyqgy1mBg9wlRBL/SNWT+Za/B9KEVXrLN7nWWgjbTHp2f7C/tsuM2WktAzJVijU
	Rqpx86UGdGtmePip17nG9U52UjoLqqemyHFeLyFt8oRTTZBYAzjj57P+ZKkDjFJAWsje6WOmlJJ
	37gGHB1KY9v5/29NqVrXiRjGsQcoYRX/EdfudG6gINaBOxjmpeT0ciDYdl4s2ghSb0Dt0R19j6Q
	yWu096e5mVmqDo43yiWPqAP2gpq5B2tGyceXnLx6W6Mb98bu8siygtAi9gvz6uRIcRj9nY29F4M
	mlXdNfVILSdK20ztT/6rMYxjiZN09iw==
X-Received: by 2002:a05:620a:414b:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd93b3ba55mr825811885a.2.1773240425434;
        Wed, 11 Mar 2026 07:47:05 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:8c7:1271:f336 with SMTP id af79cd13be357-8cd93b3ba55mr825805985a.2.1773240424785;
        Wed, 11 Mar 2026 07:47:04 -0700 (PDT)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d61esm7992501f8f.8.2026.03.11.07.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:47:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RESEND v6 0/6] clk: qcom: Add support for basic clocks
 providers on Eliza SoC
Date: Wed, 11 Mar 2026 16:46:30 +0200
Message-Id: <20260311-eliza-clocks-v6-0-453c4cf657a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEaAsWkC/3XQPU/DMBAG4L9SecaVvx13YqArA4yIwT2fqSFtI
 G4joMp/xw1IDYEsJ93p/LzWnUjGNmEmq8WJtNilnJp9aczVgsDW75+QplB6IpgwjAtGsU6fnkL
 dwEumGtEiuMDQOlKevLYY0/vAPZC79f369oY8fs/zcfOMcDhb581tyoem/RhyOz7s/0TI3xEdp
 4waoyJ3kscK7HWT8/Lt6GtodrtlKUNCJ8aGnRiiGACITslqo6GaMeTFENxMDFmMykfQ3qL0bs5
 QY2P6D1UMHZiLogpKaD5j6JHx5x66GAHAmBAtlyBnDHMxJBMTw5xvGpUIlXdBaPjH6Pv+Cyd9w
 90dAgAA
X-Change-ID: 20260120-eliza-clocks-5ee7ec9d0e79
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3915;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/XsqeV+d9dblP9p/uC98m/HzXGPxUoriHQmCCn2ae7E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpsYBREyo8HNfyfCbCXBYUfdHRQNUMED/qgDwtf
 6l+iisNgVCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabGAUQAKCRAbX0TJAJUV
 VonnEACxqo7GlvsEx4bPeByLMv8DOrWMMw4/w8DxztRhILzWWbGB1dx4BWCbrHn5VqxZZB1vGZ+
 kCThUkcWAYI0iehY6dfZd+PwYMUODsnOe3q3h0DobG/dB6Xl3A3GcPIegL9Y2pcgLtYWaRhwop7
 X+SN/DI/gNl2YJXDrhcRtv/MH7EvN6VtakLEqyyCjuYdvbwLhSoO1/OZx9bFxW6gPEEmqYtI9MQ
 dthcGHg+Kkg72HuvDTK1emtseQ3Mdr2fHvIEexHYaZCqiHD0QzzvPAVuc2wft78jCa1yaa2wTrt
 +tv9EGR2kxktuS8L6wTShHsVoMZEcFUXn5SkSk7EFlmgiVA41qsqvsro4EnG5J99NYit5fuD7Ej
 +DLZCor8veRFj3eGyYbOO18GNrrrNqUfiD+nWJFU6pPo63MRmDGKAf+SCToBIzWpfankQKo8tOb
 Ss88wsq3JIwsSShz0O0CE1rWjrMrEMfDoD2wgo8EjIqXvJ31ggNstI8v/iX2fH9H7hzAbPXDnW7
 u8ZjO22jxDL2A5nhdIOT2ej3U8V7dwQjwB6ggnIrz6a/u4/slDPsd5/f91z5IAZ6NrSUkMTrbs3
 Ut6XtAUYm11OpKVNXejgqx7pGd9r0/Hp+GjOHmn8g9J5OkATvOjGxMkTkor/VDd3gPF9vtNlRUD
 5f/kg5JY7VT5Duw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: vJgzHFVWHOdZ48blxhF6k515kJkThTjx
X-Proofpoint-GUID: vJgzHFVWHOdZ48blxhF6k515kJkThTjx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEyNCBTYWx0ZWRfX+JEPl0muAmnR
 q1lOPw4nCyObK/7pOtr9IVLnXlAZwiaJg7J9nBJbDSdrS9iQbCOmvfrmBHH9Joi8C9onplbqE6p
 ahDd0Lq6LcEHIAa+b7Ev+JZ9VyInAarzeWoJy7dnxMRWKntnqP4TVGe26AqTYdQAuiIYWr8z3jS
 Kchn29uyXsBKm+YHIMGYRuNvChIic1+23EOvkaxFNkAOu23yxCXWPkhn0BelGYdCKOPhjWllr9x
 lgKLWJ33EE3EcIM1ibYBfuxIw1hbGTiFMn2W9acklxeg1q8ZhUmZtwvX53+09U6zp+y3B+rLOJk
 dDDuF7IYR5yiG9xrF2rW8qioS4stR028A3SkFyS7QzO4Hvz/SbREU2d2LJxTfeyVqrpiHrCZCjW
 +EtleOEfEW8jVkhgR7+0jTsTU3FcrIT4F/5jFjoWfiNjR8V+BT/mKFlMsol5FvAHzZXhPunxs7M
 muh0PGZrh6a5X1QsjPA==
X-Authority-Analysis: v=2.4 cv=CKwnnBrD c=1 sm=1 tr=0 ts=69b1806a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_fAS8OA3c_KVdZu2R9EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110124

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v6 (RESEND):
- No changes. Rebased on next-20260310 so it can be applied cleanly.
- Link to v6: https://patch.msgid.link/20260302-eliza-clocks-v6-0-6f42d8a9d25c@oss.qualcomm.com

Changes in v6:
- Picked up Konrad's R-b tag for the GCC driver patch.
- Picked up Krzysztof's R-b tag for the GCC binding patch.
- Dropped the GCC_CAMERA_HF_AXI_SLP_STG_ARES, GCC_CAMERA_SF_AXI_SLP_STG_ARES,
  GCC_CAMERA_HF_AXI_SEL_SLP_STG_ARES and GCC_CAMERA_SF_AXI_SEL_SLP_STG_ARES 
  from the GCC driver and the bindings header, like Konrad suggested.
- Link to v5: https://patch.msgid.link/20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com

Changes in v5:
- Added force_mem_on for GCC_UFS_PHY_ICE_CORE_CLK.
- Switched PCIe pipe clocks and UFS symbol tx/rx clocks from
  clk_regmap_mux to clk_regmap_phy_mux.
- Dropped the GCC_CAMERA_HF_CLK_EN_SLP_STG, GCC_CAMERA_SF_CLK_EN_SLP_STG,
  GCC_CAMERA_HF_CLK_EN_SEL_SLP_STG and GCC_CAMERA_SF_CLK_EN_SEL_SLP_STG
  from the GCC driver and the bindings header, like Konrad suggested.
- Sorted entries in the Makefile, as suggested by Krzysztof.
- Picked ub Konrad's R-b tag for the RPMh CC driver patch.
- Link to v4: https://patch.msgid.link/20260217-eliza-clocks-v4-0-5d09f28d4251@oss.qualcomm.com

Changes in v4:
- Picked ub Konrad's R-b tag for the TCSR CC driver patch.
- Added the rfclka4 and rfclka5 clocks to RPMh CC as they exist
  in the cmd-db.
- Added the missing HDMI and PCIe1 TCSR bindings IDs.
- Link to v3: https://patch.msgid.link/20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260213
- Picked ub Krzysztof's R-b tags for the TCSRCC and RPMHCC bindings
  patches.
- Picked up Dmitry's R-b tags for the GCC and RPMHCC drivers patches.
- Added missing TCSR PCIe1 and HDMI clocks, as reported by Konrad.
- Fixed the compatible order in GCC bindings patch.
- Link to v2: https://patch.msgid.link/20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260126
- Replaced the all-caps SoC name everywhere
- Created separate patches for each clock controller
- Dropped unused header includes
- Added parents to all TCSR clocks
- Added an explanation to why the Milos GCC bindings schema was reused.
- Link to v1: https://patch.msgid.link/20260123-eliza-clocks-v1-0-664f1931f8c7@oss.qualcomm.com

---
Abel Vesa (1):
      clk: qcom: Add TCSR clock driver for Eliza

Taniya Das (5):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza

 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   26 +
 drivers/clk/qcom/gcc-eliza.c                       | 3105 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 10 files changed, 3567 insertions(+), 2 deletions(-)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

