Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F95520C009
	for <linux-clk@vger.kernel.org>; Tue,  1 Jul 2025 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368621; cv=none; b=EO+r1WwdBORSzhkwuuXt14red/sAyHdAvMYlGXTwMt/Tw9VTeKiHpjbWwte5A99N02XX7Us0y5qB1kMfwbx7QP7q0plHmZGGZiGwPL/NtOm+eIFHn9Y24xbHSzKYdOFTC2CL8UYc4qVPNdSxX8YqbEDorjCtlPeK7iNCjo70A+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368621; c=relaxed/simple;
	bh=P+AniTQtNOyYYO929SsdBmccebThUXBNEGP0tTQX+Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opCRs7QtaNgWroNvZ8y07eVRadqKXZJZlmEH84grl7Z2tXbQJib4oKZJ7tddkPXv/RIf+HX/vIHGv35xqJDsDnHZ9ff2+3/+9KQeibyARy8MjtaQkYO7FQAaraEDDPw8IcaxOWlnqJPSj6q5iC9HcjXQI7u8jU5d5j37NhUYfp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7PDeVf0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7PDeVf0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619rk8R007047
	for <linux-clk@vger.kernel.org>; Tue, 1 Jul 2025 11:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/DsPTsBsBDmT1yFH6Ie1eyY
	DtQOwvGO1EI9mJaE2Y0=; b=G7PDeVf0vg+kdCXuIrrqktt00oLfENIIZzDDghVl
	5mZXfMXZI/cDcT7xbYlaYlxK0pmGbFagyxYsJz4dlGTxJmCO88X+5UKQ0fbXZQEC
	9EiF6/EYmZHAbJtX6LUAwkxBEjXut5t7kwZ25fuGLnWSRuNrnmU1Eq9HqdcF0FwU
	3gklU5U2xLVkjPGP5IHFTElefB9zKYEttE9O8uzrXm/6btQ8QQJeUCTxvcvKAEVZ
	Ze2XpYEU43JmoI2qEvSH8Xac8KWNE/7dBgr87I7mhFvchmts9Ox28KzhuoyLbjd6
	GeDYQ6mjAOrGrYTZPzbV5Dkd0wND7WvEaj5CJM0RP53pXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jd024-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 11:16:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d5077ef51bso74621185a.3
        for <linux-clk@vger.kernel.org>; Tue, 01 Jul 2025 04:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368616; x=1751973416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/DsPTsBsBDmT1yFH6Ie1eyYDtQOwvGO1EI9mJaE2Y0=;
        b=vzVH+oncaNd+O+aQPCYVyR7YNByq5PHsrTIE+rC50QlsSizUfaLetXxEyMIyF9Y2U4
         Gtae9urJrsJTbbmEbGR4iAkuyZzm99xlA9uRbh2JPEyY3mHNYdUZZwU8hlsXVGyUcxtp
         1+gpQiRkUY6mEf1WRygVjEwrKGVxsej0Pzjd+7Buger55OYJfzi/9lfY0M6YoyxwnLgB
         +xYgFKJWz9YNPsBhQlbLw8VL5sj6NU32LX+XUAten3GlP/Excwc+j7cQChVaz/7318nE
         NIZnHCTV5uEG5mRHQRLqG6pXmuYeLfY6edETwH656Qg7D+vC4Qsux36iEILOn7mu1Wms
         EL/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxyBLKzXmhIFschFetE6afoE0tziiU2VNv2IK78Fyv39eGL4IcY7VQKKPwGTbvKJClVvNglYZcv14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtZPlPLs732c+8lf1ZELYG1hQNKo3wms4Vb3sVUWruHuL0ghL
	U1shP8w89SzfFCp9TQO7bYEkvVIDM6XyzT84iT4OAtW237wl/6+Ex5iEU8WadQk5WK8nCFgmCAd
	WiCStjgRfmBVQlgyUX+akZtY97Hyd/vfGP7XwOvlZp1sA+JWJLILncpjxSQrocjE=
