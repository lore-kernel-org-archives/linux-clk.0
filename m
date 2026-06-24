Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC02F3C9891
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782312681; cv=none; b=Xql8reo+DYbbVsYEIYeXLSnzLPRcA71qE/IH0zxRjfRw0ilk77bmoayU2p04jD4qVkbl8Ud9u9q0BQOSzA0Z7IS+sKM4Op+yvnwW3RCsRqMcBsduGWZjd1sJ8PgSBShlYrztsDSQLkd1gr+2AibVC9HUIq2Fn4dBI/touFjwjUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782312681; c=relaxed/simple;
	bh=a1V3XklcCFNCNRwd/JxOtuP9aplbPhlbops3erRwdsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYdwCqLqNBu+XbKTOR2tNhOYLi3R4cgKOu9L2Ics+iGauS33NGOYwWxmakvEQikwV3iPQm8fGAYOS1CV7clKH6BF6itTI6ww1XVhQ7Hrq2jxs1yr9OnhBv6AdHTMzGHu0HJ2jYhDp/ryJaIjaIPKJvBUlQJPN74ed1i4KZux+tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2VrYqDF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRlRRBAA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2VrYqDF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRlRRBAA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OEfEtb3418696
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq/yz8mtPFZ3oCLSMk1E9CQBxOauGYYBlFgRIaYt3Lc=; b=H2VrYqDFijpFkxSe
	y9a3MDs6+ecu8GTNWOM8MJGXiowdzvFm4kPkyrXItSb7syV/yUtyrti3wipeAeK3
	Eml39LI4z7ml1K0cSDD3fc5X1a47JdeqIG6EP+TN+9XamCzE6y6AZ8trlMXZNWMZ
	JJ6rYV0IHAKM5LdD5dIID3GWbk47TQwnLQk1jLLZTMOp9moSG3K/WOJCKozKUk4E
	3/3UVSnwll5t3MKlFxCjpYgCOREfC4vU7VXuIYRsGzzrp+gBqs6ELHtPY0zdMLRB
	3mRVUpqc6+NJ6tOAgB82jcU2TqVj3MkPOCmqzO6mMnfbv+ZSPvh5pCcA2dmIuyub
	6yV73g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p3ph6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 14:51:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so779172a12.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782312677; x=1782917477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq/yz8mtPFZ3oCLSMk1E9CQBxOauGYYBlFgRIaYt3Lc=;
        b=NRlRRBAASz2DPubC/SNx4XPPi7UMODlxk44XG7zax8G2YA9gMeZAXud2ZTKFdwAbfe
         wrZCq0It25oGfd61+VvIuMcotbzu4UYCNWSil5jOVZAHCsUPeW3Yq1pWeO4/c9vYmHVU
         xo0z01bi8HcGdsrrR8bi8waR9tj9i2FkSc0FfOBUeQEz+32NWjcQ3b+QblKSMTeNldIu
         EJYB8vU1RlILKxyr9kI6V/0CM73wsy18naACBDMIJZ+6+bmXIKQjPKk3qb02xZ6W6jsg
         r4bBHk0Ai/+AM7SqydTvb0ycNijN6ALGXMf6QJeTuJhiEuV+oLuVZW7K/XeAz8XjUneB
         RoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782312677; x=1782917477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qq/yz8mtPFZ3oCLSMk1E9CQBxOauGYYBlFgRIaYt3Lc=;
        b=cDGxGM1l5opPovf9rF8NqyXUAJwcNgyBYK71rAI8Wd4T/59CGfLLeTMYV6eOLxJeby
         DlBJinhOO7Yq/WjE/BJP6CsyyPP9/zN/jFhpVYu6gcxUATjrECHkQJmLQfi355R9Kldc
         ICXj0HqYU/hpx7LV+6dQ+Y3yx0vz9hWkL3dPcqGTxnv025qlQ8v62vpG9dBGHoFZHQOH
         k2rncdWM0voscea0W1RPVoLhcrUxbLibpG3pVJVNGLwcI+Ail4S7rRKiAQOL8S6cDuds
         Cxh6PVh9jy5DbCMI4D7p73+1u7pyFdMvZwzUUjCAJopk2f2uVGOYePGbSSC4A5zVJIht
         ZRGg==
