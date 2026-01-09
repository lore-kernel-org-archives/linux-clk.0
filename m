Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA43659EA
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 16:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977908; cv=none; b=reLjuiLLhn5pcRF9U10tBbrs2yP/8pL65HrADyIK/pDP76oLxCiOftAXDcOv4SXM7L8hDlKOeEPgWSoS6povxLtosFEj31dZheaQh4qzSXkSWMatoXyF18x1AhnEtUUiu9FjvSpbL3JYBhmat+DRYTh12cN150Q5ToYrBSN03tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977908; c=relaxed/simple;
	bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ER7E0rL37KsCcsK8h/3H5EoARceAKsnpRD8onWjoHLQ6fO1Pn8+kd5o3EuCV7n6xzG3ekO9+nq1lysQqlJALCf9KIxUPo4wEClkaIwgEa8r5pxza90qpnwYc4wYFlGovmxQAZP7cjN4J0kng3pMMH+4/RCeXMOfRkdhv8aQWeqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WlU1ri0i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeBA4BMp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WlU1ri0i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeBA4BMp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609GNi661636939
	for <linux-clk@vger.kernel.org>; Fri, 9 Jan 2026 16:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=WlU1ri0iWmc40W41
	+yFJU0QbrSHlE9jWu8kujGIrwwbbXrxSuxPJvlKoj4NLiTOV2oZW9z+gNP+bdo0z
	m5XaQaz5fjNVAgWZDl1r38AjfaskEol+fOVBSBzrpztFHxQvABY8wW/D9KE8D34Z
	L751B/4CXiVvG7hC4/HAj8Rhp0jtR8djYUIAPYp+nSgnzLDiPi6ci+JGsrka/xqY
	oCJfPg+fNMaY/UJeC7YNrlirdQOmRq+V4ozFVCnNVq0UrcI/+QHcM0nS2jp3VDXT
	ZF9mJOzt80HwMaB9sBjYkqB0Q2IHLkFNFfLKMNu+/mksmHa+T2Pzh8oVnKzrPN8h
	HmBI2A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bk55kr2un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 16:58:24 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890805821c0so108508806d6.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Jan 2026 08:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767977903; x=1768582703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=MeBA4BMp7k7b+zLKEk9FR2v8ef+fHIyayZexk1NMowcUe+TxGHgcwq4IiPWU4mxmJL
         ASQwHTZsy1aogwRio1cYUqf6hmVPNJdUIlqVBjyH/9Ke48yBjU/fjvH8/VI6V3pCkIzn
         0elGMAQDIVAMBN+GPEMm+MnPsE9C0ChrKpWinsoeUL8jTybXFhv9MH7AYgB247BqVJ/8
         uxJLfJLuRbUr3D9Ag/+5wMYql6l3dLoZub4fRQa6YYsUGNB949WhTFCN4i3YhbNGdSFI
         mKkpy41o5l4zTOrTZgRrcOOGPXNG+tALP93SJmbN2jkJpOAbq20JMnpsUqQsENgGXHB+
         onvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977903; x=1768582703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=blrkEZhWvtrPEnQjgo5U4GpHG1GlSdCRqrz8BoXcso6diT26HzxzrFPWtNUnJxv6Hc
         zGQCR5zBbfKtlyIWYhJd8g7hawI33gBqNiaLpCi2pIax3jgboFv9MrFxY5K0pvhZNydG
         2nBVhh9i4ryQ6slKSUOIdIoEB8D/WeFBy2UvfyKhLWjJA9NkoxDPDzenhBfSojHl7Ag+
         EhJPeVT5w7hgpkgm7glrFoMwmH2CJ14Ff6iNx9bigeACma3tSHVgHvc00o87Fz/HVPoA
         8r5ck40X7v0Gk+PixD6VZsOUExza7X/oSZI8FPLjODA8mHmayKDE9EbSqHAVu/nyl5Dy
         1ZVg==
X-Forwarded-Encrypted: i=1; AJvYcCWesBR6GdAQN+arMq0hFN8vcAWXq588zVt/ivxEPmYxLQgFqvGWfG4tDqYwH5p821fnSYie9A3SVdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0i+bzKO8GOYPfcFJmNdVQ5azBpdcyAT/rLZkpg0kQ2Dr45Umr
	ooLVlmNOGvdWv+lXECbX1KcO9ljVB81ki8EMZH4YRDq9ffC/MXIuHLHJD0jsUBDFPgjOCg3xcNV
	/eDgHUmHBzB6OdzSzGvAhOnUDqLIMkWWkkDBJyRnwGy+91rGCvGe6RiDOABW53Ls=
