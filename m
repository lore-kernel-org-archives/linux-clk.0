Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1196D313E36
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690945; cv=none; b=dSJUkgAxRv/OwqQmt3epjlt55hZHy4SoLjpi+Z92C5lNjL5AI2mDPHVAADKuqn9GxiaZ7oOO/tQYoBeEEchCBeW45d+RT5zUJvftFu1qTYTOoVwVIbuMH4UkMH6Ym9VHKvDucpiSwbzbAFkh3bS6OJ6xktJHcQhWZywMTozL8hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690945; c=relaxed/simple;
	bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ed+G2v5soTuEvlTsVtvRtoKq8XqiC2XCaS+ITws9xWo1rV9zD5S9kvw31fkMJ0WvzY3GqvgxEDpCgiotgMf1nRFReyMHLQa5gk5iRntv7J0e5N/JWb8il7Jz7BmqOY0LpxIHo+lul3bg1z6PNqoxtYaYteBY0a41OCXnLTehCDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eyH1dS+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rq4Yt+tc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eyH1dS+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rq4Yt+tc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063QYsd3272137
	for <linux-clk@vger.kernel.org>; Tue, 6 Jan 2026 09:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=; b=eyH1dS+OWuLPBbeG
	s6hOZ3gPsINaPKOrfyjBZOYXLnvlD7li5rlELpB7ldxLd9kQ2KYk2Z+zYUHfK5gW
	e5GPW6fTyqXI0escRoH94iGB1zGtMjBZnbRnFOMMvZi47Qd9wlpf0yJWAitw5Eyn
	ylirZ737//9kxEzncgjqxzmIvOcACfLle6eg1DiI+Nuvnp/abfn2Cp+7VMtqibYw
	T+a1EWqQjq5TSHQfZw6x4HRDjrYUVxeJHF9wb8M+Uzwo0TnANx7YEcDmYoDxmk8N
	6w58V4ZY2xDwbsa4QYVIkMT+IWa86zpFI99Q4K2JShlug2NVO3Ww04Shpg4Z64WB
	eJOHuw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv02qfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 09:15:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso16588341cf.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 01:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690940; x=1768295740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=Rq4Yt+tc2zZu/AlhJpBYCujwM1+tG1cO+Zi+TJPotr0Awjvn75+Jv4iKTJ62TsTRVh
         ixdVyOn9HvfPWVPhpu7BC6CvYaM4Lssasl6V3Ujyx6KaV7eBVGnZvM3D9T5VhWZoYtr6
         zaC9Ci0mu3iqsKuQUxPOf21eUPoIxPiBAX13Ot8iblhsOH0kg62DH+d1yzb7CcpkRuUI
         6HQg52za2aIbBTO25dX8+gGv14bxJe8uk7hluKcwV22NKCnHp8cwozY5rJvChLVPI442
         X9sWaUaemcgwCbFoczuJKXpam03CrRoGNk2lgQ7xdmLRyIKUoT2FW7V5kQgK39a9fLtm
         /o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690940; x=1768295740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TVJbv/lv1mJxKEXbFe7HFa6qKPqOIW0YhqRLM00SXEM=;
        b=KAqjFt7ACyPMt/0oLysfOEAJmcR5D6MG/v6XIOH1F/5hWlhrjvpvhPaYdOhF2ylTd2
         3MViMIpC5NuMBHqScCSgYNddztb/xTGDwciEg0Yxcd3plZHX3UlTkWgm5IDmVIthIfDp
         M1173oegzaw0QRqab5NQyTu698meuPyc8JNcJ6oG9qBhe7Qq7v4B0fYDWV36XvrXT+3a
         KkOXysjRHhxiFDGmOPgzrutycxSptDimlDhZsMm4sY0SD5C+4BPlcTX/9aZ4Z1ZcF+72
         nIxVkm3ak3gmrZmd6fGBDN6a928RmKMGyiRj/YPysNEz44HUyjRPyjTcCuKKOmdmoSWQ
         64YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj5ywcATDsv2hmOyD5aeQVpzrQeOcscpCtIzX42trb9nKXTMkTr7Y+PmlI5y909SKsQAdsDl8uVJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwCM8cYJOqGj9fEKjnBPDoJwwiLW2cP0CpQhGYGLql6Qa9hT8k
	ppBDg8V3PdEmpoNuhCjsYUuQKoY0NeDeAzxp9Jvc0I0HRwB6XG/CQL5+GrLU/xcj7/a9JA6LFXv
	2x3EylNUpkiliXzKgztayXPYN/StHzk7eawcnTJy3VfE7XQoev/37J8pmo4QXSSg=
