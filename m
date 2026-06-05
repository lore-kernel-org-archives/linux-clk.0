Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B561A4D8DA3
	for <linux-clk@vger.kernel.org>; Fri,  5 Jun 2026 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658853; cv=none; b=UKc0f3Fs5SDiTfdGpp0P0HHrZ7fBOmhGMbjqaFCOw/KUVuQze+h7bAJQNni0PCcV/PWbpIxUKkBqbcuRCnlupEybFUbWcWmCmK0LuIXb8GyJvLvTtwRIG+OTGomcJ3iDJ8mf+MMHOi4J7Byov4/5BnqR6UL5UXahvDbbEB+ilcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658853; c=relaxed/simple;
	bh=lmfeiGbBwsnfJMh3zPZRyUz9zunZPCI0u2KmSaIagaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCdd79jyBeEhOLOPu8D6+xIEwkY0rRA+/sc907AMMDfFU0+e+aYh928Rv51nLeT1T/u3oY1SbE6WccEIk8b7J5WKfPWNkk6yj8VA+QsKEZvFs5HpPW27hCX+zPxQUXeesir2WEWnO6g5CEwJuxFpEvWzYIHnf6M/BNKMN2V07l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIyjm4vR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KOQID9Ml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIyjm4vR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KOQID9Ml"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6558jk2f3604151
	for <linux-clk@vger.kernel.org>; Fri, 5 Jun 2026 11:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=; b=fIyjm4vRpixDD/H5
	lB+CnP6tPU0SNJdDqrcDm3kpWb3iZrK5I4ZuFpVWyqTwVasp8ZjxENnDIdpsH1yU
	3o+tV+iQwKNteaqVmWIwrNmV3KL5jX2ryruEDZGZk9NqYe+EvlibksWRv2GV4a5m
	2FwzKhnnSayLoJVdlRG45h40tqH5MRypBR5h5XG+kUX51/733KURmziNQALVzJBn
	RTCgt4ej6IVZ3WG/KmoBz63V7b1+wYeUT+Y872sinz6TTuEcKP4aOj49kriTUzPN
	la6vgEpW5ek7c+D9bkCUKcy7du3s/t4GpkwZOMLmDvHukKc4m99KEtZScTP1OPyn
	DekMyA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekmhfa4j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 11:27:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84245e2bb00so1568270b3a.1
        for <linux-clk@vger.kernel.org>; Fri, 05 Jun 2026 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658851; x=1781263651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=;
        b=KOQID9MlVc5NNK9sDa3mINckNA7XBJANlYDEgWo6teG/tnpGxbuWpBX2hkm39RAaoi
         PrzUbZL7T3U4EImQiKvIx90JJHd+K1plpJn6HJSqWoDE8hYAb5HSGYwr1H3KKPKWTRDB
         l4woSsrFblORhyMu630U8MeXDv6A4ckSqXQBnKxeTRVPNlQok/KJMjW6RATeOTmMci0/
         tye/yT4RbvMPzaUEVLM796LQ/MX7mEL++9FfWaUs6sGnUU+ipohNVMMYcA0gdw9kiIrE
         tDC7rVXmeyAw7wGdV4lSGYz1DDdAXXV8boEK7PYze8ybQuuDoSMtFVXkprJZM90Mk7c3
         wcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658851; x=1781263651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuQSme0tgRnnQzNC5GBm93XqdONWTCxLQ6Pr7EhX+aU=;
        b=pLTZJ4yL5GfbusB27T20G4UEUXv3WXpqrE8sQQPBl0YWxjSjQAZgfLrGt0TtMTlXhk
         CVGC+7ru4snVEPQGsGR9WiB5aJ7Qao09XU2MPc+0WkL0v5gk8ZyxfBH0/VlQNYRNDuGx
         EKX8OIwMHwS0GddAzI0tmIrTjtKf6D28Rww4r+xjBNwJELaPcs6CZn55D1U+HAXvrGEH
         9l446zkMnDFrTkI26nqf/WZJ6WyFBB6Y8yaJFK6YZyLIlaIeTwtR2mU28RCHix2HwuI8
         pW+McozMH7baCcu5uOcCbpcCzzN1sB10YSZs0KMNUaBKe1Y9NVcejmYFg+xl9xpnFX7A
         udTA==
