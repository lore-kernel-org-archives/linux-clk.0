Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADE84A3D52
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554609; cv=none; b=gM47aN+3U9iQVKTXNpWdbMnqL8vau2mhcUTIuX6O0FTR5RCb9PU2tVVjp08+kJhjdpilMOr5WG0Fg+OX1I2b20dgSxERb1xr42NqBE0o4GQ6CayYdVIzlvm1R3Etg9hdR/+PdGV0Yagu1wfU1yQ8aEHoo5HRhz1YwwghpK3YmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554609; c=relaxed/simple;
	bh=J8ELAhoIpjnImVTW8DOoahvNct88sOBJ3fkgSfxEmuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AYKaXvkCrF7yqg2ix2FdfxL8Y8bruw12wuGiq7hE4g6CrXBm/IIlL2xhKyJhbpmDrj/DFYzhQsYMmD4mimApkQVaV1Tz2xCZaYYiCvdgOomJNCzB+7pfhFQ20rIQ/fCm5QDBzM/wqOsSbYKdkdaiwiNtHG195MEShEJGB+pjmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjeDK2er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELGEEedg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjeDK2er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELGEEedg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G9321L1587064
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=; b=hjeDK2erWxCC6aYw
	gWqKX9PoHtlR9Y/2nkEW3nDa7H04kwUBrSjN6rDSFVo56h+v18biQIr90FYy8Xm4
	jT/eWhQWmVwzLmhy1dlMg8hnLx/kiVf6JTlIxwCgmDV/Q91F5D/veIXNX67KOhkZ
	dnJySJQk2NpXzuctX+KAcLL1UBOIh5dg1gn83QMBlK1lF7P0+/CC3HnR0Zt071IV
	jGZcBGfDvhlUZOO7K1uLpnRWzK+98W/IFu42X4vKwrXrs41uN7Vosx+Ljw0xTdLq
	Odo0rW8FdKNohZWGy8AY9D15YGYcNd7vRDxZgai06rCoPVSA5tsDURBaHY2Xv7Kn
	NaPuXA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageksce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso464128385a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554584; x=1790159384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=;
        b=ELGEEedgugdcEijt/Z0YcBz6LeANepoNcC1z4aIaL/RuxX6VmPZ5+V9h63yzvhHpU6
         zui8NZ1Ob87/AZvQnRTJxVbZ3o6GAIXRVUjRBBt+3+LjrvajYU7TCkbqC9qM0O1AFzgV
         qY6OXvL/XnP7uG3pV0+YIvJmRhWi+dx9rNZ9AGvJQqFtyOQfdEtHqdqSF45sex4ih7e4
         PODkkzP1xLEDPlumrTnzn0G0TVEFJ2mnBDNi6EPYNAbd8w+7Qxq4hEXlPMOMemGrwcV1
         gV05GuosOpxB+EeKjJ0/jE4l14mT95beMNjLDCkRgeZydM+rH1DHEUfj7y0e57XIMYB7
         KBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554584; x=1790159384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=;
        b=cm2CPXlQVg/wYj8MaRTA8ZpK5/Yf7Rwy0yqzo8WnpjgjDLbnU+fzHwZt0gmYpqWuKR
         TaFZE27ew6qrUtNAFj0d3Yap8gLPn0u+w3lT0liG0s9JDPd1F7J6BJihO6s2xp6BrnF3
         NW+8ahatoOFyUxux0WvUk9CzPZ7Zqi0Rz3lgcypAK81Cm622PcM8h30uZM/kmzC+dIZS
         /vF7BCh3uasR0SzNRMZzz4gbHFJ1f7125u4gGmJmfhImwUFQ2p7Dh64XeuBqHcM6TeRX
         cEBMd3aWD8ELRcYuT+vhvU7r276sJY6pxj4R+k83ReeoC9CEEXGcfg+ZE4/9or+zfgKq
         f+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBw6WAYz4ZPz3b8SUj1d7/C6MvvIvS7liDhy0945EsazA5tcsauOU0Mr2IzAqMp7xcpAadyPoctFCPk=@vger.kernel.org
X-Gm-Message-State: AFuF++nT6UU8XZ57Z5RXoFn2R3OMXsUu9uyOeWfokZ2JTgSCprDJhCSw
	2/l/DQERbN3UvWAAXVF6t8GXpnhuXdPj9S+cIm4BmcujfBZeugiRNMePpc8BGtNlJE6nCOsbVUG
	SvTqb5qd1wovoSdU4sBQvQ5LC0HEqqFYDuNE8KNxEd7GT4SXzyEVRCr5+hhkA/A8=
X-Gm-Gg: AYBFou0NKV8HB+teUBMrxYmM3X/MPudCkstbq8q6s9cAG/eF81pbuaFtErJYS1LNh24
	3NU3RkufJPe0qahmgYsZPcF97pfrRr3wiUr4+Z+X/wCQ2RIwmYLAGOaaukd8+HB3+SStVuwN9vK
	abJhGthHlq58YSS6Ew5aNxDKQAkq0golzlxWWTXd6j97lhUPYTEx5DlSpd7N0+piNaWKqglXRm9
	bvRyc2wdIqSbI2KD1H6/+5/5NWiLrB6RAmzU9v2RzU0VbnXn5pJ4AQhf4rFAqkUJik6EoyLBJf7
	SQ/+RkzxLLJN2fg7MKrC9gVxr+gkudMGx0ZHGw6UIpY+bEMxzjtNzmhkgavY1rgNKu9hecadbBM
	oypXxUUE=
