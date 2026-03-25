Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22ADC372B2A
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478413; cv=none; b=SHV5eG1Y5yl+RSaTJ1lhBGoHqekekF62hT5j94qGYL+/p8wqZSi835R8wk/z+FRtsxlT6Jb2zIi+GrxEi53Htxk0Fkk38qfNac5hcyuRnz7ytnTW0sbxgxUuoo8v/lVv0XRSbkbJR7soeVv+d/JXT3rXd/LhykCNn84n5+P7Ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478413; c=relaxed/simple;
	bh=NAIvZ5890qoM9mwWteWIr803n+3j5/tcS32M8qZ9hfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBlAxK4Vl3qVjQrDup+Bl5ENPeTWwq0I2ZOeVcvNXVeRsq81THDER4uLlrCvF0E8beVlLk6Jo0n9zBWDfdGdHOnySTDoA7WKN00i7Rz2N3Z4u6ACN4bP8H7p37fTYdWPGXfS2Zc/fN8kuUBWEVTW/RqjMPntgrnW6FvNXhgkIK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=icNIGBoA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUkPOG7F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="icNIGBoA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUkPOG7F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHCuj585507
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6kHbTlHvPKo9EGAJ9UfTuO3r
	4iOiLGUngfwomxp+Agg=; b=icNIGBoA34jsE9qveWyXRJKcx4bYvbXbp9m4FzGH
	I5HeXy4IAj1l0uuG/zLjMpxVV8LjFWqPXi+3J5QvGyLLBGX1hSXUQ7TIoKG4HOFn
	wkbIZv6IzVf49ac6t2t6Qkh17iXfuGOM8vjNbNGW0wsppTdYLuZk/BOETi2cAgoz
	DGusJktILAE3MaCxSoWNXGO3OSsbu1vLE3bTfPYcA+JyHUm4AC3h2q7fLNlAA8OT
	Mia4GY8icCIAmXHQ8ZG3XBqXoWafU12uD9SJbtflbV+Tqrob1Pu3n3+VIcbjeP5O
	7SvRknX0U+ifQ0fxp0OCHj8jJILSuYIIt6yqOTAZlMMAAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp44yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 22:40:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b34223670so14635941cf.0
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 15:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478410; x=1775083210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6kHbTlHvPKo9EGAJ9UfTuO3r4iOiLGUngfwomxp+Agg=;
        b=GUkPOG7FUi3C+S3WtxKWjpFM/8SS9pQ2ipoO8cTTfE6GgF2UFVQYZ8HAD3Vv7dfrtn
         HerDYNFhAq3aB4LS+/J79rhWC8UunA+h0fyybnQDm9epNE4O8ruOUM6FWNfyAd3R0ogO
         q03+xOPWZpKgKtgCMuYiIGWXVahKOc85mD8gIS209sbMMl5/QpTGGm63QwhNHOEI6yFl
         FjvP7ysJDh41lgBlanqRKS52zx6OdpHy4gjkJ+Yt9ieYDWAPMiax6z8KqYBZlATMe1DF
         TZ/ttsY7FOj+YVuo4qODD1mFMfwjki/iqNnEuSg3zC6MlTMTdpHfwKBqvgkgS4s+00M2
         vatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478410; x=1775083210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kHbTlHvPKo9EGAJ9UfTuO3r4iOiLGUngfwomxp+Agg=;
        b=sihCXqJY1gxw4M1gqeUp7G40tJc4LuhHzrdapDflDY6WSYmRYUMYnSz84wpTugN/5g
         PM077f2vQYaMLIAyftqGnio7AV3fOB7phwmSVaT9nt4+mEfxHH+Lt+1eFAZSiTfobtrS
         4JlkmnDYQcK3kFM91VMzKLFLu4Ag+lztPX4C10pLl3Laptm9jpm2R5uisxxYtZn8W65z
         ifHOvyGD02er0uOTnzqSnyCpq+ndqFR2Yo1n2z4SOIBAwzCBO11XL2kPJppFwO3vXglG
         FFj/ncxcNTCKIuxsj9uhjhkAjrhbyPUB1MiahrIjUd3qviaKcHDfOppT/fsEaaNrxX55
         EDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO29MBYkpUHG5V3Rvm+uKkPHPaBCBO1m6aGRnE3b7XA9vyOgp4H9/JChEwHERvnrCUJrAtIt+/m6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5IWGNGzNrhitj1AnvjM5BhHvTwvrP+Qb+OMKcA/n8+8hpjb+N
	GhUs2f7iSPZaSUmPb82tWAY6+Y6+RZkoG0TltLBHF+33Ab284A9mpqU5/ynT659GCx98u2i5sNu
	0RiXXBEmV7HbaV8KhM5rWEbiDp9zobOX2mrVvbroAzs7n2XaQfTQBchCxx4qobNk=
