Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148B619F42F
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734687733; cv=none; b=ZwCAtJSIKmAqLInFi7ozZCInSjVfEDi2OvrsO2YDx9qxKL++jTAFUcbB0EUnkV2q4o9zNhBsqsaVhrdeJ35tFotifZJ7FKltF6TCGplI7PBmHOgagq4ta7yHZ+fqBeBwIv6jvZrgHM74pNcXZKiywX+MlkLtW0TC0IE4eGRGXXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734687733; c=relaxed/simple;
	bh=XbNct4c76Ic9uCHPcqgGY5elj+bO80ByXs4FfSvDnls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocy5o7D0Z4wKjq2zq942a/047fQkvF3LeoCtJNq8+W125O00gjAswONHv0I5IJl1mVE5QipJEXL1zhbsDsp2r/OTacjL2DZVVPTKqvXYuSqkTepxZkhiWTIn15iR4IDmv5+gzKctRsVsWjg+Z4dLtTUZ5z2S5Ij/5hfErH49HSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXk8PPEI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXk8PPEI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7Ll9E028157
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	upEuZgACcGPccteNXGsHcBPQQzGSh0ZOSBP1SMmeJg8=; b=BXk8PPEIElthn9uS
	1RlQKDRU81nifa+wViZyd4TcddzOlJrAFB4RDs3kS37dSsbv6ZKfkXOGeJoorx/M
	G4Syzb1A+BIOa/qdOjZnPGZVtg5nomXkYAsmndSjs65HY3C+jlAS7rMShuaFW4D1
	x8Dsiyv2MUUjW6Diz0cevzv/Z6u/CtM6wdOjKrHgfBcKO0Yq3WTWt4MWu4RNjahd
	RWosAvYyxYfyKwW0gocmvkaVr8/rrcdtrCbo0YlszLIRJiB5jNInzAZj1Uo0MLYc
	sSXLsTBu4fuLyeZOXsMtuSfi856MpZ/OMsm/ja67FWvfe7lrqGU7zzXqZJggnDJF
	vlZAog==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n44ggcu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 09:42:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467975f1b53so4333561cf.3
        for <linux-clk@vger.kernel.org>; Fri, 20 Dec 2024 01:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734687730; x=1735292530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upEuZgACcGPccteNXGsHcBPQQzGSh0ZOSBP1SMmeJg8=;
        b=dKitAA82e+ACtbsC59oOdOVLjTpW+jCVVErDkbu38wzhEdZTTA8mIl43OknrsnnNHt
         +CMneeYh/RrSGUVtEMg2b5JyjzXevAc2z2JyOcCLPMzf1GjHq3cbyC4dVoPagUlFwhJs
         pSWOKB/ZVOE3faD75tJkeKCIIfj5nNMvM5kBYgwNSbh+N8eLp0EeYd/Kn06uoMBX7CgP
         X/Tt3S9RZAjhTb8yiDiq4lJhDbf8XPwZ5l0wngrMuy9Q8hq+lny/43wbGTDSEYwqIWZC
         tZ2T0pQzsfSpYjdbc9+FDlJWYNYjlqvbaR8Uuod1xpt5QZtJvrSgk+hvn9WoV0lr9HoQ
         zHOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrwyftxyAdlzpJeFc56v5duADyI1uHjJhUt1m/TWOPyye+R2/mW3avSztQlz1ICAfivOR7rrUEbck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3Hciocg2LXQ7vbWEKrVPe4IhuB9MVpQG3DseifVaTATV5vO1
	MAO3OIdXbioTpFuZ/UqG+uGgzRN09pnCrlYiW0evO6fclu5uXLa7ZsbaLiDjETdscVeUXmnPwJe
	bGFDZTZ7LB12Jq8iDIq7lt/IQQSCyDm4eodKXa7Z/Ov99sG/o9DDKhyZjfY8=
X-Gm-Gg: ASbGncv0kfyjqHxnkIt03Uw9hxEY3xNffS8KO+c5P774XI10NSV8/SXLM386pgSxMLn
	imIm+mFhg6S56UA46WSsgXecmUz/NzOMAcjulj8sPxeL5AuqcwC8iAjP+s9RliR3oKhAmw656EP
	fYhFgV6j+CqQu2ug7tu2p+y4nHjQKVbVW5ANif43guP6hC5JtvKixxFnFLKyOpC01l0EZa7aZu1
	c85+o8WVBjqRtFiLibzjyUMHxHjsGH938t4bm/1ZpIXTj8lhWjpYUuMnZgm1MvZRLbNm4ix27t6
	y9x85/e3NEPZpA2I872smX/H/jIZxYqerFg=
X-Received: by 2002:ac8:5d0f:0:b0:466:92d8:737f with SMTP id d75a77b69052e-46a4a8fae4fmr14883641cf.8.1734687730202;
        Fri, 20 Dec 2024 01:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfnR1C569lsJcHofBTD7Tj37idjv8eOfCgixtSaFptqF2Mtevk8lxBAJ7GLYBUU39hwBD6vQ==
X-Received: by 2002:ac8:5d0f:0:b0:466:92d8:737f with SMTP id d75a77b69052e-46a4a8fae4fmr14883441cf.8.1734687729883;
        Fri, 20 Dec 2024 01:42:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f595sm157358866b.10.2024.12.20.01.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 01:42:09 -0800 (PST)
Message-ID: <e909ac59-b2d6-4626-8d4e-8279a691f98a@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 10:42:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: gcc-sm6350: Add missing parent_map for two
 clocks
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241220-sm6350-parent_map-v1-0-64f3d04cb2eb@fairphone.com>
 <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241220-sm6350-parent_map-v1-1-64f3d04cb2eb@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0HqNB2msJo5RTPvW7Mb20fzemwXBlTkZ
X-Proofpoint-GUID: 0HqNB2msJo5RTPvW7Mb20fzemwXBlTkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200080

On 20.12.2024 10:03 AM, Luca Weiss wrote:
> If a clk_rcg2 has a parent, it should also have parent_map defined,

                      ^
                        freq_tbl

> otherwise we'll get a NULL pointer dereference when calling clk_set_rate
> like the following:
> 
>   [    3.388105] Call trace:
>   [    3.390664]  qcom_find_src_index+0x3c/0x70 (P)
>   [    3.395301]  qcom_find_src_index+0x1c/0x70 (L)
>   [    3.399934]  _freq_tbl_determine_rate+0x48/0x100
>   [    3.404753]  clk_rcg2_determine_rate+0x1c/0x28
>   [    3.409387]  clk_core_determine_round_nolock+0x58/0xe4
>   [    3.421414]  clk_core_round_rate_nolock+0x48/0xfc
>   [    3.432974]  clk_core_round_rate_nolock+0xd0/0xfc
>   [    3.444483]  clk_core_set_rate_nolock+0x8c/0x300
>   [    3.455886]  clk_set_rate+0x38/0x14c
> 
> Add the parent_map property for two clocks where it's missing and also
> un-inline the parent_data as well to keep the matching parent_map and
> parent_data together.

The patch looks good otherwise

Konrad

