Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9387342CB2
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 20:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775767905; cv=none; b=qdfepZCB8KQs4i77dRESCzijQ5fdktifQgSaLkGezC4Q+fjR2r9Ejihy5mxMHFe2ULGj/FnBSX7+gJ1CaU7rppkevewaahs0psNAImIVyPxyLMpI8cVrls8nQnIodg2/VyYRguIOBS1G9zokeXv5To7KdwzY2S5snpJZcC/f/iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775767905; c=relaxed/simple;
	bh=CCX5ERKILcZef6gbTvaCYDy7WMKbpX9Nk1m9SGgEkGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqXyYA5ySy1NKqUzNfDnL9rj6IXbICLukClFimA2eFaevVW037LFOypeTiJ1iyG9b232XFDni2QfuJX715pXlSsZWZZTG/ZtxeRBGNyYqvANtqLja++WvJHABKAbFQGXsrloz4nsgWRj1BgWD5BTTXoyMVK8Fvhw19PdRunPVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yec0/o1i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WjcMaJEQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yec0/o1i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WjcMaJEQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CxnhC1730211
	for <linux-clk@vger.kernel.org>; Thu, 9 Apr 2026 20:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=; b=Yec0/o1ip3fYenUT
	MKDF+8zhwoM/XX4Ut3KTdFyWpemI/rosgl8JMWOHDcJd+bTykWP6nPckB2wzBenM
	+4KjzVKrDRv79uvVhvT+u6L121vR1ghCcxj2m465N3Pyx9KYNtMhjB6rbeI0sUyZ
	Kcm2Nqaz21gvyrklc4YQ6kiF6JkbLHbpQQKiFCTPeKiVjZSrizm5nVMTMjaV+jVQ
	jk9j+e//Rz0VWaWvDXGv8Fmve4tqUq3UpfsVajB3sFC2eETkwJO0Vba3go059VVF
	X5+LRGev3bnsOmxfyYeFYpXfqROHtf679zhsWsTrc44O9n7quGUSSedZxGCC0nMC
	F41cqQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxhn27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 20:51:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc9118dc2eso3205700eec.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775767902; x=1776372702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=;
        b=WjcMaJEQT+PyBS5eO1Y1WID4bsQ0aWaK5F0oVUfNCKaT+XjRyzyiBHP/sERj8AcY/T
         CTZ7+y3CO3FcVXl6z7PmYgkUCYJG8m+t1vW7lyaSaxVBf1cHZS6XBrbkzqslaECz/Ogc
         tyWj+DC+2RHpL8BYi2T7PG9JwOJSVr+IxCiw1D45UaH8H4yY4Kpy7OczBH1IcbdvBQnO
         uxsxVBxWZx0kAzs2na/CJDbhssCVfXenOfKBnwc4B79pir5/BBJoECPHlo0MFx4Wch3e
         lA/IELmNRJCTMOmYljaFBN5tZTtJCpArwiSyicXlqxIn5ySX3312OvUkXyuEQHYxMV3e
         z3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775767902; x=1776372702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBQBtEf9fHj/UoyemK4xQMiOqR8KQmMChE5F53hHDzM=;
        b=ZXpYUR8Uz66md69WY5LrDkgBhHYJkniTEwa0ibj5IcD+LgFt1EZM3znwxTZezuPxuC
         s44LkEMzhOGAO2z6FPsyexgKWInMuWVd7n+VoOwPKInZqu3nN70fZoyb6SU1ToDHpxBM
         Y1hraeFQNIkQqhvQRZ+AtNqTfONUylYBGjgSY4AwCogoBvvyukDSrK2+psGbRPwtIor/
         W1s0LFpcA8k9mFfKV57rESOSb7m28H3KhM0H0MsEsDAHTjPD+VThGe7Uy1F409mvDjxK
         FSwJMw7aMj5HMkFPzZ85Kd5W5uyWA5MvvdVsJBw7U3fma89lVVr3qgUjAHZEJDwKa45N
         6Iaw==
X-Forwarded-Encrypted: i=1; AJvYcCVgvw1ME/9MtobJuWOI8RchNCeR3pWwrI9nzFLaqZpWq4iwkDEtBdIqEuWPKcJoc/SqwZLOjOgbvVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbuop+8Nzue/uThVJ/qWNMxF1/7uNWDgyVthrmP8qNZsL9LOXD
	oCBB+ivw51vfFtmVL8ZKBv7tNW7UMpNIG2V1A1DPZ4O1bIm5Kwuy3RcjtgJGmUmYixNs9f3SXrz
	27eq1LQWdTFOeWRi2VMa0xMmajp2VYq3D9uaxQjRRykqnTezSOPYpwlwLY7ttM2c=
