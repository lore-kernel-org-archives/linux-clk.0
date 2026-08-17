Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796B71A6828
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 01:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786930513; cv=none; b=H0DWgBLrBcPa1AbZWbBgc8CyctqUztU3kggBNqymPbOYulpRfNO9dIQH5NnJn8r4YTYZy893GyaYdqoUN8GQi/wsi7Z2iFbLLi3kssc5/s61jAtUW/oSThGlHt60FBu8qr2SNdzfr5cSpopt8VDJHW5107jcIusghTJcAYzySFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786930513; c=relaxed/simple;
	bh=ebkW9UfUH9F07rXyIwu31HzNjXAR+Y1CE6VkFciW4r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkCBZdVhrfCP7lyChsoPiBHUPaglelPmeiL5t5XOp+FTcPk4dQaGBr+rNtB9K1n8WoqwWjlprfyYXMjjpEQteONYcrSfN1dGOKF05G2DFAnRS+Q/awUPnfJ6+k70gLdiFwUTQpNiJnvEhnKa9jDsfockmjpWKYsFjt2d3ak9yJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JE6uf7PK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZSaq8ri; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JE6uf7PK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZSaq8ri"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCaAM4118180
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 01:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8sTXhZEGzAhuFBbJOsyVHbi
	Ug2T+wfCrbiWH5+ncZk=; b=JE6uf7PKLHla+DnaSl+zAmTXSKdQyfm6zwtn1fBh
	8nDyN4WI6OBNguQ8zdeqvCpHIKb3TDdN03E31v4MYLnLqCybdRl831lVytJoVls8
	JY8zSFH77HSWbpZow5nM2Y7hsVoSaeRm/ve4EWmp4e8434ZeBw+1uh12GXovQAle
	qk3vOVfM7cwaUkJ/wzV9yZEH43xhierLGtqJjOj4HwUy1vplbWkNfeOQoTzUg8fH
	KFhbx5LZYCtKX6c5E764zkN8Tdm+WZN0KDuXP3xsNYRPPQp85zhbfaztM6r4oSCa
	/x6ryBR/N4A4+86TEiBqvQRxyJOEn65ME/KhLpvgNzdc0A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghfcs24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Aug 2026 01:35:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e695a3b28so393799285a.1
        for <linux-clk@vger.kernel.org>; Sun, 16 Aug 2026 18:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786930510; x=1787535310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N8sTXhZEGzAhuFBbJOsyVHbiUg2T+wfCrbiWH5+ncZk=;
        b=XZSaq8riqK/bC5Xl/KeQ3nRKIKbdG1HbR+/QhP1+AM0r//2QBaTy+NtytqgKOlgW2K
         Y6FAGVlTnu8WsZ5Lw28LxyEnjcUwI4wX0fK+Brosh6bep8GIn0QOa8lnuoBCLZ1iIRt2
         yJu7Ka7hp73eZx4KkJt57jt8UBEE0YyWRNPlD1axCXKOuFqE9haj29ePZLPjA9jGelYQ
         UHDeDLyTtkWzcPBJRPoykv1GWrLQmPv4RdYsEPepvYFGWMjkTY3dn2qz1b+OV/jlxobz
         Knnl5xLcyrd8ykBYD4XVJmj1pzE9nbLOIg5ON6tN/RGwD9k3wTZicvHkvX6bDhgRrnUy
         AcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786930510; x=1787535310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8sTXhZEGzAhuFBbJOsyVHbiUg2T+wfCrbiWH5+ncZk=;
        b=OD9jfN1fqZ5psqBvAe/9YIit2FA8NukUIVq/1klD3CK6C7n4U4QQEpl3QpEqccCWjY
         1eszbdGslQtFDnQN5Blyxi+dZtyJ+5vAbODbW/yAZBki/suRdCHxc8nEVfR/035pidnq
         u3QlAfGZd2ahN7o5IqXPD6z+DYZeFJhkAqWyU6AP5u14rd1Iovuk7q98ctdJtP9OwQG6
         Yn9YASyp/UUSiZWI8sdTWxM8aP1l9rM2qe2eB2Lt1KXsbpaMLzgNgN0MtmigiHP66CSF
         5ftB0qGmZ1U/p1InNWIz+UR3K1BSn8d7RYnSrXdjc5whdK1KXTsWnPdyAjEBeJrM3wCh
         GWFQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9MhgFAIsoDL65yxwzec+q0JZGIXcIyol2zYdxJwD4ctwxc/hDYgAs1DwXvyXoDYMObPcmTYoPXhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1GIX59mCCTVo9Nz3e6z2cjj5tUB60r1q4taknN3W0dCH15uSD
	aDzUz37ReCaJcUQo5R+aTtbSFA6TbNjYgC0/HQt8bseSgtO2PQ58+MlkttVH9E5EgA/lbykb7Xm
	h6tLyUhmRkoCLp7akKDWhubjiGqpuRE8DHgytlsEO4zTC9xNRI6uYBk85Jg4otyY=