X-Gm-Gg: ASbGnctiPaWhfCxGmNHcOw81U9dSswG+LA/uge3zNUyjtz7tISISLa4PMeGaZaAp9m2
	LFZ/ZOi5iWlz8wkLJtOlTJTYJ7pbkQZtb6DGuLbFO9v4v/q3nPgmjexiFis9SlMd6FviCZmhi0L
	DpNrDWdn1X6G8jg+ysUuThxUyb6dvvVfyNax5R95nQT9RCuwxC0Dn+l7jydnxRZXCOygKFGUw2m
	aLXnQKM1CyEhKoNfPiIWuo/mc10nus51t+bDd8cTtYUJqiUiB4l+VHuAvTwe5uMsWz/WktF6jqy
	YbpaJ7KIBbHRimq/GfeG6O+UihnRz4xkNTpx/5teKVJ+F3BWQInfCEE4bo4xGc/2cmIma4T813J
	zAXXG99GnGOaSVqXPtxyDuWdhmA0g96R65OI=
X-Received: by 2002:a05:620a:2703:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d44392577bmr2261951585a.22.1751368615968;
        Tue, 01 Jul 2025 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZAnQsK8oP+yGp6Y9qLuzqAu6F5wPwMy0Ri51LK9L6uuIylK+nYr9DS+MORAP0pvUs/HHlqg==
X-Received: by 2002:a05:620a:2703:b0:7ce:e010:88bb with SMTP id af79cd13be357-7d44392577bmr2261947085a.22.1751368615341;
        Tue, 01 Jul 2025 04:16:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15783941fa.22.2025.07.01.04.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:16:54 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:16:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
Message-ID: <w4eujq72uqflqpsqshc7zhu6lkc7owufep2g2rjacvzgj44vmf@auonp4ugbgow>
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
 <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6863c3a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=2CDl1CmQ9Cb19c7lbDQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 2-D2fgsZg4Ev7HkFlNwDE4XL2xBhVh42
X-Proofpoint-GUID: 2-D2fgsZg4Ev7HkFlNwDE4XL2xBhVh42
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2OSBTYWx0ZWRfX7mG2aJBh9h0S
 bYKnL5wtbvdQAydKY8KbCUgS/H0g6ViTRWELO1gC/w6Ou7zhc3YdpGks5lweoVy72NYt3Q12L54
 H/DEYhWPu8pWczOHDX463laeo3EbSm3vEAAlyABB+2+QQ8qAPv4yC9YsipRSfuNuxoMObtcMGTG
 RNqJ9uNIsmu4yAjbcUDfKKAdyTgIjhPcp85iqpPfGyXBbIfQiSxXqvDxSZE5k727sUN8rbAnZia
 lY95wXmhrG8OEz+3mYR17ODbZg58dMBi8ioaRJ04SevcZ3E/bTOo5gBZVlMedzgK7Sq85ZWOVOd
 QYwq9KkyHsGr1vq0D3dZHrJm2g0zrgedqTm/67FL4wArJWx6OOiUdos6ECd+cWqX+lUVepGJKtD
 9mtfF4TlE/GxexU2AUaMQgY89eum1NlKaHtKQE9wn2VBmbMrMVGgVeBcGz9qHPQUtnRjG7E8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=894 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010069

On Mon, Jun 30, 2025 at 10:01:35AM +0200, Luca Weiss wrote:
> Hi Konrad,
> 
> On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> > On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
> >> On 6/25/25 11:12 AM, Luca Weiss wrote:
> >>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
> >>> VIDEOCC on the SM7635 SoC.
> >>> 
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Luca Weiss (10):
> >>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Controller
> >>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Controller
> >>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Controller
> >>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
> >>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
> >>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controller
> >>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
> >>
> >> We had a massive yak shaving patchset go in this season, please move
> >> the magic settings in .probe to qcom_cc_driver_data {}
> >
> > Okay cool, I found them
> > https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982706.b4-ty@kernel.org/
> 
> For camcc, gpucc and videocc it seems quite simple to follow these
> changes.
> 
> For dispcc I don't know what to do with this line.
> 
> 	/* Enable clock gating for MDP clocks */
> 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Use clk_regs_configure() callback to set this bit.

> 
> Do I just keep the regmap references in this probe function and just
> move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
> config struct?
> 
> And similar for gcc, I can move the qcom_branch_set_clk_en calls there
> but the qcom_cc_register_rcg_dfs needs to be kept.

Would you mind extnding struct qcom_cc_desc with args to call
qcom_cc_register_rcg_dfs() and call it from qcom_cc_really_probe()?

> 
> Does that sound okay, or what exactly is the desired outcome of the
> requested changes?
> 
> Regards
> Luca
> 
> >
> >>
> >> Konrad
> 

-- 
With best wishes
Dmitry
