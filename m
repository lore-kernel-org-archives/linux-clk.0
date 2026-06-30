Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B1404891
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819833; cv=none; b=VvPQlipn+gydvl4SSCIDNTXwlblXE93DHl8+mnsuHAqVRqQ+fp4XgzgT6jPwKBlu1xwGFFNB2WgtmkLD4OVfwHdLctgGsLvjZzmlakhXSSRCI7u+dMJIuFDfjG83byyZQs3TG7xOXlelczn/+0yjko/Je6rNVnbK+psKJYSAQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819833; c=relaxed/simple;
	bh=ydxso3tQzTPdXtcvGFdCqB1x6Jr03cYbvaMFGBrRqxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkfO7ghrNlCfAdeBM3ZbPYHLNCXY34sP+FkNP1KkNLt0u4knI/SNVD2Q3T++xSBbJ4lVGX66cEozPODH10ku5WNjVjdmlAldbGMP4QGJj9IS0jSfE2lzkzmUkTH/06L7KjYPh6sQ9TiPfeARkHwQ7YNYRcFTiKMmwVmM3qeV8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d0Rq5OHc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNmdRs8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d0Rq5OHc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNmdRs8/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mnd91542038
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=; b=d0Rq5OHcxH34F+t2
	luWaixD9UWj7vzhGYA6kxXL+JJBPzSmvjx7PMBdI3LttHL5XGZGliNh/m4Y2BuH4
	tjQfbD8CjuqpcTy3oz2zRFnCcvryFpqDMtJ3jGsq2F5/kxNk/3fFGmJLJsbSTlD4
	HHFCjdYQF6e8gvSVPdwKKVlrBl+Iv43I8jaPVFLSPKQc5Gpacd/F+e0cByxLxgya
	cMCCP6r8KgTjQiJB2UEXaJbyl8cWYsewsO9mizSdpbqrF0nw049GkXyb1lJ8A/pV
	1Gwkr5qjs9VV3xBsJRnPbwpdKn30Mcj+B5Kvlcx9Nybyb6Hm1x2TMWnQ4Fl8eRAe
	htS8tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4j86g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 11:43:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so5894285a.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 04:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819830; x=1783424630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=;
        b=BNmdRs8/PyYa+oAZWRmtrp5PnQSCOkqcWArZ1b0ZnXakrM5Rj8sPDW0Bj5SVxwNXGa
         9QXMXRckW5xdyMw5CtT+cSID6H2+iPM47Edr3KkkEhcJmHukekxzNwOTIfP9haQVgOZ6
         0uHM9SvafC95StRAf4h1lfUS8MgP6/VNgjCnrrH9neBvcjrk5qBEntLqmjXMLv+g7fdg
         FqFB0i6HHOoWC7XOnEa8l67NaUVjUJdmvUCWx85WV15VQ85eM7c+FAySj/9WGq9caRWG
         0W8AgB0BVDChzIZzW/g23aTVvk+InWYnRm+DRPmno3cZJtOKH/Ioi1OSKZ/aoLZ5aw1Q
         iaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819830; x=1783424630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVMvkTVLGH+FcIS/vfSvK/ujPY+UerDGY/JcdPljsRg=;
        b=YcjbQ+P3AdNlS/nst0dRbREtjYqBpd3KmUx2PtLt8TaWGsfSeCygtabsZubD9L1/TX
         1n5QjaOZKrv69NzvFig20MqSNSvUA10BRJ77ozEMRxVoC4qtCudrgWgd/hSV28pVnAZ7
         1FQSCJNSGXlLO323N7bEiYfyvFFpgxSUNNgtrqcNe5PCvwWnwr2jm3uyWnhGCGFJkbix
         F3CwirBGTFWvz7CqAwiEEqH0F3AIMvEFmtAC6T6ugsI2gsyGm2r5pC2+ZhG//KS6uL13
         lFkn3eC6/9X4BfMgSk2xq5VVqN+Z5ZJALsg4gBjdhpttx9OQ7LCiPBSg5YFppCdGzxpu
         3OdA==
X-Forwarded-Encrypted: i=1; AFNElJ+LZAgAdS96qqCWM5S6RjttMI2DkEZ25+0q9X7LfMQaROLIu8WeH+qpALVGqb2vvBlSnfMCso7uzf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4va2o2Nbtwg1QYPEyjVx9GiWqY/txDbICkijI5AUcV6Bf2Mj
	nGJwUJHhnjjuFJyZqD08FB9pqkL/lbAJoG7MlH1GMME1vT4kRdVWDd8sKcujyGq3u0q9PswcDuI
	3XJZiqVqqCtvaYhAudSsTjTrxQauvgdKWUW8gn1N2u//UAwx62+GOAlQHZNWu1Xg=
