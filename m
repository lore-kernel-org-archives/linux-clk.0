Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B073AA9E2
	for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 13:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095204; cv=none; b=GATorX016Q6H9Id3zpZDIv7a5x67WPExjhov937OJu8BLwVsq0pvIGZY/kBzl57/vUd2ug/BDTzcOtPveYP9gPT4zLAQEdEVfnQa90gKkoowToU0zJ3v5D7GlBO8WxxyEPPjBDqJkG9+kGzmGS0b9OiWzsep0V9dbmsjE++6IVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095204; c=relaxed/simple;
	bh=WjEdZj/N+aOfZRtaHCBCBk/U7+N/dXvDf3LoxLpJh4Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OaOauq9BMAR+Nhi+OAHM1WkAsMf6JKnPw77M7hPZh8kgjm2fYTQpqVW9GSobawrwzfFwQWw3HQux0zV7z5PtZqSutJzNjEQoIbQzUqmfKcWGvLyYsBzveD3gLsEUOGK8U/7tQmpSNBMIO2naaL5iaAYS3v1+n4w8yW/iFYr3YJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aK1cIaHn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aK1cIaHn"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b9320423cso25047025e9.0
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788095201; x=1788700001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jq+ZfaXrZvTkZsYgTJsjcj34MHFpmYRP4Z0eWcu7sE0=;
        b=aK1cIaHnG0w75USItbRI0E+X1hYDgQkdqMGGamw3fzLpFXI9NNq9tz2gWRiNE97lCY
         0vGhj10NtHt/ZRD7ghLbtHcz7qnv+LnOWkFuGKhWV/pU5HoiadiGNGvYA3PHAuUZTg/I
         aJhIQoo70Mq73/XciZzdxvRcVjg7XCmD1qfJMwKcx2x/ibD9j5vMLpYU2EFj/4FivuA8
         k+UPaw2m29qvE+AFj3MKpJ2wi4AjRA3BbwiuPdfR+EPffzk2YBo0HXUVXEfPVdRBb4RG
         ilDcuj+5bJq4+85d24mkR9I6Yu+GzfRf6i9rZE+rYlTYbBknM6Q04+Z7nABv7joWzith
         yDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095201; x=1788700001;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jq+ZfaXrZvTkZsYgTJsjcj34MHFpmYRP4Z0eWcu7sE0=;
        b=K3XGq1hrHjrJrTh+xJliu05a93C4C+PAAi9uovQuUZJS8sq8YYjr0xK6SaG4Pjq+NM
         1z+sx4DW2fdJQwvoXmQaB+3SE89UUejEJxT+XQMA5wk023Pq3mJxxShJLhHK1BASaK09
         giK4xaHdRDYGgS65CRCyZtw2Fp62yOsks/SXufgo7mWQfEyMgTNmQgLt+Ps1/DNVWl9Q
         QbDBfiY27crJiOEddOR4Nn8V7p/kI6csSVczTU10E54TA0UGqDKTb57oIr9jVyw2i0Ry
         ZzfyX5FBXNYGt+aHm/7mG+atT3Td3XfTujeqk7kg4gdBmzkzYIK5KOv7G8AnQn6Gp9ok
         d+xg==
X-Forwarded-Encrypted: i=1; AHgh+RqkYpzKRa41SruS/zmSg7RvqpxcHRrISxQoynVBy88ZOnbVb96lpuSn279yWMVr1u4SlivRMcgtmIA=@vger.kernel.org
X-Gm-Message-State: AFuF++l0D35NVaO2b8jopCYZvi3olqbVRaUWb+hdaMD2169mXK9emiG1
	j5zhqE2OtwvhLtMxsQDcJGALTI2FcDuCUV6QM3aDe5dTBHYHVrxV7j2HOO74IRJaVPQ=
X-Gm-Gg: AR+sD10SKkLveUwCr9VdIS+IhqJQJT3onx0i7RuzN6phiFHHWM3CWWoLAK8XzwtuPEm
	1ClocCr3WqUXtq9HlRFU8mJAsrTtCOCVyIIw03KPY44bzRESztyRiSf8bYkuCPZZCJ8iISvg6Ux
	hZjriIf79p5fi6BeGUQbw9Eyq+c0utrqxJZQQEJTbLS4ks9w3mnG1ugEkpOn2us+jkGW7Ncim4h
	BIEIxCarPRYO8Xz9s7moyr6mjFShQMSAWJBWGcyR1qD/VfxiyNt5LGiy9RmuvkOGMW/TVzajooH
	Qrv8Ql2FvEvcBvO5FTe/YVPGzMpYv6KhUnuHZ7DV9Putq8uMyoYkUPjc9gZksrEcpQ1hxiLf7Hj
	c+TbrtCSuZPhsYiL7BicAeDTwQ8WXaER81/GTwEh/PPrWm+0F66YWRrOfiizzAF5vWtIhV2Sxac
	S7ebH2ECTHI/BUhH2KMkg5WTgYMMEFNVCkPNiROskQHnoZmDarigp4kRy+6WgOecpMxDlFLHRJ
X-Received: by 2002:a05:600c:19ca:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49b91c47b3dmr274079255e9.11.1788095201493;
        Sun, 30 Aug 2026 06:06:41 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20713sm15406915f8f.21.2026.08.30.06.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:06:41 -0700 (PDT)
Message-ID: <b9270c4d-bb7c-4c69-ad18-8481b43a48ea@linaro.org>
Date: Sun, 30 Aug 2026 15:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: amlogic: t7: fix the pin groups of two
 PWM outputs
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
 <20260829094758.23248-3-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-3-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 11:47, Lucas Tanure wrote:
> Two of the PWM outputs can each appear on more than one pin, but the
> description named a single group that does not exist, so anything using
> it refused to start.
> 
> Name the real groups instead, one entry per pin, the same way the other
> multi-pin PWM output is already described.
> 
> Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 32 ++++++++++++++++++---
>   1 file changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index c3dc479b137d..8c4bd683cce0 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -458,9 +458,25 @@ mux {
>   					};
>   				};
>   
> -				pwm_ao_g_pins: pwm-ao-g {
> +				pwm_ao_g_d11_pins: pwm-ao-g-d11 {
>   					mux {
> -						groups = "pwm_ao_g";
> +						groups = "pwm_ao_g_d11";
> +						function = "pwm_ao_g";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_d7_pins: pwm-ao-g-d7 {
> +					mux {
> +						groups = "pwm_ao_g_d7";
> +						function = "pwm_ao_g";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_g_e_pins: pwm-ao-g-e {
> +					mux {
> +						groups = "pwm_ao_g_e";
>   						function = "pwm_ao_g";
>   						bias-disable;
>   					};
> @@ -474,9 +490,17 @@ mux {
>   					};
>   				};
>   
> -				pwm_ao_h_pins: pwm-ao-h {
> +				pwm_ao_h_d5_pins: pwm-ao-h-d5 {
> +					mux {
> +						groups = "pwm_ao_h_d5";
> +						function = "pwm_ao_h";
> +						bias-disable;
> +					};
> +				};
> +
> +				pwm_ao_h_d10_pins: pwm-ao-h-d10 {
>   					mux {
> -						groups = "pwm_ao_h";
> +						groups = "pwm_ao_h_d10";
>   						function = "pwm_ao_h";
>   						bias-disable;
>   					};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
