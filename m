Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3E34071E2
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 04:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784695304; cv=none; b=dAuH5CA1n6AeKoTsyqPl+Y72nslqyrjx0hIPg9QL3OrivIqtpRXwSu1uRzgh31H80xqI+0mEdWtiCwkUiROXYKRLTGXT+EWzhTr7QdbUnDghfvkgeq1Somdt3+1LezzAx8+1ZeqvRy42niHAa2QH/pr7Mxi/pXc80j4gHHv0f9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784695304; c=relaxed/simple;
	bh=H/d+FWyMvcK+pk6HRkkqa+1s+m7pqOiAKJbjNzM7cS4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JY5DT9DbbKDNaQ/cadjr4GxwIzFzKSgYe8lkqhRMWAUG0KHYakr4qcV+7QlVwjjgeCFKD3e9eEypaymSOVfiCbNBk+wQmkXQMkwIhF1ucKMp+88h18VxJ1kdNHodOKETC08qfrLtIgbVWSwRadO9TvxDjIqQ1L+w0UVhzUFvt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2QK2PGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVc2ibjc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2QK2PGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVc2ibjc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CNPs3275569
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 04:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l8XGTYJw6/EGLETEkYeIqQ
	SOPSvLBXC7Looq0wWWPmU=; b=e2QK2PGcxZiEsldrV+aAN6FK2wx8SrO7PgYR6S
	uLcZqy3wrDjnRQbXcv6G9yxrR4kBQ/noFctvhVPLYxOpZLwxF+9cz2z5fc5wdgq1
	8avW3PAhYDms8j2V15lrxbjvY57aase7uHDq3CsPSXvG4dKMS4Ii8nvP6/493Gx8
	6HOe8yvkmXmfbBJ3re504y9xEG0V5/Me6HImcuB29EQN7hhpbqPodWCdWX3Pmct+
	Q31n6W+BcwwnS6STkhhwfjf7O9yxeAPPT2uqpNthOuf9iWtk4yOmQQX/kPAwB2OR
	+5xDOCPdMha4wHubbxccm7lvfURa2wn4vWIsT04GOwtaaMPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aebkx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 04:41:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so5497538a91.0
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 21:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784695300; x=1785300100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l8XGTYJw6/EGLETEkYeIqQSOPSvLBXC7Looq0wWWPmU=;
        b=gVc2ibjcNRcXa+3pMwRWnNgVi41syrr8hFkMLgPaaDle/eAZF7cN45gh7eynIWkfKy
         RVkE/J+NOt/xZejPvy0jZxcOsWbMpvYyJ1S4WtZvfcCCuwKuZ0ee8iCY52CucNapa8jA
         SdBT8K08SYN3ZACBskhXAyGJ0/2UCQEeDugqtng5Fmsx5bzZ6o8kDnH0ZIlz2dUBPR6Q
         8L9idX62KBInnfTt9SVAW8/j0i4+wuZsw3yGxS4gNbQpQmiU4qQfz5Y++15Mg9yQ3N+V
         /l9kcUZP1hQBRMeAeeVsQFH0+R05z4n3JFQZQh92Orw8xPy+PmtVhauX2tJc8oNutIwT
         jKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784695300; x=1785300100;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l8XGTYJw6/EGLETEkYeIqQSOPSvLBXC7Looq0wWWPmU=;
        b=fhg+u3xk4ae6N6WWoKqAYGG+jClFDl9WsGfu8CdUHaLcHRotqYMLrUkmCJhQWSnz0l
         k/zInZJw9JIkhEwbQ1GxMi6jNxBJSQrEdXQYZbvNxdeZ+Iu5McUC3R2CGxiPzeO7Xua+
         UXE9g72L0h9cH6hb9STQ02mTY/JLCMZAv3C2RAHQawY8eSkHX7lEfWC9VPGOEcSnNipH
         lWY/Hl4fLVutkzkBzQ1k1hcDDyAM0Y8iS7F45TuZQypm8znWgKrnjqB0CVhha9rH3XOi
         TXr34ej4B8AurLUZkfjLWwzajs8sIz84lJfguzqLy5ZSbiwb5qg3Z57l7TirR+2AeWPq
         Ateg==
X-Forwarded-Encrypted: i=1; AHgh+RpBjgINliWp9mX768ZinUPSj8J+VwfMzQ6HKzByoUx/z+jfI6f2X12XGNRc1LfMZuCmUY0uJpSSEGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa4MkqQr1cAi9hRjFtN9Fv33xgCiANfhwoyyjb2cBW1vLLu3oA
	bnoMnAsUNomz5Rr5ehaHlydjy3jmtyIQMrViyqFg9GSis64dDfkQRSH8lO0gCYh4yvqbpzfjqCn
	9wT/jvYfHu7u/wnvJJMejUjvGKhoDeH/3YQxF7Jw38UhBINALBRC/+BLat21l3ns=