X-Gm-Gg: AY/fxX6XaMOWrw5grUBk/UABfpTcwoIDP8n5IbDd93MU8A1dRgWdLlkqS03K4Mt4NqU
	75xht33QoN4Zrc9ScWhd0E8hr2wFqBPpze1CmXJk0OTh19jlyb9EnV9YVSOom7D04daykkkyaiu
	qvjR7TXOdJ2oeRt9ZVWkJ63VZYnaE9MmMZiIaaCQhwDokC5YYj8I6Ntwtgi6z/PnIhnMG5JGmX5
	5K/X+jZIkfKMIjDSrfUEra66ZnQs7Lf2SmlK/PGErwF87L6cPfcuANTHOhPoEjUZaoMFcWm2Wnr
	szIvygJ4TCEgZS529wA8xhl4em+oObR9AONl6QlA+B1OpZEi/b5lPsn/9yPg1sxi5+83cehSBWa
	/G6hNtShKGf5lZ9E15rwMJMorG5wXLtMbIA==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003841cf.18.1767690940507;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn9FxKXGa2KHpYz+ZQQB4vTjxpZoVrkeL0JR870oJdg4LQQUiHW7/3aZHLy6E81IxKYYFXcA==
X-Received: by 2002:a05:622a:5808:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4ffa76be5acmr30003321cf.18.1767690940057;
        Tue, 06 Jan 2026 01:15:40 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 10:15:16 +0100
Subject: [PATCH v2 06/11] cdx: Simplify with scoped for each OF child loop
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-of-for-each-compatible-scoped-v2-6-05eb948d91f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=etPrXIm2DbWPr0yBMZ1LGq97W5bne6RQqRx/65G5X9g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKlGprAVyAJUtewyF+XMt0Npi5Nw3QQowqDq
 LDolXwelDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSpQAKCRDBN2bmhouD
 1x2bD/9ffIJpL4ZbW/U/j7/3q3tt0Sx4jOdt9UJON5xtLy+81KBOaJWv9oTsWblixcG54IEdSDb
 ky7CLtrOVRm2nsU+I+NZsivbLdkjDaUUYYJ81APzHmE8NPDhiTh1Zl6G+lqyRBDAciyuQmWRs7E
 ba/15aAWk7sWBXMnoydUPhZ15VDFbuKdoCVhGGh89+SlpzqvH93ZbAfMKTExQ6AJ0Bayl24XUcL
 FbEJPOpqJtUYHuZHEkGiAX4yAD53c/uHVRFnAWjHNNeZ64IowWM1AFsZRN2iOWJdR7k7DJ3ds+6
 2Qb+bTqYFQHlnXnreN+NqCM3//8G1U3N70mQbcHVtFHdky/nIN7AbCjrIOupaGoxj7F1vYXeiVJ
 kM2BSyYeiztbDN5XccMSa7lqvsMOIhrgV/6k1j2cxdn3adot66K95rAS0SFrBfPlg/fIrbtTeFK
 rT+cX64PbBE3jYVR5Flq8Q2Dj0SdVyluiX9dsS55YjBMOEGp6nsElIsWQulojsCkVMAlpuW/Y8F
 E1A7pherppgI/uQw8ZNgElbPB3AlJ/xlc9SXmU2OcQwTKB+UoVOn6RBNt9D+MpE5bWw8IhXUt/t
 cgiUVpMoOd1sWskTwc5hQT4lNJafHtAoK7gy8E/OPOx5MlQXiuNUnDTrRv0EZK79EeHYlEtXJBj
 iUssT4/AzCEIFfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695cd2bd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=lBFd75AfmJVjEZM8J80A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Da8C7lYK7vBXmSuFT9tczzV7ptUuiz1q
X-Proofpoint-ORIG-GUID: Da8C7lYK7vBXmSuFT9tczzV7ptUuiz1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX8KMlvknExPHZ
 B6ZCm2UnvaqntdYG2LKujuffA6CHNRPnoXKJss7HRzizm3dRI+U7ltR5xo0PVQd1+nYJT7ahlXR
 xBNe5pFs0UBydMlDxG5PN0MIiHJU5/l0RZFE6j4oyRFSOpFQwHRJCmiYBzMfgBUmUv7iGR5TAqy
 0ebM5nJ2HzE/PlSsQc4cAakruPE43o/ID8njQ8rfCWILJ3FvCCty9tczqKIkjlZWnGGy1/P0q/a
 vtsI+MQy13OyH/tUjVuOG3jSqEDy9/0/sVUZSIVGZfCXmvcwq3hyYDJX3mgCxFLfZYHZ0sySshU
 oYXay2AN67Dvp0hmgVX+cU4on2pJf0ED8VZ8zKoapJeXbAGe9SYoLnIUMGBENqTf+w3NOJZIDZy
 Ax58lmsrxwpgctSzofHsoIGgknt2eZkRNzBbLrkO4Hg8iEVtr3KihWwqMGDQ73eQggLNjjk+0Bd
 79vo040VWQWrixO6djQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

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

