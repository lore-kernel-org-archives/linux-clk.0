Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53F93382DC
	for <linux-clk@vger.kernel.org>; Fri,  8 May 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238067; cv=none; b=DUbxSuInPPAUitE+wj5DKdsjSdYMdtptiSxjjyAcBUsdadtMFThB3wBa9r1HYzJJe+vWy5OYbtAIc1YQRuTaP5W46Lx1VB25pR0e1RfzBGaowKx3YHYuNqo/mEU3O715Bxf44fN+1ps6uSLqnWn4K7rmjUmoCmjXOdwA77R1+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238067; c=relaxed/simple;
	bh=QofzOtqf/V4gHmLyAulEuCeCZ9j7pShktv4meKIv4BM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWdK4qA1iuT1G+QjKRp+MsKX6fbYQ22xR7ZDazJlR5oxJ8LCIM3dp+x+tDP+ycJhrEVbPvSx7QyU/8no49mccJM4YSlquhmCkULhm6f4WloMC3p39rUbb621SjUF2SHpNHtzxNx0URBl0phxlMpHU4Q2oc/HM/Wnm/7yR6curGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td5f4qlW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqwGSfH4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td5f4qlW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hqwGSfH4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648AlUL32182874
	for <linux-clk@vger.kernel.org>; Fri, 8 May 2026 11:01:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=; b=Td5f4qlWDdrmJkuV
	x4DYs5ge5ttIZZPnydPnMmnYuRFqiDv/WL0JZaatMacWzS9aW7cu7KcZsNjYCdek
	nLpLd9jApasEqf75FIokuOETZZHneesctNNrrDLK7+rUsFklnsG8Hf2Z0chH0vIe
	dyQ/ARysQ+kZGS6QrPLA2ZtN4l+v5txkT5ew28ANBEwUtMd6/jW4VJLYWbpnviuW
	d2R+AaVKY/Ze4NdxdPrOjyJyGsj8y1BuXy8B03lCHDCvZ5r0IsIP+n5o27h+NFKL
	5cV8eT8OBT57k3EW867vBGH3546i3HkMZomCg9DXrZ1l7EHuTHcACRn+I3u98sjn
	HKhHjQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyb204-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 11:01:04 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6110e7e82b8so155543137.3
        for <linux-clk@vger.kernel.org>; Fri, 08 May 2026 04:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778238064; x=1778842864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=;
        b=hqwGSfH4Ank2RjjMVVjsCrAOZc0MhGCEtDD9QnjjgFPwEkl1MF/THL4G3X8GbqCCAw
         h2/dFSw3nyV7iraaDVfgTIQze4eyQYH93fPyBT8I1Kn0lfpNvy2x5jl3sZNTguJ4XDQK
         79QcGGPYUfS+kwtK25kXw6Mdm9naCHXU9H5j2FqAQRnwPcI4dYe+xvFGCp/svy4G6MzI
         gO1J3FzdK0oaQVnThzMeWWpCvlMkOTVEQreZynrg3qugXIQrC9cQAMnG2nSixGVHHwH1
         tTJIKGYn/GOxlahp4sw/nxv+M5F5U45PtHqxQ6NRkmGJJwneH+O6wO6RAxbNA63+BKDU
         n7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778238064; x=1778842864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQ9fQrn1XTfzGrersPl5j/cPkZhhCczzR3F8lrXNg+A=;
        b=ZFSCv843a1IgWnysx4fq48l8KJmZefGWjSSNzCZaAq4/tyMmEQ1hgRkrUR6h3WwTB1
         EhmEDMXRNZQKlYHDUhcjPQq6Ixu38Ln12Gv7y32FUvMASkQPWWXWDVWeJ+GCGmAVsVJS
         gIj7TLorhgjWgxgOYcm3o6KrsuA+Ds0id+UcVQZny13EDvREr14LB58Loxp58qDXpRny
         9+NORC+1d54KeBMMbT7bn9vvQMYKGgbIpH095mJnTSrHj0IYnEoQ+CtdQHYivdCx0Jmu
         gjaTRlCcQnwELJnQ7T5MYed/cZ497BVJ/0H2yMIgo1R4tTxsjGKim0+5LCBqAceipcNt
         OFDw==
