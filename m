Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FA63B9
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774240009; cv=none; b=p9w3v3VhMSjkF2ladZtMCkumEJDHUTPVLgUA6rDiB1L7XvUyf3PeKhdH5mLAe16NfnhKkKDnM8WTgTTw3b4bpshI6cdH4kUvEtv/K9n/8sQzN9/hbVBr3/6uZ2WcB7eCHYDvDlE1BZnHWIP0q9w1JB56Hu8emSpcvkuVH3PeUak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774240009; c=relaxed/simple;
	bh=sStt4KH26WfiPlJ8xKUxjjO/or5H8BrxBwHyGMcoceU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRTign0kF0ju6vQWz/ZxT+1r7pIGBEd83iGcbDLTZiqUYBfHTpLH9rDgMd+fZfa4kH9jCpVvT25FeUCXq0Cvw+jjV55kYJUapN43RtDRHcJkzbRemisn/KK/RrpEo7mGNS4e4Q9AW7nIcuW+o9CHpOxkqcJRz71DCjZYbfxWMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xy7vkUTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XH8BB2Hx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xy7vkUTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XH8BB2Hx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MJFSkJ687241
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=; b=Xy7vkUTOShls9XW8
	L1ZA3TO9rsyNsHvN8iryOxzBxC1KqwkTQXV6DtQ7LUG2ApK8UIUOtzHjev4PJ9Wv
	62t9pCg3THF809qUkdZCR7lyXe/IBGTNMkexmNgrXBIzUGV/tR3rFKDi+V14fdOn
	AdAAhS7wdHXq4v6UAyrAjt+m6fTw8wERruuRejV7pJ7+BM8Ecb5OUKOiWqiptkLr
	xwF9Sn1aLXIFpOItNlSvM+NFvx8CLKtedn8svCncFgQR3vD2mU39NPbP/o93om1r
	5blgXgfFOtbv8ZI2npp3f1kdGr/W7ChlKxP+3jGKr5Wbfx8qdhDr8nA+znijnc81
	L8fDZg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1j9rbqd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Mar 2026 04:26:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so34745525ad.0
        for <linux-clk@vger.kernel.org>; Sun, 22 Mar 2026 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774240007; x=1774844807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=XH8BB2Hxt6RcYHKFcTozC9T0K1cObqQXwV70AoY8aYBp7F0+WQ6FYeFFuoi8OMKd/e
         BQFSMNi/jkplzuSCpcBI0HJvlLPg474dHCnQ3fCfLpfjCHmPF4QWTu80PndgJAlVu3FW
         RvgyBHqmXstmt1zlZZBex23w38EuuZWziy71+FEoDYNowUkk5IlAjGft8UHcHjJ2qY91
         nI2CbUSi4x8P/e9sWCBoJ9MDCGFrtqohCPdMFqDQrKYZaYDlTlJ47YqIn3VclXMsxvBW
         E7+BP62o4ebD54Hbb2ONNCXJ37s6ifnELn5A1YOpIaXCny6C0SpTHwvg7odzrryScgdx
         lqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774240007; x=1774844807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=gZiA/70+NaVg9A+ti9UrKhs/78lNm22Lzm6wu7CXVX+l1W0PbDbZgnL8aA74J5TdVo
         FFsH8pfMjn8TVGqT9Baj8U4b7tSb64mfNCS6+mIgoj1IvSP2eBEEEnCC+Kd06JvSOv8F
         wFEDPqJaFxYlOUNwAokUwmxqP+ZoGDVI1CuiamGgZ0D2LWo+y9nuJHVt4IN3nSayQaPL
         9rOIETkxeH6XZG38l0hWEKeJLZC/B79DM1mS3kOgpz+tVIsU0CXWl04RaMyc6Ey1iasF
         csKNcQ1K2MznD067ZEenFSPMWDUJ/YEd1E93s7xr0OOP1pKRkriKoMrrWcx+RUk0hlL2
         w3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlRHV0v/Rs9U7KrCcRBE135V2sHBSuIs9TJ49HdrIHbBFmI+sDCwDnBCFBtexJbK3313uk+Ax9/Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUctHKLLaSsRy8GEdNZ4AyK99Idw+ZZdjsC/YIBnbtIUYxa/w8
	nIkoiSdd5VCz/oeRf9n0BjBwZDNGYiUNsUDcznG0+Xq4dT1vhWEoBYOV2eItk+aNW7K63B8m81V
	pV1lf5+W/nBLtgOwN+9wjg+CTh6vFwDsHRvjdKC9d7brKZpbKOe86wsh6DaV25Ow=
