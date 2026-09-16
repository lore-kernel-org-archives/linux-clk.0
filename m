Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB18C4CC62D
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554587; cv=none; b=oddaK9s49c89cql3BnNUYabDdAKbyK5ZtFxMDYv08zCJ//HZqCH7XlyXjsdcxCUnteSK8XL7boL5XDqq5e70CfVPEe0/N/vwBjRlpEDNM51AUchOC5GA31Bz3EIGswwoVmjoFHTtC+KZ2At7Q9q7AIkeJ3f/qCeDUOXup74xdJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554587; c=relaxed/simple;
	bh=st9xlZKmZ48UF3uJ2bUZA6moRjATrWOgM/yr01YuaB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DoFoZi1YQTZ1rTkk8YHoCzCeYjNHQe7xyHkIB/8fi21lagu19exRQXIzoslpWOlUBzEFXbfNhRXv4D6yCt71NXt+EJWHoAx5v9yH7UJJ5F7TqtOQ+Z0p3e+qBGGFojPR7jcusXCoCCJXt71MexVB0naJVP0yd3InCjmzTeKGnpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE7pQlAo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqrJSS79; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE7pQlAo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqrJSS79"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934P72226500
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r2hXn33m4Qsw1kMDFpBlgq53rSQ/1SMHI+fdKa/pWaQ=; b=nE7pQlAoDNcFo8Pb
	bY9lTddhcWX5gao+NvS3TimhTsmdWfS46wFPsqmB5BpbH2oo40CAJ4jmNKgDl6Yb
	GAv0zW4ZlkuDUoDGtzybtiLZ5vL35useQJYFUZ2FbnR6AAO9OyjgWahlqaEgp8de
	hjQc3O14+9PJTXCuaVqVv0/4Ea7VwbJcr+pnDBOTHQbVse3OJUlwL0CELUXYmCu0
	8QYsB4NZaVlNd/pd69p6cWgWdFMrY3q/d0jK548pgWIlDPxWctDUWtNjztvaeYtU
	jMQA33ZRXTTWsBYHmdtk8zSC0VL4SrtgUN1EoYnehAI6v5wtfOPJG3kHKdxu3Pl1
	SK55Tg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f27c80a3so1076253685a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554580; x=1790159380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2hXn33m4Qsw1kMDFpBlgq53rSQ/1SMHI+fdKa/pWaQ=;
        b=HqrJSS798VIG/xl5WjsCTy99NWWumzU65E0Q2+x+N8iCEq+CQ1dyichuy7TDG1Baej
         LP80pGeLRrPCz6a2MntJo7iQDmqdzkbVoSGkktjdvqr59w1hrOnea4SozLmopjCGwu14
         NSqnl8yYYxsYrRkENOsWqUmGtAvuExmITul/o7U5VFzWJO82Jemc+fFHKZ76eueRiAvU
         16L23e/0mhrc4GOqs9PGnu35EVvDB1aJf8Nx/q7guJdLUu0BAfSiNtLsT6odtt88fhVs
         Wv+GKCCaUTJZo38AFd7VutYyeY03mYk15nDJUf2xMpmpt8QdeyXctGNw7hWEYavMRk2S
         +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554580; x=1790159380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2hXn33m4Qsw1kMDFpBlgq53rSQ/1SMHI+fdKa/pWaQ=;
        b=SEVc2eaL1byFX1W+aDhd7vdy9p66HZHxc+oGc+CgCEctzhc/Mu+L+IyfXzHkC0ORrT
         6FFEkA9b/ZJMFDGKJDUWT6NmrivEUMUzSTNfokQn3wrhJB/NO05jaE3HzDpEBGeRYWFk
         kltOoZdmPnFcD20qu5FfVC/P9x2jdot/XDizr5art9OJtYZRFOUPw1rSQa3/PxrhYyze
         uEMAgUJIxlZS6tPzpHs7msOgCRJGkYyFKZARI8T3xqzb3v22wdwqRsqUyTYT61070VeY
         kq14D70cQggI9szfm82zBJCI1+3MXQqSiEF2qd17yHNm9l7Uwba6dibmdbUQn2ZiXWqe
         XqwA==
X-Forwarded-Encrypted: i=1; AKwUvBx8L5PV7/+LA7kX99c7d45wy+7e+ywa9aylPw7AiG4615zUQKcjg8ZpPnCHo4Mnk5FdmziHbx/vDQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++npDNc43ootwmVIBpL5RMG050QYjlkSW+N679l/+ni6NDaBaqwQ
	MpgqgD77zkfpFUrAFhua7WxuiEaP1lzZjzzbfdUhr9UlxDiMiriYDEUFm7LvxcDmXETN1hzaPTh
	NPpjhsIlhm0Vveheld7ugTyjjMpIRz0sAHPLrU4vmlbGgrk8YC8Z3caFpTd/qJhjxGJlbcSM=
X-Gm-Gg: AYBFou1RjPPoXiIis0IIWxfgYH8I4wWrZGX/OdKyjd88Wi0x/q9OeaffTA4xCZv0A1r
	DKvYd1LWW80ry5bPKwkt8bTCYgPRMBBxdGH9GN/dhQZOQlfi1NR+9gTxVNOz3oRJRyCBSjDMW4F
	I9oko8FILs9T6j7yBfe9wHn+wyHvyImYn7RCpUrS7UZQ4bkAqMWB3EYqiImRl53H/dFAbdUvwqf
	LF/2FIyXdmEHo3HAIoJBDR75x/oCy5+PhD3dK85U1T0kAYbcDdzpQ71VVa99g/7lipfVuy+aRAx
	79BDAgJ5+eOZnGxql58/sOqf5JbCctsHVu2MAeQXeeiDqaa13bJQQpDsBntGXiQASZi8p2v86xR
	zFa8Kffk=
