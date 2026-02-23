Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85980364EBC
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848112; cv=none; b=hV0VU0ChQAelBQRzYAZ4xW1p/1qGU5aHWNJ+ZlXoImqR48YIPox9MEXIjBdvxxp35WwCvKg2fnQwaJcaGzNbItORDwXCQz5/yuZVZX0W1b6YxRw4eZ13BVqJI9U6d91XcrND5L2gsTGV5acAvEcoS0ZL+CC9EUeO3agroXCHmG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848112; c=relaxed/simple;
	bh=49CCo8rxOGN20h8kH6fGhQ9CLCog1oCVLRfQHVvSUPI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jF37IM4mFNo9jgiLKiQFBlWh+XAOIMs78qcglYGZ5VzrOEosIa9/b2CAxBkOk+QrVKAXhI7KomrSPh4EtmkAT/g1h1FjJKPbQGSWCqqwGPCKk5MWxBV0CSksewMzIX/mdetjGSss8dlMO8KzXn+WilOBjHgv1krS/XZtBsT9QV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkmlylOF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RluHzL04; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkmlylOF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RluHzL04"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9HLSt1361740
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rvhNc1bipXcMsZcVw1Cr1w
	TObAR6O8bjLYrKKUfU/PE=; b=QkmlylOFiqW7eMvMO7zqlvWkHCVQQ2PFVAN3YO
	LD2o3qBBAss7+hUf4YUPIPwYhJagqOidjBnjVy9W3M1ikbe36KwlKXnf0dQ/sivV
	k9EFT9Qe5MnVtdi/6fQ4iV9dpqJ4087wWkUR0P73RhM2zBOVaZh5ShU1JitAmk+r
	wXEM2wBszUXUPpW4aBuXMTw6k3ZuigUlx8kEay/dG1I37GddncZ2UY4R1dmQ6TK4
	D8FKQFt8rpMWXltHkLaNoq8ziqYRJSBd6qiSKR95DGVhvmsAvU+As5LYo9gXDwrL
	oB4Bp2VxlvOGDXS0GlR1ULvw7AdDtELw5HfUp7oe+NpFufyg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vm4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 12:01:50 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7d4ee07e31dso85499537a34.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Feb 2026 04:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771848110; x=1772452910; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rvhNc1bipXcMsZcVw1Cr1wTObAR6O8bjLYrKKUfU/PE=;
        b=RluHzL04hz+NEFvyXFpbiAxYboKlnON5kinpCNw6NluXp/NisMDbwktqYrLl041VAX
         jVXs48JSDwJdvKT5X/KnsoOxyvWpTrHwEuGax/M5NLfCEdDiBLbZiiay7lGNcGgkogXX
         BMckWmN/lIEd0RYsQ1V41dPqQ3vjskPJ/0ZsaimeZJXWA1OorMlJfQw8C3KkFxmrO88W
         68ZlYxF8y1+iN39pRBrzxHL6q3/uozfCmWGEEeeu17MEDzEA1o9k4iypuaHalUG0JcxK
         3A+OdMLm2THQbqmFXM5ZjMbmVNI4/2U3mJikzDB9yhL5o2n1dkSfYP4AdwMFzaOLO/2S
         fqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848110; x=1772452910;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvhNc1bipXcMsZcVw1Cr1wTObAR6O8bjLYrKKUfU/PE=;
        b=xQUF2UWfeu4y/qgw0B4I3SjyXbCmQ97O7a0XG3DpgnJJEwyK8StqmdDSCZPqjnzcBf
         ZDoqa8PSNOUzL1z7pjtxq0wCS6PnTNqvr3BlmUG43uqr1ySyEsokzTl8JzEW/chptoG2
         MqIk9ph3yuWRNx22CtP+YyFH6N7741gKUPopRo0qBxmRchOUiAGlNOQlK7E/xGb/5Ci6
         cFPCRe/swyyql+X98bWZ4qnGFSS7sf26EesMKbAoFJXt9ghacA37FfXc/ZtbtZ0KXIBL
         8pDqCuI89AIScRrTavnTIhBkDO8J+bm/c++sFZcrLvvA66MnbADjvUqRHam+xBmyBYd7
         sa8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAQHcTyRxmGSk2X9xTN+xFWGaeo+UzxKiM/wi6lIfo1B4XTe0ID2Qy6KQf/PP6K3EQ8XyPPLmhmiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEPhQ/B+DXt+tejRMwuSoZabaXBnlmKD5Q+pS8jRyZ+Zuc67m+
	C2YiBxwVj5gtTtgYfzORrzZTbnIcroz2e7HnXweHkyjoF0n6azj84HgVzEPdMIwBRWae+/+HZTn
	1vDiaZwjyhgIqTHbeIpnee5vquOWgkV8iSrm8WokD7YpK6uBGJj8ysX12WWw3u6U=
X-Gm-Gg: AZuq6aLU8lH5gx3oSFlOaV66fFlnuNSi/oijMszb6MX4bklXXtzLLtWHzjfK0AFrwLr
	5su5QrZzO67ok6t4bbfhPgmLffb1GTTkMK2n/9wnOk/QEo9nXcUgtzTqHE3GSa/b/R6nENi0CHY
	jGurVvmkcQgsZodT+oKGjV1CpfO9AnC+9ZgHiv4dHyPUIdWPu9usHOj9QH1chx0qAQBY+O0S7cj
	yPZ0ITqTx3FJ955Gwv47bIF8VH3PMxRbXKXJ/d4rWypnQFPwCPvRLes8243JaVB0WK12tQMu/tp
	I2Y549vc8mty0aAc7rHU41T/hK6RAKk9YWXWTpL7UNoG6UTpIIpqSiGI1JNFOvViQCcn+moXxnd
	p3FvwXrgpo709pWCMbYnT0llgT3mw7Q==
