Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794816303;
	b=taITopCz5DcfRsoLhiYqEARssQexKX/scTew3QutpqxhhKl3+1sJFpaeY1Z419l0nvsX
	 bkh9RvLjltj/IVsokP+ZUARBY6mXJb4kEPSU8EZBugvY9TBL51R2pLRyzmk4MLHJGYU2o
	 1h0q6ZAzl5GoMzaKvy9b1RmkQn0llo31u1jVAUrqeWQslLjmkFCLDBUTMtFBPvAqzMAm9
	 spmHNiPZ8i6EG+6Hgt7PIZPZfWIL8M0d6cf1k7fyZW3iGkHvSQSyHTu//lR6TQphFmecW
	 KUx9NPRmBidaBW/cu+OU2mu4Ssm0gwBPf0WG3H4/xqlZbgWFVKClXvE/eUKPhE0ANGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
	b=HwOLsS8lIztJokWSAbE/UpfqCxM4wSRHHe1+eXliHnCMItOxRLI3gP0XgfJalQqzS3D7
	 HjcBOCCoY60AWBCttS/cQe0YTCAjC6uEGi/Y4h86dyogvk/Q90J5ysWw6K0sqzX55/XjL
	 Qz5x+DtdCbjTx1fsaLDwMb11uFnZF6Wu7yxnoYWBqOeG4cxHr1neCYdkzslCXqza9TIyl
	 vvl+MirjzP/bdZ9HWh0UjnqQkB0JqObyBcmK263zj9BmApVkDM6M3lEkcuuGbM0fpen1p
	 r6fApex+9Z7wyv6XgcYnY6kV0CvFHsL8Jcmn1CA8oXCOioyh3IJAdFRHA3pMkL0L4wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DsDP1t3q;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5659C606A329
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 08:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5659C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DsDP1t3q
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49d64a88222so1194303f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 00:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794816302; x=1795421102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
        b=DsDP1t3q4gSo2MbZa6tz0CRtQ/ENkpOJw64bGTuQ7mTM7BNmMrrJVk0fDGemkO6ySY
         u7bh1fbkSX6n1Mlk1nG7RpRMhz2e1N4dRog+xibQRLa3+jFbHwfp/ksAM/2JgV2Reswy
         S845Egr1ETUIsWBas99vWMV7WWrYBkrp2lbaIZDfP0qqB/59bddRbibQYRnEb7ytn6Uh
         g48WXedNKs+awhRCgnE5c0p2y5tTzlqT5sCOq56bnSNJCkjQH1lNs0QTmSAVd+aJjG5J
         Knu4/Nv9NMhs+7d93KKifm2N47Smy3OewSnuDMVa6qdw8aO06BRJNLo15LFfnJuh3ooU
         LHrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794816302; x=1795421102;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y1R2N6M3oJAu4skO9jjhh/J+EeOiDnr68oIITnSGPag=;
        b=G81rcTdHi9R0mR41XNFHZW0+VSKwiyKXsKB/ZttEvcxHEuXNNioDvzzIkSheHMewuB
         DbuR3tc5wlVoLPBGpF7Tz4T1DP0IO3GFAi6WsVMRaeiz1SicX9CGba6et6lth2lmV3T6
         aSLalJX4fECZTvopGSjCT9QOSPuQrcFBqpY8j6/rsLoh/gd8o7eg7VD7VlrfUfnV6xwC
         UAuH+HyRfvoHWYIjmyepPRzD9bUeFcvhPdnPqm7Q42qjmeV6F+59b6GvLen3VRgTxFLK
         fSmfZU33R9ynptB/TBAg+8C/0R/CInS67YJIaCH4kKmnl3GhJk/UevBF54/sgjVJsMHF
         vPwQ==
X-Forwarded-Encrypted: i=1; AL+hErEmUlQuIBXDA1iLXzxeyypQ7oqEIa3B9jqa71SBBtrky9BzqTbyifpPxCV3UwM3IerJn0v2Midtq7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u4s3vg4vM7xmSxnhiElduIpldcJi4JWpTeXspvQC9bZmtw6xC
	WROd6BRcBTVb/+4qAL3k6fBG4N7woVhfrdd+uZjIS71s8sfZVejZzSNefx0LKIUGR80=
