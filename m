Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78213364EB3
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977907; cv=none; b=E3GJTAFqOwZ1x6epRkq/30dLBZLNDzBKJ8OsxJjDfLekJVCrUpbdBYqeyJuIitvjwb2wyhoVafCQnqKuDO9pexBQRr3CYWQDjJehqIX9uzvJghRJqRzxJd9d29ke/upfeDiPxpADtBKmobUA01t1gpDdCRw3JzaIUP9dEQFMs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977907; c=relaxed/simple;
	bh=fbIWwHrmfYrR3vDomTykam7HF7n4jDAXWt4nFKTvi/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PG3ja4+8NPq6wnyKAUgB/a5GdqkU/HeICiFdKbYFXb+iKq2tQxeKLFSnMYimPHAxS7TUoYU8g2dqYGXFUtsXzYL1YhY1l2h9bgiDuEaZaNGBOXzPw2SjUIyQr6varbGOOLXqYwq8vQuItzt/Ozrv/1rJzgclfvuSc9Dwqro0mXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GtbD/J6z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqA3F4qY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GtbD/J6z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqA3F4qY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GUc0x3629109
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 16:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=; b=GtbD/J6zPFKPLpSc
	W6GI+BDhloVRzAm82fy3V2eaXJcl6K8GEi5lZwiV6lsl0gYQu9rlK0PtydFVXzVC
	JFr1WZxyod07PnIh3O6pxGp4VEpAEvEzodGhCQvhRVGxMpezhJCsBwGKXpoaEaDt
	rhrUXarXSEWmGjvEm8A0DcCt5iNs+Ko7y+/YJUdQHOK0H5/zdaTRzViLLQ4bpgs7
	labG+r+na/Wxk8V68ht6ZHyU75O6YSYVDHIzv9wtcZ7Ii9mNGRgSVJPUbEgQlR2y
	Wi27kgWIssIZO7rfFlQS4JaaCBM04mYu3lzUgpnEZu2ttVLcUKL3clBvKDBa5e4r
	4/nRDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjj8j3d81-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 16:58:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c1cffa1f2dso878350285a.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977900; x=1768582700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=;
        b=bqA3F4qYD7aclyaefdqecRdsj5j3Ly14Qm8AcRGyaprk6SY4LGdV4rCFZMjGAZ9gKA
         wxWstZLH+IPqHw/ph/azcJNT5smMxYhYYl2A54X+trGnxEpzjqx6kkebZ//XZZgsFCke
         bK2iJO5RdjdHtRAH6qhx318C6czAK+XySY9oXPjW28KuibPtaZSG5dzQ5AiOZF2cI+VR
         zqwSbI9it1ORLWzoxi/Nw4vNYiacOGFF2WYXgeB0MkRo1n2OHHIbAI+n/qecP+9mL07X
         NKYeNJxtXLO1YQUX3FUSoAyocV/yI5wxcVNp3k0HHV2Xlj0N9BoonZgtAQVnfKJhJi9k
         12Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977900; x=1768582700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GXdWjT260fGUyPDLJnEoIPiY7XHrVeOdDpdi6E4I+ZQ=;
        b=L/ekRwxczOT/potw4TxVu7XhKkwHBuKNONdQXYtf5pgMChiApthCtvxu7EXVY5cgjP
         /qqxvttaS7KKaPErqN7kNVF0qdghtNv1DVx1xy9JEU0GcNsOFv3g27SoDuC5QKVCWJtQ
         8iNc/Oex7amcO2KvvdjxcLz+y7vwHjcDvZhJfgTtNFkCm0abK03TNa2ePtPcCP/P/tYO
         uE0zUbpkOg65LAgIkEyFc/0+n5tswN+fOWQwAgzcGl2gG5kQXtVnDtH8sEn673Hno0A8
         whYMmNQOCun9eOm+twIoqMd9hI7zrDkYDx9xtXZmzU0WOrCCPhS60QjFu2NPib1qw8v+
         jLBA==
X-Forwarded-Encrypted: i=1; AJvYcCXGN2cy2xxFSqPg41kNpAHYCrNW+ogTu4d8bMRSKNF31+wqOImBLLpJMM8i+/FurN9VMMhtY1o06bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+cBO/rHYDKMz00dem/JE4c6+RDL83Cg3Y37UVOlW0dApWmgGe
	VbKCWgxcldexDgt/fffvsgnCiQlotDJPO7Y/t/Dr3EuAuli/LCR7GJ+CqKjmIRACAicWuNS/xzs
	lKtoDTqYLmIHZuEItgD191CBD89UfEcliukk36DhJ4FmL2uQ0fvCSYxaOLJuOSV0=
