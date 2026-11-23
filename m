Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463556;
	b=KOqECUk00hcFJ7E1je9MQBD9JCRBllzWnkPMuGKBsoJnU+CbRDRMkH2XYx0SjtcKH4q7
	 9EBzG6eJSgbaJomqI2E7/8+du6NvFp3QaiCV2qJD6mn3dZsyqTOEhIGmJmqc3IqsflCbx
	 Iny8L6aIhwYOM4u0kwBg+urtGgLjCcoztFUlep89vmylzl4vGh+JwSXzVfA8ifNEzbap4
	 Ek9G75NZ4z0JVI5THtq9qSt4V+tvIqne0hGpFmQsFhhpBnKk73mzh+ivlSx8bD1+IAAgo
	 og8vDjwQ2ojWzem3Cz4IY6t0zfpjBV9+o8DGJAVchF1+LHpkeu5NmGlAODwJ/h2tWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
	b=U7tkp5wcPmfHf5r6rc7iUYhB+z5PsVLbD2ArNu6RrwVoewhwQnIrhN6GpIQuYam6ui+N
	 6jEV93bn0JmEHEUMorp+TEi4Z9Z6WdFql0lcjNwnXCQQYKGIM3e3QNhlpc/j+JflrcY2Y
	 6tbpKsQYIwGftrnL3uewkFH60g+UuG6NOmQTYEXSVKuNtHC3d/qrZv65/seczDoVoR2tk
	 gdRNfbAS+5Lp3TQpMjQZCFKJj4Nbg5JUYQlqj3Lf/KzUxMs3B4zl3iVAhmZHE3rJG47mB
	 YAAMqj2ekwrfnaRfJiDQDSZ4flP2XIhr201M9rHCGKD0UPW/vxtaO6O2kb+mr1RPEQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jxF/MHQN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A781606A321
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A781606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jxF/MHQN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPcvWDat
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlcc3730161
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=; b=jxF/MHQNRK4rlZJC
	uidrjDDFeqZL8iSWhn8PNkEDS7Hgx79vauSEpalFIzPwkujyOatXfBEmhCN8bLYo
	IF/9hKoafE//RYaWdUD5A7u+na6sQgg1fj5lbkPUyDvPDgxY+xgkhSSefAEXX82V
	nG+oXN9KPMzjqvuFdHOFftZVkS8e2nn0HGeVbtGJHsXvogoE3Ti5gsr4ktTYHIIT
	w7G+T90Ta867z4di7fLATnB631mFFTtJ00YQP4qDmgDKkdcK63WosjtBnTjPxGGA
	z7o7oSHypZ2FgIfxcDT6RymzoCQrcFanGA7LB/Hy0sy1D/2Z/7PvWuO1HSssytGn
	JN3CTQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd37qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:34 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso4198824eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463554; x=1796068354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=MPcvWDatwtYh6jxBLmMD/rCxLEpOWjqi99GdC4qHws8IQKaPyjrlfTNAIdds4dL6SJ
         uF6dTCwxRggaiHaj/9UhLQ7+YS0Qqrz4NKwRvSm3wQuTzIABkvoa8u+4zF5xEp8iku0q
         phCUv0sI2/7cYbOf8bfFwUb3fnyAnmdFPZ5nLg99tIooYdhRHIIcEzmQgcUpgxXKWVAC
         FWuMNPO+7lwpTekAFiErnPP0Uii1WIkBaJ9KHVXzEHXnyRWwjg9qbPIXAx8L7+qOBeq6
         FW/i0Hf14B0T2geGFsD075VipG73SJThA8g2sbQjwQSyPBj0NjV3erqQ4MF+olIkWCnf
         dkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463554; x=1796068354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrzuixifcgj4ieImFYZkDs5YxdebevQpN1By2OneWM0=;
        b=RdfATntMlSM16liY64gMJCzlIgChCEfLt0UbRpGMn+m+FlHJBg1Ktqv4zu/gsTn6lg
         NIcXIGM9hGl4y13fIB+4DBgetJk1kprSo3tqhYdAHy3gd2u7PbU0EeoO/+6E1oOrr4re
         xpmsM4GdrLztT+PxdXoW/IVoyfXUzGiXFURZEsLPkO5TD2GfdQ+n/0/G8OaLNTKre+4m
         UWzV2IRq4tem8/6KnQr/op8+bWzF2TTczGvRrqR2yFQ1hN3J1zX9g7iEKlL+ueeviuas
         xbAt9ixqbKW/wxAwcUp1aTiP9VuoRNuNu6obfUR4DHDv63YzAH/MHFwGJI4MXgeiV6pB
         6REQ==
