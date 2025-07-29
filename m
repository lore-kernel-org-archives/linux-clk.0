Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA956347DD
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753795746; cv=none; b=InxdzWVlLQ7/0IWZo7VnebXjGOtyBUbsGXaxe1pPqyd3TqNJD3xFHUiNShS89p63BXvajv8UyleeMJlN8SxikAgxqxuT/Kta48wArK+eIgRTR3BGxOthVIHbXY72aHqC50Qn6MXitHS1bnqPNT1Myr7pGVjxHcHh1tF2OkTY/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753795746; c=relaxed/simple;
	bh=fnAXK3gfqgcC7/NAyRO1/1pjDs0DPP/sApVyNzGYdZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YO1f31gEluqOOFiodTiNxkdxzVvV3NVnlfeCXKQRjHAYNPpER6fuusHZMIQR8NuoEBZXBNxu4+leim+AHgTDmEhqvjTkqZsv3Zni4+q7yfvXQI9vBcKfmRTwC9kP7Wgh9z68xJYWbXXW5R2thOhFWJ73f5Dst4763maXWDKT3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FGQQ6qY3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FGQQ6qY3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8r5TN014570
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 13:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FhXDYfPPwtkj5AyH1dzVWUPlMdS8XJcp0relIk410Iw=; b=FGQQ6qY3lZY9ePjT
	HtNXiUXkicKcPd6x6tO6WWOCTY2M6axafq+H32LdKzK9v8Jx40EaEQzFwxmF0nyR
	vXaG9uELdpu8xoQhzERof9tEy1n8W7yF93M4nAiTFL0PiHRQvdSJtelbWZKQhsBl
	qP6j+M+OtZyi+7hZ0M5c56YY7PST2EwDPtaXQ3xWz/RnTsIdD2s0OwWwwbe6mubJ
	mb5MTrdEsd1hh6wXmFGZicJgypPO4UApk36WCy2pI2i9SDd2uor9kM80axIoAuwa
	crA06MMhJgMRTeiRtEEE33VT9KwZ0NRbY4BYYmHB46Zj0l400HYV8E/RsHNBwP9r
	KktUDQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xr663-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 13:29:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ab3bd0f8d5so14278611cf.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Jul 2025 06:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753795742; x=1754400542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhXDYfPPwtkj5AyH1dzVWUPlMdS8XJcp0relIk410Iw=;
        b=dKR/aGI5N5JjGmVjws56PwjLgNKrZoBX9EURMbOOMc32HL5OfWU3PIRJcNt5jPdY4W
         1GHZi3Li5WGySeq+Hn4oiyTiqa8ISsUgyJ4OPbRUHi2lwkTT76BDFFvJxIJa2kyD+SbZ
         PH7ZtpzYOOWRx4maRHw63+23grvD8mZr4NbHs5/yDGdnvNGhCpdUJ4FuhMjxju3F+YMS
         W+FVY7GE+Xm+FT7f5sWp15Xd9lNuJRZf+U33R0LdD4Mi6nDUvI/Zs3Y77Z+dgUErTFuv
         G2MfovvLLpg1hXtiVPTn1zdz16dzaHzBX4L1qIXigDaGEaUQYKkoUjvU55AAo1IzGP2T
         Sw9g==
X-Forwarded-Encrypted: i=1; AJvYcCXDaoDfxfniL2IIvi2QwsIQ823LheBRPHI9uDPOCtaEccYBnteTs6Uv2OJK/1+HdA8sB/UVI+CCa2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBsc0bYFusyq4Tpp2JviK1iFVXO9A889sDxFRMEg4NIuVHbh1A
	WvOVIa/QR9a6ylImjeiN173PDmpwacSFHV3OXvx8cteX7Xb9k16RPxT4OyqGl0KOzJ49SPW/6K3
	wXcNLFr1Hlz76Uc9Zr+CT7DMICkA8r+FV0Ewc298zLxs6idMEoCjFMJb96UQXoLU=
