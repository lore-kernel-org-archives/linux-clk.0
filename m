Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745364EBAFF
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554681; cv=none; b=TXO7T0nB643/YTwX27v5RPp0mjlMWI6c12zVIGZHQtbNxzZWyfkc1Jc96fpCUf1dwUa3p++bQ7ieBFPQTM4fQ4FrEXPA0wCr+NEAwQZteBBG4YtUmhS/tidZ8uTxKKs34yZLFtg+Iake5q4nAtB3rExOhHd5xlAlj6rKbDTFuGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554681; c=relaxed/simple;
	bh=pSSoS2tEcsFgF1U0zVrrCZYyIxjblpEIIYMk3CVK4Qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mE5KUfKsoecRDiluecVf8dq8kr/o6tQoeU70+50A4U96GzB8rP+an8gWfp8K2Vpl2XP3z13aWvQ6OBY5DmdhqOl6CZgxZ3jng22/JDFQ9xFk63Dw6uniUy6gF+YTJhdMHvSYGylitvfVGPXjdTJegXU2QMt/I8HUKTMxtX/bC18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BW5CJSpN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5dF53GC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BW5CJSpN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5dF53GC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AaE2658307
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7OZzacR1OHnJn5NTaxUrew9BnSpVY5ERc2Ll3Di9WLo=; b=BW5CJSpNZ40xfzMr
	+TAdrrEv04tSPUVf+qBxXTsOugyEuxGcgMHxWw8wWajsCEoTl1lFZhF0it9yoTeZ
	onZGZyvelsNH9koEbIgeL1BHFVjk685kECuSrZ+qyEyRUoAVQoev8MuF7wEnYTci
	5sAWbzHatL5fBKSFjU4SHBND27ODQuSyKcBJjV2BWU5zhLZjUwJ5+C0bvOQR/bs3
	p/ZJ6lBSoXKgQIL1+QlS867u0+oLNbR7m60kD0wOR/6vwBWAUJG4e0GGU+0NyoeV
	mdUmqtcS0Yx6gtJRIBFDNf1HELzc1b90D7NpohPV4mnvMd/SqzYpex6Fo8y90ROJ
	x2PxDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujat1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:30:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1b824e84so686213885a.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554642; x=1790159442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7OZzacR1OHnJn5NTaxUrew9BnSpVY5ERc2Ll3Di9WLo=;
        b=J5dF53GCyAkeRf59NqF9P8uFVoOF3wtfq7blAPVMHDgK0I4LDSK2Z9MwWW8alNNDV/
         U4OwMvb+E0oml0QUDB6kQc2MYA6NQbFA6HOeOdHm//LEqWfBqVYEH6sPOm6hKPmzNTev
         k9rE6E6w58s38KzDRZHr+KJh1GNF1vEploQ1/wwttTtPHr6OV2rklAZlBza50yHtd8/6
         E0Fz0klq7cIbIXtFW0tuMJzKnaI5jm1+oZb/EfWC0naI0abXzPX8L7vQc/UenNfjIKYK
         iTD8AeZt/vrWOMJX7BKYUOPXuDYe7QRB+qiD9Yd7EQsvbONKDtujx4C6jp6QgG45mQoM
         phCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554642; x=1790159442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OZzacR1OHnJn5NTaxUrew9BnSpVY5ERc2Ll3Di9WLo=;
        b=p8PB8t3xJ8wmePhMyZIq43gONG9XEoS9QBsVesAN+QMtPmZb5SA34FvFFNGGr70RMS
         Rmi7YVjm52tPKnseJRoV9+ceJLaPOoXJ+pWsPdBoB1560xFK/z/ZSu0Eo0h6sMe+YGrl
         5jmRrkqOogMsZJf+C8W/Bg6H0XATsyCFU0RGmVdYGOEDN5jZCh2A8wmWILwN1Wg9Uwzm
         WcbfKRZwi58f4gdIZvbjcIlRNGqgngy0x2U+tfsqK9f4MWcsrBM1aJrlFWsvBBXmlUVj
         DNvU7woIJ8zWrSf7ZmgdooILU+K3C+GJa/uRXbmtug65q7eQrN6RJsO7zG/ti1eo2Mgl
         EtSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi/wwFmfct0Wvt/05L06/VyYDq8HaWT9TPSOqFiQ5gwHxoHip+3ypmGH7/RYvnFcx+eLbcJ8K57Ko=@vger.kernel.org
X-Gm-Message-State: AFuF++k640wrHYUHLfN0ft88ura+4VdJ6cDzpFXi8rUyGOTY6K8KkKG4
	Xy0b6GEVkEiLm+jOwXAanZpxH11gKo6nyDShh+DzKkd4SIzjOYmYXVnegJFyUDH+w05ShbexXiZ
	nR5xvb6Lwu8p4POh/CgPcFuOjFro6MOr+/dhsI7EVk77isMNp06MfDN8D6VwAeWA=
