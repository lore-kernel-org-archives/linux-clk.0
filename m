Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067453126DA
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 09:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690941; cv=none; b=kKgnHPKCHx1qwg8XG2WDgjP+4Ez5lYIcpQakJrFSbWlzXUGxJUPBhlOfssecYZhxjXuFbqFvBkiCv9qehsOqhPGXiGJen+ys78c0Wop/9N513hk+3gKi4P/nMXcvln9RkdjRfVXw+ZMvBzKp+CXvfIua3vi6+omS3iH8y8X0VDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690941; c=relaxed/simple;
	bh=CcL2dBoqkb70hXswIhn+u0x+0kkWxrj/nvOKr2gseQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jRPHue5kKab4dTYme959ueu2p0ExZTh+z4XMNxWSI00w6RIGZzH4PPf5daDt3E+W1s/OoLLOXTtFcFUURrCCfGnB8HQ7x2tVhjfF5WVphXsx7m7Y/CVYt3cDU/HKqMJ5exnP5G1HCK7JR3pAPTa+ACYuWVonn4G07xIeZzbZSGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt7QpBhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJ+Tcw4B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt7QpBhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJ+Tcw4B"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t2cc3294872
	for <linux-clk@vger.kernel.org>; Tue, 6 Jan 2026 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=; b=Bt7QpBhUM67lRrub
	XnhKKB/sVehI4YaGtZlLkz5hDTDM9DeNSWuXNh0C8tuEs66yE8SE4L2HFkIJ+1r4
	37crvmDEv9n6qX4w3BuxHFL3Dzasr21YsgYjE+V/lOyP1mM5Scr04D7q/OyJDFTv
	EgIvS3g/lGoT60ng1HhzWTJS6DRGyrrmnB8Za3UmCbpP9UHUSE8paeHp1Y1u0Wpb
	eecYByuk2JSYiUhBsTy77Gh0Q7rYypE+bGjOvukgMFk4k0ET/Cydzdfg+yIbvS7m
	X9gfda4OxOHA4zNrxIEzqQU0rjXq1NK8hIwBoXsSyKZJ5QxET8VpcSKtMXeNBNXd
	6H9o2Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 09:15:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8905883e793so19079576d6.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 01:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690938; x=1768295738; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=cJ+Tcw4BuFojabw9qxGnEOFHNiDcvQ3luKIqd5Cg4Wzl0CjTjy2om7CtMs01k/1uZ0
         YaLrqN2RieEOJf7vYUFF7mxWWLnosD/jqbhWeKkVu9iyHMjF5xjeAB3Le8ccXzKlmz9R
         hl93aQyc94CuYgCdVcA/dVn+U8o8hI/rroTiDpl/mHeBjHjVrpGSqQmeaPOQvGqLyCEd
         WvLWaZw1eFYYEGeUk2ot3cuFOToBKBApUosQhygKDSQOC8jSVcnJuxrDQp/N78D5k9ks
         3C6nD9h+NxvCRdimQnX/FyZCk+aJTLaK0A87OPqhhBtwMtuWOsH0mock9A0T/oSSQCfL
         7xtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690938; x=1768295738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jv9UX/vL1VNz1ktXt+fRG2Ciov2t8INtnqmx6plWOIw=;
        b=EYOpWJSL5OI2oiyuz9xrWacj0kt2V9s2DKpw7D/DyIJuEv/zW+d6zZh7YFht9TSIaq
         XaeiWjs+8BRBvPZ7bF7Ioo+CQQskQYO66pAiahtgYZneJxqjP5DXJ4FIpNqzPDyplV8K
         ZBN0BYx4A1c+gn0YSNXgXBOFDiVgdNs7B0VrM5FLElBMH0/cvuT4R+/gQMpnNuEEe7jy
         nfktzSZ8loiUiSfHYPjd2wglW0kPJWg68hop4woEpJp1yCRx0Q8lfkARy+XvB+NUwuAK
         Z7TdPqQr6fkBeKYW3xKN1n7aYFa+914Q2ma0DPgI0uQ2+NVgC1d8OdEdmWJ3En8buyW6
         jlkw==
X-Forwarded-Encrypted: i=1; AJvYcCUu0tmUXA0IXujGqvOqWrnEKZF9arrFxYJ9ekW3iZ+dGamYovrOrP2LFnjY4VC6CAmsun0VWPg8Ztg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTy9L5GYt+C+MIvmq1FWmYDkakX6wwzhQ+kSkiKVKfqEXOZRNR
	ozvHS6/yOoneqrIoytMreOzsod/adfzLO8ZBbbkWDsG/Qa3V5GPCEjyOEifpZt2aW/GgF+YAu+I
	P5H/SsQ16R5DwpC8Q76hczKSZzay2eG/Mrqj1uIXKVSApWfYzvwSEirGuHF5hHq4=
