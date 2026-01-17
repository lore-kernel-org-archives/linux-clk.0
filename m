Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DAA2E8B75
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 03:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622094; cv=none; b=Mup96aE7Q/PQMJhKeVN2rLnYiy3TfJj1Vsr1EHvgyQhOBdaySEeM4LdtSb0nZX5NuqayNVVdOSR+T1tuIZCm+o+sYVe0jdck2vulDBrEUasImdVNhwiDPT0RAEvVi442AeC5obYT5YTbvlEx/aip0FK0iTuXvRPvKyq4kY6p9NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622094; c=relaxed/simple;
	bh=BXrb8zBMarQfydKiG56Kr8TTVhRKu2yKOODOTG/TY6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mkq884GMQDqsWgIuTcHF9saljQpBvRkU4K7NVtHjFrrVAgY6VGDlXClJFlHuHQkWIeCxQUpBG6seLzDlXeq5Th6dckYxgv4S8QS8fWg71AC3FBxinNgCa/Fr5XqZZG5ibRRbvjOsYP9bvuiVs5D1d+FwbkXpr6vSIKGMVSF7Sus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXNBJy5H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sts6VP3a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXNBJy5H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sts6VP3a"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60H0JPLY2084748
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 03:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3sNL/ED0+ow7iJyCDM2dh1
	nRYsu8X+UUBWDh1RFitl0=; b=WXNBJy5HgcaLcaOmkYLvaM5aDALPz7M0qB4/U+
	R22RlkNidwg0LRc6KRITlbJDVXzGflpcRI8DJ0HbvoBn+EkoKzoHIojz8TMpBdkY
	/yfiIO52OHjlzWBujLCrOgf88KQYqR3vJpEPOCRnoj7bY5dbGERbh5NnyXSBtx+e
	ysftlfXvHY4X1l+FDV9HxmRujAil7Kts6xfzZ3+Nf4p7RSaCATuJiakGoAcFeI+Y
	E/oKvNfz+54xdvUykqFUvYO8qvF0pvDIgBOTZz2bz6Y+HkprLDruQCZicekSHxzs
	KJSCdXS1dC6VaJFbHAYlt/nbSrmZ82C1fJD3ZQhqbxlkObMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqysj8chh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 17 Jan 2026 03:54:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a2ef071dso732347685a.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 19:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768622090; x=1769226890; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3sNL/ED0+ow7iJyCDM2dh1nRYsu8X+UUBWDh1RFitl0=;
        b=Sts6VP3aHa3m0ObBngMCJb3uuki5r13mJLu4bDqkg+73ehnRUwB6wB8qmSwrREIKjj
         ONxBR6S5INSs+09tN4AjpdPJ/wUqATeX3+PJ60MOBYFU7M3r5BJpWS/tyQ/AeRWLQ6um
         HraUeUI3NKXJgsQbZtOKS6IflQxaU6ZL3BbsDI9oANJrNjZim6UGR9yYYW2OJc6T3YqA
         Kw0ASyVVCTGLn7azw2Etp0AB/vbwJitOKQKSkkI7F3VCkgs45yzTGHkRCxB4C8PeA5P/
         ZqjhIH6nlt2D0tX8PNPFdqbOugNkrp0F0qX9atSKJzE5tSMIOfJn3DwrkVK013CGalmI
         w6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622090; x=1769226890;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sNL/ED0+ow7iJyCDM2dh1nRYsu8X+UUBWDh1RFitl0=;
        b=HV/Wc/qrEDpK2TX0NEJtoOL+kAP80xbaDqQhXzdiOpcrAP+a1WjwIyqbZkgR17E/7W
         9f92PDTgBS+bZBD614JjKjavsNfpPk2CwCWAogtlcvDBKsFJOJ8l40v3MgY/oAQotDQr
         q8S6ItPFRgLRFIq1ZQ+rPj1zQ03KZbHhiHBkxodwn59ROXoeSWkVjxa6smrIK02KAATJ
         YdyVMFLl7w2rx+dq19hx8pt2Rb+UmV0eu6ihg4qBK0og2p0tcDHqrhCAIS7Nqk+VRIiG
         xa6IOjXb5ouOLvgn6KLPMotIHC9kLJLR9PjYPwc9DwFtKTwDRsGRydcR3Ghl9DP7LD9g
         o7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCU36qIpufLXacvIPhcWMbBiRMqwNYMVpLl5l7pqCFCOArg85yvymYyJWWEjb6SEphK+VTmlAulJG94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVY28NsAMJr9dJZUsn1wD4kUFv1h7yQuG9VUEYu1HWyTxvVGD
	oIzEFMtO6PD0ibWJctMLXEVi36azPmwPSs/4fre/6XrUeSvzWH7hsmtEsgOiO4arqQG8GsJuEB+
	uiBNEh8nO1qZXOVqSnqMsTVwIr3Io8NKhiYr/6fTjGPssXxmrFzmSqfHyEISagSV9HnraIZ0=
