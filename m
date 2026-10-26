Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014248;
	b=4lXtXmO3PGM67p37Rtnn3QvTLohjZmL9s9pMwKS3jTqb1yeMP8eLQahxqBPrR+cUq5V1
	 2hq4ngCB3MBArFkaw8juPvTZQ/jpgg/h1/LPkG/XrwCw9Alb67LQXrPC4D5sm+V4a/NAm
	 IOJN986LqEiYrWMJgqY7i7nU8gqxJc5sOClhDdn64l3xL82phfHxbPiIEgiekdZvauPVe
	 hchvj3dCUzUvRmZPIijuHeGXuLxYMB4Ys1/aGVcVnHV4fsh8oDqSERyIq/hm73gUqKN/7
	 dx0f+cfqsCCi1qfCBm04U24PksP4L1TbojQC9T/oo+fL0LHh6gSAQ+lIdaLi/MJtNyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014248;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
	b=XqBLMWaYzq+mMvH3TUoWAOEiwNGaZw6W1mE3UVieJn46vPYNBijmddAS7yBqLLeO7ACi
	 nEpCPVKhEDKMhWox7WtXPSASDccxvQsKY9HqBgnetV0b5W3bskFXZ84WBbd1fOHthuu2j
	 GNlkeIda6uoHpXy3WkBZdpLVJw3lRpqfBaDHqScD+/NB5BnfPbZRvcxWfnbtb8Xfo5+9/
	 4jh8k77EuWMFm6iZ5ztrKsH7uxrFYPOao5btqjK6YS1trIbelEwJwzJCEtOlkA/hj1EEi
	 N7CKlJFGrq7d6PkSgffVwhBynm1tjOoet8M6y1CCQZqHYsNW3w3lcrCZHIHdNosTfRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWBIaPc8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fpMWzgyY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A56A60A2611
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A56A60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWBIaPc8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fpMWzgyY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAso2o2168546
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=; b=iWBIaPc8dS3yeKG2
	4Uwi9SITvqMweKCDEwiqzl86IkjnUjwk8slr8qxPtH2nEfThNvbPWRKDOlD39ppV
	+T4noF8Tb8bv1rbLHQTarkwNe15cekDuUXg3T16wPxCMJB4T/XZ5uQsr9gK84CWG
	uVzCX18j4PDxStz+/4AspT2Sy6ImIdbznR+0Ohw83iqmCuYreDK4cBsYfLLCstKL
	YnYIf/wiMF1ZxyyuFeBioJ8s/b5WFm+bbdRREio/g2lvDB3/zYaJENjOWgisH8ic
	j0sxDlemfAzHNRTHf6aq1wPyAivAdPXkv7/CKWgTCFQnxqwBh/mJt028j/OR4I7t
	FTl8AQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60j1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 11:30:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so2867110a91.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014247; x=1793619047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
        b=fpMWzgyY7jBweSkWGJi5RrVynz387OsWsy5QMbRL4ZwCbcdpPBuY5kzgFN5SfnrYtE
         6Lu+7+8xk/sOTYMDqtFmVsOZ06Uk6+fUl03gGW6k9si9FVknNQDq0B9eT2DkHD6shd23
         AleR61QIAa3z33l8fAVtrR59c+w1izGsdpzdGK7AP4+UdCbLJLJMbeHYoLYsugfDA6m1
         nvGsyoLyugvhdVB+HeJ6Djkz/K18bVUaPcv8R/6Sckr9/N7lGmuDrIKpc2C3pkmu7qtH
         kgOqNskpEVqGizT2Gu4rJ+utsM6mSybyDlS+rNq9xaufW+/NHWMxVKJkRUJwT6pe9Q0f
         o/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014247; x=1793619047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFG9IQ8VMEFoUJD6bLeQT22wb+k51hz+E5W5jGAN8q8=;
        b=w0gPUhwh5nkwh8YtQfifki2YMLNIO22nXyfF5YTpSNzeBH9BbErnmxm6UiZNSIsAnC
         6aVL8TjlXxgXL3GfN4jFhMr1Oa7ypsRKQ02qhqfFgsRoNGfw4eYmZRFGCu44c7nFdSnf
         y7aIHl/dd1UY8onoMP0/nCk8RaZgtppnOVdgQwMd/ykld+wH4mDTuPiJ/jAnAm4iGp8k
         Vbq9Z7lTQd4iWQCG1Y4FoEFWJStohajDIKA61ihAPgB/4C2MN1+SW35JG4onou+bfsYi
         dvs9i0TVX1SLUEuDm2zNoxsJrDeBwAPnwSr+4z2wi2Y+ZinHdyQ4KaMYzZntSDoP8TcO
         R/aA==
X-Forwarded-Encrypted: i=1; AKwUvBw8SLQJTIKYTVYUySv72ULikOHfuJWkZor45WyaynAw73btKoa2ZcDsHFVXCoaTcW4fi3Y6BXOgelo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIelSUI9a64f4ghQyNQElE0i7mxJQrArx8SBH80LF96Tg1SOrMH
	cfyneCCSU0QU4fbcWQwleTIvpc0jOe8+MwJ01l1OS0ym4vOC2KQ5FiCcJQvkIymZusd7t6XJtXQ
	XKpwa8alZP8SBrpjoKh9AuGXEiAI2wCoWBYAUAn/7z0xHls9niw2eOgxxwO93Nac=
