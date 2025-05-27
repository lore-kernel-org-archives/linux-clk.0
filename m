Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59A3C30
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343645; cv=none; b=GtAkGvIXAWQMUv8ZXm2lYqs2U/9LxRYu5q2ny+ru7nT7REK38dy60R80Bz9LKXQoLvtNalfzhpDirDNLOiI0HeedeKI4ubskz+iJpUypmXTBDNfEPTrK9418Ma4StYpqFuojSGYGZO1Ek9zhg7wTOh7BBQpgVzHS1boELK+0UNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343645; c=relaxed/simple;
	bh=U6pKDs2mOQBNxfLvwMT/KbWRi6T7oO/1foUXXEwPqko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5GpoV3ZOgGAZiB92HapBytIkv2FwEzdalg2OcFIpjjAooCnCryzSqg4Q3JLH7OACZKIeib+WAZgeliSmcfDnZkM0X6uiX8V5s57FqFL+fRcuD5F/4d0F8zp1fFNpGzx/J1YD+11Y48ITsGM9UbJZ+U1n43ifvjxZuYB9kIOUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fB9yk8K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fB9yk8K7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R7iKtX027807
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgVk85DAmmpZs++PLF2UBmQ+DGiZz0Emih1vTSs5OXU=; b=fB9yk8K7uV8T/fq6
	DO1Ni/h8nKW7CNmKL96zZ1bf0epG22PvNYkhTmno5rDgk2+OzHSmXigIIm3o6foz
	To1Zppqw6y+7fKH3A7LscpMUJupwr8dawfyi5Bme2vi+Kpd710uu6Q+xnccmYqOi
	4JeaueW7dj/+EOHecWjN+hTYCctbSWZSwPDu1rkYZM/EjDp3tKY7Wzq/YVi+sN0U
	C09I7hiprznbgkEu8dGez2ivfULrCi6jNbVXtpMJnPy5pi4se76oAOTQg0Q4o2BC
	gt2NzvjoRe2w9fdG+fFoBsSEiz9Xgr6XEf3fC1hQsaZX6gVzenwRUZu0BunRdCNJ
	2Z1uzQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992ghra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 11:00:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476783cbdb8so4285941cf.1
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 04:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343641; x=1748948441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgVk85DAmmpZs++PLF2UBmQ+DGiZz0Emih1vTSs5OXU=;
        b=aarteTdeKAJlZsYrXBAVzx+IOr69ZDactvQP8leTnBCYOT1UAtz2Z34aW/6GAzFv9x
         TaBt5NTgHzPyRoxOZqGEz1N0XieHvA7l/JFgWkGjMA15CJJrqLMj0orFwCUTLdGQk2zP
         ZZvSF3BIBOcTWXT7Uh4/oFfEvVNCQp71dKVw0rUixjC+jykzOXo/NarhvVYRi/cFhGXX
         KYUn2GvOB0e/Jfe8uWqcPcoi+MFSzYufyYWy3/d54X6c6bGUHjjDTnCiooI6ZbfrRkwG
         H3k5zTpO1oc593UkPHXyKwu8hUuA7xc9WMAMpufy7NByn9+oYypOngmxgQJHDUPZT/fl
         ZMCA==
X-Forwarded-Encrypted: i=1; AJvYcCUILqFs6J6pIbjUTLCwXCoGlYy5yIZ1qVlr9+Tzu08NbYyVJ4eSGbZOkXetTN/XpBx4EyiY10R3i9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTiAEnbZZm80k6/8KMcsyyiJUyVy0vuWiwrSG2jcv1h1UuHEDT
	sx4quMeRpW4hGZDE3Uw2V/tBLMvfOLczjBmPcrSZpwrozokufa0laaFinMvOlUqUISnURGpQVOb
	O6UuLzHvG/0Vz5iQ+mWrDZkVXhPLjvJ2z5bITX96EdPkqqDGDEpwNv89TckPxkqQ=
