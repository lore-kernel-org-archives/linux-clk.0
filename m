Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D23CD8D3
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347568; cv=none; b=BNBY5yy+flP30L3VepO17qPrkOKl8raXccGadbaObA1OkuEJAc2jDQLZgXEJvKNPOaBqS2PcBbfD6K+WT9MhBw6FxP6NCWLEGyKVP4wJIWmYrtc+cbUJteMXilxRrCyCo9rfv5VNB6he4ueXP0Iz9Gjnbgwduut344s7GG+ZUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347568; c=relaxed/simple;
	bh=B70FZ+Ga8PwVGy83BiIRKB7y4GG12RQVNQwTwJXCbn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/ywiyCoDtzNO9PusLy7ywlwmsUf4v/P1jgcv4e3u7kr44XR0Qgi8aUjGZojuwRhqiXkrubvDUurc0HmiV7SBGoneeYsCL+dsBcn9xrPsMztGJRDKMsI7IHil5J+GI/Fye5HGMZgjdqP5XWS7lKY8UFdz9URqPeTwfDtZvsTs1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDuIPU58; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPctGZyQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDuIPU58";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPctGZyQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8YY7a1702831
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=; b=pDuIPU58c4TY3F7n
	SZFptInWYSXM0aMao40zBx1KsOP0xDNt7CYf0FMjjqrvHa7gWfVfiAhcR2x7KzZG
	HJ/hdYMcAhlutyD9Gn48ZQ9OKTqfO6VrNs+q8x1zSAWcpI2Thuw8Uybbr29VYbU5
	XMEZ0gFCtTO3jtOl+KxPs8skaGXHsqu8cUJkd+bxEBpgj7VBuvENRBLQuqsJ6rjA
	YMDkfpkHEuaeaiWLyB0OTmgO3eab9ILSsLXYrqRS4DpeMFZEwmim+bfsQA5xrOoV
	kBNm/snElZGuWNf/MtE9gU/3SLbZspvVlhXvHw2ixJAgZsoiGNRxWPmBSnGe9kRa
	xNOG4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djdamm1tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:52:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca4966fe6so17154876d6.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776347562; x=1776952362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=;
        b=jPctGZyQpv37z4zB6wUgC/rVTEsPdobGZuD/silq0fWFNHWG0YREGQnjfeHhWk/vK8
         zMS/Sqrski0JYIJ1HyBOXwtJ/XLF4VHmpJJkbtKcVAvzAOnPdMX4iH7+HcgZZQBIDarR
         2EWZzd/7nxkrwb9yVkL6c7W6zyoMi0lnZp66mAMIDueP+AZ8mZyccS9FNu81H+ztkGRB
         CxMbflr5asYalAEskpbYToXy+/gEoUAgLOWpdFmEqnhoOHy2E+9NjWqSFMppHKoO8vK8
         ZNHiSgzRK/XsS+Gqph1XufejvUYO9fU74s/oAaxBZx3vZx5mnkAAgngVRRD+FQZfvCAR
         0nXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347562; x=1776952362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OFWZqVzZGSVKYR/6nGUmZmi/+VsR+GRP+LJUeyBYjU=;
        b=NfZoo1rII3B7L3zaFVXIFT3eJ9RwC0TD3YgdnW6NgWrShUJ1EbJy7Syv+/U6nYNjk9
         a/LnA01U5t9Cf1KS1JYkxqZx259Ul5aTMFwyxLN9kxPv4zMz6GeFWQbXxbdgswRqxwVd
         ACWH+4L/8fhkhNZQbFesVEI+8MvuzAW/mz+cKHiM0S9VTZvsysRCT2p8nmBvsnUzlDY4
         6T8RGLt0TQ0S8Exh1dmCz19KJooiNIFyHev3l/U7ew4VZEhrFqEp8ulPeK7POxp+bQHl
         a3jpakXT53u2isaN9KwTSTggSgNoPvVNBW3c005GKSXqUmcmteRZ+2XjgU90Eh9icuTL
         ZM6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8BAVVJfmF8oCbPIJT1E3BdJCat54AtM7ZiShvK6/hVmAufaQVoxE4xCygSVmSqYh+prfkHlYbUxa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/c0zAedfnLrcOMauvxVUZ26ZZeq9yz2g2/RWux1DF1wvzzkZS
	v0fb6LiwlvS12mKFRizQk44E910TzsGudNrnmgDAh2cirilPsDrWSLJ4Fn2AvlVRvTtzU46+fxY
	9WSDX9CMbvqQafTUwnF1ryWONnmyhZAZr9YtbtQcbitMMXtGPLqxldwlxmFATBdc=
