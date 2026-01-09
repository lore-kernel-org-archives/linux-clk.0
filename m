Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733D83659E3
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977902; cv=none; b=rwT+s7CzkXoAr6gbsrNw78U2CAhWlB2z8s2UF1ZuV0vxY63jVF8P3I+vK0Zp8HadiYq5LhrnHAgTUVESkVuOWbQvdDNrtMufZbbwohHmzP8UN1GjtfRzOyeLIowwzMN3/YQLxtyesBOlRHxSu3XebFssIIma+EBEf9oCxgSG2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977902; c=relaxed/simple;
	bh=T0iguywPlMIlSsxDnFb4fp3zFOJO07SWV8Pm8YIMsCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h15uDdVSoMYinq0x8Kg0DX3rar6Bz+u5QXDr/Pbe8j+081Dpv2reAvLdFEHJUUQEY8em7pB5qED/kXAERPH59XRpI4BxUm1/bRdmVI9iGX/wRFnIe+pe0cqsERXsO4feEuOnI8ip13t/hNzo6Tm/sibGobA4WxpLznWLLTQ3y+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TrKzJhB0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdUoDfog; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TrKzJhB0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdUoDfog"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609B2swG1062748
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 16:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=; b=TrKzJhB0BPjVRZA5
	9HXeD+qqFANtO5FgzcPUflJJjsJPmL+iJaZopRqfyCmZ0dq0S/5iw14XtqHrOVgM
	4MO4vkkaBoarumcKSw5Se5ySi39PhjzujAkIjNf6M4uC/iH2NeGQWYZBPqgu5Axj
	6Jzyu6+djq56Q6do6Igt7/aNaLpBSvENldQireaPsTCDbDt4T+H0hHoB6jJt4Ucs
	CUn9EDyjfO7I0WpuJ3hezEvLPhB3lNfAGjRLsPX+bRz6/MoDRCWK3PYnff+6X4/s
	NZhrDeHnw4NdZhSkx595XpdxqPSfHy+/9h+vc0cnmB9eoTjX5fy12uMpe0V5g6o8
	wreOxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk0f690a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 16:58:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1d8f56e24so1105162385a.2
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977897; x=1768582697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=PdUoDfogeHPZJmJigoZJC5ehXsonVxyFBouPuESLOQwSyOLfl3zzmHHJmYDrNnC1Ta
         dWkheP8MpuFFJASaY7p06tH4VoIaawNfxmN331wfOdtTYg5GMYCPvfPdc+Una5mtJkt1
         C/0qH+GCvoUgXO3th4TsqhEhV3dX98G9R+Qnk4tT/Oi7FrJbPjbijHhQ6t693QlLlLLo
         F3XOsQ0yzj57UNsVG2/0eXHQxlqj8rQyLililXqPUsafFrVB9xfKcGQUUd2ta9OMwtxF
         OVW6KGYr9I/XZlmr81fL9rK+mhiB22K0m/HzlJSICqFajcFb3W43QA6hf4CSAD4Edozt
         zcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977897; x=1768582697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZY43g8OUARiRqY7R9ml/55ZrYNP5JqsZS+eT8CaDSWc=;
        b=lWpReUUV6joqevo2UdlWZ8rD9VRm6bEloICg6oDhS7LCpWe2ZiGtslJRSkVgjwe7C6
         EjT0nDqafeoPpVb57RYZ3j7qL80R6SlgZBJlkarBVijAb4dNtICoPrOO1lwlmwquCKIk
         yBn8grDYYGi13sL7Tf6qBHAyCQc8NDupA/+bL8YoVZxk9NjuAKpO/fPozg3DiWWzK/Ej
         ubRyaK8Hy1zexmmr+MCKlhntJqV9fBVJySw9ufVJXPzyvWaBH0Sfu8tTrGj1OMYbJhi/
         7bxUSWYHG2PQmNRG+SKko5muF6gfrxNpiupUJgrCXPLes13C2Rkb8uBWTnWVYBHHnWm+
         naeg==
X-Forwarded-Encrypted: i=1; AJvYcCVjvjRbocJc9BAGx+6QrSvDg8rbvly1F26AMy0Z3xegDj2zPjWbfIT99g9HAO0hd00F7bEicGy6geA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzml6yG9+RN5RP/39vluhNeNmYS3tci9icYY+T0avBzFhWs+Vdi
	Nh/rkwBzsgKglMyM3FIgptCXid8RbuiKDOYhi3EwnIgsgkSpkzQ9zhkpR398yHs+EA6Tt3A2Uu0
	zKuqALFrgfts1ZMKV1olwlobiAVRJe2vpfUCaqN/V+rhNW4qlBrGhZTj1ALbsRo4=
X-Gm-Gg: AY/fxX4loYbIpiyB8U9Ut5Hic6PvJvLraTuWCoQ5Ac+svlYzRNpH/VgPLVjOK67Xdnj
	HpOaWj9yuhbURDULjKzSLNvDujuLeAHBvxnQED8aCNZNQ/FsOFtLdWtdm8pKfxnA0yf89ZdfyRm
	fTPrjp2Ch+CNC9R+SWlXtt9HuAxQH3JdMhCQ5p76wDNJi2Kx2E9Hbni58VGyzLE+H5/rq63HL8T
	HfeSpfZMQC73o4Bs18jC2YsbvFFRjuaBVl8cEBeK996Nihzc/vDlQgRHnq58xj4uQjyNw38GPIu
	VbZMhlLNiy35m0XyVRYGyjDjdiCyU6Y0oQMGKzmoSAznLUv+Hq7CL7sL7dMNtSxJuW6R37ILQ6n
	+pWNpyxUmPW5/kJyZOTTfxhAn0oBdVpBHVg==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435772685a.40.1767977897597;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFg16z7KscX7Y9jM28Hrz2EGd5LC+7ZiK/jAqogZOUQ1S1l+udCeLhRKjK2FRyHwECsbjsA==
