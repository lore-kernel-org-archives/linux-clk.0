Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463569;
	b=zta/es9uMuRn5Xgpx8lWzApYqLmEUp0bCProp3JA8tEWyn8BpSyeudXZ4h/PEQlBGAjw
	 NYcJt570cBs5svrt1lupk60fcaL9iH54OscH8yzAz+1PVlmd95+SxsK0+XQ9AbqAXtqNN
	 PxNgENYDGPTR7Dn98c7AvbTGWIykc0Xapt9bRkXN6qH3ICzO41QLdDEE/S+ZpfbdprONd
	 kDDF5T3EGDX37SOH31EEYO/igwfQA54bcASucQWuW4Wozry+W6F7W9o1h0JKkhkE/EFCv
	 FV3OojHZnapdH7gVwAteF6+MvvlPZbCN6KThOr23JUV2slEiwAEPw1VGNUm388zLDAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463569;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
	b=B6ZcVRq3pPPgK3Zy0pPojDFhl40rDXMSdsa9I/cqKB+bnX4GGCoV0J9XzeylXSIhew2w
	 2XlYHaj+nR8AmOmCWzUXN4qLyLYX9I4sVgmZftEStjwpQyF4v2qsMYcgU7mYNg+my2Oxs
	 wyO5qx9mSyzr4+rg9KitCv9Kt8v1hN3ji7Y/WvYuTLKcZb4oCLpS75Dv9Ha+8U7PtEl5J
	 ti52W18AghEghhQxkT3gXWX0hWBtiCUbqFIy0DymBO1zeDYgiWC9AepKY+CmBdk/d9hJr
	 MfOs+9H0Xsd72im6sxL/zpTEReIAkLe6B9iZjWiNAOGl84EXkbCtZe0AEXguN305lhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC6C606A33A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC6C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk5OOLF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnDZg4iG
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxrZ2377203
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=; b=pk5OOLF6DEIadDHg
	RlXb7d7E5t8XB0z+6gUx+XTk4g4tndVYynxJLHXJ3406JJMyjVhNipZvsMqQ5whq
	qxWl2KSc10E4Zj3JuLvUvYOMq8s9xlbhQvfyX0EZFCTYC7rEIOrvzHA13SZ42zOy
	oQyn6MDdBvfdss3jnieqzm5p8YJJtfSl8M8IILqV/7jqtjiiaThWR/f+KT9APKxs
	U4BNUkwPG1oy8K5PFX/k/1iJgEgYDIgX61+RHqTVmcO3JtNWqd1TRCWc9/s7WtOM
	K6vuUOg3wkYYfXld5lOhtesBCCLyj+oICCKZuZ/rNz6vIcKaqfl2Qk+Cv7cwCXDH
	MAIxKw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5xm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:52:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so9962620eec.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463567; x=1796068367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=OnDZg4iGAVxr7B9cAwmxCeK7c8SLlFnSFrhFxjIG06TPr4NfgiWE68xrtZrrYTh6NO
         JUnoGr1GJuKxDdswmrwl8+j2YshJ3l9lCbaDvNfquVxjSJt6f2AZsqbV9MxkomkAGWuH
         2FHKcu+yynt82XQ08MEiGmfWSxlYrNaZu0TFY6pyiD5Zbf5/5L98iWWNkNDR2aZS78D8
         gsElgimNLkCRrDQH12EFVwhIr6++iyqQFEe3ZDYN1l0QXmuzfMs4PL9ko+OLAYvcq2uO
         k8esH5/3GzN4PFWelqScIdX75dBazpDAq1PSA7JlZIO7X9I7Xhmpa2oXxPE3oSfntaMN
         P1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463567; x=1796068367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBfbN3Y9ZfccdhH8r92IMqOBJg51Z2xr2CJkWPiJy0o=;
        b=AFPw9mQXsYvpiKXv2npK1Y9fI/0l2YoGj3KQCFydHZVvzGw7RRwt1o3ktZZh2zwrCB
         OhO/bTyMnjrnEPTM1tMhp56U8znbduajkDQD3gzyCBF5HQGQOMMfVJB49IOpD0U+ToUk
         nfgR9cJ7GJrnzyLMdD/f+iLy+zlrwZbFpFIbgX6zyfI8VtnG4IBxFAnYE+xnhs3rl709
         jjlkIep50EmUf90FmVJltfCROLlPqexIOIkthb4efrYu8kGT6Evmfz6a2L97Ffn6va3k
         JAzj5SE/DtUYL+p27lLtg+UH9NPonnZ7ryWACzFz1NNKk2ydou3BTeHbP5nTYqRG12aB
         h+xA==
