Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7DA2D780C
	for <linux-clk@vger.kernel.org>; Tue,  6 Jan 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767690929; cv=none; b=KVGwPttBjAvpNXpIsZDMluT3G/w/KsV+L1NhdsUvdfrmVWlxqhvSIei2+DqJvA7wEeKfzygMH7NyRoyOEgtr66h+P4tiCYJ59uHCJWA1wm0D01lMMprNVwrBK5y71s8XZZEUKYag7iRaMeWmt+Dfh77oPpPDxI+FWWfVXLbzfEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767690929; c=relaxed/simple;
	bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=n/mQfUOeXr1qwJUyiUtoE898rPP4xJIkK8Quo2qTivEK0sr9b44CF4aYhSWrWNRCmncIeV84L9+0uRYG/i+Yb+cgm95MJnN8wMAgj1pJkVQF2LbmEylStQbPGAm+o2VYq6kBQ3JNue5K5+SOyhymjxQrN0oNgYoaIlaS9IDlWCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1bI6WlT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMsrzVNf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1bI6WlT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMsrzVNf"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t4kX3295007
	for <linux-clk@vger.kernel.org>; Tue, 6 Jan 2026 09:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kSJ/eEbuN5yGHUMen9nJkB
	t0F9uVUPS6BNRUD76mvkI=; b=U1bI6WlTVDkpZM8Qhi/PtbYOEir+Rliawjr70l
	3tCpWrNpmA7Fqyn2fatvQsPJnKU3NTLpSOBFexHe7usoAbJs7zcjvxyNhkGjk4vQ
	T7LwPzSdfhTKaFPtZGyEzNbOBqX6zri7+JowmrKoNseH7B+336enRv8QjwbDEBKz
	k+LWUBRcrHU1mDfPLQxYePM6VkvhBT09T/ae30F1OEjayKc/YSWjN0tvHAUW48EB
	Jf9zlO4uelR3/hOxqd1Wm4/90DrRvmymrN7Xy+JpKX2JOX+T+HOb+H/NxJBvRwx7
	QzBb/y8lnroKKEvDqCjP1bFHxPUFKq2VvAP+LmgI5p1f/e5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00dkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 09:15:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso36371001cf.3
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 01:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767690926; x=1768295726; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=eMsrzVNfmhZUHmHuw6JspSfXKjFVVGek4+nYy5Hkil0mhk4JdGGj1YvAvfHdtwH6C4
         c87eRxCK9p3D2qI44soHm5MJpGjSPDlozyYP3KqIm9Kpbwvr0zxC8OXNe8aRR0IVa9V7
         hfSFbKtV91UBJDN2bqqTntPpw9fqLNKVEBX+bh0SWRJ5e3FURiLEgKfq9+mMRUo2Mq/6
         bRikRkodub++SalvvZluGMY4/kmF6hk4xoAPI7a1eN0WVCjvZPps4oFay9dlWvIi2Mn+
         KVYcS0AtDdsOv9OmDRgEIwgqnoje3WGkaJoj6TOZRCCjZxhT1pTDFxYopwx7RLIN+xto
         idUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767690926; x=1768295726;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSJ/eEbuN5yGHUMen9nJkBt0F9uVUPS6BNRUD76mvkI=;
        b=HNacCLk4kAub5sIx1eNcFH2NErHoCT6jKksft5cZ5OIACfCKaPV6IL0qSXQ5YL6r0p
         DNKDmG2g1jzcMJkXQCQlcp+d33baOx3cMK47+cKppqELFe9WmqvVV1FR3EX5UXrfZl2l
         xfGQpcbfclEUyG53zZC+oodqBZrtoO7PVVaCEaslo8ZkBm4Q91A/Ki/Oxu35gyDJYQcB
         5vauRCKwtsWROVkVot+xg+9tehS1Nwerjke4spvAQvkX4Bo4H4xkWkL5C9wWq4sJHszH
         DGD1dbniTSYc26MzCW4aoXByh4AaOIyytHMuQ6GLBmr+TTcgb8je7PYydVyfj2kZkkAY
         1jfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzSflMg10h5BgBS9QRizzTzZQH2C6M0qfHuZyiQVju0vwPMpDPDSD5XEuv5UOdsb6cEWoDAbJkxaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfekss6GOXbrhqzNl3BSPku2JZ4IYQQrBQNPqaUPCPYEffvAWF
	jVzgyC7qeDJTqMYGpmdFdTzss0Gv17+d8xjdPnqbQZONrE/gg/AujB+QQBrqa/8nF4DjK0A5PIz
	h7JSe1Lq43cpYRQWDuodNiSGWDaozU+J1Vmo00XPzXA9qEXO7xREnlIxeF3LbEo0=
