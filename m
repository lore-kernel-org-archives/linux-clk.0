Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8983548380C
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251744; cv=none; b=MvGBewh7QitLEs9jYTPDrUQkDx2FFqvADujpej+sz1mOCQ6icRpm+qVWpZy6CuSy6eI03TARUqHvLIdcC75FWDVimXh4R+POed1+36c0NSqOYlzh90MkczdTRTUGLMLlQG3I8Q8OdHvj1Z8PCH1XDLm6lnOBAxYIsErktHNK9AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251744; c=relaxed/simple;
	bh=rY7wgkiQmG20BFEGFvP0I4E2oVi8REXs0MtZfXyGIvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bhh6UC+lF5gok/FaaXMEXBloOty8kPDwvmqS+VfI4v7Fvge9PDf9Joy4BTKq9MTtdc6UE9YlSG+armv1kK54BzDcpAOqhR9cm3cxOXxMo646gq+jmpPDnwdH60G/auT0HM3y/KDVy573ji0XRB8lJsFwTtWwZt+PkV/Ch5zJ7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMadr6Nx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+2Id+6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMadr6Nx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+2Id+6v"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4gAQ3134242
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PW/zkK58dpl81VK/4qo8pV07u1jHEot7u5W775V9u4=; b=GMadr6NxaJNQ5uw2
	vlRiu1AZFsXPdh9t2ZrFHQ0ZFjLnJDxGHMG1YXNAt/Wflh+qvfawAmAI28pyr/r5
	k+OBUEcJcJmUIlRHxSyr3sCm6hrrea7F+bI8+FO519lJLWQyKaC4dqrgkw2IfP5/
	oI7fga3Zrx1esuNkZhuymWrGyRUiXEugt72bKucTqxJ1e0LTyqEb5MABT8pzX9ni
	GCyE6Y64Kr+z0AiDhWDSLy5EZWs+oc1AolbO58S5Z3cSAJVRt+8Dz7i/eDWH4qMc
	db4fusxgvCvIz5Wjb/us0q1ShtqaReA5/WIaTBtxBSTXHdb9WqdEyoRAqnxyyxtf
	le9/+g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1raggny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso692598e0c.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251740; x=1790856540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PW/zkK58dpl81VK/4qo8pV07u1jHEot7u5W775V9u4=;
        b=E+2Id+6v9ZWUFWgblNuBxELQJbA5rE2Fa67MNzWnbiQNzu8Cy+gNPfwcQPnSkxz+6K
         uw/NHG8to1t4u+06GPpd5gjBsW6PWXafqoEEKk/JZj5NkYq8ZyYt0JbnZqW84ANOacQb
         p1JdP+KPBjQbS49xOhJhkQAD7KFiBkgVbZe8kUD2b0WTxnEDMKU41v7MgC7T1YMh6tVs
         qTjyyxSYiWatNuj6s4vlrBhys3Ku1hg1bex5zvKXKAhfqx1V3Ay50txeo993MCw9VdTf
         SDYu4751f1AN4Ffq+h66XtSLGBW81YdFo99Ay5POEvvnWyfVwz8Uu4INz8TCWX7g5inw
         ha/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251740; x=1790856540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PW/zkK58dpl81VK/4qo8pV07u1jHEot7u5W775V9u4=;
        b=t/TgLi9kRk3saDmg4qvZo0Vz95Bow/+u8WNNo3dkiFVhSpwK8FyDyUzkL17cJvYSni
         kiODVqTifsq0JJAV6elhIIq7PtxL+BSxnBPFg5yDtgCOKCbctimKRVsk5zUbcR+yu+3Q
         7LtHgN+JI+3C0ciAnwR7vZC6gad5ZT9YPWb9TRLCPC9L8i5xergIdCiWpxSDv0PpnrbO
         ZCDRvFCSA8w54j6LU+sHvdbNGVS7uRe/rjMvPEWcKx3K7CCuT/e+LP9+FXH5CRXBvxqI
         S2G9GkRzIBl86dm8JvgezSiWH5OgsLqRJOwpJbz20JV1SqrwwjMkWXypqwzTKNPKr+bW
         sm2A==
X-Forwarded-Encrypted: i=1; AKwUvBzt4G5idR5HU7+F3CIT+5smZupVMeEeKPfMQ3Euhu0tax3SbXmG8T2N2ByOW/QVvtPV3CjxTrExi7A=@vger.kernel.org
X-Gm-Message-State: AFuF++l+FTBCzGhuBz295G57jbxpLzAvxNaz3T9bYx3r63Tya3p5iZEe
	vpZC9bOVhTaYPB2mQrx36xg/dxeTuKCRFDqvRi4f/6Ma76YidY/hqVIRw/FLATzQnHDnnxFbqDz
	HLWCGVN891wXT911KSRl8VcYpnN3w5fruOclTXX63KCPvDiTs3KZFWz1H5KHQwI4=
X-Gm-Gg: AYBFou0tIEwtrqcrHVNP2yKOSJEJ0lUFMlhElLOpen5fzG0alQHsi/d6sMZXD+VqltG
	qVqVCikc0h+LVhRNaHYjHYeFiQOoG0BRYRuo/0JKnS6lqnjWx0YvquEMRnBjmVSa7fwaOW6OrtL
	6MJnRTxT5XNI1lX1w6dsLOfGb2UVhw7ugAWz3BWFfslCHBO3tZ3wN6KOLyqsSeRvuuNCp+8YRSR
	Em8wwioZN+gf6jxHQsNXRSk0h23h6pYkzHM6hGAhjv9Tu7pFtxmF/CivRoknWnGt2hGgxS9VSt7
	8N8LGDC5aNntxoNDfw3xdw5KNHqDQK9jJcVDiNbaYSjN/D+TkHTWGXpczHU8LsvYnmtW7Rcwupf
	Qmc/rsoGC
