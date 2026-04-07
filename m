Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227A3A6F15
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556796; cv=none; b=GM07hpUu4vQK9PkvrukXFoy6DQOloExCtq4k/x1+yga2eUEWAntAIv885jvqRi1mXqOrHDgMWlgAvgwanAMUgSEDIO62wESb/KSXzO6P5r9mmrWGBZSswF/boiPnS4F0eMHv2DgEHjnQPdh6dLGYzrjjYgs0ffJU6xfVrqsWmAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556796; c=relaxed/simple;
	bh=BeRmkF1AixGu0dDOhZq+ut21Q+0Lj7EFqDNljeqWR/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3QHe2r8EAIEbWPBQBDUm+BJWQG+WO/SVSbQd06JUUQ0nBL3Auhyt6YP0IjW9MqrSWc9iz8Yl8lJvxGwx+6wnL7omqvH4HTHiXRwwSfvqW2c5pMb/0pbg13h7hr43ECurfY5T9Nud9uXUluALavHCK9ESJ/O6QfJzBy4rrbSW7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrhP9xAJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1Q5aoha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrhP9xAJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1Q5aoha"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376dxkX2328037
	for <linux-clk@vger.kernel.org>; Tue, 7 Apr 2026 10:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwM23ebfEnjAfxbCREGtqZRfmTKIBdktg+hDX1uVW00=; b=ZrhP9xAJlnYdFeYg
	3TW2KaGhemua03DJuleHF3XLO0NhJ2L2EliJmwKUrNcm2C4Tgt2oDloldS87gkyv
	5+X5whcXEPtJ5c4pNQDJe1OtP5NbcBV/bc0ntjKX6J/pqXKzxwtEiEgbpxYMChP7
	V9CMcH4beGBp88W1ZsLzVPQO6XHKWy8gz9NpFeetZE6DJKNnu+NJiZR7ZjObJhTB
	YFD0LA20Vzk8+7RuOsdD9aNVOuVBrWhcuM5N0GNoSokWs/1omY9qMhiEj/dizZe9
	YHPBzRl6dmyyoLsfrgQDXKIRligvbBT9+GaMNK6TC64LcJ18QZ9n4j/2AXz0aB5D
	V8dX+w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcms4t79x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 10:13:13 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89e9d327913so19439166d6.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 03:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775556792; x=1776161592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwM23ebfEnjAfxbCREGtqZRfmTKIBdktg+hDX1uVW00=;
        b=G1Q5aoha68UqIW2vzRNZ2Xx8zWKq1XWBFpttnc11roC917oS2C1/7L2zmEQXVxttDn
         CI+6NYCBv9w0FOJTNyH0eosVYJyrlMIpgOze9JYwyuZeWKdheCkUn0edQPQsrU1fZ6V2
         vaCfdY9miXzkwVCCU0dWRRyFhTtU4GGIF/tbWrIHTpEKTYqg9txCjolwKocqksvCNlYi
         ERfXGgBV3arpwPzUbN6+JyniH8jpeVgU7SVrNyzDk4Tx9ZRXIM+qg7B5GP2vGcEgY5KW
         xy4zH/K4vQvJ+JOGdJ9Vtm/3FJJoZqh0FgDyzbT0tsPVujpNVRHXu7BtLvAhiuk3HdDs
         v9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775556792; x=1776161592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwM23ebfEnjAfxbCREGtqZRfmTKIBdktg+hDX1uVW00=;
        b=GvkcfL6VtVHw5WiS8vTVcPveNG3iMw/Ca5/Ft/mbea9faLwxynqjJTQRY2mjbiz2Zk
         7EIgilL7oA008ClXuhDeYvja8QlK/efLD1UHEAqzfFhst1XcCmeVcd9RaYg1gcvWPPEc
         9INkv26nigYXO43s34d9nYDLsVp5Am4k1fWkkrjoI4t+R6OKUEhfebWaG7JM6yOohBc/
         kpOgzcoAia0aiU9n7iSjXRpzNSzx8niNmPyvbZoMtfKUMmUyl/oTzS77JA/mOGMz3hww
         aqwRMsrxNcQ24uGT2Ua1+zGv+xe1EdwNWFBC5d2R+YWAbdtbzqmY8/gWAT+a8puEy1ep
         lTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfwr35YBwRajWKTu5d9TRsUU+ef1jLlA2+E6hJHq+jBrHpXLzGmSSU61Zb7sgqoWSI7nHTJ+EU8KU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Aj3tTQWCUqYacPtwlm6ginHi1efpOM+Zucr1xxyW4OkVcde8
	DvtAWtJpS0eYHMDSJMKbIv0B/tKil0pRVZsj10iasyxlMdypEuaZgnE2wkOQHqDKy0xUzXhb8R1
	N5cSy30hXscwM49O0GanXG92hTUsK9h4l+xLNHUWXm4ExUuazlAU01ynA1u2Z97c=
