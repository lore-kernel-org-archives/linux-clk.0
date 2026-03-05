Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDF4288C3D
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 06:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691177; cv=none; b=K7Ay8OQGwVE/K3R24z2pinV7tZVz9/oWaT/q7k6EiyaN2C5pGakQ9TEEKITHGjUmRXNR44TMD/qbns0C+yH11kAfIRbEaytmRsNitJRfFQkbO36JgAvxlUSj3F56vRmQmFdWxWvIGEj9jzSgxaCLEKI9MF27BXgVghts8m9/yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691177; c=relaxed/simple;
	bh=WVCOymDn+Y5cdjRdxWYnxZvicoc+0ERolPNnNAc+PmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USa43EY2869vHqcf4gnUxxXT/lyKV31qLDH0hYWqzzuawCzn4Fe/84gHabm2NBSUlJmxb8/+L8i0VGEN+L1efU2KyGW4mXxYP0yTW2+TFGAw20LfIl1Kg5ijeWXW8YhNMA8V0h7PMlUete2EDNy7zovcfHJ/y2AGvwpIqvalhnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQzpt9Zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xn+ntWCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQzpt9Zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xn+ntWCk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251Blg13604180
	for <linux-clk@vger.kernel.org>; Thu, 5 Mar 2026 06:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTCPNyRG3DuUYizweQ1ELZW96whpOeRUL1Ipe3ag0fU=; b=BQzpt9ZuYY/FGFhx
	Vyum5D4X5FyLiYvq4CY8wTkIZrRHsznCctKY7ix/VCeo/q6eLL0UH6Kfwq8/wuBJ
	XbDAVBftoZN93+6F0/u1RhJoKXgDjk1UkHwg3koSsIPCJMWR9bsQgR0C8LjUvUvv
	rHWG3zxQdX5kaYaN3rwFUgopqNgxpKatGSEsbTiE/2hDDMSoHjsmVgnlO1268xj3
	TDu/+ouwP6DuydmhMwZFEwb2+a0bbzmhw9DqJaSL8jmhD9lM9Xhv4idGVOeyKi55
	d0wOqAHHl+1l7mqXK3Hokk/SBp+11ZPuVfx9N37h3ryrAsopnmOTm6RZld3o35wU
	ij6A4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wa075-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 05 Mar 2026 06:12:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598c05c806so4047618a91.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 22:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691174; x=1773295974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTCPNyRG3DuUYizweQ1ELZW96whpOeRUL1Ipe3ag0fU=;
        b=Xn+ntWCkxv7BY8B/Q+bFe3PGGJ/Y8QTCHQ9Gxkk64hOvQ9QQeI083wToH0VXFVy84o
         MNXBR5DGwD1Zgk3euUmrlC9FpI4v8zcZDc25mfWiCbjS4ByEoVUeZEL9KIc5p2+4wp7E
         I5otFczFfgrKpbXE6Np/rDP3Nk1isJiN5OfGvFHbrAxBwR5L7+fPgR6EIslMS3jFAkon
         cCkzMZJvInkXLBKEr9JxBV65adl9KzMGZIXmPS/OYoMN6daGhbYMLMlJAb6MVEO15V0v
         pPdGA2nP2Ii+xd13BOAYmCG4hi5r8gJNP2YLsnm5WoWdke0iOmSY0jDB5PMDVxYLYjrY
         2Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691174; x=1773295974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTCPNyRG3DuUYizweQ1ELZW96whpOeRUL1Ipe3ag0fU=;
        b=k2LDbKyNeoahBJRYW8A0KbjKcdqkHsQbCx77pcp6tYiRwDo1eBR6UVvffTZV8UC2dh
         /IZXOD5AhWipa+B7QsqXIs+vHzgy/WjQAXaKIc064mFZu5xlUYw12hJ3q9sB18LKtZOW
         Cd37A8BnDETm0GwI8gx+5u/9R0HR0MYs4Hkd08rfxBR10fLUzUBuJhbNEotgvavRTHYg
         7qvYgedO75ekWToy7P1qp8fL757Ltyo+2lJr2j77s8ZLnryYz/9rrYTxwavJ58M7ZGqM
         xbz+gT/Ow7nWLo4lJw1jQx9ccU31pPKJhnlFtZhXm1B+nKaPBybiQjJ3Rn/y8mdKahKr
         XNOA==