X-Gm-Gg: AeBDiesLapWA9l4OcwxCYE+rEP2RBsF87cjOXr00KlCiJtKyiFUn8gZ/ozr3FJeOa5K
	juGAcHyfI0V9mCLeFbXcUo751hT+D4+JMV4Y7aIhwbgki2k8XalcNEhRdUHuNvgomn6ur1Unkzb
	IbWrAfX8gRitxTZq0s4ZVsh15VRrJ0rBH0Ma4A6enhUI4nEuN17oNXrHnjRlhmWRqKDjGs3iywn
	eVVJR3jU20ATOSJhkA9riM89gK608uUmUfoW1uOkcIbB4NSKsrxMz04r3zA1BAi2keZbPQTgWxM
	n9fVrtGHsUdE2pUjWvkqhEAm30u06QGhyB6F4guyAR7lxnd2hVtlIbGp+j9f02Fs/KC4gOuozPv
	sPqs3jU+heL9SJBNeV6HN+5oBgbMGDVzCiYH5K8+SQVUklNGE9ZFrgtnbDUIld5faJQVCeHpWi6
	0YfmXyRFIVfzxAlQ==
X-Received: by 2002:a05:622a:481a:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50e28cf24f4mr24101601cf.0.1776347562458;
        Thu, 16 Apr 2026 06:52:42 -0700 (PDT)
X-Received: by 2002:a05:622a:481a:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50e28cf24f4mr24100991cf.0.1776347561884;
        Thu, 16 Apr 2026 06:52:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba170629d7bsm171699866b.0.2026.04.16.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:52:40 -0700 (PDT)
Message-ID: <b7b6c3e7-f8e6-4b73-b17a-e5e1691a54f8@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 15:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fzdxMvYfeYfUqYyrmwmK5cIW9Weassmg
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=69e0e9ab cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Hal5A9k0WOgLizwzjeAA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: fzdxMvYfeYfUqYyrmwmK5cIW9Weassmg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEzMyBTYWx0ZWRfX1+mopH8jQJYb
 8Ryyn/r0SoueumdPKSOXIK7VdVgPoylFarHaBGfo115bPDanbmoejBhoJunJgylmK4rj19bygFD
 k6teqlAUxb6ZwDXvTFrh77DmzFmFNXwqrcMP5TjrUmcUuj0nyCDcPgNY+eLfVv4V1uwrQJSgn5u
 MKAUIW308EvVkDfKA7ogQr2KKP7leKOoh9t2eicg9PxISBUBUmXItRMbTW2IK5saasmsdfPIrFB
 Y8aT+zHQy4hxBr2HDspdfz9EH23fOJ04ntbIQ+An7jXfPoMFgGvARrc+SMzmegmBv70vk/jyxab
 09ltMEjy2PqSzPvGxHkTo5KUGGliskJpqWNpBgcoxJuyLlPsww9Fi0YcVKeH1g/RuRvCOPTO50z
 LetpldvZ0r2TNL53VUG53qkvBiiBh/Vxod8jaTLA71tL6dyJLy2kgWb9BVRLZNR9Uqhq5y4Qqaw
 OTSnIlOZkI9xSnvYAbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160133

On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> This patch series is marked as an RFC. Before submitting a non-RFC
> series, I would like to have some details clarified regarding how Venus
> works in order to improve and eventually upstream support for MSM8939.
> 
> 1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
>    for vcodec0 cores have only decoding bits enabled, as depicted
>    by qcom,bus-configs property of qcom,msm-bus-clients children
>    in qcom,vidc node. Do I understand correctly that these cores
>    are only needed for decoding, and not for encoding?
> 2. Currently in device tree there is a video-decoder subnode for Venus
>    node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
>    subnodes. Does this mean it should be dropped for MSM8939 as well?
> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>    now, it does not work. It can be enabled, however, it will result in
>    breakage of Venus for faulty MSM8916 firmwares, because the code
>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>    this would break support for some MSM8916 devices. What could be the
>    best way to work around this?

if (!device_is_compatible(core->dev, "qcom,msm8939-venus"))?

Also, you mentioned HEVC *de*coding, while the commit you pointed to
disables *en*coding (decoding had been already disabled prior to that
commit)

Konrad
