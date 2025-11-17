Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015C32F76D
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384107; cv=none; b=EnorPKJiIyWXop06m3waWIHOFzug5eNuucT5CXcA1N5J1E++abzBkFF7ezoLi7O5GxP5Np15+clb9q8MaLJEpSRY6UuLSFojS+k0UGWdEw3VffS1x65Smunp4QclPia7Ltxv3teO0EWDsicNWiczY7Jotfwj4lN1NTHFrCZ0UOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384107; c=relaxed/simple;
	bh=/ViQXVPETgm9i+UC8rUHlH316+ODP/Jsj7gqftltoPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXSDEH5P2KMU2xEa/eHvSdsSVlqDHKCNU9pxcy47XHoky0RpAKYdYe+OcL2sg6vHCnWuX6m4IFyEuH9DnuUpB3lytfdCmb0ioBR/zyHfbpQ8iKsJ81icQuOor7ROe3yTBiLmhAJkWeQoekqJxzuWVBxfc7Vsb3WVkP1+HL3iHnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naEH6W/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuiMWbTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naEH6W/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuiMWbTZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAprRO3920983
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdcENZOZ9B7OMEu7ofl+EL83OBr5cRjNFZS05TG0eoY=; b=naEH6W/Z5wJRo3h5
	6yOD1vojhaBFleiBn+R2Kt5cuvlovXuBCXdAd/SXbnGXsKkJE+sdvvsua41q/JzZ
	EMUiXJ/FV7iIyvkTcCNj5ihQPnRJb5Stp1r0pj58pdVP3ZzQ1NTL6VvImt33K3s7
	ICGENOD5rmevp9mRUinAwwaoUC3BUaTrPtZIWC7g8L7rPEn/r0T8pZbv/iXC8hxk
	dhcfNr3/ucrTJS6REFUkszrJpGa1NEZeUtvK8iIji8kafbdg7eNZ7sxhP/zBlfqR
	/a6GWKEvMnSK1euLyGTOAjTDTDFxOD9nHSZF+hLa78ccLhT/Jm5ZsS8hOADv4uCW
	qyRHPA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay8b0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 12:55:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87ff7511178so18351196d6.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Nov 2025 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384104; x=1763988904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bdcENZOZ9B7OMEu7ofl+EL83OBr5cRjNFZS05TG0eoY=;
        b=VuiMWbTZfB2Ib6Rd3vTP12Y9rUsF/rHfBHvn8mjVk3TT+XXGHO/OJght9prJKlMhOx
         nIB8XX0Qj2gE8VvbXInvQECoCbrBwf4Sw6kAWV2FSgKcdFBrCylkOda7H8W6i7FE8sew
         SmFx2hXnoIZUhSVcOSbQG1Thjw+Hc6/yAGhXrhmYxosu3Xz3Nokx5JLKz46BvuWVS5QD
         x/Agl9Pv82AkXhvUsF22aipiFXBuPiBfOHeFcGRMuGKg4tomTc1g+5BAebwA5U95eFZe
         MrzRUlwn0EJsf6EKtTCRAFz6SHNPhs7zEbE4DyslAuxXwy9LdebfZG4wfhXalgrPXjy8
         Cm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384104; x=1763988904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdcENZOZ9B7OMEu7ofl+EL83OBr5cRjNFZS05TG0eoY=;
        b=oDsvK9l6QikQMzQDqi4XPcbHw9JFv1GeMN82RR5kmYoQK/AhjVK/Kt7kNj5U7x+xpj
         EHCdgdxs12rE0QdBiKuox7XAGOwWxobBVGj8ut/mv8lw/i/mCer5FDIkV6bf1DKCH0Bp
         8OGe1O/PyWwDaTjFND2dCIW0zJdwQenofbe0uSXH3xg6/k3c633rkqvM29s+7ulp+wks
         ZC5KA0WBeabXsTJflr3Sb89PES8np/Pef52/oi9qC4ZcOVtzXHp8tdTXAZxnlBLV4K1Z
         OkuXD1RTHzv72bw7OcwF6ipDx68IWsJYpHw60TtDV/7vrslQxjExnhf/2ri9NDTF0x1Z
         IEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoOF/bbLY4kmjCeIWFTlAh+gxu3ouvE1V9pnZ1F2lfDfndLHH92wEEP+Tr9I3HoR2HMMNQHjz3ewU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5PMWsv0YtDl89Hr2tCEva8zXrp5VvSaXHfEqkEQNXKhLLcrB0
	5VM7MwkN/OxOjNNY6hwEl/8WLcfknkU+UiM478CL7Y0GeQT+vcjm6nNRvcKp/9xIF+QIVxPnsW5
	0y2T5KQX0289FULL0r055KhRmD8kux0UspBbfj6rnCL/K247LwMy4u9Fprt4HK0U=
