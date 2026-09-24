Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A68483BED
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251669; cv=none; b=oEL1ilGvF83SzQfNuXY2/2M5dH0hBQreYzBwyD/q2g8xOR6UVN7BtRwwv/kw8OUniLepzZ/id0+B/prjP/jKcxuJenAHWpv4+BLuEzB35v6EeeLohFUQlE4KqwNHcAVKmw834d1ex7vTrPm4+BEUGdVm1xCBxE4A9UciLIZG7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251669; c=relaxed/simple;
	bh=4qZgZvfQ1UVNLqQ1DQ+DesEZn6jUeXUBklv9SGrgPXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j27QiAY2NTJBh9tePQOckBbzyeQiPHRTkF9oGnRGROrpmKZw2LamjX/3Gkm5kyS61zn6fHFsDLzqxQrb0xNm+JY3w34sx2zHLbcQT9kc8hz9hIYdghYg7mcGjCkRaP7qYFCENhZ6mDFoDi7w8bruXHCjXbFnU2AltdaU23adFvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu4QGQdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfilKwrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu4QGQdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfilKwrl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4fG21437111
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=; b=Fu4QGQdLCX2euCKA
	BxIB2CCbFsHudmBqbEBgVifCPBa/1J2FWhMXwKqVmPSoTe1HMLC6/myH+fz4RAp2
	q+iHl0KJTgz+3UsQ407IrsptzQ0qJ6qqcbGxcN605iZ73YUbDOU9AnwhfwNGVm41
	02pnRetRtNhM1W3nLN8gfD8iqu6NxfSGudMpzFyeg5BcYClk6Epcq997j6nV3uWf
	clrK+7VaVggax5F9KJHaAkLtQcIx7YG3eNjztHHPUAV7gxmJQuy8RLEVDVeRVl4C
	xcxtw0xGkhsADXdq+rBd90kJr3giqlv3HrEMWMg2j31pzX4mrNlojG9OX+6pLy1J
	4q3eYw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7renn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:07:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so864131e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251665; x=1790856465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=;
        b=dfilKwrl7GCy5iviiSYJuBOysx/VCtQvwaL53ydOSyIwiO8mc2gHgZ3/gv2cRrMSPy
         wtzazvJGqOttDCOoq7iS6HlHesf41QilfRAe8ZcH9C6mZ/oSXpyzUW17TG+6IzPKLyCP
         zncxzG2n+8ZQe7iHRwCZT3OvSGdlfiVytiITQEL10bg4fVp9Mf56ZfVP8NylLPBSd+1s
         Udh4PFTS3fgzqEvjFar3PaIcKODwLQPlFA2do2Z7yU4DqNcUQX1HFyenvyEoKfChwI8b
         aNv/xA0QMpjKxLxWXQbEnqkTg7JwvmpyvFpDbiaSbVBuB0ejSM/h1kYZGYe6QzSZY6Sj
         Eh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251665; x=1790856465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=;
        b=IhWPBdN5eSJHK1LGi+yO52TrUO2DKbQy3a13V3poOPS3AZXUlGaqc3SDDRq1yvJxRE
         BuTH7pjC9V9C9yGZ79MsCwbBMSw8bwp73vKvmGzl4GsEJsEzdgnIXt1xUrTa+ht5geSP
         DrNOihywkI12TqPXgkhc93FcJh8VS7sJ+n/d9G6PrE8MnLhpNwXL5Yo38dtWiBWTnP6f
         07y9ysupwI1QG4m1xx0TjRTgApER5Zl5RCjhhbxiNQ8HbDyXpuiSP+uOobqugO6rE7Z3
         QyNpnYNiEIhykN11bRS0U+OM5WOcoIBycd+83WB4vmTkvie8n5XC0hNaWLcy+O4akltb
         tAKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSBpqxrdnMpjsd2memAzVi9XEbxYJYXBJgRJh/nGESyT3uJf65iXYZoQ0BYyG+AqFkQVUIIoS+Y+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m8KY9wFQ2qDs4SGx/VNLmmYCUZr3QGry7UaGnsTxmYnSGvcbif
	sJI12hV7gzWX2PaW93Ng/myBGfCl1TTybwo2FpWU7408pyNrl/bpk6HuI2LeK8B4QVTyxKQ91QU
	fAa7urK76v0ANwtfRRcHobPCFooVXIYs0gTKso4UF31y1XfDC9yZNy63BVCvGomo=
