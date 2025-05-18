Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3E14B1E45
	for <linux-clk@vger.kernel.org>; Sun, 18 May 2025 21:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747604844; cv=none; b=Ay31+WBlD2mBPZmQCXlqQITQiv3G4TCyPPrXCUunVrf+rMqAg4Q7ubze6hQY7JhvHU/wv+pAyUPyexMhQWU70HcfWdtQKLhv2TJ8XBSNpP4IZpAWNzYyNU4Obv3zFtoyPE6zi25Sv7kosPYVRKXPH5bSB/cNivB6Ss7pAGMwX5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747604844; c=relaxed/simple;
	bh=8USPPKA8F08m/GfxBs2kIB4QqaZhO5O4rhsWjIsjEFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIuQ+MWhsLiF+Vk3d82MovV35d5agg8VsNkkw8o6Nv14R3m0gAyHc1F7AOw5TR8E9cDx2fWXe5uLv/vU8AEV3FOdRi2tNJ+OJM1CGwoZRjPpdxmrdvWeqDVQWY4l4O6PkJHbEzQgLEkyK5508woQSD9hFasGMTJxy60S6qaiwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EeP0Lyu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EeP0Lyu1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILDCin013180
	for <linux-clk@vger.kernel.org>; Sun, 18 May 2025 21:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6kWR32uQPCPLrbktI7pQ0oTp
	I2aRreLj3nIlYIE/3Vg=; b=EeP0Lyu1TGOr+KqYeKjy8C9h0ohluTsNpAlSQyhz
	82KV9YCHQOVl5CJZLaRU0ie+CoZTQfB4rwBbKZPxKnluLWOfnP60P45upbPR0rxf
	3BPX13eSldQV3FJ8uekUwWsGU9zbZbE6keQLWQqP4T/+8XyhWCk58PBCqrYJIbbN
	/krtPymI0ykugKX0KIAItNsjS0mneNLncmBp6sULvTnkzsoTkWUqe4E9SJvowdw9
	mflmx69nwYodDj7wiAtWh13+osUaiID0m1TlsL1s3qFTtNCaqxGZS427t4kgFmW0
	WzrkbTof3iv5eqzVMUEG2lNeuf0GOf2x/Qxyedsq/Hqfug==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp32fv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 18 May 2025 21:47:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8bdbd9174so84737366d6.0
        for <linux-clk@vger.kernel.org>; Sun, 18 May 2025 14:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747604841; x=1748209641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kWR32uQPCPLrbktI7pQ0oTpI2aRreLj3nIlYIE/3Vg=;
        b=HzY+iHy2UclHgNPqDMlSdOUx8sCwnZskyDOkDd1+NNBnRQz7fgNwdAbFIlowmH3UdE
         DCZEQ478aL0L23x8jCcacmvnJdkcyz3PH8GlhAFKI1ZBbJ3d/roDokRC6/VQqnVcSK46
         Kkz4QPGu+huJW151WaBQYd84Jqv59jzW1qDZQWqFPZC3y3/qxR5PzBwtbyMRD8SJeBtU
         DoqjGGtLce9GmprZVwO2SMv0VY7E4V2uDapX9N1IqBeabAm+M2TV7bpf/ATNB9t37nCt
         IRm0fs0wXRIFqtyTEKqEu/iedzRbP0MizpIfEtaxXmhMvVV2UTvv/A4PpgUde8lpbixS
         sapA==
X-Forwarded-Encrypted: i=1; AJvYcCWHjqk52B6qn6LtDirXGre2mPe/DKiNhTtLlBJ/VPJ1iqipv/ihCe5JBoT8kQ5s4GFut+X4ho0dnDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqcOm/gRwUUNjxyb4sdFTBow0prfxp//bMUNfoNkjxCFWS/0AZ
	+Sgl2Tw80gTNPwToVxmmtmlv4ItmI9rlVeWVpJ8pYPphfZwu6/4Ri35Lm6DMh1M2h4yNBiJAncF
	P2NIwlTZ7PB5j0yIjBFYfdXTfGNxxLiLWh78glo8KEyVzBuREeiuxsfWiAe02vTI=
