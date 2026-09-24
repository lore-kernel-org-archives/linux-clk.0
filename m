Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523D547ACF6
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250434; cv=none; b=ai92A/WK+JKtQVPtY0G0kEj8W43r1QLOgPoJ1l6rk8J+2ETyYXIt3RUb7XdKApoXiqJ8TDI+uwrQs2AcocuOdqtIxlcD6aPo7qBAr4u7ukipmrUQgKWa+cSacJ7LtRPomFbk54QUEwIxCFs+VxiSeAPqchjaCshw664BrPpik4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250434; c=relaxed/simple;
	bh=+ZZoCETzWv0YK42XFmBQielvqyc3AJGlcA0l9tIyK1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BRL17KzXRtdjYxXI0EtngnsLIIou/5ryigQVODRaEvyyMsZx9O0O+rXBycer2jR30NylL6npwjXWDOKpjEz2zfZU/moTDkxmbU/dLusaqB5dq8p5B6nYgEehfOChtg260anzj4JSqo9pqtXjWGepc/cBtmDqCmYAwqTbF1Wg+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0dG4pHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ2ijA6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0dG4pHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ2ijA6L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PNHX2919281
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 11:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tAdxoFtPLUwbYw62OuSece
	gmm7KVlJ1mhus1j1hQCP0=; b=R0dG4pHfLXCl//cq/dVEfYem1jgbKcJW7dOqEL
	7OAoeD9TLqCVGepd9o+4HK4MgOU5e2eZb1umyBPDJOWrg48r1bMG4PKgnWDyje//
	KTTWcxFfXwMpTUUKhaU9tmLbSReJPVXmDViwBL0PEd0NIfNtvFbNf3FCA7xj1XKE
	zcBkDobd8ygN5U5wj/x3sBK43xzeH8jb7KONRY55e0WLhNKpjdZkf+ggDawtk0uY
	+lXqLlueItDZ1V37uguJ/elNKLMmzV4HWx1mlv1TeLhKB9Vs4sJANMOE4RsmyN5B
	5P3hBcDY3bo0yfIEmix8u2AvxQh7JEMRz2Qb3UA1ntx78Atw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujcky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 11:47:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93be1861d2dso297254085a.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790250431; x=1790855231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAdxoFtPLUwbYw62OuSecegmm7KVlJ1mhus1j1hQCP0=;
        b=JQ2ijA6LZPqDJAv+glngLa36zBqzbTdmRhMMfmSBo5YNa69MH1uhj+A7WArOGctvng
         e5oXlELCcpb8Qx/JXkyBvc0SamzCVw+irdu9IizDsb7dvkQ6J6s/LfQy0GlCaggi0JV2
         8lx7XXoCHzW/JtRc6H0WIJ8traD9tJBWtBXzOQfp7S0eQgE132mKBQQGD1X26V+Ja3lg
         CDKF5SCPlgyX7t2l41Y+xMTPczG2FIyFobz4jTFthX9yq6isnl/TdqRrOZf+5yT5GXMT
         VmC0i2ahfPQ+N47/6dJy1t/+nG87u174JKm3PjF9s6DN+Dkrymd9ARdsj6lKqUaJp12L
         a7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250431; x=1790855231;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAdxoFtPLUwbYw62OuSecegmm7KVlJ1mhus1j1hQCP0=;
        b=Vajum32UQM+OndIo+IPGCWLfReS74qyvHHKfCRRtbNia68nWTUsVNRE527SVGm3uwQ
         aBZQpLShV7kIRGc9Pz0mM4ZO8VlBemTwFbm81VunUN0L817Hl9Et8q5sipb+/eJs57Ae
         6Q8A69dM9W6gRum3r0mztsLi+8qqMRXw68ZF2nj4phezOvca3yvfzqjnFHa3njjTdnHU
         J7dLeahkx5ddPvlus6vlCtMCD1W0KUWqhL/BdsvQViY+cRl83ZVXsnqbbEmpzdFKubue
         SSPood+B0c5TvR64TBqYxiXhmz0XGvsu1mPkd1XBVenBGCihjZB/xSZtRg3dxQlJTz99
         U2lA==
X-Forwarded-Encrypted: i=1; AKwUvBypKppeWmJ+2nkEnOPVWkFlGL1wiEQMesMv3sYtK3oQlYQayMKgP3G7oyI2sPMKBSMCeZAHgw9za3M=@vger.kernel.org
X-Gm-Message-State: AFuF++nEDyuX/XCgFh8MgpSl/xzGai6+PGRb6N2hZG2Ari/VuGzbLFJs
	m0Lm3OO2EfYfmY62+pAaDF3dmRnrKZoECZv1G2V6IzYh0zagp4cogmt+SduKCo8An8HKCRs3Jaw
	Ss3U9saJCvsMi1lAL3Wpg6EhGygO6NbMjB85VTdjHy1FK9oPpYscWj2yOdwReMnA=
X-Gm-Gg: AYBFou1v/6mW+XZvYXJrKBHeu3RZnFKdRWh08gDABPJJSc6qgrb27Cgs53nU4RsahXo
	mZHRfFuP4h11TNsPQy0y8VarYyh6fDjZQon62Nsv1dMr4BwaiFthaC5za1110VPpv6MnE8ah2BB
	VZ0Rtb2VlWCi4lo4SZmE23acSJgHZ3b05Vg9FYCvoEcM6ZdpY8GKZEyubZfYWrP+PlEShVrMAQs
	tU4VP1f/xZYmX91cgIMJwG0Mpf6Mcbejcuk6T9VNpjyv0qU2owrwIcJ++IhunZ+ZXiSuEPMpV+L
	5Ij0F73qUS5GM8GcsiCeIQpwz8V/Exxl/r0yEEwqANIdANfdYcuZLtyV9v9bK/uXrMt7xaDg22t
	5g/AVwH3w