X-Gm-Gg: AYBFou2QZtCFzrVedc08d7QCdcZtagCD/uiECYs9KHky3iF/xAVE125Dn1BJQPsOKE3
	olTOX8eDM1MfwVkXRnR59j/UwDUhkM8RHOhHAqZKhpTwk2yiA/dUVuhbrRNZgdBiyIFlqDWmX8v
	uPMKo0oEWSD6U4GE0w7IVVnOgj++9cDIsL0GowyIpsI0Cplr1BB4O8AxiG00TcyBpPaPXuh96u8
	UDoOo8CWOCfKD3Xo5P5dAfksJAwoJ85xaIWZengav5X/qXQL13GFUsqht+eC2QEbbRLZjFz0OAJ
	nrUjIEcSoYVgifS9rf/TRqg/Y/qTxNPvXSO0jaGH4DljCgLFB7/Vtt73/3H43AD+W/t1qt68Rgm
	jgtKcqtB7MnXPC42l/7O377k+HD1njKQpQgbT9kc67UF1dIBZYv6/uYmTI2Lpz6Ic111sdJNA+w
	FadYZDO6d/k3IIN9WPZEFp8vhIHm/EGRlI4pjviBmYJ42tGVf4Euu9GaoEclkqemRD9UX2ag5Pr
	4/pKHCdb2zSY829aNvPwVgGTiDngOC8KTIhgBctBfg0D6aIE7ao+vmEw3HiCL+QPcInYTWuNeEB
	ii9EZq6bPSTgXDAyC/U1Bokgqs8lyDuOkZqQE+/aEBXy2sCyP3m+N+HX6RgpVYyf9N0PP04QZWy
	tDkSidEeoAPklcYtLt4PFXTr9YzMYu+o=
X-Received: by 2002:a05:600c:4703:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb55a755b2mr211614395e9.9.1794816301471;
        Mon, 16 Nov 2026 00:05:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:575d:8fcf:e30d:5aed? ([2a01:e0a:106d:1080:575d:8fcf:e30d:5aed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdfebsm249389925e9.7.2026.11.16.00.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 00:05:01 -0800 (PST)
Message-ID: <931bd5ff-2bae-4835-9788-563835e6c4e7@linaro.org>
Date: Mon, 16 Nov 2026 09:05:00 +0100
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
Subject: Re: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
 <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
 <sashiko-outbox-213545@kernel.org>
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
In-Reply-To: <sashiko-outbox-213545@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 20:23, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] arm64: dts: qcom: sm8650-valve-deckard: missing VA DMIC1
>    route in audio-routing
> - [Low] arm64: dts: qcom: sm8650-valve-deckard: unused lpass_rxmacro and
>    lpass_txmacro enabled
> --
> 
> commit 159b85c8d3e0dd02d73b32823f4b0aaab92103dd
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> arm64: dts: qcom: sm8650-valve-deckard: enable audio
> 
> This commit includes sm8650-lpass-cpu.dtsi and configures the SM8650 sound
> card, lpass_cpu, and macro nodes to drive the speakers on Senary MI2S and
> the DMICs on the VA macro.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> index a365caa28cee4..723f7911fc547 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
> 
> [ ... ]
> 
>> @@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
>>   		};
>>   	};
>>   
>> +	sound: sound {
>> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		model = "VALVE-DECKARD";
>> +
>> +		audio-routing = "VA DMIC0", "vdd-micb";
> 
> [Severity: Medium]
> Should audio-routing also include "VA DMIC1", "vdd-micb"?
> 
> lpass_vamacro uses dmic01_default and the LPASS_CDC_DMA_VA_TX0 DAI in
> sound/soc/qcom/lpass-sm8650.c sets channels_min = 2.  In
> sound/soc/codecs/lpass-va-macro.c, "VA DMIC0" and "VA DMIC1" are separate
> DAPM ADC widgets, so without routing "VA DMIC1" to "vdd-micb", enabling VA
> DMIC1 without VA DMIC0 will not power the vdd-micb regulator supply.

Will investigate

> 
>> +
>> +		speaker-dai-link {
>> +			link-name = "SPKR Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&lpass_cpu MI2S_SENARY>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
>> +			};
>> +		};
>> +
>> +		va-dai-link {
>> +			link-name = "VA Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lpass_vamacro 0>;
>> +			};
>> +		};
>> +	};
> 
> [ ... ]
> 
>> +&lpass_rxmacro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_txmacro {
>> +	status = "okay";
>> +};
>> +
>> +&lpass_vamacro {
>> +	pinctrl-0 = <&dmic01_default>;
>> +	pinctrl-names = "default";
>> +	vdd-micb-supply = <&vreg_l10b_1p8>;
>> +	qcom,dmic-sample-rate = <2400000>;
>> +};
> 
> [Severity: Low]
> Are lpass_rxmacro and lpass_txmacro intentionally enabled here?
> 
> The sound card only uses MI2S_SENARY and lpass_vamacro, and nothing on this
> board consumes DAIs or clocks from lpass_rxmacro or lpass_txmacro.  Probing
> them registers unused ASoC components and calls lpass_macro_pds_init(),
> which holds active runtime PM references on the macro and dcodec power
> domains for the lifetime of the drivers.
> 

Good catch will remove them

