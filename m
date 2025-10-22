Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CC92566DF
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115034; cv=none; b=OhinovSqvGkf8KVxhSqK0k1cB6YVOyDsefCiIRH4ucFm3FogSBoBcneYePZDOiEKce0cMPTkX1n3VN1h+DvqLfyjEKmetw7RECAiGjVyoIYfsZ5rhq1M32olitG2jCexsiqiRuyz4Q0k/d+tCGGpGzhcrU351PtkcV50xtRQLJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115034; c=relaxed/simple;
	bh=iJ1uktF/2GWrsG1i/Ztq1ODfIsEIJ8TPn2k68folgJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VM+1UYRu7Jc6W5P+Zzmu/sLFsvqoOeriUT9IZrfQCueGnA12iplOe7Fuf/mpmp494bLO/WmoNIOsbvOrC1XBx0o6Y8xRV6TatpNcf1rLebsmthFI3REw9VQOtd6iOrixYBguMfWhsFN5Iw9h22mfLzLKTn1iBO59VuTXLci+HqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CB0sWIT4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CB0sWIT4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3gofN025166
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	phYYPHpmFAc5t3rQjDklKkr3KZqV3jpdRFmpgMO7EiE=; b=CB0sWIT4dGesmZr3
	VblF5Nyh4oTrrS85MkDKXBLlVOZT8m8BGZex3n2lQH3w+gJXz458mxwFRbzOY/53
	WzwqV+5w+dzTdQLKDzJiq1mOJ74gzKfmFfbkK3Ttk4AswoUFcQ4cOkNifAuyL0Sr
	eXkp7IFg40NRMMryJDYBWKxd839bW4UPkBdRVez2X6iMDF52X6RU8ccO1K/d1sgb
	Y+yFIRi8+dia5KJdpBG7yyT0bkriEabFzVWLuggTRIJQhe+cLsUGYVQmplePgpNs
	eghiIiARZ1kr++uLXOPUd4fzZgKS//IntqCYJtWhDkTiZ+BnzF2TW8woDddJIhDF
	oLbPQA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w83jw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 06:37:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7810912fc31so6137867b3a.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 23:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115030; x=1761719830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phYYPHpmFAc5t3rQjDklKkr3KZqV3jpdRFmpgMO7EiE=;
        b=YVuHtyxbXb3Wm6X3bDQ82QVFXDfWDDr3Htd7LAt0U14XAlt9q59LGhi4AotWs6YhVa
         VY4+VxjUHsae7vSyBUxIPZ/csZt7SkR0n/dAidci2F/FCuAkc7AaxaZVS7LYxBfXKK44
         b2mGRdv6vmRjfS0CbOgwSCztAPkLR/OKsgL25SW7L3X3Isn3CI9T05y+WsX508MpPrkS
         lZgcUzB2iwOAXZc+rIgtGWrx/oBA1DkWInXHBW56SrqVwN5UhHNJPS16VL2JGIJR5Jpq
         lDwhwQ0VNnixgQ9kwTeyvP4/huM+/3hmAUZFVm172UKG4BS4gA2cKJ9E+fqH9cDgVf/q
         qi3g==
X-Forwarded-Encrypted: i=1; AJvYcCVlFbwKr/q7PDNZ8EjPyPPtMrFCf3/Ij7djzsmllfTaTiBpVxqgbT/IEjPgGt5LNMImIDFr5jV0UQM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5swgNmwRkU60aRY0lgufo82vO5ZpoWBy66n22+MgMFuCCIse7
	RhiTGok2ssfq/sc2t4z9RObwWWvPfQh6MxPqfrFrVWXS3rpvq7A+Sg3YUZdUHx/nsXsjyqQwz83
	u2P5qj1ZjnpWb55s1Mr1msy68KBtA2y5So0uhDd4scGPDOmvbbhH4Z86thG5cJGo=
