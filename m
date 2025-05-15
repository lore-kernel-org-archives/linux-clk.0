Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2212C20B80B
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323458; cv=none; b=tBOAXars8SUYAmls0XowlbhYGLrvOKvtD/zd/FI2wGEMgvFFbWdCgg4ZXn67l3fXZpX2Qk2ny46otXi+wni7Rl+Y6dqWSCA3TfgfONl7P1e4WMplrRZCVetzUi5Wx9ohqO7+uwPk+/dBy2rZea4q8AWSCmhnJVjD9/iHTSyumMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323458; c=relaxed/simple;
	bh=atIQpaQtopMpwJYgji9E+C/yVnZRqcR9Uu8nkCMzx9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QXKy/hkhmgzIF+90Rdj9Q4mKOOkbiU5ayf8jcuA/zyVYi6J4TuXdo3Ojb1s6z0wRVM3L62U8T/vA2+/d6FxzG9ER+IoeLqGb9Vl+nOTI7nd3sV1xFoh6xmI54G5eDvpXjSW8TGM4kcuKywAVChjNwgeIc7aT6ku6Sno9UEooodY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmCZHdeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NmCZHdeX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFY0W025721
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rLPxO64FqhcmIW9NSqbt9hKhOmOMomaefB8JAbvRe84=; b=NmCZHdeX7ZLIWbNm
	LlW+7vHn6PNHkGcoVrtku47I7KnVvh8D26U142nVo0jqfPEs6azNam5k/4J0TXcA
	wTTSqrBN+0garmh9IPRQ3/aw0QrggRo78yj16Ucx7PW1IwkPXjfoerbrDIcZ07cn
	P9XgZCzYpMIYrUq0oTVhlxbyXerDvqJHn08RQXJ+ko7z3TjxJiUCzBnbQUN33DIV
	WTJIsi7YVUx0e2VHAUHlVcjOT95Mebm+F1nSijQw0jBpU2LQJ2XUyvFhKWsSkCvs
	ZrHnxZMU3+KT6lGlpNTfMsKXe9o9nSltRr/KN7g5iXu/zLRM7T9XeEM691zWp64M
	+xRFiA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxpxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 15:37:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ac35546eso351876d6.2
        for <linux-clk@vger.kernel.org>; Thu, 15 May 2025 08:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323454; x=1747928254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLPxO64FqhcmIW9NSqbt9hKhOmOMomaefB8JAbvRe84=;
        b=Pvm12g9BT40U9iWMWR3venwgXeP1Ipy/j5rPc27VfsKqhF0yKEPqel7rXM60TTH30i
         +SNHAF1zbZ7fm/GlRq0uavfQQOfU/mI2ubDpU0ByhsxXcLGGFNEdGsovAOHIC8qTBUBz
         75qy7TAgHHuKnfYsCsBSmozuqjWz7ugobHoy5/OZm7sxNoQoQgAHEFiulfb8roPkNxW7
         0rO0QeeJG+dX6iBOk1dzWBHC/QE4vz2B/op0NyQkGLq99eBU3NCT3xC7jiVGa+GYFKq6
         k/2gVdtSRHJMFdaH3uuzrQGxbfF6KkH9MxJLFnyiABpB98oITZlvIxaqOVSXs1xAWeKu
         apzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg7uAiHcijmd/WNMiULvjkYLX+iPo+1YofMC/imxKxhPOuE66ywKMWdoK18MBl+8iaYUShzHKtFJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0OAqHQLx9IiBkoVaYZaWVRaZjdl6hj9Q/5xOHiu+bsmT7jOgA
	QD5ci4X/cLUA9l9fHPCzbO/1G/zMm04xBW6GT05qelDT9ABzqgIXJx4wABEDK85HkbAK6WGX/Yu
	Ykt3D9f8aerWBkW6Y9GvG+BjTMpW5UXXoUpPoYdNwioWgwGEaaWYA+tXHLpZ8pYc=
X-Gm-Gg: ASbGnctueR3DKlAG7vc6mmQxlc6znY4lMuSOmFcnV7PDDUQlrgP4i3hpwzYhaZ/2sdg
	bVUrcJPVqCKmiLSXrblE+JMY99yT0MYrljewYVl8hsKpxgYOFXaQ1DXykfX3K9rN6xfSlh7AJRD
	jm83ufMoAjDXr7G4JL45qf+Xg0py/PNugPS2TSXPuX//5HZH9J2E7kRZaXHVrGLKiwg4vlRky1h
	AoezxoLe5F0l+d6cRMO05HDxi282QsetXMZsVAfZuTSDdqX1KBjDJmqpGjgOGguBEeYnpuNlNy2
	ZCj3WkUyFyZ2SPnEE0SaVbbIJbd1T+CGKWKUukPXewyJUQG24FlHTOnL5S0BIpW2aQ==
X-Received: by 2002:a05:6214:2309:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f8b08400ccmr964206d6.5.1747323453886;
        Thu, 15 May 2025 08:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5SKIS8bxAwsl16PrLjGcS3ujMsxqEj4y1zULjib1Z01idF3D6tCNQakAyR+kLSeki/BaSnw==
X-Received: by 2002:a05:6214:2309:b0:6e8:f645:2639 with SMTP id 6a1803df08f44-6f8b08400ccmr963926d6.5.1747323453394;
        Thu, 15 May 2025 08:37:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047be1sm6506966b.26.2025.05.15.08.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:37:32 -0700 (PDT)
Message-ID: <ea2f5477-e75f-4e07-ba0f-7926ec490639@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:37:29 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/18] clk: qcom: videocc-sm8450: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-7-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-7-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xezbMK3pVi0TxLIHiev8Vk92-xXJ87k8
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68260a3f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CXQnK64LRHhqnx0rWp8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX+604sUCH/iXc
 P/PgJrPlhJ7liH1hHM09tDjLYDFuS5kLtRCDsZ0kKvQwGnJYJFDpPAEG9hzAcY5B9L+NA6FOxCU
 ehFe1c0XnFc4IolbvqsBbavw0zWqxg/A+8xAr1Xur0fPh3EJQrYRTtsoYib+d8jq5xA+Atm72s8
 VTLofM8Bax3ch3/dZdOUQCL3fSCOtBM8hMRrF2O/Or042va0oEbg7UjlDBn/67ApebwXnD/8ucp
 sOG4rQ8MYCDIDGDBdkDXhSTS5Msdi4KV//C+ecU3FUGxUFVHYDYM9sd0BNgzgqeqDzf3KJ22ytY
 3bA8Nklo3GyxN1L4K5zWwNYyHIbCAWb0aqaXBJu09MkwVarX9LuskWQ111uck+v/Sp4tAY2ODhQ
 MebProve6Xm9SHes3I9LX2tjTRoYxClA7Nvt4QWEDCEezEZRguIqspPCq5qatSmMpsK3VUDY
X-Proofpoint-GUID: xezbMK3pVi0TxLIHiev8Vk92-xXJ87k8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Video PLLs on SM8450/SM8475 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enable critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
