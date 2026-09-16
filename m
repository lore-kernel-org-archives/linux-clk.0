Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1754EE841
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554624; cv=none; b=sZhjPekTc1I/AoDv5ReAWtaQzM4ZsC7DucHFDlQ/viskH5cm9I5RxGoGZMYIpLmNfEFd18dsUL6L1tjdKwrpZHYyhS+0rX76JbQmeDaXN91JFtrUPwEM92QvRhHq8yDyVEUSSc2BzX/nHFhonIWtvEP5heBIUv8kiLBM5KoyJuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554624; c=relaxed/simple;
	bh=jjpSEsuYLIeV3ZD1JGI6Fq2VkSzt0HuQGhCBFEHbBCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHIusTV2fsAoZNlM8zh9HW3M/nlVZP4LiQPB7KtBWiW3OllO/x25VMd2YidqFmiHG6bTDa+TpparWQe7MoGUgUY1wL3efhsyQCwyjr1wIA4C/WguRTgpHvjho59QET3RQBanLXu/OqeuyVpvSMJfEqKbHpgp/F3AT+48/1WesfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dgaxQEpZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2jKBMed; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dgaxQEpZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2jKBMed"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G930ij2822787
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tDazfgkzhkNAsDVOAy7aO7vlveA6tIubG+a316jZefs=; b=dgaxQEpZKRJHAbBR
	0dupKY5HEoPszmHKUZ2s/3t5vCvv3RX/Q6a0YxVtF2Z/1eq6VYjf7JqVtdckFdKM
	MbBLEKFeJZoA0i49GkmJSX7fDVom49Mn3c88OZrYlPPaE9lBvVfLMpRBPlssdcyp
	0Dwa+HFJu8SJiGdRbk5vAZqivE0HGIse3ydnWeZCELjonnQx1YcceQAJeXb9xEzL
	KmUoz9k99K8Sb7UNp2s40089Fuid1okRuXa6CMgFYQykzUJNUfvcLw6pCDAoAZwy
	wKt408OmgBKjUcUfrbmzRrny5BVcd7+xolEeljtmBjNqCQyYegvEJuRir0ENMvUv
	MzZ15w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a01d1d1b6so703011185a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554597; x=1790159397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDazfgkzhkNAsDVOAy7aO7vlveA6tIubG+a316jZefs=;
        b=S2jKBMedXhvEn+j8lObwHYYCdVvpfYoi6inl+KhzzKFs1j/YhJRioZOIuV72/iGRHY
         uUobVBP3L8lfAMODX5wdMDhZpkKDsRR724BpQt/HwYXw8Usl27anWIA6EqckIAhEVB8u
         AxHpBfzQWLcIqPqlS64n33RioQTxXV9dcJrm2G3XAB+LBbo3S5aLMQof7tMzffVFKVpb
         DerC8dk3G4qUa815IdmOt5f1X7EOWuN5BXshcKcC6BF8DhoDpggLjZF8P+9KtrtLdmQE
         VHXaJGDaKztBn1a9Fp402/4bz1Xx6w1o+2qi18sSNxm1f4KG5sn0FwcURhjvWkESn3tg
         oD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554597; x=1790159397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDazfgkzhkNAsDVOAy7aO7vlveA6tIubG+a316jZefs=;
        b=vFVbbLxEHtxfBIySLGOn56Xfivlex3PIBiYl4Q39twkdnhZyTrlh4+FVdMXXZlXrjh
         UIcQemyF7XE97/bK5WlvzUaDNg6lQmH10RXjuv2+p+rCajaalTWGPcmi59ztRpq3q+zV
         XHNPGREA9yWGI8oDmNBU6nbHRFzl7PhMpiOGgl0KpVYSxDhC72/f5yT5Jzgfe0FmwlNc
         8t0CGBuXbwGSt5HbeV0wnOK/XnNLj3osePBT5QiuktQOBHadE6nem17Wst43WQtueCom
         iH9d3kwOvkKplp9WMR8VvjJu4e8WFeyXXpA95vC78GxV4In/qhTzUkBoqwtQp/asFnFc
         /2FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzb25A8gS2VHwp1Vb9lC8hwqMmVO3WeewAjezSq7bG0oe7meBlqeOulU3OpPXlGNsPSKjrK1ZuDdqg=@vger.kernel.org
X-Gm-Message-State: AFuF++l8L08dVMzMKPuZENUCeeDX7KCa5AtxngJ0TeWRYzXOl3hxMqfw
	QF6qZMbjubcRByq6uy7jAMu3pp+PiPyOXkLl2yDfR7HkQsKwpkVAaShQ5GJgUc3TI2lA9o5OzIj
	4mPwKXa7AmLk87rOP9hETDhDxINhX1W2hc0OwjL7nN5pIWuVXqzlCAQKCQcVuHxE=
X-Gm-Gg: AYBFou3Ttx4nkcyKPQNKtulTw5x08WRxdPnNlHNtW+pLwfScZC7ctucoXULhDWvUD5m
	dRo8jxp0knHN/cMQLD5098i7tWB1ztPkfb19f0xRS8myP9H5/4dWbDVq1dNBVHYgCgsSFmDkZV2
	LywplAZ+mp0uz2HhwOM+Af18jiTOitnw8fw0v4sNK4LqD6z8WGjUdMvcK3JdDk9Eyj9m1pz7ZPe
	IIkmJ7lzi8V513VkK2A5/wqxZOCN3XxX8GJJyxoIJGElTTvi1NgScYv783sVlsBo7Uqrc/rR/Sq
	vg4jCcS/NjdcfbgHRUXrXxmdocl0quCEQ92Rwry2jYUZgIJ3MWY4U18U4uRuclqtPLdg6NqL1jp
	IJlMv3sI=
