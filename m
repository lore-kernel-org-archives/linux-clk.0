Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBFB3672B8
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139489; cv=none; b=Bj4sS2hMETvACFZbgGtIA/uvNf2x9KAuq/iQAp4XVyYm7pjbT4mZnMbC8u/QBAV60Zm+arB5NoH6L1dFO21R9vHuUtUsnQhxnk412LHAmJLnDD4c+VGaPoDIh8iJgSLA/+G9juNxe0Jjv8gyPYCp2gU4OoAQEfrLm4Fh4WAFo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139489; c=relaxed/simple;
	bh=pC1CCyXtvN10xc3N5sbvGhGAdLjozRH2BPe813E7lyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAlCFtf6nqy/ZMy4vF3uSNgcYh17YWuv8bfBWKJCvRGHiAhhMV3U31pQYtKMonUjpPp7XMsTJ+3ObSATCQpcfk4ohlZsTh/063m8EnQlU5rlhiF4QHYl1R1VRer1SaIjmpnfNImAMu9hpIHHwUGHnD29w7LPpMp+N9ofDnvaoaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NlSo1t0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CtHIz/rY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NlSo1t0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CtHIz/rY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm8Ba3748965
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=; b=NlSo1t0VyetQAfcG
	0KZZL2ymdWwewEi3LnrO203oDKoNdt5vD8bkMO1i2hn3XvJ5dHFoDlcU84tWPtYP
	s3DxKXwEuVo7C/yqDkWKspOal4hpw9RemuOksseuF9+6jQPGplpV0lECFdfSDe+2
	BlLlUaKS0LqLIphK0LQNDQY80pt+kz4uOW0JsomVu4vHseN7z704jOCXutDS+OIE
	WSOTsr7ym/zto9R/TrfcARNMQqyyX15Pns1ZG7LEYAvg3E1vJaEXMo5K2Mf7PWW0
	qYPiEU7jOXQomXY8QkjfXrtFuV6no43BhY34O40duMjjbmMLA81i2Xw8QdGJNavg
	MiFRPQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729k9rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 15:11:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8688139460bso959948b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Sep 2026 08:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789139486; x=1789744286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=CtHIz/rY4lMZvIpDhWAOaiyXecVRwDhxuGplM36dpPP0I5KmuuKep4mkrXUZqUGACo
         KLBI4P9sJhAAtHeOrKaChqq0qeNAFIJ0su7MWLxB9lgWfwFJCB+9DKLnZcWvRynT9TXh
         DXyDk/ncggBQ51QWe6xZ93qTsgbMH47wEvHZIrIGr+Z/nyXbMlMMTzWSAPAMX/D4c9by
         eNESXQuNuo4MK1bIcbWXZ39CJMvXLwcPByE6WuOwoNUXD5+IsCZYuMlpt1xm+JiUCj14
         7oEzC2T3KCImni/F+rP0pLT1fGmgJWZFI2yKdHseXKhfkOxgm1jqV+j9UKdIyxR/4sbt
         A3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139486; x=1789744286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjsKs90kMBvRNGCR6L1JRdq8NiUccmWGU1If0xj1WAA=;
        b=U77GyqF2vj/b7uHUUvJidSFN0Hno+rhvOPD8ZrwIFEdNZkU16C3fvSzqmTlLWv2Xtl
         Wk4EA+RQttAFAfG0iopQxdQjiQI192PBlb4vbg76kTUtpuZ3qEoTrbhCNElX3s4wQZVX
         bnUoRVfX+y0nbf21dW6LLqJj/d1SlCd9q0Ijuh2W99FLQsESgnsfWcalERHSZ0gEwDXm
         NuPBT74d9UA98zA3Ngeh6HH8tQUDMHxyjImqCBtxnZl4//Zh4h8rKPlHY5SF9X55IRK+
         gTU7El7Eid812Zl7a3gSGhBWV34Y0uRgBu+50nJ1+5XKQJcyjPlG5YptxxTBOhdsVUIS
         Ea1g==
X-Forwarded-Encrypted: i=1; AKwUvByBGAWbkDO5iSHy1jFM5R7p3YO9d7dG84qsPXNp9oyVpBi9OnFqvFTBhNm3tXTAxmn9lR/43iM6ppY=@vger.kernel.org
X-Gm-Message-State: AFuF++nZbXJsAqiuoHFxIV85zjpnSd10ibOM6WL642F85CxIjd3OewqW
	lw7V3IoOL5EqwULMm08Ui2eN9aNGUC/tHq+uUExb2Pl5/Wbu9P+cj1TMH7850bK4AFjDL/PgJzU
	zWJgyj2hcDCB2FRizC1kLpiU0kWf/ZhXLTHaZ56hIB8wO+ukv08YrO6N6D7sSXdI=