X-Received: by 2002:a05:620a:172a:b0:93b:6113:21c with SMTP id af79cd13be357-93bb772b093mr287587985a.10.1789554583560;
        Wed, 16 Sep 2026 03:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93b:6113:21c with SMTP id af79cd13be357-93bb772b093mr287584185a.10.1789554583028;
        Wed, 16 Sep 2026 03:29:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:30 +0300
Subject: [PATCH 14/48] clk: qcom: dispcc0-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-14-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J8ELAhoIpjnImVTW8DOoahvNct88sOBJ3fkgSfxEmuQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9YtvMIg/QuEFt4BcIAGXva9SUvsaeSRly0R
 HPZD9so9vaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWAAKCRAbX0TJAJUV
 VkndD/48DNEa4rYbbZQ/jhhA/k9SVne4CZDHVRHhBJ4tHSRJsblzuvducvphq2zFfyW0Or0Q++M
 QLw0RnOZn5Swv1mf29GTCxOxg3M8s+W6sUwtpJOBVRS0BypWUV/gGRlkhbV5/GyvawKSJ2x9qRO
 A6fOJCBeEJFzUVD3+8fAi3BlyphtKyMlgYIRgt6CrHfE+6qgPrHa4Lxn8OCGdph3Srd9+2hFQ2z
 azMlH8BHQjsHMxOs3gBmYUwCQhKCF/8swFCmXfWe6n2ynMSzJrxAiFqF/5xt7hQs2QZmmk2Ukxp
 qpfqQ5x4x9wvo80hsWxN8Q4t0+J0kSME8fTceyeRLJNAC1JyNinzKkPV81/+J5wKv9fPKZLKxst
 qBOJ5LqSjqEpPIi0c/wpalt+haYEWh6DbW+Qd0o35LksbgaAyLZN2HYgS6+MRyAiEe0+T67qUkY
 UcQBHoQ0NNGH+hPnHlgeVgqhZ7vvu8zsp5xh60AmhvhcdF0Uv+n5g86oIxLzeBV+Fn3Tx42fYfA
 JEfRqTc6Mwol1QFnPmH5Ighj0PeA4a3geNjoOmTscFL6qT1u8qxsy+rNk3C50Li2IgUc5U2d/Ht
 BwSvR41owPTYehMED3oZYXf6X87rPcWodPdQFGiIwMi5/JSckPZq+L8emRpwogYmCeCpI4VYpsy
 hh3CaByVp0YVRXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxUrzhSLl1lsO
 bmIqdp5WfPURqiMO3vMk8+8J3lvzqkjwAAXQ/1p7JpL4ItAm+3pYumSyPcOQQIeVZU4bY3+jX0E
 B8iHBGvslQKgyQCsT2j0sNx05QGZUOk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0qvkAHHyTT4v
 dSpIL+FCE69kNI1pH2FzmMhLNyybfG7VBUCtQ5uQ9/2pa0FqWYi2v1B4E6Y+R9+JpNyW6Zh682W
 YTybewQRFA5Ltnc3gc7TXcv9pqNpbYMwWWW61ILOTqEa7MtnBK9k26je0WNXIi/W697b9CHHA4e
 4Fw/aAEZaKOHNHgTSK+JtDKZO1KzWIWhpjO6ElZQ6CnX6PgERska3l2vUKRrgRRBdyoL/QJ4Twv
 uJ6jhikB5rgWbVJ4nb1y4vD3Nquf45UMvb7sYkOJ5W28KmAJmY+phiriw38iYYNPSuZ2L+aoUYo
 PJ1VxHYybwLg1Zhp+8Oqupqj2w3X9ZC49BMcy+/ljhNCEXPfzWRPl9OCy0vhqlQC3AzPUf3BtY3
 Gi9PAKmafcmsZwYwgcSN/DfGgKgtTnmm6ezTSrQuuWdfNQI5/EVpSbM67MlybGUliaAXBQS996Q
 st7HbAsb6RW9miDudbg==
X-Proofpoint-GUID: 6j-6lchhcUsGp8A2gsYIVdvz31bc41bq
X-Proofpoint-ORIG-GUID: 6j-6lchhcUsGp8A2gsYIVdvz31bc41bq
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa6f98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=15gMRk_Tn8l8Lfg2mfgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc0-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 0e976442834a..a1861cc8343e 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_0_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_0_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_0_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_0_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_0_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_0_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_0_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_0_sa8775p_desc = {
+	.driver_data = &disp_cc_0_sa8775p_driver_data,
 	.config = &disp_cc_0_sa8775p_regmap_config,
 	.clks = disp_cc_0_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_0_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_0_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll0, regmap, &mdss_0_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll1, regmap, &mdss_0_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_0_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_0_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_0_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

