Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7560D48E0F0
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251710; cv=none; b=mGZ9lqWenaBpX7Fx5pHIMthY5SjMUxJM/1OQIjl21G51crXysPOkDJ4Epu5mV5hfEXAwUF/bpyupDulOEm55V79I/bxKzokUJI9W41QISKDfYfzE3DHgAEwaOlOeZuad3AHS+kDTFRe8/RPX6s2CmLDRjIFmY0z05LTbC7/DeBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251710; c=relaxed/simple;
	bh=wVicLqiZaHQpK4cKVmkBC7c152NCcZk0J3UuKxOSObc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWTabVliG+7zy+anO0jLktoLVv1s0pjS1eCCDUMGkXyWw2+8NKkppeOc3zWQhB6xN/BWsbQxSeK6+sf9nUoJcQklppO5J/2e346dPxzoZmeuTx3mdZAlkHKuN2hf3tM+v2KWknsgsO/emwV6l7OuVC55i7GwtsO4V8LBfDNgUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQLw1D5Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbdbnMH8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQLw1D5Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbdbnMH8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4vfW1630822
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wINPiwHQP2iJKtxxSgOnW9V9KgSkxNNXYHVR48986qQ=; b=nQLw1D5Qi8F5IWAf
	HoPMrVh4HJ80lMMytF6QNKhOFZrckwc3c/8mn6u78Wcr5gj0a7fxTJYZ1P+IASN1
	p1G90RYq6WwDkLLe2ZkXtJr7L/uoeV+Ml5WwawyzgNRISjTvqCPF+5Nn3RZrdUNh
	3huOwTrscAOUyC+hUo+M9lrC4y1lmUFZlLCVxjaTAJChBVxJUoFN8+En49rjZvVC
	rMEx8ipj3jB1vxHFzVT0sPD5RRSNTkRXrJuQit4yOZ20tjIMxEBzLCvbTegl7zRV
	N096AHXnMegHkjaCXOKW743spbo+NcNQA4RzTBG15EZSTWQj+QxsfKjUWDWhUKTX
	zAWm5g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:08:28 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a5a291af3so1819563137.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251708; x=1790856508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wINPiwHQP2iJKtxxSgOnW9V9KgSkxNNXYHVR48986qQ=;
        b=IbdbnMH8zB432dVFPoNrwXxGhNZtvRayZGu6E3sPhTRkxCHmpx2fp8xpS8C8HDZNXj
         H+/lv4hVqVF0JA81ApZ7ejj0WxTi/hprOAV6374djPC/g9AN18mofnLQRUPEN50/Ym1c
         JTnlOc3GChAZi55uH7fxzSBMdrP9jz7wSBHoGD60y5JUVxpAopR6HuXA8HS513EpkOfC
         rH/oHP+E0EsLAyXrMlEkp5iIKGvbigjcecPd9TK5qgd0SNTl0NNS1ymyuy/GDVDvUNyX
         VPpSrFfPTffy/3UkaGCSWEY0RXaRkyPZKLW/J9JYSu/pAALY//+Ol8hmdGqyd7cbFTgj
         7rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251708; x=1790856508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wINPiwHQP2iJKtxxSgOnW9V9KgSkxNNXYHVR48986qQ=;
        b=P/gVYt2+QPfwPwi9f/xnfwIPtyt9AkdLH6PSQZpphUOJOwjdKxgxKJmT7qnGuUW56E
         MTwpQc0+wDV2uxmj0C9+gURXW12A+JXIDBhDGOExTY+d242H4HmDqy+7ek7zRd6jGpbk
         HJWGrowVPkz4U8G7dK9L6om6PDzriEsS1lPFbqs6kxOhRRIveql84IxPhJRPF5BJjh9i
         GcGNl2CD3J5lOO2TLOb+Uf/v29j58Oi3261t3Y8R0LT6KWocdAUF442z3RPcOL3APVNq
         ZqiP3ak7xhBFCEBCREoRRxzAhVyguT0fku42fa/4Y91nBrviQszVWEExO9zbRyj/QukX
         RpnQ==
X-Forwarded-Encrypted: i=1; AKwUvByQX2pFJYuKHBR1ohmo+SmgKYCuIz0Wgpcr8JndsIsa3G92cWDX6PcI4gSaHCmMeVSY2xD2iAP4Wvk=@vger.kernel.org
X-Gm-Message-State: AFuF++k/0ZEuhmDXcyg6X0RLIM5y71C62wMbEAxRPweZ6FprVTP2uGDs
	qBkB/mPRKp1BYsY6RIa1wgkdAbnUTqiN/3n4t4U8WVLQ5Fsh/NF0M3JuhwOAP6fe+qebIo6+1ik
	LJ1dzbOqF0LR9jLVj/PhxCBOkxquYqLxb7+hzpjWHZEGbPnDP7PGhFWX49JiJ4Hw=
X-Gm-Gg: AYBFou0FafxpIad3oguqNB9ApZR6DiDFd8136kbPgcipinBA+GayMAYuRlVaASxFzID
	X5ZYzhsAeO0Pri0m03OQZYwu4RLKuSzMi39sImflNAIoiHy+kV2iWMsS53Bk3ZvwG+uOU8jUwIo
	ngepKBRd7ZceSe33xDeJAjdNdOyRI3XQHnq2XTCudUZnHGNx6mlYMxYlSoKbk/gzAA6QVtnxW5w
	aNJ8mGzMNV0T/wjs66X6m1+AHmdyqmr8R2G5pWphv81Oex5CIjl9PWGuG3cuGtPMEdKqpCulQbp
	6NTFNCDvHBVbVQpkk0s2Ih9bqrQhggwOR/Pvh/dmPjV0rML8/ZBhbq7Aq294wAlRNLK+UxJXir4
	AwzFQlrW7b2lKZsqdYXM=
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr1224249137.18.1790251707577;
        Thu, 24 Sep 2026 05:08:27 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr1224228137.18.1790251706758;
        Thu, 24 Sep 2026 05:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:37 +0300
