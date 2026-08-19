Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ABC48D873
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787158111; cv=none; b=fBNPYGtNf5/aNxYRnqLPpNq6rvrQIL9bhGMyo5qv6sDJ1Lm+LfECBTgYw1eJMiqRYgv5GMYCLR2dITmM1pzFfZN9GiU2gIbNyR+ph4ydy16V1AQrOUwHfTOKLu2IUDpVp2K19szHgWFF3Bc81M1xLLLNfPInmz1qZwlHjrvd60A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787158111; c=relaxed/simple;
	bh=QlH75jraYA/wHmkNHrnrgxH66NC84yTqhMid+3Ga8So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SSvnVxrdIygHOjzYUvWTNvBmZWVWUO+VkjqdSlE/AAGli2j85v5UHistRz9kxC5A9v9R3LFNsBt56wop+/GT/PiQpQ4twsY4fs4UrShe0P+f2gDY7a+UKSeVkdBiPBsY1ov2xleMNA5CFY77pelWyFZlhM0tJ6puWT96QLOWgCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q/tqZR3z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LB0JCbLG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q/tqZR3z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LB0JCbLG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbPiM1620461
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=; b=Q/tqZR3zPGNbvJBo
	DeyKqFT1b520bcDqrgyk2O+KHjX9Q+iULEMpilKH9rHdex1m8Dzn/ngU10Y4+twJ
	6hcbomygNFJJQM7b/jEZE2o6RfVFH3F1h6Bv9t0A5I17iPY5BStqbQwbq9kzBBpo
	FuI1vNRdOJRvMafXRFRhB37A/zWSQm4PbBs0in8OgcXXZxMDHKcjfhh3nfL1TdxX
	92sTVNQZC2Q5eMq/hWYCOUH+9ZEMKkdkthxd0jSuUIWlC3AGjJFihbgm27REBTZA
	82O29mElEyy741WWTuOsI57etO1BEwHb9dvPZPoMw3HZtX6NNyhovE8nnmIyzWfW
	VIv2HA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83rs0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 16:48:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so1761711cf.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 09:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787158109; x=1787762909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=;
        b=LB0JCbLGaO94gW07ofmX952puI5fBmfbG/pvjxUDF1vVVizcp+zaobHE/M2h8qU3SV
         Zie/UZJmzn37uZUTKpbFeDOjycYzOejaNEGbc0W8czwFw9PZLcaW3fuq9sXaUD/w9WUT
         khF9AYiagTW2HCE8nL9P38ktV+GtsRNSvMOvBQFokbodz2jz+q74FIa8i5N7xNtiMVRL
         JjGCo244i2ISr5ilbiK8pxjGRUK4N0jGuVZgkh7Gz1jA+AaOUILm4nygZCTOAG/Iqz1n
         LK16xmpk1qPGXsEht4J9lfW2hvuK2rTl8z7b+W22rI9vWcOrL9oXQVa1zZcLObnTbgH9
         r47Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158109; x=1787762909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQGSJrZgnxLbT9fKSyyiM75baQUUjLKCrRcpa7yCrpo=;
        b=MyZJUiF2SGuqWC9vMImhxF4jFoPhN5BXHP7UcnKrm2QX3w1wsUGvvrFy6of3nZ4TN5
         qiKilt/BZaOCd6xXbVxowAcCgSAszKa1vcrW2+CsVyM+f8DI4GZY8jFfs9YjbYYrsRYU
         H5++MHhE9yiRM92Iz/NZTYMKHXN19ouqfOycSdA9cOGuuTdsJCaOFLpriMdEILY9ncvp
         2JvFMS5vE/zue+0RYofba+F+/Wlfw3WSn4bLiRdFOmZ2s81vMsYYIgrM0U+5GcFFG52w
         jv3FtZmxc2GDYLaEI+MtALmMSCcjCCZfl+cN917TA+cAucowjgdQ1iUW1I8B6FUY8Olk
         CgGA==
