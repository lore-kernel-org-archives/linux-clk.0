Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714A8335066
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620065; cv=none; b=LvOTuD6ljeL7KNxX/CaouXCqnt+W2dR1vHBtKXMdWMKfaFRnNUXGIHKr0yhPoqyMujvu05pmSya5k3tFE6hr+VXL4tCDcr/ButQ2nbPMiCrBzUFpeakMOnvy6J6oADnwDfjOME5OjleJomIRO6gsm4EPezSY7Y+I+LuEHqMNv7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620065; c=relaxed/simple;
	bh=wadaFrSSj2BDmJ3Y9ZwRT2wmM4bLw1N+eXfF5sF3PLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FK37PQVMUQ9ppdC1r11PvE9yJVGzJFdPvatTCkorD9y8jRIm3u+ETT0GymS3ASsX3AHWaH4iLZrJMuPeLCDWgMeKdCiZQtNI7Zc/UascLTbetUddi5DT47EsH4mamwARTPTSM19k/J7CuJp1cmNyy/ujEnea9NIz5aqs4krvMXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTN5IPmH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9DnRStn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTN5IPmH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9DnRStn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058LLBK3842319
	for <linux-clk@vger.kernel.org>; Mon, 5 Jan 2026 13:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=; b=kTN5IPmHWAYwIMY6
	bTLm2FRvrzsWg0872uWjazo7CtUOthJGNScCOTLOWLSf6G7Xgbu68N72t5VmBtj8
	V1vy6UXeIQ0QcTmZ9mLevu5YGYBvojNHO8KM4IXlI5UqJ9axXuAP9wjiLzoUrRwG
	55sfv3mDCLAJYwKE7B20HFLQa9Ri0ZNQClVaA3MJ3WNngbl7yK7cZKQfIyxnj81n
	ggNcNLySHHq7qb17OzIvJo3zg6wg8sHNiClltJc/kYgue1GRnG2zYnbKO27Fdbub
	DAFZEg0Pt0XNzX8FPlx55KdHXpmPCiTaq5+p1Kk6wwMq8ZlJSBp+7iKz/Hv1Rbmk
	joMj9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4kbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 13:34:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4a5dba954so373734251cf.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620056; x=1768224856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=e9DnRStn/g9+7//y+O+dphlkN7DctNdKEEI2T+nbhwXr4tML9yRJnjopawoqLU/VGO
         MMGV9YuctXPu0kX1VLiAWOIrcG2Z8phT1Vj8TK1i4lgJFvNdUbXC9eauGOPB4gbgA27p
         1O5s+f/dI31LzJj0zTjXIJSec1kxNDWpzsKFQiorHCbTC83FhA0xtIJkFnsxIhWl8TcR
         Fp81iorqeKRcrk9PKzq3Bq+qSvvSWvgjcoEzMlOX7LsIPow5bFIYhp5pFBbkKBB414bT
         Vuq04JwR8sQMQjCJQsN8S204iVHMuMKG5pQ79TquvCNXZAoLdkkIxDyHq2F7UYJzPftg
         88bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620056; x=1768224856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cz05RYgR8UtDihSBGMNNfClzgGi8BclrL0LE5Kf5Dkc=;
        b=C4fL7JrlPjf2Bke6gHAVemNvQdt2KFzHzhfSPnKzuwhAh2OvUjMNY7+KVB7ewNThsX
         f5LbaDWuPx8k9sIp3JJMDqa51fkyMIrMpLlKV1b85l8iIfqbjOUHdPaAPO2vDzxk/PWt
         ZahBjGnNsIIHCuVrSxQ5DYY2P6CNLvJX1SUdvokkRqJcqvloxeFIL0+mrIeKU0lw2gQ+
         W+nRuaO519iZfO0SjRKfEX72nPieu3Htvif0kkiriF9Kw6OP5j3wx0AVxhf26no4Xisn
         Y7NmmO5e/UDRNK3g1nRwNvyZSn7x94toVxNb3VMeGIWTxNGmXALi6On7EPBx4jYlrFZF
         IpjA==
X-Forwarded-Encrypted: i=1; AJvYcCUq9MA/qS2yRSd80InL3CTeENodZHXzoL8qBgBttyOpPuM1R27jaI5On9ji62MAzok3PXYVeE4xxIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztwo1FX0nFWmkag0UKgT2QfGT1Ed7DHFfklQY7cCtuHyA53cRi
	HFAGOVyHu6yQMHi7Ru9kA1oBLD4Fxwgln1eEAbiWekmj3BNVP0qUOHEl6nS6PaRybSThl7LIgng
	qB3CUhWCy4kQJbvcpro+RQAXN6bi14YAZ54nV2fHXNPgVyBBLAFDgYQxAkDuh+mg=
