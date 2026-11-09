Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246125;
	b=O7KzeEsyGfWc5FxCDV4/xKl33I8b4svYL5uIqiEpn+K04siY0pSADUWhthdEXmCEvhZC
	 LThP/B0VN31jskdLm8Ee6SjnA6EJZUuc1BzOXaMiSwpkaRCWN03LHSIq0E/FNznUBSdod
	 FOQw/5lW9Q1F+WepoKp4ASgzXs3Lns75xsl8fGFFxzf1DzOsVCmRPtxsnwBEvYim//TS2
	 otZdDgvbsHDSUaIJUokme695AVHzqe6B7kMTyCxKy+l8uPXRTNXpvcFfQeKzYNSzGoZrr
	 3dQlTATBQKIhtc8iFMpB4qKuvJPSsII5fRY7Blg3M1uvZjUYCOXrMrkOt5vLBPwjSng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=QS0dWLS+azYRQTl9Sa/YjO/KWEZCijM0rOuiAHbxcbI=;
	b=E7zmke8f1nw8L/TZKMnRhZDueHgHNuX1hvZMYIAoJ9W3FDEqf13TENlLEx/X8TjDOHVw
	 iC7Ex7ZWNfRc8kt6WV04YcKj4XFWZB+NNPctwhrZ+VdVV9ceONaL4z0iiRBnUePbVb1ac
	 bxuEatP1CxJ3PUWIEtO40qbXkOCsuyg5+AuATTP6PHUp1Pzjs92P1U8IE6xp7stz0XIrb
	 mxeIyXTwHZsDDpK8fuLgoEbOZwXSmotW9AedBcwiW0880MOX3yKif/wGXJDCv/DVXvjgI
	 rK/zyTptNlRRqF3Raq3eTRG2KQoMX6cAFmkmQyAryu7ROy8WP9T8QmKxsQsLx+y/GDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OZkRbYh4;
	arc=none smtp.remote-ip=74.125.231.200
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com [74.125.231.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328F606A339
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 17:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8328F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=OZkRbYh4
Received: by mail-oi2-f8.google.com with SMTP id 5614622812f47-53c4858eb76so517371b6e.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 09:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794246123; x=1794850923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QS0dWLS+azYRQTl9Sa/YjO/KWEZCijM0rOuiAHbxcbI=;
        b=OZkRbYh4CWcXVHA2akEUUDtFSNGE/aZiYNbv2Bul2R9gNuDFItTnYAKlIGsPlAzM6s
         QNdmuizRCtkhUl7IUSW00qvJBA5vET5cTGJqf7Pm+UZ3JZ7KKx5PGCuqHv1PJ/Tx2jWg
         HqC3Nfdx515yQ9oBTaqo//MnyysIHSZ6cY5v9AexUFG1F33LLFs1ARZhgE9isp8JejQU
         9nyf1gCWpPQXJ7beV5m4llurZJYGDpN9ErqTxe4DI8jC8cP+/3d6+vzm8QwzF9xnahXi
         i4b/J0BFghA3Nz/iHUZfvZLQqSho/5EAM94a8ThG0LdjQSizwr42rni5AwXqyrjrLd6j
         ADhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246123; x=1794850923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS0dWLS+azYRQTl9Sa/YjO/KWEZCijM0rOuiAHbxcbI=;
        b=QOnShixHeRdem8NQJ2Iv/gEeycsGIOqz9qXway7yu8Lqyp42++zASG1yE/iDGB6yTy
         dcX7anYmxBB/7lztU4FDolJxuAA4X5Ouk953s010yjOgj3g2NA3qPj3PP/Qaj/sK/yYy
         Gxi/nRP3XdhpiHLmzYxaNSfOssJLEfFRva99dVSUzoOJ9g5JlckkiYx6AhJSPneeuovr
         mb3yRAaf02AteNxdhOteFMODRh2efCxB1Vxc8MlHIXde0GjZ97fkpFya7nZH5pFHDvFt
         Lws5TeGisWRht+Daut9HfmGVt/Ih/rdEhexihjC0YowmJMgfWCatvQIVr8LD5XofC57U
         hu1g==
X-Forwarded-Encrypted: i=1; AL+hErFfHKJjh90VsC385yoC/CHIsihVVR5AkNJv/1iQhPGk2E1jSDmf1zxY9r6C8NJsa3RrJOmm7ORiq0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qcB8pMQLk510Wx9iAk631tRXhmkDQG98G2DgQnMCkM65uUONs
	Thf7iVPzQ7712NTzoK5cRpm9z+o+9q9dcxkltZkXZBsY7fRJUyTS6lBf2f4LyCU/X1g=
X-Gm-Gg: AYBFou3F0cQ5mHSXKwRZf52/X2aJz3YWMaGgdImhkGyYwXimruNXvRNno7oW2O55P5z
	TCnGQDqra+wbE5ZPnpUaZIrgGGtrK4F7wFXN2IJKOCrB9aDSBVCPew72fzn60Ljca5AVIt/Bn7r
	D/1YDwHwwVjNxhfheVZBNjCuQwD+L8CvU+oa+ld/9wDQewj2r/cOU1bCN7qfwu16HVJ+L/yHFuo
	KZ9YSjwRX6UwzJQNJ8BFi+5Xo1Vb6/pUr7nRFqBP16ReS3VRvhYLdXWjKRz5bhLjKt3t8VyjgUG
	ZhcdSroNWXKACY6NOa5t2NkNowjjFMYLrUULsg3IxJDS+q6SZjmfszOOBicwpqa+Y2gcU9j7mLO
	5ulyXeMmU4sGBbzDdYfUkm0OHJF/jHsX9UiSP3FmoFg+tLRScmq7LV2ZRYCZVfkenL68Idi0slq
	2BcKqIidSE6SZbMNEoAYEkPK7BJS/IRZQo/ixlwpqZ8RhjEkmeiuFFiEVL4Zs686rcXZYmI2UK1
	xMSUxXfg6+58W228YIcm9ULTOBwLpin5eD8XeV8oT7osiJj28x4vBGkCodWlvDY0o3KEL0gWGcL
	cdYJ66U1OspTelpIJBPoxZzzGWtx
X-Received: by 2002:a05:6808:2388:b0:4f5:e4ea:9ef2 with SMTP id 5614622812f47-5683c9e459emr272790b6e.3.1794246123438;
        Mon, 09 Nov 2026 09:42:03 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813c71bd0sm4925229b6e.4.2026.11.09.09.42.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:42:03 -0800 (PST)
Message-ID: <675dec20-1cd7-4d37-89b4-23237b760f33@riscstar.com>
Date: Mon, 9 Nov 2026 11:42:02 -0600
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] soc: toshiba: tc9564: config system controller
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <a724d159-1509-4649-afa7-a2669d37b4f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 2:26 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 01:43, Alex Elder wrote:
>> This series is comprised of some code that was previously sent
>> separately.  It now incorporates a new system controller driver
>> that advertises clock and reset functionality, as well as regmap
>> access to its address range.  This combination is being treated
>> as a new series.  (Details of previous versions are below.)
>>
>> The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
>> It includes a PCIe switch with three downstream ports.  To one of
>> these ports an embedded PCIe endpoint is attached, and that implements
>> two PCI functions.  BAR 4 for both PCI functions provides access to
>> registers controlling blocks within the SoC.
>>
>> The system controller driver adds the clock and reset devices
>> using the mfd_add_devices() interface.  The clocks and resets
>> are implemented by drivers included in this series.
> 
> Toshiba TC9564 bindings and DTS should be posted completely. We spent
> great amount of time on discussing already and I pointed more than once
> that big picture is missing.

https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

Node pcie@3,0 is the third switch port (within the TC9564), which
has an embedded PCIe endpoint with two functions.  (You can ignore
pci-ep-bus@0 for now.)

> You are not describing here parts of a SoC.
> 
> You are describing one, single device how the host sees it and DT
> maintainers (and writing bindings) ask for complete picture in such cases.

I'm glad to provide whatever information you need.  There is more
than one way to provide the "complete picture" however, and I don't
want to send something that isn't helpful.

If you want something different from just the DTS file linked above,
please say so and I'll put something together.

For example:
- Would you prefer something that includes only the PCI hierarchy
   starting at the TC9564 embedded PCI endpoint and its two functions?
- Is a DTS file sufficient, or do you want the TC9564 bindings instead?
- Do you want any other high-level description of the chip?
- Do you want more information about the system that contains the
   chip?

Thank you.

					-Alex


> Best regards,
> Krzysztof

