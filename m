Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B0322761
	for <linux-clk@vger.kernel.org>; Tue,  9 Sep 2025 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416451; cv=none; b=BpFs/ExFCUfUVGR6jcD5yESjJ1L+xE2H6nO3HJJFWCkx/sNOsC3uhXdarEqHwbDpcB/zbh9lh2czlHaa+Bp7MRCbqSXthOUVog+z/FQd1TPISFUTijl8gzdxUa2Q4hWiAGL+4eKmXTkYjIDwrkfT49o3aUKhyVCqxNEyZ/7m+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416451; c=relaxed/simple;
	bh=0cWRpb4Am+Av7tp1p5YR/jKks8jMS4WHToTiBHvU3kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go/EJsS0fkZwRrDsQW1nFEgKfgFVFxIwSNGizES+2QUtgMJUVyR21v+ZrrqHfde1SO0PQQLH8o8dcC3zLQpDfYIf3akbtAzsZqVMSCTl/efIqy9DtUv3B5k0XylQnotSKTou0wFNl6cC0/4mvYywh1oCfjiZCNjq0aNTa+HvfAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Er+nx3KA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Er+nx3KA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LnKQ020739
	for <linux-clk@vger.kernel.org>; Tue, 9 Sep 2025 11:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+fwEbLviTXnP9T0PkQ6EB6hc
	vv3Rx7j5rDURlYin4bo=; b=Er+nx3KAG2MgTrbkwII6TsOGrwjCXkD0CSo9LkcA
	bPSJ5kfU9Zjh4Xs82cmL9em3BmeLJWznMEMFWHTwLJCFHJCIOVx/u/Bk+NkXEU6D
	+aMBsB2MUOmqaqRsUeqvMSSoIZybSbgMMAP2la3Si5fZ7a3cDsKCMkwM8ooC+kHC
	lWgtjZB+BRd86Z3KX898GEIgJHRMqmW1TlYdtoY0Bc57L3T/9/2b/KPATxlOBGOp
	vcMWQzto6ml1crRDd9vXX5Qcuf+05Mi/1qbDf9Xd2kRe26jnd0ugyds/mUXU+6IB
	wZdyg0rTQsGV0wY6XexuthJPB0FoaeXjHmSi8zfQaoOexg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8a7w4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 09 Sep 2025 11:14:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-71fe8dd89c6so128317816d6.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Sep 2025 04:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416448; x=1758021248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fwEbLviTXnP9T0PkQ6EB6hcvv3Rx7j5rDURlYin4bo=;
        b=O0YNo28aHB3BbduQV5fe4DMgz3dGC6RkYuGjLFDTg8eKzyNPC9Bv9kLiv+EIu8F5d6
         x4G1lGyCe300xzQwuOSVlb2RQNWfAITa0yA7+tf9lLcPAt9flCnoGIf1/XHvTz7W+QYV
         KJ0R8hv9dVNAP+woEnL3KPQUdLmTy00dW8TV+LJHJBq3fF3LP8W744Hcy5rhUiSxjrTb
         UA6mCt55mbkL0AAidSJ4g9BRHbmGpa3IKRlsgRjeiMtnmen+9e0xnNJWAZEuk2FHfujZ
         +x3lD64A/iCHh83gCAOh9sEkDAjTeO2ntQmhpGxoR8pOpkciAGl/RZTY/T4/Dm4eR/Nz
         7qtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5uJLW5RA4bnAEEArcja9WHUgp/yz0WvzYJdnbMc50YVEX+H+496lL0Ffaa/loij4RaU0lWG5hRUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKEDJ1kKA08SWS6NNLv2Bpl0cQAjg4X56AuZ1OUk64/4gGDLry
	R6nOU2sdJxJPOv2tiQsOf4ebzFfb7J3EllUY8Ofl+xHLc2KRXyrWYTMUWkYQ5m3ysF+zsaek1+h
	aD0gKCtDQwzEH90so0A7JxxD9WNLtHrWerGglzfoltw9w7PbMyoyqep4cjwj7wuU2cNNXa4I=
