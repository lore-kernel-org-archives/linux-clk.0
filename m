Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CF411F83
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572506; cv=none; b=D1gbe+LywRFoZXr1lPWrat3FqpV64TlsFkJUY1YSZdhxKn43Yq4nOEFlTA9W2gzhkYC80++wExRLYH3RjI1urpucVMk4BkJFk0aybHarjGx+s1UDEzRCUf4SJZOkBZC0l+Sj2WliZUm47mClIRiRaNs6xhn1a5Cwfq8zJRRqf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572506; c=relaxed/simple;
	bh=yHkArQEhwJqq85ZOnDKd0QXWMauHDprOTAf3+s0+ug4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SV0EByO644mqd41gSdi5TY21mlstIx8z1Y824NuQjJx9p3WGSmlsrLeELHActVrDuJ5Q5BfYj5Zdj48IXct8J2gYC4xFakccCwOdt6rXTG/fUtkardoMlQ85lWMtpWCsXRxRiwTds0iRfJumsbzCyTptYqkggd142SjrCKy/eaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfxqYtE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fd7eNtmr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfxqYtE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fd7eNtmr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMnXD2865081
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrSB/fAC0Fl9q+cTIg6QyU7PpT1fGiPMuMV14aKjxc4=; b=EfxqYtE9iu0kcbph
	FBsi55IvVhDh/XbYrB4XmnfRf4t8n2LbgRBsXd+i/aZyk7WMnI4D1ShWnFhdJiKl
	7S0GtyrEezPuJ+JiTTPtFmuw1UJkfXEl4d3dyNWAvqe53y/aM7Hm8HVsb6EeT2Nf
	Qsj8inRnLdy3zDbFqDJXPwwxSuYnBYwotPzxYYhRbkD17jE74LGy58ZbzStnTf2b
	zs2zITOgA/wf77v5jg2HDSvRSXQkpBE1xEZ1xRAS2sg8HVYvrxBfqe3lpc2s7UWo
	evaz+es9hau3Vx6iIkAKLfoiE6zaORzWlm7vxrbSfjkpQgvbFW1YiT46DDXPP14k
	LcD4mg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr29kv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90c4e6517e9so69452036d6.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572501; x=1788177301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrSB/fAC0Fl9q+cTIg6QyU7PpT1fGiPMuMV14aKjxc4=;
        b=fd7eNtmrVQFCqfwCWDxI278tigG10uhP5Y0wVuc4kez33NK+FSUklY542eCfjR3BX/
         SAY+kRg8D9cogxfKW/7dfJfPD/JTZbntEH9vBBKB7Nklle92gsqpQkU8RAb5cP/IFAUx
         nISEGy+4AFt2awknoAWXMeEHism4PuNrsF3DVEf3f3LbLvJIvHoAM7lDXFF6Bq2Iqv5M
         cHrH6SBPnrvaWvfvWX0EkAPxTwXZA2/t9sXxU7xCuGqkyuvR8RL/9qs5uxzrq5A5kNun
         MYL3FQWpNeCI+FR90OvewxxVkf6ZVUaDhoh1K9aF/ipR4vlcNJw4ho/qx7bsNVMxQfI1
         48vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572501; x=1788177301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrSB/fAC0Fl9q+cTIg6QyU7PpT1fGiPMuMV14aKjxc4=;
        b=ajvuP3P/3xcoN9/m4CstJczNIY7llu/oUI5eBV9GmGvsaStWpRVV1rpqIb1+7hJase
         458umpMSvT+l/4cDhKjaI9XlOmvv0CG3Yk0AigPN4pxQ+uZ8Q+0e917YP+YH4iTtr1lD
         bFWH5usY6NokKzvpgKmD+nWk7Wg6Hh4EfPgeXl/h4KQId/AW8jri9tBCiGyxpfxnDvnT
         SnlmIC5Mt5UclMkoyzdpsrkI5hORvuWpRhbNbUjXdFxg+sG4jNcTFUAcO5mUXCaJLE0x
         m8iDdLBw9wyG0/2mAE5W+dUEk5j99vk3oXIgUnY5QHB2OrOgqAL1RDGZ+zC3cJaBTDsp
         M89g==
X-Forwarded-Encrypted: i=1; AHgh+RrQEDzsZogP0isWKJxDNj9OsM3tRda2NEPtFGxqMcl+7ldX4QvoNLQ2F84JNeuM6UBHJ/weKqI9Etg=@vger.kernel.org
X-Gm-Message-State: AFuF++msIHn6aLQAY3xg4qb3c+VFUYQTx+isY8aNvzckGx6Nde1u0YPd
	AZnWwy5nC7YfTUsSWu5NnHvnywR3c0ldio6YV5yJ+34XmPP0/IEI//p7uO2hNWb2z4p5z3DO4m5
	ZZMMUwpVMvKdHGGxI/J1oS5HjEBr2Ecfd5SdhGZmLnukbgNcmR2limCx1DL8ibcE=
