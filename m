Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9A4D0A18
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554613; cv=none; b=c7yH7oaQx6qaD6WmeOExMArXrKlUmV0sd/thtSuaVKVpcQwbp6ubB4zabX6nKlYqiBqi5U9e0WKymCW4ana3j8QYdj7pgdnPCPxI251ltRd6Ldb0oEA9MqvYjJA9MrCDE8wIVOTXhfxxeV9r/esASFFjtFLziRAdvrg3sqky69E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554613; c=relaxed/simple;
	bh=rJL1L+iwp51yuk4Imk2Pp+gUtXaREErqbRDD6Zpuq00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VIxP+tz7TrK8K6h0n+KCMIKEKlfjd2ruBTxpQ5oFC35MnNY69HXKgWIcLrQAjBEI+nWgPAIQh5QVL46OkdQARItDoMDLcM9M6C3jWsLBfE+rmb86x5pFJz8PVFjsSN4EKA43JPrBW4ewHOfJMttpoNOXTY79Ura1Z3FNz1E8ZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4j8zPxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgaFSlOI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4j8zPxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgaFSlOI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934d12226512
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxMbCdaVL+Fc2ZqDAOPg/IOPnkFKbfFO/T/ZmAWxmAk=; b=R4j8zPxuDg6fGwFv
	83CXfA8phrYSWNawk6BiTkeP9Z8LqQyASdXHcZE4+YHDpbS6z6GmcCbIzz3pmRMR
	e0K+JxXpH3IJJGrp6UYmkqGuuGNX3KPfCArHX5kILE/nzTBq2F5Keszf0+x+IPXb
	+0043CgxOyBs+innnEmY/MULfjqsPrlej/XHzq4SSpNHI04VHu5FCvKVf+ZtrImW
	6JdRe3hdZuBYXRiRPpb4UNRpEqhKgvIEiO8JQ1RtXvcOOcmmkaU91/Qp+7v3Vmqs
	QEkCVYMXS3LAfiShBwleKLfdWNVh290cvfkutCf5X+xvLAsoZIAggCM/gtyY/b9n
	qVcZJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9usy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a2d361e1aso18702085a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554568; x=1790159368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxMbCdaVL+Fc2ZqDAOPg/IOPnkFKbfFO/T/ZmAWxmAk=;
        b=fgaFSlOIftmzoSE6YEswOGSf/Z21QlDUyi5fVP4r5Tb5WF4rvEAXoTM4c5M2SdaqQq
         RxRpBfHwKz3MBUNInl8WlDfMzEP5/K/zR42xYTy0m35aAG3NENlzHYAsuRrM2XDhI/On
         ARc6ahFOqjCOhiIbx4kVZBLSZW/PMCYju0iN2QPRVqYm1ILACA693q7TzT0WCu0tXSx1
         SXs41i1/77JZJsO8+4cD8fdTready1yr4N2kgjgMRF0OiTcVc2yVhgBoaB6DTA4dsISf
         H/nVkbs5nVVi4ywsuAGlyZFgDZqvaxnooH6te2qu5mCyjcsDa3zKwN9K5Z+0kcz3gtlC
         Qtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554568; x=1790159368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxMbCdaVL+Fc2ZqDAOPg/IOPnkFKbfFO/T/ZmAWxmAk=;
        b=QP9lhoM8gyPCmx4mzHRxfvaMqtPwGuQEUz4RYgpJUOtErsBEmWXoGMmggECcrr6QOG
         PM3bb7K7SjWGr15cThTYlASvTjXmRpExV7wVFvLsM9IhSXv09aZ6fbEhovqh8reFXWJv
         01nEC9TwRckZtxs5G6y3A7BDTG0cBaY1lqlxH4TpTPHZeyTnXJUSeJlRxqOMLwoGRW6m
         1dUEBlo083olAyFyYf6riKMLkwnEJLvQq2GI8xjaYYL1idMHa1ncetCsbGMxLlGf/WBW
         NNR5YWiPgCzeGyDB2JAJ5xAWgsA7iICOrV/2J3w/uMr04yaVF12yUdBhaFEWcfVYTnUe
         4ijw==
X-Forwarded-Encrypted: i=1; AKwUvBw//eytKI7vOAfqzp50lW6dlVIcN3h56SFoRbqTvnf9u3wBzjTyJ8aXrPpgT4jwBJ5qCjFbrerj+Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++mG8pKuhd6MS4syu7SseXYFEAciIMbWriHGrKFTtMl9cSbR2kmb
	Cpnbk3n1WUdq8647sLXBUD2Uu6jRUnc0LsVV0v1/9WUNBClraTn4RSIEzb8zWnjRIdkMR7OWvAE
	cMKqMdYFB4M/n0wB9VQP6vUOx049nxgGWgu9DBAflsbzf/yTrQpIE3iPOIXaoQKM=
X-Gm-Gg: AYBFou3yV4tbjSVaTagya+IGbeTdnS5sE1g5qJU1hhE5UoXTAjHoxK4lpl2uy/07rhX
	5BLDhXTXhgxODiMEBVltV+qI5Pj1/tOW1xz/Rq9aT6VJAX8sa+S0gk51lcy4oXgnS/smcjmIqoc
	NxHxeWRt47lIYlcRe6dl3ssxQ7+x31lu/XWfYZxGWWyWHUdrOBlnqLcYL1iff8bmkfIjyfWTbh0
	U2tZPT+fC9brjKx4oGJvcyvk3zc5/60walOuYxxKW9LM+0V2Iq0qJfPL0WmqAGdY1SrWXxCxVQH
	OHuDXa47U+wpTkBsW2OMr0Ge7Hm5K835poz+DUMpuJz/QHLGIf4FwrjtQHNYZWb39gML7hJWx/4
	JIaaL9Zs=
