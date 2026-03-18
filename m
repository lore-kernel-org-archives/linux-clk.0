Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319D63D9026
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841726; cv=none; b=tfhLehpa0bE6TBmBtNc/i+lOWfvjf09tIdEM4h6+VSeyJ9D8m/U+UBkp+iPOuk8+G9huXvUPMYuN7Wjjxs8xPcrGUvT+xGjhuQ102fwrxaH9CBIvoJwkZJhjhBNQ3rAT4lPkCehebL5bvFNDruYpl17c0ESU7vKJ18UUgNbzpmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841726; c=relaxed/simple;
	bh=yMu4evfh+4WOpCdg8VroW2eFoeg8fQ8uW3UTqffG/Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXSJpN8ZoLhrz8+uqCC9eL5LscWtVEYINfi7lGVYezKBkh2EyLezwSlpUfnMG5gsxOtAQsHOF6dmMPUjMEUkZu3yZWl3JM9INmJuiolH7/n72LS1OhiY9HwZRajKZvhhp0MogqwOHTMzplyU0bV/67Xe/VKhOnLKzVaAm0vIWQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBByCaYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dz5TPsJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBByCaYN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dz5TPsJE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IDA9lL2612890
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4obHx+u6g9OIVr0W69Wxv02v
	/gbopfLolpa7DVkHWQA=; b=HBByCaYNLq2865gIvru4VJjWIJhjEmPeRFhpRIqZ
	7R2qcqEgpEb1oQOtNQ4jMsGe3jb9cfwJKUCK7CHB53dbsD93l2hIw08dAwbLStMO
	MDwYr8jryl2QxO7B7hVxWPe901xVoXUHQQa5xK1O33STPzxIFW342YRhdl3EIamC
	SwTkko9sdmfVSXfmORfPToOEd1ryQWSXym3MMYKNka7abHVDgydx3prlqTVHjJqD
	AjF40NRWhGPGbTaVczkHqZ/e5r8rjx0cy+FLmOZbZF8A6XDTrHTLkXiSFVsrcNrn
	P32NNuh1WA80mjGO4+HGnN2KFpkjHX7864Zz1MVCD+PJbA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdsjvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:48:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5090cc6a7d2so95478341cf.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773841723; x=1774446523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
        b=dz5TPsJEUnHw40tFztffLThY2eRJ4JF8R0jJPrFAlnHV7XdMZbdql3uJSnZ7aPcKUU
         YuQsSp7/rewSELfWy+aKTcDeqCBLWzJnVVGXWyIHSGEXkQ9gjvbtf884EZmIwY9SSNzX
         Qgg3pYYJJSydhg1FWdoehzWRU8eB91OmfLKwCQwdn4IQv5V1OHKOPo//mnxqc/4Kf3QD
         O3K1cPRpfKEYiVMZH4EaCrSmFijaNZrdRpJS/7YQ0B8jWpRKYNXh6SrpdvDpjMZCx5DG
         T4rX0l7ecrEVL4L87YeRrotCB9/pxYcPaflYP5UCFIj4KCyOEOGcBx2nbE0bbyNULXcQ
         rIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841723; x=1774446523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4obHx+u6g9OIVr0W69Wxv02v/gbopfLolpa7DVkHWQA=;
        b=jItQEZQmTN0UMolKmGv+XBtgLP7/mbTmwZzkql0QScdKSwgj2DgB9/+hNE152viDaf
         1VSdcSRg4MM43QbylYOfaYcEVXzXW2JoaGgdeZwZ2Gp5KvuZcQzkOxLfEadsPB0KWfbk
         +ALz1AJLiswDn1RI+hll42TcwKUhL3uNlpqR7vkLkjVrYPJMj+y8QyyBNYYHkloe072y
         bW3nDz6aY2bZ23Ta5391HWydQQrCDPdK+omP9T0W/NSGEb8tMXXv52KYCbvXNvawY4P3
         N6FxtrsUyCOR6ubNKxnTJ1jiCVYvFO6F/x5jSvmu4p/097uZr7MgDw4iLw6z+Uk4zbsq
         YSEw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Kvsn5Jty4y1OWZrt+cZPhgyOYYmZl7Bn2h+1nZkF91DNJZi9DrYyOU4+qdCBH7ymtpve8bIjdck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvNO3vuekTqHIT8dJlB4FE0QEi8dThYksEm63uE1NBFczt8Afx
	4xxZqzHKpb6Gi2eXQhq2V/a6XmeAGkzUna0YK1e/vlekj+v41HMKv/DkOtDVWkuzQ+LpDp91b6c
	HBwzQCAbAR0150gdnNdAbDyTmlC7MAKvAM1D4sU03UqiEYZnHy9QDlzHTDwUz/2M=
