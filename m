Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC88F364EB2
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977919; cv=none; b=TJ+26Zo48YVgKQJahriWtkyCqRAdp41CLHtsVq34p4NwTBpvwAVHdX42exDt4cumuhct7wrbiT94wkMVIAXusmp8G5V+d77YYZBt/KtpcegPVgJOmzjtZNHDa5eXQFKHMfWH/ufTdAef/MWJvwZ0ribJNLk+Cqij/sDq6CFQvv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977919; c=relaxed/simple;
	bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/EfR1EQpfwZBb6vWKUK0HHZrAaM/QagvmZz1MYTe6ZEebX3xnqYJwN+845/LlgbzGbFy3o5mq6R9gRhTCfC2xkDBnReyule1yURgxx7uANWDsAnjbPS+lzSE5y4NC7eVCNwbBiIQ6ObpuJ8qOXeI6N/ABEmv4HnUtg2ueFHHso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw2aC5Va; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SY4eSbsb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw2aC5Va";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SY4eSbsb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GUc153629109
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 16:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=; b=bw2aC5Vaevcd1ryh
	uLRScVJd87DWUmrA40LMCkcsxHs9m3waqPfan7pxpk6GgRcWkXgbZyKBBJewy4mc
	8hoQ1vxxohXNFijNlFrHk8OXGA/0eQAA4iVRKadwITNauTbs33ODpf72fxDuIdrc
	j96M9/kkJepyhfIrGr9+iDj277g3/eIxWIw7Uo5NFCnERiu9t+yC468YC8pXSltO
	BufnFUaYO6zxBsrLzGdz8GIRZhxHThIJ/GbLvxRHx4fUsRA/iL7QbKmAMCGOoBjs
	vlnVpQbNGySWSaUAqIyte7Glum03G3Ppot/BH0+1Nnoft90P7Mr6af8tRz/Wy4IW
	nkU2aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3d9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 16:58:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b6a9c80038so481533485a.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977911; x=1768582711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=SY4eSbsbMvMOjQ9Du3fK3UKSRZHNa5ugxQxuNzs5KCc43RXzRseaBGdt+C7UAfRcxO
         VHh93YwFaqbUYwh+cVIsy/FJvWrlzpyyDzW4s08nSIEtSdneAkjS9fGrOeONCOTQ181B
         smeT7mpMjjkMBkWFKd76jXqxzjcMs3ShosE+ZNuenOMZNzm6tcy+pbpEGlhFmphgsS+b
         dfYGbBdTJsq2YqjPJ0vRo26nndnq9uvgz7htpMKOP/7DJSPfpMQbkVKwXf6i7g8Qef/e
         XaOB6MSQe8Lqjk/9caI+VgJTQiv8P9p2HPNa3muy9115nvtgcAoGBeiZXQLZutuwllTe
         6/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977911; x=1768582711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ow1+Sylf0/GThA8sV9q6qdIH/jdzl1X0FeZ+BXt7EwU=;
        b=ZM5Osnl5VJk6WsxL1paHVDGZ+HlrI0csKlZgBD5Ak7mEOd3mZkugXFkI1h595bplOU
         VClrlg3eu3JcAc6rxW4oy2vkIJUa0Uqy8JN/nV99s1brJpuLSWbsh2pll4P2xysR2XuK
         cjYUXXIs9fmfsoJn0iT8JrzV/QhcTrQeVGG+00fZ2pHX4qV60N7L35jUhCXPAqKIuWk+
         q7jY/Wmy7IBGMLALz9h2KY9fv8nArrtPPKO+s+fZRGD6gtWq/aGHVGfFyQP9i3Kxdy5b
         gknZYnr+igoQjyIjjUKSoXeiVpuEmoBk1XJdcEDofq93GHX7kZn1F2WhTbNWDq9UjD8/
         jfPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/NZG4r/F2Qn+oDb3AWklhHkv3Vhj28yDF20EYMd7Cld/LNSMrtgUIV/6hMi8d970p9s+Q22esc08=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMJCIDSbNym4FTSDblHXp6V1ymeSiVqBF0tMeo/B5yo4vIbbw
	4KhzyddmRNPLYl44coL/cBAbxkMySxxkn4n1zXsONKYlttq6AZA+6L738EOwN8W3TCZ9bpS1VTG
	3mW6J288/aEVnNwL62WP+YoILUhbi+CWQpoIeRgs+b+fkhcimXah0m+H/dKXnK0A=