X-Gm-Gg: AY/fxX63MGbe+1s7jTeN9mXTeCZtrbAE3rbVz3vQNglrXLjXw1micuh+pHnz/o74Lfu
	4aT0UT0hlm/ipyVXHdO5wCQQyMOzNvlerHG7ixIdn+OCTBlLChh5m/McrTJo5XAF7MP5rIwqj3W
	l7Oickb5B/PKtVwRTaRBzycSi9KiR+tX4gVC/9ZQfibzTvjOg2C53MFpnD6pHE0okRU6bt9dAQH
	HsPW12wXmr/FuSLm+p92cvtRA/mNIu/adLercRWWopOlip1//04OeU8EhV+lZlegfSUD4Vjp2tu
	q+YqlNJ56GkB1YU6+3v8QaEMrhEjT6whi5ac3ITPQnfm2djZtTB46ZfjqhM0pFNoCj6nHQaegaj
	VxlPGDaAcxe2Cey9vvzdvB6vFgtdseawInDqyQ68D9ihGhjf/taFRucsqdka1uSu+I/eKZaE9B7
	7XsA51CQ4YsPmskzUpwkUxm3s=
X-Received: by 2002:a05:620a:2947:b0:8ba:187c:99e5 with SMTP id af79cd13be357-8c6a6909ac9mr719324785a.27.1768622089995;
        Fri, 16 Jan 2026 19:54:49 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8ba:187c:99e5 with SMTP id af79cd13be357-8c6a6909ac9mr719323885a.27.1768622089492;
        Fri, 16 Jan 2026 19:54:49 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm1321656e87.20.2026.01.16.19.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 19:54:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 Jan 2026 05:54:47 +0200
Subject: [PATCH] clk: qcom: gfx3d: add parent to parent request map
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-db820-fix-gfx3d-v1-1-0f8894d71d63@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAYIa2kC/x2MywqAIBAAfyX23IKuYI9fiQ6mq+2lQiEC6d+Tj
 sMwU6FwFi4wdxUy31LkPBrovgO/uyMxSmgMpMgqrQcM20gKozyY4mMCstWGJkXGjw5adWVu8j8
 u6/t+9zAPbmEAAAA=
