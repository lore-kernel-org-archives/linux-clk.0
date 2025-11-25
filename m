Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4950296BB6
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 06:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764052646; cv=none; b=qruYESab0rhozgkySWfgTBjL9l/2ayzq35Jf08X7jGS5atBsjakLMvOQZZEwN7e/Q0BysT5Se/ACfnXqJwT8BLA0JAUdIHp/NmR5XNcDLORREauFBS2aSOfWu2Zt6XpYxgzLtzV2e8FSHo6cnwfKhcJNi5QEy8PSfoT2jK5zyuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764052646; c=relaxed/simple;
	bh=nnHmhyhelw4QZaKxg4NDVF3PzW22G0/mH6vimv526PU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZ//bX9ipb7CA/SUMA6GFMSWnpsUWjuJewIqvF1Xoz8Ao5KpZptPTCuH8v3xODYiJMwL/wIuwoyxJMoWGXXV9vnIa4/8LIxCWjO7JuhdK73Zi3+gZY99I3kYoNbaO6/Vz5/x9k++wDNfyl7YaMxfM5KTMwXls55FMKbnafvUIxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkTw4gxv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/v84ixS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkTw4gxv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/v84ixS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2ggJL1741105
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 06:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DG60jf2Q0JmVzylkbcK5LyO1Who91UUvzLD6q45AVy0=; b=MkTw4gxvMdwETjRu
	3vCJ/xFm4Mbkffr8Sl1P/b2koeYixJymVq91t5LLxJkVNeHMUowa6W4X/wu8DhEc
	TI5j2TCbtLT+ruqaAUMy9MLxuylnXe8IsBffHp0UVheM2EqQ6rF5ZTB4f3gnNw3D
	imrZx6YVvaOYSHzbHdHQvAtCtKPF1+2CP9iVhyGCiFzXUW8o0nXawS/r8IB4q42L
	GaEkDLyuJrDM/jXEQHDVFShaoH9e6MwQvcSpWgbeGuQkIPqcquBUEGjPidUBSQ9h
	auB23HyXDdXPtEovF1zdvVQzU09q3Nz49SfVC4WA4noXu4VJsty7kNvmcg84R5wp
	5o864Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteba6xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 06:37:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-298535ef0ccso54374335ad.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Nov 2025 22:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764052643; x=1764657443; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DG60jf2Q0JmVzylkbcK5LyO1Who91UUvzLD6q45AVy0=;
        b=T/v84ixSjEZz2mPcjr2tKz5pKhgtVKzsOl48QQ7veq5Dx8qxzioaiBonI41YXEolqD
         352FPGmz9DEKbvHiPzbJKszRwsnAMpCK9E5TjGpirBXyIb+lbwXTMGVZoerxAvOyiATn
         7y1CAFj3rsWjQxoo/rIRfrWI5BLRn+TNj0xJNKvjgKJGlVTR/mQurIZvEfQ1a9rcK7MI
         SkJ3PeHcCGXk35jK3ZBp5Xz5G8M977QC5UrY2ySprGnHWLDysP8TfqodKzf7EBREwHId
         B+XA7EWqAZ/GMMQ82dFhzt24nd/QgT1vOIMtpjBJM7Tl2cX/nOUEsT8W1eBM4hDMEcEI
         8vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764052643; x=1764657443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DG60jf2Q0JmVzylkbcK5LyO1Who91UUvzLD6q45AVy0=;
        b=IyE0TsJCgTQeX5sCfNEwVpyO5zOd3R6i3KucZjFsslfMIE1LiK5UqHhQb5wMdIuKYh
         knL5neHAan2iVFHbOnpzk3mDFRnbxumS0km87HlebbwgAe36yWMnPCVTQpk3vY3RNKMM
         nZ2n+KfuvCSi/tWkkomfnoKnMKy+Cz3ji6Wwh8A1wywAHH+bLmjdDOd38oyehQvEqYMO
         +iY4gxylCO4usCod9Xpkaq4WEcNaJNDCe2v9H2IDdxeQyNVIwhbet7pIE+G1/W/jkZel
         P3P3+5fS4yseSKyctn1bPEmrIA4Vv0lzUDgQiCuLITbTWJGp6LauUcB/5d66bLwLsk73
         q8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhXKwf+XMrzdO5LgxAyqdIqe3QeHzhPhxjT8W5VqrJ6ESwdC6DZZQ292Vl4sWCLHYSonIsK5EYG2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJCI+lZJWGvY9wufIySJoLFCktSjGS5OluFY7ZfnON7VtaRzN0
	tsceg5wqKzcDq9uLSS7dYDrS2cd4dOWXLAp5v7zSnQ4extFitdSopYNomf9AVQwMVMkWIk0bbR4
	V+tuTAUqqt8XEQjPNH/8fXUqfPrKhF3Co5bRSMjeVq4rfirXsPVSx5mK61bq1dXI=
