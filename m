Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED34C6EF6
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328602; cv=none; b=SJQSYbX/LJtPh2XWu5ZxgTB9Wx/v+mCcI3VtPkSvWv/A0z87UEyJ+kZw/OO1qtx69qgl5Z/vNkaMzt8fqmtJJ3JqRKr1iuBG05hX/FDZEbkszi/zfFjqDBCWJteHFHTDOQBS8y029zEaKg29kKcBi0zAcLDxBBLahRoR8ykB4mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328602; c=relaxed/simple;
	bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCH3JRlX+vXyJcrZgxdHpg0Ms9qD166mwfaJ/8TL8gYZrfWrOsQjyuUwBbsx7OAODcmrGfZRvIWri0ED2gRMD0Ic+GMRDCnYP0uLXMJ+oQr0TybE4vcebO+FI6GShj66/Q/98wEAu34JKfehWYxTMu9qOqaiE7c6R9pqhw3CozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=exBzJcqa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fohbY8hm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="exBzJcqa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fohbY8hm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmVRe1641181
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=; b=exBzJcqaIq9wwJQe
	NJ8C2aFeQTxEGuDq7YswVucBjbLHDdmFjC1AfQxgqsUIGcF6vVFpAIR9kSgyIUFk
	54HOmMzRJ9xHx+4aXiJwriH5AkCH0LQq4Ew8elrF4OMPGBt4WLLYteQ/HsXuJcjT
	VvULgHyzz6f549pvkP8GcgP13Ga3zM4cYSLlR7GNTvx8aiS0+Q7PpORDvGvW/DlS
	idYctx8WvLfQxJXqAGzkiqBb31VazanhqqCYwOBTnVqyBT9oAWjTVq8agDWrPOKW
	QiD02hD1AMdWlCtT+SAqCu1JPnG3te0l3ItQB2jOxt9JHerXKxrNHK3I9V3D21DZ
	c4GRlA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebuttmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 16:09:59 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-49aa4525b82so1779794b6e.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328598; x=1787933398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=fohbY8hmtSosH9P1j1nS1Y5zmj1sarFNCvftPzr2XRELqnZLFk/tnwKLbH+Q6TvgYo
         EaPK1SoUkjfa3XJ3ZVoHcY0o0oKc3bwedxiv9TEwriNSCtyK08id/6CVio/fE+nimXf+
         qmV0mOxwZaR4lCe0zC+wVtmgwYpDGsApSutAisN70QF+CFT1MKhOoApxe1gdBCVQB/9L
         m0Y5OV6E86z4x6pMC1maElad1CUzWejJ+1exKzomi9iaBIAV+RqUqE4aQhJdms4Psai9
         eJE+WCaVXW0vrZVwACdqKLd9ofLEG9L9+k4tpbrRWtoZgcao3Qv/MdR4w2mj8hiHcJmV
         w4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328598; x=1787933398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxB2TVVV9UUWFYD7YAFBVvidijpeGeeSursYSHQlDO0=;
        b=ipmTJhncUABuO3OJt9Eo3PY30AGncreVKzUFBZqt2HVo0Gp7k7TCeDF8WbAAAea75Q
         IVfmH/hPR8S4Tn30ERyn6QOFA8+kPy3ypxo4y8J/WeH0099HHx8omNFrEiMcT7uAzn/Z
         MMnn5XFLQLS4b5AlRnm53lnwgWlIVsYM3fppa7ommE2gxBR1oM0FqQeETzJSgB+9KPKD
         ZyYyyApGtPYPanm+7pGBatxaAdyP51QzEtxeRnOx3szBqMJ8Ro++HUAW2CnGqsYPW20q
         55gidLPqgFDA1S+q9jhwb1sciNgssdHNTeYhlY+d9G+LIN/hleAhxAzeka3eR0npeDXr
         jyvg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8tHaOfpwYn+HXy+9l0Z9BPtEctjyCGDyN0pkpnFUD3c+KRVIBIHLjD0OSiIvLXBqWTQhIFaHRyos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVxaoCIFu6bZtDuQX5JucUjR/t2CpTfAcmfmS5FSuVf5FABKU
	P4XhCjfzzWC//wBO7tttyoxMmnhV42bIEz+J9ybPWwD4JUqzuFeSUifT2t2XDEJq+ANGZk4+U4O
	Repz7A+tlpAMiREirYEB+Cmu8PVdLMjku6rkceaavF6BZnz0rm0ywOOYI5YjvXkQ=
