Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B950403151
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693811; cv=none; b=S3T27oCgKPmLlc4WZmtPOdYxnRr31jKQrOaQkjpu/K6SZLBrxuc2Utmur4CxGd8MugpEdM4WdCvENEmIPYaIj8Dr9+gwm2La6BH5NV7UdtlqxzQQEniX++9lDPnxHOk7ouD3ri5Fn8XP9Tle6c3HB1YEMYsm751sa6pIvt2QvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693811; c=relaxed/simple;
	bh=WMqqcG7JGr/BQoXr4E81PEy0Q4abR4uomof6eiGH+88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJhl8pIFT6f0pCA4c3DXt5XolnMuSflpjzSoiXnHLBtau1bX8OwNKuKrsuM081LKEbz3S+mDx8N63fp5eULUK2su4jIGACVTEiXDjamXz8wVG/RZh5iN2alkm+1xZ03o5V6JwkAy0GxIqIsTXbED5BVWQlhLaVOCvvdmR1Y/+hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYHDky8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2rIeCP7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYHDky8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2rIeCP7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fpck2166723
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=; b=VYHDky8THo+Vt03h
	DRkYpeCti43xy/zyL2/XxSNbXAmcvYLUDDiuZ08BkGNvHIveFyN6NSgxncQOcVW9
	peg+MT6+8goc0JGSmGXpW1QK2zqS8iPrHeZVndzbVwt6wjK1zJMPlC0iS9l4IyH/
	LDgHUhcrGgPL8NUE3ty6R7WWHXVJJz6AQawpeJwxgJRKM+eG9jDY6EhMaPAm3nsG
	qI1OuHtvPB/Dvbzy6gHZLFVGYsor6FpfhN893pUgBMixJHCkdBP5I9YqQAZcbY1O
	tvzUakEJE+8koIdkUWyRvov5okCSiJx1p2DvBw+fWY3bUuGA2J/MOch+b5W4VdkT
	N3/IGQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2njxjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 07:50:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so816935a91.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 00:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693806; x=1787298606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=;
        b=a2rIeCP7Gfwy3dOGsQJ3eoW4rNlOCQYVnCAA2M55Kpqk3gBSL8y/TkAPGDJFxNtLWL
         draOouOOSWNwrt2+DbuP1erRNWLawmUONbKbq29gNeXC8GTV5p2q+lRz+S9KaBmakTcV
         VItyeyaEOh+Y2cXgGyQneq8JLmzqTFjjYNL0a79bGjH2QFG18uQmOgJLfHhgotqBuTXE
         gSD3dEMcyDBpZEhrtzXd0yR8/oxGNd/CqDFD0pN00a0A9K5VDdws/6wLP1h+x8LEa5eL
         GQ6s07Kwe5PYYf00Ah9VZXU3TVBI2XSP9iedbPaouAtqsQS5W2/qNBOm/1MEO3KVpA7b
         JIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693806; x=1787298606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=;
        b=LIHcMbu2wRrxNSFoB0dqYTzM3Ljg4ID3Y9ntBilY3bJNfOv0L79XomCwejOD63QfBn
         DNQSpxzEPb3d3a96QK0pNTL5KDuWwXJq+h8GzLJyLiibwY9GeAvExZaCX6E5CMuBMfbx
         fNvo1inP7qA7T20Kqk8rKLLqUkrlW6ASIBSfEQk6MWfkhSrwzH0meioOBKo123XezHJr
         3xagrq5VrXQcIsxOKs6W0NLSmSgQ/ywwGRYUiSNag6D1AE+i3rcjI6FbDPbOwU9bG+HI
         1uU/NmrkecCA7a5gsWUWW7lz25p+CO8Te5uzkREnsGPgGnTkjge8Hx1vrNa/FcWororB
         1Y2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrD0ZVurSYZ4/58SRJ38yqsWQXcquuqaHdRngywYKhOY0QGY0oBGrYwl37+qCuUgToIuNfemmzOV1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEqKmT8cV2bBcj3psMLWodz43i1OfHfMR1wJX2dNIRIkVT3hhs
	uioYuOx4WuuOkqPFkfJKOw1dyRlnszH+fCyhH/wRKyAt+VxYDGQwCP1JhHVXMTZdp9Hfm9Df0JP
	YuznVggD6lSmwb7gvcojOxiymGUFIr5VxM8uN1jKQuTs9Bu5GWNH0I4uRQOlehgo=
