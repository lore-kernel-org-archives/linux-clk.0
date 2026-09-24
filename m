Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7F9486E41
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251695; cv=none; b=ocAu+40bpWydJ1YE35UsqOlHJSYRMAphisEq2tkBV0iT7DBBpIbyuJV0lKRwLR+FVwtRmkW1sEWXGbG7WtKbirkUQOz0aJwufXXte9LNLWK/fLh3aEhfd4FFPoBlwf/wbVJEH81i+hjwcy0ILw/TcTEUc9gqDnWtiMQg1WGAjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251695; c=relaxed/simple;
	bh=VDhDWMgzMC0PXchZby/wnzpwg3D+h8413NPkY9yBXp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cVVpshVHGZAaTf3qutIoRXHGkTtXY29eC1iE84L6oilgbqVU6VB9/N/oEgNr4T96avRBVcl5lrOFpbHAO7qoWTnegBfz0s/CUWu4C6fS0dC35GLAMCiet3B6v8BdkCG8pLbzNJ8DCDX1p8SE0fh8AQ2AVPKjbjv7aUYIjhD2Uxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEUCEKmu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N9yc+UTq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEUCEKmu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N9yc+UTq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4aYx3282852
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PmV+jegEhd1deuQZcEWItaphXBp+1so+sxalh4iYq0=; b=HEUCEKmu4smDKSbu
	VBf9H8Mq/H1dgLFeTvKb3XY+MiINclJ3HMDB8X5Kar9xShZZCbE9grPIVW046fs0
	XmR0dCZ0dYdumen5kVhHcwMTRnoAQuLaVAVrzBFT/vZzypfipnxJRTpEjHmW4D3t
	Z+iizcfy4uD2F/yiZcZndlO1Ov1fpcq56wMg0hkBBdPHDcG/9uRD09JRvGc8qulJ
	5L2Khk8reEEYqZ+E44nrspWcvRqRd4QNR3xtHj3nDpfYmRcjEMiuJxXO3KrElSCE
	f+mgHAYjHTnZ0Q+hsF7QxCTyX8C4feXSl2krZY487tht2+LUh9J5jFRr7Bg8OuJK
	jAtdOw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a532e31dadso1932404137.1
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251688; x=1790856488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PmV+jegEhd1deuQZcEWItaphXBp+1so+sxalh4iYq0=;
        b=N9yc+UTq0RMmRTu3aqNIA8Rd2d6ZekP7U8aNZX+NTm8qnJqVbNh/Q/gV/066pOnZhC
         Hr3fB+dCUSRp0mVBHQfiMQWCcGDZ50tVsCwjLz+W5Gy4j5XhL+PG8fRObm24MFtjw5ZF
         xLQ5GmCvK8ZhynmXEhvvc+oDDBV3NszN16LjPVqDKiB03S3m0c1jqr0tmEgYmsXcGGly
         PrxcC7+aO50jQzLAOw0Vd0Wrek+6G0Ura6AQP5yGWhroMhTSgNX7zEx5duYJzkfIhhwO
         QuTxMCmlREbKG67twlZvzuyS911voCtlNdWo26eflilFja/dqNXcY4qxvp6iZXbng4MR
         eyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251688; x=1790856488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PmV+jegEhd1deuQZcEWItaphXBp+1so+sxalh4iYq0=;
        b=hd51DDLt2VKTmiTwHCIXZkIOSU6q3G6dEIk7ovYNqdi4aR+fBktgopjWtHqU89pNEf
         fVDhxGJaBVeRXzS0tvPJ5dVv63husXJuml/g8srWOBC5Dpphv63vZdlqj3nxngPWfDb+
         YOUn3S8wXV0CX1wSfBhRYigjWtezGIthTs7H2S1ZcMNp5XuplIwA8WPGjdy/xfjQhg15
         Me29NoWi/Az27OLmwJItzqKs+aAMHwN6CRIsl27gGzOQqN2OjpOjeb7PjG7e09aUjhPR
         7EHGWEBboMzPfGSS6xnomzejqelOxl5W42pIiHPGP4f3j35S39Df20xrFXcKF/0lQ1r6
         r12Q==
X-Forwarded-Encrypted: i=1; AKwUvBzh71qrZDk0h/3x0aEc+C7aQsbUkbtcJPHIB/OceBFLqOIKhVlTe6biV/GqrAyirEj15JzzHEu4ra0=@vger.kernel.org
X-Gm-Message-State: AFuF++nYPYNg1GpLirotj/lktHr5M2nh+Farx7nWSKV3oQpOmaoLmIXb
	ziXeCh8dJAfNsy25HYuayKbqH7gqNlyrJdXIp0MrcjAb067UxeZ+mVbx6qUtxyI9iYqzxgUSVs0
	hkDZWpKdvzk2Eml1ZOS+Cj8K1/Rn4bsrKVS4xGzrc1yIneeX6j2bs3U4X8vdpQyM=
