Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824D934041C
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905236; cv=none; b=HJ9uWo0MyDL5ylW9/xmRtgU4VKyyaqYnAs7bXluOcy7fY4wG5H+IEjiixQGcc387Hlg8p56O1FfnsVC/ffSKv26UEmQdLaEPrlX1j/HWdjVDh81eeoE4BQ8Vk2NYApxOmzCv8DDYowTyTaI5XqFk07zDonII3YPI4kpsblMFlMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905236; c=relaxed/simple;
	bh=sZaF10vBisSJ9QFSuDzkeFZ3FkrTFu5V6pURX6pp+do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjyzoGTMfRdOGJS9UdczHeRT27gT4Av8R2lBSfEC6vONMMoVlcMGM0uT5dT2kn+1dwGABCIAyg2B6brCYf/Xq/Osqi32zYERwyC4JlPBA7h3Nj85I6Z8lX6xXOQa6agD1BCfcGEuth+G7trAEDvDzjS8Y81uDFyr8LS3HzmKIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/FUcaKD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dY3nvDjQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/FUcaKD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dY3nvDjQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbXxZ3090588
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fEWGpPXb4/SMogN2drzWxv7csiZ7aeCPdqARu4eOtN0=; b=K/FUcaKDqf+J0ZqP
	3U4Qs5S3GI1dXpDD0Ds6HRpa1u9j1GRmlkSeF4L87aYkvWwaWbKOT6SIzCocSUIc
	m8ktu4v+CxoE1uFHyVK4vUH15k9d9U9Od57xaP0l60eAszkanILTrJRpHoa2lCJx
	O95zW0ifO63M29F0S5zUmI+7YyXtQKv5+7crfqvpoYfkjD9SVYt4NYR4E7IMaduq
	pFz4UUHce7/KHCrwxfrD6d4zRiMBGkJoN9G1SA2vo+zuszzfHvySD91LzxNQiFAh
	kwlVs2ABFUHjpNt+mIeu56YdsYqz24jfkbVBYrG8cSu9fg326Kowl0uZC4RFVIII
	E3NW8Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:00:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so513351a91.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905229; x=1785510029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEWGpPXb4/SMogN2drzWxv7csiZ7aeCPdqARu4eOtN0=;
        b=dY3nvDjQCb0B6309xvQoTp+9xeU4DE/TDmSDbmQoY0ih8vgaTqFo8yv+MaN4F9hdoD
         4PoPj/+uix39CKyPqbTty3LDJpCA+pQJpnXjq8F5TCGj8buz1aJt0Gzl3kFkDaK1PvHK
         9geVOUf/X4RNu2FVFg1SoX8CBwvSKBHvIYznjCnl8ZurunkIDQt8inGKghWLBNhB255R
         fUQmOf1+eYyTa3l3MJ3xvYWdhug1HS52/vzzGjdtDiJxlTCQEbaYx3gwW8SBnkTgQpm1
         J1Igb4zVGLjBWSGAJzadwqFwdCpFXR9YYjFzHzgKQ6C4zp937hk1NK7j250PWna0aWXf
         n1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905229; x=1785510029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEWGpPXb4/SMogN2drzWxv7csiZ7aeCPdqARu4eOtN0=;
        b=hIQLt9PM3Rj+dWRzMjfpl/n1FGZdBTPR8GOXY0j8D6+waGAYvDW0dL+CnTqZeJSiiY
         mCj9PkLGdYohTgurLSknTuqwv/+6xO7zEOXsVSg/ZyfmVUtfdoFZVAkWAuEvQ6a/64hw
         +X7znqkOw3xPxWrNgPbJPBfuiA7UjYQ8YtHCwqDE/DbEqt1GgKkdeoSiWAKSDziww42B
         n5HtNSI2bNrVr+IsMCcDt5Z9O4Ayu7My8KfMIyWzcq/ZkKLhJ493WpoECA2072c3VrFA
         ymNkephtxzOxXIAOY6Cj60CPYfzten4LkwWPH66/dlEEY8JcDhfOZ0tTStWdrags/xjF
         cHcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJ7Bid83TC6p9up4tnTC+DzyHUCXqihKxo3cKeGJImV4faSRL/+EAU04JwUK/lAQ2Wr2nuN173Hh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhuxW+Bd4q5s9dQc8NQGXVy3h8GA6lBg2XEbICUubYenJZckEw
	sPfqhsckn2hZPlrfD05KKzOuUrnBKrjHlqNuf6n+he/PKkfVNfEtec3ygnajEyIPOWJMrsSHRSn
	kaitAme9tcFBp5LZuQj7xt4rewq/BQFCVCT8rV3f8WmQVqMXttB3fFOuB6xxpG1Q=
X-Gm-Gg: AR+sD13Eh4jk0nPqY7Y3YaCsRIXkKnPeamxSkxVt4aiQVLyjZAfN68dgYTWHenWHVpl
	xXHwlBoyPHfBsCZ86WmLLc27tueoxXFilDTm4CGdSopKcfiog4ukDOLJrdBGqdTSDJjgYu6CPF6
	loy9HwIk99nLEEyIIDLHB75D5n/vOdq1oXnBiFDJ5n6Trsxuq6p7PvizzWNiD8GpEnQR0ZXBOKG
	O+66aCN2XrZU1U7xNN0NSbugX5QnK3TPE7jgmG+vM4Kc3N8jc2z1l9TpLcGUOAOb/7kIDHyEVxY
	IUNJYHjhaRSNhHPyCfKgv6yk8laUBUHUS2XeGqkQU8DBhUOKrbue0BExlYdLmpesUd8MZnZ3O1O
	qbBMgM15afhKlig5rpM1JSYcdrCkNPyDUa688FJj3GwM=
