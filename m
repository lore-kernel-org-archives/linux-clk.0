Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E534C77D7
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 15:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448025; cv=none; b=umIZ7E9TNvbkPmxXgyjORMKdhI82hWekqevXUtA1iYdCIqAZFuCJ/r2AU8LVkgdf+xDRdMnTo07l8nMjcP7KF2V+dCekyUNGeGQ3ypBmWpdWdMOihxJgUVxeLV1JLdZ9cNVxK7F/Lx8gx0xOhcmrYOxg5GRnGNQ4cVhOCLgIWiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448025; c=relaxed/simple;
	bh=UcMfgKoIgbjA/Yt1Y60klCeHwQzhR96tNxN6tCPrud4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIxFxjtNtVv/IaqI++tvBZEAVRcxu8lhfcRUPT0DR7Gle4i1qKEgdHOnpPHt5rG1K2urFQuuQ8rNnN+Gkh6OKK88O3TUW9xG25gaOESM2yx//Fm7MmH+s8yE7viF61+i4vNOyJfZAy4GNWBqmnBjOJv2YL8NLi1eMB1bGU8epWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iTVtJ5V/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsMRik9t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iTVtJ5V/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsMRik9t"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAPxk035536
	for <linux-clk@vger.kernel.org>; Thu, 3 Sep 2026 15:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJQlwKWVKCEeiPvskX1SbJyL3p4M8HL541YIt9e58Tk=; b=iTVtJ5V/yDPSlXFV
	Gq/ViW3j9yBXcY5xAmGzZN3sOcE8LJ57Rq9NoEI5hYN/Us9/0OMl/ilx55zoL99q
	Ioj1bwu/iszqBdp15p8nD0D607dYHNUuGGVVWCJST24ZVJShQKQ0xCrrrkB7pRfA
	FwgvWqvw1bUI5L7JStzfeGobAb+i62JlApnOg8a/2gJ2SAgyZooezJKvnSPqCt1B
	/1UANVZeYmuYnB/kkL7VhBLl24QxqIOgJ95HTdmv7iWMAfbfoer6Rrb8bTilfTZg
	1HzC626ud9Ko1niZj1A3dLBBtmA+Dpa+CHZ+Zlrhny12TCbQQG09QG1USReZxn/Y
	lil0kQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m1qvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 15:07:03 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d54187d8b0so67474855ad.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 08:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788448023; x=1789052823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJQlwKWVKCEeiPvskX1SbJyL3p4M8HL541YIt9e58Tk=;
        b=HsMRik9tcvWmnMlbFKYW7k4oHx/qUUjglR4Vbw6pvXFijiJLsAa/u8Q0YfNSQPRGkK
         LgxUH6EG2+xMgcRzSZnkAiY5STY3DfTBlDi29fKGZXa5F5gOtZIMwTa7p6vF4XU6yK+K
         5ZcYGOw28BeFZZ0WVBoz4NDz1cXZSfm0/xZKAX10DQLotYuyQAyZTD7IkAK/p+n2PjpI
         +CA0yvS1tDvvhiUIhuuwn/7TPKl2rkdVTMToHoT+GrNUNMfx0MGK7f5m4rxmvQYg+rkC
         5PNtYbtMRewK+0+w+vOJqjkwwzqjB+2e58uPLHCLb69OzZJnU7k2jbztAHVFLj/jsxsG
         yq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448023; x=1789052823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJQlwKWVKCEeiPvskX1SbJyL3p4M8HL541YIt9e58Tk=;
        b=r2RAW7GDluCL4NJ34Zl46HgeERPnQtsXpvvAeYtOVUHpUGAPHbYe/HQhwH4y1hPrRV
         oQsgvQVqgJQqRPcE84rcKwVvcBoczApNfNPuKoKZDNDRfwfEB0CslKjn5ppAUHSx1GGB
         uY15DmuakIxpDiDh9jMuh6WllIriHrxkjcyloKZMSDR1VVkvH1iie9GYOpzguayaDyB3
         QMOpaHUKiaIu6RElwehHJr0xEKoar/iNzOKqiPTHUkg0/GIzII1TWHEXtz1rQHwZczxE
         j8HeI7wGD1BYzwp1YG2Gwzh8K3+Paz8CxylA/isgvq99VMFapOTuBVFk42kJ3xP7DVbC
         SZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBwgHQ5tGehNx2xmzuceAzcXL7d9PIcaqhSDRcnbRPXnCJINOujVO5f3YhE4KKqXyeavnR8Adj3hueA=@vger.kernel.org
