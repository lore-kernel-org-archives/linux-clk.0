Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938223C7690
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780054301; cv=none; b=H6sXpkdzvWush2INBeNU37M57ZV7mZojwBRKFIVCC31PUkQ/IRI0ezCSjZa5y3/V/zhNPSpLTWBeaNkrgYbLEIr7xdLAHKMRKbOy485uH+MBr8BBtmsiZGxzeYBAxbE0JvQrFpFT2WKw5qOZvYKUkPzqVWIzpGVvoqioFyKrwOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780054301; c=relaxed/simple;
	bh=jDAFGjiCfLrCl0hVy9nsbFdGMPZCs5ChqYR26a4YPcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nykze9e3STbanH+Kh9wI/OjBEB2U92ji73YXCES7SLlgehLIMcIU+4i4ZiSb6jx0hJ4U5ppLWzRyRH3A1befkDTK8KsdW/XDC9xd24wsohssu50kWeysZNI5vwxwSuigQh9VghR9YcgbTqck3wY9ROdfbabLErln10B2qq7H2g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/Q4T5I3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9LXFdMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/Q4T5I3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9LXFdMI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T5KNKF1248208
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4OZfzQc/dyOQSntkzOUIiFH1
	GBBny4mWUmOpzxIrldw=; b=n/Q4T5I3mS3JauGC9yq6WWLDzem1jn/0eh3JJGS5
	ZO3xtLILkPvxkuVr5oryFC5WJxaC5bm7Jmpq4L22ba0f0SxXKpF+x1L31JyNfDOJ
	ogL8jx/uI79iG3DXHSgKlJe4BFUWOxrWXCFAlD0wwE3hltNfb5/S4GYpfXskjMFj
	fCLM2t/oiHUqomm4shzlxdRfyx4k+B+hTnCUA1EmlZ/oU82GNjZBpxHZuu5gIm0w
	Z1MjPLjLiyKyJ5cWuFfDtOmneYK0V8YeySjY31Y3N6Ai1Zkf+C9U+8Vst6JaR3+j
	0SIK/M96O3HbU5R21gxWfWseLsLo81NSdv5qlgB0ffKyPA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj1gc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 11:31:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5754e645c63so7755415e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 29 May 2026 04:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780054299; x=1780659099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4OZfzQc/dyOQSntkzOUIiFH1GBBny4mWUmOpzxIrldw=;
        b=E9LXFdMI5qYUHBXN/l1WExq79ZnAMuqvQvvTVJNA+SxhIqDK7f6CLLqLU5KCRG3P5l
         3zJqQWW/SKB//EYaJf+JCa93bGVnmkHaABRieGFDtSHnpjspduXPw3AW2nb5hlxbeo/3
         YaOMba+qjROEu5BhxhkT2xRWkqRe5/ugs9Q3J8t1ao+Ln7mGSHLdh1QbIUEtBcvg0uCL
         Ha79+cPPteOZCa+fS5gQM0ZghpycFS05RPmqpXi9BXJujMXj/RArn4eI3X8qxmWFDqWj
         iOAJbUiKGsRgUOLnu9wovEx7A9lhJYptDdtIcDnxGTQ8phxWVyvAPnW8WXGHUlYEaqsI
         zskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780054299; x=1780659099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OZfzQc/dyOQSntkzOUIiFH1GBBny4mWUmOpzxIrldw=;
        b=Q8ntYamfQlFCWXYiIu71zH/oU2exT08i8F9CH5hR/tGJbooFu7pdzfEQelb8+wv638
         8/Rs+7AGcJUGAeim163o6N6neqUc10QI2Cxxp6GjPSAtZ6UJf0OMm4pf6wRTZjWNfsds
         Z2OBDs5B68V3Uod1xqBOAGj2KhWeP5UkeZY9q5NUpQwAMicri0CV7WEoIK53YNw/2IO6
         dYZ733aBJf/wvvuXuma4jrbPaM5k5SwCf0Acnjaz1lL6B5+KAKyACyJerv/VL6ffPNTC
         3nskiGDdh31WAtHJsqZSFDylTf+EjcuUVQNBwfW88JpF/3cmOnkhWPBWpLlHUQKAw8b/
         3Lug==
