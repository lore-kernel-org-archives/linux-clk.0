Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891FA36655F
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977921; cv=none; b=DFXyk9hxLWsAswQcR5M4e8Bx/hCQjAlDTlZPnRxWlmIkdhF84/WtRelMyuUYhUwipnql4Q7squrkNfmCH31AqWIVo7d9IkQPRgMFP2Ku3OMR0a31ledACQd/PkyaJrMsbu+VEa/NT+XSmZ2TKx4L/OgMKK76acopLArp1OKlDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977921; c=relaxed/simple;
	bh=ZI+U3HmKVnYXK5v86o6BF2VX3RPpNT6lnizYwOme37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRjUuvIx70JUmeABDNKfrHo5CWelKGFhnV8I6lYoY1/nTJtCIbbMplEUQvrq3bYj6QCePaM/GpLEagduToIJqoR/lqEk4xTCNH49AbWn+kITXAvc4bhG3KnoC1cKYMGtHtbgqdmV1VQNUTBgvDRFCO/dC18raLbivld4zjUfnhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dQn7M62x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Isd2jb99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dQn7M62x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Isd2jb99"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609DIj8M1701852
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 16:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=; b=dQn7M62xwk8e+vNJ
	km3ZDzKgeMpElhOQ7VlCfu1EkC3EZlWesVsRt8YvavaRiK2Oh4uehTIytdz2xppJ
	Iyy+s9spONZ9DYOyEkoY66e7PiFmlpU1CXUnddzZGY1RjfELy/UHuRFMAEJgsPgP
	P/EdQsCM4nKf/S4jDfkO57/Vs7hVo8Ntry6c+wnUBoLLSMk3UZHWj7HLBE+6SuRR
	wFtL4KLvVB9g+QdPfjeZnqGlwG9KjbUqB7yLq/oUimvXre2cvxIdBg7YO/Sn4FYa
	DU305n0KJGTQ4/sI9gSI8Qrio2VOpXIj0RT8i3A4YmYEvOeoBnJh/2J8lH9SK/J7
	DKuwrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdac218-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 16:58:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8bb0ae16a63so513532685a.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977916; x=1768582716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
        b=Isd2jb99eRrdmwLLptQI4RRD+y4EhTw4LvBZyrx7lAEne58WeCmZfd2N2k2hYVkyc2
         Cd8sXQPMcK4L97Pin39pGbmWH6HoSEx1VQrQRDhM0v4i/vI7lhI+4YTZw1o20SVcoavi
         7Ntc/v9fxVxs8DR0ikiGrRA4CMyPCvtVOoWUNnTQcYq055O+k/gFeykSZgzQCpBtv72+
         kxL8NoJD2u2XL4tjKmSNH0wZlXf6IBcLL0moC7Tj6XZA0g8RMa28Uv77bg55w9P0ftql
         jY8QdAKjZ8kaS6vGRt5CwMYQW2gU0STeVT+p3Sp8gQxmMOogP53WsKVAqo4DVmCv4RUx
         oOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977917; x=1768582717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+I8jwqy4Opw465RbZcdpAwGMhKJVBMH0ODZ/RSDpWxw=;
        b=STAZoHVEPeXr8A5TKjqSQlZNkmiEc6rRDtxHf+p2RYlw+Z8rn/jR6pBKvCyTYI9N45
         nOXfimVzES5ln3GpWTGEDQdcIRLCsdfOu0MnVHkWJm7/CXHH+d0SzCe/Cz+bWKcBKxMW
         5V9MdkS3+c+CroKntqAzew56zV3dFsQfaNvQY31SXttc//JZf7EBsQ+/rUVH2KdoFStC
         x8O3HXhkacmScWl6+9nXe4Zh62JM7EeBcbz9ke9pa1yEdqwiQA7e7G4Al9PWHskMoG14
         4EbaVN1sDllTmC+HoyoY/By86bqNIdUR5uAQ6HP4kw0ecFyI4dQ/wqa2RlI+z3M2aJup
         frVw==
X-Forwarded-Encrypted: i=1; AJvYcCWpzwSsL8oSxvYQ1Q1nFqFoL3j+hIY4zAXxg3E+o9pkBSjba+APszOiwOx99rGcVadAAXGptp0kwHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEc4PTwNznF+Fnllcq/Z2n6vVwIWIv6punqDwNmkm8/EOg3/+V
	5YIdKNPsjnNU3v5BxtXYsMc9QmDlfL469w0U2EkYVqQh+C8oCFNLT6eqsmR2IhddU+J7vMW7u6j
	q7vrzE41CaKhLWoonIsQPPn/cmrT2NR2BsAwrn8RgaWOUuLWQVdjr6qYYLkieyh0=
X-Gm-Gg: AY/fxX6UCjVaaCS5K2QW3A6LdHzHOjKzmzVHhBkD88JYwqqjEG0/prjb7Tf8BSXc/vK
	3QkZtZK+L8itmxg3GUaxR2UyLrTujEdet6S9k2fyFTklch9qAwOo0+GBxMpGuvSbUF5UN24x2fq
	jbGMOlQI0afNVEdjRvyDjFpGJs+Fr+iTJ42xxbeKqW0a2CdHQxXaBnb4SS6+fP/tEikqJTz3OkX
	RIWNaqBd4HpezqY8vcsA6y5TgqF2+oYNyyPP+ZI/vYLwxTtoleRfHNbwuxVQ7/BvskYU42u3nuu
	+Z7YDN6y7P88dhVELdjIFxVcowkxWVeRn3r3OfoJxS/LFaZ6ouMXmIxRv7pkoZTsXpo6olj2rY+
	NR4/ZHQgxWpzYF0jhunwn4zJu+adThdr9eg==