X-Gm-Message-State: AFuF++koXI7PjJiNTJlmkakWK0msoGaOO26k7HBIgDgJT2iYNa/u+4fB
	U1w978dEXH4Ka8yNs+coXqMS4FONJrSjikZj9zks7aOgHkVC44AgMEyQyKBv1TcdjR8DoD4OLt4
	S945/UuCKrOrbvk3z9tS7dfp4gQol4nCvu408jsb3xDelJ3KE3C2TFAWx1fxOEpQ=
X-Gm-Gg: AYBFou3/1TYgA5tot9Z7WcT6o4qYebdvLo53RVz2UnYZS3vwAv6xTVbOe2U6JheXD2y
	dcV7mlAx8o5gtAtQFkJLNhizc9NgMHQG8+EfvyYejuWuXnwui7yxbZ5/Szh7xE4XhtFSvVINjlS
	e8oqUHTmg5oNocaXi2GwuNxy5diuHtg/fzTWYDaDneGgeGmQXTdrHhdyEBk3hAv7hkKIdoezG4h
	H8UKVYhDFvBd9cFSLONv1DRc+mFcYn59hejwF4OJOUtiWqnDH2tnjZnKUW4m2FSgVLvEr0g8Y6b
	KW9pX7QoVpfWU9nTOqloaPiveVbhhOT+0+3DlSnZIxtxmSVEhMd2sQ7CN40v0HRnV2KuCaChUEV
	mzKuwRhFcsvkFEbWN6vlS/p7S23m4elCvUZhcuF5EbCPsXgp9/RUYscupXagesmFf
X-Received: by 2002:a17:903:3c65:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2db104e87famr6825685ad.1.1788448022338;
        Thu, 03 Sep 2026 08:07:02 -0700 (PDT)
X-Received: by 2002:a17:903:3c65:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2db104e87famr6824365ad.1.1788448021745;
        Thu, 03 Sep 2026 08:07:01 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe929d77sm11790525ad.39.2026.09.03.08.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:07:01 -0700 (PDT)
Message-ID: <d93ad481-b574-449e-97aa-f5d1828f583b@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
 <j6m4b2psvvg65qksij63wxo3aqoc5ldlfehqnywa3i33v4pm5j@lr4i5o2g6tdt>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <j6m4b2psvvg65qksij63wxo3aqoc5ldlfehqnywa3i33v4pm5j@lr4i5o2g6tdt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YSjwoH2IDbWP77YCs_jnfdYGwzpdybXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfX7UkS1pcGcDIx
 Z1fvUPPa8No4JkEB5DKMp+VPfY0WXknKFQvGFwZ3EeGV9t2h/th3h3B4kqF9p1mygkw+WB5mwWz
 iNzJZprfM/EBvTvgMtNcmXqKy2BijM+WA4olgtorueFdJv4MIyB0Baj2nQS1mXTXtLcufpOW9fr
 BgCZk9dOug82htTB/n1mMdQnuOSaUOQ8Fj1UWvwH/FnS5Mj2jp6vemsJnKo++7kH0c/7rYLPdIy
 nXm6Sx6U4GoIfGdtCouaZ8yLON0jh1XtXKTymFpslxL+jbAUNwh2ikWqGw4WMBf0dBZDWWINYmQ
 HGvqhTVnMsrP540vsrf5sCWp9qmpy6ADy6XTRklgcYL1ZJLR7n13l/yp5xGDOvW17sceYUJJJFS
 49CcfTGKhZWfM9z+5tFKO7zkljletcTToh2qHEX1ch+Id83R4k2rD7KT0TcQhfFmHAntA7gnKxh
 VGSKWLo3SIy3Uqygn4w==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a998d17 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_0NKdZRjI3JEYUyFDiwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMiBTYWx0ZWRfXzFG7hGQvRIki
 7iIESXvtW2n9q08aqRDvfXFeYUVY1h22fm/gBoC3ThjQQFOz6nCI0K7tqK6Los5zBUzlbPSLOaX
 VrC82xs7sID4cDmx4RAg+ChbVNBuRJg=
