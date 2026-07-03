Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD853C8C5E
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073078; cv=none; b=eWR4ga35hCg/osiiTTML8GwfZVxNZ+tbgQ7nRdWAwEtrxzm4enexuncEFZWHIBY564osWKfbcIE5U0PARjgV509Ye2vEL9T+hR6AeMZNfXq+A1awi2DiSn4Qv22blxkKH2RzshNp4/mSHCwJLBTkAwkFtpGr3U18VK8KX1tYR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073078; c=relaxed/simple;
	bh=+1hIpBeCmAYc20Bi2bLoql3Fiufm1gG3G2QDanx3Jug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kp3WHlU/mUjf1DVScrGHae+qFHSiy7ETBRIcrz0CcIb9GbdsS8XhIGJHVygNQNrPlOXBKy/CtU2t0fhZOgP7KE2ZQQXHqaBWJ9aBb33V5lDoF6GRct/59E3iQ5RzxCGanvJKpdjvNVW0/IoPynF2gLkLY8f5Wr8TJoOph3Iqo24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiEVnCLk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eN2oazQZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiEVnCLk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eN2oazQZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rkW83123514
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=; b=eiEVnCLkA1P+QFNX
	Ln1aDmBvU5CJuwjpqdYhsR0WFwSEWssif3H13kkNYnzatV9tl4n32oSdNVBa14B4
	VzraOXpEt2N/2wk6h8pcebSaO3LRy0NDfNj68yuPS9bdgz70/JKnKQMkMamDpbt0
	Uy23maeMmUsDn8n1LGpFbBBhgAHPJvpQzz3PvbHP+FbPE6jMfFzEECPF2FeHHmSi
	RhdzoU94DpGJyO1Fgw+/hPeELbq4DlF/aWBMv2wB7RjQMaxF0uxIVelKHgnZJ+8Z
	m9gB7vdKgWL2P+k7ZJgPoJqR4Zd9g3t5ExoGYhLxLc7hyPPA1qeZQ65qqI2oPf/6
	ffwl0w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpcsft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:04:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92aea0d801dso37186285a.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073075; x=1783677875; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=;
        b=eN2oazQZGUpvgDvqjiouNg9rL08hnfl9R81DKZRghglz9TetWMjG4qlgrir8p8MlPN
         +pdvrzTxtrubpHK6WhtNPA1dbFoglLE++drccjQNBm+Em2VTM3BolsC7fe8iyoltXXMI
         SWRARa2DfeJwpnImQxmOifHnW/aAO1lzGk0IijYwpcFbtFzXlUAymNWsqd0yPAk+mMad
         GiGGR9Nit/N3hU471DN9PjX2RVcmJnkwlf6AVsBRrfv4cmhKB4ifu3RUovZKE58WI6l/
         W19oaMJXJJJcp3lXYI3xBSOswPmvNCLtCfud5pkWXaHRANMIbI7Eeg1fFJUp+y2l+Z64
         iSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073075; x=1783677875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aKmEECCpKZlenl1lu2ey6k/TGjzaNnTRnCbdnwr1j/Y=;
        b=tS6nPrdoJB2ZXfw/HSGFQqNVKsJ4GFB+TypA4DN93/J9oLxhU+WAXBr//i+d9M9QOS
         x/yxsQb7r61REjTlfgkpVXjMaPkLjRxqciHOOh/IDgXJkU3gS3+QnwMjTDKK580X/Z9n
         5iGJf4dwCZn4iaCUXEweCfgPRytHJQmZtVmoxKCaM9XdGfPzAI1JxY/9Ligw43UKIAZl
         gu0L1sqnN8WZXSY4l5lIbHt6+Dyo/OeuQgzTpQnfKHPEaHt5zbHPr1yNUaYEHMNSYtZJ
         J8LN6yk2wySvG1ae//3dXP6QVQnMj/50lorTgsW5CyGk4oK9VYZfag5jzCPgBUlXZ4jG
         OOkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jq6a3uMzst07gtHKj/MsDQE78K4OQHVk0VcYI8uTSX9K7dsjgGI9B/PmilPQpR1rzMVCWRAoRKr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYwjl7JO/EKXcquTCwwGb9cdTvlobRDOSjER9Z9ZGZ8YQ2DJp
	8TAscjyUU3cJXDN3uohUQA5sF3dQif6NjT5FoayAWEabbSXUQQT2QPUwgK3puNZBlcIfF7nMTNz
	D/CuA8CrXr0XwqgXA8K6M/2gI8Gv8C3oadE+PuvxVDc1KGCrTCqG7H7gZGgzYAXw=