X-Gm-Gg: ASbGncsAhnEoroosm5+nMtupNjY5dZLF8XVqbOoJxiaLmzHrQF98XLbgke9fHRuyGny
	60Yw6Rq/Yd9fSaienXXkVOkRVXGEZoPvUa9tP4wg2LHrH2WuftESbZljxa7coW36M/KFt0cTC3d
	ihQKXNMRVUI+HHFBmgnh3mlfy8c1fgaT+d+ypGtJLVqoEEcismepg4cHOvrVPIWdXSQqMYVXE0d
	FOTPACFePvM6Cv/s4UctEle52SkEHL59hU3PIQRkoVuH2eoIAk/qrZsGRpWh9O5RQW5z/XIKeme
	jyAe6nIAuZWdsR2icKbgGJLv8AbLavArNWjf2K8QJseyblFhrDMrMSEWQKyt+LBuMu+JayimFhQ
	CRIDm/9vSr8fhX8EfLQ==
X-Received: by 2002:ac8:5e4c:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4ae8ee0ec0emr85525101cf.6.1753795741601;
        Tue, 29 Jul 2025 06:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXKq2xaIvarfhRnuoE1bKTGMTI9LUV8M5rVt9cHs30QApy9wY+ryT5G578A4lyjZdiK0oliw==
X-Received: by 2002:ac8:5e4c:0:b0:4ab:6d02:c061 with SMTP id d75a77b69052e-4ae8ee0ec0emr85524591cf.6.1753795740997;
        Tue, 29 Jul 2025 06:29:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a66719sm574050766b.73.2025.07.29.06.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 06:29:00 -0700 (PDT)
Message-ID: <0a1337d7-ee3e-47de-a401-b25586e813e4@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 15:28:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 24/24] arm64: dts: qcom: x1e80100: Describe GPU_CC
 power plumbing requirements
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Johan Hovold
 <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Luca Weiss
 <luca.weiss@fairphone.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
 <20250728-topic-gpucc_power_plumbing-v1-24-09c2480fe3e6@oss.qualcomm.com>
 <aIevIuMDA5R8igmi@linaro.org>
 <50868cd8-68a9-4bad-99f3-8cf542886fb6@oss.qualcomm.com>
 <aIhrav7GKpsbVpto@linaro.org>
 <6b903628-9abf-4b9e-971e-e9338308d693@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6b903628-9abf-4b9e-971e-e9338308d693@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6888cc9e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=y9L28JTQkOqf6k3egjQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: bD7JFLs_KLvcmkr7RzXm5P1rK6LgTzLP
X-Proofpoint-GUID: bD7JFLs_KLvcmkr7RzXm5P1rK6LgTzLP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfX7tder8zmsof7
 KmJfXKQK+aOn9sOPw0ukk7CZTs3QXYBRQtikKKrQGv5QDb+5AiIIHoFy3JSEEfnB0MQN0VqTpuU
 FlgujFBikTPh+cpVdsl6czoAktJIq4xsJRW6kWaFgoz3Rozssln6Rw4oAWQZIMLBXZMZKLk4PE+
 J/Ht8GIm0vW+rMkOuLKvWr54Q68DP+fHlaIMMPKcQiyMMGCVe8HOa2ztAMN9ukCZeBPFcPvSgZB
 jMGTF5bGTU+xyFGG4vEcGD/vzqJKx9tjdUs8WBkKeU+Y4f2Cmnw67L4pcvNk3no12qeIHhOhVfZ
 JuvHO6yn/JdF8vxIiv3vneZEc6DjwIJrLi+GqXiqjlK0KoT9v9l/aQT8SvPQ+nY+9638B7VdGZ0
 DtDZZ6t9M1vePU2zE5o+B6mzFMdwnwTa+wA13AWEQfLyLg5v51zyOjPW2P5vJq4V8OAsR/B7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290104

