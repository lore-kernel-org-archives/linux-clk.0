Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2F4EC656
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554671; cv=none; b=threL+pC207rw0sWraus3aZJn7+MYirztSLkw42wWsY3IpRPVBulGp6Dc5tQ7tk+/zeeS+7crQCZhC3t1tHwAOqkO5hRNiHiAHa7/zDRicdCz2X2gaJaAiXOcAVSYGMh0bZUpmKoauV/gYJkFMXi6BeTCJp9RvnQD4pfKlu61QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554671; c=relaxed/simple;
	bh=YjM7ZKJiyjuCW7sDpZ8xDtZxtp1hd2L+vcbDmTf29FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDU2NMYq1qFCyhSUhm9Mi/CL/fi1d2T1BwrbgeQjlwUrZXARGyAScKGKRtTIZffYIBy2HY/47GOTRtvxxbvvFRQPk07yvXqKefVhWsmPQQZCffkQTR/xdXR8eymh82576DfyUCgu8z2/6HyB/Lrepfj/+/4coik6Utz8aqCA6v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z94fFudr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVb3xYyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z94fFudr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVb3xYyi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92vT31721238
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=; b=Z94fFudrWKyXpDaZ
	D9dhDBRv5uWLaahlGrLxrg5C36val7iXyaDAv/BDf30lkzgiM2G2enuF5yQK/q9X
	wH8jftJO5kf63uIcX3UJNtgyi04r8XA+BWLJ/GGDEHLjOjOMbCW5XFYnlWIBptn2
	RmkLqs9x6FZ7kG8d0wl1Q4pZxrZ8uC5KH2UZQkVhrL2MwZPMxTVPaEPgC4+1mf0W
	WYL+E66Le+0fKRdoHa+CkYWVezE824vqAbcmuvKUHcckGpJYj9UleVcSt/rK8y1g
	eBCMpI4XzeNTJN13sHXDpBG3HXFMTFUPY5iJXuxJ0/m2mKs9nJfgx4KBrRvwzI9P
	oC4IIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkc12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936aa34873bso968143585a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554639; x=1790159439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=;
        b=KVb3xYyiOKTgvcV0kNPUFHFuwH2CSduMtuxTshe+inUx5o/QfCsxuruUjLtn1KLLtQ
         5q4FA8rFJoZNi1ch+S0SnnxFavWDQbiQrdHPOx18v2P3miHvz1L9hEQCfuOo2rdC/C4I
         VNZoT1cyWFHKyx+FIxCeVA9/mQ7uK4SOI+nXEGhXNp+9ViX01WWbgfgOlJR0PMDbkaYj
         HA1r5XMKGScEIB/FIwittY4uHlrbvFzC53oz6rLY1LY9f9TlVpsrVq9MbmrhHAq2dK3y
         EoOSae0Rln3p08U9xWbcs6RMi5s2xq44No8QPY1Ngh+BtmCOYTHTnARtnCClrbuv67KQ
         HmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554639; x=1790159439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=;
        b=vqp3LGFJZi5GaJqYqIZEzH3L3N3PKw4iPNnCeRPCP9kZeocX0tgJxZc35itnJDpKz7
         QezGMFDRPCVfC+wVbmHZI89v8Ft8NOk8GdPcMPFx63rE/VNc07mHEbxoTFOqBWdEjLid
         Ua5RdxWGs0pUdKZo7/w0ngY/A8mG0fFIVeEXjHPuZ+t/AKVGG+awI9VwV4VH/E8NvpP+
         f5TK0ViKTs+wDagLVg3aYqC8tl6PQtEK784DI+1zAaHxBh+LHL4BnGApqKT4cv/p/Tey
         /mak1K4Lv8DL/mvCtWQi4Tk43RBDmTNE4y9MbnV/KHaX24rhHnbXFKd09xd5D/I+kVSC
         p+2A==
X-Forwarded-Encrypted: i=1; AKwUvBwMBAqPMripNV6peNnJx3jswuX5Z2WJTjxiArrDjpTsRppLCZyIswlQxiEUKqPYkHkPmcp27Z/EYec=@vger.kernel.org
X-Gm-Message-State: AFuF++k8YBrZgtNMqZE0pHQ5FmPG1lJDL+Z5qjGhmz0VNtJz8jhc/YNU
	QON7HXgNOJwcII0FGOfCy17hDZJOqMQQsB+2HOpyyf6g7qkePLgbA23LiHlJsl3VCi62QzgyTCz
	o2FL8w6ek3BvnPiGO7rwj2Ile5CzACcQJvlhdCBH7iPSCptwx6Lh+JAKh9KuN0ZI=
X-Gm-Gg: AYBFou1Ag01H79rTGootf0+LH9Pwfe3Ot2bRUL5E/PtlbIQ2N/uTkkbpTvvBtUmp4wK
	Tp2iSd8YyjE1XUgOk5e1+WCSsdrV6kBZEajqXgLRV/dlEurUEOHAXpRZWPra4uG4Im7L/52DOmV
	I1UWnEhKknr21lGqlECWy5SXXcQ6ggK3Hg23HPfnxyISSi5vaBk0D32dO6vSmN6D117o8Ru2kyF
	zvaEAM0AOQS2wkaXuB/UFF0Qc9khYCyOsMoRsjKMg4cYH/ltlwxRG2ibHrkuO1/K97o8awWc0qe
	2CkmXHcY0l5+BiICT/kLFK93cc3LV/08as7N7wwbz/XBdO9QzyjdKXw3VtKDI6U4cOcTHjtSRKO
	ppb9BZyM=
