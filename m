Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FDE4E66C8
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554582; cv=none; b=R15aaPkWJpedVfud6YH0JkaKsM/W4L96Ns2+hl1mxU2m7dKq7Oc2EqKIjyNUzf5QoVlttgATe+AkS8GI+algZn8FhGWBFOvt8gkKyPNB8bZ8k3m7UyA1UnSNGa831TRXn5xnEyaHsP/T4YpmrxOUh1sxsl7VTEYiLWSiwBUNac4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554582; c=relaxed/simple;
	bh=Zt1XtMcJTtBMmNvNRadDt4f3CZK1iu79tRUg4BM2u50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFUpk2yvBd1N7ipIO19gpHawNpVD7lMpQQ2p66HlLXWKEIGVs9zKMmrZkNfksZnJUWWp8wqfyr9rKQSziYuZjOkzT4qo1Mq0P1XtlmTDj5f84KQ0bKKdvpw5yiPMIUKj/L8KC3wTfVMEz5xwhqsZgAUzHMdXALpusdW7TLnTXQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pE//wHjA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OBDw8PEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pE//wHjA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OBDw8PEn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92geg2477693
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X31xIlH+SeeyJrg8fCIZj2iiMFxIi6b+bf+Q6vfRneM=; b=pE//wHjAzzyPEYat
	20PezwUp1UswrfxuPnQWYZfoAQ+svOkD91teh7Rh4cx5HBRTjZ6uUA0oym9/Si0d
	aTXoCg2C2tnhwXr9bgKxhpRcHwyJ7A/TBk85hYJTC5oEbt0R/FI2g5fL24Jmq9h9
	e9cFrYGM8wqdxpGI2964Pz8yQoGhgYqa8S0a23XExJXxMIqkW+Bz/7TtiFu5TwoT
	KJCthsa3FXYgi2DWIivhxOHIUP3ihD6FlBo/hpkhx5/nqrFe9zRxcQAt2PLI6xnq
	l/OJxPrQYON/HYsdjHBdNC1D4w4/ZL7GkcLvSv8efMJWQ8LjmzidZlZS4cPV3sU0
	64TmGA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:29:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso456685085a.0
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554564; x=1790159364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X31xIlH+SeeyJrg8fCIZj2iiMFxIi6b+bf+Q6vfRneM=;
        b=OBDw8PEnD7LN2vfhTZrzT9XMLQBWT0uUc15naShrqsG12mlyelasGZMV/GYNMhmbsy
         H714TxfQ0zjyGxrhepGxcjR1qvK3dCATNuBh7Yf6o9WIjqkf1mKR7pyVA+K2VCjoJeMz
         qCuR1PmV57PFERQGOfPv/gWiu9MsIkKSGoqnT1ceTcXs7ayoC0MiZ0eTOC8WuIf6dMKs
         DvqF/7xEx3NODfB0nyvOQ1tm3ajCY5+Ugpew5ZeSxHCdYNXpm8kY6hMVmmXZyMTL7EMW
         tEbu2G3N4XJr8He7FWuVs8cb8CJ2Ubi7aYnNaId7a8MmyngrtMwSOtkjveOEwQckSGc6
         JQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554564; x=1790159364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X31xIlH+SeeyJrg8fCIZj2iiMFxIi6b+bf+Q6vfRneM=;
        b=JdcQDXPjnYShSkrfNDq6/j4VxdXM59mEO/XdG6uBwwMpW+d98sDetXnMN/Vf7Bw6Jy
         NAHFLkMUDJwvg5jztE+5vXatBMEUEuDkD2Z5M/++vJF4NLhe4gMqgUK2NJRvo99wFTax
         ZCalVxJnIYYd477aOhYh2nBn3ImpMwSRD2NqGkqE+CwpYXm8S7FuNh14CY4PlsFdYw+t
         q/m/ouHVZAnFUc5UvlOC9B30iwXIr42WztXalTDrls/du4va9NV3rztd0i6+AoBwK/2s
         sSlV7oyTKlZgSaK3mfciJO/Pxc+Q2j327P59+qF/uCzlIGFtye3mIZ1HiYf8ZQT/fqiR
         lHOg==
X-Forwarded-Encrypted: i=1; AKwUvBwp0G5OekB07v5ikIHqynhDv/XVsfurQoHV/vwG4YzsBHUvwTxvS0fIUcctbkXuuco8COWnUzFYe88=@vger.kernel.org
X-Gm-Message-State: AFuF++n13f9xH47BncsZltiL/C/bRcqrLkSW1dapJ1j62j+rV0Fnm7uW
	GEN27Fr97hZOcwExMbL9f2XSfU98v1W/yjNoGBFmQQhU76+QKiUrv+efsfJdAjUk10NzXy68LgQ
	/OEcnZAfFioPYdXuzVmPSa/eiq8rFGqbPlu9Dj4YjrYgKyA+z8Ep54EbfFZTXDCU=
X-Gm-Gg: AYBFou1PqsdRDj9xPQsQfTaQ7iKL2mqQhpxQ4s6WxkRScx4synEC782JdjkQ6ZXXCM+
	CXQ/jxe5D1DKB8EuyJ80G820wvkreilqHGkXaRbpX4eOTk1X+IZcqDDiJiHpRKxn4nkIIrJhc0t
	S/Br15OyoDGl8HQCuCVa70PDfCTFdwG/uMa84nFZpdbOvYsdkA/3yS6lDeKSyfHWlPWGbQgo2x5
	X4Yq2HbuHjcUV5g9kdFyVo+eqMDm1e5YIVhBPh27PdPUStoEsGxC6aR7dRajUsZZtgtInISa4bc
	6oi12bWowGhid7MAnZRAOuMyQ6mTTRBfh1Lwl/XQ93MMokQPCwmlVVsf1/emr6Y93aX+Vpc9mpl
	swaDojjI=
X-Received: by 2002:a05:620a:6609:b0:939:b783:1748 with SMTP id af79cd13be357-93a345d7062mr967658185a.7.1789554564129;
        Wed, 16 Sep 2026 03:29:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6609:b0:939:b783:1748 with SMTP id af79cd13be357-93a345d7062mr967656185a.7.1789554563650;
        Wed, 16 Sep 2026 03:29:23 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:22 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:20 +0300
Subject: [PATCH 04/48] clk: qcom: camcc-sm8150: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-4-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zt1XtMcJTtBMmNvNRadDt4f3CZK1iu79tRUg4BM2u50=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9OQZyuYcb703KrDHQVw8AHr2mbq1+HGk8fI
 yB0k30mmP+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvTgAKCRAbX0TJAJUV
 VpQpD/sHUfuV7j6h21ksZbSpy8zXHkGuk/PwiWT1ChMdp3rOCVzSRUp6SW9EzcdhQZH4+Xn9pUK
 68Q0wkgG38DShgO/F7/1qg6r52TCTQQvYzjkZnlWN0iHjw5oFjK1H+0qcrWVGqzOyptvGVg3hLi
 W5MDJ9vexCVOg6Zubkg+9cWESB5QSBMl1Vdww3zONcYKDXHZpxFF2LuhZlUw3U4qwMnVWgddWO6
 lHGpVCvdydCB9iUCF9MR7wLD/v8FWBP2raEZ9LcmTszu5wrXKuX1m6JLXJPC9kRwOWk+XPfu0dn
 pY1sAWaCXLfgWPjzl6nt3PPXn9XuLIV1Iq5aj3uJ0X/SR7b8uevDyMxLvCzvMJQKhgzc2JDDfBV
 LwTUa6Jn7LyN6kcOgjukW05bHcSQ4BR+hfZ+Wp3ooRxjlZwOqesI/0TFxpNicJlSXTeAzBxuZfH
 NGDo4oUW/nO93vINIAsIA1nAk58iYd8ZNg9mLi9XVr4U6qyE++Tqwe06iMP1Bl+sDVf/mYF3nTw
 Dwz3OxITOgOXa1cpSR/laLNSATj9J/fAskM1q24iQo98+uF785NA/BPbmbCsd88dTDVv1hkkDro
 KG4rUmKan09jEqR6tfrDnZRBtzM0pFUFG6d7tX1SPyiJd6ogKIwd5we86wvYXyesojhGMVVonZU
 Tha+BKUpVaO92Og==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXwGi6HjKqKtjL
 2q2OJmXZ833ZRRnMBTeCXrTzUbiOAAXyctEdx6/7oBosJr+WM4/p9RF29gjFRkQ46UCJyZ4P3BN
 8BWsxWvuZpy7xG5pI0Bw/SHhLKXTahc=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6f84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HACHd5sh_oZ471OAbCoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: eICE_AEkL2oFWiSgUELARFHrgblA419D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0600I9/REBXr
 y3HGHBqnJ5bj0tKjfg68krpD1zWDWGppOle0MNpoSzogN9hFzEcWPF8QookjXF6gRGXljDGP/YF
 K1kGWjrTzKiXpF6FtVxS1ieMYPIe1MSrtXlYoM+eCrLw0RtpCyydprzHroOgX66U20yO+DurYE8
 hmryxInRhoWBTYRGiZhTkgFdlLPVF/wMOR5oYEzIQDvl/7yc7Lhhv23dPKi6DWhx+KNA3AJ0/ez
 cWJch5ehmhtg9B08knqwj2kAs+bYCozZPzVnGC8QalgJSORVJlRHurLY1zGhH15ZafzSZuIxSZR
 JZ1HZJyA8NsY1eVlD3QWntXAnDyrb1P4DqA5Dnzpt9Rh5KZTj9kJ+98FGYD+FFuu0Inzs2KYZ/y
 B9A4K1DUILfldstMv5ZAVMftA/SBfuxbxA7Gn3JBxJI4eaJhoIynRzPDa89nvdLhvmioF0DM0gQ
 LakZ9uJw4vvQAQhZ9rg==
X-Proofpoint-GUID: eICE_AEkL2oFWiSgUELARFHrgblA419D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index fcbaff55fc27..27a51abddce2 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2093,7 +2093,17 @@ static const struct regmap_config cam_cc_sm8150_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sm8150_critical_cbcrs[] = {
+	0xc1e4, /* CAM_CC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sm8150_driver_data = {
+	.clk_cbcrs = cam_cc_sm8150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8150_desc = {
+	.driver_data = &cam_cc_sm8150_driver_data,
 	.config = &cam_cc_sm8150_regmap_config,
 	.clks = cam_cc_sm8150_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8150_clocks),
@@ -2134,9 +2144,6 @@ static int cam_cc_sm8150_probe(struct platform_device *pdev)
 	clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 	clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 
-	/* Keep the critical clock always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8150_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