X-Gm-Gg: AYBFou0ltB8mL08kQhoI4gcbAD88V7j71nLkSsrBe8/EI0BjSYZuiMH9rcSzz+yPN3p
	Ijt80kBGMZ91BkepXxgDg24AFBWt5xoBdCWRBsPYcY9fkmUDpu6xXsnmWEbGYM8DfPAVkQzNMZ3
	uC4Araz+xbhtRajw2jw9GBeyvbTixI7GZzJw1ERydKkcgE0Hpj54Vj7rXH6JvuSHBshABGpr12t
	PPtMtQfENXFsOF5qysAoFaEHIZitnd5TPmz8ssjzlspSUPmyefAYC3bdz/JeMzDDkvxDGgj9uo6
	UaLXDX2fh3U3119l4amFYGIyIuKaiChCCcpQvkwkodCoKYL7dJFbsTHdx2DK40DVhaOnA67n/XR
	pezahCWk=
X-Received: by 2002:a05:620a:17a3:b0:939:9f51:29a0 with SMTP id af79cd13be357-93bb79b3ea5mr312358185a.50.1789554641318;
        Wed, 16 Sep 2026 03:30:41 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:939:9f51:29a0 with SMTP id af79cd13be357-93bb79b3ea5mr312352185a.50.1789554640783;
        Wed, 16 Sep 2026 03:30:40 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:56 +0300
Subject: [PATCH 40/48] clk: qcom: gpucc-sm8550: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-40-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1772;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=pSSoS2tEcsFgF1U0zVrrCZYyIxjblpEIIYMk3CVK4Qg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9xOwspMtgT6lEUuxHQmYoRhEUCTa8h0wj/+
 11o2LdcbVeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvcQAKCRAbX0TJAJUV
 VjrqD/wP6SMAUvn1365MCMj6Bs+lX5e2qf82AjrgftnzO7eQFFIErcaKrkOnCADXe9YuXMwhkDI
 T/JWeRWOsubXhBhY9UgM3xDgMuG9pX5cDjEsqisByRXrtPYgDlex3oM1wcSGkvW/BXCPiAyRrmu
 HtOUiWPRlEWLj36Vyvxkorg6fnFZiGOrLNjBx63IOcRHyCqxlEi6iFhNZ1duwiFZqTtMl9WdneF
 THLdJvpIlu0Bip4n6H5CKhSzxHodip0TLoR8nNzgnWJcH/aCwA24GNUtNkU+nIcThgZKA0qJSJc
 xrvUP5tvZSbuvJpNU1Ml4HHieO6vTw6w9UUdkC/JBpxLTx/HeJ3q19F5dC069U+hPOpcon+LDbK
 qRwFTauaphDSipG9eRfHrXRrgJLPobbSXjwGeuzudaaGZ7AzTbQ+KTlUJW8Fhhh4FzzH+Wgf1h0
 y9t/HlWmRrEjQ66W4NVu20G3qH8a39FLi8zgfqVnLwJeeKCSHTocwzldtNnCxXsQy/GfJHlF5/i
 tW1UEQJAHn89X/ipXpRYF3c3QA68hZvKULVWcJOlIIQD4XvCb/+UyVnriuhkhkhH8znERO43+Pj
 +1gdi3x2E8HIx4Eg/yFH4bP5ihrAqFKij7J7R9/50S3rAOHUUXd2hZ/QFiq3feV033cHfJNcfgH
 yQMn1qNKMtFnLSg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXylCObfxeyRRj
 NBwjMLrHRwVO52APJUh5PUt5oNRgX7OcSA9zr8m1F6uu6MLb4fSCfwcB2QgI9bZU2dtJnmzUboN
 2JCEnLjwIOwkkecF4xjOTO2vvQdKxaJ/1lwh4m+ltYJSd7zYL+DgREHhX5WZyxW7bq6WaOFLRnl
 LkPZAx44w4+XH759EHb0Nhj9Eo8X06Q1M0lq2g9+T0Ju88bovqgjIj9yiJrmqot7eGSkge2wf/8
 zF/UkyqLKscrvHBRt00vUjmn/JYxXB+uFxgleqXpSE0483/sIGhyMj/2HpUnPNx6JbMW++x1sD4
 jUgB5mS5HwpOP+b5iygpuxmv0SFe7Y4RGp1plFPtADN1Cp4nsGcgO5elulzTSSj89UmoLqJHvGY
 NM1Zu9Uhb4l7+MNU9hHbJx+61a6jVjTR6yimeV7ederh7rW+cmgX3wmzDTHXL1ypiwCZxNFvY7W
 m2RM3XUv5NCVAlXXmMw==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6fd2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXx8zDSD+t/zvV
 hltYXFLBhLbvwJx9hx1+kf1csfqQvDrBpdymtXcpC9+RhMnY3d0n/7GyxhkH5QWhKeL2GWFLCDT
 BBLziwED24EZ66DYqyOyoC/pjgB6oas=
X-Proofpoint-GUID: 2jbtW30r45BGcLvrwLuDTRJgswezHpkj
X-Proofpoint-ORIG-GUID: 2jbtW30r45BGcLvrwLuDTRJgswezHpkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm8550.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 53614e980b26..f8dd1727c080 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -547,7 +547,18 @@ static const struct regmap_config gpu_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm8550_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm8550_driver_data = {
+	.clk_cbcrs = gpu_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm8550_desc = {
+	.driver_data = &gpu_cc_sm8550_driver_data,
 	.config = &gpu_cc_sm8550_regmap_config,
 	.clks = gpu_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm8550_clocks),
@@ -574,10 +585,6 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8550_desc, regmap);
 }
 

-- 
2.54.0

