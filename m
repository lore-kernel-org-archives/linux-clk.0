Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4146E4307A9
	for <linux-clk@vger.kernel.org>; Wed,  8 Jul 2026 18:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535148; cv=none; b=FOfheSw4wOdVRkzmBHAoRseCDQlThc1YffEyEL+IggYBfY/PYwVJ0lfsSjA2lHbihjLYKP0PDXdSL0S31TLOjSoBEvOQpEKzhHZF3C9f52niJm+jOX5/p/u7thvFwvPHJgOc7xyOySHs8w1gjzYcYCOTWsb3tZRgiYWDbBrYLJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535148; c=relaxed/simple;
	bh=3K6L4c6OZp3Eul3Ri9W31RQJgrKQhggB3UWIGCxKmz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBRGOuGfrufxC9iIC2ds2eBF0qEzUzYboBp56Xc0q1YDHv20imUXiMpE9HY3IZkSE08+MwiRh/53TxxGnkOGqPhDyfXYbgyauhwqzfLRQJ4yKpogbruR1Nnhw4Qyb8G/izIoOKnB3TadEK+zzvJS3UwYicjIeicmL0mNR5+EzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i37blsxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVNVHskQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i37blsxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AVNVHskQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GKxcB3304124
	for <linux-clk@vger.kernel.org>; Wed, 8 Jul 2026 18:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=; b=i37blsxSEiIOBQl0
	o3rlLfUvYnTwH9VGRR4PxuJM5kdFFj9+JwdPns6MvYl/HTcR8VAoP8MMLSoSgUE2
	VPY/V1K6h++w7UVd6Bk4Y3RduBslVac9KTJTy7E8y65drVwgMvnYVTCKNQnXkxRx
	9a6DUCqeD57We9+EM+VL0PeYVctnZVUOtpnLi905uR1zfvLGQVKvEdM8E3FKLhSf
	haZkXg66CC7easFoXsGHG7mAPwYUDbPNR9CdUn2x4+iuc7EomVOdnwscKjYVZoCr
	+WsnU1oWyxwszDGb27DxW0uOVAmOMT9iOXM1Ed9KXyvLsOONXOdpl6OHNPGKmWPe
	AdPH7w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq30xgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 18:25:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so131367a12.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jul 2026 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535145; x=1784139945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=;
        b=AVNVHskQwIR3pR0CvpcOhx513VVmDNXj7qQiBLvMXTDhdqA+KNhethIl5ia22FLJ3Y
         iqFrYjAfmBSAj0bnpPWWEnVwNyFqObauifTMQ4S5wzJMAnwHrX8CZWxjhuuharngTXyJ
         J8E7tG92L5Gys3GziKdVlsdfJWGtvcxgKs971Dfze1stkDlFa/miSjI2gQfqH9wE6tfD
         E5ZwGivWMua8kkyVTcw6PUVO7wfQlsDjyN+Ud7pD7RkKa+v3r/xC763Twhjvbw7/NXzw
         jtgc6MG9zFlG9mFjQh5zli4As7SwbgLXSBSustGT6NCPVSFRpAQm+8yCMyBCWbKoyCxs
         uOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535145; x=1784139945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=;
        b=PL8p+7PB1DTokrNPj8/Mn9fGb+HQDmO0Q28Xh/wsO/nnDwqpbYu9+olkCSvdbuzY5l
         DtK3Ic1Ra04T/mYS0F6QF8425twdDscx0wICDR8Hv+cVScaHImaN4L92gfmtQGsE4z9T
         gE5/7tSNwtULIDuqKthT35Va6GGmja5fcInVh6M+4+8uRw0lFBbbwfq3jA0d4SSyoIXc
         BajzQT3TXPA4HcJwE69SRMs63a6N4aLS4qHCz/0NIRtrWZnVSf1Mr6x/hwp5DJZhmKQl
         jCG9Cx9+r8svumalD+m1FWughU1qOIXxZfD1CEN6i1+QmBUxk24Fktl6AV2tLu+NNADE
         Y1gw==
