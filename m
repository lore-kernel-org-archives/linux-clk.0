Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905E949C4DE
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251763; cv=none; b=AHnXI+yL5y99K3EiRlgSih3CyWhOAwtaBJ73OU5Nc7I8aQhwLjIjUe1YDfgnuSOPtPnXEPuaRq3UQFjK8Ozf/rgHD0vjZ/Sn9GC9ejiVzoN3u3qhYaJ99V3tlLAuFIINt5H5cJabnaX4anay5/7rfyHk2hDvSDA+x7AmDWsULZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251763; c=relaxed/simple;
	bh=diY7zExJS3GMDS0fUrSKp1bx1soJ0E/u2KKOUSicqUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fvk/tiTMw4vGb6ufqRHfp+Rx2qcmAo7g5zUoxQx2TvrE8Zfx1+GSbvxkzj7ugrlSnME9rRq8YUSPW+GkWwW6I9I3fCCv4lUymZ2EW4EfDeJorT8Dj1Vg1UDW1JrIkI09c3X7nUEQjYZRpxIFRNT5l5RjfX9l5ow2JmZW/8HJMjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXkxoKkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8TSAOY6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXkxoKkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8TSAOY6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4shW2749543
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fC3Nc6iC5ouqaFpOr7lVZ3gvlecc9GuCQIC6kCfJhec=; b=MXkxoKkLOV1MVCWT
	G5LjllWPjdzSvLJUyQQekXxk0tZUqYf4ZmwCqusuObWign8iP6IsPVbDQFDo6Qmr
	/BSixISL6O82CU022YTiKxmgMQIWxFKhkvyS48LnfpbS2aQA8nHNoy+MzhDK19rH
	dSCxpFGXThexQ/UlYlxsQxx+PBirvNG1vQkT7BfkxAv1IQPawzPyMmsLrkUM+oHH
	7uC6W5E4kPmnKtrMlWeVZQ7bl693ItcM415LuLNoN8q0rjBabd2RlE6eS2X7UYUN
	5cx2jdwX1VvvnwgHRagen9Y8OXDmnLErQ70VIvf5K2X4EPhBaElXuaZ5hYXA2OCx
	EZstoQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1s90evw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 12:09:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso1551270241.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Sep 2026 05:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251759; x=1790856559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fC3Nc6iC5ouqaFpOr7lVZ3gvlecc9GuCQIC6kCfJhec=;
        b=a8TSAOY6wBbhnVm+npmZIoOgBky+f3utRdrAmARVojWgxmCx7eWG2DBW6iMBt/cyZ6
         U1NJJ9iZWErScFzQWq/i1EfpTIdImr6749A0QkAKo20c809grCG5IfzlC25s4QD8BpRt
         1jznjKdfaNl/yfrpbzVKGxv5fVaa0zLWIbNueGj/zOHmyECMSbTn92vNy0VZDp0wS0MG
         9lvYpQakN5GSfUKDpqANGRhsVdDDAgqi2CYdFiD54FP7ShBD6S13n7ZB07G7NNDbAZpR
         M/NhMe4I3cZ9Q5VAJPwE0O/Kf0bXta+0k1GLEtRX7IEO63r+wa5pG8ERhP2zwClzZP6Y
         DslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251759; x=1790856559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fC3Nc6iC5ouqaFpOr7lVZ3gvlecc9GuCQIC6kCfJhec=;
        b=JtESR2w37F+3b+31rSQpQQ9FLX9lPLOO1E5dmwEfV1vCKizj/F0RBcPAYTORfgjY0I
         5nbTCQjmiByRK4tOWmy4ePpEKABpjK4fJckz/UzekTxmmtRRZ0Wgoc0xbJUoKTlsDq6C
         qEnlphAHKZpbIweZ7ABexNarK0+RYNYFhNUhbXmZPlZEDSZSEPJ5lImPQvSK7afGSIEG
         VNUQCbr98kfcqGWTH9b3oV1QnWHa16bkANuDLv0S08B7XQFrwXv/pQP9qgRRVcUZiISF
         OhsY2yvXBtaPj8Y0PRRyvJ+3flhQ2FbAq3XF1SCSLthmFnj5ZTewFanCPm9KNfBcz3O6
         1Xkg==
X-Forwarded-Encrypted: i=1; AKwUvByg1vtkAOv5V3cihi4E8wDoDPI0wyBNoOPczBBeDcJPN67RiZr43zao/cY67gCw77nZgpHSguQDJ94=@vger.kernel.org
X-Gm-Message-State: AFuF++m1V9fCPcPLPZonF7rZuRUBw8wRSaejVxb/A0gMacDHjuzm5t/G
	UXujd7pi9jDsN9U7sfLxWI/Awnc7Eoi6quI6vnm1VEKdxiB7JAiLKFvjC3Q7oI4410r4oieSfZU
	MAc8mf8AkqGBhrvHFIIP/phJjH4NpdCR9CcZQ0LMhnQ9CDh7t9RiqCd17wf4Brvc=
X-Gm-Gg: AYBFou2miH3a9fZN0NOLI6uICuHipd69tuqJY726719+Vbn9288n6S/z/UuIR6EX92W
	hEotLuGhJ9VfUKQfGjWF7K7VC5t8ciSflEH2Mf0iFeA8TC8b5EOoidM1gJ6Y7mjZgzgXIqDZmm5
	rECRKm1FRv0Qr3VYStFDtcJ8+FKUCAObKekW2ztYPp/AudKUoHsA/3qrsjpXXp+Vh9KloeOJ+1Z
	hT0bzFhHz3KaiJ+DjeqB1o4nnWzBZ+KTgOmXxrJsBkLiqFyHtntcLckbT3bIqT2wRYPNT9yZLeV
	hI1w35g3k7+wsXJOwjBcOodNvyhs+qINkusQr6yvp4WHSxtWQWCKugOniFLVBaUvS1uGXBSSQgs
	XROEJbgdB