X-Forwarded-Encrypted: i=1; AFNElJ/I014K549HZsTLuYIN27hizUJi/4BQBA25uLzVHHVfmY+WFw1Kg82ZrwNRnDyTokyv+6KJpHbrQRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPdb8nSsp4/XORmWh3UOjpDPWU7wBWzKrF194UU6h99/1u4MVd
	YzdMqYYTupH98IA256KQmFLMoDypFPtmEFdju/qxPZgKDF21n17NGzrT1jYfZ6lpDu2ltXazVZF
	2q8PRVGN6qcgSMIBxRC1WyB1G7EAQgcp6quot0tKNQQHy7zldPR0gYSCP6Vc99WOf4kPeJrQaGB
	y2
X-Gm-Gg: Acq92OFLX32E0AMeG4h9Hp3nlOUHWkbUNT/zrQF68ChoSLVfXwjM8U7bnm4++dv7/j7
	FBtV/hBpFmK8WZFDzeAEP+7Xjv9WBuBHokYs/s9k9YACS1vXsbdWLRUPZBruMm6uqI+25YHiioK
	ZytAyr7exjb7tPyhHCQrlI+idwsC5bwHSKhWP/dCrsUUKs4oai3+BuELESSEVytCZSPt1VYiy/R
	szZLRrzt6u1xEoRLzvopJKBYk3Vp7c+m9iAtNYM0mNajHITshJUv1RrnJjKbN9QHQM45a0071pj
	T1LaYUzvxpJX7WgITN5fvHEpB6paIxF36jqu30wDdGlRBOaumo6TY6TETlcsQFjPt8KQsgztC0e
	rRuEZwjFiLDZhvu2cVP9Pp3NyTj9pGl/uKzLgJNq/dUtsls9On/yTivfzogtwcYBzirIrmvfHpj
	hv/VVhGdgs0dSCphZl/5OoG5sigpnbnRAH07OMyyV5AQwtIQ==
X-Received: by 2002:a05:6122:3383:b0:575:cbe6:8416 with SMTP id 71dfb90a1353d-599fb52908bmr776977e0c.14.1780054299000;
        Fri, 29 May 2026 04:31:39 -0700 (PDT)
X-Received: by 2002:a05:6122:3383:b0:575:cbe6:8416 with SMTP id 71dfb90a1353d-599fb52908bmr776857e0c.14.1780054298205;
        Fri, 29 May 2026 04:31:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b596814sm221915e87.43.2026.05.29.04.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:31:36 -0700 (PDT)
Date: Fri, 29 May 2026 14:31:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] clk: qcom: gcc-qcm2290: Drop modelling of
 critical clocks
Message-ID: <s5wjr7a7zkueqyzlmrij7f53brrh6rv5z3t5cser5cj74qca2e@6xhljjefc66a>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
 <20260528-shikra-dispcc-gpucc-v2-1-953f246a0fbb@oss.qualcomm.com>
 <ro6xcalsh5vwsyxi4jyyk4iebmg2p626aqw5zobbfjj5noui6r@hsjyhdko2aca>
 <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b911846-1001-4c20-908d-1384cc81e30b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNCBTYWx0ZWRfX72zcnWan5CNX
 aoJ4MPRHkGBIAklv0nRIuUlfM27JeCZuf/2J+5F+79OT9ELK7vRFzH6lxm9PT061SGbS1JRJqLK
 yqE7kIHlyhSMZK4yQ92dYBzFcvGZG+W7ZDm7HEglPvf/jCmq95zBntACSI4wg210H46/Et4hyL2
 x2IzFdjytkd+4lG448dDLQbY8zMEwjuqXgTDtGUgukND/EYXOyeIz4D3tO+U9U2R6vZy+GpLnrv
 JvjiysgHfBDprDhzP3GK7wXTgUADiMY45yMUxZa2Ekq/KjLm41yL6Cri5EzxmH7TFZv5yIjKpoH
 1y+pEhgnYDw/evvtm+CpJaf2a/bHNp5BGeA3vWdN4nfvkxz6XxPMNvlT87XHJ0MjH8UG6yeitmn
 E+iiZVkcZO5PgbxwULG33e9MjltUzhEpwA5OWLqJMPLx203kjvi7VcsQc6yYcdRV+7eRzMFv5zA
 4OQqyazqzvJiGv7+DpQ==