X-Gm-Gg: ASbGncsTTtOiYXwuk66O9FoamfP7gAWcZCETnxzTWZfWzZoWIdTj7r7ZWjlsPSZqlUi
	SAhI946PLapNrTvw3tAWNOdEVhdXdDMv8C9JYwMsgt7TGeah/MtTFT8VuNHLRY4UrRtoR1u/gJJ
	4GtO5AP2Jq4cztW+UNR9y16XdtQGmtiBl2FGrvcRXK6oYZv4g1P6qTBDaniBY2yAIK9t/t38787
	2raP71XfN27MCFPTEXVv6qZ9+obbQG4QGoKrdjKUU3EUWnW5mpmCnJxUO5xwuPo5kKgFx10L8+A
	hCAnDivdc+YefXStn/2saVOD7+mc1SItE8omQD+CuOMHdRKoD63Efolu7SsNEN1Uo9OAy7IotDM
	=
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f8b2d15075mr197800756d6.34.1747604840750;
        Sun, 18 May 2025 14:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYpLjwtw/2fMf7VCMh10ctMqY3tfAssm+NBI0lXDVy3BdKLAmoBlS3u2kQoxocRghI7rYOCA==
X-Received: by 2002:a05:6214:226e:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f8b2d15075mr197800596d6.34.1747604840406;
        Sun, 18 May 2025 14:47:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca1f2sm15970451fa.29.2025.05.18.14.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:47:19 -0700 (PDT)
Date: Mon, 19 May 2025 00:47:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] clk: qcom: rpmh: make clkaN optional
Message-ID: <x67lmvo3mx66h22vza4tisxtbjlwhtiwkduwasucnrfr3exfdc@xuntucwpxnec>
References: <20250518130403.440971-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518130403.440971-1-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=682a556a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=AK1EQsT5Zz8P7VizTGkA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: vx9AQiFw3w8eJQ1lWft9FgcNKzI7ifOG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDIxNSBTYWx0ZWRfXwoYFoklZW+t7
 aTuBy1F8msYKBzB+641UjjiYaH4a+Mh1NwTgsNU6XH7w0FYLJHLJb25EvLZIHeduxSmS7ZZqU+G
 3VEs/FHyQylHIITtpFxg7aw6Wpb22XDhiTPTWpZC+BkkK+3SJ6SgVpIEbtRpG8F2YFJUlCc8Fj5
 fUpmDh5n5wjnch1h8R+bMBwj0oakIJNnoFFTHRDSfzpOH2k/OM5BszsOb+Y0dq0tbM+ylMhpjZL
 dakSuBvundamlt6O6KClyUxiHX4tB5H3r3+7jeo9Q+Wddf52ll68TCc3DHCDgzKHYBX1tzyQlAq
 aSEvIxDZ4euwNfukX3nENSKA8O7b/aCMg6gFkfKZcDfnL8Tn/aF5P2vYEpaLB1/lorjJKYNyVGk
 +6BexuiAy2LpelCMTwH4Zn90to8r0FjY14KEOqhAxMjTDG38t8chnrbE+R5t+Jz2b4B1JuRb
X-Proofpoint-GUID: vx9AQiFw3w8eJQ1lWft9FgcNKzI7ifOG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_11,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=686 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180215

On Sun, May 18, 2025 at 09:04:03PM +0800, Pengyu Luo wrote:
> On SM8650, clkaN are missing in cmd-db for some specific devices. This
> caused a boot failure. Printing log during initramfs phase, I found
> 
> [    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1
> 
> Adding the optional property to avoid probing failure which causes
> countless deferred probe. In the downstream tree,similar workarounds
> are introduced for SM7635, SM8550, SM8635, SM8650, SM8750.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> Changes in v2:
> - using capital letters, sm[0-9]+ => SM[0-9]+, rpmh => RPMh (Dmitry)
> - correct typo, alform => plaform (Dmitry)
> - remove tested-by tag from myself (Dmitry)
> - line break to keep 80 characters per line (Dmitry)
> - Link to v1: https://lore.kernel.org/all/20250404072003.515796-1-mitltlatltl@gmail.com
> ---
>  drivers/clk/qcom/clk-rpmh.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