X-Gm-Gg: AR+sD10jZlDf5sZU8WAIntFAgweV02lUBOaFZdWZ/OlnwX7ObkwGfM4E2uMzPdRwSyO
	k7GeGi11OyNxmnLNuVrSaj2nvYod3Xcf6RbqPNe52tEcF92btZGB/IV/vsVZ9MQ5RUUg8jS4s50
	qQqwyAmC1jLR4II5CHAU1U+2M1eLSOYmcLEORO1ZvQSDSGpF9tQbTsYohMJn4/nOjCvzbx+XFSA
	B/cmtg7Eg2nZKG1k3kAKvQHrTEzqg829cJikniQQB09NZu1SmuOBHnWw3itVZaa/+S6QgmYEecZ
	eTEr13JaE47/VtfTYKJF/hUFHhoeiTuQ5S4boOjaYO3HbcdCychlrPQWx6V93ufB5hgL4Y+y+O4
	qhda2IkHbKoUwOYN/89jlCiSSPkx6Z80hzEPA8ROP3I2+T5cW/Cs4VLtqlijmPBD4fsfefEkgpf
	LQZJA72QKDsx5UdUr9nFk=
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr4356228a91.19.1786693806097;
        Fri, 14 Aug 2026 00:50:06 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr4356160a91.19.1786693805582;
        Fri, 14 Aug 2026 00:50:05 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb752fe2sm1578288a91.14.2026.08.14.00.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:50:05 -0700 (PDT)
Message-ID: <23162a62-b499-4223-bab8-aaa5b575dab3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:19:57 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-10-5e0ede4a0c72@oss.qualcomm.com>
 <20260813-glorious-secret-mantis-dcc083@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260813-glorious-secret-mantis-dcc083@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ApXeGu9P c=1 sm=1 tr=0 ts=6a7ec8ae cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tqvfEU5OP8eIFZPyU8cA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: mpBLx5he2RyvJhBHTIDHsikSXh6tLQ_y
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXwbF+2gnnEomc
 t+BMD1xWKCuLLx9Mmc6TnCiAkj+/dpzWaoMCsskjVeNvFdHu+ePwwyikwjvDfN43njB1jf7ismI
 7Ogt8CDNCREFlnm19WMe2WpVvtCZtfg=
X-Proofpoint-GUID: mpBLx5he2RyvJhBHTIDHsikSXh6tLQ_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX2jeCqt4kGCp4
 QLD/bqQa92BNEg5GZWd+x9AyD125pv9NqVTfsjq+gsGEBpgRavZO11FiwPhweYlbSnbSB4JrdDy
 7irOzhk9qGM/jGasRqMm93N+bRM4Uch3esFQk+wifrDvMH5v3Y1FyxtdN9h3uvQTC6mMuKl+E8w
 6+CEgAuvd7kjOawKQ2hIb6ItkN/Rn6WkdWJGAzjL4biQBJNjZtfx8NMfm3orXNhVUWIcwXuLrRe
 e2LzzGo8X0JAkdvt7cm8h7GLBHiRFzecWUr6Qd5mG3gsFBjTyoznohJrhqBmavGPC1rueQZo2lb
 1H/r7+0nXeuAGuLaMti8GKpqbzFbNbIQWAkiDchGYmtAl7NxxomnsYAdukEatPWXqsvbD61RYRp
 pkVjvQpD91Z34TiN357Ls2aPViT5WU0BXgRwLCObdfUg3ceFHxKQSd90t6i/mvsmbkr9FsXgAXV
 kUHG/uAz7tgV/InPvLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/13/2026 3:10 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:57:09PM +0530, Hardeep Sharma wrote:
>> Add the device tree binding and clock/reset IDs for the global clock
>> controller (GCC) on the Qualcomm Kuno SoC so its device trees can
>> describe the GCC block and reference the clocks and resets it provides.
> Almost each of your bindings commit has different style. I would assume
> this you would write once and copy-paste.
>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 56 +++++++++++++
>>   include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
>>   2 files changed, 151 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>> new file mode 100644
>> index 000000000000..ff01ff31c2e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on Kuno
>> +
>> +maintainers:
>> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks and resets on Kuno.
>> +
>> +  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kuno-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board active-only XO source
>> +      - description: Sleep clock source
>> +      - description: PCIe pipe clock source
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX domain
>> +
>> +required:
>> +  - compatible
>> +  - clocks
> Not a power domain provider? Then it should not be allowed or explain
> oddities in the commit msg.
>
>
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
> Best regards,
> Krzysztof

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma

