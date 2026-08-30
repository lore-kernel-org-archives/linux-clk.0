Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0413E3B47C1
	for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 13:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095086; cv=none; b=SgwpPPi3AC9AYM4R2Yc4IBGyHuovtYzeYNf/0qmGkYnd41+/oECwXH7blYWy29kjA1vSxE8JlheCRh2Sd7TvI77Mj7kK5vxJRc3wXcwpftl2+KNZll3SMn79Kf9Q7lMS4h5kyZWWqwO+K6iDQbGYdD21ZWJ/AYBDniqhCq5JV/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095086; c=relaxed/simple;
	bh=Lh/QdKDKUhi+nstzx0NETNDyYUB5yLFuyQqV576Cz3g=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=csvimfMVnWmkLmdaC5znXhs/yo2M3eo0d9rkByGOLuCAjVAgE+RUpoiaJNpKOqcCTwbDDAwJ6mq96X9lkRVl+/29d0SsW+UjQP+0vHBeK6rQ0LCN5RRZqEoKRIHPh8SM64qoO02lZ2mpvsn2SbZuh0nx5XIOGx7a2W3udvU90v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4w1cqA8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4w1cqA8"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so19269745e9.1
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 06:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095083; x=1788699883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=d4w1cqA8Gr2WlVB/J3GPJJsnw8be1LaomneXeoWWY1mIon5XW+OKErMadRhdX62thc
         vs3VNPhbyUTMqFZSD0mA/VHmx7c+Jh0WPClnIRs9RDCakf249XJ13gd8VDofk+SCXULb
         AM3MbV1wold7gcst4oHsNbSiCB4ezdQr7EfTsDd3TtcMrZ5yC2Bos4UGqzKl/nbvOCGV
         zRGWpn9th4QIjrybtS9vV4JRURoKDDm7KWDaYKkxH20VyjFykzI/dgUZeWt9z4ZH8pLf
         GtKcSOPMbdX9MANr5BN1cq0U9zIsfcfY3sdg9jHtMk8SkRKnxwRPzc5L+97zth+yaOXI
         LiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095083; x=1788699883;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGEZNmWTNMZMXanzrEPwQbHM5u7d/Ry5Or1T+0Vsl9w=;
        b=UOUeMrwOgR9wC3ZClzKXAdxcipfYuTB5WfdcKgT94oAWot97TLyChExnE4da0CgVJi
         tgxpFyuURrcmYwpooANtLGEAu/VvY3J3iqKFAUeUvIGexBSk9YEkmCp1W6IUIoGPJrAS
         Tp3sT9ZGNYmCjgbyLphr0WCzssaXlexIaHABKTwDuD6yB5VgD5DeaDbO4fv5aY246QRw
         n8pJZHSG0FyGbaaAshh/d+n/Ob/eq/k9ihuNxs9Y7LBsuU86PINvy9YbLpzl06tNDSto
         PvARZzqjyjcVMMF7HAKha6A0HkkMIllDYGkvpBNwZCPIrjFcLw52DeCGxWRxEBeFH7QQ
         Szgw==
X-Forwarded-Encrypted: i=1; AHgh+RooyqgmZSG1rfWZczK/borMgID+UVnvSwlqjNPJrOFELfUsaU58plcw8BEexKiHZUEhZXdMnFQkyJI=@vger.kernel.org
X-Gm-Message-State: AFuF++ncMyu2q7jFMlxwi0sOWIO2bgkLlv9PWqi0Rdl8EeEFbdGnLsGb
	UkqAZRVo5DY7LMZA/qf30HL3H105X0Jp+fXw+VqoA1B2mxERvuG/6ZBIGGkpKFGH8vw=
X-Gm-Gg: AR+sD12RyIFv9w7qazkPiGu0n1VMocuV2lu+xRaUL4GZgmhNlXx+pCTAUlv4Afb+hsd
	WACjqgMFCBobU0Hr6UZI2V+exZyGTJot+XWP/BgJh0EAjtD3DPz+yYv11jYox1i+6Ey1hJ8/PCg
	J6/dk1Xs3fHIEwRXJwB/ng5TyiwL6FzPA9c5zSKdM+BkLnRT0DA+WfkPr1NWF+hNR31Y1czrw3f
	YxgzxpKZ7DQJIDIsKlnXMCX5bv2aZNiz/kVFcqOY8ZuwGYlkp0LujuEEhI+1aCVLH43gyYukG+X
	GWx7VuWfEx9xyY1h6WG4awT2TUFXeyElfrRwbuICbMAKdpFj6Rx4XC6pmu1/qeulc5FSuKaJVQV
	tBkuaAJX/Zt+RssuhuUjbwDZw4/4R1xdB1/priGOa9/pSAW8htQzPL7p3mQ1J6Z16p6hzfrx0aX
	Dm9k0skbYc/lgHvly2SfR0fYc/RM/r7e0SuH/XMXNZC+zvgKcsJaturB6hcR7dgEAj9EsE/WCF
X-Received: by 2002:a05:600c:8b63:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cd53c438bmr35600565e9.8.1788095083121;
        Sun, 30 Aug 2026 06:04:43 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95018ee8sm205342395e9.15.2026.08.30.06.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:04:42 -0700 (PDT)
Message-ID: <d4ba8298-fb80-4fed-b1ce-7fc5d0adf5a0@linaro.org>
Date: Sun, 30 Aug 2026 15:02:26 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the
 vsync PWM
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau
 <linux-kernel-dev@aliel.fr>, Brian Masney <bmasney@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260829094758.23248-1-tanure@linux.com>
 <20260829094758.23248-5-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 11:47, Lucas Tanure wrote:
> The vsync PWM output can appear on either of two pins, but the
> description named a single group that does not exist, so anything using
> it would refuse to start.
> 
> Name the real groups instead, one entry per pin. No board describes this
> output yet, so nothing changes today.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index 8c4bd683cce0..719e111bc3dd 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -546,9 +546,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_vs_pins: pwm-vs {
> +				pwm_vs_y_pins: pwm-vs-y {
>   					mux {
> -						groups = "pwm_vs";
> +						groups = "pwm_vs_y";
> +						function = "pwm_vs";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_vs_h_pins: pwm-vs-h {
> +					mux {
> +						groups = "pwm_vs_h";
>   						function = "pwm_vs";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
