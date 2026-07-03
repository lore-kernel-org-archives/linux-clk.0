Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8472F3CA48E
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073080; cv=none; b=evklw1+TJ6yHfs2QanyT5eJbT1xV7SvViK31RiFl6E4KgCWahRdwTjgyLiXEk4xRl3jBA3mXhEfBEv1ebgXmIbHChtAeAmMAKk6s9PpIi4RLeAN6p/UT94REKYq2Lz62/AWBqafW15lbpn/nS1NwoovKpKfbn1yit5FrfLCVbhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073080; c=relaxed/simple;
	bh=JfjK7thpXbrrPhwyCS15MQlU8HtjezPzY6FlkiPWkv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkIqv+ekiZXiFYpDjJ/9tvwSO73OTZQOOsCHxh0ujCZX3QDdcvjLNPa/3LcFAELwVuvkx+HVMkyx1/PrhtsR4pNI6BlCSTaN8OMv9bODwhpZBACgHsTG8+OU3MEn9PhDbA7R7YiupBf0N0CJMZdVWy368BpamQd2eKr10Ujnfrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCQ6i5m+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TV6nyw85; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCQ6i5m+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TV6nyw85"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZJ13136095
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=; b=KCQ6i5m+buD11unu
	UL2krd/oCWG08il24JR7usMCmWEkPqS2ouzmfGuxwLfYPdpudBgeKqKXezuE1yhh
	3UZ5Q/SG3HKOIrcfGikuFsVovyy7Qe8W+k8u+IcKEIKlmrAgz7LuU4KEf3xOYJGH
	il8VsTslWdv6uAp236kY3JVt5SRUnoD1cFJxuR+ZJ+0ix4fhzOYQ46qrSKIa3cgq
	Sv1FOcU8vKzAuAs04NsSIOWrs/q5h47J14qmJTyJ4K13SbXB1tpSL3jXxBethlZT
	CAYfAPjD0pB2bKS6xeyi7V0U9nly0D7lZ8OQBc0hvvzVmiebRaScc0RFbMcLAzAA
	DE8oXw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b59rjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:04:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efe7db1c42so4634526d6.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073078; x=1783677878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=;
        b=TV6nyw85Dlp2uKJpJBioHg8scNtb7647hWbJ+2ubzkIy/U8ng7iVXG6krSryWOjwoU
         wHYNATifGkzBrP+DP9hyIjiW7uX1fbu+tmlxsAy0fwIu491CXikqLnfOYmXvFG0uSX3a
         hT5SzJURtYTx7+K8rDcJrw0dyCtokpzXiYqPSwM6KJg/nN/GAHe0EkbCKuXvSYwrv19U
         GJkXErA91cIBm7/qKwkgJXzNpp4/Kj+w7qzYWfQeoWC3AMa8Ll4dbocyITPF2kDWSj2q
         e0jrcamV9JqKoWcLetUwvACPk8TqRzCR2ijMs3QaD+JqewpFsIkFhIsTDM5rBRV/4Epz
         q5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073078; x=1783677878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKjHG4tTd9LIUQ+3fOPrSQ/CBSJcIEba4Q8qoWmuJ8g=;
        b=tSVslJmAM8MXuOzYbQpqKBei6zkej3l7+ItVu+ybJ01vpsaY6/BDa8qIBa/Nh6O0jy
         nFRjuRpua48UzFDY2Clo2XisNW04pUv+6kZKXmBLkWqRzwLMlMDiDFoT1TuT3ynHGzJp
         luc7amHL4pRKh7NPJVXHN7lxVwu0T+JuXr8uXmoat8ybMnFXbpHxxqUbuVn8KhyijWIG
         sBszF9a3H1EBa2blIZcHvAjchn8VngDtRfj9wsX51FjTTVW1AckHcy0VgmOCX9RhOFIQ
         3xXABLa1tFruIsg+hP2Q05qgP59zxuKl1uTKdKKl4G7YYwgqpJHrWRVKDPiV+wmRvZI2
         YB7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9UegIfDzKY0igb8tTgM24y1uxDu5i6AdT70Om09Lvq6iLx2+oRRDYy9QG0Ka1XpV907sDlv6K9SK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKZSgJb6v29ZbAmkYex+hEtBkNhVVS3Owds6cLs8PRjO06jPm
	RiEmoSqTO4yXM6a0nRIbbDr/5v9ytdOKZD9LDdpryPe6Xr1Vi/78PbERc3wfR9/KYDh+w+CH+z3
	+W2Z3qkTodGoQlbVyes0vusx0loOcN3W0pY9kWIFnes3k+gOFrbXhfL9/r9iNA2A=
X-Gm-Gg: AfdE7clHUcZtISM5m8x/klBG8zk+xsfAKNhIH/YdGj7IXEBvsMzdxVPabuT3E/WS8aV
	0jiMyzkstTCjRc0Xo6iJlx7+JbOHDzzxldn5XfniWRFg19dGX4AyU20w7kV/JkoskNdQrkyWDz2
	NgJL+os0831HJ4wXCfmKDg8rt5SwxdidmbL0+dISjSwwx4L/dTFuQ/JwkL73bt6/bq1Yzu3h/Vj
	mC/PljR0nCOlrAWuWMyZAeH9bslsCMURcxC4uviynzasAfucyIXVtSc23qA+MCRzk1RFKa0vg2F
	Tc6iBv1+ViPiT84gcTxagjbFPn5v+WLh8uKP1igV0liaON+bycdhHZpOq1oAl550ESHj0/ENmAr
	MTw9Rm5TbPP3xhSeF5F8+oA5i7znyShxxsR4=
