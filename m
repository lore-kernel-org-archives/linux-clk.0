Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8E2FFF94
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 05:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172704; cv=none; b=XyVA80S7FB29Htjn8V79epWvnr2RVa7GdiQxBStyy/ap6L2eYcsrZz5zu7mU6kbK1c0TyrwbNNa5ZrZnuudIBv4oCLGWQWt0PBuegXrbpsWmnLniPqPnmZD/wzouWwa588dICncDnh1t68HhdRur/htZikEnV19w+QM1ECHs7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172704; c=relaxed/simple;
	bh=VwounY8YsKZ9UmWsbr79xKGFX7jDpe4qRjJ0mWKu49U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BiKrAXHs6DJDJ18ON7DIxrTzSTXcqt3QP1vJaL2d8MGKU1A6jPcxY3JOOqffQZgK1miwQYj+asHvUDZ9NoyF5ZcqGEi9Mlio/hWLRCPVKdjt2wZb0V4fXccEI9zXTIDDOXLGcmloJgNNgYsfSTgppNh0yg6wEqXj+u78VQgE3uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw/hAXS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NN+7OlgZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw/hAXS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NN+7OlgZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B7Ndtba3185589
	for <linux-clk@vger.kernel.org>; Mon, 8 Dec 2025 05:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t02hOe59WxYlLpNJJemPU3DA+pK+Gh/u1fDHWQwZJiQ=; b=Lw/hAXS9n0KkDxb6
	6YPp5FXVk7v1tMGl4RGUH3psWvO1xumPSmaRaeoCpwATcaffavgsKdKSVuMD855S
	ITYp64hZI+zVtFCgfzLYZjvhs7aPCpaSwoH1DD5FfLBdyxOvBoldovR6nHFH8d4D
	uZ5xsLQ6LsxlcZrYcp/BNFd5lp1M4NBi3LCIX2HbFDIPBBX2JCB0R3sHKWn7eyqc
	IOyJ48AgUySPyhLDvI8buqIjORu17oWT/EAT3EpiP/tKJ3YxsOYBJTdp732VNaRL
	QvalGqeEuREaF2VgN863DhkoF8k4wzgvW4fsMsrm8oSSbFh0dmJp9og2FD6uzkQJ
	+bH7og==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e3p4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Dec 2025 05:45:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so4583904b3a.3
        for <linux-clk@vger.kernel.org>; Sun, 07 Dec 2025 21:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765172701; x=1765777501; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t02hOe59WxYlLpNJJemPU3DA+pK+Gh/u1fDHWQwZJiQ=;
        b=NN+7OlgZDG63yVeBSKEDRWAKoCVHVrOwqv3N3B9uiIyhTYu2fh6zz/hQMoHPrjpEyG
         U2Uhx6oCoV346kSVZiRi42JCqfm68dHpSh4IFGvZLV/31EK+Wy8wMI3sdJP79nOB4Dt5
         VEpbRKjAvxdNic06hT4otv3u/XOcMVzmZSc4mRCScDC6BxPwGEjUsVEwOhCzZG7dCp8X
         uM44LE5LGzZfyOrINfQfEivryGIH9QKVgORhOyWNuC2hyZhTvuOZtEoKD7G4+VLj5fgr
         ojN/WbjDa8BK1EbjUXuziycFxLahHj2hCfT6tv0QJuqF6G2WVi4j4abeaLRXdx8w6GSQ
         k2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172701; x=1765777501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t02hOe59WxYlLpNJJemPU3DA+pK+Gh/u1fDHWQwZJiQ=;
        b=jGo4K4Oha+gGJIdGS4PT6uUEghV0WMedui96ywiL3+H1Ap4T30vi2o8w24W6UI/IWQ
         0vgADGHYpflm9VLtcaQJfjItnfR5OfXHDg3Yq7hOZ5O8R4uB3ZZaW/8SkkLcs8yzf8BL
         ZtWV3Gr0ceIIfHt0DMNMkphczJF9uXJXC97QctcFxdpSsRonWMTYKjgCTvxNasTsrmyr
         OuaulX4xwmCxOLvnT62q3T4zvoPgrqDbBOlXWkvwNOe+Aw7ZdIN12cWQwqK5CrPRx6Hl
         bkDDGd/MAWhU6Z2dLfDZku7wa7vAyyZ0KEQxG8RX6eUUyngyd35MnPHbUzN/Tkbf/zd/
         w/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN9hj2WYjZetANjhGeiwlAK6UTkfl3zoouy4VZdL8Lhnmfo0mTkunnRmiq5IEcJ8ao8/rIfjGPj/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7tc2d6NSb2O5dh39jnq3GF/LsY1dVq+ZFx8T5Enqbs23X69Z
	2HEzs3VLk0udAbDSLwbtrWN0QL3oiUC+wgzGbDSQSbS13jJ6endqj/UExDDP+JZmr6DAMgKo6Q3
	8qbPS5QsxhnQ2bt60x92hUSgxyS6AZrVPaPiJuqcbYgIXB8XapgKC343u8Bnwb/c=
