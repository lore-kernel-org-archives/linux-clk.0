Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAE31F4282
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752228445; cv=none; b=OglETncdsyTtuWTulIV1rd645q/IaQpO/DWfrn1yKBcFVkVKRec7G6M6akwrY2YJWvplmiKhaeQ66bl+y7ViI0SBY+cOUJiR/g4aIJ8GR/zRKtd+l82AbVnTHiJYHWKfGKUMD1gBXbN0QJ1Mr/Mo+YPD9yXTrcUAKYa+oD6BxFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752228445; c=relaxed/simple;
	bh=CcydoED0MJvysDQAThGymHG08lbVZKiwtFq+CoQ36+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3bv/M/d9LiPdrIpVuABrw6mZvCqviLQ2YoAXrRTugn8QMETL3zX/BGPy+F0sGCxm1xRIXmLhrshacEggSVA/tCsSrWlczg4utOZn19+8T3KW2ycUKyp/UXFL5Q8UZfd2iF+CnLIC0boVxyvAPS4wqNQ9PRPobkILyVEyH6ie7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OX36XM2I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OX36XM2I"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1awrL023904
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hk3nB5hWTU3eT0rJpe16RuFw4gADrZf69fEfZrrhc2E=; b=OX36XM2IQUjYjYLC
	L4JqjrIbaAKVweFxyeSK4wN6dvE5lT3qkwMV3183xhN+svzUylTx27sH8vR82D3X
	+LLBCt3WcV84TxXekS8/MyTWVz+kG7i8lcJt1qytO7ynWUTB6CoX424yAETo2RPN
	GI1G4svg4yTDq7t8w6NYEOGIeuqdE4CpsJx2rPk3W8hASUpbrsZ5hZMLHFvFEjcO
	qMrGz9PAdsny5U4hNRfrPN78cKVMWMC20zXUTrBtgBIHofaJlF3THCtJLJR0Aaz0
	NXLzVJqw4XPu6CKZO3k7OtEdmuwugIMMcajabtwMwsh5H18H7CiEmLAZ7qq3ppHe
	i+HmWA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap85tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 10:07:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7df5870c8b1so10821385a.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 03:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228442; x=1752833242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hk3nB5hWTU3eT0rJpe16RuFw4gADrZf69fEfZrrhc2E=;
        b=SVVM57QBFpH9ABKLKBAE0KgF/nEQxYwaM3ZK/cbIh9OdYxoiQsZH5PpEA+ku/2L2oj
         FKA5NB8PMhvxkWx15zuLgZ9CN91UXoAavETa44d4I0eZIm7nDBceAqK3+HgyF6jM6C0U
         xWoLFi+rJ3fWXQSLcMn+f3oPNSTgy95kOoxOpe2S23zijwsQ2Q/v6P0eCV4N6V1k48TA
         v6wj4+/iOBSIax6J4cYnnrlkYtDub0wlWafy0lzt5/7tFwNYLMRNbY+2Es0FOcFW6dXH
         koZpA8ehQ2KAOrXzOAJiAKKQvGfU8Jt8oJHLao/BO61tcrMm2abgYsN95aBn5AN8IK1J
         p3hA==
X-Gm-Message-State: AOJu0Yy2Dkz6PCNiKiTEZZByWWSAjgSga44w2sz5w7MyhHeiBGWzZBq0
	Bv9IzrY7TUym8E1eqc/EyCKwrfvWtA6vJwPImVCScmFyhkV4T7DiTKSWF6fXFTys40A4IaQtgKU
	RYTqac5YuHERjlR3F4F2KzPMpd8Zju1uvAL2SmzlkQYtdHP84tZVyEdGsWgkqLFM=