X-Received: by 2002:a05:620a:608b:b0:939:f522:b2f7 with SMTP id af79cd13be357-93bb788111bmr306308285a.33.1789554597216;
        Wed, 16 Sep 2026 03:29:57 -0700 (PDT)
X-Received: by 2002:a05:620a:608b:b0:939:f522:b2f7 with SMTP id af79cd13be357-93bb788111bmr306303285a.33.1789554596697;
        Wed, 16 Sep 2026 03:29:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:37 +0300
Subject: [PATCH 21/48] clk: qcom: gcc-sc7280: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-21-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3246;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjpSEsuYLIeV3ZD1JGI6Fq2VkSzt0HuQGhCBFEHbBCI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9fT4rwBwVIiJQHL9565Ie2w4EFKDnPXG6Av
 0rEVGgPSwWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvXwAKCRAbX0TJAJUV
 VkdZEACflRlJc8+pQdLsh+FFM0qwPBcoWyk8X0z49KsntecR+weO6pTMVg1RqL2N5JGeo5RMnTG
 2usJIVd52t3WFpMsmJwFOz5tLbTu00kIRa/NIN8SP17bQmz/o6a4AiOwjCTMY/PI0RLHAXr6Zbr
 dySCVIJs3EXTDPXPTYs1UXP3W3Rsi7oqqZB4cSMvipOzIGirjbpEHJHwboOoXbxvXz+r9OfjEJk
 /i9AY02rqduF1OQ5NqNntO9MhGmlPmMAWmD5lqTnGRrHr6Fj4bLYB+awn5H1DSrAZrPxejrJ3sQ
 ZgI6Osmte0oF3+pyUMlGFCUZn0aoyBgvzvGCY0zDzxCPnejIMQgwQafszV+efzNqO8i3yx7SO9e
 jUT2Q/ibwGq66NNQrXsG1tHXD4gKVJ7epYYrBZ0R1W1uX13ihuVhUU/iDrN3UQv+dL5Ex6ZoT/f
 998GRDBuuhLgNmvhN7JblG+Wk27BTc9BsUuZ5EjuJgn7NjvFeTuPqAlSL+6CB4o54/1QlKt7YPo
 V6+QwkbTJkQKdmBO/8/oxnvbcobSwI6wB4tFFSD325MwGf/ijBaCFfGYi3Ut/uYw3YsPayKWPT5
 k08XuEGElbG5SYL0mF9ubA1hnVSSObH6tq2EbahuFrOVqZ4Ghnwvgo1CDB+5YcT+OE2zB8i6pjo
 BbQPENv7KToVElw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6fa5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxWYgPixL+1VH
 I0Cd1pfH1TZP7UBhJDP7wDsr9gz6xdcAB6/PJ9LkzhnneVDS5YJB8UUITAjI9yEnVFUbjrL0huW
 ddD7lVDpBvczPXCjsf3J8pOGMjE4EH85yzUgnSqVACu0UC9KdcpWpf26USIyG6BUZlEOUoKsJaS
 W5OM27nRQU5JKXuPsT7mOhFlv0LcmScfZQvax41y/yD05gvtaWM+AgAHm+xvNqT38dE3j9yirky
 F5ycLWNymRE9uabyQtbabjiO9zNIlGRiGtsAWMDSs8PcWiPWoOU+XHRZaYtCK9LMgbEqGaKQTwB
 koKqbUtOq+uOzzTDApMbzwqcBILBKxPbvJNzTRQOQMUjwPTDdZPn94UGc+ehSPHVH90g6wV79ck
 tM7M/eLbpY7EGk8/Q0mHfigXJ0PIBVXzz3RqCSxVIK0KBwU3j+40zPQE+dT67nh4ICeD11iFAxf
 n4Br1D3biglIndPFmFg==
X-Proofpoint-GUID: VNSTdWcshoXNdOtOtwU9T-6Chh_I9XG1
X-Proofpoint-ORIG-GUID: VNSTdWcshoXNdOtOtwU9T-6Chh_I9XG1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+ZwTjy0DR958
 9E4RAxt9gbAhwsDKK25oy4kU68Rnlv3j1E99BRVSEmi/G1u10UG4NnLHOR78kPdQt3GBo77rZDH
 +EEbKJOxnCQdfOyGP+BDLGuACT5R2YI=
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
 drivers/clk/qcom/gcc-sc7280.c | 54 ++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 4502926a2691..03913ae16e8f 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -3438,7 +3438,34 @@ static const struct regmap_config gcc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc7280_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x2701c, /* GCC_DISP_XO_CLK */
+	0x28004, /* GCC_VIDEO_AHB_CLK */
+	0x28014, /* GCC_VIDEO_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));
+
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sc7280_driver_data = {
+	.clk_cbcrs = gcc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc7280_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sc7280_desc = {
+	.driver_data = &gcc_sc7280_driver_data,
 	.config = &gcc_sc7280_regmap_config,
 	.clks = gcc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sc7280_clocks),
@@ -3456,32 +3483,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc7280_match_table);
 
 static int gcc_sc7280_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sc7280_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004);/* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028);/* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004);/* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2701c);/* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28004);/* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28014);/* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004);/* GCC_GPU_CFG_AHB_CLK */
-	regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-			ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7280_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sc7280_desc);
 }
 
 static struct platform_driver gcc_sc7280_driver = {

-- 
2.54.0