X-Gm-Gg: AeBDievUhUlcxw0lmVJqKwPeCgAsBWqKM4ZTi+EqjH1mSYl1tJNuvBWmtlNMfPZHjoY
	YM7/n5R9petH0MGIi1dSScOr0W7xUyt3JLGwo18nkj6uPzUhxZ8gl9gFIfGfIVOsFKrfSkqGF8g
	5SeL/9tO5vV9JZegWfG/lOZcUdOYix7T7J8oD2qHhdaACYIh9MCBzo5on75V6JBSI4O+XHM3/0o
	xr4jEoqMGwnbScgYTjyvo5sqC74Kw1PcVym9iCt4yvI5mWw/QNZCud4UtOtnkcjWWe0uZnZ3rtw
	f8y4FuET3ZNCf5FJVb38JZyJ9YuXsG8y/jClTwSJ44ebt6PGT7UnuPJHodK6goY56F3TR8jKdVy
	H7miF3lWzyxaiTVYhC+PSlJnKgnYT1ZwZSd9pngfXfQOE2YplJBda6OV3Ljv+5B21E3yetiK/f3
	J8
X-Received: by 2002:a05:7300:8c85:b0:2be:8216:57db with SMTP id 5a478bee46e88-2d5873ad987mr327345eec.3.1775767902451;
        Thu, 09 Apr 2026 13:51:42 -0700 (PDT)
X-Received: by 2002:a05:7300:8c85:b0:2be:8216:57db with SMTP id 5a478bee46e88-2d5873ad987mr327326eec.3.1775767901923;
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
Received: from hu-viveka-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm1327869eec.28.2026.04.09.13.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 13:51:41 -0700 (PDT)
From: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 13:51:38 -0700
Subject: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Hawi RPMH clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-clk-hawi-v2-4-c7a185389d9a@oss.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
In-Reply-To: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775767897; l=3000;
 i=vivek.aknurwar@oss.qualcomm.com; s=20260311; h=from:subject:message-id;
 bh=CCX5ERKILcZef6gbTvaCYDy7WMKbpX9Nk1m9SGgEkGo=;
 b=ohN+oVkVLRFI03wdpX/CHpGmLrH5oThDRRHLNfPNiwFVUFeHshBcMiWnmnAwvKNSc9TWCQ6fe
 UYA0tYj3xIjAZtFb85hrcKVcreCWxCtueRnnI+r3S6x5ADrXNBJZBlA
X-Developer-Key: i=vivek.aknurwar@oss.qualcomm.com; a=ed25519;
 pk=WIVIbn3nJR9YRWNRyJiEbvpgoHhNyYrmVqMUXWqAIC0=
X-Proofpoint-ORIG-GUID: qVTcXLTUfypn1nyaTCNeZFCjQwAUi4ME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5MiBTYWx0ZWRfX7+UY0ws97QpE
 Plo8bAdpEc7ZZI/4Tv4C8k1vsa8IyyGN3Q1VbSc5xkn+pFPgbI7PvBPXyiSRNS972VGdU0IQ4LH
 Jg28/yyoq6Z8jdVuqKud25Mz7k/M03QECEphm8lckp4YdDsmLIGidXiFSSK84fqE+fyZWg0dR1Q
 K0N5iZTCHCilvQd330CdRQ54/7XOuHmLNNuFNfQA+l807g2gEoZxMnak1sv8TceuFarAye+/K45
 lTAnqVUh+Pj3wOYoVAw01ilPunMWk//p241BaGkWCennCqiyQPqDXRq39LyU1sJEFhnM015nWxH
 RkwJGgYfQzlJ0oC+sDusqEoNZuJ/cSeXsd6f9qijtBOqlHHL0JkKkTxfwCmMoD4XkOXrq/sOgwZ
 yP2G8m4uCWDwIwhc56+n/SXqVfM+KMnMPJxOr92HL/+MvPko1xIKzU3mh2mvOldBTVfQTA7ikln
 Wn4iBl+4QIazO5GLPRA==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8115f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=oFwqGCNmLK_XFdElRrAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: qVTcXLTUfypn1nyaTCNeZFCjQwAUi4ME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090192

Add RPMH clocks present in Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6a54481cc6ae..f9084c15467c 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -405,7 +405,9 @@ DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
+DEFINE_CLK_RPMH_VRM(clk9, _a2_e0, "C9A_E0", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4_e0, "C7A_E0", 4);
 DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -965,6 +967,36 @@ static const struct clk_rpmh_desc clk_rpmh_eliza = {
 	.num_clks = ARRAY_SIZE(eliza_rpmh_clocks),
 };
 
+static struct clk_hw *hawi_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_clk11_a4_e0.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2_e0.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_e0_ao.hw,
+	[RPMH_LN_BB_CLK4]	= &clk_rpmh_clk9_a2_e0.hw,
+	[RPMH_LN_BB_CLK4_A]	= &clk_rpmh_clk9_a2_e0_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1_e0.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_e0_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1_e0.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_e0_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a2_e0.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a2_e0_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a2_e0.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a2_e0_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a2_e0.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a2_e0_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_hawi = {
+	.clks = hawi_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(hawi_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -1056,6 +1088,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,eliza-rpmh-clk", .data = &clk_rpmh_eliza},
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
+	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.34.1