X-Received: by 2002:a05:6102:4b11:b0:7a7:36ed:4b43 with SMTP id ada2fe7eead31-7af1eff6667mr853404137.25.1790251740170;
        Thu, 24 Sep 2026 05:09:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a7:36ed:4b43 with SMTP id ada2fe7eead31-7af1eff6667mr853394137.25.1790251739560;
        Thu, 24 Sep 2026 05:08:59 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:48 +0300
Subject: [PATCH v2 36/48] clk: qcom: gpucc-sar2130p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-36-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rY7wgkiQmG20BFEGFvP0I4E2oVi8REXs0MtZfXyGIvs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJkRfd7+v5hA45Elj+8OnFoV0Dv48n9myJHb
 +igJm+qFsOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZAAKCRAbX0TJAJUV
 VtJtD/9Bs5HoRLWMA3+F2VAkRdXLwilTCmynPrurTptuvvBLSvDg96BMoILWLxu0RRd8nDPKU9h
 vBmgcfNuYOIq4ZiNBtl+FZx5f2PIMq5dSgOchNkWgTp4mtjcEHdIZnExYFGdO8Z3IXLpL13nnCl
 bmHpm6pG+CwroCiEw6sJaw3yuUJQEPZeesoGQWeU0hnDoZGXxy2x+R5/+0CldNPp4dN1KWxxwsL
 VTkfB5E/GDonwz+Pr/8nc54CndnFqTgtACUvnqzhmVtCUJGQCg78xeE90TK5qXbJYkmeCE2/Okv
 IYNGJ8t5V3qSlhKPYQBHBvI1EaGKCHi0KHNOwRtfeZT++Ap/odnPkSX4jn7bxqdJfPTalGTH83M
 OM2WxJFJBTnR1ydFNw0xRzYYgcuTRYRNy1WN8e25OzZwyiymA2RKDz8HtXTxLlLV0kFZO+KxXzt
 Gztom8QQx4506/kZm0mwlWbFI0mzJDFO+xkOQO4XmM0iMiW4t8BaOQDWZqZzzjp6p8L7gp1Oogq
 7elImwNO4NFD2p+cjixNYS1etJCiAVSn8uMehAmjRQZ9pRN4EOv3/D87vGF8aj13YTOjkQlbs+s
 Eb7bBsNH8KHOfqQnDx6NOJYAgyxbmyix2f7ZiUM8kaMosEGISz+1/dFJiwyiosOpqdiwjQN5upF
 tcsNqkrLLwBevMw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6ZelgLo1AQ30
 L0IHUcMfSxdFuoe28uZBXG36MZy5Gv0A+b+TxmuQLkFCGgP0ZpfPRe9cm1hd+Ec65dqbqYUA1cz
 dk5DT3FLR8ObrfbIfUHDmKEbzI7MXWCuE74j+bwxfACR30g4j5g5QC3ac1L7/rOBMMjj66cy+BD
 2AL8HQW7chy17nXpWq3TJff2ohl03HxISGNd/HR+HPmYvTDXT4uiTlRN+7eck6+H3gCffWUNnZn
 /NZrOanoXuU/Kf/qFn4Fnk85PRAtXBmMph4m/ukj+DhbC7T1gQe7c4y5l13hweJLINGbvwiK5+4
 Mx4Y3B/apU5t7nNxXFarI0Jys/v3VLCEDV0j+kIKkHrweFZKzOgUVWSaWH7/eID7OLsknGVO12i
 EvoaY5aRjCo8ryPzvbg+zKPXrLJfo00gJI984jUbWoI9Gxu7v1OO22E+ErqRWZPXhixnFeYkT8o
 wYDMH+MwM4DI6K7g/FA==
X-Proofpoint-ORIG-GUID: oOjJcqalj-iBJt5wetpyqnSG1mIOnT4o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/rSTq6wu8FSy
 Npk8TdobLI2oK2B5BiVccBAGwxpynciLJWz6xag58JDWb3itNi72G1RralOrYA4t9UgzOwTfD7Q
 e4vlns+qXBvLxTGwZ3aP8ea2QbSK8UI=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab512dd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: oOjJcqalj-iBJt5wetpyqnSG1mIOnT4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sar2130p.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sar2130p.c b/drivers/clk/qcom/gpucc-sar2130p.c
index dd72b2a48c42..fa261664c1bf 100644
--- a/drivers/clk/qcom/gpucc-sar2130p.c
+++ b/drivers/clk/qcom/gpucc-sar2130p.c
@@ -455,7 +455,17 @@ static const struct regmap_config gpu_cc_sar2130p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sar2130p_critical_cbcrs[] = {
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sar2130p_driver_data = {
+	.clk_cbcrs = gpu_cc_sar2130p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sar2130p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sar2130p_desc = {
+	.driver_data = &gpu_cc_sar2130p_driver_data,
 	.config = &gpu_cc_sar2130p_regmap_config,
 	.clks = gpu_cc_sar2130p_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sar2130p_clocks),
@@ -483,9 +493,6 @@ static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
 }
 

-- 
2.54.0

