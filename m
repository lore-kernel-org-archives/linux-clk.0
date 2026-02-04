Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5924374722
	for <linux-clk@vger.kernel.org>; Wed,  4 Feb 2026 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227297; cv=none; b=uulvdOJ3AQVvDpHhY1h02jLqM8d9kfaw4focN+cnX8I15DVdYTHGQmHMWUlkoi8PMm7KW8cUY4kbpIvwaFuPkzBEdpsKaWEgcz8vgqDCo2bZlDfw9n+6Ivq96d6DsC6pVnvgKNOcp/F5h9RglY3yBEyLv6wyhLVY9/BOgljWzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227297; c=relaxed/simple;
	bh=CdCbU1/N7ciFW4IP+4C3/wUCo74OvpA9F1n/Y5GkQmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAFwQLaos9AHs369FVRveVVeqevb7k/Gqf5jUkZ/N1KXjNdpjowsCYkwazh28rssEz7ekkt7sUYnWeLHqOGj8gMFlztllMT5qxumTGrCjiIzm8IUJSJUREMKEx9fMTS44CFfOKWzkN9nxuo/PVBmvGr/NrCr3I1LnnHi3Vl1oQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSexkuRi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGtIBDE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSexkuRi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGtIBDE1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614H6s3p1662402
	for <linux-clk@vger.kernel.org>; Wed, 4 Feb 2026 17:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hoIOWTj8YLj7Rn9md3kcKmIaa6Is1rHF4a1BU2CSrrc=; b=kSexkuRi8MFGll7I
	z4xolljPGdeOZIDhYRa3nZ1M42BxqV57MDnopHvC4dnrbqP/CqSZt5oXZt1+gCwR
	KfvxvG6nymH2jCgIicmQkrHZfL7L/xpQA4TTCtqlNNMQy33ZXxsVytUzqIOYkjLF
	j8PP9hlbnEDIEuBMYcGvSnEIpMajC8wHrt1efIEoW6FHgIoyV4Mikq8Z+dU/13lA
	DTBn27zG9cYJw/lmf6ULHu0B/kxly7BKAsA7v2CyiaUk0bXlAXRnZdv0GKmvXDLn
	T29hmmL4ZNBLhOuF2gaxoSi1Za+RQ2msa93B47E1UbMWGV11W7ErNHT2utfu3mEx
	vjkaTQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4a7tg5b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 17:48:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c613929d317so4340719a12.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Feb 2026 09:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770227296; x=1770832096; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hoIOWTj8YLj7Rn9md3kcKmIaa6Is1rHF4a1BU2CSrrc=;
        b=cGtIBDE1g65h4awBhF40fQKme8+saEITYlxDs/kRLYN5TlFUMWiolESMaVagMzyZMO
         +LvN2SYgb85ttv+dNvtP4jFZ9nXiYhEZsqwkj7zt4JhpnIhfrBjKh+n1COGAsBGxzyb5
         /ExtDOqWzJrG+PjSmWz9+3zdhGTR2giyja0XZU8kjduqfNMjINchpPJ7J9tbaulgtW6N
         YLgox737KxMagr0eWbNBTsKTYXJrXRlHKzZ3mb5/aisXVlCPkEDLZcCDCXiC/p+xMF9I
         a+pxf4gAFqB6uerFVBKsaF6jrm5Vp73cWZfS47HmB6dEU2tweKrjR+C1YbU2HcQ3V2N3
         NAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227296; x=1770832096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoIOWTj8YLj7Rn9md3kcKmIaa6Is1rHF4a1BU2CSrrc=;
        b=QEg4A1ifCk5NG/cMtynalYw5gvGwEZw6Q65hgV1+21hnyxLEik6ej1hZP6DXgl7hzZ
         jpjM0EUdjTu6LOKnAz+oH+xaLfIpsk+Nnj7sNvNC4sV3TMQEaa/+RmiI5/2Zh1++clQa
         /v1O/eRL2oRh1Wf7LevwsY8P2HAfuWyOmWLiysxaChZCvju9yH5nYHcjkZorBxQElJvP
         /SY/JiogVCCaCxZZ46/d26khbE2l9fiLE4ctmOGeuyEgGtIASgQ4Gjp37NU19YpYyHpa
         AhIO3aMyiAONMNdNkpnDMoFr5d9zkB+Vey+duOs2zEY1yLW9w+YSfYdvkiPQPfvtYukF
         p3ag==
X-Forwarded-Encrypted: i=1; AJvYcCVpu9MtNugD+sOq5h4RvUPXW8DLK6nAWsnmOV4q0MEpGnActp8vnEzFcDmnYU/TEcdcoHkkzW7uzP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqv6J0f2rnevHU31u4OxZMVoLnqwdLNiUQKTJs82Ae5+nxBEn
	pTrZ/x3F6tX7bHWd0GRYWyVlWYp/KNzMCAvxSFtU65dwuTTUvPZXHrRWXtsU/+DDhRCcKv/pxFy
	nmBe4SSmCsAYbfjPYp1RiAMKZQpu2hbP83Cv8j3bfZD95dI2AZoTrEPIoJj2wNsY=
