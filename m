Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998D531A579
	for <linux-clk@vger.kernel.org>; Mon,  5 Jan 2026 13:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620059; cv=none; b=WzN8L/2FhUXNSh4euca+OaP3OpTa3msn41u8ocsKAenmbgxTJN5RIOvKDCCG4boAoWo9MWGHfE7C8YOpw9XBVLRaWJ5so8iu32Jo1Q8NVyX0/+yU+zielK2BZU7dd6mrK7p22yN8ZCDFFcsqpiF6M4yqUengE/+1vigd9CSiqKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620059; c=relaxed/simple;
	bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q9s5tmGIYh9j4QVjAg1c/eVfumaYxbNO5nSLLavMNcGOJCGpuwgUs+Lehq428A8/STwtxOdqLHfsXEtAvXnAg5wbZVmD174pPyEaPYCVolv/HtMaKZzRsQd894dqiYFqm32/TtKHHc7MgM8O3dovhXny9V6yuzF54d/GWY7KV8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wzusxeg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EKhTowcU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wzusxeg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EKhTowcU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058L3ba3964598
	for <linux-clk@vger.kernel.org>; Mon, 5 Jan 2026 13:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=; b=Wzusxeg4WmRG7v02
	om4vLOvBUPA3EDoYZJ9iXcXPS2v8S7Az8+z51eiEIKaD3e3pqw8HDe2nh+j+UB5u
	YW9MjwNLn+Pob1WUwRvHnII1l5MafkeeMWlOyWOXoFe/4k0oZ4VMn47NfJp+cYha
	5gH7S6keK9vIY6SiedUvWkjKb+1a6gmdu6uybeNzeP45aU5QL1hTSf9wU23npNUX
	q40VKa127d6df+jQ9kIjDTNEyUR10iaOsnlrrQTKRVRbOlzVgAujO5iJhrd6qk3d
	R1Q09CzlyNicuSJE3xz7KwmXEvaHWiO8SlT/oOL9xC0iGT33HpYefi5AwGy9pFWy
	28SzKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd4k9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 13:34:09 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so523307621cf.3
        for <linux-clk@vger.kernel.org>; Mon, 05 Jan 2026 05:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620048; x=1768224848; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=EKhTowcUVovemG3eZTnMDVLWIadOQPIulkoRfgrqb77W6RtVwTi9zJID1N0qaTeDwt
         h4SWeHF+vgExg4Dbp3S6k7Nw3lr7HOFqgAzAV3AIRFQjFfL8CWQ2Ftx75Ed+2BymtofO
         1egzijbbTaMyhKheuujM/ndjhMGK8YE8FM+/AQVeaONCpoG01ZruZfkaBHmH+1EO3Z4a
         SDYLghjeSi3bbcHRtn5hHS+sc+/FGb9lx8b3fb10SD0lJlek8oPJoNh1WJYRCXD+lscQ
         1Gaq2JPXQoijfcP2KbxOmQyhGLqZt7Sc1zFH4rRKui3KNu2B1o7B4QrjGzkm7+GJ22Iw
         bwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620048; x=1768224848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=dWTJd6U+hDJ2yOTTaZOk7if3OTbfKwn5MR1LKNH5q6vi0qdwxwAm7T4Dmeq8YHfR96
         /TXVCjeEcHxxGkBZ8ceF+sOn8ki8ZrtvUvsNq5WTF11vMGRqGu84M+LxLcIgYz6rOnAV
         iaZ1+9TZ7C+gbOWiV+v2Tn7l0wEGYswSSJXQI3sqNDbsySgqXAbPd2iSvsMmNUqDzxrD
         qiq4EY8orQWW75VPEDSHArARdLZLWBKzZzjB1rDZKb39/Y02B+3JF+4SdYbRkGJJhunW
         2/qUq0C17nJeJZRBcUcFIQDbwU1AwBobhJamn9m24LgzxbZTj4lK9CTelJ/Tit3q9Pyb
         mxiw==
X-Forwarded-Encrypted: i=1; AJvYcCX18wWWCVhZ8P8aWaKl9oi8dgTES98wvQ9fce5ncYd9NQmqLujh8rtSC4rgx2Km7IVoUxQyzNbdmKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSUXTy2G7HBQIzhfM5TCO63loZfFDHyE87KTwcAt/WbAoUuqjg
	SQlNew6R9wPbBBtniR5lse3Uz4cSbcuRcJDmU+6XjhHT5hbBZiw5TlWp23im44lcnMB1R61Cwib
	9YUm45NZAqKkckg45q1tkePDC0QlHqDGE3UpGrlaAWpMyijOTCnTjfpVMzF2x72A=
X-Gm-Gg: AY/fxX7hib5y7CWRU9kmGgLMW2BWcAq02xrL7B9BqnhPaz5BB9io3Uz+Y7+o+FpBkZl
	v7oLyKAWxJNpgvy4Z/iEK4aX/vU1OWRkB7T9G9UQiZfBAQ5TA4EWwYcCY6gZ5ULFwCIFJmgIy7P
	nGWiI11/RSsvJGt/j9NtRT1E4AeKff4qUIntILknFep1thvjnBOh66eDtUQGude0QzxloUUlHOI
	9ujcChYv/T/tEbRNjhbiHENmSfS9VDjC3CKQsX38lmyXtjB/XuDWRiOG2cpBsc2KxSIYrnMYxd9
	wt2Mxg+0IRrXgXXP1somh7fKcNRQoYrwDIW7p7TNao2XTFizkBzREHDywZG0djU15Azspj6spli
	GLsvTBYlb8etIVuDFbdFOnPl4igTpJ9Q49A==
