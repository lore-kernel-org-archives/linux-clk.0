Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3DA36D510
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 16:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771345395; cv=none; b=oLakOur3EoDko1Yf8lL0Nv4SkJZHjuReilhwPvP8yygqGZBlzjwgTWlaJ6xdZfVR/OCAbkQrMRWKJzt1Cy8Tp0Z4deUWlS3Hz0F6Dgz/Llf0weHg9urp0ss5boe0cA7NyLAvLiT410CYTpnSAOi1oVxqDebFZUpkXHWH46ZPlCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771345395; c=relaxed/simple;
	bh=huPv1Rq82ylXN0CnKmdOpk+HRnSzxJ99NW1Era5l7sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKkmk8GHvvEn6FSxrtGc9VJbFqgkFSWbS3VgiLmkkKXRMvPQFjhcPJ26Eg/5hCJ0dRdxjtr1jFeunps1GD7CC5bfLouHlIDCPIwtwqmrSCw7eeQbM9MKSiwknSEw4DcHAVlIcvZO90d/WU61C1xji4XTvhuG+nEHdjx8ifpOogM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCNW1L6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b98GKMQ2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCNW1L6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b98GKMQ2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HDxRSh2111894
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 16:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+8icpgoWecUC2cZa/Z4FLKT
	WEtQIY9I7RrykM8WNkc=; b=ZCNW1L6ZwI+JqjXAx9yq8205HD/tBwWorsrrKWJy
	8tw9/HKp1dqwufsf0zjCnOJ5nqXom2blR1+n2rKG1NMPjk6KQ33f7qxJhztaNVh9
	63PZ7DGT+Z15JpqSQm7fKVceA19Cd0mtjXdFShJ6BbIHQeahvpkI9y1TDmuZUfox
	LSzLe1iJbu2KVhaCKkydqF5//g6Iaf3mpr4h4PrK4KTqjHLM77st+Cmj65H9Dkp/
	KG50JYVEXwSV5B7SDpLAlX6K7BgHwk1S9sCYERLHIhQFdRrsg3ebNSjbin7P4hBO
	jTqVjoTwS9Xk/oB5i0cHbiQAPSrnlsDsrbInqShSYiU0ZA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4hrw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 16:23:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so3604526885a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 08:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771345393; x=1771950193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+8icpgoWecUC2cZa/Z4FLKTWEtQIY9I7RrykM8WNkc=;
        b=b98GKMQ2iJ4O7fz691rKSqOdLMIedlbyLL161SC2yZWeEgzJntbUBboEdBxWIVt4lN
         DJzToKBHJ8XwLUGsHwxV0YR2NCjsNB9gcgg27oxKRegqci9JHsQSgnH9Rpq4BlxGjE+c
         MUkLU0efW674PFW29nkAVPuKaSfZYG+gbMrxnvvQi3k9R+fmuubQBpuBMwfBthrF0mCl
         GEWsgsmwnCHBytQY6bQz4X5WdfztcA2sI4J2TRdTn8Ddr4+3CQ3CfLA2fouTYQiBtpkX
         GA5XIZ9jxENQGpYVxA3GyHQ8FfRENwJq4oGeKI7InrhSJzMWTEC4CpgggwIUPFw6GkgD
         LjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345393; x=1771950193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+8icpgoWecUC2cZa/Z4FLKTWEtQIY9I7RrykM8WNkc=;
        b=MrOLurE5dcZj6GzJ0yUfKLuUv/krjnUP4h6HbZCPl2fL7Yt/0p+dFTjp/HQH1z0+FW
         Jtu2KG3/z3S6LCRdMw7p0y29v3d6tKS6+R7TKnByK63G8KpWLS63QLnZKQDgNgzAIACG
         BF5zTrrZ+SPUU+WLou+iRmRFww2D0JRi+uwNKs6TAJIwxAOCVQrnlza8ePc//gYLWarz
         wePN9lPlLRAqqf5dwi0RBfz41fn91nymQDs4XwT7WlJVy0asyOqEAV4uyak7o4XOgmhU
         grGLAk6qA+njLbd782sRTBlReZ9W+mHlLaETViVYYSGqmHrJ2mTGUYCoovqzi2fhTm/M
         /hsg==