X-Gm-Gg: AZuq6aIOmGSRDWLmJXNgqbvC8zZKIuTOCtyABe7s4D1zXjnvUiDiZ4F+DXD9YNekJ4t
	wua54TwDPu06+bNDTV9YDBtMz27HbgnaZYmyFy4PnGnWCUDicUVY+jp3Ab9QNqM5wIi5Hpd6lYS
	ibkfH0jC7bFiRX2Fk/wmraiY/Yap7kZ5K/VX9/fClj3uGSGKZuwOo8jJmMm4xTGo+MFPaDhF8HR
	TskskNSZw3U7T/vWXMOgrmtwwUkVbi8JRecsMdjcWtGSUXR2x36WekjFFwNjlhOu8iLjuYMv2kM
	JD7sPyWriF6J03reAjgSR5hCJ+NJsLnLZj/z4JBAhfhf+gHXGxgex6y51qiE5Xu86cCm1A3tTv6
	uO0bNN2jQHdzHA/xjoKEfrwz1AUtnJfKg0eQF5ONc3P0k
X-Received: by 2002:a05:6a00:3a28:b0:823:f96:63bb with SMTP id d2e1a72fcca58-8241c67513dmr3380483b3a.52.1770227296236;
        Wed, 04 Feb 2026 09:48:16 -0800 (PST)
X-Received: by 2002:a05:6a00:3a28:b0:823:f96:63bb with SMTP id d2e1a72fcca58-8241c67513dmr3380464b3a.52.1770227295765;
        Wed, 04 Feb 2026 09:48:15 -0800 (PST)
Received: from [192.168.0.103] ([124.123.178.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1cc84asm3192658b3a.23.2026.02.04.09.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:48:15 -0800 (PST)
Message-ID: <5c1a1cab-940a-4b2f-9f5e-d1ab4b2774ab@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 23:18:08 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: Update compatible for videocc and
 camcc nodes on purwa
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-7-b23de57df5ba@oss.qualcomm.com>
 <9566365e-3330-4130-a073-8b58089b5f07@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <9566365e-3330-4130-a073-8b58089b5f07@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j0dKTmJnxj386kR8hwFlCcraPxmKYfwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX8zqKgwIA4kuB
 89DhoIoFpvsOMkMFcl7+T1t/WOFu4n8Mdg0JuEh6snuXXRB84JCHXJnTr8bz75jLb3ExbPGATzo
 0leiAuaLvC8vV96oyOUa4KHsrxi5ashFclarH3sDcjflkFTwvvwOUy/M9vDioA8hKHBWJ7qQuzL
 b2KZaLsHnz89C8Mk94U9rmBVn2I0xm2dgTZ2eGg9ppExkQdbfG46Xcpd2Pmj7SC4uAiwOxyn3LN
 sdUg3+dGWff8DsJEjPaQepCy43oCetRnLFfil0Rm0Xffhb30lOTqL2MhcDMhkPXNuOjOJDxg2/I
 mPzEbj4ebdR2/kbzIdWwAYU43x3ikYeBbNMFksWkMnj9RshHtJfc1vZP6mlSAGPpEoOZzcmHZ4w
 iV9zSDd+jrGvuGjDIfcEPo/+4OdctKrXCQgpdxHgDJ3xXpy54H986aCz/c2oRg6Pehqv8U21ET4
 oHuJXhDakgwdgxuoKlQ==
X-Proofpoint-GUID: j0dKTmJnxj386kR8hwFlCcraPxmKYfwS
X-Authority-Analysis: v=2.4 cv=QaVrf8bv c=1 sm=1 tr=0 ts=69838661 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=2H5/5ZkxJs/wMzWGxXwROQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3EYFgHgEztSfj8X7cKwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135



On 1/28/2026 3:49 PM, Konrad Dybcio wrote:
> On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
>> Update the compatible for videocc and camcc nodes to match with their
>> respective purwa(X1P42100) specific drivers.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/purwa.dtsi | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
>> index 2cecd2dd0de8c39f0702d6983bead2bc2adccf9b..63599ba0a4f488d8f40f3e4d849645a8fa9ebf59 100644
>> --- a/arch/arm64/boot/dts/qcom/purwa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
>> @@ -6,6 +6,8 @@
>>  /* X1P42100 is heavily based on hamoa, with some meaningful differences */
>>  #include "hamoa.dtsi"
>>  
>> +#include <dt-bindings/clock/qcom,x1p42100-videocc.h>
>> +
>>  /delete-node/ &bwmon_cluster0;
>>  /delete-node/ &cluster_pd2;
>>  /delete-node/ &cpu_map_cluster2;
>> @@ -22,10 +24,18 @@
>>  /delete-node/ &pcie3_phy;
>>  /delete-node/ &thermal_zones;
>>  
>> +&camcc {
>> +	compatible = "qcom,x1p42100-camcc";
>> +};
> 
> Squash with patch(n-1) please
> 

Sure, will squash it in previous patch in next series.

>> +
>>  &gcc {
>>  	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
>>  };
>>  
>> +&videocc {
>> +	compatible = "qcom,x1p42100-videocc";
>> +};
> 
> This should be a 'fixes' commit, as since Commit a8a5ea012471
> ("arm64: dts: qcom: x1e80100: Add videocc") Purwa has been ""happily""
> running the wrong driver
>

Will add fixes tag in next series.

Thanks,
Jagadeesh

 
> Konrad

