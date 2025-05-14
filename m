Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E050296704
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257804; cv=none; b=WNW94UsTMVvRiDTABKKIBLQhsfQfOBTHoEUBaRCmVCDmq+OqK4xTWSyKmX9NimXnizb5DrTRnYsDcowe+Pi+X4VrZW6nUtEcm+do7KJ0Jhs3aD6xPaScm/HNWs5iK0yDpDXzxUbo/h2KMbiLcFRU6gvsrj6Lqth8ccDOF996iwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257804; c=relaxed/simple;
	bh=EyFHYmawDsHmKWz0s03ImTnfgsZtZdH/tEJm1DPqlrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYbe2nUOOf52fDvn4hhUU5/Tgm9ylnr/ZXjVvPxUQinoNw+u0qMn5eEFAXtk4Y8cxQ9czAhq52erDIPFDOHLDfyoWHao7VDVTVLs0TZY7ficwbpYRMoYutw01nXjG4rDI+i2Q5mH80wHWiXWijSnnKSJ3cvqzVDZsIyblr0dmjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLAB6yeN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLAB6yeN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJWs4T025453
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mj/Qz1xUZrhHvcNTBOii7qww
	2wIfBNbFUlMQ73vGEn0=; b=lLAB6yeN31GjnivygSuhKjuA7cozJw2fT8ch/M5j
	KprWIGx+InHADt0gskFhP4MKJp6xhi36Dv+6SSquYpnZTVcAIrVbOtRXtdkLLike
	0GvC+KG7OsVNEhJkbownjuuKjUQ5QBjdLpHghcCjEimZDnDUFnPQnN0FHIXhm4sv
	etfIkUB9eYQwo1vwWflE5t0B4Gl9X5C9wD0yAa3h3+gLXVQLWFJPThrQJEaRo/ls
	QQX5+iCqbcdHi8ao1xVulzAfWqTYpd/KyaZLPdKV2wb8HFnvdfRKaoqMz2WNQvQH
	UzsWGK5q0wXcFNh6bbV5T6+SbaEw3aTOcvooVQTSRLmo+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew42ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 21:23:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so37781685a.3
        for <linux-clk@vger.kernel.org>; Wed, 14 May 2025 14:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257801; x=1747862601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mj/Qz1xUZrhHvcNTBOii7qww2wIfBNbFUlMQ73vGEn0=;
        b=B78SSC9xfdBty6NmXheQ3HekpbgHVHxrM3p4wlrHDPCN+TqREnwTabmh5nWrJ1m6iu
         OE0oUT4lrIzFuxXIG55YAldzVzjH8yWdqeWo1u1M20Ptq4AkY2B0LiECa9qRtTXnmxty
         kJB3FlRmIDRTNns2ZcGXTbT8cXURXHGkH06gZ7YyDtY4U5nckV6h3PJ6KUYKB2RjDrZv
         CJDyTqzYJq1BHrBixIN22nM5ifjO08a5FeXvHNyVFODfjocH68qaq7d6/HDCwqd5iqn3
         9rIqDdJBl6Bb7//XTI15t+8F7Xhcl3oM5h+jo5zYiEQKw4lcTjA2o83qMr1dbky9yL8G
         lMzw==
X-Forwarded-Encrypted: i=1; AJvYcCXKJsgW6ExDRkkuYKqAT0059bc1t6o2o0jysSe7/Xu7RlQj7gd6ChgKhB6V3TlkFEu1+Sz+f8pvBbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN6fNM1SHTNYJch645fBH0gNQVsqO3PofvzHlqx4GFgllEf4Nd
	AnNl6+eNcPTv0jUng0fsm4IVQxPkFjxe5ct2T0bLUhuK6PvUyI1ZNtgcM5T2iMwhmhNSi3ezCZt
	R4SLFAWdXGuRw6a2yl1Mbo4/+m+SOQUkpux/aRCDX4uD9xgU9zOR+7Q5lbps=
X-Gm-Gg: ASbGncvZkatkmif8jqTnb2UOIs01VjmViDEi0T1g1+qh88wZLXlsFJhTwFoJmp2WZgl
	6bUnTN9s2nBQHtamjU22lTEAWKkMcQAuyFQ8c1AQT6/Vrj0vU9goh0HIDZQw3IrKfpY4a/6ym2Q
	PVp3caDDnmiY89FaYAiJonNn5JBsbvUa6tg2PZrM/SBp+D3ExPj8PgzkPUN2BSQihFVYdLNO2yQ
	BDx4lCDX6UXJnB89tB8T9QeSnkmZJLiEkwbyd1x3ds1G2d3+lhaqTUe9TjVT9yVvQyQQ2ozvHlm
	qA8I94YFWT/xyanYXBzTUXtIFgGWH5wQknK88HMx2ovhEcCHMRhAqOYwI2H8uhSo6jO7jNsVoxA
	=
X-Received: by 2002:a05:620a:1a0a:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7cd287e10ccmr787437185a.13.1747257800868;
        Wed, 14 May 2025 14:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmG7Ith2nDW7+gN5BCXeJ40qkWZAYm0kLVgIJGyOikn/H+ldKhixf9JhMX4xvT40wy57vdvg==
X-Received: by 2002:a05:620a:1a0a:b0:7c5:aec7:7ecc with SMTP id af79cd13be357-7cd287e10ccmr787433785a.13.1747257800520;
        Wed, 14 May 2025 14:23:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550d8aa7039sm314977e87.43.2025.05.14.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:19 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 16/18] arm64: dts: qcom: sm8450: Additionally manage
 MXC power domain in camcc
Message-ID: <5zbpbn3f5snf5dbsbp3vfbahnjtreoqdalg2n6ddqxfocnjtpw@6khojzihn2mn>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-16-571c63297d01@quicinc.com>
X-Proofpoint-GUID: qSGYqQvkFkGQLfL-zCC93FY5GebMrDao
X-Proofpoint-ORIG-GUID: qSGYqQvkFkGQLfL-zCC93FY5GebMrDao
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfXxLk/MAEFllLh
 /ywfjaxi+g9fsKyIujlZ3r6qUctPymFjYAlIWclV81vmkab3wEJERkB3+1jihUj2h2GW/26wfRN
 xnb472rv+Sfegb3qjetyYta4r1AiPoipz560Ld5MT4mWBmz/LM68K1PLgDIMkIaj04m1l/AI/ed
 sJa6rzhJrvlO7KK8y/LCTh/neMkM5n0juVwk9rzdD2xsIBN8nTLcQMsoHiFGbZBy+nlgZWC7K3k
 EWyP8B+k7ocjkyAKj31tkOQ+ePGAt1zCL0SZXxL0VmtQa9h/POif6nmKlTbMLoGgO9sn+IlIaBI
 t9T9RBtvQX0ClixAd1DJ/57CUbqqrmMH4NsVgEn/TO1JYaXijbCC/KgbmqW3wCtE1EKrtq0I2IX
 axD+n58Gznuq+J7eQHyXA2FeB1uAUv27EbcbA909r1U9ssnVKKn93QrCrbMscfW8QdOpM8eq
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=682509c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9_CkSsT5FSWxdIVEpLUA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=622 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:01AM +0530, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8450 platform. Hence add MXC power domain to
> camcc node on SM8450.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
