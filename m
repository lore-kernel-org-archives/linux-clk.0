Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806890;
	b=yODd3T7YE0StOrZsckYaxC0C/wlTXrrmyWRuAwE9JDWUnrkBUlGfOVVkaPFV/Hcd7hRc
	 JB7TKAHQXXpYtkyT5wZR+u1hMItuHHi5Yb5yZw9RQAdJKp168UoCzBGtL2CR5SGPrrxE1
	 26lPt8yPjfnMZAkaWZ8Tajvlf9yo8XElGAHucow8fTki6igvEoTyu+pqR/RWC6G6P3wgP
	 FuiHUfiV8phrcoE0gDelGEVUoaW4dXWdpZGL4LRUeGxeUSOXvSFFYb/0q5g7w1fKFvlc5
	 Q6FX3GnUx5dLKn/qRYVSfpugm+YNRUK5l8Q8ADRSP4qoCZCkvNkqjFFRcr+uzPwSaeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
	b=tAqcBVU9DLLI8s/Ek4lMWgwRlfhfd96rnjbRgv0q7Omn0gf2neKOIPXARqM9YadGRHUc
	 qCo/3dCpPNwNvnURJHhsrFBsXIYO8ODpsz5XTcSQgTx5RMxz04C0QhPMjup0lLqqtZ2/r
	 AzhSx0QGx7TKQQBwibggGHG9HTGPmejcTZ+H+9Bbq0tFTYVgl2U/FICpxRoirWZHpZMym
	 VTOehZuq2xReT80pR4kDENUmMqKQhoBfgAmBixlrlhmuel93FyKPhTttzaYT1WfTZE/MZ
	 mqRGYsN3dAaOasVX7DbgYVA6eEkglwvWsYMkl3V+k21uZCUev8Bw4Gxl3OfyE0lfI6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E0606A32F
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 580E0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9ASdc+d;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTHw56Qs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LboJ3839125
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=; b=i9ASdc+dFArBZJF1
	J2TL8pAAfcAJniWfpqQ9iIlS4m9M+4LsFmM8dH4h7ka6x39UpA3k32mQsJV/Wycv
	sQr8yWCEDyul6fTYwrrqwzfqNYwKM08cQa+QRlVcN2wWfxjBDxAl2M5gFOhqzOas
	m8SX8JYzD8jD0df5LycrmWb4eyClIRy+3V8mqWuevfodur3hDMMnwl+pdMOpQ4/U
	eoIq29/dbruF+t8GKK51lcry/z71BwDz8/pEkF5G4+3Z/6oKiqDB5zIk7Skw+C5/
	6B9pIkECRMPHXdZtHJlnFWSowNmojPt5PmdxsGpNt1C8COX0kSLfKCrRd6RrkBNv
	58aX4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhmuhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 05:28:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed1fbae872so12328165ad.2
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 21:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806889; x=1795411689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=eTHw56QsmFnZpNq0v6EqdzxrNpgoVces8lX4s5u7LTQrNpOIbpNTb7KHQyJbIwundc
         0p7mImb8IqvGEnWUhf3NdFbpKuUZ2+oUDjph9wi67qGzX9wLGIvAeEK+P4gOLrt9AuPZ
         fpoaSNxRsI2Qp4x+pgIpRkE95FQApJisi1y/5vGaSBxbesQCJN0ooa7LHiLL/+Fm9vUF
         /EfQlJAhYDIFgz7gW0jJqbYbP7hS7flUKEMNDp1Un4w8AC4G1f9Vbv5lJ9s+3ydR8Grj
         1MDXAp2CenQJVlrM+5aD1EsECVjTirl3POB1EUfeNBE3jpqDxJoLwPweFqUTFkPcbeUA
         rHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806889; x=1795411689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YecMylx2hx1tvInV4SmRbK9nY8pk6Nkcij5FJD5aBUE=;
        b=I1i3hjaH9/iJk45T2vPdBBIFnJUOSvpCWis2jCxP5fhgeiDm1IbMyL9yVnv9OfrbZA
         MZsEvlWH9AvxNDQnzinqmOSy3hPns8P9ps5JaOBW2MHGQ/3CpPOB1GKz2VruaxFMduek
         wNq8TB1VxKw53DQR3yzWmj1Tp2Ymp287q4VDUuOAQE2pLdHIgLYetFclsSUgPmK7uk9D
         ELqRxNAfItJGgJi2NHhUG8OOt+XsCv/CFR2TcIsQ5ThIFkPA3OagMzzwBLWrFMcQpBGO
         6J94jhyUjYeNeBzWEDWQfJq5VH1NyAU3aRGY8v9cWsRor73k7Mcrk+YqBL44LnZ1s/5X
         i1jg==