X-Gm-Gg: AYBFou0Nyj3RpXlsrKxw2hjEZJFSeMTdeRXtO6lIjwe9rh1JiAsKRD2WvEnZh/eIEhg
	r+bElQ0MhpOIzKLsoPAfGMBQG5hRPmYo/o42T8beSD/cxw65EOoOlNjU+y2oVeTASrfSgKCxvCc
	fCmeIRXvpR/8dii4MaZn1HwZ1bTSPWuA+Icrm0XopVDtmYz4FvT6A+tYYeJ0PKr+TWSX14fCiQ7
	IaT52oG8KzVHHf6h7OCAeyhdOVgz4ECe4xRIhmquTS3HDzktf+f0RB9Co0z4IHj4CYdfY/crlKw
	TyCVR/ql5+SFpww+oo1MO11A6uTVEJBAzjwvjCvsSbLAWs2PnnvrWVs4EZGRBo0isfDIXgRn9jJ
	Wj3hpZp2I
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr992991137.17.1790251664991;
        Thu, 24 Sep 2026 05:07:44 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr992978137.17.1790251664460;
        Thu, 24 Sep 2026 05:07:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:23 +0300
Subject: [PATCH v2 11/48] clk: qcom: dispcc-sm8550: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-11-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4qZgZvfQ1UVNLqQ1DQ+DesEZn6jUeXUBklv9SGrgPXk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJMQcDPMs9FBoowBl/FRyf6SnT/oHvfXI1Wo
 VTPiF1JKGuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSTAAKCRAbX0TJAJUV
 VrYIEACwW0+Rrz1sX0qpkjBslo782/gpdPx8+JiFBriFNAboypzZQWguW34vKJzoyQ2ACbSNHkj
 TKC3h8aY8ece55kbba5L+69wBSu4TRtQYiScX263SECpCingz+apxwFyg2Ic5LUIlP9GWTww7do
 VtqUc0+hpu2gWtaqz5LkiiCj95XlNRR9N4ixurvMxvzwpaU1WpylWLtdTBkmbdiJkGgXZgTBo5/
 gnChPKpMyKVbXFr2alg2dwloV+GPNs3XSucrs5ZqNYVqsCrg7RscD1D1TbyvgfDf41vH72x7REs
 fkh4rQr6PC9Ajj+yRrydvWa0g0wMCzlCDN0da040lk+/CFfbWOmk6F1UL7yYaDQIiZ4ELTGs4Ej
 yMQ/wVDeqCKTZL1XqcsBrCKW/JVaaTK9MbXAxCdPnqQB+0JtYjitXAbh4IeVSkua/TBs//NG8Wy
 l22Hb6+llzxqVUZa7DfT3Z0YSZ7jkMLMcgzvUukF/gJ/K1PBnmSMzQpNjBV9iko7udH2XpoNhlc
 pB8vukuOOnTgz8fcJtns57I8I3M9AfjLOxE/2Lu1ttxC69aR2hjth63G0ztXcE3aFu4aNk+WhyI
 2DOy+YZTZ/rVuJj19leSmaJR9t1S8V5wChNNuTtfx/HUT8W2SgzovqagV2B7sZmKMNkVskqfMn8
 65xqD6pVed1lOYQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: XOy1z4-lp1tK-sIlGs_fnlHCkA1WRiiP
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab51291 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0CAIk5KvqrNo
 xkxO6eKo3X0m/8h5EvOwtf9ryox51Lodgu+tTNOrgx66w+izqM+7aGNvd2BfKbdzbltj4QAWljm
 gIEtIroDSM/bGVdrBPxdid1jSG9p/c/6WOKi9B86cL3yOmIBirMdu7b/bZyshtA+oJKgtZ1AqXL
 DBGjdMk8n4Sg6D0FTFclPgVxTflBuvnY0SVn3t3/lLSICMDLiS1JYmuNq83uKute8BNJSHFjpbx
 aJ4I9r/D4OdVlRk7W//VrHnGsJ6kL1ZmZQctdlrdJa2QuQ9xEQLNqXFcCtXFjE36D0vfYoyN/+x
 fakY+4rJsbOSnffDcYNkUWhXAA5r8xeQ+p5ZTXvTjD+0zybKgQRAVAkT4y6fx1sKr/rEiCtm7aa
 X7dyIm30l+OugmfTrZ5MjO7QacUYtxuPhHL1ru6ktuUkgS1KjE2XsJStg4390bIK3Bo4QJencqp
 Vknv9qrKibKEkURMtIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4Yiz+YZJVOsC
 HkIsWiJEa5RxFeg0Nn5b08lG+O9x8JSeaxKaNKyBMAfy0qC6TSqx1aXIgWmJPdWagKE0ROOFQon
 ESdKv1YfQWmSbzV9pwWSLno6TVQ/9Bg=
X-Proofpoint-ORIG-GUID: XOy1z4-lp1tK-sIlGs_fnlHCkA1WRiiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8550.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 418dcea20f00..030fc7ef1fbf 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1744,7 +1744,17 @@ static const struct regmap_config disp_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8550_critical_cbcrs[] = {
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8550_driver_data = {
+	.clk_cbcrs = disp_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8550_desc = {
+	.driver_data = &disp_cc_sm8550_driver_data,
 	.config = &disp_cc_sm8550_regmap_config,
 	.clks = disp_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8550_clocks),
@@ -1800,9 +1810,6 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8550_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

