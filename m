Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19424E80B3
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554678; cv=none; b=t4AJmEcAHebefSBcRbYUeHudqU0uqIA1leWegAzJho+76erM6yVvsqrFpugEKCSqXZqhQUCDhyB80fItJvnas/1cjdnUvtOzmdXCsKoqTu6bMB5FUWNCoKAxsIAja9equRXGVOgnk6sEFkNY3lmrXWeRjIFKRxa1Fv6AOM37NBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554678; c=relaxed/simple;
	bh=ceySCAJ2UKzCOMrGPaWITOdmnUsWyZZP02Z5z4V1xcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UV1hFUgRsVW0LUaazKU0JS+Kb5ZFBmaqjepUcG+tHDr4nx4rTtwjiTlhh9mzVxGr7d1FnHZOOG9VzRoW04zlwf/KMHU2niUrQHq91knMKBk3yHNNQVt4raJoAoaAIv5XBDKv9cuYcUiwa6fWGw9kJa1DYhOZzoJwx1ZmSbiFItg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N97EmyEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZiplyQVW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N97EmyEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZiplyQVW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92sRK1552921
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpRg3+sla39rNmV5CVX30fzQnRmtP0Sx9McGTSZpuPM=; b=N97EmyEirXHuBPaw
	+cVBN9i95JhL5fcfPVDMN2J+sLxrO16TzgJ+Of4tMXM9vY9q4u+0uRCJQx1gjIYM
	h3NIVPFKvUqKKxWAhyvE7LjU+1XTd4s/BJIV4yGR72K1BGep4Ilsw7DiJgzWvEcJ
	SP/DJ5z1YqAo8cDRtrhx1BrU69rQIaaJEQJ2DD3ZxQQd+k6svVx/jXy4Z3l1jgjl
	5x0HI9Fkoysue9bVq2jpM4+/mffTy35YBlL/2FfOBtFdHZRe6SHXIHcxeptf9iFU
	KhbwV/dCts4ITGXIIEf8rzFz5+afRmAZU8paE+c6LfDF8oGYCrUJuFalMy1U5sx2
	58eXIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n6451q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso968181885a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554652; x=1790159452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpRg3+sla39rNmV5CVX30fzQnRmtP0Sx9McGTSZpuPM=;
        b=ZiplyQVWIjS/yiROCbeY7gLkFZBvpCdXop+mU2ZhdDfXfanYYShsnULJ0ntfmPXgnH
         Xy8KGtTRwSR5l1cejC/5JcWLZnxQ7Ij/coFzVlysin9cJc0KRp5JFpRpys9aV7Zf/kUM
         l80BIeTp8h8wfkxO7yL+60xlqxYhxrDk1WSe7p/yoLjO7W6CaI/hGYphSupnEQxteSXb
         LcloENvCRFfBEw5Bky+QJOf+AFdVqwMx2wUKG7DD3IzB6MXf6kDga7qkWcoDxgQslMdo
         sh1gIef3gGbI33+txREHkREYBTpImjw2eg4Gd6/0jjpBpeFSz0V7bxl+Ph7Bk11N6SQU
         /NBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554652; x=1790159452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpRg3+sla39rNmV5CVX30fzQnRmtP0Sx9McGTSZpuPM=;
        b=uL5hMfnRYOIOLKQMW3MU7FNMrexwTjO2Hoc3ZztDZUNkd0vvMCCB66gAkTApwwvfG0
         AijJpzKjBgKk1qDg7W1BNLuqSugpfqoxwVNCBVCAzLztwgi2jKVL047KSreCzOu93sVY
         04mzLANmaxy3yp3p3jPM0+FQ07QDGE4abVXx8hny37FO/Aih6xsI4moo4WEEjslNeVgT
         2Hu0NM5nlndV6TIAg1pYHzxGbyUFI6Wl77n4KwDdIjCA+kcxjGagWQBuOKN/yZQh2yNt
         qcDw+2dwQXKgj7bDL/0E1WT9t2B1qCj7S6HCSwvj0CzewoAj0Z45aPDpdpyt697moKbp
         7IQA==
X-Forwarded-Encrypted: i=1; AKwUvBwwbNxlx4o8ANnQf6+qB5AdnFWXsn+u9cvjJNruX3IkNqjV1wb//AyMJnCdA+Q/gZQiyfNP+QKkKpA=@vger.kernel.org
X-Gm-Message-State: AFuF++lOB/qav1hp44ecTjkERWJ2gVAgoZWREPrQXA9iVlgkscog0yO1
	NY0bn1kBU8piT+NzsojXMFMrY/ug3oXqfKCh0auK/aC5QeZCSh4gHEXLMAMHOPTA6AX5hI2RxLm
	V2L4qwGnhZOVTodvuDjpBRysJAZHohgSmGENwxkYtMjfMw05VOR1y0VYzeZwF/tU=