X-Gm-Gg: ATEYQzwGhUhYmkPyxyu0XfDwpjFJixWl/d4qMmgsRqRNu6HOlKakx51PCgVatkr9WS0
	vKcMGOgfl/58E7gGIocjbPJtUBYuasDMBHY+iWfmbIxoOy9DuCTz04bI4K9DTYMgEpymVJu0849
	i+Jk1McFgMoC/MNDxkIg+5an6neO/xCH3XVwWdZWtxukz5fXnVTIVyloLyZyqmzf31sNuvOfj3q
	TpJr3igyxUiWCM1KaZGjUaEgUfT3rtnng+sbGlr9dS86CXrXiDfHMGckGbLvwKUBgfN1H5i1qh1
	69Hazp/PZKmSgNOQq0pOuD9WY5sZVcWxGw2mnS6dJkkfSpHHf/U1rYrK43zpFwWwUb+H3Xvu6o1
	iclewBXlNxR964kqbq6+AXj3iuYMJq1revvzd3gkp6ZsRCs4//Zkz8DK6ed1hmEKEIhk7ypuR8q
	G61tq5/onUM1Qi+5DXNwGNNT3k8fEGd8j069E=
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id d75a77b69052e-50b14880cb0mr44388421cf.47.1773841723390;
        Wed, 18 Mar 2026 06:48:43 -0700 (PDT)
X-Received: by 2002:a05:622a:44d:b0:509:20de:4acc with SMTP id d75a77b69052e-50b14880cb0mr44387921cf.47.1773841722849;
        Wed, 18 Mar 2026 06:48:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd5156e74sm6353381fa.7.2026.03.18.06.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 06:48:41 -0700 (PDT)
Date: Wed, 18 Mar 2026 15:48:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: qcom: Cleanup redundant header includes
Message-ID: <7u2esescnuncs5rvzpjnggxhwizbodwcmhcyw635bgelg6xpsx@n4m5vtwuwuwl>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExNyBTYWx0ZWRfX4wJydRmZKnTG
 c8l0KKgnP34tpMAxn/njX5jOX1+CkdiiZK+OFvE3+H6VKI8i7qOjNyWduPjJkuHxctbr7VAW8LX
 O0P+Ei+0ns1WNZQYpxPcx1CBCHBWLjyViqt57uamuCjl3iB8+5gudv8ITe9nKS+egXTGbCkzPXv
 6hzm4tECk4t7Hu04QuqhbfGD2nuFlTSpssOOqIoOjejwB04LdpfG0QdOEl2ngbs2zaIip74rgcV
 whtfVF3OL9JPZ2GQSI39rrXJi7LUeBGf077ppRuzj6e/MRSV9u4ESqwxXgC4I8nBbOQPMv5NKpL
 mK6X145ZbrpDVex1PbQQMwe2MDsAU7xio7aN6ZVY4UqbL9TsIK4p+vqvpvZnCHoL463egbqHkJF
 LPHjFmTp37vvxfOUQM58YgjU5IX7Ztov1R60dQZuynNQzCGLpvyFQPHNZXp3FXcDFj286euoOcu
 NGDRnMD9u+Zdc30TKvw==
X-Proofpoint-ORIG-GUID: eifEfZUu74xHSy118f47wbCxVyv3bd8X
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69baad3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=aywfhrhUYFgYpfM73PUA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: eifEfZUu74xHSy118f47wbCxVyv3bd8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180117

On Wed, Mar 18, 2026 at 12:08:39PM +0100, Krzysztof Kozlowski wrote:
> Newly introduced drivers keep repeating same patterns from clock
> generation scripts...
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (5):
>       clk: qcom: kaanapali: Cleanup redundant header includes
>       clk: qcom: glymur: Cleanup redundant header includes
>       clk: qcom: sm8750: Cleanup redundant header includes
>       clk: qcom: milos: Cleanup redundant header includes
>       clk: qcom: eliza: Cleanup redundant header includes
> 

For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
