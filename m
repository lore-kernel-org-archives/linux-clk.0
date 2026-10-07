Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10B53FFAB0
	for <linux-clk@vger.kernel.org>; Wed,  7 Oct 2026 06:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355867; cv=none; b=O//miS7egEYoWcxhp79PqfkmNinj7M5xo5FY7R1QmmCjAIwNouOR1ZjuNVPevQqbWQIw8yvgvf1UjrcobFFuf3jbzVfEAsZ58pW0i4A5K1BveWRIk8Bg0+6geNs92rLQ8DK2N335exQeXD20saUt/qWSkSEXBqoaXLjHHNflxvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355867; c=relaxed/simple;
	bh=7xTUJn13ZVC2ulMbiUxz9zRqeDyOQAhzkKrT63gf7f0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/cQKsaa97nhXHhJdFS2nAKKuUfdfVcRd7hRzbRhX0pMPbO1Uw8QXLmoxhRvV6Tkf9KTcZ4Mziy0JpIiYYD+q/axhULqMR9DWpVmKNw1sCc550y0Y3lSPJ3WD/gp37ICKa7l5AUd1gCgIl9Mb8IRCyWSNiYOTGVVbpksYIOYrVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZO2nMAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Auz/Hwzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZO2nMAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Auz/Hwzg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6974lM473929609
	for <linux-clk@vger.kernel.org>; Wed, 7 Oct 2026 06:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZE/tjzIfxuJJ4Ojhyg/xfoP0VuBfZp+JWppPMH8e0fs=; b=YZO2nMAdCM3sJzeJ
	0NGp+JTDyEFuvZj2s81yu9/ddDz7oLCNvRcJ6grUCPS4CcRxNLmdx5bgNpPUeEPu
	vjyNBhc/0Xnpz3aCLLAFL8BW5t3H0FyQToyVBRYKu6q0h60LJvdm/i1Wu7SzxNoB
	12FmOK64gKJJTGubeoPNvEEStn8lnyjBxSQS2BWvwa9b7srnrBb5yT0YUdVO1B5z
	Vf5XSGCjvKYglOX9jzrVX0xCxx0qAAfdx3c5qk6l0ga+7C5TOoJQIEsUMUR9ct0i
	6s5IU7kvgehSPVCAqrmtPdSBzwkMw81fqDU5XKXDkRMrsBDqvdVcTTHaCvLw4iIO
	i41jhg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58ax9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Oct 2026 06:51:05 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-155a75f91e1so2858556c88.1
        for <linux-clk@vger.kernel.org>; Tue, 06 Oct 2026 23:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791355865; x=1791960665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZE/tjzIfxuJJ4Ojhyg/xfoP0VuBfZp+JWppPMH8e0fs=;
        b=Auz/HwzgUnVVmV5arlf8yNbZntEvPpWtt9WrGrawMCqV4ezc/pH8+jk2WUPguC18uB
         UFOUekGZIqodSS/mOmozaFFXiwkakqsfcsGs8lMCqx4mdd1LwdLSKxJNKLBHVSmsti2v
         oxx87MI4yeEBTYPQ10s9wvbfoLKo4pirIK7W4EGF5oiAKw0DsZbHx4KFdSAzU3RoZdya
         Tzv4hyJXkiKagkG1JGorNNwk90NttvAugz3y1gOXe0Xa3RD+VMxVWJAnaHTz97th2tGe
         R3KSrrAVEdAO/RNA40WxxpxJzjKdkbIo3qQbWkyRds7fp8RrGYPDXeN1GR1Jb0HrGX6P
         hLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791355865; x=1791960665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZE/tjzIfxuJJ4Ojhyg/xfoP0VuBfZp+JWppPMH8e0fs=;
        b=XW+UQMwTbAb25+0cntE4A3nb5WtCA4CHKGr4OVjYCaRtS5v1BdS8i5polre9rVrA2B
         Fh6kwwMcfdoBxVyPALbCst0oDYw3fT3oB7kFeU9Wqhkk4ul/7LYxSlgMzFDHIsbdQtI1
         5mVLpXE/aKfC1zj+MZ/EelJNrcNBTxk+PLn9kk6SqpAmEIrSwciaVPdqvJY3Dokzkovj
         FQ8t0n8AK0DO7FabYPtEGgosmytMoQEJmh37qcTTAdneiBye46iZb5sD/OiVUFrDF+dP
         WRdL1pmM6izEudl6vbqb1GaS4BCbrHrdW26PdajvvcL9wl/oSsNDQxVfq8T/zrx30juP
         6oDA==