X-Gm-Gg: AY/fxX6wZ4nVlCkRRWvPPGuioVrKcfSPGuUTk0uHWoA2AuvohT2IS/D1zxDLCRPOnFv
	uQ/8BcS7hCkCCK1eaM/YuTjTWttFcQUOXxK+6CuJ6fHmqxTYN8/jU2Xawc5aAbEiwx65a7AJx15
	fzzxicMTjhR1M4imzTmDbO3JtpXwrhKHPVliIUrDDCYchwcgCjzot2cxP3MvWN1lMYaIfigX/TQ
	Qk5tFc8zIFhY3k4Tji634SGhuJVAG9NxPC3G+670M+x8+fgAQnyqbHUWx04taHgSP/7iowMK0bI
	K3sgI6VPWi5cRx6jBNw0p0LhyWJSZ8gx/Av1Xk9nWmWVjw58xX6HIYMar9nVOmkiTxmjSQ4IA3F
	2Zymf+a8EBOqFGCtxx1diTtVO3hmtIQ0sug==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849343201cf.37.1767620055821;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvCss19TuzHTSn4xc5KfwRsOoyqP2KDps/f1CJU56eHf9wA/2/5GRqU+YaxUO4C+nFYpkDnA==
X-Received: by 2002:a05:622a:1f13:b0:4ed:af7b:69cf with SMTP id d75a77b69052e-4f4abd103f5mr849342761cf.37.1767620055259;
        Mon, 05 Jan 2026 05:34:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:46 +0100
Subject: [PATCH 08/11] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-8-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wadaFrSSj2BDmJ3Y9ZwRT2wmM4bLw1N+eXfF5sF3PLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW728Erceuq7BAzG0tJPUBxSPGgMpB/EHmi/cc
 Q1ZyCkRLGyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9vAAKCRDBN2bmhouD
 1zE6D/wIyBX5G3Tz0OKc86+zlTFfb3sgWPJPG2/wE9P5S1QCt8BMPbgtOESBU4oTjXn66148vpl
 4XA433YmKdR7SjWdruBtZOqiX7mSmQX7D+8XZlzsjDmqMWDshv3n41mHz4BGlTPsmIVG80LeFfK
 STAvr/njh8HCX/m/zH+CrDN13GYwT3TzdmD7vqgN6mzGCpWHa03kWlTa0d2Bp5aB/1N2W6DB3XT
 acNWdBnPZ6dxvlZc3aqgTDyQw2qfuUOLW2oNPKKD6lzpwYhMDCapLOok42Gd6H1U0OOl++WqP9b
 KuYbkdEqhXte22rq3yX3IOCFTL88H2iTL+ucTcNvzbE2k5lnbidNefylPrbT54uegORpnd6cp+A
 wyr58AVOWkbYBUvOwHu0p2gjbvVMXCTvjRASpUORfyC+/eHriePowQyW4pSkRr6TKufiu/mSDxk
 BsG5gwL07OGLc4LaBJKhnFKbNcokTq5Lh7z9zSbhb2MISrgYXZjF01TISh3QIZ5XsrKILL4iKW7
 XhBXMbwi3s3zYmfJUxdLjtJJ/rMqYOkG+BD39Jowg8p5T5RstO/N3aqVr9AfjiMAKQzyr/njdXy
 dlH4tFltIR7kP3B3ceyM4jdNp6Mi/8elfSx3k5QjysshnK68eMtnAnlIA4lsOHWUIfFP9EFpEqC
 PaSRKa+5UVrrIBQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 2787YhLZ6no2S87ZP_sWgok27epcNxZx
X-Proofpoint-GUID: 2787YhLZ6no2S87ZP_sWgok27epcNxZx
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdd9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX+F2LDDuDijvX
 lnkF5qoUL1CayQlf/o86H9teVwTzVM8dsOHsD0XEPfhoE5VILsK0jf4N1UfL33oVJGTUAbkRTLn
 V24yrCBob9Lzw7+++gZDpp75zX2UlVZ/4NBxFmgGRrstMDjwqTJv06itSvTySPGlvKMfYoOBD7K
 xIxnXhGI0nKCNre7uXsI54VOIL2F/IonswXJYZoRhIgYiU3rCXQJpbsyPFpQcXDU/GFYG74+f41
 k9Z1OFL9WVb7mMCKUePB/IWXCYxx+qAzRN9SIsyA7mWjbACW//tKK0Or0scy8oaunxQQYC+7uSd
 E5RyVg/rRlRktu5lzzdKd07SYKi3xp/e0wn146aBhIL+KqIpRzZDO9mukBkXpr55gDZmtdrD6TM
 WoMgVSa/YMddcFZwUPiykJXRDNvph74555e4DM8Wuu7j+WrAjPHt+V/RKbmfTZo34QZ2TrnlQh6
 YYNKSlJqUFMYVLHKSdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on first patch.
---
 drivers/clk/imx/clk-imx31.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx31.c b/drivers/clk/imx/clk-imx31.c
index 4c8d9ff0b2ad..962eccac63ce 100644
--- a/drivers/clk/imx/clk-imx31.c
+++ b/drivers/clk/imx/clk-imx31.c
@@ -123,18 +123,15 @@ static void __init _mx31_clocks_init(void __iomem *base, unsigned long fref)
 
 static void __init mx31_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *osc_np;
 	u32 fref = 26000000; /* default */
 	void __iomem *ccm;
 
-	for_each_compatible_node(osc_np, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(osc_np, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(osc_np, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(osc_np, "clock-frequency", &fref)) {
-			of_node_put(osc_np);
+		if (!of_property_read_u32(osc_np, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