X-Received: by 2002:a05:622a:4d8c:b0:4f3:438c:71 with SMTP id d75a77b69052e-4f4abceeb85mr661563641cf.24.1767620047974;
        Mon, 05 Jan 2026 05:34:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzGB7iDD9Dc34skCvnkWegr1EMgcMWUN8Zs68X4MiXBPK0pnhm4pIeeYQbMYY2WcodnLQ9aA==
X-Received: by 2002:a05:622a:4d8c:b0:4f3:438c:71 with SMTP id d75a77b69052e-4f4abceeb85mr661563331cf.24.1767620047535;
        Mon, 05 Jan 2026 05:34:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:43 +0100
Subject: [PATCH 05/11] powerpc/wii: Simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-5-24e99c177164@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW726QXVOxpY6Cf1eIWESXNYXh0Q3/NPkNv0OZ
 wF4D9CxZ82JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9ugAKCRDBN2bmhouD
 14xtD/9vPEF/n0tu89evBWewFseFWj7GeRVpAsfkvET2FYaR9ENsQ/+EDh5zDhWD7jcnxwz6t2i
 Mk6OFDCf7BPw0OjMGz1wLJOjCTrvQKX6ZvWx36hrHdvyv+++7qTZ8vO57vjwq9wRgEBRNbsT5qV
 BBiGbhYpCCW1Nt5BFn64SNAqiBTlSGxIvM76zOuje6GCidQIJw8lfYkjmO15DwyexLZfr23XU8s
 TN9wwAvTywzmfWBoxKdQWuIYnl03SeOZMpL708vbld/Mcxlg0V2V4iVRrddZRBpTHzDAVvAtLwV
 nzpsuyYdyrWJduGngDP5N8cuXrNWdDcSObmufMWdnuWcJ+UJs7vsAwrmN25qW7JPYPAg2Wup51n
 btQeOGFIWI/3qdLVTi9evlyYDq8u8oOb08jfAc/I4wU4q4WMr/VXJS9GktCMVBpqCH3fTeDIJfY
 oaoczt1MPc2LKzxegcRu0/qI1mXCm9lvY/b3pUCEJlnNhmZW92QL1ZC6reNkmZy+333Wa7RiviN
 iHGQpWUpsaebjblBwaMXs3KLVoqtMT1ftF3X0ePz73U2GtXiANj/srXBPjEAcmfnaV+VvALo8/Q
 zJOb3CtZAONsoAtep0t0gaD94HAD/LNVCgZyrPDHz1PTqJO45tgZyK4Py38o5yXN8cSjTEF1MqZ
 DtO198Hl7KS8e/A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: fM8u8WDZ7sis-ivXe8xipFuLH7i-uxTG
X-Proofpoint-GUID: fM8u8WDZ7sis-ivXe8xipFuLH7i-uxTG
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=695bbdd1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uffMIp6nSmQIayL3VFUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfX3UZNsBNJmAO7
 5LwmZPAk2ul3ZTRNKC2N6Krcq8fV5EggczHi2QppBWcwIyNTDVOLaXWNXop2JGCjs43fkbKvuSo
 roQHOtsw5wRTMtGC9VmYyjT8LOIf0UEZ4oqzFyuTjPZyRzZT4jaQxkegWUvDA5TpeL2+uwDpiqI
 zXAUtYNzJTZXoDpLEqexyoFbo/4JDZ0q6GaFYNxSVRLEQMPRPTiK4e8UdXffMtK+HOp0wrXMQ6u
 xu4N5Eu7BsYNxZFT2Pw6I6eHCis7eVTpGVAjK76KNvITH6uJIvF4jxP9ILLD50MbB3IUJ/TNV0p
 uTzn53sLpMp85zCOf2svDZHIqxez8N9fhA1W+wF0TACmW1khYZHLn7WHDqiqtrMjfrL7/8ghKJT
 MZXOTC2stH6TY0l+RHg3wzmwOmawioN4Ax/Nki99uU6nnumsBtFMK7eCBIeXQxWuuO+7imZ2ncF
 aVeJOtQYn/75uO0lgUQ==
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

Depends on the first patch.
---
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index b57e87b0b3ce..1522a8bece29 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -201,11 +201,10 @@ unsigned int hlwd_pic_get_irq(void)
 void __init hlwd_pic_probe(void)
 {
 	struct irq_domain *host;
-	struct device_node *np;
 	const u32 *interrupts;
 	int cascade_virq;
 
-	for_each_compatible_node(np, NULL, "nintendo,hollywood-pic") {
+	for_each_compatible_node_scoped(np, NULL, "nintendo,hollywood-pic") {
 		interrupts = of_get_property(np, "interrupts", NULL);
 		if (interrupts) {
 			host = hlwd_pic_init(np);
@@ -215,7 +214,6 @@ void __init hlwd_pic_probe(void)
 			irq_set_chained_handler(cascade_virq,
 						hlwd_pic_irq_cascade);
 			hlwd_irq_host = host;
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.51.0