X-Forwarded-Encrypted: i=1; AFNElJ+wYuPlhReKLPQWr/Z4fpTfqPjOKpxUnXD/6YAufjO4BX74NiSpdkhHKplyeWDBUTPwKtcgYtu3Syw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4s8mg2nmnGsNRZ7rt7KMq4p9BeCCL+Vc0JO4fJoOmfroJN1xt
	tJJ3um77gYzrrmJ1vGY73qZpel1BAhx6SF3LRB0askC6cZA1tByWnutWfKlBMtmCbjc8Ex7iCtq
	d9ntTV0LTJXDuYWFxi5proU1qwNuGZnmOO4gAzxi2UFpZh4NztotOSd/ju/OrmSY=
X-Gm-Gg: AfdE7ckgUPXd5Dyqm4NmvIr12FR0JXPf0oKqxJ+xTw2uZj7HYZt3D8FRvymQhZq8nor
	5Fc5Bd7vB/FdX3+9fF6twGwfzmouyYmL5TfSw8A6+xKuQDA67zI8WbQIZkjPEmYitY35qOF0CJ4
	KMs1CfG7r/a4AmlJu8PzxsY/1qQyrdHVDOCZQ9jOebF2hlx+nJ6D+SFj7gvPpMT7gGkXfihEDYl
	f+zcpUgQcZVZjVzBMTbBEl26LLKiO346AvoG3WTONaOP99ygDQTfhZaAEDoNPxOXFcuIAsVJapQ
	+c8v55dBA9AbDK6LFZV+jEn1l8LIh04Ajygs/U0iP+b5tO8vTTL2cV1sdmDygKc1Re0po5R4+n8
	3fy6vNG2SMUzBiMLLM7aJNMoteun1U900hdpRggWN1g==
X-Received: by 2002:a05:6a00:4611:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-845a2721ef1mr4899518b3a.20.1782312677406;
        Wed, 24 Jun 2026 07:51:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:4611:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-845a2721ef1mr4899473b3a.20.1782312676893;
        Wed, 24 Jun 2026 07:51:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc839sm2643271b3a.10.2026.06.24.07.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:51:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 20:20:29 +0530
Subject: [PATCH v5 1/3] dt-bindings: clock: qcom: Add Glymur camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-glymur_camcc-v5-1-a321df74b1a1@oss.qualcomm.com>
References: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
In-Reply-To: <20260624-glymur_camcc-v5-0-a321df74b1a1@oss.qualcomm.com>
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
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX0I3nn4TQnyyC
 GVpWx0K4F6JcznWFlGRRNatkAxP0u2leKkwB6O+0k9TvJiztodt0LMtUivom2wuhbzEXxsTQp42
 r5GuNj35cnLsdfvHX5bEnRmOQlhfd3Y=
X-Proofpoint-ORIG-GUID: bdXVo2FkQg-vrt-A1KDcVxQSAAc0K2yu
X-Proofpoint-GUID: bdXVo2FkQg-vrt-A1KDcVxQSAAc0K2yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDEyNCBTYWx0ZWRfX7VND50MdNH71
 bHKhQhWKwd8//svEbDovR/W5XCX+Vopr8sBBsHC0q/nisp3mBCMrvvZ5ZC+mmcqYAHd3x0+MVp9
 AgplUPdDvLIwmIqbZ7EhPHKZT4h3lYK5UwgHP8imRxlkKJI2T2TLuDtL8SZBSurGY3OW05FwO2+
 EUERfTcEXuskBod2Fhya3EUSyQFy0eSLeACHD8il/42q7VOZsRATHF5owtYg1VBdEy1EtoxxEHz
 y5qeZAUwGOIdm7Vun4eYkiTioEKA8J4G9RLs0D21s/xQg3aEdw+cw8a0CaKHgl7/6O3WoCvFhys
 tgyeJ0+NrBBjPsK6rpoot1FMH1mLyz4nyMgue6FZKo+Pi+e4QuOboOvxwdl8C4k6aNPvlE5v+NI
 0QU7DsS+gdGsS6fYO0wXhdLBELAjxXfmKZtqIIEpTpDGV2eyVzbO4Cmk9/W7k/dcGvg/efTaclY
 S4l+r3vReGqOeqQLFgQ==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3beee6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=EFDngOt3UxJXKfoqbMMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240124

