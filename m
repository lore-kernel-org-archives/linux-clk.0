Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D7B263F3C
	for <linux-clk@vger.kernel.org>; Wed, 21 May 2025 12:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831614; cv=none; b=fmnF8lqZQu0NqUCk2JdijMavOU5g3l/VhBtgFjot7QBpxFw3/SDmLJ8i2BH4bq/K8io0fIBXnxzsxkr5sf4tMlybZHNhotM5St+3pdcsK10wWYJ5cFXYzbNadVap4k4dZTCF7cM3o0XlXc2OowH7nFl6nQOqoLwtKpqaL8jV2ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831614; c=relaxed/simple;
	bh=Xqeu1aJ9MItEqCaHvO4dZVDW/+gda4kJKzaek2qb/UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljHPNAe7lNWw5fBKyC9COYlWPPggwVtPFSbGzytcjEuxAXRCzZ9qY0pSq0HUl8sAEXBE2Kjnav3B4m29bsHGRR0CGGf3VmNPMKLQI2kuCXBeY5gjwVqxYAWGqQwmr9AxN3SHUrdvo6zNtWdfKso3H6ZmWfy+BzF5qqWb42fPp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pFdTEngw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pFdTEngw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XRmZ029654
	for <linux-clk@vger.kernel.org>; Wed, 21 May 2025 12:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sDTfHXY5P0IUFKShT7L/9f91
	7VhrL5k2KweIDi5wmfs=; b=pFdTEngwWRO0CNSUUa02wThitfFtqjr336BgyA80
	CTQ9jIeELHzB2Vjs4HosseT/LLzKbQ8EXjrr+IU0cZepeiYK51O+IginuP7ffyU+
	jTWkC7yv1E27pZxpHYWNxy6Etoa1mnHoknH7m6VFIT2IzFkn4Itjqg5BekNhz6Jh
	bhwxiZCjpUZldll7dOmJMZ2bTs+pCb6s8vP+JY9Sdfbr3TPOxWD2kNNWDzrHg9ts
	QXrQd0ZL7B/SDWKRtcAGwRafT8aSa6LHK7iKijXh3z3UGz2q+c/eCmiy+jNwH8cB
	M9HPqXCeFJBQbxv7XQAgRwqP7RFZIAYz860dKnJpCrfVvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf430c7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 May 2025 12:46:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8dd95985dso69669566d6.0
        for <linux-clk@vger.kernel.org>; Wed, 21 May 2025 05:46:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831610; x=1748436410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDTfHXY5P0IUFKShT7L/9f917VhrL5k2KweIDi5wmfs=;
        b=N+KTRedcPw2Vv2jxlWmFahzkFgoSZ9qcri+0HY1OmtFsubvOOEX2drLrmZtKh0WN6H
         ZZmcsK4nSV2gZMqkocEOJHKlfcybnfG0FbDHiE4+3qr5Pjo2Wa3U+tE4l/eSjRSfjrhO
         DSD0chwHzmN/35thpzZcw2yi4N55lru6JgqHjqgcvFTZ9oEuQAJCIaMmJStSmlVHg6qq
         dA5r4oudoz6w/ETmqL6qRIOED75mhuj8vOieORy2VmR+BE3xjFv7sbVZut8ik+7oPXoJ
         q/1HIu/Vu06HAboY2Orgn5kaF6hUkQ91HAI+zfc6tJHpmRTnoMR0byXGzhy+mxLCeJh2
         R8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXdOsVBYqdAgDsGhbg2CXa79BmZAFQyyROvXpf2JGL/4lrBubz0xgEWn1bB3U/uIiVN9zSoRfSIbZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56mjHrO8JU4lFvAS/cOkrU+xVlBKDiKbWUdU/eRPrDZHdAtaW
	mHXqJxEyrb1m4Wt/3UfxtDRQztr8BgpDBfD9NnpoGW5Aw1vIx91fLttkMpoYw7oGAJEPzTtWyS2
	I+ljrJEJ+XxN8t7L2X4iS4T7/wtHpkGg7mSspWSsakRmAUvKNb0osGevwc3psjOA=
X-Gm-Gg: ASbGncuHQslHVOZvtGMoC2MHo8ZJ+XfP2mmLF0JF6ZiQDwqoO5uw8lF7ixRVyH0qGEl
	8XG8lvW68woJ/NWj3GskGGxJcmYuN3YWCRLQz2DAitb+bJEcQPi7niWv7ydglVp+UggQ2v2e93R
	gPRkY+gRvAlJZw9wwCjLy8a2rBx0vzzULp7viQ9z10QZMOkbKTmirMuw25++lEftYYvwJ+I8Ixn
	P9h/5bGel7GPi2G1yppCj4fH/QlXycswSCp/Ec83kuqE7ZKLLo82BJ/ABGWxs92VB91bHq+LPDg
	OPUuI3iFwvCu2Jr81o6cdFD0nAtxXHNSb2vDBSXjzFSkniz+9uBEOEaS+7k/qByRXzEUoZy8Pf4
	=
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f8b2d44cb2mr310211956d6.45.1747831610322;
        Wed, 21 May 2025 05:46:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKrrceDDu+GLUk9ALbLga29Hnv6Ac2h9d892IylQS5MNstSZj4gPJnCFx3NnyAWf0EeS1rWw==
