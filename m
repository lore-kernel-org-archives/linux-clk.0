Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037814E80B5
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554589; cv=none; b=jTHsPqjlIC5H+sYkhTh8t86gd7ldV+oowXevp8llc0IpOl6a233MupjTvs5jMRBWYnDS6DZ0gHDsSKHNk8Qol8vBkrmzng0nQ6Q/xjbVezsFK3F+aDy3MYu6a+uSjXLZKmQnguI1fcLSHUkb4yQV5kZsD3KdI2aDdLeJhw8ls7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554589; c=relaxed/simple;
	bh=qlfNz4pd0+y4mAPYA9gJApqjJZuFHRKp75YT7U9cYs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKoo8W8cL/EW4RdOojtz72HyCwrsDbLGSqWEnxxIZl7d992cIaMf3Ip/yYnpvOKaKFmMG2VrlSEpePZ5ix4IvWRJd1iJJgxFpOqrLDnRfH+n8tsYz2TUvc2UvqjcghFKIxFo+bvp8iZnue3IAyWS6wCGvvS3qw0Rs4/lGOvXSXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uij9MzDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHLrY4By; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uij9MzDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHLrY4By"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93ALh2658317
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4V3xiwbplHoiKjEUNaFCzSGf2IrsjYKLcMWg+xw8Gw=; b=Uij9MzDhSjaKWX2O
	JaDSSvhbc3Sxm2MP7IZXOQf2q7qJN8NTiOdb3J63P766fsWqecCMYHbmjy99X6VT
	cQOZY3D+JsEGGwBHv7c79s5DtpUoOIcYLnrKYRQc8dc75Y/Eo4KjEINEJv69RylU
	ztpGmI3WOxMa04kMBqEZh8A7OfraoCV651/fc+AVHsN5buWBVCgjn3KklXeBYYFS
	K/Rl6dl3Lnr3IZ5w0MgKNHljQG1Rok8h6JOEzPGW/1ju+NZEdlX0NInX1+WalYFs
	akvE8SvBmEYFlXswOQgFi8QoeBH66VgkHFwZbCaRSMt6K0YzI0TlpjLvkkLLgmQL
	j5N+IQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujap2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1e564fd5so509398385a.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554582; x=1790159382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4V3xiwbplHoiKjEUNaFCzSGf2IrsjYKLcMWg+xw8Gw=;
        b=EHLrY4ByPs1gmtjdArLGz6O+YfLnnqAdZDwJwX9BEF7kcSxDfKtCsr6YRtxO1u1CtQ
         ZmU1SoarsT+jMFEUxIlHqd+TKLO5Ya/nSf7CSnLRRemKgftz8l4h+NUJLZ9g0Lu4Y2XZ
         ZzeePhCIceRzTp/EHq4MTiJNJTAk6ell5K/idCit12ugyWllcutQgmUmUR/DlPix8egP
         Cz/ZlMHAU6tTjBWkTSQbg9Ov4/vRdRg5bgjR5P9VZJwguWB74DZDKWwUF9OWglj79JXJ
         eXQ2QeLlMSLrt5Ne0vdrSXhNvi4lRjvtVnDW9n+bIX30eCTF4okjJvPsUtTlr7dJkyui
         4urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554582; x=1790159382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4V3xiwbplHoiKjEUNaFCzSGf2IrsjYKLcMWg+xw8Gw=;
        b=u5wzpd+0L1HOxmd0AEw67gfCIaF1Hy2DRauFl1Iv47UJnsGfIF6lsjg1KQ8e27eF8G
         iGELupXvKUEaqdUlZKCt+xanAYySxlkt24QKGQhZqj1XMWzTK+lt4ypf3fPfX3LTy8Bh
         wvTHj9mC476YTbtrVvdMsxSC5EkCCZcRQQNjQ3d1LVtnOh1q7oJlLUgVRl7BKH28+z8M
         Z+scQKZRQgAMBD9XKmlp6svdnlUZw2MIsksIyymCbBot0zBiGOZl7cIX62vM6ig+OtXi
         XQUThZw8e8d3AR/upsDWEi0cGkNw0j3l+OoedXEfbmQYy+CIaUbeVQigKwdyxL8TYj0m
         vLKg==
X-Forwarded-Encrypted: i=1; AKwUvByreY3qrGjCOFfL15YY5TJMR/keieoRfqcc3/6ZTrIPkinZy3MtkxKP/CMrL3fAtlbbFKMT+Jo9AfE=@vger.kernel.org
X-Gm-Message-State: AFuF++lblmQFGLTjBG/dKXUVhfc8eBz6dW65EDEgKHPpmFo0X7Qx9/iY
	vMH3P9GE0ZGFQrJ/AAb2LW+U1PT9YtRqr+x0BhjJ3FCn6CCr4reEwHX9j6Yy6oQTh2OwEOic3ZK
	An/4ZZiiMQ3WTFbJVoTdZdpEugBx6OWEvCxANB+iNV4OLH8017XRvOtMO5uyHccSCIffVFWM=