X-Forwarded-Encrypted: i=1; AL+hErEQSVlwpM5v5BybS9mtvOqQEydAPek0EybHqNBKcH/a2vq8M5wlFhm8qbbxt3gDxSG1BleF1HL0dKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MX33jcnNoBbXzUuPO9X/n/YCjWCuiLJ8DzEWfZxzJB9OCwQzk
	zdFwrdLOXv6PaTM/EiKHsDvxI7K63xyu2qNzKusEVwp+y9Uo0+/HYeI2GsRzlanPc1HTXj1bU42
	hp6kHV0NCNx6Y9FnEO1b5LKrbh0IGHXPzRypkKQeo9KqFl6BZmYmdoVvyfLFJq3s=
X-Gm-Gg: AZFdTZcNLmvcidC3qDY/UDrNSnVgo79UZNQZkb/vjJkY+c5ut3g/WNjEWl7SQ5XCIsL
	VE0lbxOZ16gTNKma1ZJNAdu+SWsOVaSWucdKS4uIrcs14UPA844jlTJmx4yvGqLFFxOTIG0A6eI
	+0ZraMRFnz5PzXAMBl+dXcuUZ9ZNZzAQINO92xSsMjmgrvJUkM5t4q9kL/B5VqX7vOYesjbSXEu
	80ACgws6rHyeVVomGucS11wHIdZV5WYse5HCW2/ZwlaiTJyVfF1LH+ccMnlKRy9Ns2+XhYGH12M
	cmnm4xNHzywFKxSdsRJ24c2ikNrETjMKFHSWLpmCR6+83DpyJvSlPAcByKvXkzQ3EyaBstgCTIA
	bjYTf5uyUMZdSXrfu3M87svxYWsaoNyD9FGohSArdf/166lZLu5IJf8XAPOWfOYHZ0pBAfaS2tQ
	==
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083797eec.32.1795463567274;
        Mon, 23 Nov 2026 11:52:47 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr13083765eec.32.1795463566804;
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:40 +0530
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8750: Add GP M/N clock
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-9-98db26a87500@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: GmuR2ABeqny3x1PknH0CVPwamEijb9u3
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049990 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hYfjAn83TXJ5YwiWwP8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: GmuR2ABeqny3x1PknH0CVPwamEijb9u3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX3Kw45YqXC8KB
 2VX2Af2kG6oBWNn+14k9F0ogJuU+BDO+iXnnG97ueuGU9SIdJpvxGs71Cj/uHwBLfyLOO3/29AP
 ao6SgArC3gmBkjECBlbKVx/sYTtrd+M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXyx7x1H3100Xx
 ym6cIZ1QxSxXU3X7qj4BNl3yr7O0h9WBjTr1/pCmlmny9i4DQwoEaUBlfd1QbAbhJfw9q8awP2U
 mtiZx1YaIwtBY6AxiofbGEWlNKTuadTvsDwktvzSUPQBzulC2CldoWR0j65kQuFJh1mHVhILcCc
 unIvU3jb5rQ9pIs5I4r/3cYfve9m4wkFkinUCyHjR7+e3wcBymaIcFYTEjgW3gMlJm2xh8h/V/y
 So5arOlFAOqNMqT0JVTRj75+GNjSo9GUHlYNKRjYa55UyXLInQKH+iXYoyfhjsCNfEnUrGc9XEL
 zQP6z6ahn3V4kyPypctYWcAuSZ5dw3UPdwjz/GxrvK5+xuScOBlgIuQxoX9yifuRAuLU1uBj78Y
 Crdh5W3j3wUFQE99a5+ix2ShchmYxjIDew36ew0IiwjD+LHMlIR7lSTU9gjmj/YoGbotHZSyqLb
 jJeiJEOFnAeN53REtTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for SM8750.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio53. The node is kept disabled by default so boards opt in
explicitly before the output pin is muxed.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index d8a853c31eeb15fb1d0023fb8b5a5a59a9ed763b..fcc78bb3c8334b20561af6be87818af8f5ad461e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3067,6 +3067,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,sm8750-gp-mnd", "qcom,sc7280-gp-mnd";
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
 		usb_hsphy: phy@88e3000 {
 			compatible = "qcom,sm8750-m31-eusb2-phy";
 			reg = <0x0 0x88e3000 0x0 0x29c>;
@@ -3921,6 +3935,13 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 216>;
 			wakeup-parent = <&pdc>;
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio53";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio64", "gpio65";

-- 
2.34.1