X-Received: by 2002:a05:620a:394b:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c3638bdf7mr228847085a.42.1790250431204;
        Thu, 24 Sep 2026 04:47:11 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c3638bdf7mr228842185a.42.1790250430539;
        Thu, 24 Sep 2026 04:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4d12sm58500895e9.4.2026.09.24.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:47:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:47:01 +0300
Subject: [PATCH v2] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v2-1-67275f94aaec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALQNtWoC/52OQQ6DMAwEv4JyrhGxIJSe+o+KA5gE0gIBDKgV4
 u8N9Ae9WB5p7dlNsJ6sZnELNjHp1bJ1vQe8BIKaoq812MqzwAhVlEkF1L5gJNdBTeQXVjIBY99
 Aw8IMde8InDGsZ8AUVSyLOEMZC/9vmLQPnq5H/mNeyqem+RAcicby7KbPWWaVR+4f7ypBQhKVp
 U7xarDCu2MOx6Vo/XkX+iHyfd+/7kKOs/sAAAA=
X-Change-ID: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ZZoCETzWv0YK42XFmBQielvqyc3AJGlcA0l9tIyK1E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtQ26X/dqRnBkkFCiHD5Oa+8Ih0/O9h9tK13Ym
 zN6QAhZhb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUNugAKCRAbX0TJAJUV
 VkiUD/4uj1sBVbAhgwdZuxZJD8jMTsv0l9vf935v4+GVb/Rf26d5NbW4Z/H3wdBPnRTx5PLocHY
 bH1arAJROojA8FZD5/BA1Oj3sUcVkaYSi9nSVpKFTrXIoqZiS7/ya9y68sdNE96QebvPLTUidrP
 H5RQoq6V9HxlRSjUeoz41pUiMGazesa29PP8tCVxWzAGwi5CG+u5qBn21gidcJjx6+/lexKMO73
 2gCPdUG8O740azgmEM8sZSnJzMarEZ4gbXNHbdVju+nqUIrdTH8+vbkIt6BpqtxdMGsnfowwsSg
 B1cVKPZ+dI9m4l7H77tVAo+MKBNDGAwm9awZQOoxMhwOqyJeGrmMz95yxmhW4vuwjM38eXULtzn
 /Z2gb8TzR5QghVljWBUeffxxpu8a+Oa14DjJmCClEtyB56FBIviovGdAmbOP/nbvtPAbrP5MhcN
 dvUf5/x5oUF60ODv2ktWFpbDnmvEqYf3d2y7NCmcAfHaKVqD248CWqK48B+8aE22ur5NaWL7hX6
 jPieTtxxwk+ikz2PXbm5zHq9ohDhd0LPxrA429QZYEwUti/Lv8DGNVMGNV1SdVttsSGJjxY8uqZ
 ctzCHjpaJwy43NXHc7XiWeo7LeebeSiDLDIy8bzERJuwRML0bERUB+KnsKPAjJJb6W21wOJLf6R
 8SfzxWBZmKPsXOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX9ZJSqpu/Nh1Y
 /GB7lM3OmhI2xjLOe5ZJFSnVHkr1yb46fPao5UWjEm02Lar38dbLC/E74d22fVsL7vBAlQ5p54Y
 seyT7OaTj15kdCH2+9cLJPVZpXK4O74=
X-Proofpoint-ORIG-GUID: IUUWsmASEp6hcl7EyTUAdKeQL7FvMOFi
X-Proofpoint-GUID: IUUWsmASEp6hcl7EyTUAdKeQL7FvMOFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfXz3FBslEBhw1i
 iDQvsJ5gnbgXaTry7T/8VI9wuuzWdk1zColPoqsBJpUt+a/CFIwXG75wqyaSCumPErehhr0FTZP
 IE2VliJq5dODvFmF4aKkGhZ7ATjm9N+GQZiBlT+3c6k+0ELjDgLpzSuNxB1LOV+2igQtuP2wDlV
 0PgbeciSQLU/aMSV2oue+8CGgPVJ7EKqkSQsbCIJ8urw1bxjhV1ZSMT1cJBXNsU2L9wy+VbQfji
 67YY5wYbaysoZgKV2/zDcUBGlLhgGjwl+pQqdbPC1DLnOT0H5tSjx0+Z6Bq5EqaogCbL6hut0Rv
 vMXRo+au2cXgWgytMRJHJfdByhHWr1FqKtpOMZZQVyStv8b91zhAhzzJCguWQq60sq1z6ejnDLw
 rQFEtD9RFJupBC8JT1+SbIT93aq3zlCzyWqAZXM7GUOwhO338LjmxyV0P59I7AGcXEV1RSPQeCl
 1Tp0xohWXIR0WTkBIbw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab50dc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uLPiVhPF6TeGUxki5eMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240048

According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
Drop the extra zero, otherwise we land outside of regmap range.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260923.
- Picked up Konrad's and Imran's R-b tags.
- Link to v1: https://patch.msgid.link/20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index d19792027cd9..8910a8badc27 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
+	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