X-Received: by 2002:a05:620a:31a5:b0:8b2:dd7b:cc9a with SMTP id af79cd13be357-8c389356fa4mr1505593585a.15.1767977916538;
        Fri, 09 Jan 2026 08:58:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd4P+5i2nj0W/9D5U3nva30jkEMvCOqGEW0JV4KjhLClEVL20MybHymtF7r1Ior1sMlVhTjg==
X-Received: by 2002:a05:620a:31a5:b0:8b2:dd7b:cc9a with SMTP id af79cd13be357-8c389356fa4mr1505586785a.15.1767977915936;
        Fri, 09 Jan 2026 08:58:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:55 +0100
Subject: [PATCH v3 11/12] cpufreq: s5pv210: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-11-c22fa2c0749a@oss.qualcomm.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
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
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZI+U3HmKVnYXK5v86o6BF2VX3RPpNT6lnizYwOme37Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOaHPCFJwqx8kUNMe9/c9hODDZ118FgBLWzN
 4NPPXItbLKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmgAKCRDBN2bmhouD
 1x5UD/wIUofhuCPuz6KtYqBTpPHzfpb3k9H0kKP02mFOxVsmacf2tW4ugehZIzMEOAFrRCg69/T
 bpBYb5nzmtE4qoUsuEWplgSxGZTDB4Gdn95AMnaweOKPn1iS5Jxq2nTOllLZgk2GBhZMfLBaN6A
 UP6JIiWtRHck6Z0zeI+y0dYY85j8pPkIe1eGxLXOkEt1OH+w2XfpLcyND7AS3ebn5EKQkhRDuuM
 UNbnryClXYpJvCWN14v7GeJWGOEIoiYuPA/IHFDR1QXJktpvcrarhz/RV7XX7vQRn6bpMcoz7Ns
 oUmEU8RZxVnKJgQnbFVSo3O19t66Gat5ptNkHsCHSlgctdvYmdbbA8089qF0bUcJt1fhSfH/nrg
 PFf0GrMkkU9gKyQkya+XtRumPmR5ILU4hlSzr08U7zvVsXbXDFzrQQD/wYiNCsqboDFYRd1yMCN
 nI2rfHPDynmX9I5crfgivb5TocSSs/z3DOfFipO2C0BKy677q/yqv32s/HMLZsQ+pQ0kiQbXDPQ
 i0WZFOEyvAtB5Omv0zwdgjtz/+91q+VEPF/stD3F/vxR+WlKR6Qik32yBohmUgP49IXOIckAC6I
 Kck558AnhkygKMsybi2gIqSFH+tTfYSY0MLZZeTK8SiqwkkLj/jWtG0+kInNZiIbvNyDmPpOUIl
 Hv88Jx2/oaTAUSQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=696133bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=8YWg2ve-cigzn2S1SOoA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1-klaZwg0vye28twnrgWcZmh92RFq_GG
X-Proofpoint-GUID: 1-klaZwg0vye28twnrgWcZmh92RFq_GG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX2Jai3UXGVEHM
 rvQvWb7NJ4Z0jLum9IdaxsLj5iv732UxTE2EX0/Sw7sOxa/OkvrKq/HEVxIqincOZnxG5FRCHvS
 dNG3mYM8FE2JX8FfANtejZMxLgUykd6nJ1VxB1RvLIKYDd3dbx9Me2tvVi1N2ZIYOSwfFW0Lt/q
 tEPP8Rgx41FQw5Bmnaj7Zvt98KPoq9WjuYfiA1HSZTI51nezLt48tJJTxYldjsW1oaxrQY6NtV3
 XbllIRbqAp1MO7lJQ+w4RUdZPwCIb1yYvojbWNvss3OGGKXVGgcQy/1PP0cGGsloTAghffUb/8f
 1mnzZuDDooSDAzPFeTBmzicmp1H64QCsYd3xXYz8CMhgghsybI5ZPswcgjhTLmV8dqsDnORfOZj
 xFO4kOC6CcXIRFNLCqKOtAAYM8VBqOlu5iL0WeM47dOjyfAenr3QKFJC+1/na6deR7Q1mgIFDL4
 x+edr4isEgzEewJPXuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.  Note that there is another part of code using "np"
variable, so scoped loop should not shadow it.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 drivers/cpufreq/s5pv210-cpufreq.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/s5pv210-cpufreq.c b/drivers/cpufreq/s5pv210-cpufreq.c
index ba8a1c96427a..e64e84e1ee79 100644
--- a/drivers/cpufreq/s5pv210-cpufreq.c
+++ b/drivers/cpufreq/s5pv210-cpufreq.c
@@ -629,19 +629,17 @@ static int s5pv210_cpufreq_probe(struct platform_device *pdev)
 		goto err_clock;
 	}
 
-	for_each_compatible_node(np, NULL, "samsung,s5pv210-dmc") {
-		id = of_alias_get_id(np, "dmc");
+	for_each_compatible_node_scoped(dmc, NULL, "samsung,s5pv210-dmc") {
+		id = of_alias_get_id(dmc, "dmc");
 		if (id < 0 || id >= ARRAY_SIZE(dmc_base)) {
-			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", np);
-			of_node_put(np);
+			dev_err(dev, "failed to get alias of dmc node '%pOFn'\n", dmc);
 			result = id;
 			goto err_clk_base;
 		}
 
-		dmc_base[id] = of_iomap(np, 0);
+		dmc_base[id] = of_iomap(dmc, 0);
 		if (!dmc_base[id]) {
 			dev_err(dev, "failed to map dmc%d registers\n", id);
-			of_node_put(np);
 			result = -EFAULT;
 			goto err_dmc;
 		}

-- 
2.51.0

