Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215EB2EB5A6
	for <linux-clk@vger.kernel.org>; Mon,  8 Jun 2026 04:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894010; cv=none; b=cAxMHJiTSIjvsWUh+59/DMLszMrNayx9PT5uGIpOu168YbDZEMm6n2i8xiYs0e7kcjjqY5nCl1aeBH8FF8KZSz2qqSELyPi/Yko/D1UH21MY5K/XjavL7tcIkNQ56Il22Ci9gnkuGDA/qJBblB+/sNxqupEAXQkn55WfRlZuut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894010; c=relaxed/simple;
	bh=/LzMqcu3HHGE5GBV56yl9iCiM+D7QtWOREec3mGMfy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5eNVY3qz06zZTwuw+MZzbzAi/HphKTqkCQw6LE9NskVUPJTnjpL2DDvXSxAe2APsp5WnAIyMlJH4jUekmB8rWdH/s/v6BLHJe2e8WMkqxIcjAeyICtJSFtw1TKp1QU6W7DH3tGO8w62EfZmRWBXo4K5stxxdUrttI58Cub93nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Op28MRt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBGTYaeI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Op28MRt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBGTYaeI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GCd32005712
	for <linux-clk@vger.kernel.org>; Mon, 8 Jun 2026 04:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=; b=Op28MRt0CQd+bmiL
	ZNZK2H2S+JI2Uo5Zd+z0JwD+S2pGVeI2xFxYUG47QfknUReW05Eneb7dYcjp4Mqp
	E29Q/Dn7XPBcWhXnLcCP7s53joLMZ5QxkPYVzTRCZVCwCkYYxkouzVY0vgQKGn4V
	XOT73dxR8EMH6z4ONN2S7U9tJArEdx9TICXESRmfLbM4nMyt2Dbde5wd0Np7BYp2
	9bcqM1UlCIh7F4djL8YORPvbVMIt6ggpaI454jx+L1dXFDleKFhGxRvOgchhXki0
	gNcF8EPfrK3VT9PnpUTXElxL3bYlVrh/Eib71bM3wA5s3M4tUuf4aXwSsAN9ucri
	TC0KEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w5wr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 08 Jun 2026 04:46:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso53467915ad.3
        for <linux-clk@vger.kernel.org>; Sun, 07 Jun 2026 21:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780894007; x=1781498807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=;
        b=HBGTYaeII3fTv0Njehh4iIJaMI9qWDgw6o1TgwE9j8pJ3hcggy0L1ArYN3l4bF68wr
         7ZoLkYZehEtddviKsNvNGTsTwugWveXPBTAqU7pTDoJobdutNF/SxbqQ9WR1fAZftmUF
         lWw1oDMu8IyBrm91z4tJB16Ssavhhd4nDyJtlNWnsCSVG1iyGYzGSxE3CZhszNgrECiy
         2WLNRo0qs1gZhFGbYYoouf0GThUxjcpM2bRW8sqC6agQKxy2qoo8M31FbE2GYSm8EZvD
         1VLLzjoK8xvCOnGQwSZ5Gn0TNHsL+/Kd79C8Lo4YRGA1NEXkn1Q0I6vAci/V4H3bvxjI
         gmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780894007; x=1781498807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XaXdloh55VzPZiCRBES2vXV1HkRk8zMeWbdqdMEo94w=;
        b=f/OysnUboX14RazxMVhpUVCr2Kk4GchKIbtpXI4ihfNFq17XzjXf/m6ScYgGzjMCga
         Lfo81c6eloS4Auh9fg2fCEA+9Z0dA2fjJUveE2jv08TgzzZvqzgVAD94Dn8A9iEcsdoJ
         bi0cTl7AAFmMuRb0sN64uX21WkbT68rYBlALFYAfEuhezy6SJvmy6Wj/xL6ULL9KSjpq
         K51I90g9TkaoYgzXECyYgSbVhZ0vxxEGmnPoQzVsYbtY7erXhW8iIK2iWevdNqb6yAyV
         hmAncc4At7FHoYGbcV0pw0c5Sb2pJEZ7v6veiX+iPlaB8IHObHeNCq/qIcH1rAub/9C7
         Ytzg==