X-Gm-Gg: AY/fxX7MhuK2L0brTOuoPdFbwLQVldy5RPEEXTrGjaW1Fs0nFkDmjV8X0vQm35seW/D
	LErxbDy4nKGxmII5bfSrdiwu4enAHe3HWFHVIXIl07Tzj7/ybzia7P0ILuSheGQD6zHXmQF82zk
	c4zM9YDoGwMYOiXkNcy43HUBDcqYWIKH83C8VrJbEl3sJA37ZL4wq+MKtS11VFWUgl9e5KJLVw3
	xrWbkrYoW3BBXxc3j/URWwYzVwQYYFxA7ujzQ1Xp0nUSvNm5V2CoDb2zl+30P3SOo8FvOZnWuMX
	evPih/URGrnkcnK4+4DoTOY869wyC2Ll8XyyXIRSnm1CGNnwpNmvM27DhO52Jp6lE1uK3ygLN3M
	+SOM8l297k3NWdbvcQKJ4c6rCOhmPhYmphw==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424672285a.73.1767977911301;
        Fri, 09 Jan 2026 08:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEagzIp+psjVuVk3GVMCLnSaVXjxxAaX3Szhc6w4avTMmKqAquuUCbyZR4B9aXL0lO+SjkmzA==
X-Received: by 2002:a05:620a:31a4:b0:8b2:9a8a:118b with SMTP id af79cd13be357-8c3893ee38emr1424664785a.73.1767977910752;
        Fri, 09 Jan 2026 08:58:30 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:53 +0100
Subject: [PATCH v3 09/12] clk: imx: imx31: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-9-c22fa2c0749a@oss.qualcomm.com>
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
        Frank Li <Frank.Li@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uyp3c+ZcOw7zIw42zFp5/g9Wh9eWtjdFSWod2VZLRvk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOYPsGxvbeXsQGj23rJ/C/cCYfiZObAB9ixz
 y53oRvcWfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzmAAKCRDBN2bmhouD
 11quD/932ltOa1s5tv7DudKIHF/1ebbW/6MsuD85b7MWtuPg8Ls//bcv8pKK2ldqRl0TTVl8PkE
 ymOrPYPnkMOZ0U9NghNrj6KVF4exeUKx90kH9QNCtz+HIZj1nJxO0FP4sAeusOxe6LC0XrIZIgV
 t3AG7s68MxFbVkr5P5MZWLUEqHSyz9ZPyXHNFZ94LoQ7nkL0OsIZ/eFD2njaVT1fP3AysNNBx2X
 nCgqMQaEuqrrH0p1fZir1tlD31Jcd7sExD5GCAdljD6E0uZpm8xNDlJlWECzk2Dw5Ap3COM+KYn
 e3zK6tgBgEPPZ79RFbRXCQWkuIDeyGMDek+78gSufysu1DMds4kQXEFiPurkbSasHj8KuVA2KW9
 +nolYW3e2wYzPGG5gPHWoiE4CUFSKxy0t36hEQhgMQLZezOD3Cld6uvoW35Vd3m3ycLRErbjfs7
 0vTrDkBhUznPnLA3rEEGgGNBoT2i2rJ4Bsh+ilpoIs4vuaPh3wm24arsSyvlOSA93Gg5fvpEVQM
 zbhxmpeJHsu/YUcSjCtdx3PmTZodhUNm03jj+1Cm733yQFBZLh90bbahZL9OSE0bE96DdNCG7UV
 Uc6hfMZyGk02iLvd/M2xdswLxMksBmEDF0VsW9mDk1UbCL+lLFy8lbJGfwOECeeEF+4EZKw0VJG
 3miz2lZ0KOeMIoA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXxuMoeRMxIJPE
 2ukHb1nh3/aiqt/CKFeEeOIi4ifUivGNvyJDfXaXx/tHpdjMimEW/xfzAcOAkH371OGzHeCDx4o
 Sg3ET4mrChrjxf53u+DOcKhCqAWPVb+mpVjFuL0lXUAEAnrwuQB+soi19MVvEdu/0V54XYWPLB6
 YzZwCdvXvSy1DVuRjCPHbIuMRl4S4WJKYSf4oX7VATpFx1JCa38KZarmQ/EIW8LX20UZubM6y39
 tu5jq8CfS786pwGd5VzgDlUfP0/btDbNFUXQWQOmDUx97lY8+qsQmZGRaxETh9x8C6wGzaQKklb
 FTNtCgGSvJw4L3lRqbmsqge4ZumdEamOifn+B8eoSym96SraU+CKKAYC4NIfh92Ub68I6DMVArm
 PWz5rjZAXEgNh6JB1Eo6xBlKn8ytUGDW8cAGZwrsq96J52/Qg5o5TPJpAmnKmk2cnOHv4II8hmN
 ieTB5Bu3iTdi5f67Oxw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133b7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=i0EeH86SAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RsIb78jGsj8zXbp4E7EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: vXezslPT38R8K1k6HsXsOwYR8fQZxMij
X-Proofpoint-ORIG-GUID: vXezslPT38R8K1k6HsXsOwYR8fQZxMij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Acked-by: Abel Vesa <abelvesa@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