X-Gm-Gg: AY/fxX7trNIzcVgq8luidTTtGg8A6H2DnKoddW8cYG8tnaajKULAHhpAA4H2c8Dt9GN
	sA4xw5/lrRBCC1M/D3zmx+TV0BfrYN2xwrPUKWQr0ma6meVS2S1Fu786VqDza04lRKXcnuLzEHj
	wukHwC7f0VBZjDpkEDwhbd6v1xVpu2OrdBguv63wlaLyDpwh3jX3FYszwjBMio3hDtSyrLdVQEb
	Hmxbv/DLOHfYZEJqomTTBBboLBtdk/NmUnszQQgaTbvQouk45qITlzWj10PnJXB4lW8hNQHEzHy
	ei2lkua5eoojGbKrSNwuYdZA8v0MP//2TG4k4P9QaPhQ2E3GIYJqJJi28wQLDEm69K2omGghDsu
	OviPnKOKTPs4W2dH1Bstux+xtnknhoX4RTw==
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id af79cd13be357-8c38936be22mr1435184485a.8.1767977903027;
        Fri, 09 Jan 2026 08:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErA4IpVIsA+Sdg4ABihyyJ8f7uZZY3fgBUgwNKuKAzxhY6GZ6Dv7hnyicoT9YujsNjruLj4w==
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id af79cd13be357-8c38936be22mr1435179185a.8.1767977902519;
        Fri, 09 Jan 2026 08:58:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm23231784f8f.31.2026.01.09.08.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:58:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 17:57:50 +0100
Subject: [PATCH v3 06/12] cdx: Simplify with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-of-for-each-compatible-scoped-v3-6-c22fa2c0749a@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlhM5Wh01oE3KlsXi1oRCb1ebqBEOJW+lH8G7ztv7v1zkNrv
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpYTOVAAoJEME3ZuaGi4PXv7kP/0jb
 +sneulwBx9dx7PbHub3lGdRzucikXzqpPxwEBwTD8oy+DEhmYBPmN2ELBeXlAV3yA3zxNQQeGgn
 gILtucbXtK+pd9MWYsXD9goHh2aokAQ1WKdq5rqv/BKQNKuWEWHj9nALLxrreu5MIM3CyLMf/75
 FZju/PldbhUYIWNLuBBHvnNQ7UWekhFoc9T3b+lsQsWD3S5/DJpI2+gs6QXftE+GN9ErHHSdmYx
 Jfbit39mvSJR2hPlcjjrNsC5E1Hd2234AHzcPAW64PlZi5fA+olx6o3egjYa7uZRatAuTiyToqc
 E35inBibatbJ2okonvpTmFUtduRaklEFtfQykDNxVGtRDK2At+jQuhhTwV2TsugiT7oDpNyq3do
 zHE4yS1kkwZ162UlE2nRducX6NDZDHPcy/3s9iOEMmy1HhmD1Pb+8YINH5eunx1E7VMLTU7r9w4
 7asY/VydT6D8OwPxVQn9nmPh3xmDXHXJBUQ4YaehsS/R4j8iymLOhai/woh76AgK/9VdxYfiFF6
 d81EpawWPRTxMOQPszdEkiBnuRWHfqwxU/HQUOBZwHbrv5HnuRjKnUEIgJOE1EN3HHIQV/n9dvR
 eOh8jyDFMajmozTKQ5EZFxCbS7N1/3OvjHbC/qFpL64WXCTvwIdZN8wQEA6KgdM4j9M459dGsGx
 vQ+6n
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=cpCWUl4i c=1 sm=1 tr=0 ts=696133b0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: BpJo7tsyKZ7BwOdSs7viCXbnc0OGkcx0
X-Proofpoint-ORIG-GUID: BpJo7tsyKZ7BwOdSs7viCXbnc0OGkcx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyOCBTYWx0ZWRfX4GkKKuox9w78
 LxzNknZVblJDsbAKXzUZFwC7rFYHIaqparEx5ju1/1ZnttXrm1mb79QT9SoqQKYZRzPV+SSuOm5
 LQgszlcKYNKqpFRlpDapW6YZM79ICAJ6PWdJCoJXh/sKikUCZef+AYIppGAfacsMBkbWuf3FBWp
 2Q6xr0Q5QNp/z4OdroE48x5GKO1vOk4+GUYyj9M/2CAnDnfmn9V4AjMeDpnDlSmr8afFGqvwk4I
 vu8n59fkZXnbgtp8ouZ0XGBkHjoyw8mMoIgWAWUpJXOWY2btnX1PBN/4saATSnVOjBiVNbi/+yH
 dfm9m7+aeFEtRH9rHPcXYeEXaXyfX9B8rmf0Ypv+kfdh1fa5DVp0p3ujRXGW7vz1gwyNnH9QbIn
 MpS41ytr+S32upqTU2EIzjeov3uQQB1YA6/soNKqWIx4uI4rgVB34bxdzSoExd+T+jSWuIkppdS
 QfQKqbG/ciVoeJC/UmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090128

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/cdx/cdx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index b39af2f1937f..bbde529aaa93 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
 {
 	struct cdx_controller *cdx;
 	struct platform_device *pd;
-	struct device_node *np;
 	bool val;
 
 	if (kstrtobool(buf, &val) < 0)
@@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
 	cdx_unregister_devices(&cdx_bus_type);
 
 	/* Rescan all the devices */
-	for_each_compatible_node(np, NULL, compat_node_name) {
+	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
 		pd = of_find_device_by_node(np);
 		if (!pd) {
-			of_node_put(np);
 			count = -EINVAL;
 			goto unlock;
 		}

-- 
2.51.0