X-Gm-Gg: AYBFou2qE9S8sIQ0ZezGw1f9qT6cTPj5ZRcaPFRTeQFb40WVUVSt0gjrLjATyL6Ccbv
	uZYXqtxNQOob3AFTR6yLgQ/BjZUYS9ENrDxU/HTzzhwrdjN6f3ADvDC/w5aJtgdz6gXEzj2AKcY
	wTazpYaeyc1IaakdcDPBOyYrKhO5RbOO5ziLSy5E72SUMWfVuYjssP1BEGD9kFIGGaarHNnNwtp
	kXwLc+BD5XZh6BWqwkceiPGZfwOFQu64jqH/x/cUYEakeWRQc/Ky91SP2uaXDW7baNXhIVMqctK
	ScZXDzjTOmVZTJnSVPCIX/KdBeJO2qDx6ZnJOmm3UuJgzjzKJSGzTTHsF1uqPP7267Yxdw3fYrf
	VF1O2TWnNu8W5Kff0p7iNtUs=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3577929a91.1.1793014246489;
        Mon, 26 Oct 2026 04:30:46 -0700 (PDT)
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr3577891a91.1.1793014245696;
        Mon, 26 Oct 2026 04:30:45 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:45 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:34 +0530
Subject: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: PjxeAsNa7A_drvadqcgr8xuZsgncbYdP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXyHQ19BFWdVdF
 pwD4stpJbv8LVN/xdRpmN02DTKdCuo6aVWM8Tm8JhylOn8MkeuGP2FI0FNycxtq02HuFhLEGX9a
 CQn6982dKdG1Cej1ESZDI7cvDWsehZkv6kjqwPYyH9W1jmcPzR13JEkAzHIfneRsoxV+yczJpUI
 4Erc+oBPmMyy96j9/RbeT5VVs1hBLbCDlbSp+aCPPLsRIUPnPOEUijdHR7KhwR2wALd8fYCXj4X
 jhZ9FNVIbeKUB/7SGx5wDmEm1peDguiDqUp8ZCiPbicIB7G+rEI83mlqbBs66VUBZ9e/j4/VcP8
 PPaD8hbNGV9Hi43xT7WVVcsw8jGDsSH3kXZanjPk4gyieckmgZFa3py2RlIGwV3P3KINC36ol6E
 telO/D4vVlE7/Pc2hh41k6G5mgJLIsIrUoU/EjIHPctdy8tmfM2C3IcBxYl0A1eEuZDgb8b+1BM
 mE/hudfsNCjMsuFOTTQ==
X-Proofpoint-ORIG-GUID: PjxeAsNa7A_drvadqcgr8xuZsgncbYdP
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf39e7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3FSzO3sQUw+c
 pSfNvJxNweAWgbz2RrklXD3mPWm+kqc66om+gyGZ59ICA7tz85gmS3ktFBp2mBjAdBHmnIvkYzu
 gfqnu74o0+NLbjiJRd4BSwjYu62Ibpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-qcs615.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615.c b/drivers/pinctrl/qcom/pinctrl-qcs615.c
index 0e7df184122b5b94756a233a009ec0dd3675816f..169323635d39a7c3441560feb002e9e03a577515 100644
--- a/drivers/pinctrl/qcom/pinctrl-qcs615.c
+++ b/drivers/pinctrl/qcom/pinctrl-qcs615.c
@@ -404,6 +404,7 @@ enum qcs615_functions {
 	msm_mux_emac_phy_intr,
 	msm_mux_forced_usb,
 	msm_mux_gcc_gp,
+	msm_mux_gp_mn,
 	msm_mux_gp_pdm,
 	msm_mux_gps_tx,
 	msm_mux_hs0_mi2s,
@@ -581,6 +582,10 @@ static const char *const gcc_gp_groups[] = {
 	"gpio59", "gpio78",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio29",
+};
+
 static const char *const gp_pdm_groups[] = {
 	"gpio8", "gpio54", "gpio63", "gpio66",
 	"gpio79", "gpio95",
@@ -840,6 +845,7 @@ static const struct pinfunction qcs615_functions[] = {
 	MSM_PIN_FUNCTION(emac_phy_intr),
 	MSM_PIN_FUNCTION(forced_usb),
 	MSM_PIN_FUNCTION(gcc_gp),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(gp_pdm),
 	MSM_PIN_FUNCTION(gps_tx),
 	MSM_PIN_FUNCTION(hs0_mi2s),
@@ -929,7 +935,7 @@ static const struct msm_pingroup qcs615_groups[] = {
 	[26] = PINGROUP(26, EAST, cci_async, hs1_mi2s, jitter_bist, _, _, _, _, _, _),
 	[27] = PINGROUP(27, EAST, hs1_mi2s, pll_bist, _, _, _, _, _, _, _),
 	[28] = PINGROUP(28, EAST, cam_mclk, agera_pll, qdss_gpio, _, _, _, _, _, _),
-	[29] = PINGROUP(29, EAST, cam_mclk, _, qdss_gpio, atest_tsens, _, _, _, _, _),
+	[29] = PINGROUP(29, EAST, cam_mclk, gp_mn, qdss_gpio, atest_tsens, _, _, _, _, _),
 	[30] = PINGROUP(30, EAST, cam_mclk, qdss_gpio, _, _, _, _, _, _, _),
 	[31] = PINGROUP(31, EAST, cam_mclk, _, qdss_gpio, _, _, _, _, _, _),
 	[32] = PINGROUP(32, EAST, cci_i2c, _, qdss_gpio, _, _, _, _, _, _),

-- 
2.34.1

