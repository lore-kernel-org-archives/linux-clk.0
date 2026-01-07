Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987133F8D8
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802735; cv=none; b=Ke4pWqQNYYCBK6P+6LbRHNfI7Q2iIsI2Cvt2LnrWSs45XGqXsrQnejFpRW3+HPWTcNAizZOAnNUHSLckAAVDX10dE6JGVpCRDWOdz5PXiu8n7T3fCk8tMLA0cDl2IqokYn9+PagfnfBLgKew4E97M1SESfGwFE25RTlrgl+wSAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802735; c=relaxed/simple;
	bh=1pDR5v6cY7VSTmp4cJaRlX88gPqHH4JLmaZ7icbCC0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKcO10HPxEiuGuA+JNahwHLQg+N1+g2O2H6d8xFD3z5xS6662W35k6yEKwNfRQ5YEnceryNUHQa0JyAR0bC7FNQ35vvHlKGs2hljR7BBnaghH/zYLKQXMw2qG3Od2lTvSP48L/Xi8wGlGkFzQKwkq7Ch8UQmJJ9h+Rk911//L/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEqxtVM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlaXcDaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pEqxtVM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlaXcDaL"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607EaN512379134
	for <linux-clk@vger.kernel.org>; Wed, 7 Jan 2026 16:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HwZBs/pI4tqrM+YdLcnJrTnM
	DuBq2S6J78a0HWSkjHk=; b=pEqxtVM7ihUy+zNFC6MGh7WxN7cbgbo08zA/hynY
	4qHlzmqRIEP0uOC/QZOS03kyXGH5cV6Jg1Zs7DorHDtEsn0pmksseXi9TztcuRcz
	HFPBO+TTEU1Gnn6x5m4n2gwHD97Qb0AYcPFYKpv/prYihzGuaHkWbGECD3AwA8YM
	hiuQ/x2DQg9FmXWIk3V+jB8rYHeA3S2OhQBI5+7mslQFkWvaG2HKPwWA4rmbB1Yz
	Ra7FvnhBpgzwyhxD2jxvUV4l8utAzuJszDeEqpfnZabgaz+OIHGPgEWeXvBGAeMf
	e1rQPyb225OO+q0LrD2i9CW+DPXQ2nljlVewAoQl6AikJg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4srsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 16:18:47 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5e81d6c2ff5so2307356137.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 08:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767802726; x=1768407526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
        b=AlaXcDaLw7xe0fQp/Q/Om2nKcKLJhV6RCXNeODHX3TREu5cUqyzAtGc4v92H6H4VV3
         N3G9kRevk2WZbzX5+HVnpAI97Hqw9RFXcX5AiWdjVnzY4+Zjk7yRgJLMGCrMMgKabnTF
         /vUAdGtXuYuH4oWpwj3joSpILdQITflvCVQvJBGxAAao3/hw8mHcz420RJwyMC3QKPPA
         2GJ4xb5paJ14nbEfId7KeCmRfDgHl2fMEVKP0jKxuW/S6TV4HAoO+Td36lkJMvMHbNk1
         XvfRjFpL49RmhaOUsPIKpviIaxQw722PJmdjHl3vbJL8A+s/vcw2h1sfOdrmeUrpPki8
         Rn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802726; x=1768407526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HwZBs/pI4tqrM+YdLcnJrTnMDuBq2S6J78a0HWSkjHk=;
        b=SI90Ipk6l4Lgvjy5vzbKGMksY6CEusO/SYRfgsUTArXcsMrvU5v2noYlVdVjxarVJR
         6f9TbQDlN6h5//HYNwPSlF6l7B+7RvDVe6/s0S+MmErJ+ZFg+w5XqaCA2jGu+8kP5o68
         438z/efyuy6ZfikhyreBs2Rk7sKUtUI7JXhJVWcJmsNtNApM/DlKGEbnrP0rmQfFg4Wl
         t91fhdXYJAj1xkW6n3iJhbCNPY+CcaL/4HrDhYX6bDgoTryXrh01W3EZWbm1UfTa7he1
         +neShgcPvSMzLTtn9RDfNCVNC9iS8b8vvofSjgw95Y8v4lUPhJwHj12BAEaPS2lWQ3fb
         qmXw==
X-Forwarded-Encrypted: i=1; AJvYcCX0afy7BWVBfXJgR3Kszp3/OQwzs5leoMrSrc3EfAS5bG/dqkwaJnJ4EB7WAv+dcg8ooYc6/mGQAI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFZQCE3D6hQtu/b9MJCrlnjrKD5GTLCGTDH8zi4AmWk6+bbey7
	hooHRzn0lYXZrC8zFO8vREZXwOHwj+U7CqMU2hLUnlCsWBZ2MJkXBFKZ5dbJxazrMEiYy1jkM1x
	HFtqwGbc73kNBu/pKT+d/pSFo6gl71FydVCK1LRwcjxSDE67XoUrA4kpZ6G88rW4=
