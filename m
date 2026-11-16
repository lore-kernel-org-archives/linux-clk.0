Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815121;
	b=341P13sZeUuCZoy2yIBhlBVOcJBwd5oQTe1I+eYH4tcmnhqYA7t6CXhGeyT6LJKr+t01
	 iZT9vp3sw1Yf/5t+d9GsCCWWu3ym+6zd/pOpS5vIgx4d4UMSRIGoQVEmBXHr1ATD+Bc6V
	 RZCMnqfBByoPHcaRouX0azlh7bcGXRTyoHa5oWdm0XrAj6LVJrsS9Xf0s7E0OEp7KwUVw
	 aVe1v2UyT18MB9oBHtH/gGQVwsuZb3BwyJWobdNMJK7MZsOzDYRl/s6yO/otMJ80bybjB
	 AGbI2c+Qe0N3CDxmERSn4Wr2AT8CQTCQhidk1XGuoDrmix1nmHPHBycVqlkOOfk2NiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
	b=odldfpgVN7HBs3WjwM9Li5lWNYb/bPQBfgL6wtqvBplHQTH36WZNL9OAdHgutwl7zk+V
	 p6exdzGsX/YcoUMFqqWjs9mJjaRs2o7+sDTMCjT0UHkqHJoxR9x84ZHoO5soF8wShfIBh
	 EhAOwMObNadqm8sALYxnLUedRIZt0ZTFWZE2atm7VM2OzK8cUX4VeRSmG+hdZUMvN5q9p
	 UuOLDcMNNtuO9qAHo31TBxK3o+UmnPW8KQFxeSMgZGhnPHEASx5RYKGNp98zhNXyr+aBa
	 JQ1ZPZP8P5lcCS0IQ89LbIt50zT7/QGRy8hCNJRIrI550h+3PIkO8MDlat5mk8yhoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWs6vy6T;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73583606A889
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73583606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JWs6vy6T
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2194491f8f.0
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 23:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794815120; x=1795419920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=JWs6vy6TMMIsDRVSnv3QauUtvNIGyUnrJHjyD00p4NY8uCkqSIoqzJZIUkMBFUogNo
         u+Zs1/CnTQRGeFMiW7bmLvY3N6yo13drRKvXNnl6WcfWk7yoeko+TefFLGrNvxO+BaZ+
         XIihgGquU/ejG+wq5fKaH2uokS9qRmEWoM/YMcFoRKlay2hZiSl314PzNVa1xZFl5CFn
         KS+HO26bDwjcatUMnaF/8r0cevjW2bSrdwnT+0ki9PdoKsbbm2t/e4WAQKO7PxLZsuml
         qdx3TmnmaMjvWzRtuGdhQDKznd7JSXldhwavrB3Th2J21PyMbmikrn5fM7fHbiXGXZEV
         Pj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815120; x=1795419920;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hmm2pR6aFCenUcCKosKBbhm7/p1v3WTAnxJNhw15gtQ=;
        b=Ss/3AisgnhksnkVx1vFDc41lI7NQyoRbwSbYsJ+toLLp+70DhTIH6v+/Ocie7b+HJh
         h83Ni1w6Ku0KsXB6gMp5BS7ZwgaPa4T6TBDEDSbgmRkAHHrEw4vsSFYRI9v/hv76sH/0
         fopgctLpZeVUlExdSmdpNWeVVH4LPnj4mW5p1fOEIiJNa0kkgY8/LTfYcjfXyKd9aeUC
         4dchz17nadJHYlBqGsTBZPk2LLCTOFIt+qnyQx5uZZecBONjycP8ZB4Rs7cnTRpo9iep
         n5NkCdbda/Gge1vjHY3z7sXEBtaPJdRL2mi0hg++XpURRW+jgkH3YhKy+eJEPjpM5Bbm
         forg==
