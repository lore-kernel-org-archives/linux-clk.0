Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3A20F067
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 20:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769286050; cv=none; b=lPtbUuIsCHi9rEgMEudZcj+tRuM4ftrCLKMMIxngUVe83ZhhJQeWb02175RslbcMLSpBW038rR8/AUPkKwkuAom1tCjszTADXd+Bre5StpjvobW8w5ujoQnIXR1q+IaZ8v5i3zwF8qJk+GiujywIe99koaeM2xpg56/TLLIdpUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769286050; c=relaxed/simple;
	bh=R8JNUZrxughMFlK1tUpGsMThTWnlGlQO6jgIt5A84iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Korq24E9/kzpqnBYzM+uXfcrMDey8jhgV75BdQm0c8P+/dSVKcEJgYS3W4BWtEvLVwiozcf9VznpCFkPGoNmCiUn63wX1xHkNyYdJ3PBfVx/7k+4JgwfcsaamqVS3dbxT5LZdIukm49cpl/GaI1SsSNqGnyTkmGAAFweGmpQJA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IhrlXF0A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMjg5hzC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IhrlXF0A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMjg5hzC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60O4dpuY1660040
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 20:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a2yYpxtKqPktlJWPHN0dsbO8
	FH8x+ZVgQuXzvQSS3eU=; b=IhrlXF0A+/PqUooOK9oDhMdx8zgrsWmnnP5vTLCS
	nQkQ0EOflxWnXxyPzZfpeO/gsP/UCImdbbukUnIEnyzHs2QfGUZUjcbDYfTA6HQh
	0mwExYBZw5IXc7EiertwdOOYib4J6n96cv1YS3XgWdoDt2G7zEJjil/OtuQf9Z3n
	ccFmi5P3GptbqhTQEjQ2qHh5Ae/XfNjVqy1DlvhrcCcvcDz6AIG8JzALStvoUJ9l
	bQNT10yHv2qqhJ81lVHrgp7o2w+F8P+eaMPlab35udl1N1JIPKbxBI7gwV3tDDT3
	f4Pfn4g1sD8VIv1ji9SsIcIzKqqqaiEFuiS1M919Wu0acg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dh49u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 20:20:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so1178751285a.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jan 2026 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769286047; x=1769890847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2yYpxtKqPktlJWPHN0dsbO8FH8x+ZVgQuXzvQSS3eU=;
        b=MMjg5hzCEdwtB99j7xi5cft3g/B/j8yBZTyCh+sWu4mkgoJiQvHbRMTj3vg1B0DqwL
         bRKmUlu0xPrUuS3t7myrQh5QKBvECO8BB/MPOaweUaqspLphZQtPSIoljra1RM5LQlXh
         rGdzhxIRNRqIWckVLjGYLd/JVjMSOBXjv4/zGsl4wnJFSHDMkg5bW5HmUWso4BHmCVRw
         wynKqPnqP517WVze2Wn+olKRvQP7PjsFqAirsRIoFdT3aWR1KL7bO5DPdnr0xb0K8wg1
         LEzlfcBTgZ91CYDkC9Q3oCKdJLtcCC9+KTXQyj7w0i26+bThbOoOK1Du22F1jKKBbTdJ
         Ab7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769286047; x=1769890847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2yYpxtKqPktlJWPHN0dsbO8FH8x+ZVgQuXzvQSS3eU=;
        b=DlvD3CctWS7TR5rOG1yk0KEbK32zCgmx0YiNaQuTiKjkiiLSVYxnXza55/CHTc6lSa
         m9TRphQP1Wow+eOqzYqHCv1illu6YRB/tdDhuVL1y2TiyLeZoSN3NgFLEr2xkad9ivid
         6o9ja3YW1fPHUNzWsc+wauQvWFS+a3OWbi64ho0DEwepwybHe5sRmj/lLq6snYF9tLaP
         EF3Tk6EoNjecSXmzEejTGDFabvxZezzTOKCBuz/vEnveONl2ld9TdgTlRHEWHndntd4I
         ss6PSBvMdvqWlE9eqiA+801nPoPNUxEQsfSeNof1AlsUq6oRuUmU6OtBCp7RYU2Yv6S9
         l81A==
X-Forwarded-Encrypted: i=1; AJvYcCXAyi5JYzarNgqcH0y80oCoSjBnFWMKvDAH8ZDP9Js0itOG3FWUScWAEn87MYiXbkVPDjSnCZ68rDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1nmP/UkRTv4DDOlADY9P6EmdxL7k9iHKdeH+0otrkaEMVEc4L
	hGLoGa6+IzTvBTCUI1zN1JT6BBVaJV0vSLXt1JlPjMe1OqDdfvu/8oLtonKKLqD2nCxy27ZmCTJ
	AqenEivHgO8l3bYPNPcYQZ8h3CmowN1YJbWtuBAWDTp7KfMv650v/fcxo3ZrQ+lQ=
