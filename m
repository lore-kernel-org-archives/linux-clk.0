Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC203CBE9C
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913369; cv=none; b=LFtiETuyU5khZudjacwNpyiZUQqe6No0pHra04f039CEoTxpmYnsxKut2aC7GKRwkBjRstiDYw+bHDQStvSAOcNTflYrONS/Le0j63EqeX3e52wpKrcF8VqY96fNbq71PhL5+zon8QOlPpzi74LQSXvzO+bX561oRmVTLjaTU0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913369; c=relaxed/simple;
	bh=O7qiwaryPlXurWIjq/udwHQ+dZxQnDOzL079xltsr/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srnovK+OJk0H4PEF0YzvMWCkRiLFkkYy/ZAVjls76BiA/SMZ7J0eR6zFBRGQQVa1nWvjlASUfv2jg74MpoWfQc+YDbunlKqkRBFfwZkUNVH2/vBkFCC/TTNBO0KU+zsq6F/zh/f7OJHG6Y9VZ3yhSEyprY94eLccbF0uoQH0aXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KV/J8ps0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OPgUWEkq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KV/J8ps0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OPgUWEkq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqTLr3154017
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 17:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=; b=KV/J8ps0zO4pQmgP
	zk23a7TOxo7tmzkoDTg1/val0c7mix7xoUD2t7dn3h6YH1as4RTWYxw+zABJ4c16
	Vb6rBmEazzxVnylduC3Gx0bLGRdUitIcOcopvNrGTLNRl7utw84IdXwraZOShobq
	OJPAOAbTNxXCzIJLSQDQauuWwF622rN40JgcGP13XZGA6cIGbzuRNiD+YVZatl90
	lYZK0P1HiqL0QceF7+8MACeQnrSxJaqEuxlQ178Fjp2FZZkCK0Te+SkQdU2pq2Ck
	Sf+pGSvW3+Vw1pJCpyFA3rFQMeoe2iaGfEFJMDS/AOAZCyHHWVTABMllXmTNC5Lp
	QBKuSQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggyme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 17:16:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1322377a91.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784913367; x=1785518167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=;
        b=OPgUWEkqIHjDICY027Fb48LUZWVMp2W0+5hY+acB5nwekFvmDyyS3OnVVltpGAGwe9
         Zes6kSOME6TFl/DzRaRSfLxX0Z1aSJYw6GmKEBSj9qIwpZoATQPhMgN6Bp1eEffCPSQM
         qkg0iYfW5zGsWbB/S+sjlVIbaVZxMauf+QCbPw18PG9qNxSTggEObK+G9t++a9HbPsGF
         5R2RHtmZ8uYEaMd/x0jyRdCcpeC3Tu/TRl50ggejFRd7x+AVDPP05ohfiRCkcf0JeA/W
         v4FIGgKIA8wEiDdBBMb8hTNfhrX5lT2jUGLMwIyHh2OOL0HvnL1jugwlTJQbcipvS+t3
         Oc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913367; x=1785518167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNmXDzaverxKdYg5q+nd9ERkwwkJAFG1IgfvwE1/7Us=;
        b=F+Yq7l+KNhJSWanw9lShgO2JRzfsazCo7e4ljYPB06ODkZp1un9thiCVcssMWSG0ry
         uXuuWgcuZUcHFq84qx7/BbfH25QhbGzK/HF9tE2nZPUlLDUWcOnLcKwXSQqmCDmeIbUy
         cdMvVGPHvWrJRcfR/wQKYydLYjHVxYaFBHZkdaS2r1u0wQ8n/bSLvfR6khuKIDk0SPS7
         CgW7WmvN+wmWKguIAlJZ2iKTdJ/yFQMM+wchOVBJF5FoKjWvt/iOAmtWx/AdrRTOzgdU
         elZfKXaS9TKwnyc1M3KUF68bceMrj4vUDqVjiwifLojuqQCxeuKYOVSRTHG/YxVPNx4o
         zIfw==
