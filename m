Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E513BA24E
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452810; cv=none; b=Lh8ViDnd0iqrj4S8ZIWjeE09bwPCkznYgYKqXPHumdQmk1H+uad2TAXOJH2ecDAwPUVRQU5DynaYYXYFY63NNm6rMUubtG173Mria7wDz7EKfMQL8NW1h5aVllIGit5CilutclclZ3awIoVl+g9R/bTCxae02Zxx0VM83HXB2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452810; c=relaxed/simple;
	bh=xX9zWyeGWNMM7GK+K88UijKblKtT1kBrY5FxPzbVWiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzQ09i+/nJxCr4lMle2x++pJsVS5Fmv/hLF76nzeRbEz91NNmY1m0cD2Ue0HwXE+DPxL4gJd7IufV7b0byUgumGGcYrfcm3ltKdUgeHdoonOWU4PXlj7de+tiARl4BEH2D6M2adXqKQxVIHYLtoCBeaZ7i1eBPJAH4ARTuRED9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WErclJ2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lc0h5d3J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WErclJ2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lc0h5d3J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q4tY1729372
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=; b=WErclJ2Un8X1XDVF
	TWxoOWPT6SpmqndxnhCaUCOr4pR7PDMMMMpq2b0TUGnFYmD960v2Ul4UDTwq04hI
	kzF9l6OWR5GjhjBeDuR774uHTZoZjgXuRRCDlNjwy+NckAQBsM/RoLSGE9XCqU57
	2Q6Pl2zh6gOBvLSD1fD/gvw13kgV5PRLomsefllI/iud/0wX7C0ZKNBqtiI/gJMc
	HS92HBSZKzuHTXhgmflGw3YMAA9yEytLzpyoLXDpIpGyhmbEMgiybT3GMT0xIrRg
	N4T+BGySqkLwUfTMvnXeZ33jmTMc3x1yxbPzURXYw86zit12hHrmMAy/TQ2VU2+e
	KCiiaA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5kr6ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 08:53:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f71af9dddso903105e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777452807; x=1778057607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=;
        b=Lc0h5d3Jx8cM60ST7FB9x5bJ27qEsqVaonj36m1D3nFUV3VezZu2SXb0jFTlJdEc8I
         wAsAYmyaSQRjKTJnXaZKKpoxvZI7kc162TwsynMCol6iXsI9Gpzd/h+ish+IhMgwUjxv
         ClfYbob3Uj7fQ6LzU5vNUFwRktkFrAd7lx2g5M9XBGNo/mqicfBIx+b1jxwUskO+knI7
         FRb+yK2HJbhQam0qVDhwl66PJvDq+5tMWc1xqmRvTteBc8HqrimcGdmwgk+of0lXyCUv
         /sreM93bEjVON7jzAeypcGYzc6svRPKrJ0CNQkpQkMOFG6x3CTiaOXEeqCM3VI5y+ZFu
         47dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777452807; x=1778057607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AVAcOVExx0vErRkm4mqEh6MXnxWwVTvQfxrHffhpsfA=;
        b=WKOptXiNeaz6leW3Ch88ODsSVEmoSpOSTG+2xHlsrm7kBJitJukWbI7SL3lgeLGYy+
         U/2kSoXbpOlPjEhMDv7e7fqD1BKHoJ9w8M28PrOjYBPtMaFPPjImrVDPdhCHsq5HeLVv
         /qs7c+8jK/rUgj4Q7Ycv9h+u+RPzEaFf5dcAUyHGrc8fKC4ZQQbtAHEII2KKofxpq4XF
         cM13gmDbHvmnXtZQeBgT7XQ0VBd0A32B1cJrnTt0Vn/SAn4DO0uG+Dm0fiuZUrMbEXzg
         yz8edXZbI/4ITxe5RLfEgFZnye26hx+zFVIHexZ7Hakj1TklRXfAtYrgiMm0LNXriJnj
         YLUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hhfdVe2jm4Y1+h60zKskIXE3XXfOvLW8GKlT2JwUCbGAY4pA3TnjxMhcLCrrCfAGz3a1bLhj+Ky4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIkU49Votd14Cwc+ejWq6yFUQ8gzeI5196LI3tFhmVt6+QMO9
	Hiu892oODMIiptvN11AZfHqhcFzjVGek3Lwh/LOu002tz7U5ezYUTaNcv92z2DfeRtVv8B9CZ9A
	kC5a6KmC6uv6mrffq3WLQXK+u/Iwvt9KBzhdH0gA/fIXyZtI4VUtbiCBVKUY6VMZ6Keb+9Zo=