X-Forwarded-Encrypted: i=1; AJvYcCXTS9hcMdk+tLBKarKTRlsUggjIhy2lHVzBAlP18O3fEEYsFadIQ/GpwAC5nEh7LXHHwPDMWJgxuVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOyf4R3hD8CouC7/TAs0iM2Qlbuqag9XJ643DBtx3YZjbs+DT3
	R0ge2AMtVbhFhaGzDGEgGqxBZfbHFy1OKO4c7ozJzJkreowNguVeIwnNYCgD/8NsF7EmhxQckDC
	vvGU0zln94QM851kzjkw44VjJ/KCxmTPSkWU/SVB2ZfNWlPAyL7StOp6XcqNa5s8=
X-Gm-Gg: AZuq6aK406W/iCTKVWpC6uOWJBHX1B7GLVKf0YhyLskJz/VaFuEUTwzIF++EwTCfuwP
	sp2M1TiAKAZUjLNpuXE7OqNRyI1x+T75p8MaHVojvRlDV/QbLf6Lx5W2hpDRohX5/6mc3IbHSKA
	89olu9sKO8fpy2GLdc7kTLm04/eequMomDlaNVl18uExFZyHQgNNEdrbYRUJegkOQz8iYDYzjV2
	C397st0D31JQUu5Rawe1erq2hDUGnueTWJBW90oElg7T83sdUmVHyZGR2nCtb8zdsOaNzabY226
	uuQ/+/3svSTsIpJfbLtZ6V78wjocLSg6D70zk71ygr/fJBV2NqXi5eINu6fgL4xQ7B/PWooAJrC
	d3FHe+1dkmUoB0okWSt7E1Rqn1nDRCFAE6MmEHSXH/ZE2sAjV+P2xo6JyrpwmGJ57f94EpS+TZS
	epIt5qFpzuUz/PaQTLAXBIKZ4Ya8NikCe9ryk=
X-Received: by 2002:a05:620a:1a04:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb4c041a5amr1410692685a.86.1771345392899;
        Tue, 17 Feb 2026 08:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb4c041a5amr1410686585a.86.1771345392251;
        Tue, 17 Feb 2026 08:23:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5636b3sm3847209e87.14.2026.02.17.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 08:23:11 -0800 (PST)
Date: Tue, 17 Feb 2026 18:23:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: De-acronymize Glymur SoC name
Message-ID: <jfzhybhuh5doxxiymznhizrsqft2ywrtfcpuilmsz7gumsh7h3@o5ocoxq2qkpd>
References: <20260217130047.281813-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217130047.281813-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=699495f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=Rh8BIR2qzSpX2dRZ-WwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEzMyBTYWx0ZWRfX7JBxg24Xbluz
 Xir5akEGU8l3h/GvkgbTInjBeWuDL26TNpdNLzLGJcjl6XWnpxDdjuAbuN91osxqiK9WYXksvXT
 iQezHhXbX99ORHdAnanUBq0q99ZSUbqgLcWwAt4DmW/6RTsDWWfCI1X5/RV2jNxnTCH5XGCtTRh
 sIRmFbi6NIVywKhNZbMvZlTj+LJwQ1k2tIoDoebMyE/DoKqRS4tfGfGFGu8Nai/l7LTMMkZAH3j
 SWmj/hrpfuZgvMM31nF6kfJu3SNuvIjpXncGs/ACMQJhh0af59xk429PGEG3iKkwnlKVhB+q8nT
 WTOP9jeiL0HPhp+41JWyZZ5sTyZH+Es1o99RmEIjF5ak7P+2HT+oPtWxj/Xwaa3gcAqWREZZP5z
 Tz0BqVGGKVXgvlecz1nEFWzopauyNs1cXOSvWHMFPGvSBxvNvFL9s69g2N8ZWCQ5e1R27+Q+Z/L
 mZI+v7ynOGRrOVQmgag==
X-Proofpoint-GUID: 0x0miXmQytdjo1NJgz9-oGnwmhz2T069
X-Proofpoint-ORIG-GUID: 0x0miXmQytdjo1NJgz9-oGnwmhz2T069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170133

On Tue, Feb 17, 2026 at 02:00:49PM +0100, Krzysztof Kozlowski wrote:
> Glymur is a codename of Qualcomm SoC, not an acronym.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         | 12 ++++++------
>  drivers/clk/qcom/dispcc-glymur.c |  2 +-
>  drivers/clk/qcom/gcc-glymur.c    |  2 +-
>  drivers/clk/qcom/tcsrcc-glymur.c |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