X-Gm-Gg: ASbGncsPs3CjGm9x0JsOcC91dp9lfG7muxHFdBROFuAfFJo2hkjuMtKDmUI53OKX5Do
	IZTdNI0/kKxJ9ysDzC32efwud9w5549uNuKuP+IWAau47cOe07FyMcKmbtjkkBIexdHAG9Dtaex
	h6zceEfMlgx2QAymDUq1DIGYXncFKYcoNfzOgHUHO+H51g6WV+k2bK+zSTbkvnCsggzUMKe6TKe
	k0hLviH+Dog+uxZddeBk0LDTzWvJxYlvfjsD54SZmipujcxjNXOcBco15UXoEYrcHRWXmZk8J6U
	VPnwewG+VpompvFOfnpHKRBWSIVPhjY2BptG3HuTUqjYJfEH3tPeP4GgXD4aiBjbxQpaU0rcCyh
	cjOu2OCH8Ozevu37Vdh612qb21qM=
X-Received: by 2002:a05:6a00:1493:b0:77f:3149:3723 with SMTP id d2e1a72fcca58-7a220d3464dmr24153360b3a.29.1761115029932;
        Tue, 21 Oct 2025 23:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7vtPwGZMKsrymbcxu9zzkrZlyJC25po4kInazwlIOlZKWVgmxbQJbd5FeFHB1tY35PDWVlA==
X-Received: by 2002:a05:6a00:1493:b0:77f:3149:3723 with SMTP id d2e1a72fcca58-7a220d3464dmr24153330b3a.29.1761115029486;
        Tue, 21 Oct 2025 23:37:09 -0700 (PDT)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a26c3026aesm74721b3a.24.2025.10.21.23.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 23:37:09 -0700 (PDT)
Message-ID: <d453ddaf-aa44-4125-b86a-4a51f2c23ac5@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 12:07:04 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc-sm7150: Fix PLL config of PLL2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-2-8c1d8aff4afc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX08SiDqDMFaf+
 mNFjUO8Q9/xv/M7os/WUcmLfTCAJxy+evvqi1NIujAo3sjzwTbFYo88YZulLfCA8Miy6No2djEO
 tgo5II9z+3gBpa/u1rPmEIVn1Yll9VpGWnadtv8KmjNBxOdmRCPG3pwr/2iSN9ryBvIzU8psWvM
 R210DFlkoRwDLY6OLXNjr/i5QiMM11bRjif8dfXKfq0Whc/lQTSIuALJwqJ9kY+K/99rwAoBe+m
 Ieu2xhN1RT+63JGB7uNaj+K4KifRdNveq+A8IWTX+CL1fN6oy/dNccbejVUkE1w54cwlnn9E7CX
 QMgllFpGpEy5qqhevZEaI3jazav1Ya+tl6KvT7gXkmfOOsesSvDVz65TVlERstU4yTa0dBjUvt2
 HzUl/4Pc8BbumjbQUyRHTU9Ser9IJQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f87b97 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=rHO35cIvbrFS-cT-sPwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: Tid5-noD7loqX_VaK78UqRvb5W2RXdkn
X-Proofpoint-ORIG-GUID: Tid5-noD7loqX_VaK78UqRvb5W2RXdkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/21/2025 11:38 PM, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly.
> 
> Fixes: 9f0532da4226 ("clk: qcom: Add Camera Clock Controller driver for SM7150")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/camcc-sm7150.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm7150.c b/drivers/clk/qcom/camcc-sm7150.c
> index 4a3baf5d8e85..590548cac45b 100644
> --- a/drivers/clk/qcom/camcc-sm7150.c
> +++ b/drivers/clk/qcom/camcc-sm7150.c
> @@ -139,13 +139,9 @@ static struct clk_fixed_factor camcc_pll1_out_even = {
>  /* 1920MHz configuration */
>  static const struct alpha_pll_config camcc_pll2_config = {
>  	.l = 0x64,
> -	.post_div_val = 0x3 << 8,
> -	.post_div_mask = 0x3 << 8,
> -	.early_output_mask = BIT(3),
> -	.aux_output_mask = BIT(1),
> -	.main_output_mask = BIT(0),
>  	.config_ctl_hi_val = 0x400003d6,
>  	.config_ctl_val = 0x20000954,
> +	.user_ctl_val = 0x0000030b,
>  };
>  
>  static struct clk_alpha_pll camcc_pll2 = {
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