X-Gm-Gg: AfdE7cms/bg1oLlFbrztSF17l8yFyYgvPgbpOcO4S1sV1XHMS/sEKC6rKRNfwj6cig6
	CO7lVM4a2KfACsklqUi5j4TFkMo5vmFtR0UvO8+3Or/ZveLJgrySdoIphyVbO4Jh338qBTdhaJD
	9fNf7jRPuI1m9KD3Uco5XetW3otS0DfjC9xGCmEUOXr6zYKi1K3W0RjlLwFoQnNQCuwgw7Qs0Sl
	D923UFhwxkrnSqE//JMIq2IjKEn2KR7VzTo9WV8CXev0BXX2iY+PFFqjbxZcM7ShzbPMDnym+h0
	rNZz5rqPcOLEPad+jM+zSo4kZhwTKJSCd42ArokX0Q6+PzThTf7HqX1l0csTnmbAxP6t5yc04SL
	SRwmpZX1mv1YVhzcP3nXIJTEPp3ITQ9mO6FU=
X-Received: by 2002:a05:620a:1a13:b0:92a:d546:ba04 with SMTP id af79cd13be357-92e62620d05mr347161985a.1.1782819830029;
        Tue, 30 Jun 2026 04:43:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a13:b0:92a:d546:ba04 with SMTP id af79cd13be357-92e62620d05mr347156685a.1.1782819829433;
        Tue, 30 Jun 2026 04:43:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d18735sm113653666b.6.2026.06.30.04.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:43:48 -0700 (PDT)
Message-ID: <1416ada5-ccdf-400e-b2b8-d2c5c7e335dc@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:43:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>,
        Alexandre MINETTE <contact@alex-min.fr>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
 <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
 <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <417600e8-9be7-4c6e-a62c-f10a5fca7a9a@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MQrKOC_3M5upRo8VwFPoeBHj96HGeOOn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwOCBTYWx0ZWRfX7kSO7e83hcIx
 Ix9pm0QYNrkX4+MYhQ04oVUjYAvY5DtnrJnrlVq5INoZaWHd3N/sRiBi/LWkz+MV+T2io/khFSv
 T4PT/vh8nkPnx51y/uIRAHRA6PLyU5k=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a43abf7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=wxLWbCv9AAAA:8 a=iVYy-9Xbl0-MiRC387cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: MQrKOC_3M5upRo8VwFPoeBHj96HGeOOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwOCBTYWx0ZWRfX3vqI+KQfX85z
 IDorYzbgr75Ymz6C9JT+ZsadHC2P2tHqhLhAqa0XtII2j3N9e/DVG/pafR7Q0Yx03aYsEhYemhg
 NwfhyvmSL0CC72okov++kzWrFT+KJlctzCebj+PhY/VHoIppic4UACFMcKGxj7KEmF6YPqaZIv6
 /oTuT1RjjzQjVg2h7bJaA3/rCjSjAS58wiTY+0kXNyC2447O79QwumDZ8lMOe7Z2x/uLsiaeaU9
 FX2gVzuuzlpiAvw/bOSTwNSmrUqQtZNxp4N4eglYujQl16Ej6dqAL/uYlF/IwdA5ltbWPXZxlJr
 iuQQTZV1kVB5WqwoUdT9fzgFcS0rXp0eWhDNX/P7469/nxXiv8w0L2rWPCwR057ufw1XnbPBViE
 3QQIYtCa1JqP2zisTynk0iRaMnjAKmnHuwUCipXm0oBwxzVZSEKqkc6W5u43TyX32N7+lhrb9mG
 TaZUcfk1urrmzG39GZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300108

On 6/29/26 9:41 PM, Antony Kurniawan Soemardi wrote:
> On 6/16/2026 8:43 PM, Konrad Dybcio wrote:
>> On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
>>> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>>>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>>>                reg = <0x12500000 0x200>,
>>>>>                      <0x12500200 0x200>;
>>>>>                interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>>>> -            clock-names = "core", "iface";
>>>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>>>> +            clock-names = "iface",
>>>>> +                      "core",
>>>>> +                      "fs";
>>>>
>>>> The bindings change you sent changes the expectations - "core" used
>>>> to be the first clock. And I would guesstimate that the
>>>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>>>> ratesetting on the other two?
>>>
>>> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
>>>
>>> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.
>>
>> I didn't notice you're actually aligning the order with bindings. I was
>> under the impression this was a random change.
>>
>> For the clock assignments themselves, I think the schema reflects a
>> full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
>> that we should have:
>>
>> - ahb (bus clock - perhaps daytona in this case?)
>> - system (core clock for the thing, >55 Mhz for compliant HS operation
>>    or at least 35 MHz for any sort of operation)
>> - ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
>>    in our description)
>> - inactivity_timer since there's a BAM instance attached to this host
>>    (possibly handled implicitly)
>>
>> for the record, there's 4 hosts:
>>
>> USB1_HS @ 0x12500000 (this one)
>> USB2_HSIC @ 0x12520000
>> USB1_FS @ 0x18000000
>> USB2_FS @ 0x18100000
>>
>> I don't know if they are all exposed and functional though
> 
> Hmm, I'm not sure which option is technically more correct.
> 
> I did try swapping the clocks, using daytona as the iface clock and
> `hs1_h` as the core clock. USB still works as expected in Sony Xperia
> SP.

They aren't handled very differently in the driver, one's just enabled
slightly ahead of the other, so I wouldn't expect it to surface any
issues (although perhaps it would be good to know whether downstream
e.g. does ratesetting on any of these clocks to save power when the
full capability of the host isn't necessary)

> If that's what you want, let me know. I'm also curious whether others
> agree with this approach.

Dmitry?

Konrad
