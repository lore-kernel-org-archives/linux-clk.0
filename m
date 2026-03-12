Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466D23C4F2
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773319198; cv=none; b=bkiukzEcrizTX4DFt5K72imw2SImKPS1ez5azba1fwX2dvx+14lWS26u+ERXvVewiGt5eYQRjIc4Rihg0++GHxFsuC6vT3SKm/rvY1lG7EOg76hF7NVVRu0Va6lykMCb/76urQbwgVPsCTkHdpVLSuaJBT++UPk9HSgvUn1yIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773319198; c=relaxed/simple;
	bh=wH6m20oOvygHKWGptWP4fU94uVxnzag9ztwGIqhTPCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uBhl0HYUpG8HZJmJ+NkCXnLbdaZ1gwUcVUIvorWDtW+5vyEY+RD/z5og1zlfIW1Mvy6DZqX2s+wllDyShwe6go9Idk5dcG39bFy3+26a3kjiTUQwMNivne6sl85dJfec7BkatoGZ6t8LuLZLXT2I64kXpWtGSTSs0xfg6D3gTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxARHRvb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f0eWB6Hr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxARHRvb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f0eWB6Hr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CAetgF3667218
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TEe9/mDYVPAhaKZz+dK1GUhp
	LGfNKUy6R+U9uO88nPU=; b=MxARHRvbaajN9Hxegg0bJWVVYJrGhUn8UOV6jlY5
	hU8g66cKLGeCf29/0B/dqpziCHY9QjCYLCHfWZgFPjfS7O8MoMO/phSXCzzjgukg
	rYsLu/0PKiaJsybrtfOSryyk6jbwj3k/OInVTVlSnVCnR05285EzBie5MJ5ouEbJ
	ZDFcPRG0wZa6RQ573Zh9sCRy1bKFpNjFj0iz2ggInoJHCmucUOKdI4JtVo+i7KNh
	CB9t2ZK5S3GkuAMpIGywnOdjdnm+/hmNszI1BwthXk6Q356EECmDntmlQX8pfEiK
	oEuS7nOo2ON/JAd2C6PA4ro6Ktd1TtqoV1ncSavx467a9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60j3k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:39:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so434322585a.1
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 05:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773319195; x=1773923995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TEe9/mDYVPAhaKZz+dK1GUhpLGfNKUy6R+U9uO88nPU=;
        b=f0eWB6HrQRoO/D39p81fwtLeknaLD3psiRB0sYMB2jElMW2Ya8on4hJ/L3nLEzvB9V
         6cqaYLNw1kqKlWMC4OqO3OOFUttpAAep6LPQfIxnEmiJiXmCMPyUbRmsNstkRn38sYkr
         1tAWMP+2Jd8Kr7U2QNYCLRGu5cO9+LZNagmLofl5/PUFGwSIpYg4FToX1AGQJyY6yyXo
         akvLxFXAD7dv7jzUlLtTMkpouB1GtKaBbFRfNahXkDEkbyNQmpXVj2jVOTU8dzLSew3k
         TECw9KmAT0TU4BJ4m1dZ1dcQVCK/Cb7zG99T0Kb4nhNobgDFhfQpGD67tjIj2lNjP9p3
         6LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773319195; x=1773923995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEe9/mDYVPAhaKZz+dK1GUhpLGfNKUy6R+U9uO88nPU=;
        b=lDQWYj+zSy2bAIpY7IodDqvRtqNwNxkQY5M5ZFHsETn61VwXfiz6U57a6BUfowrtol
         e9tuDNeOxkawv6sCg8lgLX5ta5IVax9FanUpQ5Hjivnpy02yxsQhpLGqz70ySX6+BVIE
         zjgvKKXLcoxI+vJIPReJuI+GpTtsFYJjKCGIX4/4zyxfpvhBvYRJuaP5grIS7rsZR0Ph
         jRn49ix0chV64gGvFVxelhtFYMTIVasy966dZoYKYyR8EXKnfQnAoTVMgcr+Awpdi7hB
         OCOQeAsG0H10KqM9+KYZHmfth7PgCah7NCmczY9pi4LO3xBm/Rf54A9Jao4jZv+IDlIk
         HG1w==