X-Gm-Gg: ASbGnctsvaH5VAJIKcXBnZP3ec8fl+bWJUG3BeRIDYtRVucZ553pd4zRkoyYt67lbSz
	V59A8re8R9RMOTCWU2N2qfY29KQKf0qCK83GQ69xd21SWDBlu6IYsF0NerwkISRQYPKcFFVnpIC
	fvp98zUQ9GVTraafFa6xlJO7W8aZkqAm3p26IHY6rprJRFqyjaoG92jZZqwvJAk9aJ1CGdnyuNN
	5gTHLsVd8QbF8YPpoiCJueamNoiiIiWzrWgmjuSb8pMpjYshfdyF29FkJpSpuySvKPQuiKckkm4
	8UNFogdzWtPtpV8qZ4li3l12OddvEeRF/ETVBXIEC5jlpbUB2l92rE8wRP6LIkRgSu3GCX2pN9f
	1Q9Hr+5qa5aOkU+DvaFWmhaB7GXk5r8oBrMBNQKoEAHhrx/S6yYJT
X-Received: by 2002:a05:6214:2246:b0:70d:ee9b:9cdf with SMTP id 6a1803df08f44-73930fd5d84mr129752616d6.18.1757416447988;
        Tue, 09 Sep 2025 04:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuYUXflq31tC9iMPaPvSoW8UAsh4FK80jrKd85IRJdZ5xoSa42MbchBXglv6LvXrIwyp7+3Q==
X-Received: by 2002:a05:6214:2246:b0:70d:ee9b:9cdf with SMTP id 6a1803df08f44-73930fd5d84mr129752096d6.18.1757416447467;
        Tue, 09 Sep 2025 04:14:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56817959addsm451687e87.81.2025.09.09.04.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:14:06 -0700 (PDT)
Date: Tue, 9 Sep 2025 14:14:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: qcom: dispcc-glymur: Constify 'struct qcom_cc_desc'
Message-ID: <m6xwficrn7me33hnkaeyjzywmb7qhawkfcj6lomajux3voe4l3@g6uhhrjcgegr>
References: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909-constify-dispcc-glymur-desc-fix-v1-1-6cb59730863f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c00c01 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=eHRkPKsZTjWJbIN5jncA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WzsaJ976TEi_R3hwN2L0NcAzJKeOFT9c
X-Proofpoint-ORIG-GUID: WzsaJ976TEi_R3hwN2L0NcAzJKeOFT9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX709FwmGpCT9R
 J+VqFn6SEhD//n0Cr99/jqLBQg62X5o5R437JhmDnYoFoWMCiGE+DEXgSkpagXOiKs+21TlMbC9
 N4/g6slf3i4djtlBDA6gzvvXnF3vv9D18tJpzwt+5jlv7UZJG88yer0BVytK8IG1tDWndqFbCWQ
 A/0djVQA+gqrBxCshQ4+1YR/6fvZi5fcQmIw+/BweZ0FZVYUd5liH3b6j7sLQgMoiFzeSP7fvC4
 ZAman++3bTsoI1cdULnFgvoCBMZlRKNS1HssuQy/QQym299Yi7nJldfTns8g3IWV2v02ujoNqpA
 0JFZxwjevS54dAc9sXZicibuEJatrTz5hN+liSviEoVltUi07L/h3kaxucpjeBiD1/6k2HmlKm7
 KC762Yvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Tue, Sep 09, 2025 at 03:17:59PM +0530, Imran Shaik wrote:
> 'struct qcom_cc_desc' is passed to qcom_cc_map() and
> qcom_cc_really_probe() only as pointer to const, so make the memory
> const for safety.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
> This commit is similar to [1].
> 
> [1] https://lore.kernel.org/r/20250820124821.149141-2-krzysztof.kozlowski@linaro.org
> ---
>  drivers/clk/qcom/dispcc-glymur.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