X-Received: by 2002:a05:6a20:9398:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3c44afce727mr8952891637.9.1784905228639;
        Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:9398:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3c44afce727mr8952828637.9.1784905228072;
        Fri, 24 Jul 2026 08:00:28 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:27 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:25 -0700
Subject: [PATCH 03/12] clk: qcom: ipq-cmn-pll: Add analog soft-reset helper
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-3-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2559;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=sZaF10vBisSJ9QFSuDzkeFZ3FkrTFu5V6pURX6pp+do=;
 b=TKcQF2uKOlWteKqmyb9MPLLReArucJ9Mzz9/wZauk2reHky8k0gk9Z6uznGR9Oipw4E8vZt1l
 60gwRkaqmLTDPQuajElAxEwLMSS1fICbA3RIzResKS2dgZlRZuwjAf4
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX/wPFTdA48kqU
 l8sFqY6K4goLkPYPYHB++xXFFneLtvSTmJS6SukI6JDoYlTHcoR26lYiYZTy6w50Do08JfhNuM4
 8cwlEsT2hNUvITB8JDPRRIyBAcch+LE+QC4GbfZX9dS8zlFlQmttf3U9zJJhnxlr8oo/+Ip2VEN
 fFn4zTcLOZQxuzwlQgsL6ecqhNJEWSU8/RKQZcno+SIXSgI1ZOFsf5LU4Ij1NWOQZwWbbd9f6Fj
 5VAGUW0DwN6CvP0K4TRliL7+/IC1ncDV86YbB83Ht90O/JRLIM/7IIZxa3tIq6SXV4YWB+aUPtr
 hNzUYEbF62jTIMeYCD+zaPVLOQ1m1dSy6Wm3yrV+74NPPzQtPgumlTYCyRFs1qFfFjStdjK7tJg
 Nkwt2YYCnxS+4MlkqwbPpzgoYNswwd3cXRYzbRhR65K3zU6Pxb7c+SVvQEr3sZEZYoC8n6CAHOZ
 XJsNxkaF5GEDqkDJi1w==
X-Proofpoint-GUID: IZ9rJhLOORP0TZ0GTQ22c6StyaiRSh0G
X-Proofpoint-ORIG-GUID: IZ9rJhLOORP0TZ0GTQ22c6StyaiRSh0G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXzhDxyZotRqz1
 IitQ/6euUQQF4h6DvubuiyXkoUvT2/4v7oovcdS3IgMcETM0EJinI7mHXBlGBGTIi96/2S2iQr0
 aWIuEd4GGEDpkkhCBCYtLL5OVMlI4hI=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a637e11 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8SFKHiaDcLpzCnYd0_0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

Add clk_cmn_pll_ana_soft_reset(), which toggles the CMN_ANA_EN_SW_RSTN
bit in CMN_PLL_POWER_ON_AND_RESET to perform an analog soft reset of the
PLL, then polls CMN_PLL_LOCKED until the output clocks are stable.

This helper will also be used by the NSS, PPE, and PON reference clock
set_rate handlers added in subsequent patches.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 4fdf78f6829e..aa319d577871 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -210,6 +210,28 @@ static int ipq_cmn_pll_find_freq_index(unsigned long parent_rate)
 	return index;
 }
 
+static int clk_cmn_pll_ana_soft_reset(struct regmap *regmap)
+{
+	int ret;
+	u32 val;
+
+	ret = regmap_clear_bits(regmap, CMN_PLL_POWER_ON_AND_RESET,
+				CMN_ANA_EN_SW_RSTN);
+	if (ret)
+		return ret;
+
+	usleep_range(1000, 1200);
+	ret = regmap_set_bits(regmap, CMN_PLL_POWER_ON_AND_RESET,
+			      CMN_ANA_EN_SW_RSTN);
+	if (ret)
+		return ret;
+
+	/* Stability check of CMN PLL output clocks. */
+	return regmap_read_poll_timeout(regmap, CMN_PLL_LOCKED, val,
+					(val & CMN_PLL_CLKS_LOCKED),
+					100, 100 * USEC_PER_MSEC);
+}
+
 static unsigned long clk_cmn_pll_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -253,7 +275,6 @@ static int clk_cmn_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_cmn_pll *cmn_pll = to_clk_cmn_pll(hw);
 	int ret, index;
-	u32 val;
 
 	/*
 	 * Configure the reference input clock selection as per the given
@@ -297,21 +318,7 @@ static int clk_cmn_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	 * Reset the CMN PLL block to ensure the updated configurations
 	 * take effect.
 	 */
-	ret = regmap_clear_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
-				CMN_ANA_EN_SW_RSTN);
-	if (ret)
-		return ret;
-
-	usleep_range(1000, 1200);
-	ret = regmap_set_bits(cmn_pll->regmap, CMN_PLL_POWER_ON_AND_RESET,
-			      CMN_ANA_EN_SW_RSTN);
-	if (ret)
-		return ret;
-
-	/* Stability check of CMN PLL output clocks. */
-	return regmap_read_poll_timeout(cmn_pll->regmap, CMN_PLL_LOCKED, val,
-					(val & CMN_PLL_CLKS_LOCKED),
-					100, 100 * USEC_PER_MSEC);
+	return clk_cmn_pll_ana_soft_reset(cmn_pll->regmap);
 }
 
 static const struct clk_ops clk_cmn_pll_ops = {

-- 
2.43.0