X-Gm-Gg: AeBDies0dKqxLuvACHbxV40zyNDRQr2OQyQmWlbjFeF8kEQMV2Ct836v8xS0+uvYFcB
	5YcltE4ix/lEvEwEH0oeNYD1qe/T4d0woyw3Ik9cXuFLrGFC6YOcXBqcBrLJUreA7NixzfzU9yG
	kLJx0tLMAu313D12wfPMgbpThKy6mWxx9UrXQcODEiQHw7AwH6s4RhDcmLqDXCVvA2xbkaBrGSM
	2GI4wg7/Y+7f21Lwpz1eFb7Xq36RPKdq1ayAWZMQchoJ1xZ8TnP0CnxfAKX7mIftv5QD+MUsz3F
	I/rIViVNjwg+UVWBXp4rfuwFqo+fZmztbcvgC2RX6OnQ0D0jee70HCkQPJSat6U9nkKQyhaw5fD
	tsO4MJAPyVxx+a1Bx1yvGhoVP68er182O5Qft2Fg8uDRpy0ZgJfmGHF5slr04Frqk/Wt/sRvOFf
	anyDMByibZnZLCNg==
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1225705e0c.0.1777452807509;
        Wed, 29 Apr 2026 01:53:27 -0700 (PDT)
X-Received: by 2002:ac5:c894:0:b0:56f:6edd:77ae with SMTP id 71dfb90a1353d-573a293d531mr1225691e0c.0.1777452807044;
        Wed, 29 Apr 2026 01:53:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb9854396dcsm60429466b.40.2026.04.29.01.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:53:26 -0700 (PDT)
Message-ID: <2aca441f-55cb-469e-a680-2ad3f322fd85@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 10:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board
 support
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com>
 <20260415-ipq9650_boot_to_shell-v1-4-b37eb4c3a1d1@oss.qualcomm.com>
 <10af8a5a-45b5-4a87-be4e-2501464ee827@oss.qualcomm.com>
 <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6154cd65-1aaa-474c-8816-c48c1fb01b6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA4OCBTYWx0ZWRfX+kektdpHdOHd
 7yBoTdPYgTi9m2HPc/HjRLQnHO6jhajZYaStuUlQzn4cnBeTDgswo6uhkO/4SRjpWPNr+4zs3Tg
 3YpNQ46oCpYir4WCoBnAJoAZTbtDgYbkNgR/xGH1EC1oC2+ZPNOpi/DfjZGl2c0S7t56ue+KdCy
 MSpjfNlvGA8RBY9lZ/L8z5/eIJxWaIKSwT4DBLJkO4fdR9Zc5NAihiWl8Q/CDoDobD5RbWjbP+t
 K9XHF+5oEVPoArzoRJ3xVzXoDH5RSyBIKrZyAsoJlgQwttaoDybcbfupA4VA7zHaRUOzzKSUds5
 Zaho3r66qPRS/bjFL5V1Zq+ziyPNyH9AMfnHSEOi578RN/Umm3vXOW1A9SMqPsq8EVEjaxdEZse
 d/eESBFGVX2poSCioCpAV59bLor14dhQOvcvXMz2RyUhagIqZ6DffpW6O2gTmOoCTdVxpTkcwRB
 N0p4tmyTRZEH6HeN/gw==
X-Proofpoint-GUID: tw2QjH8fIgLPNJKDF5yLkiRLrGH1P-wC
X-Proofpoint-ORIG-GUID: tw2QjH8fIgLPNJKDF5yLkiRLrGH1P-wC
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1c708 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HnUB0FDFPF86eyfwSe8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290088

On 4/29/26 5:58 AM, Kathiravan Thirumoorthy wrote:
> 
> On 4/24/2026 4:51 PM, Konrad Dybcio wrote:
>> On 4/15/26 3:33 PM, Kathiravan Thirumoorthy wrote:
>>> Add initial device tree support for the Qualcomm IPQ9650 SoC and
>>> rdp488 board.
>>>
>>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>> ---
>> Overall looks good, just a couple comments
>>
>> [...]
>>
>>> +        CPU0: cpu@0 {
>> Labels should be lowercase
> 
> Ack.
> 
>>
>>> +            device_type = "cpu";
>>> +            compatible = "arm,cortex-a55";
>>> +            reg = <0x0>;
>>> +            enable-method = "psci";
>>> +            next-level-cache = <&l2_0>;
>> You likely want to add #cooling-cells = <2>
> 
> I left it because to add it along with the TSENS support. Do you prefer to add it now? do let me know.

Up to you, it's not very useful without tsens

Konrad