X-Gm-Gg: AR+sD13QQyC7+8LcbgClHOlflBVTFqstl8om5SAV18zG9JB8HBfuFPIEvfXCySxVp68
	1zL4P5TzHnzw5+FpCcIRd8vjpgklcEHf4+Vm792ZeaR52zjY4cY5Pi8ht5L1EZmD3JTbYTXKwa3
	yTPJJrigQdeqPx9NysgbHcbcQH6U2ozOkdrnmpJaHR4/yFKYoTF2jzD6KKNV1Q44/nSIOHdr/Fr
	YXNqkmtcAn2ekbaGlSFDz4etvrN4z52kye6RE2SzdLy43K4N9JNRvYOHopvD8Snu6UvfACFf2jL
	2zjGswIq46biSV+vzulv1G8HXDmPZQ5t6cYuytsQyxMPVMwYylk6INVBtoqlhXSXwbcSpeX8xli
	XAdLuD7fA2/dE4r9I/2OX5IzrnFitaac=
X-Received: by 2002:a05:6a20:c90a:b0:3c3:8315:80b6 with SMTP id adf61e73a8af0-3c4294f17b8mr2449964637.32.1784695300423;
        Tue, 21 Jul 2026 21:41:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90a:b0:3c3:8315:80b6 with SMTP id adf61e73a8af0-3c4294f17b8mr2449944637.32.1784695299983;
        Tue, 21 Jul 2026 21:41:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147df09a9dsm4262613eec.19.2026.07.21.21.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 21:41:39 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:11:14 +0530
Subject: [PATCH v2] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-b4-shikra-gcc-emac-freqs-v2-1-2e480e2de8de@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOlJYGoC/42NUQ6CMBBEr0L67RLa1Fb88h6Gj1IW2ChUuko0p
 He3cgIzySRvkpnZBGMkZHEuNhFxJaYwZ1CHQvjRzQMCdZmFqpSprLTQauCRbtHB4D3g5Dz0ERc
 GpU3dnVqjnT2KXH9E7Om9T1+bzCPxM8TP/rTKX/rH6CohS1a1MVpa580lMJfLy919mKYym2hSS
 l+QYadGxwAAAA==
X-Change-ID: 20260717-b4-shikra-gcc-emac-freqs-2469d8b64a75
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 0_nmEe_RNsVFahT-nppWI7AhJQvYYEZY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0MCBTYWx0ZWRfX0SgEVxKy+LZy
 iGyYdP4UmuRznY0djYV3sHCjTbNzd63/aFOf1+aaTTi5GFls0sm+XZHN8PcupLKOtmgGao8fD5g
 OToeDlW4IpH2wj+rbf3N18Qm2lAK6XI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0MCBTYWx0ZWRfXxzlh+5gfW5/s
 7etCFcR9v62Tun0jGvTNjfhpa7uEs3GLTkPmTk6H6Trr/CJllJ9SmHTeQrLPKe2f6UtRdhnP8bT
 pZIl8plxhfxPowpX3bF2Jc+gKGLfJ0tqCPkhQjY7VMc1Nx/KPPedWZkAg2qEOzflYx0ep2sKNB8
 VHxtjeJdUWI4dwdPbCHHHSGbWOH7Fybh+wtV1CMdsDcOgsAcAKx5LgCNRC6hpYAYKdxojxcx1Ht
 E5XK80+mri+rzSSuIVjH6NHOdkrh9viqUsWIHY1xl3hK1ECqp1BXIb2i9SbgKsSP3C5wUw2qQvW
 PxC/3hByYEuvKYDauQwAfl7Q6LqLZFIACzaE5nuRA1tpI1orKgJuYINU61Uq85RuvGIDBjiAjEI
 Nd4KTQUECZxVLUMSVHwoxgojhBYA5ViSxfhpAmtVr5TAYLZvh6ancViZfHpv/blwWG+RfGKTHTE
 l2Uk5pwai4472qQDd3w==
X-Proofpoint-GUID: 0_nmEe_RNsVFahT-nppWI7AhJQvYYEZY
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a604a05 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aR1S6OqT_Anhih9h-SwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220040

Add support for 2.5MHz and 25MHz GCC EMAC RGMII clock frequencies required
for EMAC 10M and 100M speeds respectively on Qualcomm Shikra SoC.

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Changes in v2:
- Updated commit text to mention the 10M and 100M speed details [Konrad]
- Collected all the tags received on v1.
- Link to v1: https://lore.kernel.org/r/20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-shikra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index d5222756f214c356214039f95a93a28fc542801b..f2ab50209e1c037cb84db67951def053880406ff 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -1244,6 +1244,8 @@ static struct clk_rcg2 gcc_emac0_ptp_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_emac0_rgmii_clk_src[] = {
+	F(2500000, P_GPLL0_OUT_AUX2, 10, 1, 12),
+	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),
 	F(50000000, P_GPLL0_OUT_AUX2, 6, 0, 0),
 	F(125000000, P_GPLL12_OUT_AUX2, 4, 0, 0),
 	F(250000000, P_GPLL12_OUT_EARLY, 4, 0, 0),

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-b4-shikra-gcc-emac-freqs-2469d8b64a75

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

