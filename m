Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32260204F93
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628771; cv=none; b=A9wApIpw8cACnjcvoAWoE3SWKmxO9njbii/tJGNW+ofQodOF0lwVfL47vLsl9qgfTaBUQuiJGqn/zy5jpzQOmCyH8fLUmh/85ETPGU8/82YwTdFsod8JBC/gLkZff4YtNVx9RmtupIVHv8NAkjB/cO0zuJwMiqfN1su/8HtdtFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628771; c=relaxed/simple;
	bh=0U1mL1UzFzc/KQrV49S79hzot8Xd5etZ/LT7r1XYUuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ew6itKF5euUZFar4LtLffn/GDcm/p72IZFO6W/u/D8nWsPPUd4kWqMyfN/Sim9ObJjd5jnujKb+XPkZisvWRI9dBwbCmu9xDxSKnlYjAH476d5MXDf8XmJND0OvPvRueUHu3fo41WY73HGeLlWdjbFXwDwhMaLGH3j1RPKYzRyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TYwQTKwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uf/wQVN+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TYwQTKwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uf/wQVN+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FK5IAV1339889
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gvLTfYITM+tmEqm/B4CXLFjI
	cIvItRDMEKDQBtnxp0M=; b=TYwQTKwlFRPixVNMVKpqfE5nQrtSwRUHjz1QZn1i
	dd4KMAdUZcReaxVaAevqlcA4gab2OhR3toHHOF9vQiDw+E3L2ESbyCu7MdFHw2D8
	2DMMT4LzLgMKikpl94IOUQvUSHPmY9r2CLbw7s0OpaHR5KmbPEiThob3+tFxuOoV
	VtCWlzOklX+rxiwJDx8zT3wDoqz3w//GoE1uhrjqBGqunk8qSQgUJyVkEKe/khOx
	aNsZRBm8+lg7xQxAhx8ZBfExaZCIa4E10WmS82mqmIDgfanlSwKfx1vyE3oGawDP
	I+rU6Q0uoyxgUgI7GR9d3pDL7qiLfUlecogzUa4v0nP5NA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0ecbqed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:39:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb6291d95aso4730917585a.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Mar 2026 19:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773628767; x=1774233567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gvLTfYITM+tmEqm/B4CXLFjIcIvItRDMEKDQBtnxp0M=;
        b=Uf/wQVN+xWFpozVo0jtVv8CgAZGTKq0WOQrzewOt3J8UNqSa/dDYc6yBqzLRBTkXUF
         omCCGSkf52hq3JwtJy93OGqw1DnW59IDkcge1yjOIU94LT5f9S1Yd1mH4mLe0+REbGSe
         1S0SPv9LqIbwKXncRIkRL9fnuxm8K1H0SAMQI5f8wypF1uHGd3tNrLyqfs4ESOE0WqhI
         VZFnvY+uBsNx2LTLIW27raNMoMspKc8V40il0Y9Hqk0CmwIOco2WV/F0WobfyW4FOET/
         npcLXXqTj+DwHxM1kuxx/pRuSTsqq6DyJ/H/6qHILPaxUsjKbRJLQqgfnkhDj7wLpEFk
         fqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628767; x=1774233567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvLTfYITM+tmEqm/B4CXLFjIcIvItRDMEKDQBtnxp0M=;
        b=m+gOmo/DPvs0/LUJIS7fsbQpPboeS02ioxHR98HGus5XVbNBKqIWH9q4LQoNrFPlWL
         Xl+uP/hQBFRwQvdupcdrQxCLn0wyoqC5f5XrSH4mL0vvhk5Sno+fzccWgTvOkqkvUdA+
         tboaZNLxr2PmxJ1d5Zh/xNFPLdd8gWJYHXMsT2zRGjLE8plYpltOf7DoR7I8ne4fVp8P
         JiEr4bkYnAMiOsSa4Z9oc7U9hG3s3cKauHAXpIKTZ8ttcUS+l0Yrak9Uz8LZgbuvivhe
         JHkfEUqiNrYGlAmA+B8ERpLhmQZAPf0ygJHv4SUY+GYjqIgVmQmAEXdoxbSR5WABQzJx
         2icw==