X-Forwarded-Encrypted: i=1; AHgh+Rqhlb3pgDRu4nOkcHGofV8wUJwkSSWYhzG1SeEBbIdBS1l5rGhPI0q0hbesPSUWGIQkAGjaw9B0088=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvbtpgNP4KxlWhfDyVNBWZp/W8ERMdgJ3kk6vpWtDePsIc3jU
	L2m4XU0rHm0+bGHxo24GxjlnuYdLqV2fsww8S3YN4lpw1eaKYe13hMKA52KnTbroFTHSlNYRcKN
	oWsza13AXZdU7zPV3vcSgb9mOqoJ7tvOd5MTSGpWRVxbCf8vNsp5tLxaJpI+P8w4=
X-Gm-Gg: AR+sD110WzP8/tZiLY1yFhq1PCOxFiiBRBEfU1+4XsaoT2nMbsdKSgnv1yT7ccvjVT9
	CiECrSDcQ3HGJmfUm63Rotteu4yu38j65FTRVhSnIKv0qLI34CZc72m/zmf0Xt9ouM1MsLLKhvc
	JM8PwE9uvPurWV7LV2erslyk7qkU3Ee6MceOt35N6bRE95WWBG7vIKiM0csHOd1cccPBI7JeJyC
	R+Bp5rg13uTRTd80ekSqq+/KFcXPCKlj0dCgkrGKRO087iGJLTtKLJ61l07X3pvMki6Nz7A82x2
	IBGPVMwsZeGbQQdiJOQUKfPp1XU3bgmtKwZmkr0knrN5wUt+nk0iEs+fm+0lrgpJgU/xo+gQ2mM
	I9bwIKM0iE9g9MYxlwAQM4qP1h/545QU=
X-Received: by 2002:a17:90b:3f48:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38ec6877190mr8420959a91.31.1784913366966;
        Fri, 24 Jul 2026 10:16:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3f48:b0:38e:2fa0:491b with SMTP id 98e67ed59e1d1-38ec6877190mr8420909a91.31.1784913366470;
        Fri, 24 Jul 2026 10:16:06 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm8400892c88.3.2026.07.24.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:16:05 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 22:45:34 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-shikra-audiocorecc-v4-3-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
In-Reply-To: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a639dd7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: m4mQOyWd1UPfzEbIzDyNAoZwRjxNy7jy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfXxUceN+GVi+np
 4ixr2JuBspYIq4kKBlcC5SFGHmx28MZPMgoppIgHLJCbzYyUBLCjh+5p1UDeHu3qx/XP23z5Hm3
 kqPErNbfKXqaL++zbzDqLKQjWxKR6/E=
X-Proofpoint-GUID: m4mQOyWd1UPfzEbIzDyNAoZwRjxNy7jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfX/fzkDzOElAqZ
 ABIra0JsoQjDCMg/alA2B1BzZlvpGSzVVTxFqVkQwEIEi+AsYXNBZatW6nK6juRab9LvE013Br7
 nIQyzuj4V0q2H4R4E2zeHIvRNznKiXfZ7itwdH+LNlnwdyTm0hMozwv+iWrv+tqhPrAyzcUTmwU
 KWQEQXYPpfdAivB1p8eazvc5G4+CRTilL4mP+VXG0sXU5a+z1OsALI3Y9mTdqSEHiEzKGAWPkJm
 k8HM3OMbO57qvOh93pW1G6B0nOIDFt4rTBH+x+J2i6i+g5wb2U5yiChimIblihllu3GOIAvahDU
 QjtL9tS9NGU2qGgS2K27b26DX+QHOMPmLarJynHiaP48QwGhcrxAGjV/MkuuAICNKRrVU+O1GPD
 DwnjtX8JaBKtdjSoPbFflbjq5eicD0sP8vJbl4DCNlef/0Z2MyNmN5LO4SpNbdPSPaMEFLrwHuf
 l387OEggdA0IurW0I5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240155

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