Subject: [PATCH v2 25/48] clk: qcom: gcc-sdx75: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-25-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2188;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wVicLqiZaHQpK4cKVmkBC7c152NCcZk0J3UuKxOSObc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJZ6iWqAkUXQbMJbRt1TGihJgwVSz1IphPjQ
 61ItvgGD5mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSWQAKCRAbX0TJAJUV
 VpT9EACIJ9g7XWxUokYjlrQaNwLp0isvM5oj3cVSJTMlG794pYt5M3/640ayDzZHqQtug9amfob
 sZbNzRMVx8vI5mruED04PDsOnlvbCzBh20CpRcEyxbe6mkBxJVK5/tmG/LmcnD9lOVM2bENwBZ+
 nPTQ90sBKq2sfhV4NUVYEGmWawhfbFdlYK8QmNwNO2dghtiSKlDzNNPxe6lvIZMH3PPOy888WIP
 0nyqyMUKi/NBuAICRDXDRAZ4HaGbbtP5oIcPOHUmhoJCvbqb4LTrvSxHhBDnepZdXkMmeOzBxzM
 DI5SwAHIwOk/+2ndzF+8uFKDf6pdd6OPQeXuh/0w0uG7lqzIe7amD9d7Fuob76oJOmcaJAHj5Zn
 dLoxiwfdxyZORUWH4w6XDeDJd7pHQqdZvTb+3gfAc+iJIIfVbxp4uF52puuKW0kg0i6uI6DaZyS
 S5Z3qbK2OYx7lPBQE9BXjDMyUBDc7DKYF06SNhyESJb8SKj0jh3ChjhTG6M4SiyJGB1VpE5X5+y
 ASDlq5WZiriT1JMpLZlAdCQO63Ef4YwPHqnGFNeyZjHsE7BiFuUGpu8KLv7OVN8RQLEMyyziZ7X
 hdYGfVgf9TNEBOwmQQusKlOgUVyVDy1qHj5/vgkBcbGszXdwLlQaasAh6N8+0Po4MMPz+7k8I0D
 SHYOvdVcf1XCWGQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXy0GS9ztEGSBL
 96xnlMdmGA791wNW4hATAX6nGA9wG7uRivBIL44i9HSpefb+C75lOXPSd8EqLyR46FMLuR8FVC5
 C3hDCkhjMGJDxGUEsracwEZ0SbwiLw0=
X-Proofpoint-GUID: agrYmvHEYjzXwlzey4Q1x4mn5-lBSwZi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1Yi7W3cTFDjd
 UZca/Qpo6TmdNB6m/WG7cHbTv8X/T0KmlqpPW5JgdXhw/kO711poNJ8ed0wNE5lD3ayChEECcD0
 9yYugugU/FPYZ2/0gtKdGxtuWT/g3cy8WLqYJiJUeSpdtHMHq3Ga6n0bZ5HPpLB0xndrXf4PzxG
 IDP5yll1tKAbCG3J/YGpl24RDI1Pc2vkxq4RdWu3wkytbozj+7jwuS2wKddpfiC0CEE2rxAF6GX
 2Gbp0MPJ1yN5vF8U0k9dujo88suRvnZdU6dg9VJkj1uUwHAYk/x1qBOsNOgOrnVW4Rnl+lSZIYn
 Xpk1Mw0Vx1DQARKzBmLcr3BcugrBRSFSneUoCVPtwEwJUrswlkfdKvW29A9XRyJmzDBU5f3EESQ
 fqeb8Soxbx6YR6oRTUh75nXDtYGJqn4VYxgAcdsm9NFWYEfpNYDy97j7djs62h+Nvqk5IUjul5S
 ChugRArIUMUj2a70PNw==
X-Proofpoint-ORIG-GUID: agrYmvHEYjzXwlzey4Q1x4mn5-lBSwZi
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512bc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index ce9f19655d6d..035647627f91 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2905,7 +2905,20 @@ static const struct regmap_config gcc_sdx75_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sdx75_critical_cbcrs[] = {
+	0x3e004, /* GCC_AHB_PCIE_LINK_CLK */
+	0x3e008, /* GCC_XO_PCIE_LINK_CLK */
+};
+
+static const struct qcom_cc_driver_data gcc_sdx75_driver_data = {
+	.clk_cbcrs = gcc_sdx75_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx75_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sdx75_desc = {
+	.driver_data = &gcc_sdx75_driver_data,
 	.config = &gcc_sdx75_regmap_config,
 	.clks = gcc_sdx75_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx75_clocks),
@@ -2923,23 +2936,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx75_match_table);
 
 static int gcc_sdx75_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx75_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x3e004); /* GCC_AHB_PCIE_LINK_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3e008); /* GCC_XO_PCIE_LINK_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx75_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx75_desc);
 }
 
 static struct platform_driver gcc_sdx75_driver = {

-- 
2.54.0

