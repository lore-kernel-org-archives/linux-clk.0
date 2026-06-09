Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BFD43E9E0
	for <linux-clk@vger.kernel.org>; Tue,  9 Jun 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017439; cv=none; b=NMpfwNkmbkZkFvs2OkptMaDYO+lwhKFvDDpQVyGE3GRpk4lKCzkE5M8XheaDDJjTba9d8IxRAabW2ctbyqouVwl8OFrv/iQi6foU6WdmrBcVImkQNWke2SD/BZBzadTMGHhs5gm3DppMuUooko+0pNoLHssQ5Ob00byDV6ZZsyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017439; c=relaxed/simple;
	bh=PCD+i7SHH1Q3aqP1kDg+0xqXQ0lxVY9bSo+70E9HpZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pZ/5wlrnGsg1EY/uI2ZUceqTLzyBxtrnDXNHte0UEuePAwoA+9tcNg0TEe0H8SNSz+oOgtrejNJAKojRUo0v0Cfw/5xTAG+RMbMkwTUxop1iw/FzlcVyNqoyKhff6qtw2moegjEj4dZbOKP4K3dVqHGp8axVz3JZhhV5ECvycVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljIyuDQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NOx0zkb6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljIyuDQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NOx0zkb6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaKs2247959
	for <linux-clk@vger.kernel.org>; Tue, 9 Jun 2026 15:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=; b=ljIyuDQk9FzaHl6O
	K7gOjQJNj8g4pkgmE2oy+jqjEeOF0kZt1kA7vjugP+XWDux6tWhxK6opWPLIHSDn
	8RPotDBHnJb5W7qNQo6AhyajCSqfcVRB0rweuVrqWE2hDtMUKSCq2LojZ69k8dxW
	PrTVbzlHgs9LD+JAiymYgliKxm1sDkj1VtIQx0yAqgpy1EyIEm8//CF+mwGVdeGC
	C9j4zEuGr4tJT2eYcL1aQhN8rOmDf6+p3hFFqkOovLVB67Pvmj84i4RPUi0oXaKw
	7+BQE+2PagrtuI8nwmPh756efZaRMTiBUKxBDKkvcrMzr1jzyLLSUJj3FaW4JQ9R
	rg0BoA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeetds5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 15:03:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bb6c41341so6287818a91.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jun 2026 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781017437; x=1781622237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=NOx0zkb6uxbE55uzf56vfhHB/WeVAQUogYjZ905C+SjcZNQIAmma3kWvaeyZ0LvG3F
         hLFvPEn1RYMLLPOOUxeE3G2awi3AVm/Whrxx22ERIbbxEbOunYeud88qv+0BKs+bjmBR
         Bvh235XY2M1piKToxjfQRX2mkBrUyge3Pc2gb1ZLG6Z0RZnEUUNNfSVh0f6wRYtQG1go
         bypwHGLxcTEWPihFrxesjajVvrPxHJnEUblSuQBp7CZyWHuK1mQbb1dW03d76oYhGO7p
         /EEtgLvu4dVQCBE9XqMPD2Uthx92MsN3yZXkxUcmJpKxWgRbsUDwVJmMe+/ZIcZdEVrc
         isHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017437; x=1781622237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJceXiho06Og9O7kMeh7deoGHJJPmRDg1rHXj5YMqGU=;
        b=mQnqwHMVVfgA/jeXGYtvPK63dKJLE/ebaK+MSu/8z2/VXhezY0vhYq9WkIa83rix1E
         utaa9RiHBiElgWU6saXId0IAos29eTcDRpMS/zESxGEduZ+beVRUDpZ5yhdPMIX4cluh
         02K++hCFWhVNaCKtXfPN3zkeDoN4AclKXcgvc88ATxd8FYorwNt1gIO/8cW9Pn8RdKP1
         Bwhe//eksz9Us/pMfCup9BwCN+gY6ahdzcvyvHCiKydfKpLaqtYGaecHXbv5f3h1MOYF
         ELX/V8cb6GVqku/A1hCOY4K5x6VWsoDakywQY2699ppw1+lIhU5Q1OuICrFJ9gkHyvp3
         yTFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hfscUmKhoRk9rno6B0RVZpqpVHB38LDGubwN1znPwfVGKEoNZ/VzOn7TfOvxwH8/5aPa2WYvfaRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSIJpNMQtv+und7/tY2zdXx3e+jVlNeif0mgQ8aHJD2kNHng4r
	LocM75r4Hr3GyaRH/nwEU7ZR7vND1YswtKJfzrVlCv9x4aSqPg6CKMeUm/+raThsuLFv4lzQgb3
	hzh1aexuRcoybDOlwpkeDU2euzuG6ZjAhRBXvIZcmKo0upgq4eM5tX7oBOVlGQ4U=
