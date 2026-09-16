Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE84A5ED7
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554613; cv=none; b=FnVVMOhj6Bu/ZuYOMZinvFtvxfwNUel5QMjbwORAI86HrL4AkEut9k+ofR5Cr8HkCIM5+JKhxkcOjArj6s5pPcWmhslNliZ1ufpnuxDp1x2Oe1gqc1//mJXRFNocABR08cpWYNoGMeXYKArsbwzxeTvqmFwM6c4oEE/w1PdFXsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554613; c=relaxed/simple;
	bh=iXUNYaH4A1wy07zs/nnJgB8Uf+MSyhMYIfjrKnWdaUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HayqWq1XVhZPPDPRH3097XtucYp7hbkiS7IAteSX38e7M4GKQUrY036gJNOko1ystBpEyJqUShcJ3rB3Nz/6M2w01VPGc93zqmjisXCuG7SwRDL6Y4/MH+7XZW9aSkjrg3XIyrosgdx3ttjBgArnoylwf1Kd8UcWkLf0h7owNCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE1YX2FG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kun6Tk+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE1YX2FG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kun6Tk+/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G931rZ2822929
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=; b=eE1YX2FGLQEW+594
	yxtfQMNy274bTYynCJODx9VnptHd4/PkGXlWvRhf0KJRVVHQM4pj7uaI3u7KrWml
	0V41qNJ4CGNbtiV6o4hTrdFTLBM7MmsXF8OWGU/HpHuDQLcz6oJWLLb8PB6xOFjU
	grakThKaMnz4NkgCH3Ava5wJnqx6xylghZapsvSneuLAOuVsarJMeJ5gZ+t1pM4J
	Bn5vnewgcY75PDcJ0qSS5+O+smBIxbZ/vDk4VTdT+QIhE+rAqpV0CR0vc6GivcMO
	c2trmUcX4my0fWL/cJrZ9mwVk/mSMs2J25uxEGEuu02UCCBfVPpt9//r67ebDX2q
	ucjYJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a2d361e1aso18771885a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554589; x=1790159389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=;
        b=kun6Tk+//vWtZQvObDFhYs0AqJfHVNfdq3gn2eoNaClALZp8xVP5LDpQfGUq5+3G1g
         uiggELYVYKa/EEC+gSDA7pXv7uU6b8lfFCO8fqqBrg1HLjagdI6XOB8uTCO5h4I4+BBC
         So0wegoF2PvjObACwjkD5aBSJXqcCBEsn65htqAE1A7OgdPSAdr2ht6Gy9n+/X7/Io/n
         bQpLYRf+7qGMfIldx2dXjwP02ClEPWauQrXkw72DyBcYnqJxJPApW7C/gX3gqm828x6I
         FadyGARPt0etiQr6AyrR5qITBFVtBIYYGDvr+GKiNCPfKj1kf9fU8uJz0StiATB3o9OJ
         L67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554589; x=1790159389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTctgnsk+7+DKp13Yn5I3XzOkNFK4BQpKT9A6LCQGQE=;
        b=q/KH6/I84ozxv0F+dUVrVPBuVOSOozLLGQaMgzIqI9WLdSAjQ2fp3s8pnbTH8ruSF2
         z5NeNTRtjG2elCjOgkcedi2/SlIH6AHbojaKAjBquaLxU7pnSsMBE5Pw3FlxbLy4e1uG
         beFHxJBSXATrmXCQ3C49HBXN5e2TQ6bsrcEHoOwIlYAY3mW0jQ8HQk65dsZPNmqQe5Mi
         nokEahpJlJgWvA23fGu7RoLx65rKC5fIvoNEfjdyQWcTRXhjhjJ6fD0IlFUDwgz5PMN4
         5Wh/yinNHfvvaXkJQmpk3vTiLmtITMVeVVo+h/orYat1NS+TdPV6DIL6Rqd1RpWgVzHE
         mYDA==
X-Forwarded-Encrypted: i=1; AKwUvBwf44P0NN/igLQViQXl0Gvs0XhKFMMjGPRfhFBHCPie+DDzyNVOb61oC0tosOXnDprPq8UsSrsYN4w=@vger.kernel.org
X-Gm-Message-State: AFuF++l6q+cHsNBAXFdM1Adtf/Ex4P8kNmOP0BxM2cwjn7AjCdKOeT74
	GRkAdNhKLZa3Sa5JJJbCR5pdqZazVFp+LxNmJ2lI2zHpxBbv8KoyheNjEBxjn4+XoSeL+Ex/sno
	uL+d1rre6mxe0gSSw8K042INHnI0ix6kaADBI3Mr9ZMf8KFUlVXwqJal58qtBcmk=
X-Gm-Gg: AYBFou2jQYCJz95I7bTOyph+2wtu/Nk1qjIc0lcv2U3QTL9eT8aoLpgrranKHu4HoWK
	4e9NeywATrV9sYt62g1gmyLTSjY5xgDTaW/yVZ4G3qT1QP1/9Oibs4Kar+Ji3n8piPsBBGaA3ku
	ju3wjLFzpwLQoERR1HiOCoD6nXkJ+1Q3+LeqpAd1FrbEExNKhtfeQBQaS0iXeBAR7L+4GNqGR2H
	MavhMduBX2jl3/IyNaOY9edV5eubJM//84wupDMM2dVVJ3XatKOxL5/MgYgn8mfBpLXonKMCdZv
	aZT0IUiTJaGqiX4MIolntGNHRTvSSt80ZeO5ngP2K2xHY+b/nq37TeaK2F/ut3d170YAUPwT8U9
	7EYgTwOo=