X-Gm-Gg: ASbGncvvv6V8S7s04rzTOtdaN813Vvg3//ej8B+YJktbesWYkSu3CrFzPFwq1J037qm
	5cRdNPWOUGIlfcD4ps4yAJvdRIxYN1H5vHqaur1RvMqu1IOV3DOfqfXSeK4GjBLz1BPCbbx8nPV
	7KZUnqi8VUNFcbYRAzWvAmSzxiIJQ5+Yqr7Q3mZ4JJBDDnJwD9z4vipcAoXNm2ZWaXWNTaQMnVA
	M4WDss8OjEVKlEiH53jSKgqlyDwlLc6+pxe6RYVL41TZ3fj+hL3Ged46JPAyvHFay6KR/0cV7+D
	BnNXsNZeTOMtKzpEa/Rg5Yf+J1yscegA+6kW0POENFtlmuNxxgKcxJm9jSyffdSNof87adpMENd
	cgjjmTWaQCD3+znuv9Ft35XayNac69l9piAVE
X-Received: by 2002:a17:903:90c:b0:295:54cb:a8df with SMTP id d9443c01a7336-29bab160a4amr15919125ad.36.1764052643150;
        Mon, 24 Nov 2025 22:37:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENN/hpaeRehzIaLsAqawTjimaaKVcgAQZKF9CpPcDgZn4MbwQrIbo+odKzO6evzHOEO5DYAw==
X-Received: by 2002:a17:903:90c:b0:295:54cb:a8df with SMTP id d9443c01a7336-29bab160a4amr15918875ad.36.1764052642680;
        Mon, 24 Nov 2025 22:37:22 -0800 (PST)
Received: from [10.218.35.249] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm152768385ad.27.2025.11.24.22.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 22:37:22 -0800 (PST)
Message-ID: <d156efb4-ef41-47eb-8f55-2c5ab5d97e3b@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 12:07:17 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8650: Use floor ops for SDCC RCGs
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa
 <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
 <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251124212012.3660189-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wyJN4pyczd3Z9_ERqO6ek6sD1k_S3aHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX+hqQ+FsKS8Fd
 I35OFH5SMccUmWnL9j1jmza67iWGjQoYjO6PeZBkQZJEo4wWvIOXwk7qd380CfqLYxxTVzVszKy
 qTZh0bKxA765zNSqSsDCd3Z/TNuSIS+wHYHyfCRozEIcyOW8is9u2rfgzHHxfBCAnndSWwBIV94
 RonH9sL/uX1jlJUKu8ZdEg5IjEoZdLFweyFHNTiaaxAR0fGdTyK0l+NiNDK8n51tlabZixkzDQp
 zLfv1vtJJuTEgTaBxUtC5/6vmjJD3x6YGYI5hTY5mhhrfvoFNpqkMIIZyyDwt0BLKQHd3/LFusp
 oq+9NnIC9GxJx1M8sSeiNherxlKgV7/fJ3/IrpW0tTsdSbhBRLO6T4/1J0TEg4ezOYUWE7Cvi8x
 FIpAp3GoHkoIx56UO9e4Plub5bo+oA==
X-Proofpoint-ORIG-GUID: wyJN4pyczd3Z9_ERqO6ek6sD1k_S3aHj
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=69254ea3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=lWVEJI6HPn3KqSwRoiYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053



On 11/25/2025 2:50 AM, Vladimir Zapolskiy wrote:
> In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
> for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
> powered boards set floor clock operations for SDCC RCGs on SM8650.
> 
> This change fixes initialization of some SD cards, where the problem
> is manifested by the SDHC driver:
> 
>     mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
>     mmc0: error -110 whilst initialising SD card
> 
> Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/gcc-sm8650.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
> index 24f98062b9dd..2dd6444ce036 100644
> --- a/drivers/clk/qcom/gcc-sm8650.c
> +++ b/drivers/clk/qcom/gcc-sm8650.c
> @@ -1257,7 +1257,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>  		.parent_data = gcc_parent_data_11,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  
> @@ -1279,7 +1279,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
>  		.parent_data = gcc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_floor_ops,
>  	},
>  };
>  


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>


-- 
Thanks,
Taniya Das