X-Proofpoint-ORIG-GUID: YSjwoH2IDbWP77YCs_jnfdYGwzpdybXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030132



On 9/3/2026 9:18 PM, Abel Vesa wrote:
> On 26-08-14 05:48:14, Luo Jie wrote:
>> Most CMN PLL output clocks are derived from the 12 GHz PLL output
>> through a shared, physical /2 stage, ahead of any further per-clock
>> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
>> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
>> This /2 stage is present in the CMN PLL block on every SoC supported
>> by this driver, not just IPQ5210.
>>
>> Register this /2 stage once as a fixed-factor clock, "cmn_pll_div2",
>> and store it on struct clk_cmn_pll so the output clock types added by
>> later patches can parent on it. The two plain fixed-rate outputs,
>> xo-24mhz and sleep-32khz, are the exception on IPQ5210 SoC: they stay
>> parented directly on the main PLL clock.
>>
>> On SoCs other than IPQ5210, every output clock is a plain fixed-rate
>> clock (CMN_PLL_CLK_FIXED_RATE) whose rate is a hardcoded absolute
>> value rather than one computed from the parent rate, so this /2 clock
>> is registered there but currently has no consumers; IPQ5210 is simply
>> the first SoC in this driver whose output clocks are modeled as
>> depending on parent_rate, which is what makes the /2 stage significant.
>>
>> This patch only registers the clock; later patches wire it in as the
>> effective parent for the output clock types that sit downstream of it.
> 
> Do not mention future patches here. Each patch has to stand by itself.
> 

I will remove the reference to later patches and ensure that this patch
is self-contained.

>>
>> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/ipq-cmn-pll.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
>> index 4fdf78f6829e..bcb51a5f559a 100644
>> --- a/drivers/clk/qcom/ipq-cmn-pll.c
>> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
>> @@ -96,10 +96,17 @@ struct cmn_pll_fixed_output_clk {
>>   * struct clk_cmn_pll - CMN PLL hardware specific data
>>   * @regmap: hardware regmap.
>>   * @hw: handle between common and hardware-specific interfaces
>> + * @div2_hw: fixed /2 clock derived from the CMN PLL output; present on
>> + *           every supported SoC, but only IPQ5210 currently parents
>> + *           any output clock on it (every output clock except the
>> + *           plain fixed-rate xo/sleep clocks, which stay on the main
>> + *           PLL); other SoCs' output clocks use hardcoded rates that
>> + *           never depend on a parent
>>   */
>>  struct clk_cmn_pll {
>>  	struct regmap *regmap;
>>  	struct clk_hw hw;
>> +	struct clk_hw *div2_hw;
>>  };
>>  
>>  #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
>> @@ -362,6 +369,7 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>>  	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
>>  	struct clk_hw_onecell_data *hw_data;
>>  	struct device *dev = &pdev->dev;
>> +	struct clk_cmn_pll *cmn_pll;
>>  	struct clk_hw *cmn_pll_hw;
>>  	unsigned int num_clks;
>>  	struct clk_hw *hw;
>> @@ -388,6 +396,20 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
>>  	if (IS_ERR(cmn_pll_hw))
>>  		return PTR_ERR(cmn_pll_hw);
>>  
>> +	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
>> +
>> +	/*
>> +	 * The CMN PLL output feeds a shared, physical /2 stage ahead of
>> +	 * any further per-clock processing (a gated fixed rate, a
>> +	 * configurable divider, or a rate-select bit). Register it once
>> +	 * as a fixed-factor clock so the output clock types added by
>> +	 * later patches can parent on it.
> 
> The comment here should only say why this is needed. Do not mention
> future patches.
> 

Understood, thanks.

>> +	 */
>> +	cmn_pll->div2_hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, "cmn_pll_div2",
>> +								       cmn_pll_hw, 0, 1, 2);
>> +	if (IS_ERR(cmn_pll->div2_hw))
>> +		return PTR_ERR(cmn_pll->div2_hw);
> 
> In fact, I think this clock registering is self explanatory as is, so you
> should drop the comment above it.
> 

Agreed. I will drop the comment above the clock registration.

>> +
>>  	/* Register the fixed rate output clocks. */
>>  	for (i = 0; i < num_clks; i++) {
>>  		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
>>
>> -- 
>> 2.43.0
>>

