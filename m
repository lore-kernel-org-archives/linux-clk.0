Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DF245006
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680129; cv=none; b=QgerxOTGnQ1c7sdpl9MLhyhVEa9T4rqV1pSKtM7EAk8q+pGP1KLpwsfdY5hkS0gyuQZXWZHrXeSjC2EKHimZuR//dXI8gTVJ3Z4HjE4oBOHAuqwcH7wpcHZhY4M5XsRTcW0S5Pm0e5rdGA9CMElyIoAT6pa73N5OFjMi8cHjAng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680129; c=relaxed/simple;
	bh=KO4I/UV9uxxYkgVhOGqX3ScFKYEZgickfkxEANrGH48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji5+pypWmHsZ45FRyrzTRqzzQwXAmE53QYBIZBrzkNQOLO/Oda7pXbDv6sw01yjxjh2BMro1SayOs691hrXDQOscc/RovamWy9Evc5eZI4nGL1xeaoOzQiaV/gZSL9Hsw7Kcqshii3JGR2dmCij556mZw3YUqfORwpTT1FhbTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W8txTZfE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W8txTZfE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GD12ue023969
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nKwLAVLBb1T9b+QNe2jR6UF2
	RMh1GWs/n01YMv7EqI4=; b=W8txTZfE3ZGmOAhv4FSqQUXbzDs3DLqmaBso6Esi
	FH3ii1sKg8Io28NEOS6LJhxlfW1FWhKqbehFCMZlDl5cj4N3lVoUtbur31ebyiWl
	2Kk3eR9ug3X42QAq7iupJkTYGBidyGhBvtU/TidrncB4gwkJsTkn7dZjVGNS3seV
	JA19HkMHmi5JkVasToHmgn60azhJi995nhLifMFpmV4kUPn6tsPtplnF+HsstEmz
	TecWGEFHRU9E6GEunBboslb6mnvNOL9X6jVprZI6PA5cbioEUDVmmT0Kw4nw0G2b
	znY4tiEjdLzGl06UfIHJKq0sKc+xqyOlvFId9H5BWBjOEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsq8qfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 15:35:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e207330a45so585643285a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 08:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680126; x=1753284926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKwLAVLBb1T9b+QNe2jR6UF2RMh1GWs/n01YMv7EqI4=;
        b=vRy7wqi5hC97R9yZnb6gfzfAqKzSzoulUjyH05Uxnv71ddjGbcAbc8WHvGS/WUPHz9
         fRlu152EkCaHQ34/KjKX2Qhk/dX/e/e9CC8/RjEEEJyEe2KQMqul8beYdITMGff5TFNt
         pfMxThbbgT16kycfqpTrPDxyTSVrFtMy6wrmRffcAYUSjCmfVlCvGot5XXJNUr2yx+OZ
         dk4oN27q6VHMtfQMcM9HkZt3G0jX3ywunOTuBBa4nIwDpbgYEXHPQBYkAxItE3g1vgmr
         AG9ee1J5+Ou3Y9zVZk25lS0r/QpOjtLQdZbQQpe1fsWLADTtOxcQj0SBKrf75dUIF0m9
         kylw==
X-Forwarded-Encrypted: i=1; AJvYcCVp7tGsbVBqbKtt+Xv3EgWBLJC1x0qcGVWh8Zoz85JGCMosFVurPweNld99QGKbpzFxmFPno7p0br0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2vlodNfBjBkPA8wLdYBm+BkQ7/IpDmzTLSrg5mNmdyyqImGxF
	3y4fEdnKJstZkTTEBCTBpYMWFZWZcgP2Z4J5RGczJ/ff1V9OicD+lgacgiEUnZGkxUe/vgpf6uD
	A4VnEZ+CYArpsGjBWgTvR0Q8KK+nri6n8sNvKftYTtGTGH/NYDpAOT9j+L4IV9MM=
X-Gm-Gg: ASbGncuh1QGwqI/A8Sp9aExDp1iCfQqt+ee9jcvFSIOe074zEGpNJsj9jkePAxxHYvO
	+dwGJ8oQ9V/WWT1tV9FkMreJuWMANFywAER+OZwnx7Ic74ySKfHxxFlBFFNbxVR14NRWW/yFbjN
	SXO69KEo1UXoucdam43dFcfcX66te1/ONxYZ5Dqvs/VFNb/EXWmjPHGaavY8QCpqjFHmbHobQ1v
	yTTy8lk5PF+JMsMjgkLtf2AceudUW5BxJ9/eqGhLz4zORRayrgJaHNJ3CF1+ovn+UxAsD573DXK
	uhzCN+N11OtlXYhKk3ewvFi/VQ/la3hUw8WYYm6e324Q/udwkNzOi0Cx6vCI6LxlAgtgcZvqCg1
	qw+Ox8r538qcwIOAkSUEcxlzfB6gRZZWzYlD+2rGQSy5zAQ42E6Wq