X-Gm-Gg: ATEYQzzcdKdRLL1oXq9IvWp3Nr5Rt7pNlo6edaZJZuNaIMsZKAX624AM9p3dxecZCSg
	UgJVOez8GYvfTVwjhPH3D6H5T0ybePDHH7tYeocDbTRq5eVl+vtog6E4u/bWj5Ena6f5LCowvl3
	W5ZxPktpdRl+oaYXDaTjZlQGdLvaNOvNAe/RIhawHvyoGPAjFRi/M1/6lxMOxbOUq3DwR3ABqsU
	Q7ximzkCzSUBHc4noYVI4xx/iYX6vp6oS5LmbqrAw/ldrWF0eArWlB1dL3+hMLKPe0HdolBfeds
	oN207AsSID9HOfwfC0HEjlMOSg0pQPonGNQbeYLGIqUTn5dtAwyfeIt0C1HakcJJ21I9NU9EVCM
	34I6tR0gMVrTy4kF9o5sqoGlh5D5lNvJfYhV+r/4qmOdD+wt2kMIhud9DCa3WKnRRg/HAwbfgrf
	yB3hb+TwSs55JlJdxnh6TQqUXtp451FPUjSTo=
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr80324231cf.21.1774478410221;
        Wed, 25 Mar 2026 15:40:10 -0700 (PDT)
X-Received: by 2002:a05:622a:315:b0:509:2f5f:a178 with SMTP id d75a77b69052e-50b80ce9d96mr80323861cf.21.1774478409750;
        Wed, 25 Mar 2026 15:40:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a06a5ca3sm171455e87.80.2026.03.25.15.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:07 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <5nnowag37qecmviblilfdou4sbh6ogk352gldrxgqrtwvil2ra@r6uytpwzxcbg>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Proofpoint-ORIG-GUID: q1Srr1QKjIpMg76t-HcT5zYStesCjZH2
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c4644b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: q1Srr1QKjIpMg76t-HcT5zYStesCjZH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX9l1KxflNtISv
 h/K9cuE45XuG3ITvnpn8CeuyCJ0X/zX0zWTu5+r+7WFnJvBelnWl7Mvwmo+zswjG3ywC8Um4IZ1
 0ffDOJVyDvmaoZiX6XWcdQczeih9PTlwWdcfE9h6ozAYehqHUWmpoPJHyxBGP+N1YzPmTxq5U1t
 6aKOJXkWbFQ9r4gxrtFy+vrxRHUE1TdLpT+vX331FMj31P64R35igheDJuPDH2tT7StuF3laeUL
 SutaWGTRv/rzQtphmtaumuiJWsyCSDcin/enuXNGy/Qrjk5ro15ecU6+jH1CzP9OYyqXjdk7NnZ
 FAOMSHayiUhvzsWcOUGtqNXW1zUPWnvHBg/XhzWRUJ2K81OzY6Ol6xWZgqu1ZSi6qBZveY2K4+E
 oa+gSrV40v3msrLOYrJa2RR5rWwAF8qhA4WLgq2Ml22pRw6SRi2kXgbn3SlVlEP7RvaLsU0bsVE
 PULr1uXW1U1BMBSj/mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