X-Forwarded-Encrypted: i=1; AHgh+RryeG5zY0NoL9Uf9eXzL+GvKCdop0v7Gyhgu7IeWQh13QJCSZu6Y6jgxbQwP1jKA5tx4HjfwH11A6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykr0jmxWf7bO9TzINF2GEilsHlyYdUOTbPTeI9CuEl+u+L7apk
	bFZjtZZFiLtZxXREbLqpqzznriWZ61S4fnSuQkv2dmvbDDTuW4aC8cyYeb20cj3yLy3otFAh3D0
	4EeO8UYyxODN5LhyA+2NgFK0qWsIvdbygdnlqtfq9JWR8K+YauTr67OaMHUF7ehc=
X-Gm-Gg: AR+sD12JZnffaiCyeAL4X18kczuBEvI31kKHXbWGP29ZwL+3C6U8YooHpb95e3tdp4I
	Zop42h70KokLxtbvMoBpU8b5EFeuVrkt9tUw08qfzF7Cu8bRM1GgohIaG9IJHbM/bzZ99ER0D/0
	h1n5QJ2sN8RapyAEuwu8tNmEBnEdp/qyBbX4pSMkWQNSC6yQL1sSdVkq3ZKDjmQmoupDhwONgxb
	afIlWfNiAfgYWhZ5+S1XFJxOFGNZaGoa3Yg1xQhohslRK9r5UVIw71Mjfed/9mi5t5TmRKiRgdP
	YqH3HLxSxesxqRuV5HQIaKb3056Hk+hPE27rK+L3cuUGmWNuli38TjRXZba8riAkqcQEvjvpVT/
	scCjabqnC99nuQBKU0l2QmYTB
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr42220331cf.2.1787158108976;
        Wed, 19 Aug 2026 09:48:28 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr42219791cf.2.1787158108473;
        Wed, 19 Aug 2026 09:48:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1207774a12.14.2026.08.19.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:48:26 -0700 (PDT)
Message-ID: <6eb07d01-c28a-4da3-8d1d-d950369dfdac@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 18:48:25 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] arm64: dts: qcom: sm8650: Add GCC CX power domain
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-13-840034124e73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX8Qr1/bvTWDIL
 TiZZeDvEj1EOaY4149P6NQZzm59bhOiEPKOl2JLwi0AnsH4xPZ8kxFR9/Vn/PkT3qAUtnwo0Cm4
 ZZ58ExjalW38FrFckNFr2kYxuV/S90Q=
X-Proofpoint-GUID: 82-8R-SMBPIWk0-yxFI-2Zz95_Iy22kn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEzMCBTYWx0ZWRfX+NIMBOlvOzek
 LXfFQpgbBAaVmoHRCRdJdhbIH7L2idXAilnIwjKNdn6yTktLUaBteae/KBJgactHAkJZjGSqtZg
 P0VA0jIx1oiWbkSMdfDHrrBijlZC67sq8UZKD1oDkyqVkpOmdV0JbXLF/ATKXRF699G2YOmjtjd
 7MSTq76F4uQ1tTHsBo44iFQBn58Prtq9rEnNxLQ82xQETKrnawOlEdnr1FGyIH06AzaOJRpW7jZ
 +xenPeYxssi/Nj0RdYV+gZ8pZuVFZlHbf7c8EGZKRP28DjHZhQg26Ep5r4hKGDmxODps40tsRAa
 4zo4pmzN1GQH09nDkim4HKKIuFOge1QVUGAkdzyXgBg2D1I+XkUsooDoIRsefgBRGw56IrzFhrO
 /smLlBWQx4X/LrVP3YbMWufsvGSxwVObIJ3ooXXFXTcoCsyEdfzC15JohtaNI4DAXjpSoYtIwre
 RL9IbpL9er1rQDzA+dw==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85de5d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nJhpUYXR7LpnGJmJaegA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 82-8R-SMBPIWk0-yxFI-2Zz95_Iy22kn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190130

On 8/19/26 2:51 PM, Abel Vesa wrote:
> The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
> describing that parent domain, consumers of GCC-provided GDSCs can enable
> their local domain without causing the required CX vote to be held.
> 
> Add the CX power-domain reference to the GCC node so votes from GCC GDSC
> consumers can propagate to RPMh CX.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