X-Forwarded-Encrypted: i=1; AFNElJ8GhLnpIgZBmyi2WE3qv33DGI7gBuO0SF0uewJ8LqKWwug0WRM45hvtmzPs72mCGXRW24I2vvYyNh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLbGTSFzNgr6MGTP2mJ4jHydBK2l6V7HHEU5nzNu4uH/2lMOrN
	M7We58VnF3YQp0BJOrh7Cnl8YCGlyRkXAjmUdTmIwEyBgzMf7danfi6j+ZjyfgJ748KNvHuWI2y
	lkQ5IXu9DqN2cUyeg7lzwuwLXeEL46Gpl7Zmru+l1rQFgueH9QUpwWD31yztVQlI=
X-Gm-Gg: Acq92OHACEni2YzsB5ZhnCzNn2nI8z6RSm/WLx8fCD848w2xbVKJB9YeQ9WKFyWSE37
	SvPhlXdAtjdi4P1XZovj2/SF1Hckl0m9xxVyE6BCJto+FbBpvYFzPPRXVwhpPRsqnCrGuT7sIwc
	2uaMIAsuKYYz0fRPWbnArZwWVsGxc+MEMEFBphspRn5fB2CTxwlHwpd+OGC14ZaINqOKHHqtrhx
	AWZ4Ke+HkN2Lvu1jqkQ83PbJt7ztawEOnmLiZ9Bxc/dfgnS/BwysznajNR/Az/OlPZ9hra9dv8H
	LnLpeDmTyJTIx3iqlKKdyCtWRFldeCuVHGePhiMRXQWcKdTrqe2Qi1cJL7Rt0XEM2q4GmzK8sq5
	TUB7X1jYG1SLxa/b3eAZiQvPk1p79ECpY07DxLL/ICRrZAdgqqwhOhvtPE+UdNNQ=
X-Received: by 2002:a05:6a00:b807:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-842b0e1cee2mr3086271b3a.9.1780658851499;
        Fri, 05 Jun 2026 04:27:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:b807:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-842b0e1cee2mr3086224b3a.9.1780658851017;
        Fri, 05 Jun 2026 04:27:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 05 Jun 2026 16:56:33 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-shikra-audiocorecc-v1-4-7ee6b5f2d928@oss.qualcomm.com>
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfXy9a6zqH0QcN6
 /naCxSeau8maT5eWTJ8Of7AWsZvvPJKrVA++gRVYYpg1zM74msH36TwYQ9YfcpyUAS4cF6nbhRz
 tJaEjPIDoXGOx2GNEAdWjP+ZYlibeDOhBAZkmpnPIQyuKAPEbA77rioM1prfPrswWsOqAb912EU
 NY7OBZdOu87nOZ0J2XGRFHHIFp7azmmIfjBaWA026TtrG8YS+TMKAws4BFvMvR//BAHzLnXyzGO
 YQ6ko0k5dHpoXkjkQve+i6NLgSDbb1b/UCXGYjMAEWD9/1FLvnxejraSHYLquYku604MRguf0GO
 w1EXXJdq+SsXqNtUGF4TcG4or9ehPk8QhLOsMSQEZskUfhFZRts8JAVizA6m7VondgoaHc/P5LO
 /7rEvrYnV2ernFZlRgEpMSaqFUw7cRUwxO0wTL2bDpu/VhYYQwiOl3GVIsIrs/mFstmqFtQpBLX
 a1JINt2Z+lQreWQTI2Q==
X-Proofpoint-ORIG-GUID: tI67kHltelhxs0_pZSmuyIDddoIBVj6k
X-Authority-Analysis: v=2.4 cv=dfmwG3Xe c=1 sm=1 tr=0 ts=6a22b2a4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rDU0rDU2gfLWSAyRyQ0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tI67kHltelhxs0_pZSmuyIDddoIBVj6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111

Add support for Audio Core Clock Controller (AudioCoreCC) node on Qualcomm
Shikra SoC. The CQM variant requires both clock and reset support, while
the CQS variant requires only reset support. Update the respective device
tree variants to enable and override the node as per variant requirements.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  5 +++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 13 +++++++++++++
 3 files changed, 22 insertions(+)

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
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..b5e3d573868a836ad5e5e8eb3024cb5fb71dbb4e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,11 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	compatible = "qcom,shikra-cqs-audiocorecc";
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f15757d52af04d8cb5540354a239127cb0d174a3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,18 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-cqm-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>,
+			      <0x0 0x0a0b4000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