X-Gm-Gg: AY/fxX41TeqKOuw+sIhmVWBKgMrD5hwBhP7nzeu67ks2F4alna43K8w+XspPOMwwCnN
	BAApG50UPz/aAwkeKb+9yj2tyO6pecGo7mt8yna6RCMsti2YJzkHdEKvwbpYmZAE48j9zMEQckP
	Z0iNGFAbPy3D21HC8qecXCpAebHP/kyhN9qfRR+5M3Fl6XZ48I0n3+GxNjzyqBx3VDj6aohw1Au
	muJJ59ziNyilC711uRCRcisrq6nEW4F2tOBqPXgjYrhHo0lvOzAywn1FNFhqmaUztuCwBfHf+Ak
	c8B0Rantc8IgBxvKek0+E2W2dfYrIp4kz2RI9oqw8u3nr7knIN1af+cR8o4Jl+qCIV3yHaxcY/+
	uPUez8D307EPQz3WQf5Gw++jQegULE+8DWJ3TzopSLdYRm230V27yocLSNr9Zz0A/zpRUxhM+3l
	JSfbhboNFEq66TpwY10SoARwg=
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5ecb694854bmr888632137.24.1767802724723;
        Wed, 07 Jan 2026 08:18:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHB5ZRn1QY/K6daz0KlPYsnYXAnz+5ET9h4x0F463Jjq+1VY5FCZCLE1JA9Bad2LVDmCS3+A==
X-Received: by 2002:a05:6102:fa5:b0:5df:b2cd:12b4 with SMTP id ada2fe7eead31-5ecb694854bmr888602137.24.1767802723486;
        Wed, 07 Jan 2026 08:18:43 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9c39sm12016941fa.23.2026.01.07.08.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:18:42 -0800 (PST)
Date: Wed, 7 Jan 2026 18:18:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 11/11] clk: qcom: Add support for GPUCC and GXCLK for
 Kaanapali
Message-ID: <lsvn2xjz6zxefs772tg26jg2cvfohbjcetrlxfn7mtq6ag5aig@ep6ofq4mrfrh>
References: <20260107-kaanapali-mmcc-v3-v3-0-8e10adc236a8@oss.qualcomm.com>
 <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-kaanapali-mmcc-v3-v3-11-8e10adc236a8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e8767 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-momvpiiut8LGs_r7JQA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEyNyBTYWx0ZWRfX6onZgOdxGlTS
 KITpLGqW7AjFvzC2Zrolq+BxM/gK1KutPpP4RZS/hS4y4ULBqx7mTcPZg5VLGe/Pt10MuL+Vdz9
 x2tWQAilg/9s7QZISz8H8FNuimBeZo7aiiOQRpZZvi9hrLAAM9gyqzfogD6paKt65WtqJuuA6Q3
 dOfe3ltkxpyyr0+j0q8SXUIe5zPfpgsdK+xhbgxkwU1Rvg8bdzpkpFz3NF8VEFFr/dPNqgxlIPP
 waQQ+Dyd20152B7+Kvu1wjxHf7mKak2qqYbXHb9+yEuU6Jd7MA9VsBEWKdnSYws51wM4INiMeem
 0uJnHI0+u/5mgj//XomTmNtOv3z6+sFU3CBtr2rlT1pdTUFK/Ia69GtMfux9TmYu+egwgLGjOch
 Jqynj9eG+ncVV9VUNeOyVPQnr2Yy3LDOo/arex0NBY24jQuaz93SNtfdR8Z7R7z61d34BKtelag
 g0rqKeOyKI/CaMyruPg==
X-Proofpoint-GUID: le-V2xvYcaEWxgyS4vzUDj6WInuZW3nx
X-Proofpoint-ORIG-GUID: le-V2xvYcaEWxgyS4vzUDj6WInuZW3nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070127

On Wed, Jan 07, 2026 at 03:13:14PM +0530, Taniya Das wrote:
> Support the graphics clock controller for Kaanapali for Graphics SW
> driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
> block dedicated to managing clocks for the GPU subsystem on GX power
> domain. The GX clock controller driver manages only the GX GDSC and the
> rest of the resources of the controller are managed by the firmware.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig              |   9 +
>  drivers/clk/qcom/Makefile             |   1 +
>  drivers/clk/qcom/gpucc-kaanapali.c    | 482 ++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gxclkctl-kaanapali.c |  76 ++++++
>  4 files changed, 568 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