X-Forwarded-Encrypted: i=1; AKwUvBwbV3l7n5jTb0/axliqtmGX800guMMWvPh5yrYBm1Ggov9BlOGA6V1z7WJSrvRbB6pb4XfvTsdZoIE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwiW2NqAou5lwxKmkkoDtIOeddRjA4TR4pE2/BYtLonYfRn1lS
	pC+Wmkdp5P5KkcE8NTx33OU3u0ggFHPaT9N2Q93SezfKe5iMif5CPaxttwr8eqkzOAmVvWQ1RUh
	nrsuvqALKjPjhLm8l8KTCGiR9tk/TS6h32PYr+koXRxfbhWlfhsqSN4l09gpQvDQ=
X-Gm-Gg: AYBFou02HJaJ8t8zuEdV0XtAey1e+M4wq+mHjDHGnPBvFtzkb/p3msAI4myN4UzXtX9
	aoAikKkHBDYur+bb21y6yAUGjKODUqnG92tbzL4QTt+/HFwXHXpxc3chONJdAxMzfoiAsKS4pWJ
	JHL4k4QLYuDyUJqeP9+cXVmj1U9dXFxUc8CNURJpR2HpKZ/5HBqMpbZrwxkmJRT0zfmWeQn/ZW8
	2z1uivfGD4TOkA96Yi/EH5nkj8ZnaxKbulhEH1ccHI7XTtHUVSzVbkWpAm6Wr62Rzv8fuT5sewq
	p8Q797GMDO5W61zU15xZHV167/AQBso4AcmYryp9UKmUBxPsb3+wCAFFHNAtqce9xtscJU/zyrG
	HIxglGVEpVtTD35K4WU1BJnPA+fU8DaBh1TvqMgjl9IgIBNxCy8qqcHMnUgqgMFuWj+jYLgrix9
	ya4ao4CI7fhtN/VzS9uMg9CoFSK2PvSoYu2Fc=
X-Received: by 2002:a05:701b:271b:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16207b90868mr1008612c88.16.1791355865157;
        Tue, 06 Oct 2026 23:51:05 -0700 (PDT)
X-Received: by 2002:a05:701b:271b:b0:14e:61bb:ec3d with SMTP id a92af1059eb24-16207b90868mr1008593c88.16.1791355864644;
        Tue, 06 Oct 2026 23:51:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm7374730c88.2.2026.10.06.23.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:51:04 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 12:20:45 +0530
Subject: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration
 if already enabled
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfXxcsbOoIW1qBT
 DyBh3ETiotpTGbk6QMivB9Zco/puZX/SAcfrBnDGT3UTDgNQePEOtixZBHnPCq+rq4+SSs+IB3G
 R492uHWFrTzT7ojezZBu+1ik3gArvjQ=
X-Proofpoint-GUID: vevcW6xw6Jlj4atHGvhhFwCcI0RUFDjj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAyNyBTYWx0ZWRfX7bcs4lNf5LhE
 w5dAat+j98FCXOcq/dkKjSaxcKyWXNxQCil2nMf+tuRC8L70DDbEGheJQyYkk0XNrjsXf5vy2kY
 6FgU/GOGqTajQJaW+/vUsiqo0Raj611/BJ58+PgrR0VfmYLDKeHx1ajVOnUdT9wj2axN3ILCzBw
 f8qP4y9WlaQ4/mHpkVYj9nhj+5IUQ8SHgU+zsxPEO2LMBvrf51fFAdbqa3rGty4g0kUiBbr4wf5
 5jQTyjbbyLFR11kTKeg0qbro74IhPGkRmmtBnvxMEMYWi3MLnASDCRl4DhFUWbahah2sXSDY2mX
 j1bkRgy6tJkXBNSF7uDhLW0ZQ9lu4YgbwhreXd3SfCRkFXGc0AylbROK/DIH7S+hz5eMVP2TiHW
 lTNpxsUyV+VSI3BsAi1tsl8FC4X2L92qqOsn5+4lMzK/Ij9z0VFIVKxO6quofOt+bLTGAF05Aor
 2j8mUSI/u/xB04A9ovQ==
X-Proofpoint-ORIG-GUID: vevcW6xw6Jlj4atHGvhhFwCcI0RUFDjj
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac5ebd9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HvQ8q7LFvqEYzEKEMhkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070027

On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
that provide the clocks for the A55 CPU cores and L3 interconnect. When
the APSS clock driver probes, it attempts to reconfigure the already
running PLLs. As part of the reconfiguration sequence, the PLL output is
disabled and the PLL is placed into standby before being re-enabled.
Since the CPUs are actively clocked from these PLLs, removing the clock
during this window causes the system to hang.

Avoid reconfiguring PLLs that are already enabled and return early,
similar to clk_trion_pll_configure().

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 60173b076cc5..3641b2da92cd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
 {
+	/* Check if PLL is already enabled */
+	if (trion_pll_is_enabled(pll, regmap))
+		return;
+
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
 	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
 	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);

-- 
2.34.1

