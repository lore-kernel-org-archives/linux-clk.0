Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC8D36405F
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977899; cv=none; b=IXV4FS9Y3J+PXnfLVIgL2+gC0R1JmrODd1nAH0Nb/fWlhkbuvM/O888G8Yeh38emydFx7D4Yu/CgzKFLLU3Ez3Gc971sHCCwRCtDl4bIlS/SNGSe+UydJ3ZswGEdyx18fY8KG5O/sQxuCzTbOuKEjinwLITMS4BifD1ppwbzpxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977899; c=relaxed/simple;
	bh=abI4vVKZ2V3r6fPoj3rMop+rIaKgyFQ7QmKPzSitsLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TuFcyU4rOEt6U4MxIQJ0zuiGyXpdr/MkA7kZqPWywNBAAQzXvVL6+Z7HauNX2FZYq5d4eDlUC0tBEcqWE5FxDcCaO2vWsaMar3C7+SuP3xgysMwJ92TUwEhs5xpUbRI3gnWVY9FfggWCcmtpQFEpSw/G5QiHh0wBZ2A2/+eiuMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MOl4bzuB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIcu6bIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MOl4bzuB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIcu6bIi"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GUc0t3629109
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 16:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ylUaLBidala1u98n/o6ZCU1ttqISuhXHyYTd1kU9MQ=; b=MOl4bzuBSkWhZR+W
	e45f2dSaxBgBGDuf1HyNyAouMHpD3OPIAKpLdTTQz60siPaIuA46bKvIADDGByRx
	SHQebU8ZwOw6m8f/ZHUK5WY9gT33MeYB8w4VLt82nfVny/c41UlLyTE9BiZ12vUT
	Ecclfxouckb/F0baX9Rh+DGum9cTsDnva7cgykx42OupLEBPUV6g4Eaxqtz0ONC1
	8Dbr5zR3m11HqeMUjULZw94ONdU6kBgkoko3IKxS03bSEbOLjWLiSDPhPZ4ZoXr4
	9Wvmgsr7yzW+VXoN9D884Am/S2z1saGWfAnB/aAtw3F7KCmNXiM5UxF/cxcZiyF2
	j2rm1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3d6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 16:58:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b17194d321so667302285a.0
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977892; x=1768582692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ylUaLBidala1u98n/o6ZCU1ttqISuhXHyYTd1kU9MQ=;
        b=PIcu6bIiUMKDIEwTqO3KZQb2eXAirQWYggJQO5eUDDHtZXqRxPm/NTBCBun4elIXBy
         xmbmi4xqKU5QHNm8SYwMjWsb0Ewz68zaaPBbTibbuZJchVyMOVB4oTPKkjnMUAWdwNAZ
         TW8r+hFg7gtNaWscvMoAZ5cB2OIK6kb8jw6QJ1iVcRmwmnAnpZ1vtym/ksne1yEFA0GP
         QRZAaxddiZBGKcp91kFUqIYoyx2YmZ5ztf495Xv+YPVz5XU1hcoWInbaeRP0cSypF+kO
         TcqFQa4ikJADntiWB2pPiZlBvtZYw0bQJwd1yw5vq/KUMN9S8HeV8q6rQLGeLewlgQIw
         jtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977892; x=1768582692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ylUaLBidala1u98n/o6ZCU1ttqISuhXHyYTd1kU9MQ=;
        b=ivFFrjfYUzRQVosRTQ9fUjPITz23KSxgdY9khxh+hKrIncJwxm08p3PYkimme8I6uZ
         eNVFH02p33zcvdlo+wDTAZkhukiOj7FjuMVOEmqqMrNFNS0g9yxUvmzyR+6NcWYujGS0
         UAc/mxzGokdq9zb7b5dt7ZGeV1LD0sQqCt5odBxnNNkZYXPY+reMpkvRg9jOCPUNJd3g
         JEbnMn1qY3WfBPPOXZdwxTO6v8LDxEbEMExM64wHU5Mqf4aQTeOEqFnjRgbQj1Fg9Zwg
         ILbw0ScOIUsD0jAMZfe1f/dQOjBorBqljuUKIBFoTA5ux2w/8XdhybxklS8AkkdqIfcX
         gMyw==
X-Forwarded-Encrypted: i=1; AJvYcCXypVMiv53ecOheiVXLaZmk3Z/rdYKgHx2N2zUkmUiZrZsCK458Ev+YyKc/I0xoFPAToVL5XWLij7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJpSCXP4sNsDcRGvxvSw4e9b9mJspwqMaLNKy1xu6ms4J/CTV
	U87RJXBjQXeIn2hpV376/Hfdxe3R0UMXXfXpcvv78jFygIBwVJTe+qQsgtDaFvngF08WSM5S4Qc
	MPm6PdpJd5VF5814Fo03IDlneF08mwCIOZEBgmwiv6fo2REA0y+fGkXLAWsR55x8=
