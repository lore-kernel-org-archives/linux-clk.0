Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BC147A884
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821597; cv=none; b=c+M02ZPKiPp7/YK2zD3QorHOEBmaj5TTDg/nvuzkhQ1gLejLtHr71hwHUuYiPZzqNdiAGfKFWsxfyizZH04o6+5sZ6jQ6Ly9q6EswAA9116u2NtaTO0qG4C1clI3XOoKY1piX8GhZ4FSaWRUoLFPiw+REDNhiuN8mO+hJymV0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821597; c=relaxed/simple;
	bh=Lj4xwrzjhO1VDsmaGyHqoFbFhk83L/Zj8o9GcN8g5AU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VstFRbQ6ENf6eUjbv/f4t02u0B0yoSKk8H/zQGL5c4jbUDzoUnSJOrM0+U56ytp56J/t15nqhxoFh0LVUWMWSdDvfZCdAVCVqxoy65hbDMSYKl+iPBfQiudrktu7W24OtriXpA/VbPIr5sSc7JouJKRWck47W6kJWmAwhGGkZZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ougav5BW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2BUxwNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ougav5BW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2BUxwNa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvTAP3819780
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=; b=Ougav5BWNpk2hGag
	wjso7eS+7F76gaqxYYWMIufEFSSEwXZy6fVgT2UbcBp510gpl8oqvfPlA1QeglZu
	CaprEh0HKYG4j6KvjOV02oFn60DSppqiYvnqilSDMs0NS/CBvCGS9pZXHUE6W+0u
	hcwO92kIXS6xebq//jYA2wrQW/V+b+kIbJZMH2r/3pmIbEuQ0TsWeV7WbC+AjgAR
	z7cWAxW7OHaw0VjfebwhI5QJPDOeMZQTzgUK0zQTEyfTWLGq5aEvnzPGrIpfBcoC
	v1Y6gEDvsmFj4yLxS9Pe9uwFloTuUXjTWQB9G5hUlVjs2BsZSjPv5E/FL7XTFs6v
	61utWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw357a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 15:46:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso8515305ad.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821589; x=1785426389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=;
        b=K2BUxwNaiNSLRTQz4Gj+vLf/4pZzB6kPdXNJ+WihpAOu68oDpOSngQybPLwvuuDgqD
         R5FMlzhabMugkPDlcmn2o0rRXnzocQocgkTqSImEUhRyIj0P9srOFrpxRd4Pe3XTIjYm
         yeR4bTfTmeQu7prwDajpjuZGgZKckpEq2QoJuac66k9aiyNnyOb4dp4xPRNjFcaH/iXq
         3iMJGe6oE8iZmkucLVhAvI+isVofgoHr6j8pMlbcK0gQnOK7qKEkLAzHLy1NWDsKQBNa
         F7xTYZY4wgnWx8fpWltMtQBpmZdXuvHgXzB1RzvbeUGFh2Ry/p2pIotd0RHE1mJ763nW
         vuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821589; x=1785426389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETmhb4fSMfqSjG+CRnB5cvktEsrUC+oPkuF61xzIYw4=;
        b=Uit3WR9ZPxqya3Z9ldrnnxJnUI9bk92L4Fyb8KcjV++KrNfOTLeEwZDDVB7zL+UAnk
         R85cLw85Gqkvp57d9vnQ2Qp+YY+RUJrj3HC9Vt1DItSbQWGdAoBxGYxiJ18lMgd8jwTj
         v5YD9yTboYY93/uWwg5ovBiNI+45nhEwnShOzgGK4uGIAvnw0ADJ7aMR/nVdP4e2LA0y
         jvpdIgQ7aOrb2RXm7R8c240Tkzuf7jKt25oI+1Rbw/xy3tIiDHvOF27pvcJFMlbVw1Dp
         bakBXtqnr6tppHbo8oHSAgiI2/sSXxfoiCkPP9LOjU7BoVnuGN2ocXQK/hqAqoXRTUl2
         0tEA==
