Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F77242D6A
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 12:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332197; cv=none; b=DOQWh7An4xOc9oP6VTV1T47QSbDlE4/uRpwYw3+0/4zQt7FOvNhtLeyeSTb50B82bbDWV5tuJlcfIjOEUVEMU91AobFf+sSM0BPq7fBYoSJu4CnaZXFN7BbQ4U/wpXN85J6hwQgLoXF87rhpF2Xk/7FfkIAYZgGx6PSvIpZ1usE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332197; c=relaxed/simple;
	bh=4QHlZiAg2nr+h401QmtY+/NbyzOxnSl6KaALxYS8iWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcTgxxCrgC0w2mSAl20b3yZjaMv4ainJdVDE1g6fy8hDqLxHqVKG8imouheF+4BG5y0aFLEhcV4o6XRRWAxl1/R3pUONT/Uc8c18Vmoy7j3V3k/7RqVkPoGneTBwTSDIvjdFqVyIef+4wDe1/TlLTdoSJdkCCeD9HdJ4+92+5CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEcMJIBS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DMLKL6wB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEcMJIBS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DMLKL6wB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9YJBd2802092
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 12:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=; b=HEcMJIBSybtdCLpG
	6uCve4e0Qa0ahXp2gdjODYBpeDZJ0uK+AV1sf8LbVH3lQu3cR2VDaO+/6XNVuq++
	NiwNxw8gZ+/i2D/BH03HUDE+tc7qqak+cd1ic+xhRNvj7YtPJ3G3xhvb0YTvABOS
	DhZMJ6FPV4vb4GTgCDGkIOGDx1DLd12XakNd59VAeoqNQLWj4R6Ub1KcQRk95cJF
	YuxxG4D5i7hToWEZkhZpxNLaM6aE6WFRzKTQrdtiseFkWTGqXs1hyDgueX60FTpM
	bc1pw+ZG/1tD/j0pVNYRSbOy5OIa5rI/+kDtNILt1EJC5+9ZNu9FPa7jrPfH//9g
	4VT7TQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxukfkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 12:43:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8960257db65so30917746d6.3
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 04:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771332195; x=1771936995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=;
        b=DMLKL6wB3aUmjl/94XNkGrXtG6M9SRiFqHHIfqn84FJa47qHx8j40i0DC2n3R6UUnQ
         pIuwZGsNgMRScVcVbb5ezk/On9JEjrll6Wm8KZ+ZSPIVrrJNdV6bqHRUcaCZMlGaz4kX
         VK2uoRn0wy5kskCPG659wT1QQVN9Le/fVZ0cpFChcTXD7xgL47LCoByX9vCrl6Rw/w8X
         2G+/ejOZD/EwWlYVawnabCp7gPyFowBE8lba679WpQX/ph/Et/ePm0Xrs7G2d6zvuGhE
         38RMj1253GP3vF6S3X7K5CPfTlxX+uabtojNkG7t0JVJghLg+WXNKcwSXUy+YHF447Rq
         t+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771332195; x=1771936995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSGV+cDMrzNJBL7mWZtz0+eIS66GpKCa5MLYXFvWgz4=;
        b=qq0JbfINiJ/xZCLRMtAHU0HoY1/53RauTRSsX4MWeXwP3KEGW6FGnDvNm1pHF0Dozx
         Uv3YHfAKkiu6m5F+n/CxLElgZq8cNS/cTVPnpijWi3L1DTwz6MwldawKkAdcT3njh8g2
         d+sryD44odyQbUj8yt9QKnfnwHlV5HfPqFpHr8dEJE0oZMgPovREK13UaVT6BHEz//BG
         8Byq3ZRcLHdEpB4MjwVUGJ3mlgUlZS98/7RZ3Q5aPUy5/vZZvf3PTuka2mzC72lVZxJO
         n6kdFJtjB2vTX/0Ctz1IgB0sqrgTD1V/WNV9ItjnD6rnakBdSk14cbJn4EZ8hR4zPN1E
         mD4g==
X-Forwarded-Encrypted: i=1; AJvYcCV1amOkLsU41w9l97aIB9fH8eyYOQOfQFryNL+VRJZCopM26jIlsulEQFT/w8UzyxG0FJpRkucRsOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGldqgRd9JRUJY710lgo0Qqa0EpII0xoPxIVbRIxS25jML+2jr
	a9ySWVSJICHk6oC+yOkhhhf57lMSbN5dYV5mEHtcMaFZBq62/A8Zf+9v7dn2glVVqmQqdUvRlwu
	nombHc5gg50YThHkxT3sh3ljUnEeJWsfMLseAodNhmCs9cFrLSDpQkAHbdotjG3M=