X-Received: by 2002:a05:620a:4409:b0:939:6de8:43db with SMTP id af79cd13be357-93bb79487e0mr296747485a.47.1789554568155;
        Wed, 16 Sep 2026 03:29:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:6de8:43db with SMTP id af79cd13be357-93bb79487e0mr296744685a.47.1789554567693;
        Wed, 16 Sep 2026 03:29:27 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:22 +0300
Subject: [PATCH 06/48] clk: qcom: dispcc-sc8280xp: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-6-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rJL1L+iwp51yuk4Imk2Pp+gUtXaREErqbRDD6Zpuq00=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9QBuI67EondQQlWsSA5YKz3g8vmaGns+xeo
 pGSxXnMcnKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUAAKCRAbX0TJAJUV
 Vs6xD/9U3b++Vm5F8gT8kvjfdeFYr/rh5MdHnwmTd71mRvmnd5NWDjMDMiRTVHKoaNKMFKOpGzu
 2f6OTI2zYU3RTv58ur+W8tiF+xE8wTuRwVddPHr+vdM16xDPG0OsQQOHIZLBSBLETyuqwUqQIvS
 g/QAJzu+e28GpTWMClKcyLF3N4koo0DC50jeBSnpRljWABac64INh0Sxgao4dy0jCoTO6I4X3v/
 jW/NdPcIwX552XaDdTXrTuHATKM1O3OvMW2AFjEXQAeDANrBsLoioIgf3MJxBURGPiH94YTlKLS
 IMsTIt/X/S1ndLLBkR8Y59jyJmAcH9zMlHxSoij/LApiEv3pc9ns2M+zM15Z7BrTQ55UELhEvjn
 mg3gdCm/uHuGoJMOdmTumx05y32haHXKIz4DzhxdH8wbJ3tKm1Hry/zjwm6ayUdwQ3oxWHRHeW8
 RdZ29NvYYg912SvkLU+rdLXxmmr/tGbNpRzTMLCUtBbnzCRqogUmAk2J66c8zPCrwixLz03z4pw
 WJbjKZl/sU13X9iwHrS61jJIok8cyxyikXQiliEkErN60XNjB2t0BSufs9C/VEcmfq9U3XjCl5o
 RyQ8jBhy8HXGvjIMtPZCQXWkgQpXweO09QvtHQR5+o3MZ65h/4qwj4fV0Jh7Pr3vG4PoC9h2P0z
 uCetdPHzTC4xFkg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=JaSVaRig_KI77aDXWKAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: TEXluqSvOWTj_UhJnqEu2htdrU9RJEpe
X-Proofpoint-GUID: TEXluqSvOWTj_UhJnqEu2htdrU9RJEpe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4b29p0MD9b9p
 gA07yg+E295QsdIfXVK71Z/a/ZRq3835OFLR2JyZNc66gFQ24z2IRUfh1iOFRsqFYnuK6YOQrYS
 pmBBv4g4yWeJTVqYO/XvFH2hvGPgxThpp0eoF1rtqcDOnwqmbA0KNAxSYl2vgqxjqgqAKzcDa91
 RZwswbabVcC3xM26bvXO8WpSLq5aieIBuZTCFJqlg3syCnOlyMHEjJWWnMk3CbEr5RQa2OV7Bal
 +RL+nt+XZgDohz2syjKFYQsKJdFDoBbMxPgJFTT9xoGl5TzycF+7dCf+DNThGYZa0erfw72Fhid
 /emRUpVW8bLt2GR7CwQJdhRzqwsOhvnKs2wxJfmweGC0rc8Vj6TW4vEFeRxxzlYSgEqm7Q9d2y0
 HXMyNRnG3z4/7O9wwBwQsZzqybwPUBiCnmhGNrNIuX0FNsCQeRudrVZpf9Dt6iXMe/TB8ye2bFh
 7cjWMzKTAF5pPkH7EdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+SkZ1MX7HJiH
 8AwVYTDW6Zheh8OR7Xf5+CDmVVIz0JccO/IxirjGgrLYKbguw3dDvhmnSLq39jd98BrpLww6428
 /n/xztZ9aOgSdH37rqzT+YiB4p6fBB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Share the CBCR data between the two display controller descriptors. The
XO branch is now enabled by the common probe before clock registration.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 96609bd5233f..96b3e5505279 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3108,7 +3108,17 @@ static const struct regmap_config disp_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sc8280xp_critical_cbcrs[] = {
+	0x605c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = disp_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp0_cc_sc8280xp_desc = {
+	.driver_data = &disp_cc_sc8280xp_driver_data,
 	.config = &disp_cc_sc8280xp_regmap_config,
 	.clks = disp0_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(disp0_cc_sc8280xp_clocks),
@@ -3119,6 +3129,7 @@ static const struct qcom_cc_desc disp0_cc_sc8280xp_desc = {
 };
 
 static const struct qcom_cc_desc disp1_cc_sc8280xp_desc = {
+	.driver_data = &disp_cc_sc8280xp_driver_data,
 	.config = &disp_cc_sc8280xp_regmap_config,
 	.clks = disp1_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(disp1_cc_sc8280xp_clocks),
@@ -3167,13 +3178,8 @@ static int disp_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]), regmap, &disp_cc_pll2_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISP_CC_XO_CLK */
 
 out_pm_runtime_put:
 	pm_runtime_put_sync(&pdev->dev);

-- 
2.54.0