X-Gm-Gg: AY/fxX4xXysBX8TEQE6V1EuTVj3k8yhKZwB0vTr7P/3JqAI+m232REcxsX94T6jbHwR
	5yuI1pj5PyK/q0NbydDYKoYbdqIaTiKGp+YqjTpH8K1jLgJj0tUaWiGBzmkoIj7pznUov7y3r/P
	DU2iZG9dymiVbRiV4b3chNNM8ekIcQPKBJ0ysS/YHB6GVuKBD2yJVPzyBYdKyAaWoZWb6EBgmrY
	VIFBGtbcPQ24Hjp8iV491s+F8V1qSgW0uEm5TghNSmKjI07nGSIqiDPhHXCHPz6Olpz9YrWNUnV
	MXfSsUwsQ8ez3siyFAG8+GbJZKNPrSuMaeCpCw9YwNraRuwzJCfjFbWtbjo4ltFPXp0bSkYculT
	R37+9dFCSJKL0QNkGUtnCv6QReaHi+pjJBQ==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr1278316685a.69.1767977892312;
        Fri, 09 Jan 2026 08:58:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPgCL7OXhofKD63yu6CqXzLuabksUOQ8VJV1cad4gN38L8pgj/ln+3O094KFk9sDY/IZdfDQ==
X-Received: by 2002:a05:620a:4708:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c3893e0447mr1278309385a.69.1767977891782;
        Fri, 09 Jan 2026 08:58:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:46 +0100
Subject: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=abI4vVKZ2V3r6fPoj3rMop+rIaKgyFQ7QmKPzSitsLY=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlhM5KjFL+VmtviwKxvhVbScXQzaoAQG4FgEd7/qE93wpepQ
 YkCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpYTOSAAoJEME3ZuaGi4PXbIYP/2FV
 PTcFQgtRjUNhHGjo0i1/wWxp6lecwR2vezt4z0Y7HtRiPAGB4smNbyWnxb6PhoufWzhQiKcUlox
 IyUXaDuNVhHVF0ciy+80/o7qJLkRbmaA9yML3inA7+ttUCdLtumN3GdgznjiWW58InRPVKKAMBr
 74TUOqUoWsPRCCmRFbsV8LarOKHQl43aPrSFKMO4BxOB98Ff7eNGUzxqStCv0HB8Fb4U67sEEB8
 vjH+FPXHfdrWWYClfg96cRQhIm8scSKz4EZiUJGXSy5efSia11pfzkKrAmuHa7W+nvW34l/CbLF
 RmvGPFB6A2wryDmNhLx4C4Y+oCn6X5jJkcFR5yhTHG00wt4LMlKK63a38ZQSGdxNMa08cR+ZA2i
 scypfUltDqxfv0UNGHlBcevq0vbhhwt8LrfS/O9jHzKud05bcUqwtwwRxGge7+RCPLffZkvAuE6
 4V69DEvZ7zJFMPiSc41CHlltPTLCOXE9otxpyh5fAteTLFUkszNovEJAt64t2rirWRemXfelR+V
 6OB8Iiw3vK0kpIuIuxF+cY2dvCUKoMLXA0hSUih2WqLERud1raVcvBW3p8kGiOELMVX21R13DoR
 3WPrQcn8FzQyttIpIj1d5xvibvNczCroHEvxiXjKK4WK1yJ0hBHnSaiBYb8oXHD8b73H+ZEz3b/
 Mbja+
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX5bfo6Jc7IdOE
 I+sFaOx/PRPcoiG8/RpiJtL1700HxjKiVdbRGZgFPs152mhy7GAIGy73a2k3zSAntH4yCrSBns3
 0YAbieP4j2GJu8mXfQfI9EWk57x9sB3YDnci5pxsMD6b3PPoDzqzncKDgzqMfORu5bNGlWNXSau
 JBqErBMzTRGaRyqd2YfXdtZQw7xNfQzpekWkjh6tPqmhRTVd7j8xq8YS27g0J45eVI9Q/5ptKdn
 XSrY69O0m1aA4xXxu6ABTdykiMgAjHQwIR8VN+sSdJF78WGThG5CC62+4skIvk6e2K91JKzy3wA
 97mOQbMRBCLkBxPEcqjuRJH1K7Vmz6rf0+ZcZse+xQWXTf4Bny6BhsEb9AdROzVmmlXikoyBxty
 LNSbQaWQZZ759S+bFsPqIxEf2W8QPYAPTI24t9IkgCYLvnnexP8vs+8zqHwGV/6w7rvRx9A3Wip
 N0VnP83xn3DKXOsCoIQ==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=HKzYjZOG_gvwJIbDKMwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-GUID: ytC7c8bTw9x3dx-Ft2fXRSGyFOkeFpzI
X-Proofpoint-ORIG-GUID: ytC7c8bTw9x3dx-Ft2fXRSGyFOkeFpzI
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

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/arm/mach-at91/pm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-at91/pm.c b/arch/arm/mach-at91/pm.c
index 35058b99069c..68bb4a86cd94 100644
--- a/arch/arm/mach-at91/pm.c
+++ b/arch/arm/mach-at91/pm.c
@@ -982,15 +982,12 @@ static void __init at91_pm_sram_init(void)
 	struct gen_pool *sram_pool;
 	phys_addr_t sram_pbase;
 	unsigned long sram_base;
-	struct device_node *node;
 	struct platform_device *pdev = NULL;
 
-	for_each_compatible_node(node, NULL, "mmio-sram") {
+	for_each_compatible_node_scoped(node, NULL, "mmio-sram") {
 		pdev = of_find_device_by_node(node);
-		if (pdev) {
-			of_node_put(node);
+		if (pdev)
 			break;
-		}
 	}
 
 	if (!pdev) {

-- 
2.51.0

