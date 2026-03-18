Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFA3ACF0F
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832140; cv=none; b=HIQSchBpltzIYtYoV5fOLpcS4OzSm9FS3WDStULN31yRFdgLFCWSBNC+BYtAG605i0uO7eOH21z5hnFJNL1VSN4BaifylxkioFNGS4S6HQKO6uKm/ZJ0fk06Qf/IXnnZGzcaaOtORP8p/O+ZvWC7hYaAsVP0K+PAu8ixVKm9p2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832140; c=relaxed/simple;
	bh=1ljK/bO9o6mZ4HLRc+18Ogbkuf5uNqqxM034sgMWf2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/oyeAgPNvRqHYAVswd1nHzrpE8U07T4U4DYP9GNJ56RAIwEIUTdWjUpER7g/sUDblaYlYBq8LGIyKhjs4FEKs0Mq1QVoJR0qKJpib4c06V91BamWjNp+U8KgOzIrA+LNB1h7B/0iYNUKVQd+HVRaL5QEtO34i514MjjwR3Cg1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdW5sT7a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwpcEn4j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdW5sT7a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwpcEn4j"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAi7pV008810
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=; b=TdW5sT7azmyOXmDa
	YF7IKYmMUXhW1FA/DfvlvKTEiYyKWmsmL7+EUHq2UZQY11wc0wYjwB7Jq8NSmA8y
	Q2eIuEtCbpAjWxMgdAmfO5B1YVbaJN8MB/TRujfEa1TLuvF5WrrTz0CO1zQYDb2Z
	747OGpGQkuBSFGTkWhO9t+DNnoRtOnCe6TPpgZBf6A2GOmY4+ELxOxxgOKR9iosL
	xBYfyWcch1uOykkY66OQFLPJe/i8dS4LpPlreMCQ12W3L1ccgWS9aJwMC+b5EmsP
	8mKuckiOj0reACKzC1hHcQKKJ05CGg4aVBnks4L0PwGaukV/8dpZ9w6mG0ktm5nn
	Y0uZ9A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj502ry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 11:08:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509007aea22so306947321cf.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 04:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832138; x=1774436938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
        b=PwpcEn4jGx7tPju3X2ytrTDTugPnYeMYbhGJQsAztq3r32Pa2Dsts2F8R3eLWBA0nQ
         cb7OhoF1yON4ILtmgD46QNt/eY2+yhhq0m5il1ZpRh9wOC1+ot6ZCqWaReiFFcb+QNuh
         WJw0wwJKUAI7QgwL2pjXo8Dkv61vrGTAGGcIVq7Vbv2tWR11Apd65ft+jV5w8ZWid/B4
         csI7pYbOz2drpf/sZgn0No6zB95iIgJuPPj1pE0k8mWifAIyNVcqHzvhX0z2JvXVD44J
         uZFiNSZAlO6xfdkAODdy6gCSIIyVfWQqt1YZXivr5CyrXUcFT5XO1ySY9DYsKXFVRYcS
         /ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832138; x=1774436938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0PjbE43U45ekaiKlhEpJ+BxmCsrp4DUyy7FOKAt/8M4=;
        b=GRzO4QrhnGFTNf32M4nMQGxpHyUWisz1pa9a5yt0RV2s7mGhev2BGieJsd7/LYGqS6
         +i+Y/DlqChq+MfrxLtDz9SM9EJKORoiobol63O9RkQ/x1EtBuCCG5LFH4us+mVJqgZ3j
         MUyn9lohFuAv3rYag9++DLuyqh5W0ECdU02t2wEcrP1sFyM3MIRisZw0tHzabixat3AZ
         YWCDNCEIY3FwtNEq9Q+OReypLUH3QMiFteHec3jMN14czKLUp2C6LM83xyHO7qlo34UK
         620dCfXwT4/87m9+F2ZvoOPchkFTFSAXSdCXjk9HfExzj9doN6wSpfr3k0fFwNjuVY4O
         Oo2g==
X-Forwarded-Encrypted: i=1; AJvYcCU9o6GzBiag6Uip67jjAHYEsnz1hTjD6khXVL/oEo/stiTyK4pW3GnJa++yV4YSUF1OwNKD/DcTKI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YytLQ/XSFMTcSRcdWYuaWpoQfKRTFmJ3IVvXkpwpwPsrl7ymB3y
	FIITWiQ5Te4BCedqwZDGJ+3YaL7A29OkMnHD5bY77LwKcTaYH9yQuPXFADmHg3pTkmaDmYrJrO1
	lm7b1gxc7D0fStFemIU2YuQj1ecL/h6F41R4qWH9akHR1a9+D/NtDY9Y0fFfGyY0=
