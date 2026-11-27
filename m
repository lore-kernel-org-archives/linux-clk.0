Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779622;
	b=i/ZGF8HsmaxNZrtSIZMfiBiyCUQPQhnaSO3p8qUamWOx5LDk7EpGsj+BEGP0oTHwDTho
	 wehS0YbJsI5h5jPLMwbzIQww4ZDYoZt7weKyP6y+d3GB+zXRFYJSDG8zw7PVyPEA0PMVp
	 AGNCng0rGO0jpeTnJtWwhg2PlapWmyjrja6QupJGcWlWZQZcSLsmY04TRsj7El8jPRtgy
	 pFb4QPUi4E7AT2q88cBWh8fj+0MnoSyLPwoxt3KwnXH/juZc6p9J6hXVaRUaTktb4S8nx
	 rHMBS2LxrDRb5d1NeLBgERi+EekRyGDL4Q+rdoRCzzTMChUh99w5Mk7Pkmns3Wv2n0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Zty8k92Xw8D3zu7C7Tcy3SekI9L2+sn5YpLaa5BKAmA=;
	b=h3Q01rkpe/ZSNPzSiJ2rw6DrvFHkPW5EQ1fq78PMfsa+r7sjQos38w6DwBK8wpiO9xQG
	 Y9oOX+S7xdjI47QbJy8XdmMp/ekpEnCHzmMnTEe7P+wSg1/IDQMc5E21Noz7lR+9U1Z5f
	 9+y2yr2gusgBE9pN6LFAGoJR2UprgzjppfQBFc6XdM71mN3LR4/UNxFXxRefT2nhmurF/
	 Wt7hNCmCoENfagHepBtVowo9SMncU3mr7zebBbac0WJTRyvB1j+qYqepi1nx2raU72tO5
	 V9XCdOtOuLLBAA4NtGHcSPPzPlKsR5f2Cm4hbwbf+mJ9lAyBrryvHB62GB4GzcZmNSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V4HFTwzC;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE83D606A31C
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 11:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE83D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V4HFTwzC
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d05d51553so56346915e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 03:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795779620; x=1796384420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zty8k92Xw8D3zu7C7Tcy3SekI9L2+sn5YpLaa5BKAmA=;
        b=V4HFTwzCm3kQS+qyVyn3ZcPjuiuJzOciFrSzzZWbmUiX0V/qW3gB3+kjHgiJ/4S0TY
         E30XodvHDrlX4Fj0LqjacnXxaERpiOfbDD6F19/A8Q4k3EMxugB5RaiEeymT+wqWUy0r
         OT3N7E8WXRqDihwAPl8fFyDpZ/zj9YQK0w1Z++WA5kXxhWP53VZ1+VGZFeMZl9tS4Tbt
         ds/F/xVSFNRcecbpnp0zMubqHaugYVwsKmjbI4jKfrxvJyvfT6+0lCaq2lcWv3QMoMew
         xgV73mGnuBRH7Won4jBcO/WyUwYFnKxZvB9xchwYbwgd8YRqEk8nyg3F4t4hHAOoNP4b
         k5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779620; x=1796384420;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zty8k92Xw8D3zu7C7Tcy3SekI9L2+sn5YpLaa5BKAmA=;
        b=GWqVn7a7nwpVYwNYLWaTj4xlkqLYuvBFGHLpVn/i4ffVCsFUf7S8pVxb6YG9FbTmKq
         xL08c2wQa0SAvuzCyLwmcbYB/lKiXVVJu/J6C72xjH8rDU9m2y0fhRxytKU0CI9Hpr04
         BoZSUPtpGbvQS4kA2ce/q+g0V9WeKSEn9Vu+PRKRbN/GCt3wEDWb69SWD2M0w2gtFy7r
         0yHJnlhoW3P9M+jFcegtrmx+sgG5uZ+T9nR/u3WFjkSI5mK6qDcTFnHpDwnPEBWzbwCR
         tMBGuvWMuYzWzDPsa6Yn55qgPnltahDg8qlPILDB6VccLxBaL24TMgyl3YyK0wegQyNN
         SSIA==