X-Forwarded-Encrypted: i=1; AL+hErHojeGVP8e4GkP55xxTkBfOV/IQqJeiBmdgXdwQzOqBZ/CzEH43Ga7LZzT5iMaoD5ed7MNES7rAEYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6hmrIV6DDAqGuSDlPhgLHEXizoRKMpJiOwvgHf6/6D6PSPad9
	G1koipqO3L8T1Rr5xHcvbRmci0z/s7QuQk+GhFs4Ifwulo+1RHN5eSSZ6sJP406z54/SV2WGf+R
	ekJtYE/jXdV9obsDNRSGEZrCq7h+d9wrrlPRXd1Pbl58fS5GRFsWd7VVIwUQRyFM=
X-Gm-Gg: AZFdTZetCmjkbG0AK7lj9YxKSO+u28LmRz+fqulvMHQBe8Jc0bTmYC0LYhaHkIshWbo
	VTOtI7aatEttYpISl7KSfQbBM8zY78CrSSqvZqYl+9moC6BfphoyjljJpXCrOeKgPKGd+7ZPD56
	LlKjZdsH9avCv54pHeNb/yyeUmmrikftz9aGpB9H6xU9G8cTEK9C7Sapm6IaTQ3IDCGozAvEYKW
	/qP15H0leWKAVMcksPLGbg8S8rBkVkp6ZhXVfv65wMeS2kIEjEI/UBmO9M6VU5glvywZqfxDNcb
	p+7I9P4+1GZBLHDIHFZVPDkIyuhoNf2bA6mVYs3prHqat7s9swnk16cdJwdohgyKSs2hR0rLJPe
	ngcOUjCoYw+pwdZkVowEJO0E8jz0EA9San6EO/zgrWJiQ65Y/tXTxY2+gNT7v/zdgBRHLMRojQg
	==
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12179028eec.13.1795463553651;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr12178991eec.13.1795463553150;
        Mon, 23 Nov 2026 11:52:33 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:32 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:38 +0530
Subject: [PATCH v3 07/10] arm64: dts: qcom: sc7280: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-7-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: P31XQhYMkvH8K74PmIATXwX-9lP9dWXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXwwYTtlFN6uLN
 0ngSRBiLmN8KTdL0gRBOXUmMVWcsRjgM8pGRdUoaIzSOxHz1wg+9f2cJySGv19QGmNUDgoCY5sk
 iQKTfyCmoVBPpkX3fMz6A9C7XHRt6EFlsWyo6+m4xlynnE+n6A/qt21OyL6Hzyv5nvQsTtELaK7
 toeY83PZg/JSkSyeEwywQYk0Wka0iK9L249xvuEJhkKTzfGuQz0V4kcbWI7M0SIuYif1kkKTgXj
 cnBgZTeBu9WHOAKKXD8bsmL8OGxjSUDF3W9Dar314zdzGa9++7/YY7PKCDdXrRJ4BqBbtTqP79k
 Rk2kR9tt8hVp6pRn4mce8Oec+OWD3CZt3HI6KnUz5Ibyo6YJDaDEsNL8/AMLGd0ddabPtu26nF2
 hmrAYyWORyt57GzypRO045XDjb7w93CWwlOZMO9qicYTEGg1dAoQtMuC9i+MoJrmhcziKLRxQL7
 QHhlat6iz4igxGb6xaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX/9dg2/3cvBGe
 eD9VWLohO18YciX+bUoAYR3Y05h8SKQ/j8VMjcrf894a2MjRrk9VqpK+gsWG3BHpBJGwUUcFOfS
 6WmV/j9L+aFym0Sswit+PlK5wvL/qVs=
X-Proofpoint-GUID: P31XQhYMkvH8K74PmIATXwX-9lP9dWXS
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b049982 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=f-mW_kVclKPPUklfXV8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SC7280.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60cea1514097354b8f0f59ffca2fc..773f4487d78301a18d5c27e9e97462e60adefd0b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4454,6 +4454,20 @@ usb2_role_switch: endpoint {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
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
 		qspi: spi@88dc000 {
 			compatible = "qcom,sc7280-qspi", "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x1000>;
@@ -6683,6 +6697,13 @@ mi2s0_ws: mi2s0-ws-state {
 				function = "mi2s0_ws";
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio60";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s1_sclk: mi2s1-sclk-state {
 				pins = "gpio106";
 				function = "mi2s1_sck";

-- 
2.34.1