X-Forwarded-Encrypted: i=1; AL+hErGS0dZ22uuCVR37ButGc9jio70KuBN1G4lY+uGmtc1mPxCGqLKPFVuuc1mt3snvaRTfqwzuM1kVNz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bxx1ZSNiY7NMUCgr704rIcw/Hob2H6MnZVvgzq7FKauA7VH/t
	kVmSnXGHTVQl7Et10Iq8iSsh6iCbKALJjshrk9JP7tIz/V5Qn7rasmFG7SpE6CkVvf8=
X-Gm-Gg: AYBFou2JfL2VkqkRghFkA3Sy2k16vXrl7hPWUqp1OYf5a+lapI4jmjEY4iat6bJsf2I
	jGx3qc6+85iV2I8Iz/l70G++lWQ+ZpyJK2j75hz+EgPtbwN3K5f69Tt4jCD9JqWMtSZtheCKqxA
	lqO+aaLgYYCfSBvhjmckNVlceJK4bl3ORvE930XHWlXbO6iXhMq5le7QohqOzi1IHL6DtAgeXoY
	iYphHNIeEq3XB4GYe1w19pB/6cJIbiDHWvOxqJcr8ZmXKDO2Wi2Sr8eHN043KKhFRgvK7uXhkob
	zlDC0R8ZEi2Mz5Bt3qMdjh3MDgvseXkZy8gV8PT69vCwwC/gjvOEdMYlhaefIOfB98JDCnodxmC
	UkmAVtAgYlvDPIdy3GqcK6F+Sciy199ypwkG4ABKTujP0yYPpqDNzCUzTa0/m5Ypx/cQTJKMfDp
	7PPk3VImiROpFygXa+i8UXYhugyfdnhyJVMqeTPxPghNtFPnPkmrcvZeb4vIC6jUv+cSvUT1KOS
	q2qtWu4fckjRW8K/3QODwKpD+MEarzcx98BraNsiOPqr93S43NbW1pALbi6ciuUNLqJBoY3ut0L
	cfohWfK6kGi9OtbbD+4/Ez+KtMEuTpsr2bDT5pSoewMQK6+TSwZ5BWhcBk54TuZOnEOF1x0vg5s
	nOynbS9SC
X-Received: by 2002:a05:6000:2407:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-49c73351512mr19406434f8f.56.1794815119670;
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm21048578f8f.56.2026.11.15.23.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 23:45:19 -0800 (PST)
Message-ID: <d27f1aa7-9765-4a22-ac78-e6dfc0c97556@linaro.org>
Date: Mon, 16 Nov 2026 08:45:18 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 03/23] dt-bindings: pinctrl:
 qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP
 is not used
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-3-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213493@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-213493@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: redundant
>    oneOf in clocks
> --
> 
> commit d8422bb265d6e088cce5d6024805eb9ced00d38a
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
> 
> This commit updates the SM8650 LPASS LPI pinctrl DT binding schema to
> allow a single core clock and add power-domains properties for platforms
> where the ADSP is bypassed.
> 
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> index 1bf08860a4baf..4c54f873199cc 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
>> @@ -29,11 +29,25 @@ properties:
>>         - description: LPASS LPI TLMM Control and Status registers
>>   
>>     clocks:
>> -    items:
>> -      - description: LPASS Core voting clock
>> -      - description: LPASS Audio voting clock
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - description: LPASS Core voting clock
>> +          - description: LPASS Audio voting clock
>> +      - items:   # for ADSP bypass based platforms
>> +          - description: LPASS Core voting clock
>>   
>>     clock-names:
>> +    oneOf:
>> +      - items:   # for ADSP based platforms
>> +          - const: core
>> +          - const: audio
>> +      - items:   # for ADSP bypass based platforms
>> +          - const: core
> 
> [Severity: Low]
> Could clocks and clock-names set minItems: 1 alongside the two-entry
> items list instead of using oneOf?  Because the single-entry ADSP bypass
> list is a strict prefix of the two-entry list, minItems: 1 avoids
> duplicating the first item in both properties.
> 

Will switch to that
