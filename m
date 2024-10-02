Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56A1E767F
	for <linux-clk@vger.kernel.org>; Wed,  2 Oct 2024 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868050; cv=none; b=e0ViSrvc8t0RzkK09PnigHUWkc1sqkorcy635chjld7dNdRhxCh/OOP2hIz1yzSYgBALz4ZT6KefiEW8cwJYDdv23KSNbPs0W5fSeXxV0B6pqPIrRnVTJu+V5R6WGLJtsFpcKIrF7Xk9xnk06SEunZ/4sLAJn1S5riUeXp6O22I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868050; c=relaxed/simple;
	bh=HCCCEeMhNMH2j+6URk/vieugvjNSproh591L737VQN0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iaCkCPu0tyj6YH8wn9FaSS7+4FCWMp0bvTCdaPrsLYzWLy56jfFMyBCk1w4DzUTg24IrvCOjqLvsqzoocHKwFX1CWF0rn2WSBMo9Qf/5rt2P9jBfLbVDJiHC7duD19kr0Sh6g51GyLB+olNhpN+X6s/7Ddg+AWsnFrCU7vDHpjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eZLa70vv; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZLa70vv"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37ccfba5df5so4215273f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 02 Oct 2024 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727868046; x=1728472846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuMn+uvzgNhXlVl6NvssHiZDUL25KUVzV3NB9k+ro68=;
        b=eZLa70vvySLlAMYF8XrFcYOlI8YAD4HEWcaHCNXI/OsMZQuLileodYGx+zAtYxj85I
         m7t13mxBxWwQh6ASRaVKRHtmhZMQx3JNwcv/Q3hx5WZtJo4aS5v04dlRZ1cyzU54872i
         kcBcM15EP0pjx6zLft/9vw1aV/ue2bGSXn1xXUmDuDsDgMHELckR0I+AGZC4qk8uPhJ/
         sEbC/A0ihI0x+vimDcsEH5O0f6gLVyVYVtIPvj/lvQmTCAPXV6F8H2EpZXOcz7MXzKBB
         FkE5jMSTmSAsn56YXyBrhVDCu8gm1exmeyqt8xskawHWwTAAF/EEB8GcUD0JJumYAO5o
         PY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868046; x=1728472846;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xuMn+uvzgNhXlVl6NvssHiZDUL25KUVzV3NB9k+ro68=;
        b=D7uiHGQGZEC0DKsEPreyrBc/S+mx0LvVeJVyDfWt51wiab7wkeGYheJRAOO6WHw2Aq
         7dHdRFq2IMDqkWIFWOALaEnd9TPbOg7JS0nxhLOPQTZyiE1s6zsQ1uB+D8FSJlgqAdBO
         oTdaFt8bA+ar+Bma2UoUgTZLwIdOUU+YDhVfZiWENA3llzFn1y+F1CyZLs7pHdeyN/oa
         O3V+0A1uQMtHlyIpriTvspbM3IqECQpQgzGeD7PZ9zj+noD02mQlwQTjmMo8XLZaLJ85
         THey3kzYrw+IEY44G85bBCmLYSGkDGhYYxYy6nf7eP1yjgV6X04WuIJ2KLn5hjt0Fwko
         pqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpLp9MhoiVVg8kugTDH63Uja+kHitz4Sa8Dp5mGziWY0/I/4CHofaL33F6pU+cirP+SQcHM3ndKH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRG0xbbhYkdsf+PD11U/3cg80BhuZxP0lpsqVI45K+wJqhGucY
	2YqGr6s6Fe7Ev/rkGsis2lV3JI10JrTih191Lpl8T8AYToOtEDjAEv9K+SVHBC4=
X-Google-Smtp-Source: AGHT+IG8p3dWVjk/6hZCzmXj39xeg0ImZtG3Merz+EByl/MIpSdWVEPWB/AKs0ghnMfzwQPyYhCtlQ==
X-Received: by 2002:a5d:4843:0:b0:374:c142:80e7 with SMTP id ffacd0b85a97d-37cfb8b14eamr2128521f8f.1.1727868045945;
        Wed, 02 Oct 2024 04:20:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce64:813c:ca8:36b5? ([2a01:e0a:982:cbb0:ce64:813c:ca8:36b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6488sm13786576f8f.46.2024.10.02.04.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 04:20:45 -0700 (PDT)
Message-ID: <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
Date: Wed, 2 Oct 2024 13:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-hula-unwashed-1c4ddbadbec2@spud>
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
In-Reply-To: <20241002-hula-unwashed-1c4ddbadbec2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2024 12:48, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I like this one better than qualcomms and wish to use it for the
> PolarFire SoC clock drivers.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/clk/Kconfig                           |  4 ++
>   drivers/clk/Makefile                          |  1 +
>   drivers/clk/{meson => }/clk-regmap.c          |  2 +-
>   drivers/clk/meson/Kconfig                     | 46 +++++++++----------
>   drivers/clk/meson/Makefile                    |  1 -
>   drivers/clk/meson/a1-peripherals.c            |  2 +-
>   drivers/clk/meson/a1-pll.c                    |  2 +-
>   drivers/clk/meson/axg-aoclk.c                 |  2 +-
>   drivers/clk/meson/axg-audio.c                 |  2 +-
>   drivers/clk/meson/axg.c                       |  2 +-
>   drivers/clk/meson/c3-peripherals.c            |  2 +-
>   drivers/clk/meson/c3-pll.c                    |  2 +-
>   drivers/clk/meson/clk-cpu-dyndiv.c            |  2 +-
>   drivers/clk/meson/clk-dualdiv.c               |  2 +-
>   drivers/clk/meson/clk-mpll.c                  |  2 +-
>   drivers/clk/meson/clk-phase.c                 |  2 +-
>   drivers/clk/meson/clk-pll.c                   |  2 +-
>   drivers/clk/meson/g12a-aoclk.c                |  2 +-
>   drivers/clk/meson/g12a.c                      |  2 +-
>   drivers/clk/meson/gxbb-aoclk.c                |  2 +-
>   drivers/clk/meson/gxbb.c                      |  2 +-
>   drivers/clk/meson/meson-aoclk.h               |  2 +-
>   drivers/clk/meson/meson-eeclk.c               |  2 +-
>   drivers/clk/meson/meson-eeclk.h               |  2 +-
>   drivers/clk/meson/meson8-ddr.c                |  2 +-
>   drivers/clk/meson/meson8b.c                   |  2 +-
>   drivers/clk/meson/s4-peripherals.c            |  2 +-
>   drivers/clk/meson/s4-pll.c                    |  2 +-
>   drivers/clk/meson/sclk-div.c                  |  2 +-
>   drivers/clk/meson/vclk.h                      |  2 +-
>   drivers/clk/meson/vid-pll-div.c               |  2 +-
>   .../meson => include/linux/clk}/clk-regmap.h  |  0
>   32 files changed, 53 insertions(+), 53 deletions(-)
>   rename drivers/clk/{meson => }/clk-regmap.c (99%)
>   rename {drivers/clk/meson => include/linux/clk}/clk-regmap.h (100%)
> 
<snip>

I don't have objections, but I think Stephen didn't like the idea
a few years ago, but perhaps it has changed...

Anyway, take my:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