X-Gm-Gg: AR+sD11kXKEthnTN57YuE5vMzz+2DcoTVpA6ROZEEmhCTyosVorqjGdpOXyILjQY+3J
	JVd9071X5UHubNUop8JSPvkURTcJUAQDzp2YbdEQuUB6ZszDew9GbU6VCO+FDQ3PsR2B8X58XMC
	zpIA+i4JMxnMfwJ4O8b0JFKR83XLaDf7k0cf09iw7TvBtEi8H0ppM4TFC9ANZmEAZHzWH01o2XI
	HOCg8FnZjqYCQudlXEvJ0hKigEjOCnO9T60XTOsxwEwfjGxJfNWrvn2W+5zg7ep2p6IMqV2SG1Y
	6owmUsy6PoJZDUCoeih0Q+eKeEna9cvQpX2styGStnTz/tEh3BC2T3d3deBObBnCgLR84zIIN7n
	kV6m8VxYH
X-Received: by 2002:a05:622a:314:b0:51c:981:94a6 with SMTP id d75a77b69052e-52e09cabcedmr173157011cf.23.1787572500622;
        Mon, 24 Aug 2026 04:55:00 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:51c:981:94a6 with SMTP id d75a77b69052e-52e09cabcedmr173156541cf.23.1787572500118;
        Mon, 24 Aug 2026 04:55:00 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:54:59 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:52 +0300
Subject: [PATCH v3 05/47] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-5-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1706;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yHkArQEhwJqq85ZOnDKd0QXWMauHDprOTAf3+s0+ug4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDaVsHMUtSwLOrfAcpVYNRmFLpGyrR+vGMQt
 YaavLm8ZTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww2gAKCRAbX0TJAJUV
 VqYsEACXZWZMSpE/Z1V497gTDxZAB5/SgcJX5hR71gPfsuhjwA5bqvw0DrXSKpbZBqTE1Ro3myK
 KraIwUZtRY/5K33A7HoEG8RMnAWnau8nb9Gw/cg0vR3S2mt2G4WOiWzfjWj06ZmseCHXRxpDRec
 hFfpLob+v7G67rqFXJ/hTBagz9+B6aNYdO5gajnAD2DDjzUxDGcpshAihHBltZXWE7NIMSilDhk
 AdgI/x0tTRtYezLBFvPL0tfcFjNh1dQqUZetX9ys9wWr8EuJ09TPBi5h0HUAOS3LjTusW/UHE95
 FfiDDanqB24ambq2d82mOTOVgYLIUTEhksX6XaByvAdv53w70AJN5R/133x/aGFtsJVz4i3f5SL
 rHkTw3V7U2J2Q1r/cVO6Y5zkwUPlSBxblOdFkdbvxgNq++7jD6DcuemU/6BCo95AxLTpsncJqi6
 2IWPHPyftrG/3+Pl+13Q6o6HVYEf4ZKA7ckE4LgfVquCNhRhMxiX+WbsphK3YxHV/gK2DBBzjtU
 r427B9vE4zqmoJJjarfeTyNer+iQNtVYuyMfDaAggiM2NduXfKLvY5w75R43Dg8bLgeZb2s0P1n
 Xl/KKE7+lRx+0qe48dGQ6sIqk/WGmztDsfAny3FrrlP4l3ifn+7YrY+nDUseICPMxNao/Hx8nYi
 F4cJIqRxe+8hpgg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX3sFqWmGLdWZQ
 stI2d1Oi+89V1Pwp1tx7DM7uQiLKXx2fI8ET6Mk1teTnQmPzPSABg2Ia2dTizZjBPrUt+YG2sy8
 5A00Bzu9hI+GfMN/cyUUpStz/07npYJkTn+dwggYN21vU6Xpb2uN44e6TOtQk7iRiHq87C7+s2c
 07ws0tTZvvGsUN5GlelUfFvXf+l26OqekM2llDG7PYVSXICE2E2V2jKTwmvbnZOgYBYWByc8npC
 0Rt6b8z/Vs/rU6yWruvtYELA3ienew276+LOtDVhPZTRJquQWMmZ96ls3dK1BGsFA4oBzfYpzZ2
 o+ggp/3ZYnqG/93zzLMdBfysixIqlb9yu8NfrikfZ3xgRHvvBucsiUu3QLKxFV16pvvz30PTIPc
 XlWX5+MrxmBBFLa8tp71zQ/+X+hMkLMFTNomrHjoSBu3SdImCDX+KWpJwGduILtniZdAl1EKD6W
 DodCfZrPjpexufg1FRA==
X-Proofpoint-GUID: V33L6AHYtzXk2rgeP7dP1YHf5bP5nR5J
X-Proofpoint-ORIG-GUID: V33L6AHYtzXk2rgeP7dP1YHf5bP5nR5J
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+HDKpgAfH46e
 58em3lqr9T+zNp/2gvit8bRrrt/HbiImQDluqy6hz+Cndr50hXCW7rh3wRZho8X47b5Toq9UtcC
 F33y7KVHoCSRbBuMN+Li35LwNNPM8EI=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c3115 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

The GDSCs provided by the SM8450 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..f6f73db26896 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,16 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -61,11 +67,13 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8450";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