X-Gm-Gg: ASbGncvWfGSO64xMoSrRR9m7OcBPwspQ685pDJrNs2K4kpUf/hDjEG5TWs5Cykcrz6S
	UHpnz3G98X/dNj/r8OhK29c2n/TYTS/I1htD3TqJ8Nla9BV51Z/fU60B28q7WMfgolVYAu5nWVv
	8+4IiC5Y2PL9xCcocWecjwm8ADqfcL5dS02OpzFi8zjKXAELvnLwEHbR6hTmwZXmmFsnq6X/eS9
	REPNxNUbq1dSUBlNjJ3GtQGz5H864cl1FhKDhzosxQr30PW0lWe9hy9uzLtU7uprPz9CmHXyPid
	DzgFdySYqvGe0IzbKFtFiZV4ApnoezwgonS+LGH1w1rXpTXn3nEidQABihgVKkWSlg==
X-Received: by 2002:ac8:7fd4:0:b0:471:f437:2973 with SMTP id d75a77b69052e-49f484b59a0mr63741731cf.14.1748343641576;
        Tue, 27 May 2025 04:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+5TD+MYI12ASNGgNhrVbg3teRggfUA7Nt0ihpblmSv3AXfO5j1mU3F1jH13ruzx816Fmvxw==
X-Received: by 2002:ac8:7fd4:0:b0:471:f437:2973 with SMTP id d75a77b69052e-49f484b59a0mr63741331cf.14.1748343641067;
        Tue, 27 May 2025 04:00:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88d055609sm100472066b.28.2025.05.27.04.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:00:40 -0700 (PDT)
Message-ID: <337068fa-adc2-478e-8f3f-ec93af0bb1c6@oss.qualcomm.com>
Date: Tue, 27 May 2025 13:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: gcc-ipq5018: fix GE PHY reset
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-2-ddab8854e253@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX01P1PQLO9pKh
 Wm52xDc3rS6/a8FHjDhqkXznqYpBxhIl8pPUAvEW3NSpFY6BHrH0w9KZy9JanQUDU336gxhIw2Q
 EVyccNpfnvQ9XB7bD+xkbs7VZjhaFg6HnWXWv9hv34xPQcCKT0nCZ6n3v0RbU8JwAE2Oa8Nv9w0
 VekATPdTvF1ZmndQtZzYKtdD/MCLWl+SrPlN8R5JHb4vG0Dai9Y6evuTGPHcMyxv76uY66N2CN2
 Lrzi6NwHHWt5ok6yWmQO3Rmf0+X5P75EBZe2gnHQVM+PdvDhUZL0YgQWd/pQoJFFioeviy+Wjfx
 BSajHUUS2nJ1tjoigdhBIwLfUOjGR5RoIQmwNjjrHAYymKZuwnXrUGhoKh3hxLTwb7QEd7+kW5b
 J4q/lwK2xgihHg0wwaqj64qlsfA1ZMggia+L/bqoEtn+og4Tb+v81RE2FeAHD2HJffWkBD/q
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68359b5a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=UqCG9HQmAAAA:8
 a=rZqdB0JiAKPJAkIg25gA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Hwbcq7Umj9Bc_BQitF_ozOTzl6vkJsbr
X-Proofpoint-ORIG-GUID: Hwbcq7Umj9Bc_BQitF_ozOTzl6vkJsbr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270090

On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The MISC reset is supposed to trigger a resets across the MDC, DSP, and
> RX & TX clocks of the IPQ5018 internal GE PHY. So let's set the bitmask
> of the reset definition accordingly in the GCC as per the downstream
> driver.
> 
> Link: https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/00743c3e82fa87cba4460e7a2ba32f473a9ce932
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
> index 70f5dcb96700f55da1fb19fc893d22350a7e63bf..02d6f08f389f24eccc961b9a4271288c6b635bbc 100644
> --- a/drivers/clk/qcom/gcc-ipq5018.c
> +++ b/drivers/clk/qcom/gcc-ipq5018.c
> @@ -3660,7 +3660,7 @@ static const struct qcom_reset_map gcc_ipq5018_resets[] = {
>  	[GCC_WCSS_AXI_S_ARES] = { 0x59008, 6 },
>  	[GCC_WCSS_Q6_BCR] = { 0x18004, 0 },
>  	[GCC_WCSSAON_RESET] = { 0x59010, 0},
> -	[GCC_GEPHY_MISC_ARES] = { 0x56004, 0 },
> +	[GCC_GEPHY_MISC_ARES] = { 0x56004, .bitmask = 0xf },

The computer tells me there aren't any bits beyond this mask..

Does this actually fix anything?

Konrad