X-Received: by 2002:a05:620a:17a1:b0:937:7836:1501 with SMTP id af79cd13be357-93bb7627d7emr315606685a.10.1789554579890;
        Wed, 16 Sep 2026 03:29:39 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:937:7836:1501 with SMTP id af79cd13be357-93bb7627d7emr315601785a.10.1789554579318;
        Wed, 16 Sep 2026 03:29:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:28 +0300
Subject: [PATCH 12/48] clk: qcom: dispcc-sm8750: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-12-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=st9xlZKmZ48UF3uJ2bUZA6moRjATrWOgM/yr01YuaB0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9Wp1X0Jvy65lQ9uifZJ0T66saqV23rYsgoC
 gppy8CnIL2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVgAKCRAbX0TJAJUV
 VggYEACNd8bypCiSUkibCiYeozrb1TpQOX09x5i6q6zQhjoiqCXH90XPCJM/r52p6yJ8e7usPVf
 0GMuuVv43nmnAiGkdyt77gYdMbl+5PQSVkky0wk1xLDXXItoPyDYCVv/XsgNCAZ5jVIwMImJ2Zw
 USnHsow2FrmEbV1BiLn42X+phez35y918T3O2xFWov/cat9FwJfVJyExqO7k6rXF2FUKLEtYdWd
 H1BqFletVz1WXViAymYwg/UQ1kH4b3eBFU496zKgThlzKRsY6XZo9pgCBiIERbp3aKV3po4VDJq
 lVwl4V5gK5t38/fKt4YIStRjEePXjtk5hw/jRiBV7bDQE/1d8Qoh+o23/uXVjflNi4MP1bTaklY
 71QeXoytA1SuQibJUNG4Mk5FB9UxqjnQllZSQja35TR8DQMjq2Ze+uQM4QrxWLT/WhtgJsU/ZLl
 CKcEpZXXI7TiyxK1cFCOmR2txoJ/3e4/O5bb6+KWREp1EJdbKI6C9lSb3qS6czPhdE5RGBnNJo6
 k0hxQTfpqhC6owi6LOxLIHBFQYatuOr5UqDAxZLPRMzjmAsMmr5B9xEEarY37z1+zz+d9TqRU0D
 byZqB5+qV20O7WJIf0iIv/EKDQ81VNxHUuRqv5ihRmHgBTuf4Kfh/l7FTQ0mDtL73912ytIoRgQ
 JXIZnV4PU2npgRg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f94 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=FGioixOYZu2XGbO-fNgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mJsFOaq3c1SoPeioaxfIwme6L5iX7gXc
X-Proofpoint-GUID: mJsFOaq3c1SoPeioaxfIwme6L5iX7gXc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX82Tv9KJUa4XN
 RHJjroRjz3Xil0psvpDtRwDHVZa30h00Uo4qg17O8/9gcPNPjm2d2KewX8uU8ceK3wEhOgnvF9m
 33ZIZ5jg0r4AtQyKeqNHi4mknHOHOMgO+li+Hhdo018q0omwwW/sWtmWYHHCNYW17p39jz4NhGp
 N//rk9SGOyw7uySSm6ITuuHF/MxzPjFST2ahYNZS8I1RadG6SxgqNO1vW5EF6LgUK/5wFXaLfv2
 v6QEsIQoXoG646ju1Qa5i5B0rL0nKKJDLyRi6oO5MzPWKxKMyAiwhacqsbQu92Gj82ArRPkN207
 VMc/yu+xf1idtKxTldKBpUypycsxG74ySr8idRsW7Bjv2GPRPcb6N3jfzyjPbvUsjmGP8SoEh7m
 untD4qVSL4O3EH15MJAiLbbXF4GKVK5rbLxv67Z2SafJrPHKGSGaBKd5kjmC/tAKBZmQ2/PjgVS
 lszZlVXlXP/BTzAY2lg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX42xqJlqLWt3z
 yr+uTet5cGvubA2qn98j8D843ljQYC/n5qsGwr82ZUu8lFDN7GdcxdB+JxjmnlXGZUk+hty3yoG
 uaF9a+2CEAPUPIhlMh3MrT3HiTtxOgg=
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

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8750.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 18e86b80e581..3205ce5c1ad9 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -1884,7 +1884,20 @@ static const struct regmap_config disp_cc_sm8750_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8750_critical_cbcrs[] = {
+	0xe07c, /* DISP_CC_SLEEP_CLK */
+	0xe05c, /* DISP_CC_XO_CLK */
+	0xc00c, /* DISP_CC_MDSS_RSCC_AHB_CLK */
+	0xc008, /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8750_driver_data = {
+	.clk_cbcrs = disp_cc_sm8750_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8750_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8750_desc = {
+	.driver_data = &disp_cc_sm8750_driver_data,
 	.config = &disp_cc_sm8750_regmap_config,
 	.clks = disp_cc_sm8750_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8750_clocks),
@@ -1926,12 +1939,6 @@ static int disp_cc_sm8750_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe07c); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe05c); /* DISP_CC_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc00c); /* DISP_CC_MDSS_RSCC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc008); /* DISP_CC_MDSS_RSCC_VSYNC_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8750_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

