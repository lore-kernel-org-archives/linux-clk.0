Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518D3314A1
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617432; cv=none; b=lHq1GG6FnAj6XwQVoKjcwYwaGWoL+X0p43NbReKl201rmgOPXYYn+a2yX70lKnBPUJ/uxYa3RD3iM5Qa9IAJcZGYVRu8NUU7Vb6jlYsAFO8NGmPs0pc8TiORX5qWQoKTlQ0gOcXK7Bsvn6wqryhuJCVto0aKvxwi3llIevdqreI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617432; c=relaxed/simple;
	bh=bKV17d9tguID0LIesu8rxYoO2nZDE0Plv0lBRFnUe+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ECjTFMPV5Gb+AN7aklIXav3B8z7EcsbiYk8AqFU/kyc2BIJ/rhFg5uMyirAlB9juj7xJzlGbJXOo5W489E50DauIb6tl8nSnAnmfW0ONAXXwTsST4EM2RK8vDNHiDFYkuShhVURCe5aawwUPjjgENXdmcT8MmCBs5QfzV47/CLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbZztLce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S4iR8TOz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbZztLce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S4iR8TOz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9CUf248207
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=; b=bbZztLce5htqB+3O
	+w1Fo/2iUHCgOt/hWdZlXc5G4Qkhq8hGeyB4Yyu6TtF3S7Egt+gVq7wBbpT2nkGW
	Ec15ZJeh/EIj9vqjcF7udRq10ujntgMSuiv8UPGdXmTW5N2Fo2urgiU37quZnGNu
	z+SQSfXo7mByZkiJj6RKN4hk9uimRTrOfNWhVB7v/+UkBDtaeD+q9S4n31Crivo/
	ts9YRcjEbNeH9eQVAnGf1baKzyr9zkNUv0R9lZrYP/umcsoUyvkS4PbHJPHVxhhM
	rQ0AhQq4PD92Rz0qQhRbkzLA0g2sywlndUs7TmLKm3718/0hGf3nVZJLruVVPL2s
	fzMkRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xs9cgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:43:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5199ca24b07so1044611cf.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781617429; x=1782222229; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=;
        b=S4iR8TOzNkYPiPcwtuxxrpxzB9Jet88oDuKFRMlACWu+hwCMjes7whw3Z8ljAhE+zu
         2UoXT6wDoQbrd/qQ7s+5fOj43fv/KFd1lAGnzLLnGifI7XASFAu7gXDfY5q5xIRs6/TH
         lfdDBBYMo1N5fiucCKWx+sM8i/5ydE3wpn19jg4OH3PrNTv20YCer4++TDt2on3dVrVw
         7V4ZbMa6Va+2Xib0thpz2MnJeGtPf7d9LgpL/+5MdA9kDVYMOI0C1R1L7PLmM9i4R6nh
         WgKrFyYYSASYI2tLOA5PYAvuXUC3NIbrXnfuIpWNfK1rUxeDC4DWRWZtcYGbYR9PinMV
         0i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617429; x=1782222229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lx2pLtb1L3rBMwiQWuihEDC+CgioMsnRDiqje1tzDBk=;
        b=fGPeF7TpUt36/VI1gTwJZmLhPd/H1TYeCFJ40BNwkwJwvXo+DE3doNK/YFebiDsRY1
         mTM4wvkma+J2GpETox0D6A1GLMs3q8iHdBJjqw+IcIcdwhgR6jtnhq86V2iLaAi+QCYB
         XWm0xoXkRp6p9Roux7OkPWDPvd/78jQoFvAlDgIdkZLz55F+cXdB9jnYnD24EcMXh18f
         KG1X7WvEk3z4b16894y6NFlNFK2cGFrhmr32GhTeVSCTXK39076vOkUkFUKxAR36Q4eX
         5JB4F6Si44uYmW4wHSSfxdWAv74aG/IsjAgD9qIKlLtdgQ3Zzu5npsB6AGbGH840lDxq
         BWDg==
X-Forwarded-Encrypted: i=1; AFNElJ++9JapD7oV3wIAy2YPbOFi2gPXWNedz/gkcxZQIJEcPpDqC2BfrKKz0kV4Z1OyJ98TboZf2eeiwcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaxck2kKVGsfw2aRxJbJwk9VXs2oru/IIamqzclOM++WjmtWh4
	p8c47betcSSL3G4U1pWka6jf/vBwSzbDWJszT1vcy9+uzN3jEeXxu9CvBVjSe8eLBRqdhEz6Tw/
	yIb3AcDJlr5XvX8vsjXoK1yMDO7F5gVINpIKcqZn3dT11HeYg+kqyY65N+ak8jqY=
X-Gm-Gg: Acq92OGmfSAFWxJjtNznXwGZy06JCJ36nr1eKU/AGyUtEdXlRMTXxM1MFUOQNTTM8i2
	UGXYg4yYZlnPeOji0RzFGRZYYH5nfN6aLs+zvf3PpIiL+3KwD4wk9h4HP2Ln3u2lrE2DwFRmjGx
	vUdybpR+5BY8uThwGnRzuqRV4I1Fmt4+0RIjxE3Dm0GCCE3iI/JiV2w7R617p4yqpEE1N/K0xT0
	vBhBbiPzh+KMT3iArEvVJ1tD1vBjUYI3rvqnpvWPWvb3FEWBS7ePM0gMe7I01jyU46H9SWAWW7f
	ybAlEsvlJjDp04N9dtMvX0nQZtXZLfNbld1GI9cnPjUE/Bc6SfzYjaY2spzvyhiE9rASUrMPbF+
	tJ7iOLWsleNiR9tQFS+oXySI5oBB6nD40xN3Z6kBUtaTnEA==