X-Received: by 2002:a05:620a:27c5:b0:7e3:31f5:c8e6 with SMTP id af79cd13be357-7e343636bfbmr462007585a.54.1752680125823;
        Wed, 16 Jul 2025 08:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhZK6K7A2ZsfzoQ0Uc59Gc0NZS3lOeMxcF1d+K5mxadbzZ4Ra8ZrydLaOEEGJw/CLKuCxFYg==
X-Received: by 2002:a05:620a:27c5:b0:7e3:31f5:c8e6 with SMTP id af79cd13be357-7e343636bfbmr462001285a.54.1752680125217;
        Wed, 16 Jul 2025 08:35:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d32b6sm2684915e87.122.2025.07.16.08.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:35:24 -0700 (PDT)
Date: Wed, 16 Jul 2025 18:35:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_rjendra@quicinc.com, taniya.das@oss.qualcomm.com,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <vawtojqbjrtoso4pjoza7vpaiog37hu6gbt7g6mmwbnmwladtx@ebh4amrwxwkk>
References: <20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com>
 <20250716152017.4070029-4-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716152017.4070029-4-pankaj.patil@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=6877c6bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZwOLpZNRS_i71KYojFIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: sw6t-iwAafF8621WYhxWRO4LT_jQOwEw
X-Proofpoint-GUID: sw6t-iwAafF8621WYhxWRO4LT_jQOwEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE0MCBTYWx0ZWRfXzE4Uth9ELjgH
 9of1d+s6UaqPLfAXhQdtqQzy1kRfkHqZcTKyfBGRSM18NXJNO3hlpK9XXqXKRrQAydNDe67i+x+
 ZJWYZ6aKCcSDSsKLzlRhzCZ1tRABW3yCdPfTlWGhNC68n/n4I6NEURxQscK2fVJqTN2Qt4L1HmN
 BNHetdGjGkZTzhCTk1Yw7/YGfc51Pf0UdN/MIN5hAt4vSlLhhrsXAkf+ypZ7vOPkkMJfso+DQfi
 k+9QyXs8InWnIwUbjGyKK4bLUpN9TC5N/VkjVrf1fH56kGNyfZxn/mIub6nbY8UwqVBdQuacLEE
 VXB+5bcc/CwAQ2km/lTjowP0Ps2naUOgaZOhkz3/iMJMQx6EtTjQfMQf6DnWOR+KGsWKkr9VorK
 lKQ4499nKLkQOcs6QYoMYnn3s4Oy3UuOAAoT45zAE82CuqheME1D7tzMBpXeEc5tMnX3jM5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=994 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160140

On Wed, Jul 16, 2025 at 08:50:13PM +0530, Pankaj Patil wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add a clock driver for the TCSR clock controller found on Glymur, which
> provides refclks for PCIE, USB, and UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   8 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-glymur.c | 263 +++++++++++++++++++++++++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/clk/qcom/tcsrcc-glymur.c
> 
> +
> +static int tcsr_cc_glymur_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &tcsr_cc_glymur_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(&pdev->dev, &tcsr_cc_glymur_desc, regmap);

This is just qcom_cc_probe();

> +}
> +
> +static struct platform_driver tcsr_cc_glymur_driver = {
> +	.probe = tcsr_cc_glymur_probe,
> +	.driver = {
> +		.name = "tcsrcc-glymur",
> +		.of_match_table = tcsr_cc_glymur_match_table,
> +	},
> +};
> +
> +static int __init tcsr_cc_glymur_init(void)
> +{
> +	return platform_driver_register(&tcsr_cc_glymur_driver);
> +}
> +subsys_initcall(tcsr_cc_glymur_init);
> +
> +static void __exit tcsr_cc_glymur_exit(void)
> +{
> +	platform_driver_unregister(&tcsr_cc_glymur_driver);
> +}
> +module_exit(tcsr_cc_glymur_exit);
> +
> +MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