X-Gm-Gg: ATEYQzw4JWQuaMFkGhTYOpy5a8Ax40jr+qmxRwCe9eGWaugglqt0s0Nr38rKijW1hZ6
	b4dcs/XSpA5+3oC/Yq4g1UOG8CFskJv9M2FvyNxLeGqxpZ9RxbRZPBjhcmbABhTopWyuGLYO1Mm
	Egrp3NUZBe2LsAokDxRgG+06LUX+MTpaw2bJyGqYZ8j/xAuvheBFtqvt7vqFwMWpeNEZJdnI6hN
	NjlRQfChePljpdfJ/EvbpOpOe8+uHVeVhzrJfW9ocifehGhQejrqhRUXhkRJyUr/tBeIKT9b7d0
	tffmaV2iN+cllr94pRcelCof3l1X9IscjleRU3hOX2A64Py5STXEDQXGgaaQX5ve8bCiYZUwu8w
	lSFmvB99kgsUuhIA32QgsCiW/wz/xoMthGIkQBhKrKyIy
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id d75a77b69052e-50b1479780bmr35543841cf.19.1773832137223;
        Wed, 18 Mar 2026 04:08:57 -0700 (PDT)
X-Received: by 2002:ac8:7f49:0:b0:508:ff9c:b9b6 with SMTP id d75a77b69052e-50b1479780bmr35543471cf.19.1773832136760;
        Wed, 18 Mar 2026 04:08:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:43 +0100
Subject: [PATCH 4/5] clk: qcom: milos: Cleanup redundant header includes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-4-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=880;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1ljK/bO9o6mZ4HLRc+18Ogbkuf5uNqqxM034sgMWf2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe93mjmetZrRPgAsC5Qc+kQAHIvszCOM8P/L
 6mnrmwA8J2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHvQAKCRDBN2bmhouD
 12fMD/9bLyR+bZvWFZSQ/S6LHSPwdk4KMMNlO1F1BzFb+oOME9LshAEoe/gSJ4B4XvSPdXpw3Uk
 oeEiaBPOmOTdkEWzIECpYhuqlLLOaMXqITAG82xydt10Xn+MXTjTZAHVHYy9V7EbE6D6FhYYDha
 hxCV8dGGd3PFoDoY4qZAAqSerC2OmXSQi6pqmaiIirIPLdRerTUUNkf/J11lUp5G/aQVdoNf4/I
 BEyKc2gP7d8Ga+zysmNcKbRNcvmirv+NS9brtDzv6zja5QGrF5PTNmzcjPc6UTOuJOPPiEuNboi
 lxmjQPQkECLjLyaxR5YNrOXzK6CAOTFBaO30OZc1nGVj7f4pGvb3jbGtgjej8pheq7SZzXiOJl6
 lwN3+61POKTFMqFcyu6JDUa5Tz2NEnuw2JsqwjRTqCh4bbXmhl9tT5V9gm0zklhqO7wAIpSYBS4
 9D6R9RG3lQzzhiT4ZyKobMQ++xFUalF6hkkXDyInCJJ7A/Uqu+KU36SDwk4XY0htlAX5E+4+RYe
 +BxGiO+mQl+M8eM+wcSMx2CXEoZj5XDiJm7Y6VXqXCrs1pdy24DO+pA4sXEF020o+YvLmIhqaWp
 xExTZWN5d8fkx7ouLveJpWU1nCA4z6ncvsMMloVwME+tUt947bVeYZsRif6mbniZer5qfN4Fuwq
 0DIUVdrEZ0Z2biQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfX5Wx56ANzkUGF
 AwC4DPA/ezPT/zi0ke+Lgi/HEAvNZHBzZwFMxHGP7RoaWW0rFLm+8kui0TwXcP+Ws4kirui7Bbo
 KrNgLXERypY0kgShW/78KF1DZn+isp/u8SMzTR6r/fGpiI10sHItgsBCbdmx701kOeYuK4aorw1
 ZU3cDC9/zLuYjF3wchU+A+kqspAgXdq8hRvOEVg5Ux9FdOyoXcmTIdq5PGq0p1iVkxZpOup9ika
 hvi36a6aRr7hmKnwdAziwp+dkVWEI4uBk3KhFa0c/lpR+++5fQCAmrX4VuhGV2mrWHUzh5xv8Oq
 SIBUcPRqs5rhXnybGhlD28XgE7k6Mgc+iyIztcIJy76AQ1KjH0XFTln1/Tur/nxWoesBJtaQbNj
 Civjj40JFZmQ3uo3uwsSeKKYnH9fPWLVvCmndb+X4HtMJelriJgVbxkvk+YC/O7Lh8raPZi8eiC
 lCUSi5kK//rT/2JI+vA==
X-Proofpoint-ORIG-GUID: N5W7-N9Y1uxTVsfV_-bB9HXPYOxmBSxu
X-Proofpoint-GUID: N5W7-N9Y1uxTVsfV_-bB9HXPYOxmBSxu
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69ba87ca cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=7lwp6ARP5289FNF9c8EA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094

Remove unused header includes - drivers do not use any clk, OF or
PTR_ERR API, but they need declaration of of_device_id table.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-milos.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-milos.c b/drivers/clk/qcom/dispcc-milos.c
index 339cb1c63ba7..0a483fb6683a 100644
--- a/drivers/clk/qcom/dispcc-milos.c
+++ b/drivers/clk/qcom/dispcc-milos.c
@@ -4,12 +4,10 @@
  * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
  */
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0