On 7/29/25 10:23 AM, Konrad Dybcio wrote:
> On 7/29/25 8:34 AM, Stephan Gerhold wrote:
>> On Mon, Jul 28, 2025 at 11:31:10PM +0200, Konrad Dybcio wrote:
>>> On 7/28/25 7:10 PM, Stephan Gerhold wrote:
>>>> On Mon, Jul 28, 2025 at 06:16:24PM +0200, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> A number of power rails must be powered on in order for GPU_CC to
>>>>> function. Ensure that's conveyed to the OS.
>>>>>
>>>>> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> index 5e9a8fa3cf96468b12775f91192cbd779d5ce946..6620517fbb0f3ed715c4901ec53dcbc6235be88f 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
>>>>> @@ -3928,6 +3928,12 @@ gpucc: clock-controller@3d90000 {
>>>>>  			clocks = <&bi_tcxo_div2>,
>>>>>  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
>>>>>  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
>>>>> +
>>>>> +			power-domains = <&rpmhpd RPMHPD_CX>,
>>>>> +					<&rpmhpd RPMHPD_MX>,
>>>>> +					<&rpmhpd RPMHPD_GFX>,
>>>>> +					<&rpmhpd RPMHPD_GMXC>;
>>>>> +
>>>>>  			#clock-cells = <1>;
>>>>>  			#reset-cells = <1>;
>>>>>  			#power-domain-cells = <1>;
>>>>>
>>>>
>>>> To repeat your own message from a couple of months back [1]:
>>>>
>>>>> You shouldn't be messing with VDD_GFX on platforms with a GMU.
>>>>>
>>>>> Parts of the clock controller are backed by one of the MX rails,
>>>>> with some logic depending on CX/GFX, but handling of the latter is
>>>>> fully deferred to the GMU firmware.
>>>>>
>>>>> Konrad
>>>>
>>>> Please describe somewhere in the cover letter or the individual patches
>>>> how this relates to the responsibilities of the GMU. I searched for
>>>> "GMU" in the patch series and couldn't find any note about this.
>>>>
>>>> Also: How much is a plain "power on" votes (without a corresponding
>>>> "required-opps") really worth nowadays? An arbitrary low voltage level
>>>> on those rails won't be sufficient to make the GPU_CC actually
>>>> "function". Do you need "required-opps" here? In the videocc/camcc case
>>>> we have those.
>>>
>>> Right, I failed to capture this.
>>>
>>> The GFX rail should be powered on before unclamping the GX_GDSC (as
>>> per the programming guide). The clock controller HPG however doesn't
>>> seem to have a concept of RPMh, so it says something that amounts to
>>> "tell the PMIC to supply power on this rail". In Linux, since Commit
>>> e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the
>>> domain") we don't really need a defined level for this (perhaps it's
>>> more ""portable"" across potential fuse-bins if we don't hardcode the
>>> lowest level anyway?).
>>
>> Thanks, I forgot that we have this commit.
>>
>>>
>>> However after that happens, the level scaling is done by the GMU
>>> firmware. This holds for allOf CX/MX/GFX. I'm not super sure if
>>> both MX and (G)MXC need to both be captured together - downstream
>>> seems to describe MXC as a child of MX (in socname-regulators.dtsi),
>>> but I'm not really sure this is true in hardware.
>>>
>>> The GPU driver currently first enables the GX_GDSC and only then
>>> does it kickstart the GMU firmware. Downstream seems to do that as
>>> well. So on a second thought, since we've not seen any errors so
>>> far, it calls into question what role the GFX rail plays in the
>>> GX_GDSC's powering up..
>>>
>>
>> It might play a role, but we wouldn't know since AFAICT we don't support
>> enabling the GX_GDSC. Look at the beautiful gdsc_gx_do_nothing_enable()
>> function, it basically just defers the entire task to the GMU. The GDSC
>> just exists in Linux so we can turn it *off* during GMU crashes. :D
> 
> OHHHHH snap! I, on the other hand, forgot we have *that* commit..
> 
>> I think we should identify precisely which votes we are missing, instead
>> of making blanket votes for all the power rails somehow related to the
>> GPU. In this case this means: Which rails do we need to vote for to make
>> the GMU turn on? If there are no votes necessary after the GMU is on,
>> it's better to have none IMO.
> 
> The GMU pokes at RPMh directly (see a6xx_hfi.c), so we indeed just
> need to make sure that it can turn on.. Which in short means the
> *C*X_GDSC must be able to power up, which doesn't have any special
> requirements. The only question that's left is basically whether
> MX_C must be on. I'll try testing that in practice.

So this is apparently difficult, at least on SC8280XP, where something
seems to be voting on MXC and it only seems to shut down when entering
CXPC. I would imagine/hope this is not the case on newer platforms, but
I don't have a way to fully confirm this at the moment..

Konrad