X-Gm-Gg: AZuq6aIpYHYU0DEJhYhWKtTiXkGw0ldIKUfbMOyn4h1r4GaazcoZAW+FEYNatUXj45Q
	OlRi8J3VclvPOmdOJcY64c7dl32w8aUzoUeeF/LW7WsYR8hD+Tsh7KDGp0TJF0hoR8DXWYULhm+
	atf1MJw8g2uvLBkkUi41gbmlpNKJKuVw3ySQgztkAdlPd12T8IapioFMTSyC2HT2cvVwyHlsBn9
	ZbcDKtjICbOoKI4WRdxRHkYJHV+1m5hAwH5UupgQvWYxkJXttEjOjxPetFkyoATE8xyR9jpqYl+
	H6qmT5IHyfTHA5zgNHWKscEPc2277BT7dhxaHWXiPki6LZxvapz60XXyTKWH61pV3+BlvCj6TUP
	7kEbJWuLXZe+F4/qEZ8hncDDGPOOLMCeB62GL3Njj9p8N9RJVkc2CjgRzTUvFL4OjcxDJ4bBjdI
	ozUhw=
X-Received: by 2002:a05:620a:2988:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cb4080809amr1276633385a.2.1771332194588;
        Tue, 17 Feb 2026 04:43:14 -0800 (PST)
X-Received: by 2002:a05:620a:2988:b0:8cb:3a1d:79fc with SMTP id af79cd13be357-8cb4080809amr1276631385a.2.1771332194210;
        Tue, 17 Feb 2026 04:43:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7385d99sm333776866b.17.2026.02.17.04.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 04:43:13 -0800 (PST)
Message-ID: <e8eb2a60-d0d1-4522-a70a-84386e32ab1b@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 13:43:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/8] arm64: dts: qcom: Remove inexistent TCSR_CC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das
 <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        stable+noautosel@kernel.org
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-5-cd7e6648c64f@oss.qualcomm.com>
 <d81849fd-dc32-44fb-b523-2026f2c0db52@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d81849fd-dc32-44fb-b523-2026f2c0db52@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qTeCfQ9CFNI72W5_TO-MQ-ZBd9e2fN0f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNSBTYWx0ZWRfX09+jlsiBf2zf
 bfYkDuD+5q6UidxpTqCravAByG63rgBpVlLVtuoFNSHlT5Xws9pDuiNwrVn4JcWGE3/Cd+Wi8my
 dVSouviwGtVUNyvss3stvXbT/eV8sbP3AJbH4Uku7RSbxqthKQbQ/iwLwwK2tK+kpnFOxSdNaEQ
 2IxQrSjwdysfEvKpoglR+jco9l6sdCfFexRQzJe0yfQfefbzaGAz4InC2vX62fVTFZq6sU+TFCM
 SmlHUoqXvEXX8op6moRvLPPwuDUyFu1bz/045yoMDCjIdRXkhx6sdgf/8sJ9VkIQuzJaoYTJDDM
 6L85uOOoFRbzp7BYn7zov28eqxakn1rk6Lx/DW9vSPQOB5/HE5QRORxKN6ON0G++7jWD4Xp0Mpw
 /XSIOLuV7KJKnk1coHwy+F0xU/oJvXBnVvPyN3bsESp9SmM2aPd0JdR0+NnrhQUPubDrRNPWwD/
 Y8Q+a7X4PZttj3oRGPA==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69946263 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=HEtdb3PhFzw24E7G2eEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qTeCfQ9CFNI72W5_TO-MQ-ZBd9e2fN0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170105

On 2/17/26 1:39 PM, Krzysztof Kozlowski wrote:
> On 02/02/2026 15:57, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> On SM8750 specifically, the block which provides various reference
>> clocks does *NOT* live inside TCSR, but rather TLMM.
>>
>> With the former now being able to properly expose them, switch over to
>> the proper source.
>>
>> Now, the TCSR still exists as a block for various tunables and
>> switches, however the prior misuse resulted in its 8750-specifc
>> compatible being already in use. With it freed up, it is now free again
>> to be described properly.
>>
>> Fixes: 068c3d3c83be ("arm64: dts: qcom: Add base SM8750 dtsi")
>> Cc: <stable+noautosel@kernel.org> # complex dependencies, no immediate gain
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 22 ++++++++--------------
> 
> 
> This will break all the users of this DTS and commit msg is silent about
> this. It's also silent on actual bug being supposedly fixed here.
> 
> So again - as explained many times to other Qualcomm engineers - you
> cannot just break the users silently and without justified reason.
> 
> That's RFC, so maybe you planned to rewrite it later, dunno. That's why
> I did not review the rest.

I assumed the explanation in the cover letter is enough, but I can
include some more context here too

Konrad
