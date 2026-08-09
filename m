Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E743A8724
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260453; cv=none; b=U1KoWE3ndEEG68KuxTMxdH2PH3f1u2nCQ/FnPoCig3Mf/BOsgVe3gE5xiWj3thjslhy1/vOvWNev/ysSFTDJtGoq8OYbmePqbzGHd0dtN6XqHbMvMAozg48NbL6fou2sstNOI/On9DBnfPycRsrYIk5ZwcrJBbEZMK4burwTRkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260453; c=relaxed/simple;
	bh=78s6XYjaxaQgDZldaFYJHZOhjs+wp1TrYwJin4anK94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GxfVW2keTNrpB3GTVR/r6pz9upc3HeXUWsfKZFWCvbHFMbQ/xuEBhQxR7Dmj611A21y59p1oRgSgf5dDqTvqqvMBaeLY8CMil+4Aw1JKHZ/M9RMpFiuJqvG6pZV62RR3p6N9/ic7s1xQoU7o5R54oFWOndDYT/Wa4f9nBns5ybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=autKU8v5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYZ79vHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="autKU8v5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYZ79vHd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795dS8j1904425
	for <linux-clk@vger.kernel.org>; Sun, 9 Aug 2026 07:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=; b=autKU8v5t7h3Onoe
	crVdEXshT1qnnvL+nkxvOGUAw77o2NleiultahUhaYSiJpCPYyyWiee9nsx2tJ5R
	MPZCwHvAy29xf70Vl0Fzu6rRn2kNVc101cShOH6Jou3PPWjM9rbBEb5ZBuyYDLjz
	4WF1CdPpuCTR2/FTFED/hVTZ84wJ+k4om94AM5wliyU8w1J+0G1Sbo91sLxEEkaq
	eQPouvk8/De0O9oWKfoUTn6yptkPMDtKIrF9zY3HJZp59CZUzNLJ163iVKt45DE+
	WW2PeVq7ulWpzAtHMKuCiELB/FbmcTzRXFPDIcYPqGATl2/VyFyZInXyPGTqmUqb
	dT789A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvafkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 07:27:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so709574a12.1
        for <linux-clk@vger.kernel.org>; Sun, 09 Aug 2026 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260450; x=1786865250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=;
        b=AYZ79vHdTxdEGP+SaTOG2MrtAFLDyx+Usvma8HxJJ+SclGwlDV5JMQu8rb9aU9lUKC
         Gd/c8JhIsnBsOlc9K7XstAWGCHFxUXLu2c9haIFECf6RI1FMI6/q95TF2WLP4iYpK1TE
         fKI/B7cBt5UKXPh3OxA5jGnhO71rbwFWDD37us/L2YiqRheLrDMP4djO7op90y0OK0Ql
         ShHau36yKAR4OkPgWadKvVRhPOrVyvCp8LQZ6QFGU2T9KVZEnsZjvouL8d1JmxKo9uJY
         +ibChCjH2M7da9Hjirpsf7UaG/RAiWczuodWGu/h0NE5trAzKCORmoeMgVpRVvQ2B8l/
         V3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260450; x=1786865250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=;
        b=mNu1Sb3EcXanjeFnXCfnHJckaCi4sRyidlTDAYSnyl7qd2iefyQY7Cupv41xUT8t4q
         TTL1t3Me05nzCkHfACYNYojNpY8D7Xlq3AAVn82a+4QDBGOkjErOGcYKUPLeG2qPkYUX
         LvjyUjEnepazZZYMi11BMm0nqxXy00VyY3iXgvqrIJh1FygHoNJ8ig6MKBAWuPxsAeGd
         agIVazAs78BnUAedhT//WUxBwJoxBkCf2nOoGA1SI2j6D1JFQQEtFZ4VLrFsFImwN2cq
         ek7321lLVSVPVxuJbQG908Z7o2+38dVUqh1LL3tpJysyXcaaHyqRw6RZ+7WGvdVBNVkq
         0glA==