X-Gm-Gg: AY/fxX58aD/kxyWSajx9zxgTdT05fO3vQX/ahXpRbmAy44PDRTK4wU4qrY+qijsuvEj
	pU4U3vIAKXaY0xDAB1HrJ0KpwEW3uhD1pEo9wiFbMbIoxem2LbckPfH15X0qNQEK1tZ49rRutLt
	TXAq3lH19RJ85a6Hymcvv+tOLNQ04OTFIHfT2hDVSbN2BAm3VT7h4URY+g8DtkceI25uieU5PkC
	NKMP+3nnRbnTo+nrnNCu46ta8mgniIAwUVmuvgIDM58BcxWE7xrco/wcjWtjpUPLXmfjLXX72gK
	5Jlg9P9DRhY+i0EnBZMpLbnBg39Ff7xIeNPd8BVvSNXAWuFKwZrVF76lDa8v8NFZ6D9p3K8cLJe
	u/YN8/aYFTPw15GqVYUlyx++4RNlfgT0R4g==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813341cf.3.1767690925588;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQYNJNT9XBZBlcoB2R09/O9ycRMo0pJbxtqm9oFSewi0KPlk1loubxpFadTbsB+xmiZjYXsw==
X-Received: by 2002:a05:622a:5a94:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4ffa76d83edmr31813161cf.3.1767690925163;
        Tue, 06 Jan 2026 01:15:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm3271370f8f.43.2026.01.06.01.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:15:24 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 00/11] of/treewide: Simplify with
 for_each_compatible_node_scoped()
Date: Tue, 06 Jan 2026 10:15:10 +0100
Message-Id: <20260106-of-for-each-compatible-scoped-v2-0-05eb948d91f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ7SXGkC/42NTQ6CMBCFr0K6dkhb/oSV9zAsSjvIJECxg0RDu
 LuVE7h5yffy8r1dMAZCFk2yi4AbMfk5gr4kwg5mfiCQiyy01KVUsgDfQ+8DoLEDWD8tZqVuRGD
 rF3Sgr0WXuc4ZXWQiOpaAPb1P/72NPBCvPnzOu0392n/NmwIJOse6tqqqVJnfPHP6fJkxbqc0h
 miP4/gCVMO77tEAAAA=