X-Change-ID: 20260117-db820-fix-gfx3d-e61329023c8a
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BXrb8zBMarQfydKiG56Kr8TTVhRKu2yKOODOTG/TY6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpawgIxN4YW1dmqsptBZiSbadBO3jjXlAUAuTbE
 8WT3Le56OuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWsICAAKCRCLPIo+Aiko
 1WNmCACm1N2dCasPaz5rkejNYlMz3ijUAacgeqRMLEUw9dh2mZ+3N8uOczs5Y9X2VEp+/IMz9V9
 cRAkZiBaciGolonItnRCzB45lOR65M5OJNl5OiWR3M3LwEmt7bJq6mz1SKwptXhHnylTHavxd5k
 Wwb1vIjku4usQr4eQ9F8szeFmDpp3xMxKZSSlLCdoAPgOR5dPRtr62zCDKHZ9M5GEQ2UFidRO4K
 Fz+OjObkOjhGAtxaFduduobH7ZCNAksx6eWdwyQ16qVZmFQLKzofYnncId9V5hYJc6f5+OMvuLM
 x8crmVhsoCtCajlYrTOplQ7hjMU3FMClBY8y1Tf/hefYcz6a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CaAFJbrl c=1 sm=1 tr=0 ts=696b080a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=swfMv3hKf4AmUSlbHnEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lx_pPBS2SOjUwn6hmkA48jy1FY33P8-q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE3MDAyOCBTYWx0ZWRfX8fPFwzPuqX3u
 btvfIUIut4cczEE1TJwfzqGwoRDhhR0UVLQ71L615WaZ3sIkcQSKzj5C1IyH2tp0X4DF6HFKmc6
 NJfBVwxLej6KQAJqseK2261NdwUka44BJkV2NWB86BvAK23fYYpvCZ4F/4/WL0/IXTx/wWlemPS
 uR7Fz2rlC8SBynxzXOmBUUbyWAB8jgfbo+8J+fZugERCXEwZDm+5g2LPJb2/kisl+QBeHE5taLd
 muk+ngn+fExtfmoSKQ+G8O+S8JfVytPSWv43h4luvbrOnV1n+4Hku+6/yqLVFlvTrPpQGTAloTv
 tvLljnx2NK/X1yVGkqDVXb6c6V4uoEbUlKEGYo41TJRUhiNDtKW59sUChhiWNPCl9NR8Ym6x2Tg
 HvxGem52WakSjSXYpPT3krpf8ua3+dVWuPl14ONEImbp4fxjFsC1pEyCuvfff5hm4wiDEAAc8hA
 l0zrif77xCPngaVaVBg==
X-Proofpoint-GUID: lx_pPBS2SOjUwn6hmkA48jy1FY33P8-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_09,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601170028

After commit d228ece36345 ("clk: divider: remove round_rate() in favor
of determine_rate()") determining GFX3D clock rate crashes, because the
passed parent map doesn't provide the expected best_parent_hw clock
(with the roundd_rate path before the offending commit the
best_parent_hw was ignored).

Set the field in parent_req in addition to setting it in the req,
fixing the crash.

 clk_hw_round_rate (drivers/clk/clk.c:1764) (P)
 clk_divider_bestdiv (drivers/clk/clk-divider.c:336)
 divider_determine_rate (drivers/clk/clk-divider.c:358)
 clk_alpha_pll_postdiv_determine_rate (drivers/clk/qcom/clk-alpha-pll.c:1275)
 clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
 clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
 __clk_determine_rate (drivers/clk/clk.c:1741)
 clk_gfx3d_determine_rate (drivers/clk/qcom/clk-rcg2.c:1268)
 clk_core_determine_round_nolock (drivers/clk/clk.c:1606)
 clk_core_round_rate_nolock (drivers/clk/clk.c:1701)
 clk_core_round_rate_nolock (drivers/clk/clk.c:1710)
 clk_round_rate (drivers/clk/clk.c:1804)
 dev_pm_opp_set_rate (drivers/opp/core.c:1440 (discriminator 1))
 msm_devfreq_target (drivers/gpu/drm/msm/msm_gpu_devfreq.c:51)
 devfreq_set_target (drivers/devfreq/devfreq.c:360)
 devfreq_update_target (drivers/devfreq/devfreq.c:426)
 devfreq_monitor (drivers/devfreq/devfreq.c:458)
 process_one_work (arch/arm64/include/asm/jump_label.h:36 include/trace/events/workqueue.h:110 kernel/workqueue.c:3284)
 worker_thread (kernel/workqueue.c:3356 (discriminator 2) kernel/workqueue.c:3443 (discriminator 2))
 kthread (kernel/kthread.c:467)
 ret_from_fork (arch/arm64/kernel/entry.S:861)

Fixes: 55213e1acec9 ("clk: qcom: Add gfx3d ping-pong PLL frequency switching")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rcg2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 2838d4cb2d58..d0a5847f9111 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1264,6 +1264,7 @@ static int clk_gfx3d_determine_rate(struct clk_hw *hw,
 	if (req->max_rate < parent_req.max_rate)
 		parent_req.max_rate = req->max_rate;
 
+	parent_req.best_parent_hw = req->best_parent_hw;
 	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
 	if (ret)
 		return ret;

---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-db820-fix-gfx3d-e61329023c8a

Best regards,
-- 
With best wishes
Dmitry