X-Forwarded-Encrypted: i=1; AHgh+RqykWGXHrGpsqsln8d43CDBeeKklEeRrRfYp83aYhi8HplytbfIu7XERzge5BMJVlWNWqoH/Zj3wC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwTeEaBpzPdfTZAV0Y4228cVVLzlTNU3AC4yLWPy5VC9LoYuD3
	1st2ike5+bEKHLtR26p5payd16JNsM/YG6ruR4r7CUGWIO/VdeTPYbK3heWZ369gAGdopEu6XDx
	N8zGDd8E0UEE3oFvJJ+dtOwf5MZUxHTnu+XPFGZqpbFwIXPlavs5+lTG/rNDafAU=
X-Gm-Gg: AR+sD100ToxiApFUTZ+huk7aUmFYchotmHRZl2uMMBUkzZ7X0B1bvJkSKu8KtpMKqXf
	e7V/kapz4mhcJr6ghxG26h43eHyLWhxDBvdKsmAeAkijOSttE9G1284dfr8V0QuPnOSNWgQfe92
	WE+cXYwkEUSm4a4j3AiXVBIm9nALy5Px06T4d1YhmR6bakPDaO02HHUPn1Esdju0TfiBcUdtG6w
	GEj0N6/wbhzBM3sPb+1Bn5DYBfraKN7KbPg48j9DNkkb5PUnfKyi3+49xpYXohzBKHYxgMkey0d
	xMmZZGIpFGKfo6WGyYYvE2eW+2WRJYKCncUgtBQhd9XJjzQCgoaQrHIFZf+wWNNTYTAgIIjLFWe
	WpCkNQxMhMd9/ipd5hG77euklPA/fOlNBeuZYPiM5ooZWbcwb+i6gs0dBW6ceW/JXq0uK0wDw5E
	EN1NsD/Q4vBXqLzqS80BJI58E=
X-Received: by 2002:a05:6a21:3946:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cbadc108b1mr26695651637.18.1786260449553;
        Sun, 09 Aug 2026 00:27:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:3946:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cbadc108b1mr26695626637.18.1786260449091;
        Sun, 09 Aug 2026 00:27:29 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:28 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:00 +0530
Subject: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=997;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=78s6XYjaxaQgDZldaFYJHZOhjs+wp1TrYwJin4anK94=;
 b=8nJNzjuVzNRziWXvzxETun4Cbdn7v2ouual9OMd5EyVzJkx5B0BLJEpWzaqu3bxUFdhnuq9wv
 9ksADNvcAOZB2DZJKTEAWJFG4mU29OKjpvnQUCJ+i90LLkVarWXsLJN
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a782be2 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6oL2udKUJD5iSylYoFoA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: yoIpJS8EakpbGTfEnfSsiXt3MBLvd40w
X-Proofpoint-GUID: yoIpJS8EakpbGTfEnfSsiXt3MBLvd40w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfXz4AIEUGgPOVv
 xV1vUISnv9eqSuOpTM0HZb/9sN/Qq0NSnwB3zMGKQZSFXrUYsEEOgEKOSOG/XX64WWqkK62zWHI
 2oztJRmyLLwNBw9sATb8JGSDftw6/CKQIqgL8m8xFA34kJBEvk205klL6882IU+3ELNRjLCHTZv
 8rVpWTqvg5nxaHATzYfpX+PkDFJyINHovVzoir8rrekJI4Fkz3OV7B5cXBTxvoXgnUw29Kpa/63
 Q0/AKAOtXAiv7YsX79s4sWe9PbMGufTMnuCFiOIrnr8tmtq2eqA1Wvr9ugQTtKI6mh/3bABz2qZ
 skhobhsFLkKDp30vOgYo6zUvH9c2SShuGJaPntmKW/8EBzqwk4JKS/UfNaol0KDUMgYqShfSed4
 3M5m5M8LgnbQTxEgsPi7N4psAdHrvJPb7qGdGAPT2fhTUH+QMNBNI203QE7saal3Gw69BwMKtj3
 JWOjHsQjAx5xu+FumSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX3dtboQtZhsvR
 amBriTIZcLJ0uQtTfgUc0DyojPWfh+fKz7c2d3DmpcMlXwKDsvk0Zm1Yw23zU8DO3zNbio+D15C
 5nt9+a9EC1cJ+Gr3MG+qraXw6vkzJ58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090063

Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
hardware.

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART, so this assumption no longer holds.

Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