X-Received: by 2002:a05:620a:1707:b0:939:d78c:eb0c with SMTP id af79cd13be357-93bb770858emr308914585a.11.1789554639208;
        Wed, 16 Sep 2026 03:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:939:d78c:eb0c with SMTP id af79cd13be357-93bb770858emr308906885a.11.1789554638677;
        Wed, 16 Sep 2026 03:30:38 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:55 +0300
Subject: [PATCH 39/48] clk: qcom: gpucc-sm4450: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-39-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjM7ZKJiyjuCW7sDpZ8xDtZxtp1hd2L+vcbDmTf29FE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9wkVAKoVHYZmpq3t/wGp5aKjqOSziJlLtgW
 7zIG2nwlqiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvcAAKCRAbX0TJAJUV
 VuTkD/9qaxtejPTXFpC/YJPjkmfUczzLIcU7eSMMB5DfqAYafaGqIxjlZOVvykYhYEqhGuVVcn3
 IpFd2IqgL+AJ1F1SdYTDgiCJVWzDNksPnmH9E0tl8wqsmy3Vk0p1tcfm9zsd5EoHYgtXs5QYxAf
 d0HkyvVh68tBNZGqR7kj+f+Wcw1ZFfc4wQg88BfBk9Wai1gEs6P6SMp0lpeW/tz6DGcaBC76Ngp
 XpjMtB90afbUG1cgPpCXD7nlmtSDMGsMKpdf02XuAQ9YPapgOTHCEE8rwL4BAIxehtNWu4+hveq
 Q4ePhp2E/QMd7kj6dP+T/mV9YScz7Pq5EGGt/OmOug3xpVcuB1VSQLcK0niX/TD7/n+3WcIztdB
 Gy4O6MR/IbduJq3RC6eGenz68svI/oPqMNcpKKZ/AC86qglaQmNh3rW9w69vH0nHPL7A0En83Sx
 t562oSv1FN0QJm3TM8DEHeJ10LJXhnMOXMCfVf6owTpUrfTOXM2tsiRU/Cz5vUAajZbBE/MWGOW
 2LJUR+C5wwZjuIIRzlHdF8mcBkR6lOcbtriLnD65L/TgK1WkM+fp4GfYvqd3vESHA9LyiylOFBC
 dxLhCNOYYbcklRkcjRhuq0KG9/d1ohAZMfzHEjw2z1XYadpx5Wbsp9dmDZ49LDBgu5vqLZnhTll
 tMkG16A51X64Zcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX69/MBwJFs+eO
 f25LR54i1ahXbZ0wIO1yXo27JT4zVm51YjA8dV0ACAPKZumLd0bbSGtMifk3B5zxyCmcX5+bggB
 GWWcEIOq5wKfSsSKN7vuudvwwnLaDXwSLBJgim6GCpv5uXWyd0cWAHDIWGg49xBCfgYOATnkGSa
 hkZJz6ltpejBwIJ3ZWdGkQ+chM7da0AXZpHu/qUMKcTSI/KjdEbObxHOw1260Igc2bAxxCk9+MW
 Llr8ftte5guiShqbS+Mh7H0Nh8vzzBU9z/T7kD70jGpMddH6QDNJ8DwKXG/ZUZgrWgbRIXNUAlW
 F+uyyzZrqd2XUa2q7Ln7Y7gkDJOyL9tYraoK+WDq8DjPPqRjG3DvLQM8W5UIJxcLzP9ICYpSWEy
 +rlX/2kZJHVSxNQBP5WnFm/DnyPzTefdVq/1yJxHNicsB5mZn9Y+GTsH8ODd7VE6SsezHSsQwPL
 K0+CipupAY5ec63ViQg==
X-Proofpoint-GUID: IkcaMmt_l0V_TAC479kZpxzCZlx6Mdpn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1cgrO9anYXb6
 cAv/9QhNPUbOgr6+kwpJ4jfij6ZIwF4KVDR582CL/XHDtuBsioPjN3Gfk4muMrqRRArZLNjjmeO
 CjSWOxsK5oOo44+nDfnzlnh/cq0oQUo=
X-Proofpoint-ORIG-GUID: IkcaMmt_l0V_TAC479kZpxzCZlx6Mdpn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm4450.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index 808b1eaa59d1..bd0f3fc2b726 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -754,7 +754,19 @@ static const struct regmap_config gpu_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm4450_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm4450_driver_data = {
+	.clk_cbcrs = gpu_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm4450_desc = {
+	.driver_data = &gpu_cc_sm4450_driver_data,
 	.config = &gpu_cc_sm4450_regmap_config,
 	.clks = gpu_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm4450_clocks),
@@ -781,11 +793,6 @@ static int gpu_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