X-Gm-Gg: AYBFou137thI/xm2pSlz0XUkp9m3fxF/NVx9hEbHroiLAzQ5cwCuVsKIX23xYaj0Yy2
	AUVodaPsDFv/y7ds2rWj1Xanjzv0JuYa59PsUeoOVtEd23hh/H7isBHu2ISE/FRDVnwor3uhTRG
	PItrok1dCxDEqvKdWld6IEax/hpzNACpWZyqq+CIDj4n5GpNcZ/DJdBtFriUywm/ZxnF2Ey4M2L
	Xt8rAJ56v1mZtHwt+dGXqh4Gfp4lEQjFpISk8G39xLgTtl8T9wo92UxF/F7pkYDF/ibY1iRJ9FR
	kFyLPgvObXpuz/7Noblm6EmV/Om3ghsofxdD8SfN6IgMGFzTQW4JwpI0Qo3ywbWylXzDoAGFCJ6
	eybw0g4GlgyB/9MkfZL2mKSzrY47yM2gCZA==
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902296b3a.2.1789139485960;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-86b30f12a74mr6902226b3a.2.1789139485522;
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.240.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250c1278sm1268447b3a.8.2026.09.11.08.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:11:25 -0700 (PDT)
Message-ID: <a9d52219-301f-40f6-8af4-c0dea8781dd5@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 20:41:18 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add TCSR_UFS_CLKREF_EN
 definition
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-1-cdff2c67a8c2@oss.qualcomm.com>
 <20260909-devout-generous-oyster-0efdef@quoll>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260909-devout-generous-oyster-0efdef@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxMSBTYWx0ZWRfX22448sceh15S
 jmlNMi6qK0u0YQ45JiJ1curqDgJjBoeAbWlMvk4gFXx5jeuOIwMMJtSBjiNThQRp5KD4g6jWg2M
 RnY8o9F/4K8xhMtZK2HOe2mi+Ta8GdA=
X-Proofpoint-GUID: pjANy3Cvej15kDbpWh4Z7XluLes1ImA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxMSBTYWx0ZWRfX7+hxotILCZTZ
 WlJBQz6qqe+N4aqjCyeDUDBnmQu7ruFcQYALazyauy4cETcOF9dku8/dfxbd4QocQsDc74EJ5na
 CYmNnGHU2YChff+XT5RlgPQQoPOyTQjkSJuvjt+n7TAUINleutzzeDQCTtkHNxD3vzwLiZiU0eR
 pp4gNFxn0o2dzvo04hqjdgtqZ2bBAjcuEqk9Fg8tid9pHOdeOjqajzd3HhZGnJT/O7vZdz1KedY
 92C57wymEYROyZg3n7+2EX18oQf2HyB5trShhMb/mSy/k09vwhLJoyeEW3cLo1pgPSzEBOlkTle
 18SElbLNy2wXq0q4BV1l5eHpUcfM8kEXxiEMzWpEcH0SdpIA1R0dDux2k+GLgPyNtURhKU1xMSh
 2MIdCBc097CxLi5MH2hyZWwpdMXxpixw1zabwaXoaXnFe3v9Emu4kr9CqTgAa8+zUnMku/ZXE6/
 BrqrptOjH1JvRlRVhiQ==
X-Proofpoint-ORIG-GUID: pjANy3Cvej15kDbpWh4Z7XluLes1ImA7
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa41a1e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=3NWKqmDfUQ1iRcuN9QhctA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Dz92lDrrY3zvL3j2_bwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110211



On 9/9/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Sat, Sep 05, 2026 at 12:20:42AM +0530, Jagadeesh Kona wrote:
>> UFS and PCIE_4 share the same clkref enable on Glymur. Hence define
>> TCSR_UFS_CLKREF_EN as an alias of TCSR_PCIE_4_CLKREF_EN for UFS consumers
>> to reference the shared clkref on Qualcomm Glymur platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  include/dt-bindings/clock/qcom,glymur-tcsr.h | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/include/dt-bindings/clock/qcom,glymur-tcsr.h b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> index 72614226b113bb60f1e430fc18e13c46c8b043d3..f338ab4454a14aa75532cd0a6a56b6bbb02f9448 100644
>> --- a/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> +++ b/include/dt-bindings/clock/qcom,glymur-tcsr.h
>> @@ -20,5 +20,6 @@
>>  #define TCSR_USB3_1_CLKREF_EN					10
>>  #define TCSR_USB4_1_CLKREF_EN					11
>>  #define TCSR_USB4_2_CLKREF_EN					12
>> +#define TCSR_UFS_CLKREF_EN					TCSR_PCIE_4_CLKREF_EN
> 
> I could not find usage of this new ABI in your patches. Can you point me?
> 

Thanks Konrad and Krzysztof for your reviews.

The above ABI is planned to be used by the upcoming Glymur UFS change series in the UFS DT node. 

But based on the Konrad's comment in this series[1], will drop this change in next version
and use the TCSR_PCIE_4_CLKREF_EN in UFS DT node and add a comment there that it is intentional.

[1]: https://lore.kernel.org/all/16ec601e-68a2-4793-8639-b899f31ff819@oss.qualcomm.com/

Thanks,
Jagadeesh
