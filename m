Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463575;
	b=svlvfZ0aKP2mtX1q84/4/pQ2Ox5vO9PTGg6UUlrBpVg3qKNYGfyItYS2Dg2y8tGraW3E
	 byPTLSEvChDBlvyrJ9eFLwLqcSrvYIiKoxxYC9m2FOO1yeyLstw09Na0c5XU1pL292g3v
	 MZwlBrkUok9Weyy8z1f0b0/E3SenTeRc5GiSxcLdguZ6/Rh5ZYG1r+g4/4gdby3xlc5kx
	 fnzDsCeEP0KBnlSgTvZl7ULtZzgldawVg2OLXAYRAoh5H8gUImz8K/SgxTKvqcY1PXH/0
	 HvvfMv1umrvR4VoonDXD3IUtVlpCOzOG1TlKzC6jrTfZwThqNK/PCaxk6kyaxpXZmKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
	b=Nkf2EBR6FLlfJO5v4NaVH23O/QYP1HyrOQNSSaEEoCl8l9cgWl+rl22X2qcCzfXN0SmY
	 d3is+SJhiIu0JNT3iHuQ7SSMaw1B2vSCtv0VkFUQVReyQ8pQyWmUpoFCwQ0qaK9QfGe+w
	 qIabPjtOOnPyC6ISwebo/G1hplTspbJd9dwPHJBJ8bnOORnOfvfRniQjxvNIv5IP/TvFI
	 oF5ZTnzYNWS7liKb4VqnVrXEfixM560y3epBcqJdeGeGx1nliIaniyrD/EZfRKEHXqkr8
	 g9dB1VnuAjOc27CUG6AjUOV0LCL8Uk9zRr7XLltRAgaj9tJCHmQ7gNW5QjZ3YEkNGVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Y0hE/zS8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D0606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820D0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y0hE/zS8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a+p2zF5J
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGoO63730237
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=; b=Y0hE/zS81YmcykKG
	Ecx7laIbm0Hzc+GkteZPg8CAdeAGeIjeZGQU48SH2sird9V3JAO/iFfkwoCUTVoJ
	ZVi5+y6FzW5bFIjuu++7tSfyGdhekHYdXAcIG+2YLz3hoiAkU3sxbxbwF4LXshGb
	vNLB5AFID6gDFqP4WY5cUG5OCgZdveos6bv4aXOO6YMNMBQA4PjtBkDs15bGO3BN
	akrCYrB79oU/0eLleq1UD76CjvGxhlmQ16hBlJvyr8Z7CcNVqJrDBGMMo7JXwqH7
	W7rbNxoe6G50pzt5w1fRbLAJ8QtqYe4856foBuEFI9l2iJpcUtqlAbaP03zl5Pcx
	1FV1ZQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd37se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so151313eec.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463574; x=1796068374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=a+p2zF5JtQFLdHMI8jOzvdShY4shu+kItzg/zAcqC/LI6swQaqMkUdwPPxgkJURXip
         JevgGuQq9EkEybxmx3eOp1yxtn1hzXV4RPTixwSbRKueWS4BhkPotrxteuz39b3sqbT1
         on1egO5aBvBWjKRhbS+9NNQWd2a0PYH7YBdU1HZbnBqtgFhcEWJZku9wHJpKXpxjAocd
         fy+TaU8Czy7pGr23G3n/RHtzgT333voY86WR9IHilbePBBuV7vu6oWyrTMmNZoYvKeS2
         etZL69TAVtHMOk719w9WoSvNq9WoVkRoTRWwkPRkn/jBs1NBKuw8Y87HNLRf+Gg40A5z
         7OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463574; x=1796068374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EULmNcd7YytClpSpWnk8JoA40GEVYN80y+V5m7InF7w=;
        b=e0G3xjh5byTAHlyQANhFXCdJw1BblKF/itTUAV0tf8Z9BCB+pDu+0vcFmz9QN9n3BW
         9pMOnzCUcLfQC9RKIT364VAEZhntis3zJFHVOfBBNJSG3QwwcPoC7IxLoP9X5GUNO20M
         loIiLhyvQbp6yGWkxa6ALhBDew43/+Kv4kA929n7OX7CJ3A5PuZ1WVGXcELbUtwu+WCW
         6GPtZFekCYCVBSrRmnebb6FRijOFvryf3/wC2eXBD0WnDmibEpSEO/2ME6grCa4LDFpK
         5qgZlWWLgfikSJZub4mRIHSpKZBADti90hz+VjIxQcyY26wq1C6s+NGeYScKmYC5qFFp
         N8jg==