X-Gm-Gg: AR+sD10qEZpqIka/GxNYpSUMt6ag9S1TTQKRuAWQpsJTs1QIppPS8CKVvnmiptUzqvu
	LJuZYbt0BlG/yo9f4AQWxzltbqFBcFjCsVspTuGXPR+r2wkmy9gweznxIMJLMad5k0Wm+U5sK6t
	KqfI1MGDkNhYNIOlt40u+cDclGI4YMvKk0StWt65l+Cm5M1V3aaGpLeBgLdqFfh9svYwgt+b+HV
	IX0fh6AXiAlFipgSMi21tClOqvlT3qvxKWMBZM3+q9yy9OWJzKthM/gP22J/j8wOWBhz7gYDEgf
	bolw631Lsc64aZO9L7rqE3SThvUPdfKY8eIaVstbCCQE0rdt9TvKDB0jjDlPB/KwUYiWglxCDV9
	SSDwZN6J+g+UsvSDYrtVSPNRFpTYAFxhO1yDdZrHjw5OEIaFRLpAeZ/LdnuM7mKM1TJr0shFHJl
	usqjkUU3Ec+4IJ4aWpM0OzUNE=
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714243b6e.0.1787328598421;
        Fri, 21 Aug 2026 09:09:58 -0700 (PDT)
X-Received: by 2002:a05:6808:c2d2:b0:486:4892:d553 with SMTP id 5614622812f47-4b2eef57c60mr7714168b6e.0.1787328597957;
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:57 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:58 +0530
Subject: [PATCH v3 05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh
 clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-5-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=2081;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=IARJjUuJ8TzYCPtgJnhyF2BzcDD2X/PGevklk7LPqgQ=;
 b=KmDwPQXORl1Ra/lOX6PTLp4448/qlVRagyslHmyTMRKAmZ2TjRjYeGXCKrSJhH8L1o0oYoqcg
 mL+qVKKxt5UCvGeiVmeELj3lxlLw3pxFMOsKUgQ94CFkDvv8sp0mfH7
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: nLEzbtb83BtOsOJOzLW1l3Nky5g9A6h1
X-Proofpoint-ORIG-GUID: nLEzbtb83BtOsOJOzLW1l3Nky5g9A6h1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX8Yn8AB65ZRmZ
 yVh0U3a4Qq2cPywWfpIew0X3MoSPC4g8jsuDhqPy0m3sgHiIJz3AwoPK9KcruI0J4+rlziHsiwU
 xR1ThfuG55raJMzfqHLHow9nbxpzj6c=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a887857 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=cbMe9IPPLhjBV4UIYdkA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXxRI/Rpu31mIv
 qKEJEt7oDWaMtxyVvIdLTnG9DN/COU+31MRZ8eMrf77gA4hvvoN/AxrWx3+bPaSELnoRHZFfSZS
 KjU8i6noc+Ukx9BLKVisyH8CqpAIG/HcO8xOfMus0HWDUQUpF2QFLMUaU//l8h2E0pk3vC0Mrsh
 4mftmsrwp1sPWfjvxuaJHy0kkOPeCHY39LBbGSpaUtUzJkrEpPTtwuFCCt/pxEgcoMLxccHCHle
 AKq47q4yQOX+I7t3prUh/slIJRuNahax7US5Oz/uE2gq1xR4oFHbJB1ZJgd+SzlSrBTHU77qvQA
 uE6klwuVlq4YR4jhJfw74UtTheCvOP0UFgV8GxNzfWZlChAJ+LaibfI0M8tqtSdP+XFwV6gZoQv
 jNVSnqs6bx40l7vF1V3Lx815QeYpCfPQGetZshF2RPaWFimYjpJ6yKpyKcqRJ4jWDykIiidXoIc
 32sC0A7BEvi+NIdDTcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126

Add the RPMh clock description for the Qualcomm Kuno SoC so the
qcom,kuno-rpmh-clk compatible can provide the RPMh-managed clocks to
consumers: the CXO div-2 (and always-on variant), RF clock 1 (and
always-on variant), the QPIC BCM clock and the IPA clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 6367b2a5a4e0..d8c3a6b12d4a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -943,6 +943,20 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
 	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
 };
 
+static struct clk_hw *kuno_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_kuno = {
+	.clks = kuno_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(kuno_rpmh_clocks),
+};
+
 static struct clk_hw *eliza_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -1103,6 +1117,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,hawi-rpmh-clk", .data = &clk_rpmh_hawi},
 	{ .compatible = "qcom,kaanapali-rpmh-clk", .data = &clk_rpmh_kaanapali},
+	{ .compatible = "qcom,kuno-rpmh-clk", .data = &clk_rpmh_kuno},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,nord-rpmh-clk", .data = &clk_rpmh_nord},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},

-- 
2.43.0