X-Gm-Gg: AY/fxX509JdtuE0sOeEnb+X+/MhcoLW3Xtddwtp/FJaVMOWgQIV4/vVkUh/YH3loXF9
	ZNWJJOTW0rXJJokYf61yHns3YeM/hx40NAaKgQd7OPEI38s/aQ+vvvFZgsDcTuc9l3Fd+n3pdDn
	DVNgLgixVNQp99p8TD+c/jbDBBcWyDG/5futlFJQkF9JwegBWOK8bKcr/NgAw8RtFMhxOgBkPM+
	x7nJGHLX493WcRGG9oqysiVbisqajaV01zNmk/IcixUywQLnRzU/9KTs+AgJCpE5psxE/Hgcrzv
	vKihxYuZhYkJ0dSYXI9G8iEmSOcq50t+VebWg3RRahl7jiBdglFFcMe5yWbzj48kOZMgSld2Wzf
	VKbtQwa65JjUbCM88Qq/T2xCkWHqHvAe4Yg==
X-Received: by 2002:a05:620a:1a06:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c37f4d721emr1783523085a.11.1767977900120;
        Fri, 09 Jan 2026 08:58:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfx/aTgL387I1S/9aU0ocVMFyV/LqLV/0AqK+x6nzaCXP2E2+pwPoObAcqJpS1Me1ayHGncw==
X-Received: by 2002:a05:620a:1a06:b0:8ac:70cd:8727 with SMTP id af79cd13be357-8c37f4d721emr1783516485a.11.1767977899620;
        Fri, 09 Jan 2026 08:58:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:49 +0100
Subject: [PATCH v3 05/12] powerpc/wii: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-5-c22fa2c0749a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1298;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fbIWwHrmfYrR3vDomTykam7HF7n4jDAXWt4nFKTvi/A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpYTOU+9yDCXvKsPVTAtxi177gAE8GsYE80CyIe
 miqCT3L3HqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWEzlAAKCRDBN2bmhouD
 19wnD/93/HCr8QM4hN7A5FkBlG3ipdhLWJ6+pCbCEODwThDqGymMF5BLDYZ07GFdUN6deKJEzRu
 7dx8cnLlatfCl44Ij2C77df+eM9l9d6pqaWp3LaxMI6ewmFPWYs1DrZBtFZEOWcxc2LxOprbIIs
 3hwaOIU/KhSEf0Oek6tSRXxgaD8Ca2K6h5gnE/wWaGG3ZNcBxYOk/GKxpVPCX1y02nsUKWPZ2zN
 KZpY3GE+jGraCMI2EpxrMd5aXfjRpVWJ13+I1RY+dJ9sqWrxMEKJ9q+FzF+9at7yuU2+fMGaww8
 PgPTMbl40W5CETrBgU0jac0FsduQh1AKvJK8Q/a8sIZdzmP2uXM6twdzJovFuF8cuGF+tge+l4g
 ANnBZUy118+HJsSJeJeHoLiIvfxgASWQAkiFfYa5b/v3n5MqsGkTn3O08A4ltdiTOk3O1XilzFw
 u8bnzX/+kNzlDYX2pVbjczrGeNbdoL6O/zxXyo8VQWLJIhIUwpl0/eYWzW43xjQozUypB3Lcb+y
 pzgUZR87tm64oxcdd+/5A/8T4EDqwUHmZ5bh6pqto/4vxNp2AyOmwjTcr7waICJv6ugTTFgbxRx
 XYaub+a1YdmaWK+jRmK5Fpf5C0nuCQ+xVhMPUVi3QTlV0NXIMKQr6bazB6cbM7asjyrSPkqk961
 hv8kSrk5jZ7Nbnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX+3P2NRCrU+Hm
 QuXu37OTorCwO2CKuehQgJL0iGmMNAeO7clqUxeTi1z26/OQ/84JE281zJlSQEqBianZ2twz+Qx
 rDousYTKSXUnvC7Qlk9d8C5gB7QiU5PBubqrsPtad97kq7kEm5r2rGAUMcyTk6RFdLbhmwutrGr
 /bksrGnECP94usS8JhRbQt9hZAI4IPpQONAa4GooLtpGbiQytXGJb/Kt5AfS81arkunI14x+ZnL
 IQpkps/etSlsnixrrZVepZcU78c8NKQ5kNP2LsxjV7M/Dz6YPOafHUFsNMYSb+ll14AopfcM3zZ
 wBjYZvW1+sr88LhzXICWcu12Zztkpcf7FtCbkbt6XRrrEm8gcpNW1CFldiHMiaonFRjSHibybme
 4nma7/G7Q+cRGDb73fOmuBcyxZOB5JFldY5oU6VMrel/d4yVE66AuZ5MwxCY8D5jmCUon8ezEKc
 7aK0zS6xVTO3MZ7G4rw==
X-Authority-Analysis: v=2.4 cv=JIs2csKb c=1 sm=1 tr=0 ts=696133ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=uffMIp6nSmQIayL3VFUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: cJAqiM3KkILOEzUXWhoUpWR86yebhQ7-
X-Proofpoint-ORIG-GUID: cJAqiM3KkILOEzUXWhoUpWR86yebhQ7-
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

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
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