X-Gm-Gg: AYBFou0DZWYAGoySgSErvAh8kVnxZbfZvaf6Nzdfl0IU0JHZOy+NhMuTJpn0382/NnD
	epwTt8mAJCyT/fUsZ9y+/vTMFfb9ogQyWPIHgyiSCAtt3vLbYKvPVmVwVnxZIOdNW9XlhcZVs+p
	eluDVbqhdHLVBsTiO7yYYIptv8JTzrMX+Ho9Ptdfa6EC41kpbRyGudWHSHZw2AFVjGfMBqFSMEu
	eDduZ8IvWithrW8Mh7CoL0JEko8wXSJSFGlImr0OEEmYlBuDhV9nPbXPai3M3/wODafVXCEajYU
	QY8OCEoJ3oHR8+2w5O91Z1kT/glYEGMpsqZXknCZWy/bbVamT9/fn8V9Vx4+0q7SpR2onhxc/vv
	mWRD1/kk=
X-Received: by 2002:a05:620a:640b:b0:93a:344e:3d3d with SMTP id af79cd13be357-93bb7952c30mr299731485a.42.1789554651873;
        Wed, 16 Sep 2026 03:30:51 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:93a:344e:3d3d with SMTP id af79cd13be357-93bb7952c30mr299726085a.42.1789554651414;
        Wed, 16 Sep 2026 03:30:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:01 +0300
Subject: [PATCH 45/48] clk: qcom: videocc-sm6350: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-45-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1619;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ceySCAJ2UKzCOMrGPaWITOdmnUsWyZZP02Z5z4V1xcU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm92lpQdDIVhwJtswhgBbYl1PCWCOshBFDv1C
 Hvt8eTpRqaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdgAKCRAbX0TJAJUV
 VkCpD/9p25/TDcjmOxsChTCBndL0w4M0yWLJqolwW2LcmMwmcSJyyEd07FP88ANnK9xdj9ZE+0A
 IqAxoIaldFSuqUgpgXmNqhhnuh1rZifZNxEEfcmWUvgLFaGhKr0FpD7g3fOM+AEWGlMHz56i2pH
 y1j3pcF8YatrFAjis+aFLXxZ9gDH27Ipcpxi6PA8icVVXlaC2pzk9GBrHyP7J5hwGbwY13ywXbu
 SNkK3PocsYHTEGdLcLHuRn4U+kA2sla3RDDHYQ1Zz05oUQMVbHc8B1rsGFe56BDA90g1l9naTZg
 OmIuKzXgzEqSeDSA9WsV3sixeNUrSYPlLpsaRE4+GbCJuG4gqY18dujA/spxlY4i7OiyV7bsY8v
 +4DOYIU/VfFvRwu7Bu2M38rr3dgUNYE+EKuDRuV4al8IsNQcG+OARDOtnn7ngAK4iOVHIEFCvAh
 LjBVz0aX7Tu5714EOCZk0loAXf5WH4osv+q2NvBFHCmngOuNbyHEBmdp01c8Aa/QYQIPNBzkxdc
 C/lO1ufJ5cCXuvSmNKkPIrBsdA2egsr5A9OptTXILUA3MiJWSeQCa1BxHxxsNJwzOAWhpb7Kbpt
 7E6ureuuSp2oMvPQqYwt/ijs38X9zZAFYoPbwrat2TnMHxAbpt28NHK2zSmi0K3WwFzd7Qw9a/f
 KxsU0+3oFbUnyUw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa6fdc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=35KR4dZN77wT4OcJcwEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7GFzAOC5QbqX
 bCdWbSX1AD5o11/FK/yOqkVU1o+uo07BE9h0vbF7YX8iO4sXdXi4X1nZLlkt5J9pEzbgywNswU3
 uUnzVycZpbXn4sOYR+4v8oIzRBQDsFP3I5JWy+oZ3FB8DP39OgNfMuWBxoLCb07v4Gja5YDWFV0
 dMuI6vku/2lxzGPbYk1+dtRbXMimwFXX0p5+Xo5Ewaw5e1Xv8L7aDHHJTpw0lbPsa9IWgcHuoop
 8rwXubUPSE2GkPivvxaNC2v8nsBP/qdVo1zdL7yy1zQTKerGOX95gGqS/oNQca+FLb1J/YEJCzE
 8ektCS2r2BGY9/ymVXadj61vJOhUSjZPedWh82wXxu+zj6xmVIL51IzdixaPSqA+y8h4iIS6N9n
 1zxO2sMtr1Lkh9w+NGUwalU5f9ZDwFy9Avh5Lyc06y4xX5eAFt2noOUUayGGx4BNvSSBsNM9Qgl
 aP1SYOpSEZg1D1Y05iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxpY32BEbyWI3
 LWP2w210ZoGzPF5fljQyfoGpZ3Ov7bGOPybt8cW97fomw9Xl7QcbXdXDgAgCDwnPwDe555HytPc
 vdbxdHkSuh+VeIFq0VUwCFAL1pqBv94=
X-Proofpoint-GUID: 7cYVkSvnclmFQZ_kUy7J2S4wzOCAlN-_
X-Proofpoint-ORIG-GUID: 7cYVkSvnclmFQZ_kUy7J2S4wzOCAlN-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
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