X-Forwarded-Encrypted: i=1; AL+hErHMDQFc+gnDIYI82Q8vEJ7DhE/8WV1IGN6rC+dJbUUBYzBn45oM4wPp+w7KtDsutr/r4VZp6YWC0BI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v9Gppx9UjCI4QC7WbLEwxqWb0KlWuOqoGs8jk8+k9tecuNFUv
	pPePX9yzijy3xTHoQ1+3TI1d/a/B8NFNypvzCBTVakfRZpVBpQrI9iZKV+WrOnb9KVUruq4F41e
	FPQqa2U+vYJRQdrxqJgXg+OxzUc0NWYPzVqKkmUOibG3oXXmkKjGgPHVJiLx/+Ik=
X-Gm-Gg: AYBFou2H568o1sMb19YJTWK9KM7Y64C2Wh80R1qSoqOwP6H7vlN+OTVzDMPGpY1zhd2
	EtOdulduA77as5J1RpSOpk2U/WvX+5iti3l1Wv4emWA1et9jWeuQPVsYb0f5/X75lzmDMsUSoJW
	6tt5rXyjxDHWWP0I68xC7c+HiaK4Ay+aCGR73BSkX7snmQ7/I9uStiaXG1larM7CYAx1f+qQb9/
	v9ZeblgmaXj7lfdUg+rotv6F7VhWiPwEy6SXJn2KEsih93VFPqoDjuxYDR9a6Yh1ZRAWwGVOinM
	PZ1mW+F2N8xNEw+AKz6k68D9kz4BbNWHVbmMmx82BGX1ZIJqGlNd5Ee3qRwXyP5L1YZOWinFIsA
	79I3wJ4Ok8YC0+Pp3mGXFxLMZwyr3xKkNF6vG8t/lSBzr9wVgOVlVrPMAwUxBqZnDHc5cRvzcPw
	==
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831885ad.7.1794806888947;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
X-Received: by 2002:a17:902:e884:b0:2e9:8202:509c with SMTP id d9443c01a7336-2ee0d672781mr99831575ad.7.1794806888523;
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:08 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:45 +0530
Subject: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: smp7YHGm7S9IHH7Ih5fQp29g_04KbdZL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX4AF67XKvitcM
 iqd58xU+5e5iF15eZpXs6EwxerEVkwUyn+mrbR9hbfggiVXx/Eav/VY+X4/DMS0ImSg0YGvFm6a
 KINc0eAsbvQtpJ6jNwceEMoAwF0LZZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX4JwbVT2HVnM9
 6ixPe8PXHJbJodE5PaYqNfMG+JIUHCCNJ7aBVAgnr558YgjSiCy7NHhtHE/iAlW0J+59zPq3lg5
 PaaSrUq9LFY3QZa9dYNrTMjwnSq9XoJlQaP8YnbwoIj9lD/JizDekEPh/VgcuLrQhhou77lj1bA
 CKpG8Nk8o0XkSLFREiZhFKtIjvWVl4DdmG0sBPEq8WMuErLcbCOSsUQ1/5b5AkEWpxtfbedrUh9
 UFa6zLlF9Q/B4OSSqaPrdilagN2si2VGRml0c72Q8uS3S82RsO8Ncm5/A6fmA7oUWsXLU8ZmSyE
 WjI0cZndRaRXVwu/dBEqnkes4/I9zczkVAOHt7uGik7sxFkQ2he8lMCCIKttae5MxB7lgXy1Ryf
 bExAsaV2adc98fdcsl1GXqxBqHjTbxiD3KvyW/dm3vJFrrkeD9NJzi8scEoel29ht644m9aJQHK
 iq4xP3AbIs0+C36QTrg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6afa9469 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dI8U08jQLcRiIMuaFhoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: smp7YHGm7S9IHH7Ih5fQp29g_04KbdZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Add the programmable PWM XO512 divider sourced from bi_tcxo and make
GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
PWM core rate through the common clock framework.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-shikra.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..93df784ba14376ecf2b60c5eb37e6d0b5cef9501 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1888,6 +1888,21 @@ static struct clk_regmap_div gcc_usb30_prim_mock_utmi_postdiv_clk_src = {
 	},
 };
 
+static struct clk_regmap_div gcc_pwm0_xo512_clk_src = {
+	.reg = 0x20030,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pwm0_xo512_clk_src",
+		.parent_data = &(const struct clk_parent_data) {
+			.index = DT_BI_TCXO
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_ahb2phy_csi_clk = {
 	.halt_reg = 0x1d004,
 	.halt_check = BRANCH_HALT_DELAY,
@@ -3212,6 +3227,11 @@ static struct clk_branch gcc_pwm0_xo512_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pwm0_xo512_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pwm0_xo512_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4294,6 +4314,7 @@ static struct clk_regmap *gcc_shikra_clocks[] = {
 	[GPLL8_OUT_MAIN] = &gpll8_out_main.clkr,
 	[GPLL9] = &gpll9.clkr,
 	[GPLL9_OUT_MAIN] = &gpll9_out_main.clkr,
+	[GCC_PWM0_XO512_CLK_SRC] = &gcc_pwm0_xo512_clk_src.clkr,
 };
 
 static struct gdsc *gcc_shikra_gdscs[] = {

-- 
2.34.1