X-Forwarded-Encrypted: i=1; AHgh+RoekvYPpT05XWOEUHz6BfUFBfKsRSEUHOMHJtrA97GaTqqelWAkUwrCOvwaAKz1Hp0E31vWpwJcBwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE3vY/LXc7LMcbxcJLBlUwnpp33ylr/VvqUMkmJMUfwQTYrRGy
	Q+rVr1x01fu+s7l7ZdWo7vPJrzpym5Tkj51pwRWcQx1SgeOiWDM+2M7QB9SD9I1mD4ObnC7cevL
	BB1n0VrFThsBTljzpwiuk3hjBB1g2/+xwKrfsL7jMHbZpBTwAfsB0cVs46bu2qWk=
X-Gm-Gg: AR+sD12HEloeTar1OWWWij4GuBiYj1hbDu2KTsOs7Q9i1G6pDy6khUvSh5pAAEprKl8
	5Hr4rVNWZMrM5WmDnL0cXCe2hXV9Jlza0vy8qGvimzSlovgWQII+23xguW85oNYW6l/h0RJ9jXN
	LzBzXoEkNlhebN8+NTfgt8AD1vRZk8ENuN/T9SPhlxuW9oj3V+HwajEVxfv3ma4uWuSsQez1HL7
	iK8xtN0yPNKZ3e31uXFVP0Q/pGFmSDdnWAQvRJQEqInf1CJVjo6C2RZco/d6hqdSXz8BSguUw/l
	4bkTqYlgbOQqygky6RJUT1IdKTchyUc4/o1JKrefnGfDs4L8pQdw39w6nyGvvo7Kj/7JE4y8zN1
	sCn+vBGxwtsqNd76GXTZJsF85RZL0C2s=
X-Received: by 2002:a17:903:3c4d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cfa947647fmr36538695ad.7.1784821588540;
        Thu, 23 Jul 2026 08:46:28 -0700 (PDT)
X-Received: by 2002:a17:903:3c4d:b0:2c7:f5c6:c4a6 with SMTP id d9443c01a7336-2cfa947647fmr36538195ad.7.1784821588047;
        Thu, 23 Jul 2026 08:46:28 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:27 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:53 +0530
Subject: [PATCH v3 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-4-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a623755 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: rhz9CgsJsQ6IFxjgcUt1hs4joAqVm9vD
X-Proofpoint-GUID: rhz9CgsJsQ6IFxjgcUt1hs4joAqVm9vD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfXwg4OYFiMPmae
 0dgOl6gBZqdMVILZfitLP+AUkLjwUqA6/Fwvw4ny+mQtFj/ABAH1YYLwwXLDA2BdvN0cpu44Tux
 ppb+DAHFNHaqeik4sFJLU1Etqeg4Xvc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX7jaPHKIBvA7u
 vNPJxFbQvd/qkRhKYlLZFHJZGVQyLXmMaoaoVMREjA+ngGVnZPIBO0yr3BC6jQvqRViDj+zoong
 KPi0/tl/BnvPuxGjvgHI+dyhFlCoH2YYSHw76ZNmVFMwbnT+dm1G7LIWbj20OxnVJzbyrRzoa87
 jJP7r0uYvYFQrUmw+fBCHptOrNsITeV05mIhTWS4RKwTnquIshFmnvE5X3mIsCqrzwKuFZdvN69
 77Ew8cXuPpk375QzrRoZSAiKv8iWBzChXuQ4Rz1xGzaVSheaC+IkwWJQP4ayLkQj+4/14RpNos4
 4FJEprN06gBZTO1r6h17X9g2WU9dIeQT/7/ArctUXbh33qiL+DtDULoTI+icg1lRZT7CNg7aRiH
 lhQNBPAKSynGeSjiWeFxIs1M0uuhPPrZeP4qe/mYJPS0Qaq1btVS2KwiZ35fbpsxXf96B+Jh8t1
 9Ri0tgUiE6n+LiS1JRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..0883c480bfbc80d7bead966b9ba932dee8a77bbf 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b744534572d63349c4274ffbe5cacbb8fdb4197d 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,22 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "reserved"; /* Owned by Modem firmware */
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