X-Forwarded-Encrypted: i=1; AJvYcCWCHU7nT5kqMpgVnlqxuczTPgjl52jik0f2bGh8mjDbH04vDNZxekM9fS37GuT9mrsJUBJLMhCZpms=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM+Qx1DUusLgdUuL3sXCKLYeR4DugupPxGQwEU8UTofl3bolt4
	vcS36s/8rT4Xnp5hV+NPJ2q2klfdGIBE9NP1KL6ygHv3C4BQeJS9vhyTr5c7Ltrp1F7QxaB5sk1
	+MQsA2vtmgUCHrv35xr61K+rFuWmqYL1O2AWSwi6BbQlbEK1GETxgIO7W6KUPCeg=
X-Gm-Gg: ATEYQzwOIPu8q6+TX2pDnFvsoxVxgwTjt/ol2rSZf1mO6uHq1zoyoD+v/rBWEeCgn9Y
	Kt0+ZBm2ZdTpmNk4KxF8PYTFN28fj5juaJr8tEE4Os6h5wlmF5W62ZPvWEM29v++TtQRDTosW/v
	OI0XhqjFcV6yGBlrXqdz8qn/+FP/kKemsAmBH7MV6kmbtVX2IAcf7lYWKPHF7JEtw0Gdeec4GqM
	dh7SbB7pcejSGO20u54qyiGVRNd0lKbLFj6f9JZ/BSar3BiDhPNGK3LtQnix7PfyQ9LZ+AFNdNh
	T/u/lOCIcYYQuffd5xm/N3BLdcs9rZHMCdTltl2K0nhFQKrtpHDGilTOW++ckj/uG2/n6/BGUEr
	KqhikZdwm+q51KuBMzG3tqcFh0BfFBm198aoTe1cXSbxV9n8A73u/pqXJTjZPP9lkz9W4UFYP5a
	76wtO1FD4vfLTC707qFOTudNAGwfSJ/jQA3kg=
X-Received: by 2002:a05:620a:4510:b0:8cd:b52c:5983 with SMTP id af79cd13be357-8cdb5b59a6emr1583621185a.42.1773628767438;
        Sun, 15 Mar 2026 19:39:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4510:b0:8cd:b52c:5983 with SMTP id af79cd13be357-8cdb5b59a6emr1583619585a.42.1773628766961;
        Sun, 15 Mar 2026 19:39:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15635786bsm3043389e87.61.2026.03.15.19.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:39:24 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:39:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
Message-ID: <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
X-Proofpoint-GUID: ap3bos82nwriVGreRAt-JupjteEQ2aP1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxOSBTYWx0ZWRfX0zPKcsUaZ/Ea
 RvgxXvorx9SvD1hmbv2DbinveFUEgIaT52J2JueddnMmvwlVtVyCQPKM0O4aZGEn1Lc9YiFNIgN
 XGjv2BiCUEOYIMZ+FRPeiIAbX8XPlfDstY+LeiMrN4/B9WCN2L7ld/lKNotgY0o0oEhLp0jaNXi
 ceruk8IoMjRgKHEuJ6jJByX+P24BGhLCeoeYxBhLpml/u5qKvpdYytRWJ9wZRu/zYcdnWyM+WGy
 OVe4ax8+97EulwXVptG+gq08XN8/QAyIIKbpkqm2BA81kMq352TFdby0oiD285pTsUg81aDrTz0
 OKZ6eBQWoikpSx3yjrPDfVwSPRCNnN5D/lLQUvJMhU+CgxPpKgbDFVDTZvgVprzd9fDd3yD0JSN
 /SpuEyoPwajPsEdtZDu46XaK0fMDXua2MmcZm3nXFg3fkrZ0HPT5bB8hJsMBqTjd9QMCD1sEekR
 Fpc3ErRIqQT2/7+DO2A==
X-Proofpoint-ORIG-GUID: ap3bos82nwriVGreRAt-JupjteEQ2aP1
X-Authority-Analysis: v=2.4 cv=BqqQAIX5 c=1 sm=1 tr=0 ts=69b76d60 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=XP1F8gPGJAlzEhngflAA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160019

On Mon, Mar 16, 2026 at 04:12:35AM +0200, Vladimir Zapolskiy wrote:
> On 3/16/26 03:02, Bryan O'Donoghue wrote:
> > Add "simple-mfd" as a second compatible string to allow child nodes
> > within the CAMSS block to probe as individual platform devices.
> 
> Why are there any child nodes representing platform devices?
> 
> There is no necessity of it, please use a layout similar to CAMSS CCI
> modelling.
> 

I'd say it differently. I think, putting CCI device outside of the CAMSS
node is a mistake. In the hardware all those devices are a part of the
separate block, they share the same NoC fabric, etc.

> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
> >   1 file changed, 6 insertions(+), 2 deletions(-)
> > 

-- 
With best wishes
Dmitry