X-Forwarded-Encrypted: i=1; AL+hErGnycYC3cglRECwGAxAQFdudqLFO0GCz2lIn1Sd4sajaS84dpUcREeCM/YLnCWfYFTfJJTLRqxz9ZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81MVUgT3ma2imAr9GW2lwlleI1qBb18G/bdQYt/NMoNc81urVb
	xutsJvK/3JjtbvvaO77+/TKkmQYvRGymHGqFautjS0vEkkydrPuYBdMl9SDR50im8yY=
X-Gm-Gg: AZFdTZf2WDjLL0zqRTSnzCij/olcbwfLxhDDRb+UUWLBYPPRkXkqUgzVhBOkkK1SXh/
	6PmX/ZQeInEyO5KHM5bgI8LtUs8pYw4DJj6G6CfLSj+ugh9s4sBQ7rmPdwExUYqFJi/HojK/9Ff
	qq0ZzgJmRoARuGDsMlm12HIor997Dpy+rHcRhtwLIsozhzOtmSld0thNN7AR8fNy3NOzees+sND
	YYlmg3mCori+qMulbEvw/Y34uEjlul2WY0ZUZUDLTzJUp/sbfg8pUzAbwH4m6j9KvtsxVXOrNK5
	5JO8KH31Bg9R/wYZOOrW4s7TKyZ2McLBtc9XzZ3by+sG3SVxivOqmUcbMDKRXdeet2jsKhTi9So
	o1XYmzOhV5X3ZHiJ/7onqwUFA7DI3VDgWnYHBiloCY/B5SWLXJytxsgW37uuMvQPqPZRMpdjGIy
	nnXW+3jyZFUVz2ML3KJQfWfz6jTkkK+o8tzJu64uj/KHaEwkMLFXuMw0JclnBw/DAAfTkJ4rhOY
	TQfxz3s2P9mnahW2C3z1RxLwU1IGCoGMxJn/SQ3XZQw0BAwW8U8785rZz00bqdWH0zCW0aD7Zpd
	3/HN1++PXx6uLtUUdd3Ph+wAsSKoJsuXgQCIFZds
X-Received: by 2002:a05:600c:3b9e:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb88820687mr559198225e9.29.1795779620276;
        Fri, 27 Nov 2026 03:40:20 -0800 (PST)
Received: from [192.168.0.167] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm46119407f8f.40.2026.11.27.03.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 03:40:19 -0800 (PST)
Message-ID: <ccd91b1f-7476-430e-abdb-3e63be5e8c4e@linaro.org>
Date: Fri, 27 Nov 2026 11:40:18 +0000
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-qdu1000: Add sentinel to GPLL0 even
 post divider table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>,
 Melody Olvera <melody.olvera@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20261125213433.1438537-1-vladimir.zapolskiy@linaro.org>
 <20261125213433.1438537-3-vladimir.zapolskiy@linaro.org>
 <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <67b17c55-e87c-464d-8c1d-fb015041be2f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/11/2026 11:04, Konrad Dybcio wrote:
> On 11/25/26 10:34 PM, Vladimir Zapolskiy wrote:
>> The GPLL0 even output post divider table is not terminated by an empty
>> entry, the table is passed to divider_determine_rate(), and the generic
>> clock divider helpers iterate over a table until they find an entry with
>> a zero divider, thus they may read past the end of the array.
> 
> But there's a .num_post_div?
> 
> Konrad

I think divider_determine_rate() takes the bare table and requires the 
sentinel.

A more salient point is why there is a difference at all. TBH I thought 
the sentinel was stylistic not functional but, it seems that is not so, 
there are two differing interpretations of the same data.

Should be one of those consistently...

Actually include/linux/clk-provider.h:716

/**
  * struct clk_divider - adjustable divider clock
  *
  * @hw:         handle between common and hardware-specific interfaces
  * @reg:        register containing the divider
  * @shift:      shift to the divider bit field
  * @width:      width of the divider bit field
  * @table:      array of value/divider pairs, last entry should have 
div = 0
  * @lock:       register lock

=> every table should have a last dummy entry

---
bod