X-Forwarded-Encrypted: i=1; AHgh+RrtEIv9Flq71fl8Mpr627Hf4DiCyg/Zk6hXBS8jC1WPco85EmSDb0yXV60fnr8jFQ71WwEYEr8Do0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJhk0dDSK0HUa12WYv+eijsOX8MOV8q0v+HtqU5Ts1drSp0Zy
	YlSbdG9eK1ZtoXXgFfMcnJbLGbYUVC/CmMe3YiW1BHz/jEJ9qpMBnamadhoskCX8pgBuUeSOG5F
	nFYgUnJQMwJ1+V3Ibx26w12ZlFzVQSxxAPHoEUzf8FiLYE8R6NyHepAUZ3MoOvYI=
X-Gm-Gg: AfdE7ckoEnyao31kmUnDutzVReA7Nq9KpmI6F0K+hkuYCWBSatH2foIwA9xoFTDQ+qa
	Vo0QNoyuh7lVCEaMU4kLuLrSPkSNnb8FZB06Vxm8wkPgqf9pJohIMC+0Go1SX9eIjTVrvaaCs2N
	BgXY8GSSH1zlu7S/CYGq018W/STlmWRCa3yqiMse+5d/N3CnxqOETb2quJ4mhcO2Wn+Iiu7Zuxu
	5OYd5KZN2prq6iLnOdTBpa9XyfvfnSadTKJL+iGeoRPVPdib4FtHeGibwy1ro3ikSKBknl8LfeM
	LPOpCjhMGtv4q04T8dqPJkooXjGCEQL7JvL+2BjNLKuohS/y00KmIQdYK5C8Gkj0e6egGfXafP6
	TI8YyLTU4ZALZTfBtShLJyRcrh3NvTVTg6Lv+/JYOmA==
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr4158485637.56.1783535145402;
        Wed, 08 Jul 2026 11:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr4158449637.56.1783535144873;
        Wed, 08 Jul 2026 11:25:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:08 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YlPaJTM-04Uur8qz_8F1r48uD4w3_smK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX+9xwTb98k4Iz
 PBh5RnhcbEmwV7jwFG2Qe5EVjz1ruTeCP8ff1oFmeT/gX5xqOvDVWoOORt3jmTH9DD0fUyVSbm6
 IIZeaeBU6lSFAkGHvKwVi1eV3ozRyKKuYImMfzB9cCvUeLO/oOVtspykaHxTASQb6HfN+SIcIjQ
 rkwuHMKYsNmLPKqVstA2Q8fr0Zs3DV9VrmTbbuUVeX484WvbbMcleGsVk22/owIUqQDbGIPN7+L
 UJSQT9+F+GICbbFdo8YFfLWMWpQOF3kPKBEqd6KxlTMlMVy43IFDfum9yvd6JxeqiFdxUq/rFYd
 jhKUnxRa/84LuheAOhZ+yOxnUH/h39uuPae/hN1UdeYeez5+1Z2DvHLjY9muNgDO/Jx4d8BfOhe
 fEbGRuxVAco/4/1w5qsf/VYVqVZpADcTmSbi4b/WxXaJ7pcLpmLlGnDOfpKN5ayV9pifKPlkxqM
 nKnDAvXM+hBuOPk3Big==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXxbwz+b0ZHaxP
 1cKAWegndctvPkhMDGeoJ5xgkuCqSeK6qxRFmaTWza8X4SW99RGn/w4ggzmfaHvfbYz+wV3CjBL
 +mu0m4yoJJHJEiZr9DAJ3OhGyLUm3lo=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4e962a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: YlPaJTM-04Uur8qz_8F1r48uD4w3_smK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080180

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
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..2d56182a6aeb3c36f525fc32dba7fbcd75103984 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
+&audiocore_csr {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..46e1d8b718af30c095b2535eb4f7fa6e60157c2b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocore_csr {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..c008a836251fcf96e8376bfd3fc17ee994e7250f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,23 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