X-Forwarded-Encrypted: i=1; AFNElJ+DFIQ8tSD9JEzsqu4juTsz3VpyGhsB7xldeXn328pc+0UoOCAAcLQKrzCwzSIdBbftOPkoDUounak=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXCqS1pUubfddpXqZ5U6Tq8nGZ/GZCwtYdVPEUkeZ/9PR/9pP1
	jGVeJ0AT5/n9slkL2OVkOE2uX9X4O1Yvly14pWI1sXyMkfSAYTicpzxZjMHzYRpSniZFkmlUR/r
	2mFTTHcL4YJTMnFABDRMfgBoQv2xII+wbDhqt123wNYO/moRkVdlyDy6UjgqY83A=
X-Gm-Gg: Acq92OE/E3YM+PNDEu8i6/9ygUnCWeFGA/+BOBBdHZEEavn7ermMC+mM6D0g5xFR7xv
	R5JGd0SvmHI1I4Q4P4lN3j7/sOcbc6v0+DEVuho+0lVW2bOceg6oY/YwR0aPUkXdRL94xoEdFYf
	ArEKrLYCbthIgQd82HQJuMjiSDI5YfxZU/UnIuCxlS8jRnX8gF8f1+pgZfypAYfCxt8G/O8IaMS
	gIGC+pvbCTwpaiWCUxy6YRk8E7IGOpofqL8xK1QbnKDdZPFh39rCJ9NteTcGyS1iSFICWeJ233Y
	MlskzME8S2uoRkT31ASWczi2IBScMjHBahMwXfvf3lnKNbYeZUkNCWN4POBXksOeQmRJZu5IByc
	Q1lIlI3AECBtdhXzDE3gbjsmt+rqfpG/af3SUsGvTzE76cU6e0v14yfik4TA=
X-Received: by 2002:a17:903:acc:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c1e849512cmr151618565ad.20.1780894007078;
        Sun, 07 Jun 2026 21:46:47 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2bd:6e1c:3ce with SMTP id d9443c01a7336-2c1e849512cmr151618215ad.20.1780894006676;
        Sun, 07 Jun 2026 21:46:46 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm173655765ad.27.2026.06.07.21.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:46:46 -0700 (PDT)
Message-ID: <0a7f8ee4-2bd4-4ae6-ba6c-72b37d6ef92d@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 10:16:39 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey
 <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
 <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jb7-IV0DaKhvBPBaeuu2z9UEW6mQjeYb
X-Proofpoint-GUID: Jb7-IV0DaKhvBPBaeuu2z9UEW6mQjeYb
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a264938 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ayl1ZFWQluqbhyEjsXUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDAzOSBTYWx0ZWRfX4H3BKC4ZR+MB
 orUtMYKb9AWDZ4BO6Go19vLmr5CTXA56fDawVziuzbNLG61eDCrq77MDvKHi3e18V0ErZzY89CE
 Pxyc9NhTvyaOygfOyBBjemo0nD3A3q17UADCwL+y8V/SUEJTqkFMGlSTaXCuE4V4FYwU9mx6YSF
 FbcUhvwP9jwTP+JkEPYe/9Y6bytVf/nPRj7VjttMM7zP2ZjHcCAubN/kFgASgECDDbiBoYULcxq
 /FflYE0AHegLCAMH5ND3OC9xKFsCEIfoMyhFq5I/qM3nblZEThXldqS7uaxSe5A6NIxsbwFuiR9
 3MuBGk7GAQWJo4SfU2sei6hpSZ8L3cgBtkHfxDPZJ9n9NP/GbfT5siPuady1sgp9egAG2lkRURF
 WBjG9zhGgt6fQpRrhprIynobIK2nsi/NmF4KTvnKLwZEtYHd5Y0dyCJoLNur/vKa19ihUO1OQ2k
 NZIb0lnDk/Q+PYLlfJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080039



On 06-06-2026 05:12 pm, Dmitry Baryshkov wrote:
> On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
>> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
>>
>> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I know that I've r-b'd the patch. But then I also compared GCC on Shikra
> and Agatti. Is there a chance we can merge those?
> 

The Shikra GCC has new addition of EMAC, PCIe, TSC, USB20, QUP subsystem 
clocks. Along with this, several Agatti clock/reset register offsets, as 
well as votable clock register offsets and enable BITs are updated on 
Shikra, and a few GPLL changes are also present.

I agree that few clocks duplication will be there, but it will be a 
clean and better approach to keep the separate driver and bindings for 
Shikra due to these new clock additions/changes.

Thanks,
Imran

>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/Kconfig      |   10 +
>>   drivers/clk/qcom/Makefile     |    1 +
>>   drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 4442 insertions(+)
>>
> 