Add device tree bindings for the camera clock controller on
Qualcomm Glymur SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |   3 +
 include/dt-bindings/clock/qcom,glymur-camcc.h      | 122 +++++++++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
index b28614186cc098268ab0d8c32b21d9dd9508c9f9..e7cb8cfa957a47a2370f002d118664292092fb90 100644
--- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -8,12 +8,14 @@ title: Qualcomm Camera Clock & Reset Controller on x1e80100
 
 maintainers:
   - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+  - Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
 
 description: |
   Qualcomm camera clock control module provides the clocks, resets and power
   domains on x1e80100.
 
   See also:
+    include/dt-bindings/clock/qcom,glymur-camcc.h
     include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 allOf:
@@ -22,6 +24,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,glymur-camcc
       - qcom,x1e80100-camcc
       - qcom,x1p42100-camcc
 
diff --git a/include/dt-bindings/clock/qcom,glymur-camcc.h b/include/dt-bindings/clock/qcom,glymur-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0c93fc77ef268b5971e671c57ea5cfca3d630471
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-camcc.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_GLYMUR_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_CLK						1
+#define CAM_CC_BPS_CLK_SRC					2
+#define CAM_CC_BPS_FAST_AHB_CLK					3
+#define CAM_CC_CAMNOC_AXI_NRT_CLK				4
+#define CAM_CC_CAMNOC_AXI_RT_CLK				5
+#define CAM_CC_CAMNOC_AXI_RT_CLK_SRC				6
+#define CAM_CC_CAMNOC_DCD_XO_CLK				7
+#define CAM_CC_CAMNOC_XO_CLK					8
+#define CAM_CC_CCI_0_CLK					9
+#define CAM_CC_CCI_0_CLK_SRC					10
+#define CAM_CC_CCI_1_CLK					11
+#define CAM_CC_CCI_1_CLK_SRC					12
+#define CAM_CC_CORE_AHB_CLK					13
+#define CAM_CC_CPAS_AHB_CLK					14
+#define CAM_CC_CPAS_BPS_CLK					15
+#define CAM_CC_CPAS_FAST_AHB_CLK				16
+#define CAM_CC_CPAS_IFE_0_CLK					17
+#define CAM_CC_CPAS_IFE_1_CLK					18
+#define CAM_CC_CPAS_IFE_LITE_CLK				19
+#define CAM_CC_CPAS_IPE_NPS_CLK					20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CSI0PHYTIMER_CLK					22
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI1PHYTIMER_CLK					24
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI4PHYTIMER_CLK					26
+#define CAM_CC_CSI4PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSID_CLK						28
+#define CAM_CC_CSID_CLK_SRC					29
+#define CAM_CC_CSID_CSIPHY_RX_CLK				30
+#define CAM_CC_CSIPHY0_CLK					31
+#define CAM_CC_CSIPHY1_CLK					32
+#define CAM_CC_CSIPHY4_CLK					33
+#define CAM_CC_FAST_AHB_CLK_SRC					34
+#define CAM_CC_GDSC_CLK						35
+#define CAM_CC_ICP_AHB_CLK					36
+#define CAM_CC_ICP_CLK						37
+#define CAM_CC_ICP_CLK_SRC					38
+#define CAM_CC_IFE_0_CLK					39
+#define CAM_CC_IFE_0_CLK_SRC					40
+#define CAM_CC_IFE_0_DSP_CLK					41
+#define CAM_CC_IFE_0_FAST_AHB_CLK				42
+#define CAM_CC_IFE_1_CLK					43
+#define CAM_CC_IFE_1_CLK_SRC					44
+#define CAM_CC_IFE_1_DSP_CLK					45
+#define CAM_CC_IFE_1_FAST_AHB_CLK				46
+#define CAM_CC_IFE_LITE_AHB_CLK					47
+#define CAM_CC_IFE_LITE_CLK					48
+#define CAM_CC_IFE_LITE_CLK_SRC					49
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				50
+#define CAM_CC_IFE_LITE_CSID_CLK				51
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				52
+#define CAM_CC_IPE_NPS_AHB_CLK					53
+#define CAM_CC_IPE_NPS_CLK					54
+#define CAM_CC_IPE_NPS_CLK_SRC					55
+#define CAM_CC_IPE_NPS_FAST_AHB_CLK				56
+#define CAM_CC_IPE_PPS_CLK					57
+#define CAM_CC_IPE_PPS_FAST_AHB_CLK				58
+#define CAM_CC_JPEG_CLK						59
+#define CAM_CC_JPEG_CLK_SRC					60
+#define CAM_CC_MCLK0_CLK					61
+#define CAM_CC_MCLK0_CLK_SRC					62
+#define CAM_CC_MCLK1_CLK					63
+#define CAM_CC_MCLK1_CLK_SRC					64
+#define CAM_CC_MCLK2_CLK					65
+#define CAM_CC_MCLK2_CLK_SRC					66
+#define CAM_CC_MCLK3_CLK					67
+#define CAM_CC_MCLK3_CLK_SRC					68
+#define CAM_CC_MCLK4_CLK					69
+#define CAM_CC_MCLK4_CLK_SRC					70
+#define CAM_CC_MCLK5_CLK					71
+#define CAM_CC_MCLK5_CLK_SRC					72
+#define CAM_CC_MCLK6_CLK					73
+#define CAM_CC_MCLK6_CLK_SRC					74
+#define CAM_CC_MCLK7_CLK					75
+#define CAM_CC_MCLK7_CLK_SRC					76
+#define CAM_CC_PLL0						77
+#define CAM_CC_PLL0_OUT_EVEN					78
+#define CAM_CC_PLL0_OUT_ODD					79
+#define CAM_CC_PLL1						80
+#define CAM_CC_PLL1_OUT_EVEN					81
+#define CAM_CC_PLL2						82
+#define CAM_CC_PLL3						83
+#define CAM_CC_PLL3_OUT_EVEN					84
+#define CAM_CC_PLL4						85
+#define CAM_CC_PLL4_OUT_EVEN					86
+#define CAM_CC_PLL5						87
+#define CAM_CC_PLL5_OUT_EVEN					88
+#define CAM_CC_QDSS_DEBUG_CLK					89
+#define CAM_CC_QDSS_DEBUG_CLK_SRC				90
+#define CAM_CC_QDSS_DEBUG_XO_CLK				91
+#define CAM_CC_SLEEP_CLK					92
+#define CAM_CC_SLEEP_CLK_SRC					93
+#define CAM_CC_SLOW_AHB_CLK_SRC					94
+#define CAM_CC_XO_CLK_SRC					95
+
+/* CAM_CC power domains */
+#define CAM_CC_BPS_GDSC						0
+#define CAM_CC_IFE_0_GDSC					1
+#define CAM_CC_IFE_1_GDSC					2
+#define CAM_CC_IPE_0_GDSC					3
+#define CAM_CC_TITAN_TOP_GDSC					4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_ICP_BCR						1
+#define CAM_CC_IFE_0_BCR					2
+#define CAM_CC_IFE_1_BCR					3
+#define CAM_CC_IPE_0_BCR					4
+#define CAM_CC_QDSS_DEBUG_BCR					5
+
+#endif

-- 
2.34.1