X-Gm-Gg: ATEYQzypvxFeKNJN7CwpNXp97+BtwQkES9BQ4iRl+xComGGFo2k1cb8JuB2668Bh2Df
	GWms8SqccMU033fhpyJ62kLmdHwYZqDEpaNHAZXjapxuJbn6CAzSNW3fynK5c7FN2Dqw06TZ+yK
	7vRXNSNpCe7oouG9vb2LrbVkMtdcftJoZeATf+excPy4XiTNg0gVFxXgP9WWZCGD2qKZaDuwPpa
	Q8cWLbrr4ytVR5ObngoZvc7HjV5OBziwrRZWK+W6SC/TsJCBQFB/4ry2D4HMED0guZTM6ardh7/
	MpWO3soHruaauojM1wJB1BKpmyhmzJyJk1wLFt5YL3/6S4K41HLUu776dzJek3gRHc09ghDRrw1
	2aOGtO4UW2aWsIH9vn9XGa8I7Qy9orpZvhZ4wu+Id+5tSb1yeGg==
X-Received: by 2002:a17:902:e5c5:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b07717fbc5mr121752255ad.13.1774240006869;
        Sun, 22 Mar 2026 21:26:46 -0700 (PDT)
X-Received: by 2002:a17:902:e5c5:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b07717fbc5mr121752085ad.13.1774240006435;
        Sun, 22 Mar 2026 21:26:46 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516908sm117191885ad.1.2026.03.22.21.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:26:46 -0700 (PDT)
Message-ID: <32c8c28f-83ef-4019-b87c-162f09ab6de5@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U3OVjEOqChZ6Eoxhys1EUR5OBFF8nLgj
X-Authority-Analysis: v=2.4 cv=ZPDaWH7b c=1 sm=1 tr=0 ts=69c0c107 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XrWBrngNrbSfp6LsIOQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzMSBTYWx0ZWRfXzky3O0XLAQMB
 Q3q4xg7utpFHhg+INgyddyRqI2DVIwrBK/IV7gwBrH3cX2s07dKPjD2FCr2CUmNQ8NgomcW6N6J
 4hTckxiTHmynYMYEpuVN8F7Gi75MS3oLc1+4KGNGGcfSZmWFvSLBjMb00oU1i271bfJB8EVQvr1
 sk8TDEtrUeXnJ6WhyKjC60e9aGYhi+d7+e80AdHXP3+aFXwjHPXlyC34pnmJgPN38S7OzbvLxnq
 90L4TDs6Pa4+mg5cD0o6wOFtiT8GtLhHsGBzikXhx06J/h2S5NgYuL8PqaKdV2aDFKDN/EUpohZ
 zBGzwKeY0XkmCC4c4zeSv96s2kldGUYi7VKBXX1ZLasvDSTUD13MYwbM9mZ5AG8c3OELUudC6Ut
 M2VvJzKLk5UJCEa6vbBfp6v+6OgBg9ZqbBZs5zlkXdFALf87KdfO8X37q7je1p/osz6VWyEkISV
 6XUIW9JEzbdprw9+EMg==
X-Proofpoint-GUID: U3OVjEOqChZ6Eoxhys1EUR5OBFF8nLgj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230031



On 3/21/2026 3:20 PM, Pengyu Luo wrote:
> Downstream clk_summary shows the mdss_pixel_clk_src support the
> ratio(35:16)
> 
>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> 
> After checking downstream source, 15:4 also seems to be supported,
> add them two.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index fc696b66cc..6064a0e17d 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
>  	{ 4, 9 },
>  	{ 1, 1 },
>  	{ 2, 3 },
> +	{ 16, 35},
> +	{ 4, 15},
>  	{ }
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das

