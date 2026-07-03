Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A38F341050
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063460; cv=none; b=rLtik47RL3ffDpB+uv3nzxIx5QhU0P082Q3a674zxs/qhtppwBRvnFUFLy/uddv2DEuNMAJv+7fK8+UL1KSfh23k0J5NSogtIFeUZdGJ4tC5fsivlCGqXEjK3foLp4kreTd1LZXje+05GeSlFOSGJWzqmQRPw7J7OO2HR8VFZZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063460; c=relaxed/simple;
	bh=Q0fDnW//0DVjhRM9DnpeSvIyrLriPP4Imkgl9WHWCEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FjYsLXhyNKI855lePnQGBKTRuv41qKjcz3Jizgl+C8+BD+a5vV35Hz9jriLwggTCvQrz1zJxeeMcXcbLXjIukxuXKAl4LYIRwpr8O94X1p9GLwrgXO6GISjN57MO8/Av0ZmqcrLEMw6Kf8CfrK97kT2hIhUKCMYiqfCqM3bIV/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aOysZMOf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IeUh3DJK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aOysZMOf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IeUh3DJK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rpxP3088123
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 07:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/pqTUt+VF8vUojOmX5c0NQ1Sdc5QcENgEKOJ0UwpQR4=; b=aOysZMOf/mPAnkQL
	r1+E5CpZcy7Q0BUihO48v4O8OAe8BgI+B8mdfbFs/zAJdGnauqFvPn2dV/9zu5c8
	LBKZI4LSNRvnLh8q5k1DjB1bpDe2HUG8yvnEk8uVXNOw7GIkBIGOwrqp2hFh5V52
	2WZp9vKDwT7X9ISXVA1pjYdFicNy7usTJcIt4ThMaeLeW3sfXtUQbxv8HY5/LYDm
	15aUssN6BlXXiRbYzdORLvtyrFgHwMV8jrplwO+ma31siohhwWIGguBVUfv/6Geu
	PeMVvHzmviiNX0dmvmtHJ5dYuevQ7yOxlreUEc03PNVCubETk2HrWxEml0dfkKSy
	2bwgpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s253un5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 07:24:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso965761cf.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 00:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783063458; x=1783668258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pqTUt+VF8vUojOmX5c0NQ1Sdc5QcENgEKOJ0UwpQR4=;
        b=IeUh3DJKu0PpWCa8tPEf4Pyoz2Bp5iDDhxsFYCRsRqG4bJroqyB52oOZwvTU9DzX/E
         Siwo+xYKx07esd32ZuqW5uh7mBlGHAIictoAbMOxEusnyOi3FTZSQzZqA30Du1jG+P26
         JlFtXsIYGcE8X+hY0318X8N2FuqFDlrFa++8+wC2G+u750gNxRh3xbwx/a6EObv1IsyG
         py4aJAr76NckH8qahlVwIqK6GIeL0BO+Yng8eghFJxrmMbAofY4/vBRR4o4nMmzZfima
         itY76cxbtuYs3iGpj2CtTG4RgDwpB8hBwVwxySKcOJ4mHidkYg2VPWn1m5vvxRfvNytU
         WkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783063458; x=1783668258;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/pqTUt+VF8vUojOmX5c0NQ1Sdc5QcENgEKOJ0UwpQR4=;
        b=EacbVzaTLuRazfwJJd6XoA5ChN/0qzaPNM74neLgDVAnZSpSIErmK9Q0v5k5RNurU7
         SkZhA0s6NlOG4SzFOCbWvr6gvGlBoxiN7e9SngqbjJ+05TuVUtNmpTUx9N5A+lNzgD0T
         IXrXOoH2hl+sRw9Qd7FDF9H/1d/JBxEatwn9MIVjasgjGaTjfGoWFwBwvcS67CpLzzQk
         SDSxOJA7esA4R+3yu5T2CM3URLwvX14A6iO/Zu663wEW+0WtHRRqSEGoUSMU6pGh4Nmt
         Aahmfbt0l5Q6R7Vn8SVPgLsIYPcZQ5gw5chPo80FbbI79l3j062EAyv7iwESPJFzOvdF
         I/xw==
X-Forwarded-Encrypted: i=1; AFNElJ+fM1+p1SZA+wADPkwEqFFmAQvEsOdNz1W5rOvPtgVIBva8ZcMFkBfrbXRjkwwfta7gFaTjsSxeOAs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgg7U3JmYa10xVLsMOETQSRzANCHIUcoHVF20BLrN622xob4F8
	a8HVH9xliHU2KRO5I3RxHzKuTvDjybzL6VTjrdT5pp6grIZUSCUifvo5VKaPnOFAfXWJD8qVWw5
	ZfhAUaH0kgjH0GLQcNizVnZ9gQMXNfr6Gq6wedE26LDEvugklj2qHeg0IBySKvHE=