X-Received: by 2002:a05:620a:4626:b0:8bb:7dd8:1922 with SMTP id af79cd13be357-8c38939d234mr1435769085a.40.1767977897126;
        Fri, 09 Jan 2026 08:58:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:48 +0100
Subject: [PATCH v3 04/12] powerpc/fsp2: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-4-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T0iguywPlMIlSsxDnFb4fp3zFOJO07SWV8Pm8YIMsCU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOTq4JLeP1qeYnJbbJLJHoPa3XUUF+q1l3Qm
 yHiiBECvReJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzkwAKCRDBN2bmhouD
 15CdD/9iKcwGZWr1TPTh1N8VgCg7pZ1MqIHopwRh10bIppgFfKknY9qqEgNJPMZtoa7VsQyBmMv
 oKYS4n2YHL3iPteJQF23gA4VqXj3G9RMN534g7OIvdOY1VJGEBQSl+S/zcv9CHL3/AM+Wgmr+GL
 SXGJvW8MORgp/6Fa4q/5EmRaJC7kuOFxfahl8sPf7WPKy8mPBpKzNEjyl6rH5IE3q8LDjHRMKie
 9pr788DrA4sTL3SEHINAg/agHf6qEM/IdmpIdrnGJMPbgQ/K48mKbcUFljA90vB9RbjDVdnQ+CB
 y4A+2bS9CVv/G8PivbgPctgYy7jtlcVbrNDTl9i9dKYHRchMdVRI7WiEIKPkbvC+v/9T32y9Yy4
 kYCl8DoUvqCJnfzIpCLnSy5EjuSlwV0LaR2d3KpFeQ6GcsUbpXWB4IeXGck635nvlBKutve/vVl
 Me/ZHK20+Or5+fP7foZ0RyVore8ucmE2QIScRBzh4+NBll1cn0luUyCMBl6u4UpbPf+EhK/D5nh
 y/wYpkFV76Bk1oPhj3d0HC5KQ5DX8TKVBFNz3PV5wq1PP2+qTXHFWjv0g3pn8lno5WN0520upkd
 vo0VjbpyCbLmimtcJE8uP+nLHpKnR5WjDlttXt/x0SfIUhk4GEeaUAgHStwNI/UeGDcgWnbYFF0
 L0NEdtwx5ztHplw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=P803RyAu c=1 sm=1 tr=0 ts=696133aa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=bRA1xQHzFO3ZoMUYUbgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfXz3WxUkZ9ZoRY
 gMZaBuIuio9YA+YlnB9XJ+E8ml8aAsYZaVoargNphcGYwZk282mv5d0yXmDtrdhzqXHlNb8hLBD
 upP51qpH1JhW0mQRPY31yduJsspq06JxhJp1jC8a0456Bj7P1ME+AipUgyOZ05soVlwoCiuWsUH
 mKv0B8do4e9zKuh6dZccaZPshib5l5p6WJacD0vnK6xhZMEOHOonY7MgBaCvpZvhraZEKsN8Nwo
 Sf4+IWzzcUXbzgkRPBXV4WGOmd+GGt1R/nF/0neCwpkFzmxWipYYdn+ro36s3iPuq/XwqIw4VqK
 PLSuShoJvKeQBeNJbajuANGM71fSwsSCQVjJALzUzvRdgE6oLzzx9YM75iAXkw6ykOW5p3kHPJo
 C3eG9oWy0dx3OBP5wAU1edlRLPUiWiD5fmaVsm/fLrSk6rx4d4DRxHOvX+NemhiRR4XWm6jYLYc
 oCxBga31I4EVRDaEqBw==
X-Proofpoint-GUID: L67U5UkVBt1lYFAaEB9B0N1kd--99tUC
X-Proofpoint-ORIG-GUID: L67U5UkVBt1lYFAaEB9B0N1kd--99tUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Depends on the first patch.
---
 arch/powerpc/platforms/44x/fsp2.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/44x/fsp2.c b/arch/powerpc/platforms/44x/fsp2.c
index f6b8d02e08b0..b06d9220844c 100644
--- a/arch/powerpc/platforms/44x/fsp2.c
+++ b/arch/powerpc/platforms/44x/fsp2.c
@@ -199,16 +199,14 @@ static irqreturn_t rst_wrn_handler(int irq, void *data) {
 
 static void __init node_irq_request(const char *compat, irq_handler_t errirq_handler)
 {
-	struct device_node *np;
 	unsigned int irq;
 	int32_t rc;
 
-	for_each_compatible_node(np, NULL, compat) {
+	for_each_compatible_node_scoped(np, NULL, compat) {
 		irq = irq_of_parse_and_map(np, 0);
 		if (!irq) {
 			pr_err("device tree node %pOFn is missing a interrupt",
 			      np);
-			of_node_put(np);
 			return;
 		}
 
@@ -216,7 +214,6 @@ static void __init node_irq_request(const char *compat, irq_handler_t errirq_han
 		if (rc) {
 			pr_err("fsp_of_probe: request_irq failed: np=%pOF rc=%d",
 			      np, rc);
-			of_node_put(np);
 			return;
 		}
 	}

-- 
2.51.0