X-Received: by 2002:a05:620a:3728:b0:92e:535b:e08b with SMTP id af79cd13be357-92e7825c3a1mr1371755485a.33.1783073077833;
        Fri, 03 Jul 2026 03:04:37 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:92e:535b:e08b with SMTP id af79cd13be357-92e7825c3a1mr1371751185a.33.1783073077438;
        Fri, 03 Jul 2026 03:04:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:05 +0200
Subject: [PATCH v3 7/7] arm64: defconfig: Switch Qualcomm SDM845, SM8150
 and SM8250 drivers to modules
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-7-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JfjK7thpXbrrPhwyCS15MQlU8HtjezPzY6FlkiPWkv4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kZMt7jLn4o66w5NIeZk9JVoDYmTxObv1FAE
 9FEmur20fWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGQAKCRDBN2bmhouD
 1+3/D/4xnT7HVH26U7JwHKu+DT6nNexpYNUtlzH+mx3TnUlFPIe1OBu3TpsqcEOsByGOvpK1Dxe
 Gz+T+5aBYdIdWa8ow/4Zc1qUjdimRlD1LO8bOF7my2IuLgMOGOsPMehV7gq1NNKHJxAGqSXd/eT
 vT+zplbSzspOs9JoENz5QIqEoO50JmVPt1OPilNo8hOeUlTNoVSvnpAm7zC90mqTvtHkHayW2Ze
 5rEJaCi/fx2el3PscSDQ0xp1U13GcOWUUkD1RCiTVE5aDo4Ti10/0Cfdon1UTsnRavq6tWLgmDJ
 yrVrr+xvgJHyo8AgIrpBqArueHLVDhawsmNfVSveYUAtf0w7OB5FFDCo+dUSIDng9iOu+TuxUao
 7+leGAV475j+1u3NiR5CdCZBeDXynl7lU4F+yeTq60naTTQR7CPNIkL4eMDCQZPHVNCyy40Ns5v
 JARP1b+CbjkwqM5ObTVZGfWcBEZESVtlgR7fQUApEN7zg4r5iR40xXzgl7yxE3XbzZVGEeW3vnh
 Q9aOmH3hmtJdorGojX0NB2+hGe8jOjiXuSEtuwq0be/fYg5BbMATlEJf+ChvW4y37jDp2d8LKOK
 7mpHEkS1/wz46axUNwISWXCwnybWUh80cEZOjDpgFpTI+sC0BamdEclbPNPN4ZQCw6SWLz4FaGq
 XmO2PISvBrOJGsw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX7JmkgqsKL4pU
 wMmtLEw9YxeCC+fUFum2IUzXL0XH83sPXa46lDrj9n6suUpqTCvGQUYXEIt6klmf8D2b6H3L/eb
 A2hsW3hHRy7cVPW0ZRho6ROStf/yrao=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a478936 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Qd1XWP2DvpO_7if9oiIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 7ilQN9zlugu6hrIXn7hqPK7jOJ6_5wWp
X-Proofpoint-GUID: 7ilQN9zlugu6hrIXn7hqPK7jOJ6_5wWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX19EFZpruYg9T
 iBA7zqoqkntHCx0F7xPadVLfd5+/1GyBuk4qWrivov54Xx6r0ulatbR/8rlpTEQZXEv0mqVkHKd
 Sb3GPEEDRzbvTZP6tgNqCDT+xZU+1JXOTaZXzrMCLH0SdE3DAX7RiHNF/OllGG9gBTHk6iahZ2J
 lc7GXLlVNU9DhKxcQt1xYxLwXwMtfcL0qz1M/4alS4F7ZEo/QrgLIC5JrBsFX6Vn+FLiN5w2Qpp
 ZaJCcqzVbsbWL2itpAQgHaCCvEUmyR1w17sBD1idaKdide1Go+qSEcvydWyzTzDQEp5D7yu72Ho
 LEe8GHU7GQYIhDi3gklMPjP+E1QFi5szt81D//oV1ylSnC5KOQPsVYSPzlHJmvUtAmrEEl3UOFk
 GcAqvthJQV9lfUVfAvrVYKBupnfEQCLHHCI3geL3+xtGU8Nc66ZpraLsCDCXa4pf02S+t8sZymO
 1FTRZBiTKqvvY2FplAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097

Display, GPU and video clock controllers on Qualcomm SDM845, SM8150 and
SM8250 SoCs should not be built-in because they are not necessary for
platform bring-up to shell or even mounting rootfs.  Drop their explicit
selection in defconfig, relying on defaults which makes them modules.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Depends on previous patches.

Changes in v2:
1. Rebase
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9560f0851b2..386a0ad3fe3d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1462,13 +1462,6 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_SDM_GPUCC_845=y
-CONFIG_SDM_VIDEOCC_845=y
-CONFIG_SDM_DISPCC_845=y
-CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_GPUCC_8150=y
-CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m

-- 
2.53.0