X-Forwarded-Encrypted: i=1; AJvYcCWaIe06XHAc5lCLDUjf3gjHJPG6kmR3himcrj+JS/w2qVWBSO6/K8OxSHv2WbAkvkjVispIbqXQ+Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6uyYqy0jpiy65M+8U6Uv7CsagljgKJ1AtjojyVyvvCNOqNJKN
	yXRUR0vp3v5XIW+4ckKHpe38d4S/cGW1hze2F5R4F+uh3ldAJmbCXt9jxV7/wAL4W3EZIsSfMsD
	7uVXWMt1Fp8khr4YpXDfOG9H18aCLVD578i63xdv5gxrBN14RDOYRexzzb4WQHVCsXH7r/es=
X-Gm-Gg: ATEYQzzZwGamMbxg8BJPciaCqsgRc0uoA2eJ8SWtXeYjojQ8ki4sm9NGvChkQD7Q5Ma
	KBkbkMLqpHpUZNkNccXp90tRb+PN64CgQ5ELrtu6mSLwbj/WyuAwyuyMU0EgAy5+fxqHendo8aQ
	5b0ZDSwNGMwOxiLNycKN0eOeak4P8Ypweza7yVFN0L8OhLkRACe/pOxvxMHjLntJoGWPa8wR05x
	mYztYuanLkwQG0kDyXGlLVxBWsh17dybiWcDGowjqU5Sg33l8ur/Z16wQaJHfZut6XRELU55NWt
	N+EQuEfSMCvLQRuUijHz7xVRHM5eFfNW2cedG2S2i3CR0c+Vz9Bwe8iH0Hyv/KZnyKiId6jZ4FI
	NJBIbTiXK0482Cuu14/YAAGaDdO7y6+LfrrxvPWoMvMOjN5dvGQ==
X-Received: by 2002:a17:90b:2883:b0:353:6373:590b with SMTP id 98e67ed59e1d1-359a69b55bdmr3946251a91.7.1772691174442;
        Wed, 04 Mar 2026 22:12:54 -0800 (PST)
X-Received: by 2002:a17:90b:2883:b0:353:6373:590b with SMTP id 98e67ed59e1d1-359a69b55bdmr3946233a91.7.1772691173940;
        Wed, 04 Mar 2026 22:12:53 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d2b187sm981141a91.2.2026.03.04.22.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:12:53 -0800 (PST)
Message-ID: <fa38dc8b-fbfc-42ce-81ba-9431af1a8f4c@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: dispcc-glymur: Fix DSI byte clock rate
 setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7s6diuQbVryFjMb_3IzsIckIImIBK9Ps
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a91ee7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LxZnbXQGLr2tCt7RAxkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX6SvlQ/UIe6cz
 j8oi5T9HVTHbCSrr2ZZkpqNch3eHuJBgrVxO/Q4pJIaedwTRhVcPcZLU+e7mnemyb9lumhByDfG
 etc1/nwVYZzWpSeBPwYOpM6wz64kaAuXdEs57sFvB6UmkWSLJpJu317LjdW8p6A1S9kTg661WlQ
 EoToXU5UaWlYG3su4FQCBCm2oq+1zODi3VCJl4BTI3xg05RCeH57+8q+rD6+1mBFLtCA7qWlr7z
 Zkl4FLku+kEEQxMS+6l5mr6NAtU3s9sFE++4+JITGND5FXZR79y4F0dXmlEtISejHtzJ0R1pJ8Z
 3UPE/ZV6f4NakX1nS7xtHMjrlGMLrJE6MJAkN8xTnAXtYQ2MCwc8JIurjDFkVFkN7XBUVe7jwHr
 1ksheqQ7s9ikeSZijE2d0ROSYDz/NxR/c10dRWCL44nwqmZgQbEWqHLYfg/CagcxU2QW4MmdACc
 9aOTQ3F/0kj5J2I8b6g==
X-Proofpoint-ORIG-GUID: 7s6diuQbVryFjMb_3IzsIckIImIBK9Ps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046


> diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
> index 94053452e871..a8c3cbf591d1 100644
> --- a/drivers/clk/qcom/dispcc-glymur.c
> +++ b/drivers/clk/qcom/dispcc-glymur.c
> @@ -747,7 +747,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>  			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };
> @@ -762,7 +761,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>  			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