X-Gm-Gg: AZuq6aKqS+gRrQ5IgXZBCT1gRMhyqYjeAye/KDIJoYeD4aQHi7M6ptqZ5boWqShSqej
	u0aR0yDsA3ypXKqCw/mzsasDV6/vcpCDynS0cqN8ISpaari+IpVfjVBnHn6zTVW2KBcRuILNL5i
	2QAtPB9yIfVECOcF2t4d4bshRBk3RRd+szujngJrkZAww4CoEYJqf4wtZpgr0gFt9WfaCZhdtk4
	EAziSacZfCBoh9cUXCDCdVZozCakoti3DTCbmSPswTKlreBKleUGqZyBOZhNb8Xwe8Pqp+Vpuys
	5z910Kdk5Qp5h+Uo9ATS6kJii0eJEgbOo/BuQIKVHeybdvU+bvu62pWFgdQoZ0rUKmRrTv4LHLj
	DrfhoKefBGgiQlz8IKERZkNF1td0vMTlP0bOxnUmLrVYZONLJDo6guOjIGJ1YyuA5fxCA16mSnC
	J1h2qSP6ociIDmtaGlN8S4wV8=
X-Received: by 2002:a05:620a:28ce:b0:8c6:ac96:f5e5 with SMTP id af79cd13be357-8c6e2e5a599mr712597485a.83.1769286046735;
        Sat, 24 Jan 2026 12:20:46 -0800 (PST)
X-Received: by 2002:a05:620a:28ce:b0:8c6:ac96:f5e5 with SMTP id af79cd13be357-8c6e2e5a599mr712595485a.83.1769286046303;
        Sat, 24 Jan 2026 12:20:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de492d04esm1530905e87.102.2026.01.24.12.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 12:20:44 -0800 (PST)
Date: Sat, 24 Jan 2026 22:20:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: Add video clock controller
 on Glymur SoC
Message-ID: <gxbzaayts6esoje4kwak3iey2pj7wu4focdgd3vmu7qr2qqrld@wlaf5kclbvmv>
References: <20260124-glymur_videocc-v1-0-668f8b9c63be@oss.qualcomm.com>
 <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124-glymur_videocc-v1-1-668f8b9c63be@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2NSBTYWx0ZWRfX+k0l+t85R22v
 6vbKnbwbX8W5bOHKJK5+o9bIjUtELwCNkFZdqdY48qerWvxgrHqty9pQOE35TpNlY3GNldww4Bl
 QDTaAvF7RU3yvfC2q/bn1lQh7yXgp69c8MldKJj63svCgETz+LQi+W1ODDZw1QBxqEgvmj9Gq/Q
 7XkGO3o4euAm1I8ehDadQXmA4/N3rwBVF6FSW1t/2UGbDbCpS0VK8IW4Grt6cjqddKCr2BpbPBG
 Two5/OKz6QXsBDBgtjdi8Jh79zwImryooy7OEKYGpAd2Y71L6WwTUa1q17iLBs1vxhcFwy1+x/n
 2Ouh4EKC0VXHJ2VmDz9QeCVqZon4d8+1zhns6g53aJTx+qZ3kQqcm3WdjBcTSJnoh1MOP6yJ09Q
 IvZAZC+lPWWKjIWQO/BNYToJMon7fWjJ1I5vWAxYFdbQet2Woh69VHc7T9rbRZQFO92Za0c4WLG
 2JyEEMt6KPFCZNO8NGQ==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=6975299f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0zoNdEbV9BZt45G0VZ4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UGpD31YMLx09C-3f_aiEDKHYEUmaSWjI
X-Proofpoint-GUID: UGpD31YMLx09C-3f_aiEDKHYEUmaSWjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240165

On Sat, Jan 24, 2026 at 11:05:02PM +0530, Taniya Das wrote:
> Add compatible string for Glymur video clock controller and the bindings
> for Glymur Qualcomm SoC. Add the clock resets required from the GCC
> clock controller for Video.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,sm8450-videocc.yaml        |  3 ++
>  include/dt-bindings/clock/qcom,glymur-gcc.h        |  1 +
>  include/dt-bindings/clock/qcom,glymur-videocc.h    | 45 ++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,glymur-gcc.h b/include/dt-bindings/clock/qcom,glymur-gcc.h
> index 10c12b8c51c34c5931c34b4437be03aea098ba53..6907653c79927f0ff32c98c75d830b719ce14d51 100644
> --- a/include/dt-bindings/clock/qcom,glymur-gcc.h
> +++ b/include/dt-bindings/clock/qcom,glymur-gcc.h
> @@ -574,5 +574,6 @@
>  #define GCC_VIDEO_AXI0_CLK_ARES					89
>  #define GCC_VIDEO_AXI1_CLK_ARES					90
>  #define GCC_VIDEO_BCR						91
> +#define GCC_VIDEO_AXI0C_CLK_ARES				92

I think this one should be split to a separate patch and paired with the
corresponding driver change.

>  
>  #endif

-- 
With best wishes
Dmitry