X-Forwarded-Encrypted: i=1; AL+hErFDU56vKIjnvmG9HnB6BR/LE4wQZYiXVGZQz8v6Q1c0HZUL5FpuBq8ZeCaO4DHaxLWUDkyvOJwD8kI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BUcXoNsUiIy3NDqhkT/4Y72Dm7k8boZUZPtq0hlsOgGDLrV6k
	gLeMM870He/FhgdXFGZy05xdJQzOEZGBipgqRxXqapXmxjAmxbOTeYrwPxLPnv/mu2h9dRL687x
	NXuxEGmeQO5OIcH8xxns1Dacb+8KuRjZ41XO67Qz7dPSSSh2dKpK8zm3QAVSExug=
X-Gm-Gg: AZFdTZe9ym0IJI8JNG15YwyhCqvHovyoqFaM7IESnvaKi7hS6tZSxP2Fgk07nab/2g/
	SxnxnDB9MspTwK/qHLQYPiPEXO4A1bObFBfVT8uD+k9LWYpdmzqvF2DSHsq0CCAMOCrVFOPCnsX
	5IJR0uyKI/M1OWxkinyT/U2myIEuXKGgp5PidNIj8tkcNJJmtgk4JD8zH7jv3OOBv8E2o3pUYsh
	9lQcH3nqlmBBaeJr3grDqRAch7etT4AVidu5H3ywlc+iy/z8Tlyhm0ms9NkHM58V0EcJIfGYnbs
	vfmvC+AxFmXlzXKaS0hdtdPYIMwR8AIA0l1/QGCvD2SOePQYa9i/S3U8bYdQyMwmGzB4uwCzlha
	FYzIJKkwjiOmqcrlvqHX9TmM0N/5Lw0F/yZs6hKAzfl7WCUXiUDFmxcZBi5FK+T7LH9lsJxB2tg
	==
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405178eec.41.1795463574049;
        Mon, 23 Nov 2026 11:52:54 -0800 (PST)
X-Received: by 2002:a05:693c:41cf:10b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-386b1067b60mr4405145eec.41.1795463573559;
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:53 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:41 +0530
Subject: [PATCH v3 10/10] arm64: dts: qcom: shikra: Add GP M/N clock
 controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-10-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: rMGhrA0n1WvMhA6An6tyMBSrNjnZn_Wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX9yZj3QwoxDD2
 Jmj72+NZpJIamNMEyu29tkw2QBaz/Ir0Kl9KZ5N0m43uMTPQiAppNbuFH1zWvaFjsSsQi3l2nb2
 1nnc0YFrmk2Tbz3RkTdspj6jl+OB8oKy1ppH6mGXlgeMGPe84+m5SKKauyvOTS0GPaGPwCdGhhf
 x40jhXy/L+Ieg2jssTpUsrfjmx8VeQVvET6wn3FvbCzndaW0ebIAVQb7mFSkW5sQscXj+N/pzQe
 dTkS0Szrr/SHdCq95saUGPNTvXG0K/mlEuwogrMx1S+SvZRGgGTeteR/Drh+8egiypBLNLP+qu0
 qE4e8IU3qXkHB/dEXbROdukOrSpzfvVAe1oEFWlfEsgMV2iATF+PnUbbeTGJxTHjXQDm9bbXWLO
 4i+0gki5s20dKPjEqrEjDbDFgpTvtoTAJwBIa1DJaF3rb7gicry4URjok+NrMOJutq2srsHQzi3
 kib+ELLSRZ2lSpthFiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX0EA3GLFL/dE6
 bdZ03lILBCL2L7lAOawQrg1Npmwb2IPJTeVlG/r+m+3jSj0V2J/pTCKsB83BhntnBO7ECGJOeoT
 jA6nepP3bwJ9EYR+X2l5YCAdUlfHF4E=
X-Proofpoint-GUID: rMGhrA0n1WvMhA6An6tyMBSrNjnZn_Wx
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b049996 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tsJniCoxF0iYytplHVkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for Shikra.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio87. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582c643f97e2b0725eb88a9f262d83c..a5079b82f22f518fd9e858303292bb7ab874e1b9 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -992,6 +992,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 				drive-strength = <2>;
 				bias-pull-up;
 			};
+
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio87";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		pmu@c91000 {
@@ -1303,6 +1310,20 @@ sram@4690000 {
 			reg = <0x0 0x04690000 0x0 0x14000>;
 		};
 
+		gp_mn: clock-controller@4713000 {
+			compatible = "qcom,shikra-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x04713000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		sdhc_1: mmc@4744000 {
 			compatible = "qcom,shikra-sdhci", "qcom,sdhci-msm-v5";
 

-- 
2.34.1

