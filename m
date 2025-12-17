Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9459E237163
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965908; cv=none; b=rjfOUB2W4z5bVRfYqTffyjOoqDhPMVfjp6cqZkJnNstezVY+4lvIEhN0UFdNn5O1hi96Y6KljLYIDzOuaGmcQzyh8HC8kqxo22uR0MqislMtzm/WnK4X0GDT+AHlN7QGGPvfuiD7H1st24sQNU1OBnF/RYQACQH8eO2WndtoZSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965908; c=relaxed/simple;
	bh=gZz3B9iIJzC/jmBs/0TCW0/gvf/+P5s7w8dHI1HIvQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/FMF5KNPwP6VlvE5BiNZlVLKgCiJ9F4vUebjf1cg35LlUbywoFmUI0oimoAyxaIAsUghsy6M7LXhaYLy3cSAufugQDPJZg8+Okic3xDcXgWDJZr346K6iuR3G7VIDghFRF2I2pHs5BwFauaRmlw/GuWg0LVzB6FmJaKxtQmdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEuQIfqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhwYLlWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEuQIfqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhwYLlWy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pWT7009161
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3NJNOmNAyFKrjcNT0S5mV7RCgG5RqpzfwwSj7O8e2M=; b=QEuQIfqjtFSzFxDa
	r502rq2ok7tpkYLWABCygY8WLLHjnZOB6vP7Tr+xn68l3M0gOvOuqKJOf5weWKIJ
	roi8ToaLyyZvAowmPIhi0DvuaOQa6haqEwFyoWJuR6GvjCBm09NQPTkfguJ/MIgL
	VwebXygML2+sNSLVD3wIQOI5StnZAktbGUrguAC+FZNr0oYGx6UdniTg796h97ad
	OoktumscbmgKYLNjLb4uRHSIFtlgzC5qQ4h88fI9nHI73K1ZyEO1RQ4eL9V6qaZ+
	cKGXC5j+MeiWYOdl0fWYSUP1AOaAc45oI0VgvW3/vZeona3Y0xh8c3uCrY9SfnxH
	Fe+pew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e01sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 10:05:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b196719e0fso127799885a.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965903; x=1766570703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3NJNOmNAyFKrjcNT0S5mV7RCgG5RqpzfwwSj7O8e2M=;
        b=EhwYLlWyk60VvIayQykJrYZhPNZ5ybOKZ+S8mhWchTZZ1ZlQw26kNzgyRZx8l6djyL
         D7+5T2pbDBHka8U0pygQ9CBO0GjOruPlRuyiSR0Q4MSR8HNCrFagB3gLhl0KX30Xvm8j
         me+Rb/YRUbqTUJtw+SRzRc9EQyQBIAZLI+q1O+vQFFt4x0KBjD9HPXodNDt3sYzbBuaj
         bWgjXzO5fOIZfjNkg6tzKOV1zdDXaROWD3p45FXxlZ/JYVSpMyH7dXaiW6AyPT78LYo0
         zR0XJxXbP47MHcoTqIyABFrvVqpfxAVaVRZow9cR12/TTuwJPVfIL3JefZ6B2/7kBrjp
         AYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965903; x=1766570703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3NJNOmNAyFKrjcNT0S5mV7RCgG5RqpzfwwSj7O8e2M=;
        b=eKWnaJSo5cl+afQK03cyhbv9rGFDjz66RpZxII3hoXl1YybAjpnIxl7gKMdaaES6AJ
         lEFyFpYb6KSMIr4g7TnuH1bT8nhwYuaT28DFLtrLTSo/cFtHPCRlSb2Lgqg9jDQv03gA
         NxPve+hZGCqLNbRQrtDpI9PFZoTPKPZn5vaj7haqWT2BEY/GKvJWywsqFhRvAuRA2nc7
         JtTOZfhJ5nsE9o3UUULJ88z0RIAF5ulz89lDeuZs1UF9tpknn1G44N6urLpoVs83RB2U
         V6Rc0JSxx7NBj47aerVOIFRtzEnpfv07PLjjbS6Ng7tZjqqq6u2zccEnSoKzZQ3HAxFV
         OkGw==