X-Gm-Gg: AR+sD12SpdXfzMVQrzZtVf8ZE5dBUVuXp6fH/gd7vs54y+itOE147h0FZl7itgGmmIP
	es06D5FzHuABasEIinsphR+SlutRZ5tzIHy2F90dUM8s7EJop2ZyoySuGwbnDN4bGfErxda1Xyx
	02GYGshnqYLAhA4mthKjnYmi6P+AmZj5sVc7B5v6RCDywl537N9VUS0xuXvj4Eqd6hULkNvPJIM
	51l1u7r371FH4xSRE3+hiknvlBOa2wi4oeEspJ2zUx0sxriE+xwx7waZ8IwkNr3f2Nnl7hIDoyI
	WXIw07R8iekDgDcOlaOZXPzQlSa0WCM7Iqcd94R1fuuoVxMoygdU+w8gySW2kAdBBHC9ippPK5P
	XvQFrz2/Ptlh9UtVPeSfmc0tW52orDnRGLaZtnAgijggbhwJguXH2PTrGJA7NYE86yesEM6Dd2Z
	kuiNT/b+/r1n2f
X-Received: by 2002:a05:620a:372b:b0:934:ac0a:8bb1 with SMTP id af79cd13be357-936cfd6823emr1951785785a.8.1786930509732;
        Sun, 16 Aug 2026 18:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:372b:b0:934:ac0a:8bb1 with SMTP id af79cd13be357-936cfd6823emr1951783085a.8.1786930509356;
        Sun, 16 Aug 2026 18:35:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b0e1f18sm177241fa.12.2026.08.16.18.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 18:35:06 -0700 (PDT)
Date: Mon, 17 Aug 2026 04:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_tdas@quicinc.com, bmasney@redhat.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SM7250 rpmh clocks
Message-ID: <am4d5oar3c5fqnahzdxck2qdvubrragah7s32gcqhcp667fr5z@wxhkekuarsl6>
References: <20260816131646.10551-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260816131646.10551-1-sreeshankar0910@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAxMCBTYWx0ZWRfXxxKBvMDAgm4X
 AyA7qltXsfoWLstqpr5VGPJ1WPFqPBJ8h43Nn9UkZkhmO5egVhFPjz+o+UXQzkQK5HBEhOard2I
 EKmxh9ntmOOpoPbdVXdLSUnHO8/K7lg=
X-Proofpoint-ORIG-GUID: wJs4dn90HbSDT7xYdqf9p1gtDg8nUFCk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAxMCBTYWx0ZWRfXwkcItITs2YYC
 jjF6Lk7Im5STC+kPNqgyZ2qvOMLe2IyQptdEipigDNnGJH1qXQnlhQtTQs/EddJUELQUm+qwb7M
 rUj0QisLCdPr8j5d2k12VQiuFVnDd8EmtLYKzvBa4NW78lzWaySzOo3KdPB9j8eq7tNaVvyn6pv
 3MhkO+zrDupcsC82+OIkOBd7Zfq/n37hXYOV+h96CYzDp8g9dQIan6vNoPeJEi4bYogKxaW1lyL
 EbYf+vYb/25or70kOeyqT3sH3U8aShpgrP3ceWaMYzACCxbxkV+NlbWoocQerlphGPWRvmIR3s8
 5fj6nM0IsX+MqpqK5QKW+CVrSucCFZrZSIep54s/bZKEP+8h86rNu7zouHOuY8ln/ul73WPY6sa
 uc12oJGsxl6q0FvQ7gsiyfqIUzhtXn8iGGZvmZRFap+5BwVsfnQhUW4IlpQm1YBNn22B9IqUd2k
 TexZgPeLdBG5SCPpxaw==
X-Proofpoint-GUID: wJs4dn90HbSDT7xYdqf9p1gtDg8nUFCk
X-Authority-Analysis: v=2.4 cv=I/dVgtgg c=1 sm=1 tr=0 ts=6a82654e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=RPy-Y7ChLrGBGpb54VYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170010

On Sun, Aug 16, 2026 at 01:16:43PM +0000, Sreeshankar K wrote:
> Qualcomm SM7250 is known as lito.
> Add the RPMH clocks present in SM7250 SoC.
> 
> Sreeshankar K (2):
>   clk: qcom: rpmh: Add SM7250 rpmh clocks
>   dt-bindings: clock: qcom,rpmhcc: Document RPMHCC bindings for SM7250

For the future reference: first the bindings, then the driver, not the
other way around.

> 
>  .../bindings/clock/qcom,rpmhcc.yaml           |  1 +
>  drivers/clk/qcom/clk-rpmh.c                   | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