X-Gm-Gg: ASbGncuOqtKERqsiKSx4qnzn/EVbQu6dQSD+1/GIM9uZ0xnSP5M6Gz0w2yp8g4NhXgg
	tcZHJA4VaJ7CWxlFe/mMSCIAdH+I5WKfSTXNPsDtbWnRT0IiorU4dVHvUmnIE3LoYAXaDeReivG
	yNaBX1fuonpuuSlGrXNU8hGJTz509pVgt5qDxBhwbubvOIJ17qldvcZ8aGH7T6kxn6vmmM9/9vF
	SlQ5amPBl8hPVvciHEM0v92ADOvFE3Gn2Pdt0IAZKHCq3ivUPJd3ihuhJ/Lo/ospWtE2srg3sgc
	nU5LAVmDj0+F9soOzFXBGynIG9FJa/NE7TXxn43Fplr6Oq9uJSCJ0EfoAMv34KzFKnMj9hQ81Hx
	nUrctNQD2ulaV+jM9/GD1
X-Received: by 2002:a05:620a:1a23:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7ddea4222a1mr161755785a.6.1752228441514;
        Fri, 11 Jul 2025 03:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrWNOlRhFuBEfA5EPZynQzF8v5JBD8YYJNHk12CZDzRYg39rtNgm6sSnObsdsSkGwVBUSA2w==
X-Received: by 2002:a05:620a:1a23:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7ddea4222a1mr161752885a.6.1752228440873;
        Fri, 11 Jul 2025 03:07:20 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c952b753sm1992960a12.31.2025.07.11.03.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:07:20 -0700 (PDT)
Message-ID: <f754d2d1-689d-4681-8cdf-9e1e5daeb6f4@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/msm/dsi_phy_10nm: convert from round_rate() to
 determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
 <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-1-364b1d9ee3f8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=6870e25a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=oYwTbBpYGhGVpGtzMvsA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7JRZx4NyyYezW7SUlipYH1TTfw-RvqnS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MSBTYWx0ZWRfX7YeDMDHamxMh
 V54n+Osf8MizA6hHl8MRAhwLNxZWp6WVchcb2axsRCdEwnZKxiXmhzS/v6idq7JwicWTY8Vh/kj
 TO0YxFFLs8+ZvncJ5vjmF0Ezo+F9ZzPa+Y8P7Qs+jLNcFHTmrVSGykPnHIiiwCuRFZmhx7tjahc
 4GwCLfBW6lqoKk8T80YmWPuFtTERE2lKEazR3aNxFGHSvuc79mTgA0Xxs6LYKoD5R9XlC1Azntn
 ZBappzRrYSinn7+pmFBmL+BomSCrAtVIxF5yTbhkEkBU72DWaiP8p2rUdldqslDgBw1yRRqo5iE
 W2gAzWjKS1kE6WRa6oWzg1FBo0pNCQDMWt4Jb5rqCbxC+80/vEL6CXwYDI1bxi2S1W1X+9GXN6C
 sgq5oV/q7PqxZmhfc5ALq8R0E6hvtJS/6NXpM6jZ4iuJlOxoKXTryhnzMisB58/+DX31klXM
X-Proofpoint-GUID: 7JRZx4NyyYezW7SUlipYH1TTfw-RvqnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110071

On 7/10/25 6:27 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index af2e30f3f842a0157f161172bfe42059cabe6a8a..d9848b5849836a75f8f6b983d96f8901d06a5dd3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -444,21 +444,21 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)vco_rate;
>  }
>  
> -static long dsi_pll_10nm_clk_round_rate(struct clk_hw *hw,
> -		unsigned long rate, unsigned long *parent_rate)
> +static int dsi_pll_10nm_clk_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
>  {
>  	struct dsi_pll_10nm *pll_10nm = to_pll_10nm(hw);
>  
> -	if      (rate < pll_10nm->phy->cfg->min_pll_rate)
> -		return  pll_10nm->phy->cfg->min_pll_rate;
> -	else if (rate > pll_10nm->phy->cfg->max_pll_rate)
> -		return  pll_10nm->phy->cfg->max_pll_rate;
> -	else
> -		return rate;
> +	if (req->rate < pll_10nm->phy->cfg->min_pll_rate)
> +		req->rate = pll_10nm->phy->cfg->min_pll_rate;
> +	else if (req->rate > pll_10nm->phy->cfg->max_pll_rate)
> +		req->rate = pll_10nm->phy->cfg->max_pll_rate;

clamp_t() smells better for this series

Konrad