X-Proofpoint-ORIG-GUID: mY1AAAfeUrDGG8J3fSMi-obpMXLiLA1L
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19791b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6Wl8FitGjV6qeXz9Ne0A:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: mY1AAAfeUrDGG8J3fSMi-obpMXLiLA1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290114

On Fri, May 29, 2026 at 02:52:39PM +0530, Imran Shaik wrote:
> 
> 
> On 28-05-2026 06:52 pm, Dmitry Baryshkov wrote:
> > On Thu, May 28, 2026 at 03:37:02PM +0530, Imran Shaik wrote:
> > > Drop the modelling of critical GCC clocks on QCM2290 SoC, and keep them
> > > enabled from probe as per the latest convention. This helps to drop the
> > > pm_clk handling in QCM2290 GPUCC driver, and the same can be re-used for
> > > Shikra SoC.
> > > 
> > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > ---
> > >   drivers/clk/qcom/gcc-qcm2290.c | 153 +++--------------------------------------
> > >   1 file changed, 11 insertions(+), 142 deletions(-)
> > > 
> > > @@ -2012,19 +1936,6 @@ static struct clk_branch gcc_gpu_gpll0_div_clk_src = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_gpu_iref_clk = {
> > > -	.halt_reg = 0x36100,
> > > -	.halt_check = BRANCH_HALT_DELAY,
> > > -	.clkr = {
> > > -		.enable_reg = 0x36100,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_gpu_iref_clk",
> > > -			.ops = &clk_branch2_ops,
> > > -		},
> > > -	},
> > > -};
> > 
> > This clock is not critical. Why is it being dropped?
> > 
> > > -
> > >   static struct clk_branch gcc_gpu_memnoc_gfx_clk = {
> > >   	.halt_reg = 0x3600c,
> > >   	.halt_check = BRANCH_VOTED,
> > > @@ -2605,21 +2500,6 @@ static struct clk_branch gcc_venus_ctl_axi_clk = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_video_ahb_clk = {
> > > -	.halt_reg = 0x17004,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.hwcg_reg = 0x17004,
> > > -	.hwcg_bit = 1,
> > > -	.clkr = {
> > > -		.enable_reg = 0x17004,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_video_ahb_clk",
> > > -			.ops = &clk_branch2_ops,
> > 
> > This clock isn't marked as CRITICAL, why is it being dropped?
> > 
> > > -		},
> > > -	},
> > > -};
> > > -
> > >   static struct clk_branch gcc_video_axi0_clk = {
> > >   	.halt_reg = 0x1701c,
> > >   	.halt_check = BRANCH_HALT,
> > > @@ -2686,19 +2566,6 @@ static struct clk_branch gcc_video_venus_ctl_clk = {
> > >   	},
> > >   };
> > > -static struct clk_branch gcc_video_xo_clk = {
> > > -	.halt_reg = 0x17024,
> > > -	.halt_check = BRANCH_HALT,
> > > -	.clkr = {
> > > -		.enable_reg = 0x17024,
> > > -		.enable_mask = BIT(0),
> > > -		.hw.init = &(struct clk_init_data){
> > > -			.name = "gcc_video_xo_clk",
> > > -			.ops = &clk_branch2_ops,
> > 
> > This clock isn't marked as CRITICAL, why is it being dropped?
> > 
> 
> The above clocks also should have been marked as CRITICAL. Not sure why
> those are not marked in the QCM2290. Since we are updating the critical
> clock set, moving all the required clocks to the critical list in line with
> the latest conventions.

Sure, but it doesn't match the commit message. Explain that you are
making them always-on, because...


-- 
With best wishes
Dmitry