X-Gm-Gg: AfdE7cluBUXPLpWOADar/BsG4WqBBvNiv1ehyG89wY18ZCDaWG2vc4BMomuguqAn5ib
	FjM+r/VsiVmcouJ+3uyqkmxyT3sVvG60klORG+5of8k0BT2jV2LIZRYIm0HKZIPukUtMsxIIlxe
	DryOMCrCmyiZtbOmqtG+/V8Iqbv5kMpieQ4+fgxsx9L804dhoPScP4zjNBbzg48oSFrwCO83smV
	NQnQgVdYtBI/kqhx9nWyTC/3T3fUakQEKKSG201TJ/pEcFglRDmg0JpjlCsMzlBcwP5LlYbbIMh
	EpRja4DRARdyhCzUVJxGFwhrZBNrLcmfOKecwltR+JBn81sAJgtFTTP+Aq5oq0ua5cCZKJPapNx
	YCIYulPHhi5VZktYPcNzWf07L2ELdg28W1KQ=
X-Received: by 2002:a05:620a:2852:b0:916:10f6:77c3 with SMTP id af79cd13be357-92e7b05ed64mr1172407785a.28.1783073074961;
        Fri, 03 Jul 2026 03:04:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:916:10f6:77c3 with SMTP id af79cd13be357-92e7b05ed64mr1172402085a.28.1783073074377;
        Fri, 03 Jul 2026 03:04:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 12:04:04 +0200
Subject: [PATCH v3 6/7] ARM/arm64: defconfig: Drop redundant Qualcomm clock
 entries
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-clk-qcom-defaults-v3-6-78894525e54a@oss.qualcomm.com>
References: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
In-Reply-To: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5559;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+1hIpBeCmAYc20Bi2bLoql3Fiufm1gG3G2QDanx3Jug=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kY2vHjRMaOlA2RMcKNnXSECrog7hJNIsm47
 p1o86V2fC6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJGAAKCRDBN2bmhouD
 1zzUEACHLbF2efUMPSHn2ugFPrbd8tvAsCJADCPOZxHl+cVnlNNTz9QXdZyb/dyAG461hAh+l0O
 nxGPlFLOTrvZtSQLtPlG5kj3QiA5mtvAj5/i+4kxOt+naLN907MvLvk9bfdBfupU3IqUBB6oGyP
 pQ/OfGO7UNXLuKRhMEyRiBD5bKrpNfQfld0Q4nrksW1V75jE5DuqJA8CsoCu7/PYzvwipH6Had5
 3FBMB2XHb2trssl06ihdIqgBqu4I6NxdKLRuEm+cQS8LIwK4/vulQAJPHcWCIO3LbAPK61lWrYe
 R4T4XjNlP2rihZ6N7bOsWZzxFB/7e3aaFOgMxKkdrAd3F6P+kg84WemfLSuwDAwxVbOhEQHhHcp
 Luxu0wbyARNsxfsBmj+0CtVBUnXGSFzX9nnpONOv06bM0F2kWXtNRfQTlm6CXmYSj669ZFgsv+6
 NKSjQ+WfrS7gOzk71EMpFJlfUBiakS3y5mIQ3KrUIX+P7BiOdSzfOxMnbtv9i/wAS3q94R3KnEv
 nSarDsvo5piVTfe6FTfaA4u8zQVaheIbldRRY1eKUWFRGrMQf1B1Eaes2asONO38pIhFkaHBNNM
 Yny6fNfzU++yDiZSyp9cX62tmu80Saqe1dy13QWuE9FYouM0IJGOspnbqQn4rHmWtJ36p88whdN
 j1a0bzNug+fejrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX9vE0EPAafAsI
 lp19w8l8TgHS8nBGf9qcrvcX/dVX0F4FrWML12mrpGcdOXJd2BDNU0NmMJuh2IHhzyBAJrApM1G
 VKmYqq5/zD+y8oIlHCBTSJISP5UZ1os=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a478933 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yyKv-1BC-DQKXCkl3jQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX3mEJpF89Sz5G
 fSmwY0ZDp1TrzuHqbdPW4RhV85RP5JQSliH9TdJL32fifRKRZt0wdRISxzE7lmIVMur98XDvVjc
 K8MTOLlZSgUVCJwcRNFv1eY7lAWXkva+uvf4dvcDtU+cENaGElne7etTCwD0Vjxr9BA2AW0os2q
 s8InFfEh7ilkzFRLJnuBvhpvElfUR5R964zw3m/vowHKndvmf8DixuG3v1dmGux3zdxEPjmqlJH
 ho0s/1Xjrl476gmjG/3qOWlguCZ8v1sCoqTqBCc9GbvJp75jFJvOB/Q/K7JzJwXQwjUtGrKJlUg
 6P7SxUvb5zN86ToIw5Im8YS8V357hb0BoiMb/E3Vy8+B9Ruxqni4G/lhUfqQRiQZsVj5MEkD0KN
 cFQncegThX8nlW/6o0ClaZNK37gwSIWi60pw0vTRddlNJFpz8X0L+6T2nt9SXvqVdTMy8JNyoCS
 zBVIs6qUDdIMIzCfXNg==