X-Forwarded-Encrypted: i=1; AJvYcCXd5+W6j5g9A3+WAWFAYNYUCtGJc3hihNPhY0p605eRjEZwbHQCu9amJQUXodybRFfdYlaWkWB45/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwoCHOLJ7uA7/lvELJt0C35VVcUimJC2mEbD+d1+YtjgsiQyr+
	h7bI7RWqWd389bAsDGcOLXONfWVnl/0yvqBZLbQgoKNYRSBupu+hCjHC9FqunDSGE//Pyr693v9
	KkPQUiIYUvfHmzprpT2iMGoIre+fta/loqhuV8jFiQSpB33MKw/qqyZ1N+LnomEI=
X-Gm-Gg: AY/fxX6CHLZVITBROCilf/uN/VPTL/ubc5MLY8lu/09Z0xivcqRZgZvAiNyddFyjJI6
	R+xe0z/5qAafShWM4aykecCNLd48I6lEed3bRN1cg5kSZ6kh89RkQwxBDejkkn/gOp0ZxzCBwi5
	Tais6rUYb1KJpeEJFu1RMI3rdLNRFXiON9/2+bCVBpWc9UKTfwW9u/H2oo5OUSmRyKkQQmDpzBp
	SDaMFpXqnsfpGpmceucKLVAoCCsjprTzDoPtoPdels2oiJFRKUuQiETEvfo7J91DNpAeMyrGrDF
	d1H7U2fb06k+lvoDy327bakgn8smJnt57sPVjqYBSt9q/2n+sEJgs1IXyu7RMaLlP79IykCk1jo
	coiku4pfhvcBktI69V76+sxjwcV8e0ngyby7rAERFe9HPjcT54WFPxrOs0kjq2e7bUA==
X-Received: by 2002:a05:620a:3193:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8bb3a3a54b3mr1775808285a.8.1765965902756;
        Wed, 17 Dec 2025 02:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyT8wqW5vJWs30oNRZ8PJnnBqtLGOozur9GpczUF35gV60z+b4nAtlhuY/qisqT0pp8Zvmlg==
X-Received: by 2002:a05:620a:3193:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8bb3a3a54b3mr1775806085a.8.1765965902296;
        Wed, 17 Dec 2025 02:05:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4880dcsm1994074a12.0.2025.12.17.02.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:05:01 -0800 (PST)
Message-ID: <470f8e79-4fa3-4d02-8e24-3cca5c4fe33a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:04:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Return correct error code in
 qcom_cc_probe_by_index()
To: Haotian Zhang <vulab@iscas.ac.cn>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251217041338.2432-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217041338.2432-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MCBTYWx0ZWRfXwYGd7VkDAWNy
 JWnvfazstYwM8MVVI0mYhuSAaqYJJ2ZtNv6ckC27puZho35NvaV7QJzbcIyzzr5EvdshRC33k/9
 Su1wcidiNtvdjTOkoDGQIhC8Ocew8DebzDr+gihmDmn/evjpXAofH1RPLgNOdz/TjF8lf33qj6C
 5XcyMeCO2iwDz5miWnNwlhOnj3wmKFjQbQ7inkokf7oGmNlnfoBfWgFH+C0nZmUtTbHi013WviH
 ZDK5S8lc6AWX0YYiwjuDNcSyG2gWwLkQUDyvmTzal4c9v39xAwIes6CuiFg/GYApxb69fyNooum
 BNtcILqJCl0x9IZFB77lHSwYl/b5G9E3DdxoQWEyFLBvKPQVMhtEzwdzorf7bgAl5DgGUdsKp+b
 lWSSS5MAzXaAc/Y6/+Wry6W1rMxn1Q==
X-Proofpoint-GUID: blwJDjTfl4zmQLONFRQAA-NM59ORpVfp
X-Proofpoint-ORIG-GUID: blwJDjTfl4zmQLONFRQAA-NM59ORpVfp
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942804f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=P94ZdOjJmrbMzeDvDm4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170080

On 12/17/25 5:13 AM, Haotian Zhang wrote:
> When devm_platform_ioremap_resource() fails, it returns various
> error codes. Returning a hardcoded -ENOMEM masks the actual
> failure reason.
> 
> Use PTR_ERR() to propagate the actual error code returned by
> devm_platform_ioremap_resource() instead of -ENOMEM.
> 
> Fixes: 75e0a1e30191 ("clk: qcom: define probe by index API as common API")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/qcom/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 121591886774..eec369d2173b 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -454,7 +454,7 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  
>  	base = devm_platform_ioremap_resource(pdev, index);
>  	if (IS_ERR(base))
> -		return -ENOMEM;
> +		return PTR_ERR(base);

Nice find!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