X-Gm-Gg: AYBFou3KN+vr8LR8zgZI/mltz8xFZx3lClBLP4JGhQV3eR+AgwPjCWDFC2N6Zgie47Z
	TJk1U/GSbjCrfQkF5O+7mbwyfAhVZd6/E1B/n83AEzFq9wQzUV/jkG8XwCHlkjEmdU+O0Zn13jo
	w2b92BzeCV3bUdaYZ87bZxjulL5WQgBUNxtUIh82cOi9VDFevCxy949iIW6MHuvI9Zs7wShtBrF
	vl5YO4dCNLHYBgbEoCMcMtUXDkPZAeZI3RyzelPH8Atenny4ozY8erl4St1i5PiBT417FcE5M7c
	I68g3RDaxRF+7DE/7yA8nJwJ4I3rifwxBZT5BSfCgttRzpY4h6VgQZyUGoGWBxlmOFEvg5YXQ0m
	XBaVauII=
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr292101985a.5.1789554581621;
        Wed, 16 Sep 2026 03:29:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr292099385a.5.1789554581099;
        Wed, 16 Sep 2026 03:29:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:29 +0300
Subject: [PATCH 13/48] clk: qcom: dispcc-x1e80100: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-13-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qlfNz4pd0+y4mAPYA9gJApqjJZuFHRKp75YT7U9cYs4=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9XgIYWAAyWWO5S8pQ1375Ok4Z72pPaeI9SY
 GWnts4zZ2GJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVwAKCRAbX0TJAJUV
 Vu20D/dJM25yhrbqyIQy8j6kaZPz8ScFaF+uOuX+6PO9yeN9q8jq1+lXoicjd8pse5BJrF7YfM2
 PkCT5/eAbPXKqaSIxsYbyJ2a/BBssRzOT0cJC08F2kK4rrAw8veS20fT8T3FCaDhaT0siejTFvW
 R4guZ5o5qgKj1I6qSMUR6+tjUdOMJipRzTBYFMdPigFcyksJ00orVViYNHf3vJabGFsEvnWt6/q
 0mWQksqh+XLLUyCuvnc01z1CYkjCN3I90kwkEsF0c3mQ/4g2Gh3+xGy1PlfSa98w21zxobbLqIH
 bZXRfemB7dPkqQUTaTlE4fyrUSr152iLBqM6/C0nJvXFrwTC2jO43bW6LRaZIk5c2q+GulsaSxf
 rMZtL8VftcDIvo18kWsRfg8BPl30ZnBB+jyHhtUM4Dy+10t9GY4p1HPO2ZABUrzthVi9cCeRjC2
 l9KM7lL7Jx7HCpyzX9FvRRPccUUlj2qZL8/xjB1JBlt4LfW4DoCDTKKvLIKDhAxBZZu4JZLALxw
 v/jswUwSxLtx6jUjd2+VuKKpzOh3L9svSCVJkhyFh3WMP2rXajA85PqFRDzsElFaxHhnPX6MSRI
 dAxSbhb9vHBWY0scvP1arhV36Q27Au7JT6zd0RzA8Np5HAceixQQ0vgDeSb2G7ZxOjN1mXs/t2g
 HSyPrwoHSiFES
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0VvhFr2ROZry
 mOVQ1RzswBSfQqP+BQdAgbmOqBUfF8BLHT0hcedcl8pZ7lNnM5F3mplG0TeMdI1Rpv1oXU0a4Y4
 5Q116evh5Dmy8z1vB3w/5JwcljsLLE3Vdnndosf9/ijmGQlISMkYXjZucxmHohhYoUSjXCkjax/
 jVHxeLYxxOf9rtAg6+axevRqRZ+a4FjLqwEyI5Nk5L/oG0D1mktmaqfQcmWeKh3QRMxFDVYUD2Y
 EpcjoYgSALB5iBdO+w9JL7uEZDzmWAU/abwXdwlv0FC2JirUGqVzm0iB1xTUufNfrmnk04nGR9w
 CCF5aXQ8vI8q6oBZ1xCOUchFJfVp8qI0wn9kL3RiGAQ9FQ1AZ2eo0MXqfVZ+XqdLv+Yl3/Vzr5u
 XFbZiYFe8MFuNruD8qR7fxwNH1pYOa7rsrxL5phUginu8tURlGkaDobtU7ghQPNbN9qzzSa++NZ
 vFixuaBvjjs/1wMzq9g==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6f96 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=55LTGlQWyvwDnq5kMygA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1m8DNFjkgvRX
 na4XK1oC/b89ksQmqE59+nPqENoKgd3xzOTJskoKshl7ZCWMO8xnsfH8xufb67lH5mF3YDmjOd+
 ca1JetpMLNMwYL1nIAXSx6NH2L2nSKk=
X-Proofpoint-GUID: sqs4Tm5d7S3cUqWKUNmzvPFrdJygvD4T
X-Proofpoint-ORIG-GUID: sqs4Tm5d7S3cUqWKUNmzvPFrdJygvD4T
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
 drivers/clk/qcom/dispcc-x1e80100.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index 795279609c0b..7366c6513035 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1637,7 +1637,18 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_x1e80100_critical_cbcrs[] = {
+	0xe074, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_x1e80100_driver_data = {
+	.clk_cbcrs = disp_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_x1e80100_desc = {
+	.driver_data = &disp_cc_x1e80100_driver_data,
 	.config = &disp_cc_x1e80100_regmap_config,
 	.clks = disp_cc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_x1e80100_clocks),
@@ -1678,10 +1689,6 @@ static int disp_cc_x1e80100_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe074); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_x1e80100_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