X-Gm-Gg: AfdE7cmcBsGvVmbFyJKLAJ9S94L23Sp3U0R6/isWlbEEFxdJcNCuls/Zkpybfo2DPHD
	55uXVLFYTZiM7g4LvJyrO2pDprYvnlLDR/sH6XJreMGcIjwBw5x04SNa3wNI1hlyy5uUeaIXuVP
	FnyKVugui4BD9gkGs8QV88e1TruyhrnCS0AULh7YHrzhP8G1hOcWGG3kphUytnF0GTkiF9Eu2Ct
	98OwVyXpGw6ZwJ3Hvz/tR7i9dvgCkqCtVK6x6dH0mLoCe6jSRmGCj5kVr5T9t9epKwiUmcsxav6
	mkCz/sIFnUccxAx4rDESeCiOSPVJHGdMn78DRk/z/FUsjYxhIpb0KpUepuPAyBvAQrzq4AuAe1Y
	SgXVItIR3lmWpWuDLIyq7ZtN8WTM3976LRb0=
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr83017431cf.0.1783063457714;
        Fri, 03 Jul 2026 00:24:17 -0700 (PDT)
X-Received: by 2002:ac8:5f13:0:b0:51a:8945:312d with SMTP id d75a77b69052e-51c2693f7acmr83017291cf.0.1783063457360;
        Fri, 03 Jul 2026 00:24:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ace16064sm1967767a12.2.2026.07.03.00.24.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:24:15 -0700 (PDT)
Message-ID: <94abf47a-0fdd-4dcc-b56f-963ba80ba33e@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:24:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/19] clk: qcom: dispcc-qcm2290: Set HW_CTRL_TRIGGER
 flag for GDSC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-8-cc13826d4d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4763a2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=PukIAH8WhZ6bR1PtwjsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dPmM5hvJ7OpF-LKgP_VaY6nSTK5Fxf2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfX9rGX+9cCtFF1
 zKvIItaxElzJAqy36o+YyLZoNZhM+p/C511spr4Ny9vsacp4GLVlLM4AdRgmm0XutrNGuUrrcbP
 OPaZKi0RLMiSQKumc7hP8x2e/TxG0frQFrq2ie9q/O+IZXTwUf2godMtGz82NAkYjqF7WlHtOXN
 duQSiNPcr2g907ZqKMfGrBOUjSm0rGyNXk6Rl/gLSMl1cFCHyTXf0Dpri+/len6zI49igtsM38q
 e4+mXVtrQTYyuA5E0XH32ehMkWJYWtViAMIb0C8LuJtlkVFzUHBAchxIQru14hR1MM2SJVOWabl
 27pQgCb2JlN8g0Jk+IDuQmvgiqhuee1Q5inSm6rdu2zGMkXef/6zC/kgTXb7lvyfBl5qGoqmpNK
 3d6VX7/Fr8yzxh1Dab/r/1t7uhWszBzDmbP35UqkOXqHaMRBRP4rw0enSJs0xH7HVbu8/zSvjes
 tTAaTZ3ZJzz+OhXOJgA==
X-Proofpoint-GUID: dPmM5hvJ7OpF-LKgP_VaY6nSTK5Fxf2J
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA2OCBTYWx0ZWRfXxjKvppLesaRw
 zqn/tUrAoYiJ+3Osp5zxnHlEcCS1sSOxFkhP9DVT6NkzUa9PbwkK94RSGGDT8L0i35x5MQR0H8z
 KOAPIH4fCo6llXMrf/REKyOXp2EnGvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030068

On 7/2/26 8:31 PM, Imran Shaik wrote:
> Set HW_CTRL_TRIGGER flag for the MDSS GDSC to provide dynamic control to
> switch the GDSC HW and SW modes at runtime.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
> index 6f8c21f05ba4536d45c2a609d152f871cb875bbb..89a6cdd26217381cd44a515766363cf94d0aaeeb 100644
> --- a/drivers/clk/qcom/dispcc-qcm2290.c
> +++ b/drivers/clk/qcom/dispcc-qcm2290.c
> @@ -467,7 +467,7 @@ static struct gdsc mdss_gdsc = {
>  		.name = "mdss_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL_TRIGGER,

No other dispcc driver sets this (other than kaanapali). Downstream uses
this for when DISP RSC (which agatti doesn't have [1]) is supposed to
idle

Konrad

[1] (well maybe it does but there's no RPMH so essentially it's not there)