X-Forwarded-Encrypted: i=1; AJvYcCUgNgAEimD5HhLbEq3uoFLmsOhrLjSYw2Aop41UHtTs1Eu5i+kbpHIz47wVdH8rX0q3MRpolmZxKtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMvBjcVnUGxv2iNJwiRKWaSykUXTy9N8SBn6suml9srqiASSwN
	a8MTJexY+I9UNtEyxrh0TBVjzb5YDPj6jwxYsleZH0nOP2faak7XBsl92hg2sksaOd6Kc09LhB8
	kxb6P26Rp/UQYtDXYd8y8JPfFzAqNb8kj+TiV8Aq7yiSq0hxP4mSDC4kE6ZG2pnE=
X-Gm-Gg: ATEYQzztx/hSP+3BiwSL+23Hu1b4b67YacIGkmq00webKZthErv0Le+6bo7Vc3A98Ac
	dj72wxlIh18NJok71JeLwNQ950Px/cPrkvBmBfa1aBttQEmKRtLPWzmkOiniDnEW7W71yi/Lusj
	7XzUMEVR4xo7VFTW1orQ8tZM/4eF/SsqtFRr3eH77VeVREALlb67de07yuiM6UXrR70Z+M45isk
	jZEDkffb9BnPxPd7m/o7TeORBWfqU4m03pGza2gPayQf0+CmFKHzYsrdgSlMOKA/OjJSdN/pGvT
	ZpdMVZoj9FUrlBOALAN7Ixt3t1bqjG1lVz4XA8jxlKy+gUiS7PiL2BS0Y5PM7XeqI+GmjRZheQq
	K3T6iD34c8GwlwGFzqWfyUXMTHmFV0ve9TYshsOKCdMN9aDC75fNha/bouA6xLwvawiqtyMns6e
	GJ+acyh0cv8xv7UowjL/Z6D3MPvAgmAFLNeqo=
X-Received: by 2002:a05:620a:198a:b0:8cd:9938:9810 with SMTP id af79cd13be357-8cda1954688mr777500785a.25.1773319194584;
        Thu, 12 Mar 2026 05:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:198a:b0:8cd:9938:9810 with SMTP id af79cd13be357-8cda1954688mr777497185a.25.1773319194102;
        Thu, 12 Mar 2026 05:39:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d61f1asm8331641fa.2.2026.03.12.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:39:53 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:39:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-sc8180x: Enable runtime PM
 support
Message-ID: <vbdpbesngvoya5hp7nlgt2oorw56jqyuuhjvxjr6fgqvaea5mf@zsnzzqudje4g>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-6-val@packett.cool>
X-Proofpoint-ORIG-GUID: lYFgXApu00sthDP6z1RzjkgGi7f6wJCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwMCBTYWx0ZWRfX30Vg4vB5vdy3
 Q40cp5VX1ke4THobWRL66wUtWzM5Bi+ejaTlJ97eP860sWwp3waFrgDKB6CYDOCL3h5VidGd5Hw
 Ae7gn/WBvo4tDTafN8P6b3pdS/ycgaVp4T2Qcy0UTayRTHUuiV3mjfNem9CT12FU6VZBxVmjm1j
 8zXxm0E9besEzxCmVr+w18wg8SbSpZJcTCnPTNlZu+dqXyEctWBz/+08T+6KLQL1dUkrQxWZFQm
 MvWPwSVrWwbkzVqi6lyFwlJ2WJZFMONZoWJjfA8womK1qBgcx9riAIqO+rqjxyOv3JwomBqiq8g
 VKjEybaZtKpGtL032hqys3JNbrBbwbN7hz0TSdJmG2KrJ9jJw4bHb9nT6njSddHG48PWm2Fxx4K
 zDYUE9es7NjRMgj5um26/wyWtNePdYEXX88KxrrDdhwy9copFksrdw6nklK1XdeMaya3zg37+4x
 /sOGttkL3SGohUqc7Gg==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2b41b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=v6XGWrSWbwRJ_Lk9CX8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lYFgXApu00sthDP6z1RzjkgGi7f6wJCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120100

On Thu, Mar 12, 2026 at 08:12:10AM -0300, Val Packett wrote:
> The GCC block on SC8180X is powered by the CX rail. We need to ensure
> that it's enabled to prevent unwanted power collapse.
> 
> Enable runtime PM to keep the power flowing only when necessary.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/gcc-sc8180x.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