X-Gm-Gg: AYBFou0nF9tBdWB4zsZ9w2s34rlr0lU51es9GTpxnAjPfBl2m/HP9aaTfd8OVfdjJqs
	1oWdIh9kkzAj+F25vkCvBdJBEzrZ1O+pG2V2tX3xqBq5/grI8OZtwpTlVK45KQQR0Fahrf/gv3W
	788MXZHqWm/DC/jQMGDsRUBybb4wLdl2bwTqPjzvkFfvIIpakiVcQKFDObF5VYPQi2HCM6TVU0u
	hqulBVfj1lqtjdEn/qIo8e1bcQJkXi3RyVwjCJ6dzwM4hJfCX65kDZ7XxJKri2vnTVVvarr9dbT
	vWgQmbGCJGVQsezsRCTep8fcx8XVJLL0lnrtkAYwpV3n0XNeOliutWpwFQ82V3OPcEjKI2pXLY3
	hqI84LFe3
X-Received: by 2002:a05:6102:808b:b0:7a7:198b:6749 with SMTP id ada2fe7eead31-7af1eef1fd5mr1109164137.30.1790251687366;
        Thu, 24 Sep 2026 05:08:07 -0700 (PDT)
X-Received: by 2002:a05:6102:808b:b0:7a7:198b:6749 with SMTP id ada2fe7eead31-7af1eef1fd5mr1109143137.30.1790251686611;
        Thu, 24 Sep 2026 05:08:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:29 +0300
Subject: [PATCH v2 17/48] clk: qcom: gcc-qcs8300: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-17-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VDhDWMgzMC0PXchZby/wnzpwg3D+h8413NPkY9yBXp4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJR/mVQkWUg9EXLx4C98b1vxKmJgAiCYcnQL
 cttsUvo6F6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUQAKCRAbX0TJAJUV
 Vh13EAC6lQ0nuxF9L7sX69f+YJeNpRMJ/BeBBCZ8TMluh6D0PfIyLxpjOYVKiBMmQMdLianreX6
 EG0JGmnRl1GhblMJi0QemGiC8kn+YzS5yWe/354fUTqUdPmiK56mfDL4LgtE35vuFuxODZ/l0Di
 /jkSQqPckhxP0mGUUJq/erCnRfDwLB+pPSTgNR9QN781whiBcOfKb66cL2/h7Xo6i79DqXV+bH/
 sdZCyrJcGUF+j0SYG/Jdh5hiYgijrPKumaw4PZloeRTqzNu3LN0F+cX1WOD22nh2V0C3iZK3bmW
 p5a4hwnlGlqRfOD2aPrpuuXWiaxEacTH8WSyWcVtwC7EV6hzdvBqTQVCfDTMlKaZr7ompcUBbFe
 wYDpFVD6tTQ3oNr4Y9m8sGbfUy78wG3GDRTiAtSepkWx2An3sPnbotu2iuxiqBmcHwEj3sx2S5E
 UBLcUf8blXiyOsKglPDyaL1ytMZ7aYlaKg91LNZUBAxRIFJ+5sAPmQ3nvj9ZcMrb7RdS6ryrhhY
 /+4tr4yhOJMK7ebLjZUOBc8Mhh75PCngj5Ci2hfAX2AJ0ZUIdHPxrvmUdEd1jzevZTLaikyzpMQ
 954hI9NLW/WefSnCk7xV3mSfk0lwplpqK9c/z77boWDxObKOGYVhuz9VgROZJUTX9/VUy/ykm3F
 UK7lH7Of+IsCAlQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1RM/z/rdhIoE
 Q3gwK2KyE28JBt23M+Uz7yUXDQqij81XY8bQuN3BHo8VNyuRG+xnYY3VXUPjzg6XnHQMCUTgGbu
 IgsCKRwUw4+hmgZn4b54gswfwUvFdbI=
X-Proofpoint-ORIG-GUID: djdHy_wPirIQFiNF7y7SpWvyEtCxUkRr
X-Proofpoint-GUID: djdHy_wPirIQFiNF7y7SpWvyEtCxUkRr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6uDJyek+ulhm
 7PK1e83OmtBlmQWU79YrGyyTKTqrDyIT2difYHKEFKFRAy3WWGzvcq+d231Cx0kb4PI0OxM7Zb4
 GIxOi6rEc/aDtzhZHG6mcstk01SbmB0w08rFmhzU22bNO+VvvcI2WUodTggSXWPdIviB/WAIQ3F
 M8S9co+2gZ+yZxaTyJZbjBDHME4hags08s4aQxYK1CqhJB2qs9aKREyB/6xouR+PJPnd8564hWr
 fIYfrJ3i7/r6JhhStdQa/5W+neGQlIEUmSsyHpo2lV8mmYoFj+KF1TL/0Na9VH42tfoWKWmkyJH
 JwUzTZiI6DksBZjPHkJRdkBW0EpjYEMLZLp52915Del6v51VAVMQ4StHvLL0MgrpsJlRLpu51vK
 +tbDoe/NOj2QewoVwIA080DJHDPOdsoTbTgvkJsjceJvF6EjS14D1AbKVSOgLljxI24neeiU8Wv
 1hb3RIGdjE1Pbb37zYQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512a9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs8300.c | 51 +++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 57014c4f8c6d..b95ad566cde3 100644
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