X-Gm-Gg: ASbGncttzaRYaoE3KqDjI2sjefy1Ng5F1FvMzxA5gu//+uTRbx3fSSFADk1dq36elT5
	CEYQgWw22t9dl0r+n4qYYCm4ggKcg8mDtP0fk8l5ZTzjQY9/9u+2sSeuqomduJYXTT4zKRMoBE2
	PdcvthAPIQyX9ImjTIVpdUWyGdSkmxJ3Aqm8wd6h90hXpGHg0A4ExAFt3pOItggEE1unsoq8hcr
	/W+JNoG49K8pUKmnSHQKikgFg/jSmqLgaPermK6vJb861DQe42riQ4L5b0JFWDOGTavGK3AjXGk
	MwYZfUIrC32wzzdmeBNkvl72uSRQy9WskhTq9zmbEHVm0B275ZLHhGHZDOV8ViFZszP0/w+vP3K
	dJO/VYJsRsNXmX1vub7AvHec0UZaBPMhgQfJcKYMnh1ZyFjWhE/2jJOdd
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr108054531cf.10.1763384103729;
        Mon, 17 Nov 2025 04:55:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyFG2DBhLfyxJtaVBKBZsfbbQ4NicKzSiY21/zQKPNc2lzz4cBWrQJ90YZ/edIQgdmGnAR4Q==
X-Received: by 2002:ac8:5d49:0:b0:4ed:6862:cdd0 with SMTP id d75a77b69052e-4edf36e32acmr108054351cf.10.1763384103351;
        Mon, 17 Nov 2025 04:55:03 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734e9e0f20sm1090820966b.0.2025.11.17.04.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:55:02 -0800 (PST)
Message-ID: <188c5c73-4a91-4f3c-a45d-fb35b171ae63@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:55:00 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8917: add reset for display
 subsystem
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-3-08051386779b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-3-08051386779b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b1b28 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=G8-SSAS-OYPV6Zknk1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=YF3nxe-81eYA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: LX-2lttvzWx_fkOIxevbtXMScqWzndIe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOSBTYWx0ZWRfX6Wm9E+IObId2
 0B0ZHG6EXc9rAQEZZzxuPEEpLttlT7YlgVC0kbdmcMLQQ185rRsqmv0kBX36xcvUOP0fH+7yssa
 y6aFMJyfja3KKQMeRxYJUjO7ovpUEiEfM3muWzi3BcRnM488BNi0GGt1FeyaOptVef3H3tgXLc2
 MdNogLknfuMAFcNdNifqDARLv6eIQIyA3R08w85YogLEQGkcGHB+JUjooY4BAjCiwMFCfVsgn+w
 aCLb37Ps7A9nm8etBEYltx+x+T/cs/TobPDBndzlfuLhSLfUxKwqv2arRqmVY9s/uvGiYiY7E3B
 8euTyYrycm+4a13YoPTYD6q0veD9VrcxBh5vVpQuBRkLkCNf+1y1YYcaGHRDP3FhRHf0rrEOm+f
 i8f5gFYFC42RrQJxiU1MxbYTY8t8rw==
X-Proofpoint-ORIG-GUID: LX-2lttvzWx_fkOIxevbtXMScqWzndIe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170109

On 11/16/25 11:10 PM, Barnabás Czémán wrote:
> Add reset for display subsystem, make sure it gets
> properly reset.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