X-Received: by 2002:a05:6102:511f:b0:7a7:198a:c2ba with SMTP id ada2fe7eead31-7af1e2f473dmr1156540137.34.1790251759282;
        Thu, 24 Sep 2026 05:09:19 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:7a7:198a:c2ba with SMTP id ada2fe7eead31-7af1e2f473dmr1156518137.34.1790251758731;
        Thu, 24 Sep 2026 05:09:18 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:17 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:57 +0300
Subject: [PATCH v2 45/48] clk: qcom: videocc-sm6350: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-45-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1680;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=diY7zExJS3GMDS0fUrSKp1bx1soJ0E/u2KKOUSicqUY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJt6+zBDvol//2l6Tx5u0AO40XQcCHIpMAAz
 de1h9J7lRSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbQAKCRAbX0TJAJUV
 VoElD/4owk6vB3bszCQ364+5NhJXWEALP0g1aqgsV+3iK5vLwkf1WI4XdkKeSO3tqw8jwJ39Jp9
 a24XZrlxCdi24Mbzub0ji5KIdxQMps81W6G2OAvObA7dCep2VLAHOy7e/DPjGCmISblUQWE0qCZ
 4mWQsOHfaiSQe+81l7KPlRZFUsN3AWB6XCCjrhkduXAithWB7XsN8HEjvcgtw/8dSw3hHHhSr3G
 bG3BRYEiKBpSnPkMwJj9fhQV6cOyj42/Fhs2gaznZu66Cdm5iJD0G9kqQ883min8WmEH+nzqV53
 MjTJpPu3iR9CW6PQXq4XJe8LzRBc1eW7QXySP2pvd8YuGMuCrjpYX/8FWr70OJQUngKjGZkhH24
 QBmz+fJoTqLb7HGla47M4CMVCTjzAqdiQm1IJ5t+EFXXBC1aYPwiXvCu+yfKVB6Kh5kRSxzc2yo
 hqSfT42eaX8APYEoDGHWph8tE1EHqxhtP3mLd+QygPjy74mAxcSwef/ce0zKYZc7lKIap/cR/CX
 hj5Xs72tUr6TQHiPAIZSFuo1o6smFU91Bemjp8VOZLS4cNnlk15HRUWzBD5CWniLzorWT9423vd
 vyMRhVA7oK6sZ1RhPwlhY+ECWW6rmrF2guxBiSfewdZwerDr5pk2iP7eno12nyLlKuOIj+6YgK1
 ZPT5DJvVRWRwTvA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/4pANTiGH3Bz
 pQ79ghSj7DfMx2vvv6/RdTuYk2w2CmOClKxm83meRAiEtqCe+TM7KasjnqBPXK6U0+2t7eGm9pG
 tH1jej0QCynxHgElmXMbuCpFiUc1ZRPifjVHB8fx0tPfRA74vQxqinxR4dhVNwhSixRs8xQrzYZ
 biR6D/+DyjKVj5Y3xPJ+tPjEQmmT2/+6szUXcn65JstjUbgErVCKMQBAqCJ+x9CSP46cT+do8SH
 Okx9LopfQyBFKRIKARmE0UzM0103NdRTLBJTU3MpPgLTuqwGWhWC2bw8oE3fyhmJcxEng3tkPjj
 u9aOOxevxeDEOQ5Y0iQtPumUAP7HunT/e0ij9PpwLCUXDfg3jwI2XCb0vF+Q/YTlmKykjcTdjy6
 g1tjXfsqvCvdqGJY3WH7rxj8SY+i9+xa/UJT2cD71PYQ6AxIxT94cbYDhJldohSGPMk8ciX/ILZ
 NChEeJK0REzJPfB1mww==
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6ab512f0 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=35KR4dZN77wT4OcJcwEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxKxJN09IsU+N
 jse8dAniRygNuujtqlJEtNpPgpfVTKB5Ri69ns9ZnFJW5pItY5eWiAL0+9st8kgHkPvau5Bsom8
 tglf5hRsS4XktNz43IHWqXaXAE6EhRw=
X-Proofpoint-ORIG-GUID: 78i-wIBgjr6gn1MY5U40y2iityjG3oOK
X-Proofpoint-GUID: 78i-wIBgjr6gn1MY5U40y2iityjG3oOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm6350.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm6350.c b/drivers/clk/qcom/videocc-sm6350.c
index 34bdc5aa865a..d3926f87497c 100644
--- a/drivers/clk/qcom/videocc-sm6350.c
+++ b/drivers/clk/qcom/videocc-sm6350.c
@@ -311,7 +311,17 @@ static const struct regmap_config video_cc_sm6350_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm6350_critical_cbcrs[] = {
+	0x7018, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm6350_driver_data = {
+	.clk_cbcrs = video_cc_sm6350_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm6350_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm6350_desc = {
+	.driver_data = &video_cc_sm6350_driver_data,
 	.config = &video_cc_sm6350_regmap_config,
 	.clks = video_cc_sm6350_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm6350_clocks),
@@ -335,9 +345,6 @@ static int video_cc_sm6350_probe(struct platform_device *pdev)
 
 	clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x7018); /* VIDEO_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &video_cc_sm6350_desc, regmap);
 }
 

-- 
2.54.0

