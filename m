Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B0136989
	for <linux-clk@vger.kernel.org>; Wed,  3 Apr 2024 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712139783; cv=none; b=jN2BtiSL5D4bklM1Fi4SoUfbi/SYOjn+ViZlE6r5jg4nzBkkcTQN5vzKPJq45nf6UVqeWqwnK/BpKyV1cGHjLyNE97VZK/mIENp72qSY5sCZd0FKq9RfLz8ejuhIhdNJPo9gYjm9YI4BL6gR+3vj69JIluj49WHbIa5NxAoWuac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712139783; c=relaxed/simple;
	bh=Rj0Jsh8YxSWt3uMZSfSlxmzf0XSYrPzXk30gRPPxkz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TklIqTowbLQW/1mpuE5qturstOaWfmns+QYTiEG8vDTIMjIm/m2g1R96UxDGwvgNdzsJVzSQ1Hqa7QVk8cVp83hyTq3hAYefaxfoR+MxIzjxAEKb6c92acI2GbTESpZLull2117MAJBi6QzrhD7dHyMiywyKkJsXjqyDh6FD650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=exP4EdVA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exP4EdVA"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so6586341a12.0
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2024 03:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712139780; x=1712744580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HsoRFwc62TubYqg849tDBMhvYLUZpOn9BCroZEJYYio=;
        b=exP4EdVAjdfkiSkfkk8oGrSkM0SEOLzmDHxCDQnCjXMbVqkROETfWIrX8TV8mi8ECP
         fJETwsv2Oy3UM4y7ny4EPR4IS7V86RJAkSmDm24Qp47vx/xNbcd/AQAgOOFamlgcweVZ
         WOmgbhPjeUcjTLDy9TUOJXw4KO0KhxRgeE/VgpjppNDvYSwntjI2/VocFWN/Y+Je+5hG
         XdvcGSsvpYHo9JTjUr/4pA+jUfchjyxy2Ns69L4DUdLQUnrOsapQ9MT/ijAMWgCDFQ0t
         POC1xLKfv9rxqTqGrmVyaRpzdNVWV13QZ2/5ZGIoAIV6lxy03JxTv+QClyggv4zqVGfx
         8Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139780; x=1712744580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsoRFwc62TubYqg849tDBMhvYLUZpOn9BCroZEJYYio=;
        b=G5lQLYZfRlA2Uj3ElOhZ1x9tDa+0ju0w0GgRZ6h30OT44TwXF/xmFW+ZAiePE+79m7
         mGzOYKkybUJDRmfHSsaRWfSJM/OymzU42Xa0EYz6XUeSUPkbxXRShas4QI6205CI/nUO
         YLaGKE9YhCx5fynuh4dNXWEqaLaetglgDtXpNaL4LtgEaxZytIR562AXFUQL/3nvgzQF
         Wa7hsmiiaYTuEkv5G14LBB0RslJ29vMyUNTkybxNy+nxZ74AHrPzzqH928EvYUwvZmxP
         7bUo/XUIwR6BCxNVm/9wz3Wienlj5uHVK0klslgM2qxYfceYWL2SMWdiF5yr0OwgrupS
         w36w==
X-Forwarded-Encrypted: i=1; AJvYcCWiw41LE+shoye88dYICfWEPTKOPgN3LZiXXktH35ZKKc7L3IUU8a8avs+2ZAmDj5FDuqtui6LH+4p8xIsDCYT0pQzhNKU7c1x7
X-Gm-Message-State: AOJu0YxcoeLBIFKgzdEc7r70WqLGHWyUpnx2B2PlUg3t/Gh4vIbfDnTr
	Vc8Q+eAUN0Smzh++3By545uW7w04ago9FJKwZZB1atwF1XO2fX4s6TBgEEEt8e4=
X-Google-Smtp-Source: AGHT+IEMd2qY7HaeJ+Fxj3CC5iJW78JeSnJFgE3zvGwQSDJJVxBpSADaDpp09/VoAm7rqc/a73kH3g==
X-Received: by 2002:a05:6402:3506:b0:56b:cecb:a4c8 with SMTP id b6-20020a056402350600b0056bcecba4c8mr14911177edd.39.1712139780444;
        Wed, 03 Apr 2024 03:23:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id n17-20020a05640205d100b0056c55252b1csm7476094edx.41.2024.04.03.03.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 03:22:59 -0700 (PDT)
Message-ID: <f51da8d9-95e5-4935-9ad7-49a5ddde9dc3@linaro.org>
Date: Wed, 3 Apr 2024 12:22:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: rockchip: Add device tree support for
 HDMI RX Controller
To: Shreeya Patel <shreeya.patel@collabora.com>, heiko@sntech.de,
 mchehab@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 dmitry.osipenko@collabora.com, sebastian.reichel@collabora.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm@lists.infradead.org
References: <20240327225057.672304-1-shreeya.patel@collabora.com>
 <20240327225057.672304-5-shreeya.patel@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240327225057.672304-5-shreeya.patel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2024 23:50, Shreeya Patel wrote:
> Add device tree support for Synopsys DesignWare HDMI RX
> Controller.
> 
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Co-developed-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Dingxian Wen <shawn.wen@rock-chips.com>
> Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
> ---
> Changes in v3 :-
>   - Rename cma node and phandle names
>   - Elaborate the comment to explain 160MiB calculation
>   - Move &hdmi_receiver_cma to the rock5b dts file
> 
> Changes in v2 :-
>   - Fix some of the checkpatch errors and warnings
>   - Rename resets, vo1-grf and HPD
>   - Move hdmirx_cma node to the rk3588.dtsi file
> 
>  .../boot/dts/rockchip/rk3588-pinctrl.dtsi     | 41 ++++++++++++++
>  .../boot/dts/rockchip/rk3588-rock-5b.dts      | 19 +++++++
>  arch/arm64/boot/dts/rockchip/rk3588.dtsi      | 56 +++++++++++++++++++

Please do not engage multiple subsystems in one patchset, if not
necessary. Especially do not mix DTS into media or USB subsystems. And
do not put DTS in the middle!

This is not a correct way to upstream DTS. DTS is independent of
drivers, so your drivers cannot be based on this.

Please reach to your experienced colleagues to explain you how
submission of patches should look like.

Best regards,
Krzysztof