X-Received: by 2002:a9d:7d98:0:b0:7d1:8be9:e6a0 with SMTP id 46e09a7af769-7d516a5cd43mr5269732a34.13.1771848108921;
        Mon, 23 Feb 2026 04:01:48 -0800 (PST)
X-Received: by 2002:a9d:7d98:0:b0:7d1:8be9:e6a0 with SMTP id 46e09a7af769-7d516a5cd43mr5269701a34.13.1771848108361;
        Mon, 23 Feb 2026 04:01:48 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d95sm18487881f8f.13.2026.02.23.04.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 04:01:47 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 0/6] clk: qcom: Add support for basic clocks providers
 on Eliza SoC
Date: Mon, 23 Feb 2026 14:01:17 +0200
Message-Id: <20260223-eliza-clocks-v5-0-dcc66df713c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI1BnGkC/3XOTW7CMBAF4KsgrzHyb2yz4h6IhZmMwRAwxBDRo
 ty9DlVViGAz0pPefDN3krGNmMl8cictdjHHdCxBTycEtv64QRrrkolgomJcMIpN/PYUmgT7TDW
 iQXA1Q+NIWTm1GOLtwS1Xvzlf1zuEy2AMjW3Ml9R+Pe51fOj90fKV7jhltKpU4E7yYMEsUs6z8
 9U3kA6HWRlkuNCJZ8OMDFEMAESnpF1rsB8M+W8IXo0MWQzrA2hvUHr3yVDPxvgPVQxdMxeErZX
 Q/I3R9/0PGeWWKY0BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3262;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=49CCo8rxOGN20h8kH6fGhQ9CLCog1oCVLRfQHVvSUPI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpnEGWSuUyps5uNc4jNd/KKxFnYBWGsPMYpjRYe
 XCZmraKoB2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaZxBlgAKCRAbX0TJAJUV
 VhjcD/9Z5ob6g2E/lCJFqX3cMxkzAwDgRPb6vq6rmHjp2/3X0/Wctyxj+K/RgmPB2w+mWY0WGEy
 ng9MR8/7Qwh/wZgoyViw8rbfAXerpRf59MrGVjbde/FgETJO1JGxjwyUXEmvuEOPt163Dn2bMx3
 409RL3RUWSvOu3tPwF2RZBcJgVRy0MND6KQMRaRGajxPS5Mvd/bAoVX6bgGslMQRZVEWu9HNv13
 tKclaT5tZmWaHtjd/2T5dMF8QwieM/TK31jvgriHmlBPCQslDyLrKXfM9TdR6w4Yg1zYeAcJT65
 Ldkt9pQtfN2fxvsO2thfHlVOdX6yoc9te2VODIgttKmJMtfx+MvuhQZhrJm8cNEzo7P/8MrheRJ
 wOyrjGGM6+vn5K1UYYCYFOhT/+ZdKkFzzefuUB6vGtNH0McnaQk/IlEOcMNC0+JLA2hqkxTvIos
 UMvJ9wHE3W47H6cr00bEDNlCG8TD47zgVCzjIpmRrsNDc6/P4i/ZO9XyQwrT/11A2y/6/LEJAjY
 AIvXlbh46YGOMancLUqVoHjfU1XdKHK4nISGTcQX2+BlVAPixYF0AvhZ37mIZ0aDFHUR6PXoSBh
 Rg7OXV+yyPURfUcbPH3rdPQPLwWVTqfqeK/sZW6u3OebpZM5lE2653LHkO/Sxci52LuTP8SaMNV
 tJGAuC0dGxeIUbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEwMyBTYWx0ZWRfX73OsB5bDpqnB
 AJT+h92dU5JGMGlo8UuknZW4l6XImolJvjp9E59JslscTdPBZk1vwWpNqG7em7801Q6R5sZWwxT
 dx1S8ja4DVoXLHvb4lGlSVKb8KP/cADCv3pr8RiUTWL74bk/ntb26gmgH9uf5d32wxKPMDLdJ0l
 djJlDOWVmgTBhw1u1khLPx20DK57eoAdt26F5KKKAsd3cCEe+iMnVlnwQtYiav6q9oYV6li4ZSo
 CsPuspxqEzL6wYCGcWDSCB9MsTmOOsKv+AWdynPpXo3giTaccRGbnzGcyKQYe41hQPll5Fq4HG7
 nGzQEdDGHYESG1P2Epr9goz+TxhVX+1z166nJc65/JdcbyaDGcGMseC40a1NYsfOvy+9R5nFGG8
 AP+MDF6+O/cbg1WrerLAngiq9TN7vSAv0am1mM7DFKPsN0/D/w1JTOwW7ZT7VvmQrjhnkooe+Vn
 klNUCZ6VOyvjiDgi4EQ==
X-Proofpoint-GUID: zXsTz8ikd0TNra-mhSHO5hto3ZU9gWqm
X-Proofpoint-ORIG-GUID: zXsTz8ikd0TNra-mhSHO5hto3ZU9gWqm
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c41ae cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_fAS8OA3c_KVdZu2R9EA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230103

These are the bare minimum clock providers needed in order to
be able to boot to shell and have the rootfs on UFS.

The multimedia-specific clock providers will come later on.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
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
 drivers/clk/qcom/gcc-eliza.c                       | 3109 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  180 ++
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  214 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 10 files changed, 3575 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260120-eliza-clocks-5ee7ec9d0e79

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