X-Received: by 2002:a05:6214:2403:b0:6f6:33aa:258b with SMTP id 6a1803df08f44-6f8b2d44cb2mr310211526d6.45.1747831609859;
        Wed, 21 May 2025 05:46:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm2798700e87.214.2025.05.21.05.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 05:46:48 -0700 (PDT)
Date: Wed, 21 May 2025 15:46:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 02/18] dt-bindings: clock: qcom: Update sc8280xp camcc
 bindings
Message-ID: <the3rt4gwb766u5tmzzugoozkyt3qw7kxvy6mlemxcqb5ibs37@szcq2rzbukma>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-2-571c63297d01@quicinc.com>
 <20250519-barnacle-of-beautiful-enthusiasm-4e6af0@kuoka>
 <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec4ee2f5-162b-430d-aeb9-90ad4559707b@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyMiBTYWx0ZWRfX3kyiKiFgeYaw
 T3DP8CNub2V6KkLWoHblXGjqzvt9l3Vwt2WQxImjmBmVoJ7Usp2m+HGdMvHDQ8c6pFf+Uji5aEy
 9dKPEiy6u3LUmZqiYTSXCAOSbb5Fg87crIJZc+dvsNQ4UqLIPRrIFz3jv+JoXqcmzBX6cpfoSGN
 lDEdbyGHrPVyrjV6x8WkvndE0RYNDBuD/NYZBlk0gVQLbkFWHsDxOdUAhtRd76sxFIornRRtp+n
 dWv9G08RTQPLuMxPWULeIWBLCVr7eoME2hczxEj6WW9A8d3XKB38917KwkHyxuaj2qLOOw3eFOU
 yZ7AWRNcxBgfVXj2MOi1UU4/0nIMSm1yyCYMR1wQlnLzQPUgddMWQ7gl+28q8z0qqX+27vpTJLU
 8t6FMUJ/5Sw+8iw2IbiqWMxYN4co8iSH74UyqBYXBTdalBMAufGsOJLM0SjhBJ7HihrBiuOO
X-Proofpoint-GUID: RyO3-D66d4ecQFxp3ED4o-5msSqVL0NS
X-Authority-Analysis: v=2.4 cv=Ws8rMcfv c=1 sm=1 tr=0 ts=682dcb3b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=mlDIMNG6S_g-ndTHxx4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: RyO3-D66d4ecQFxp3ED4o-5msSqVL0NS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210122

On Wed, May 21, 2025 at 03:32:34PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 5/19/2025 1:48 PM, Krzysztof Kozlowski wrote:
> > On Thu, May 15, 2025 at 12:38:47AM GMT, Jagadeesh Kona wrote:
> >> SC8280XP camcc only requires the MMCX power domain, unlike
> >> SM8450 camcc which will now support both MMCX and MXC power
> > 
> > I do not see change to sm8450 here. This makes no sense on its own. You
> > do not move compatibles - what is the point of such change?
> >
> 
> I did the SM8450 changes in next patch (3/18). But I agree with you, this needs to
> be more structured. So I am planning to drop this patch and instead take care of
> single power domain requirement for SC8280XP within SM8450 camcc bindings using
> minItems and maxItems properties based on if check for sc8280xp compatible similar
> to below snippet.

I think it is a bad idea. I liked the split that you've implemented:
separate bindings for platforms that require MMCX (and MX), separate
bindings for platforms which require MMCX and MXC (and MXA).

It might be better to start by changing SM8450 binding to support MXC
and then adding SC8280XP to those bindings.

> 
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
>      description:
> -      A phandle and PM domain specifier for the MMCX power domain.
> +      Power domains required for the clock controller to operate
> +    items:
> +      - description: MMCX power domain
> +      - description: MXC power domain
> 
> ......
> 
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-camcc
> +    then:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +        required-opps:
> +          maxItems: 1
> +
> 
> 
> >> domains. Hence move SC8280XP camcc bindings from SM8450 to
> >> SA8775P camcc.
> > 
> > Subject: everything could be an update. Be specific.
> > 
> > A nit, subject: drop second/last, redundant "bindings". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> 
> Sure, I will take care of above in next series.
> 
> Thanks,
> Jagadeesh
> 
> >>
> >> SA8775P camcc doesn't support required-opps property currently
> >> but SC8280XP camcc need that property,  so add required-opps
> >> based on SC8280XP camcc conditional check in SA8775P camcc
> >> bindings.
> > 
> > Best regards,
> > Krzysztof
> > 

-- 
With best wishes
Dmitry