X-Change-ID: 20260105-of-for-each-compatible-scoped-285b3dbda253
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yRljZXW19bL9W7HE6hwL7lUsKYJt+g5uw13tOylCf70=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXNKgWPkL/X9B0kG2wUAH/3eTCaq2qugcMredJ
 KKTScL1obSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVzSoAAKCRDBN2bmhouD
 1wgND/47Id9EUUTVq2uKIiVZPyo1yp8da485u5W3t4dAchT72VuXV9Y6vKdcBt/nC96bIHsBsrC
 sXK9AmkmkMXhNIEzVw7moTKJHjbihXpyx33M2PaS0Qba02uKGDR/1Z8DS/FsIX+HkXvS4dKFkMr
 M9U9SDZv4zLSbQYtRLWEwWaiphkQyNYMul+NQPQeQb2hahhJS08BCmUTmB0WHo5R2CaAe4VXSsZ
 4/IBx//VTb+nBHW19EZVjY10fCyoJIEs1bbfrdhj8ALft5yhYGyKh91733GlSrOAxYS4VMigtii
 4vwOBDNFUdhWomkQTAucVgvS/jyEYq1ZyDIEkPk73tw7exz3vxxg6MY/Voo/I30IqKvHHKX1my2
 tqpTA7AOCBxVY/w6GDN2yftDSDraeEI3f+5ch55tXZj1gj9PF6V49cXNOPTvzgJFyI142eq++ls
 J1wsXLhBOwMp6iAx6lqV/UcKyJWR3P87F4YaMAKJrkroGFnG/XMc6CKbTMPn1n5DdQbd6frM5po
 //0gqRnPSCROhzjiahO5n1S5KG/nINY2wRqYw+aEyUluPGejKRFfq4q0O6u3MLUpbdTJwKtm4ob
 am//Nbt/BaDCT3Xd9Iv6CF6Yc6Q/MFargCzfOUderUoTTJ9X63w2tyWVn9S7U58fyP7B5ZNfdLN
 /zK2P0SbCUJMIbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA3NyBTYWx0ZWRfX07k3k1cNEc8s
 r15k9Un1A5J/JAUURAb4GfGRnjG0WAPykrGOsnnoouAa0m9rfcQYwVHqz+A6n8RNEd+s1mzUEqp
 o/NBbA9vk1iNhgkdNZkG3oNvIiWVlw7W7qls+dAw63pSX+dkiJMNORgwf6F4O/UvOWn3l0MtNaj
 1C5CNZfiDGQTBYze2MnRK+fqcesWQ0NshEBj4+0ABacgNwZGOftUkurV3k/54I+aUq16J5tGmZm
 lmL39RWcdmKBONggZ+aDgyqydEc0e5i4ez2aj4S7mO26l5/apyEXnZoab+4Nw2IXOqyyWmYqNBL
 d29vaWDQ4ee9LshNK0ueOFDrGWVBhurr2I5Tj89hdn4Kj262in8Sd+s1FO5N80oY3Kye9wRElp3
 jHZzw+2XxfmwGjm8fxPd6J1YVEuv5Uo3OpFsQrDXO4lG4AbwnJriLBW/SpQHfSEpIj1ml3xZbj8
 N/myVmpmuQxqhyI9auQ==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd2ae cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=d9g9ln5aRjr3gUnP3tUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 1uNQPjxBaIkuhO751jdIGzRKS2r688kj
X-Proofpoint-GUID: 1uNQPjxBaIkuhO751jdIGzRKS2r688kj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060077

Dependencies/merging
====================
1. First patch is a prerequisite for entire set, so either everything
   goes via same tree, the further patches wait a cycle or stable tag is
   shared from DT tree.

2. The last media patch depends on my earlier cleanup.

Changes in v2:
- Update also scripts/dtc/dt-extract-compatibles (Rob)
- Collect tags
- Link to v1: https://patch.msgid.link/20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com

Description
===========
Simplify for_each_compatible_node() users with a new helper -
for_each_compatible_node_scoped().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add for_each_compatible_node_scoped() helper
      ARM: at91: Simplify with scoped for each OF child loop
      ARM: exynos: Simplify with scoped for each OF child loop
      powerpc/fsp2: Simplify with scoped for each OF child loop
      powerpc/wii: Simplify with scoped for each OF child loop
      cdx: Simplify with scoped for each OF child loop
      clk: imx: imx27: Simplify with scoped for each OF child loop
      clk: imx: imx31: Simplify with scoped for each OF child loop
      dmaengine: fsl_raid: Simplify with scoped for each OF child loop
      cpufreq: s5pv210: Simplify with scoped for each OF child loop
      media: samsung: exynos4-is: Simplify with scoped for each OF child loop

 .clang-format                                       |  1 +
 arch/arm/mach-at91/pm.c                             |  7 ++-----
 arch/arm/mach-exynos/exynos.c                       |  8 ++------
 arch/powerpc/platforms/44x/fsp2.c                   |  5 +----
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c       |  4 +---
 drivers/cdx/cdx.c                                   |  4 +---
 drivers/clk/imx/clk-imx27.c                         |  7 ++-----
 drivers/clk/imx/clk-imx31.c                         |  7 ++-----
 drivers/cpufreq/s5pv210-cpufreq.c                   | 10 ++++------
 drivers/dma/fsl_raid.c                              |  4 +---
 drivers/media/platform/samsung/exynos4-is/fimc-is.c |  8 +++-----
 include/linux/of.h                                  |  7 +++++++
 scripts/dtc/dt-extract-compatibles                  |  1 +
 13 files changed, 28 insertions(+), 45 deletions(-)
---
base-commit: 4d27ce1b1abefb22e277e715901cc52acdc5af2c
change-id: 20260105-of-for-each-compatible-scoped-285b3dbda253

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