X-Received: by 2002:a05:622a:1a98:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517fdea8e41mr196168971cf.2.1781617429127;
        Tue, 16 Jun 2026 06:43:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1a98:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-517fdea8e41mr196168641cf.2.1781617428618;
        Tue, 16 Jun 2026 06:43:48 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693c6d7cf3csm4133056a12.14.2026.06.16.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:43:47 -0700 (PDT)
Message-ID: <b0d30704-7761-40a2-9090-983f32102c8a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:43:44 +0200
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
        Rudraksha Gupta <guptarud@gmail.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
 <20260601-msm8960-wifi-v3-5-fec6ac8dba02@smankusors.com>
 <1d15a420-7360-429e-a451-ec1f012a0346@oss.qualcomm.com>
 <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <efb42f6c-b26a-4ee0-a5e7-0a25a0a41f50@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gut44LGK5LsY_m73ILo4Km3sNwQN1xzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfXy+98xIn3uvJA
 z5WVyZG254CRK3P/LFIJGIwexCdVX6CJO4ggWKYvfoQKg2sIIjh+QoS3n47wSq5d2VmnX5jxcCd
 CVEDyRUT9G/mF2vYl3ai0ifli9w/QBWQhIm45qyQzw9MprXPZPym9dTEwM/s77rYoQW4Kp+Sepe
 rJDnSiEdfa5fZ1Ymsv6gB48LcTqNlVTaCtbmMu3O/jJfoaH7FLbTP+cnB4AHNkEVaiuWiNHO6J+
 DId18+wIxzeBxVkDlxE13Zz4OawSJkxHajyE042tSvBl455m8fzwXMDvKMMlz8KmqUm0xd8jTm0
 lOR3l1JEhhW4eRNk8XWuaQiFy42vJbrWDhk0YLBGdIzJmOyec75HuOn6dV60NIIw+PeEABfPKPX
 DmNYI9b4lkCBar6Hxqq//gwXg2gSrRiKQ9rZtkQF3xaH9ePbHy6ftRuxdlJDhIDarITjqukyD2Y
 6U0jwDkH7IozSa8KBlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE0MCBTYWx0ZWRfX5ZReKBkdjq9Y
 zuid5r+BMsGDdHahesIiMqjIHxaBjVWQjMPF+lK600Q+aj759XD502v+noDkhcl0yKetzB3G88i
 6ismkTW1jJzy+Zcb4KJicIMqCZ2lEds=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a315316 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=wxLWbCv9AAAA:8 a=kVRP5i783O7quJDYENkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: gut44LGK5LsY_m73ILo4Km3sNwQN1xzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160140

On 6/16/26 3:04 PM, Antony Kurniawan Soemardi wrote:
> On 6/9/2026 7:21 PM, Konrad Dybcio wrote:
>> On 6/1/26 10:51 AM, Antony Kurniawan Soemardi via B4 Relay wrote:
>>> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>>> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>>>               reg = <0x12500000 0x200>,
>>>                     <0x12500200 0x200>;
>>>               interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
>>> -            clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
>>> -            clock-names = "core", "iface";
>>> +            clocks = <&gcc USB_HS1_H_CLK>,
>>> +                 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
>>> +                 <&gcc USB_HS1_XCVR_CLK>;
>>> +            clock-names = "iface",
>>> +                      "core",
>>> +                      "fs";
>>
>> The bindings change you sent changes the expectations - "core" used
>> to be the first clock. And I would guesstimate that the
>> DAYTONA_FABRIC clock is not really "core" - does downstream do any
>> ratesetting on the other two?
> 
> Looking at the downstream, I can only find HS1_XCVR being set to 60MHz, DAYTONA_FABRIC being set to the max rate (just for voting purposes?). I don't see any clk_set_rate for HS1_P though.
> 
> Would you rather the other way around? Like "core", "iface", and "fs"? My concern is that such a change would result in a large number of warnings for newer SoC device trees.

I didn't notice you're actually aligning the order with bindings. I was
under the impression this was a random change.

For the clock assignments themselves, I think the schema reflects a
full-speed (i.e. usb 1.x) core.. I dug out some ancient doc that says
that we should have:

- ahb (bus clock - perhaps daytona in this case?)
- system (core clock for the thing, >55 Mhz for compliant HS operation
  or at least 35 MHz for any sort of operation)
- ulpi_clk (60 MHz, coming from the USB PHY) (we can probably ignore this
  in our description)
- inactivity_timer since there's a BAM instance attached to this host 
  (possibly handled implicitly)

for the record, there's 4 hosts:

USB1_HS @ 0x12500000 (this one)
USB2_HSIC @ 0x12520000
USB1_FS @ 0x18000000
USB2_FS @ 0x18100000

I don't know if they are all exposed and functional though

Konrad