X-Forwarded-Encrypted: i=1; AFNElJ/XMw6MWr3FvjxUyvNuYObl1zW3xw4ulgrTusxSlMh8eOhlePd4VAh4qWIpjjnDiQ1hvNaTeqRAOH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhEg+kkd11CxFrWyaUt3WmNBq3BoB5Oytfpt10sRRCRV3rjuZm
	8U0JP9D36KuT66+1MpdbKy1onht/IEa1eld955LIE0GP2M0Af6J+SERk48l51io/WC26PIQ/d6j
	uC27s+rG3MFCDnrxQliMFbbkQ9+fRdgmnkCi6yFGPMAeDeRHWXcAxeZLCFDh8USs=
X-Gm-Gg: Acq92OF5Pc34CUBNIl36msfnawygqIxXpDrtbpKbmVJcpayfmqxhFIXr4JoJRNl1esq
	r3pEysLAofKaEHGNFiXbCkLT9bQICjLgcdfyOQAv+qOAYwb7Y75t0lW3qwcg64XTYW0N9r2jysY
	havfE9sjR4cg4fe7eKo/k1UpFbTBGT4taeotgiBl0YCUcwwseY1QN9k7ES29bER4CRBRm4JORpi
	tmpJQmPafPtgWX7Uigbq4lfW/OImKF/zve33shUBa8KOVRbx2PUknfVGMkNjK/ny96WgCRImGeN
	00hr4EQv41eTZT67ji3c6pXHNosxh2k5MZurd2mNDdis9Q9QNu1SBTrmTRSwnV881M61Dy1vHi3
	5tTqVanOhnLXTzrCRkA94IIacKBMpVkERxPfR34rGd/ALNE5IUOE1jLKif+hC8tDOZ2S4ZHCRuw
	GKo02BVsIGv4ti8g==
X-Received: by 2002:a05:6102:94b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-630faab2acbmr2426734137.1.1778238063706;
        Fri, 08 May 2026 04:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:94b:b0:610:31dc:2302 with SMTP id ada2fe7eead31-630faab2acbmr2426711137.1.1778238063246;
        Fri, 08 May 2026 04:01:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac48381dcsm69256666b.54.2026.05.08.04.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 04:01:02 -0700 (PDT)
Message-ID: <790183c0-104e-462e-b107-748fefdb8a85@oss.qualcomm.com>
Date: Fri, 8 May 2026 13:00:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add initial support for MSM8920
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Catherine A. Frederick" <serenity@floorchan.org>
Cc: andersson@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260505203845.192140-1-serenity@floorchan.org>
 <20260505203845.192140-3-serenity@floorchan.org>
 <20260506-berserk-charming-tody-f9ecc6@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260506-berserk-charming-tody-f9ecc6@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdc270 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DhTvykhhAAAA:8 a=N4otaSFRtcR4xJ013aIA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=bLiRU7DCRrRo9wiowOr6:22
X-Proofpoint-GUID: CljkpnFS2CFMjFRdCcc6sEC_h61a_wyT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDExNCBTYWx0ZWRfX0RgjcrTZHai3
 7PKTKai+zjc+nxYJniStFnbQnYJyTh23BLb201D6kN1mbfr11V+gbq6le44swUK2XDWgUeK1Z1d
 ZMXkCnVygkw0Tfgv2EQyDSfyhfZHDlw7fQozbgwB4PoYweH5mZQ8P0MutOertsGfVDKy/8umzpP
 gINsk4GWIk+GKc7bNx+G4ppkthNlOig0W8DWu+wLwkizq8K2qFw/Y77TeDEZpCKHT3HggABOIag
 5BGBX/t8Li6GB4hdimgxCWqBqg5C6pYfXfE6ZoZN419XCbGQfYDwk37AbhOJGbhxZx1Utazsbv0
 VK1GP+K1vttIY6zerC8e3xtOlFt5YNyMf0AMhYQvr+ee2uC7Ulh/7W7prxo6NIFddzPy/+QJLwr
 R5ctu2U3yghvKlk7KlHEFPDOMoekDzdQiCcisb599x3UuXdlu4uzeZM22xHxAkpq/FY00gkyZmA
 3p+gpG/1u32P397whCQ==
X-Proofpoint-ORIG-GUID: CljkpnFS2CFMjFRdCcc6sEC_h61a_wyT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080114

On 5/6/26 11:49 AM, Krzysztof Kozlowski wrote:
> On Tue, May 05, 2026 at 04:38:41PM -0400, Catherine A. Frederick wrote:
>> Add initial support for MSM8920, which is essentially MSM8917 with
>> an MSM8953 modem glued onto it.
>>
>> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8920.dtsi | 55 +++++++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
>> new file mode 100644
>> index 000000000000..943cae72227a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
> 
> That's a dead code, unused. No need to add it.

If you have a device that will include this, please post it together

Konrad