X-Gm-Gg: Acq92OGRa46TyA5EtT/xnKLMz5BF83jvEx1f7Q0k8KT0GkL8B/NiJlIYeJ+BwRtINYo
	hwVGD2zUWpFl0d1t/2z5fTGJKBucxoyX5z53wQykWzwhn16nU89JNViJvO9P5TmTAWiMLbseCXA
	o20zctvKxAUeF1N+yLHL6ehIBQrrQzneDijkF7K4T5WwIoJ3jWwHCW57lFPoTv6qCydufFD93gl
	NkGWWL8nQt/M38Vrnh96mmhYT7jPAoWNQcgODZ4x2uR131PUX8jn8bhy7BmutbrkujttsSaYtGq
	UjNTM6Kh4LZ94xZ9NZQRZlOO59OsrdCJ8iy7RVi/oWeMCS0LYwy03zFunokDmKY+BIuftpf7qD7
	1WmycnURg9ywRg+GuoMd5qmflyqwpIuijqc8Q5e6QID+FGd1vQNqXHz2s
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138410a91.19.1781017436513;
        Tue, 09 Jun 2026 08:03:56 -0700 (PDT)
X-Received: by 2002:a17:90b:394e:b0:36a:aeaf:ab2a with SMTP id 98e67ed59e1d1-370f0d4c33emr26138338a91.19.1781017435965;
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm26987659b3a.44.2026.06.09.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:03:55 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 20:32:58 +0530
Subject: [PATCH v6 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-b4-eliza_mm_cc_v6-v6-7-17df09e5940c@oss.qualcomm.com>
References: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
In-Reply-To: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a282b5d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QpH9IB84JAnPMoRP7PIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0MyBTYWx0ZWRfX0yCl0Gvwk24u
 PaaI60x9h9i0dDVq5PFIVntiuAtgBy3ND7AaIZPiiZ8X8ZS2zhbpWnFQy9D12kEBCrwnW+vYIVQ
 JCmkov4Gh5SgIs1l1QfeqzeWRqWXrFXlbVochtOF+SOwbHlMWTgSEGtaVzMrEEiqBAI4131S3s6
 kjrbceSZvDovEBYxn5DKeu+EiBPh2tevs5wCn16yCBv3F0pSnlioD4B1XBv/RaDf7/zS+lO2ijU
 vl0s3kuXDemENc1jth6YSd5ute48ilzYd23ND8MA7nFaP79eUHFktQ2j/45jH0Y7iArwWzowXbN
 LIBAf8t4aSY6binznmDtD340Ih3xppEHBNNSghwM4jwuK5bJKgGAy5MiSVcLcb+F5KHGK32Ecmp
 s4CuIvUsJ5gNu0HSFi3KNn4CQkh2hWke8nRc22q0+3wwbK0B/dfsFPFEy91cyQ8q84o0Ga7aNWW
 1R1gJjzepf+j3/glq5Q==
X-Proofpoint-ORIG-GUID: 9BKxuYKCcgrIxhlJDdz3a1o5p64l_5Q8
X-Proofpoint-GUID: 9BKxuYKCcgrIxhlJDdz3a1o5p64l_5Q8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090143

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 977de44b816e4295dba89ecb77c6df60f6f08d15..c5635f22e2a7a68fe665a5b5236901b17de6983d 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -4,9 +4,13 @@
  */
 
 #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-dispcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -1779,6 +1783,19 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -2657,6 +2674,50 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,eliza-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