X-Gm-Gg: AeBDietZrKk9tDRdlLbqCB7HCOJV1hGJ53ZNY95juJhIzMmHjxn71oyA1NAasVXI6Z0
	7oJ9dkqEMWywjPrqMgbxsSAAUzjn6MDC9Ejf/j6E7RGXL1SkVg+f80rwHn4Zm83aMPcvSZBlwwW
	asJfnvh1o/fv06IEU5XObrQ4LI1IanZJ1jxt7y9Tdetc+ThhoyQ6MiAbhsl+gQ1eZuPGzd1wrpG
	LJMF8EldsKYRThNaZLnx+C6pvhU9Dk6q3WjneN9aqa/NI51lIjyrqoHf4h/6RmeREo79NmCrosv
	PXfF36d6lowtYVvR4UkH4uzLBK4lSyPc1nm4pEkOrHHbxB920gC8UX+kDqo31p/Ebl7hpztPNG/
	tVrnOn+yMUdRrBCb/GXCMHfgP2nrsfyZOTad6mAKzo/lIOJjFUgfTNZQ8BaeZ+EKQTBv4L5aVIh
	4H9kg=
X-Received: by 2002:a05:622a:5507:b0:50b:5286:f757 with SMTP id d75a77b69052e-50d62c846cbmr168680131cf.4.1775556792547;
        Tue, 07 Apr 2026 03:13:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5507:b0:50b:5286:f757 with SMTP id d75a77b69052e-50d62c846cbmr168679951cf.4.1775556792094;
        Tue, 07 Apr 2026 03:13:12 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e445e5b8dsm3182110a12.12.2026.04.07.03.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:13:11 -0700 (PDT)
Message-ID: <c2cdc581-2f8f-4495-bb87-812b27a1e381@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:13:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: clk-rcg2: calculate timeout based on clock
 frequency
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Mike Tipton <quic_mdtipton@quicinc.com>
References: <20260406-clk-qcom-gpclk-fixes-v1-0-7a14fe64552d@radxa.com>
 <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260406-clk-qcom-gpclk-fixes-v1-4-7a14fe64552d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5NCBTYWx0ZWRfXz4E86yW0GSLE
 SjR9Pk48p5sphVRi5EAT8YwaEymXtijSFykOFZGG0rdGDJJuSTjaynZED/s+6jETTIjsTMLVl43
 rgGS1U4SpMPjVKXFizVpAtHpXm6GBU8QPKBaqVtADhQx9jEVP9C8xkzUTMzgRB7ulD8+wQGMEc0
 R/ww6i51xmo9lIM/cxBI9UC5tOchR7t4UHMXWCEo5kJyjzJUFeAqg9mMegHiTdVCfuvvk5kFSPK
 PXA3JwKykKHVuCn24a98KoCbUrZyZvttkz7qo1pOL8eWEMNbJNN5Dz2e6fgn5Ic9PAhXnYIoQnL
 Ah1TQjkc3sH+cz55+v24jhJI/oapJ+vIzA22bgHkIMbK10sPNAvh2sDuC90VsqezM5TNTxLmeef
 B8Lubuu7zFbAvNlCFWTi8E4hwvZqyQ7XIUs84TRY/bG4s2BIgaSDZlm5ylOau6JsudWyjxSZPru
 O/JRVZdWDwFyy99C10w==
X-Proofpoint-ORIG-GUID: vE4M8iGAr5eWd4t_ZNf32z1l4FhRD2Vn
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=69d4d8b9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=COk6AnOGAAAA:8 a=Pc8_uKcFEXUdqOsFkrUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=fsdK_YakeE02zTmptMdW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: vE4M8iGAr5eWd4t_ZNf32z1l4FhRD2Vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070094

On 4/6/26 5:54 PM, Xilin Wu wrote:
> RCGs with extremely low rates (tens of Hz to low kHz) take much longer
> to update than the fixed 500 us timeout allows. A 1 kHz clock needs at
> least 3 ms (3 cycles) for the configuration handshake.
> 
> Instead of increasing the timeout to a huge fixed value for all clocks,
> dynamically compute the required timeout based on both the old and new
> clock rates, accounting for 3 cycles at each rate.
> 
> Based on a downstream patch by Mike Tipton:
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/aa899c2d1fa31e247f04810f125ac9c60927c901
> 
> Fixes: bcd61c0f535a ("clk: qcom: Add support for root clock generators (RCGs)")
> Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>

Having Mike's s-o-b here is odd, given you've decided to go forward
without his "From:"

[...]
> +static int get_update_timeout(const struct clk_rcg2 *rcg)

Let's tack on a '_us'

> +{
> +	int timeout = 0;
> +	unsigned long current_freq;
> +
> +	/*
> +	 * The time it takes an RCG to update is roughly 3 clock cycles of the
> +	 * old and new clock rates.
> +	 */
> +	current_freq = clk_hw_get_rate(&rcg->clkr.hw);
> +	if (current_freq)
> +		timeout += 3 * (USEC_PER_SEC / current_freq);
> +	if (rcg->configured_freq)
> +		timeout += 3 * (USEC_PER_SEC / rcg->configured_freq);

I suppose both are nonzero if we end up in this path but a check for zerodiv
is always welcome

> +
> +	return max(timeout, 500);
> +}
> +
>  static int update_config(struct clk_rcg2 *rcg)
>  {
> -	int count, ret;
> +	int timeout, count, ret;
>  	u32 cmd;
>  	struct clk_hw *hw = &rcg->clkr.hw;
>  	const char *name = clk_hw_get_name(hw);
> @@ -123,8 +141,10 @@ static int update_config(struct clk_rcg2 *rcg)
>  	if (ret)
>  		return ret;
>  
> +	timeout = get_update_timeout(rcg);

You can just assign count = get_update_timeout() below since you're not
reusing this value

Konrad