X-Received: by 2002:a05:620a:648d:b0:92e:45e4:c6e with SMTP id af79cd13be357-93bb774e0c1mr329148785a.22.1789554589522;
        Wed, 16 Sep 2026 03:29:49 -0700 (PDT)
X-Received: by 2002:a05:620a:648d:b0:92e:45e4:c6e with SMTP id af79cd13be357-93bb774e0c1mr329143985a.22.1789554589028;
        Wed, 16 Sep 2026 03:29:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:33 +0300
Subject: [PATCH 17/48] clk: qcom: gcc-qcs8300: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-17-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iXUNYaH4A1wy07zs/nnJgB8Uf+MSyhMYIfjrKnWdaUg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9bHdyf1pQUsGFGKbe1NTNuuW3GVZnsugBB7
 RZUqtuQoSCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWwAKCRAbX0TJAJUV
 VnRFD/9aAyvenpt39gBdAL77al9ea8VCCnd3ONwZM5yjLEym2+QbuiTgYvTjXA8YOfecjxrxkBY
 /1hQuii2CfuX+PAshuqvOiYyCKVt3kpwvUG5GWmymi2rdHBuZsm+SES1WsGmV/3bzC+cheXt6bd
 psvfnHAKjct2pg4PfSQpn12iW4oUtBydRdfk4SymVimdcmYXx6mxz9ApdVDyHIsDgV5bjv83DJh
 VBd4f7/wLQH+vcVpnbfiCQ/UESNmRVwlVrEECvtnWsbDMDCGEXup05HeIp1/oWJzecnqUHe4ayC
 kw0ZEps6TcoWtKpvONdoEBfNePeO8kcXPh23wBKb/22pzaIjCOycRgEjfBM1g+S7Qn0Uu4Xy3p8
 bWbzOW98DgsCrln4CBewz4N8D+zAf2644yaO2Qfo91KiKiJ5RORhjMk0mUSIYojZbvatvaIALz6
 uiG40LvQDbYdpg3qATh2tEA/A10SuRP+uh6i6sd+/YPI81Sbdke5XLNqRzTvhr5hPOdqyu6pZP8
 30wiI2aCq+uWagX0xpObGZ+mGwUOeILUz119yHn7dv5mddruJC8+WjUbjIucW1oMNaKG3F3CMoM
 WujGWdQiXYmvcKS2aLrZ2sjcq2ie2A+CClFNf0dqBf7FkrmsubsRIVGkwqVCZdhGPauZxqsCPjq
 A1Z/BvjKFpjtRsg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6f9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3UFRpwnodxM3
 u+r4f0JOF3AHZKVLz6X+tM2N+moiu8c76wd+nIz1gvX4fi6XBVl+haxiipGt290dSRK4O1NMDb+
 yrxTUgvbucMGstnflnw0wYLt36VpYNQvHpNJs5BcZG99hRVPBSQuoeJlmleI0fGsrqGBMvCn9k8
 uvqvb9Elc+mzBDlfXXg+QTliycHgyN8NsATqgIPuD9wHDTkUTchMWWmKne+AFprR9YjXCSvEJSm
 41anIDMTQXYSUepeBWOkq8KvpHEqTzcdyn3NjqJx6zqg+CqiMNh9KKNYptres8is7VTAr6TBb56
 EacFPiyAZ+SE7zimFF+Pw2BOtHcp2lTId7UvASBoerXIdfngDjXUg+Gmb9rC4koupw4V4pM2rUL
 9w01oUcfY5uQ0eE/QlDsL9sMkZFjLqkaej2i0Y+oF/18KKz8DisrT/WSo92oC+x6RLwgrs89pKz
 1UhRaUGkBhleK+mn7gw==
X-Proofpoint-GUID: 4Dn524yCLoaisqlsxCD6nq3ReuzVtLjy
X-Proofpoint-ORIG-GUID: 4Dn524yCLoaisqlsxCD6nq3ReuzVtLjy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7XzjM0NIYE33
 DyVwGxiuRrSje+9TAgwOp9AydTTfaPyaPOZiiJmX57zZzwvkbnm/4aL0kE3PxvAFg/nVsVPPBnf
 EUpQaZJqlPx+qHz90qleiFjSoU1fCss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 51 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 146b3b5dfead..1d2976aedc51 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -3673,7 +3673,32 @@ static const struct regmap_config gcc_qcs8300_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_qcs8300_critical_cbcrs[] = {
+	0x32004, /* GCC_CAMERA_AHB_CLK */
+	0x32020, /* GCC_CAMERA_XO_CLK */
+	0x33004, /* GCC_DISP_AHB_CLK */
+	0x33018, /* GCC_DISP_XO_CLK */
+	0x7d004, /* GCC_GPU_CFG_AHB_CLK */
+	0x34004, /* GCC_VIDEO_AHB_CLK */
+	0x34024, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_qcs8300_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_qcs8300_driver_data = {
+	.clk_cbcrs = gcc_qcs8300_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcs8300_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_qcs8300_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_qcs8300_desc = {
+	.driver_data = &gcc_qcs8300_driver_data,
 	.config = &gcc_qcs8300_regmap_config,
 	.clks = gcc_qcs8300_clocks,
 	.num_clks = ARRAY_SIZE(gcc_qcs8300_clocks),
@@ -3691,31 +3716,7 @@ MODULE_DEVICE_TABLE(of, gcc_qcs8300_match_table);
 
 static int gcc_qcs8300_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_qcs8300_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_qcs8300_desc);
 }
 
 static struct platform_driver gcc_qcs8300_driver = {

-- 
2.54.0