X-Gm-Gg: AY/fxX7OaxJNYCyGT0QIKh8USJ8pjuwkvcChX6MBfmwQimvfCsR/iZdgJuuovWpnot0
	gYVXuEB4CA6HQ8o8jvzlQlE/7UXAvtX8SEguvkhQ0gK8k+vZW2k6fJpD5YGfmunOjScItejhgcM
	Pp3yFt97tNNrpHMY+Tbr324EtUa1peCC22F1ydfhOZzxpcuxZpStaipa1oeYUB0hmyKhnPEVzRo
	rQdfHZeWAll3IAKr6ia4wrJcNv0qH8Vj1N0SUe2XQSnbfUNaq1r+LnQc5udlW2i2CFGx8SQCU98
	RTGCKV6qFj9664XHseCrdL27ZHib6PjhtzpLtGxRzQ7Nh17KjDNWR5Jz0Ya0mwtug96Fcx7+vCM
	FZyZgYld27LK7rS6odWfA5CdwbLJTRJHMfQ==
X-Received: by 2002:a05:622a:588c:b0:4eb:a6c9:e839 with SMTP id d75a77b69052e-4ffa77c0648mr26146671cf.47.1767690938054;
        Tue, 06 Jan 2026 01:15:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjHrSISO5W+RHtbFoxesZK1qbi3BFpaO3DUV/f+DVaCU9q3ACBvIruRc8VJXRXhXWn+bAw1g==
X-Received: by 2002:a05:622a:588c:b0:4eb:a6c9:e839 with SMTP id d75a77b69052e-4ffa77c0648mr26146461cf.47.1767690937572;
        Tue, 06 Jan 2026 01:15:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:15 +0100
Subject: [PATCH v2 05/11] powerpc/wii: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-5-05eb948d91f2@oss.qualcomm.com>
References: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
In-Reply-To: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKkBhQzmnu819Q1j3S59efOSUy8B8frf8Oif
 oFQAFjLyXuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpAAKCRDBN2bmhouD
 1yFFD/oC2ftD9ryyYMAcCvww+JY1z1bD7uWaP5uh6DpPPH76O7rLf8NpHji9WYn3FS9/PeQRqh1
 QgLs2r7YAAG+nbEFuKlb8u5XWcJxalKZsThHBEhmMq/E9c49Zs2f/bm7Z8tGnb8CUbJp6v5TgEZ
 kPhDgH79CQWn8LfXHbXpRKW2xi6Iyg51k8KYVRB/YYRSIwG4mA0jujcBb8iSVPxSg/ScCoC3l4P
 nPn+xtmqDh9NSprtqdFkKQ0sPGNzjqXWy514od6NbTwrPip53myf/RgO2Y3Lo7E5O+UrwXtKBGy
 yPzGvp0MgPbX72kUDCy2i4FOh6PAKWTGD4eUNPkIQtLvIbcOAGrwhQHb2pXUbKTnr64CzSHWnru
 mtUFlUOtgbNGfzogdjslxK8HfRYdV+9YLLYWh5mZIr4i13LSlbSoUfTeECsZByZFXoWWmbI1zRV
 DBwB/2ler64x0rk/oYEBpDXQ0bZECG0Wx68RkRTnpkTQu9s0BdQCVihrXMNXoEF8pMGzMM8ylQT
 3nzvdbVOuIfPuyY+P7M78l2itk6VPF0jKsd5vJ7F49JOGmNFEBT2ceurCdOD0S1XC8uwPmYU6bZ
 +eR/9kV0Zn15DeBOjTgdU4qJKyy1mjkCFv9BD0TRdUDd9TSfgJCFWV72V7YLdumfeyPEDL4/RZd
 iAua0BTHZRiL5Ag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfXx5eX4CYDAhdl
 0qajt9Kx32jc/ZJEoa0LGngXirY54OifrdMU4m2+3BvtfJfYondGae6BGJsYlg/YEaaqbPfG4RY
 2KtRa4aYgrqGp4p/faJ1hXQygOBPb/fhruqt7P2qLohRmX7UhJRfhcFER697KF9ghOFL6TnmJ6w
 hwEaF4zedKBMeVjJzbMz490Ptbx/+FOiySmEzMOODajQmoIce6kScEP+A00x8tynKFLUdJZTA4N
 mFMEXnmF+P8cAv0uQIgl9ITuNZOR+l0XqIlapOcjues3OlrnG7JRAQIhJT3PV2rogXy3CPj+f01
 QgBa6kf9Xmrvi36Ts6Z1ndJXLqezNnY9cQt3cWtC1Zd/7w7fLNsucwzkOf4Vgz0ZI0qolspgFmf
 iy9svwaeQmWbXt3JLj5yJPdaNF+7ULb7ycvK/Iu04OrLXrrPq2ST1++5EcShI/VCno8aabNml4o
 2QfXZgMJ5Z6tAEE/Beg==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uffMIp6nSmQIayL3VFUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: KhMSo-AkXAyeOEj-ikaGOIT8PdgYrSlp
X-Proofpoint-GUID: KhMSo-AkXAyeOEj-ikaGOIT8PdgYrSlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

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