X-Gm-Gg: ASbGncvE7c8jNJwl7TvK/yPC6bbHG+xsUbLPW5ysEZR+n4DRnF0qZ0fX2LyRPujdeOj
	BbuY6WElG7wygC0giNcRExy8f6po1rZYVPCNIUC4kPBL3vPMELRNLJhaQDUlo4Ne8MPfUyRK2/9
	tZt6ynli9ThZ//KvlM0mSME1R/gKuk4c8G5Y3pCdHIFCDtBXecfw1lRtQ5bxyLteP1Lq1Ta6CQf
	jwnsrVSdalzZjS8AjL8fgRwZJoqZoBQp3RmArfU4nzVx/u/jJxYed93UZvtrCM8woTFvcxpz7KE
	hI0IgC/zpMvwnQ0OrxhxdloTiNoW+sOlnVEaI2yJZK7KkCDRr8GMFD6/T9E5un6RCeP4vsLcPnU
	p1iRlc9Wo0OszfIFrVKoeLziGb292f7IHZj5UTw==
X-Received: by 2002:a05:6a00:854:b0:7e8:4471:8d5 with SMTP id d2e1a72fcca58-7e8c7865a9cmr6497434b3a.54.1765172700998;
        Sun, 07 Dec 2025 21:45:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQMvE+HJv4CQIWxEIyxg58PxUJneAez+8mz+9Np1ayVcoYrgxIrsT1ViOKAyEoEWEkaWp7KQ==
X-Received: by 2002:a05:6a00:854:b0:7e8:4471:8d5 with SMTP id d2e1a72fcca58-7e8c7865a9cmr6497417b3a.54.1765172700475;
        Sun, 07 Dec 2025 21:45:00 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a02516fasm11669533b3a.22.2025.12.07.21.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 21:45:00 -0800 (PST)
Message-ID: <1b133002-f36f-4f94-86f9-d6cd12d96946@oss.qualcomm.com>
Date: Mon, 8 Dec 2025 11:14:46 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: videocc-sm8750: Constify qcom_cc_desc
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20251208020621.4514-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfX9vY5S6AnPoxA
 rbyISF+p9YS6caUFvdMh8v6xLLPcMnhYK2m851SIILWUjOtRkxbRt759UayPU4IAn1aOekTHMU3
 VDbbBeoyUJejWJWl9DQMaee7VA30F3DzDP9h22ilykSrVblME14f8lvre7z5tWAcekpyK7F8+9H
 of0ebMopYvpypTPE95uhMRc0mFfb64mWPzBv1OiNnTwyBaffyrpqZvsO2tMoT9wUIWqXK/XC4Zm
 CTr0DcElGM/JJe7xuFhy9WvgujKMCUP+xI46KH8FskmvjOkMoImhyTmfAqPOoLvXPGIynpz5ntO
 w3hXSo1yD05+VDqUpbK9Hj7GQ8r0yWfYJMrPcyzqftqUg2Xq84U5iLtNPoiEU8a6V4Z0XOUySL2
 nByVRsc8UtdyRt/2pnvAeaoZAPvTcA==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=693665dd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Li9xuZhQ_D-hz7Qe2voA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 0wDKeTWGI6ZZFPTWgiX7W5bRxd_G_Ztv
X-Proofpoint-ORIG-GUID: 0wDKeTWGI6ZZFPTWgiX7W5bRxd_G_Ztv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080046



On 12/8/2025 7:36 AM, Krzysztof Kozlowski wrote:
> Static 'struct qcom_cc_desc' is not modified by drivers and can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> My standard commit, one more time. I wonder when I will run out of the
> same commits doing the same...
> ---
>  drivers/clk/qcom/videocc-sm8750.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8750.c b/drivers/clk/qcom/videocc-sm8750.c
> index 0acf3104d702..823aca2bdd34 100644
> --- a/drivers/clk/qcom/videocc-sm8750.c
> +++ b/drivers/clk/qcom/videocc-sm8750.c
> @@ -416,7 +416,7 @@ static struct qcom_cc_driver_data video_cc_sm8750_driver_data = {
>  	.clk_regs_configure = clk_sm8750_regs_configure,
>  };
>  
> -static struct qcom_cc_desc video_cc_sm8750_desc = {
> +static const struct qcom_cc_desc video_cc_sm8750_desc = {
>  	.config = &video_cc_sm8750_regmap_config,
>  	.clks = video_cc_sm8750_clocks,
>  	.num_clks = ARRAY_SIZE(video_cc_sm8750_clocks),

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