X-Proofpoint-ORIG-GUID: MqVa1fStlQyaZ_yK9iKNTE7Gm-1eir3V
X-Proofpoint-GUID: MqVa1fStlQyaZ_yK9iKNTE7Gm-1eir3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030097

Drop all drivers from defconfig which have defaults in Kconfig.  Drop
also MDM_LCC_9615 which is gone since commit bac4675a4d1b ("clk: qcom:
drop lcc-mdm9615 in favour of lcc-msm8960").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on clock patches - this can wait a cycle.

Changes in v2:
1. New patch (split from previous)
---
 arch/arm/configs/multi_v7_defconfig |   9 ---
 arch/arm/configs/qcom_defconfig     |  14 -----
 arch/arm64/configs/defconfig        | 112 ------------------------------------
 3 files changed, 135 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 6131cec01b0c..a0067d2280d4 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1100,15 +1100,6 @@ CONFIG_COMMON_CLK_S2MPS11=m
 CONFIG_CLK_TWL=m
 CONFIG_CLK_RASPBERRYPI=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_RPM=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_APQ_MMCC_8084=y
-CONFIG_MSM_GCC_8660=y
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_MMCC_8960=y
-CONFIG_MSM_MMCC_8974=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=y
 CONFIG_HWSPINLOCK_QCOM=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 03309b89ea4c..5316126fb41e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -205,20 +205,6 @@ CONFIG_DMADEVICES=y
 CONFIG_QCOM_BAM_DMA=y
 CONFIG_STAGING=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A7PLL=y
-CONFIG_QCOM_CLK_APCS_SDX55=y
-CONFIG_QCOM_CLK_RPM=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_APQ_MMCC_8084=y
-CONFIG_IPQ_GCC_4019=y
-CONFIG_IPQ_LCC_806X=y
-CONFIG_MSM_GCC_8660=y
-CONFIG_MSM_LCC_8960=y
-CONFIG_MDM_LCC_9615=y
-CONFIG_MSM_MMCC_8960=y
-CONFIG_MSM_MMCC_8974=y
-CONFIG_SDX_GCC_55=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_MAILBOX=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..c9560f0851b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1462,126 +1462,14 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_CLK_ELIZA_DISPCC=m
-CONFIG_CLK_ELIZA_GCC=y
-CONFIG_CLK_ELIZA_TCSRCC=m
-CONFIG_CLK_GLYMUR_DISPCC=m
-CONFIG_CLK_GLYMUR_GCC=y
-CONFIG_CLK_GLYMUR_TCSRCC=m
-CONFIG_CLK_KAANAPALI_CAMCC=m
-CONFIG_CLK_KAANAPALI_DISPCC=m
-CONFIG_CLK_KAANAPALI_GCC=y
-CONFIG_CLK_KAANAPALI_GPUCC=m
-CONFIG_CLK_KAANAPALI_TCSRCC=m
-CONFIG_CLK_KAANAPALI_VIDEOCC=m
-CONFIG_CLK_X1E80100_CAMCC=m
-CONFIG_CLK_X1E80100_DISPCC=m
-CONFIG_CLK_X1E80100_GCC=y
-CONFIG_CLK_X1E80100_GPUCC=m
-CONFIG_CLK_X1E80100_TCSRCC=y
-CONFIG_CLK_X1P42100_GPUCC=m
-CONFIG_CLK_QCM2290_GPUCC=m
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_APCC_MSM8996=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_CMN_PLL=m
-CONFIG_IPQ_GCC_5018=y
-CONFIG_IPQ_GCC_5210=y
-CONFIG_IPQ_GCC_5332=y
-CONFIG_IPQ_GCC_5424=y
-CONFIG_IPQ_GCC_6018=y
-CONFIG_IPQ_GCC_8074=y
-CONFIG_IPQ_GCC_9574=y
-CONFIG_IPQ_NSSCC_5424=m
-CONFIG_IPQ_NSSCC_9574=m
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_GCC_8953=y
-CONFIG_MSM_MMCC_8994=m
-CONFIG_MSM_GCC_8994=y
-CONFIG_MSM_GCC_8996=y
-CONFIG_MSM_MMCC_8996=m
-CONFIG_MSM_GCC_8998=y
-CONFIG_MSM_MMCC_8998=m
-CONFIG_QCM_GCC_2290=y
-CONFIG_QCM_DISPCC_2290=m
-CONFIG_QCS_DISPCC_615=m
-CONFIG_QCS_CAMCC_615=m
-CONFIG_QCS_GCC_404=y
-CONFIG_SA_CAMCC_8775P=m
-CONFIG_QCS_GCC_8300=y
-CONFIG_QCS_GCC_615=y
-CONFIG_QCS_GPUCC_615=m
-CONFIG_QCS_VIDEOCC_615=m
-CONFIG_SC_CAMCC_7280=m
-CONFIG_SC_CAMCC_8280XP=m
-CONFIG_SA_DISPCC_8775P=m
-CONFIG_SC_DISPCC_7280=m
-CONFIG_SC_DISPCC_8280XP=m
-CONFIG_SA_GCC_8775P=y
-CONFIG_SA_GPUCC_8775P=m
-CONFIG_SC_GCC_7180=y
-CONFIG_SC_GCC_7280=y
-CONFIG_SC_GCC_8180X=y
-CONFIG_SC_GCC_8280XP=y
-CONFIG_SC_GPUCC_7280=m
-CONFIG_SC_GPUCC_8280XP=m
-CONFIG_SC_LPASSCC_8280XP=m
-CONFIG_SC_LPASS_CORECC_7280=m
-CONFIG_SC_VIDEOCC_7280=m
-CONFIG_SDM_CAMCC_845=m
-CONFIG_QDU_GCC_1000=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
-CONFIG_SDM_LPASSCC_845=m
-CONFIG_SDX_GCC_75=y
-CONFIG_SM_CAMCC_6350=m
-CONFIG_SM_CAMCC_MILOS=m
-CONFIG_SM_CAMCC_8250=m
-CONFIG_SM_CAMCC_8550=m
-CONFIG_SM_CAMCC_8650=m
-CONFIG_SM_CAMCC_8750=m
-CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_DISPCC_6350=m
-CONFIG_SM_DISPCC_MILOS=m
-CONFIG_SM_DISPCC_8450=m
-CONFIG_SM_DISPCC_8550=m
-CONFIG_SM_DISPCC_8750=m
-CONFIG_SM_GCC_4450=y
-CONFIG_SM_GCC_6115=y
-CONFIG_SM_GCC_6350=y
-CONFIG_SM_GCC_MILOS=y
-CONFIG_SM_GCC_8350=y
-CONFIG_SM_GCC_8450=y
-CONFIG_SM_GCC_8550=y
-CONFIG_SM_GCC_8650=y
-CONFIG_SM_GCC_8750=y
-CONFIG_SM_GPUCC_6115=m
-CONFIG_SM_GPUCC_6350=m
-CONFIG_SM_GPUCC_MILOS=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_GPUCC_8350=m
-CONFIG_SM_GPUCC_8450=m
-CONFIG_SM_GPUCC_8550=m
-CONFIG_SM_GPUCC_8650=m
-CONFIG_SM_GPUCC_8750=m
-CONFIG_SM_TCSRCC_8550=y
-CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
-CONFIG_SA_VIDEOCC_8775P=m
-CONFIG_SM_VIDEOCC_6350=m
-CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
-CONFIG_SM_VIDEOCC_8550=m
-CONFIG_SM_VIDEOCC_8750=m
 CONFIG_QCOM_HFPLL=y
-CONFIG_CLK_GFM_LPASS_SM8250=m
-CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_EXYNOS_ACPM_CLK=m

-- 
2.53.0

