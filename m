Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1367B3AA9E2
	for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788094918; cv=none; b=RFRwH8Pi+i0qKfTIlvC8w1OqhQrJzGhFt045pFohSkitR7FOoIMTUmfgDfizFuSKfdRzvEz6V4zHbM+KXKsAWHAgWKQbuqQ6mdGS7g8kwOBB20oeHGLbOkctl92g45jlt2nJ0ra2kM9N/S4xefQHcfSX4oyUtwFi6DG0xnFW5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788094918; c=relaxed/simple;
	bh=jaGU1RxdC5ZnKCapNSs9jx6X9xm2eCnj4r0YppE1sCA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=eFCVOdn3fpIn9lo9ogujFr6WfxnWtpRlClnh5JpUREg0PR+wm58KNc3hgqLP+ifbfyOm9+syhZWAJWEsx+kEH2oALW/qJDUrrTAf1bA0PHBd4BnBX4kXOEZaRj9y7HGhpoJbNd6E//zTvZdAhgW5mNTY+suhQiCteRQ/vWO+xUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDaeRRC5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDaeRRC5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495590dde14so23845905e9.0
        for <linux-clk@vger.kernel.org>; Sun, 30 Aug 2026 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788094915; x=1788699715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqekcWJTKXTHZtsMCquuZKmqeOHHO1OiGd6uuu0JU74=;
        b=wDaeRRC5IDqsGjhvQPavzMWuju2XJpsgtQHTDOlUaZ6kQxj5UTnB9m/nLIrP9dlOMi
         R6Zd/m4uQGi4u2fwF/pPROWbqyECcB0dWeGpkEP5h2m2qC7Bc2HbJWezJAFKlTOUTgAH
         zdrUMv9wZDSR+/ZX9HrwGQc+9EndryJuBqdj/6qeOEKlBnTNvlDk4QPlv9IyFGt3TXfh
         V+Zp6Ai2yVBUvSwW+ELEqGio3ZUJxN3S7QhPC1b5JoZDAPQhNMq0n1yvKWs0e3MS0PPc
         AI5ABqE7/Lg/Ve5Q/rkXrDEPNCRKhc8IxfurBBY1fPI54mYzSaPyjcAFqxLojE2ttBb3
         h5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788094915; x=1788699715;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqekcWJTKXTHZtsMCquuZKmqeOHHO1OiGd6uuu0JU74=;
        b=EcMm/qtdNQq5dVbvFKpnjNx12IVpbxZtKufitppYpZQY9nqgQhHvHnkEr0l1ilhpLV
         HxMh0phmPju5nSNNM0FW+U/4V8tjRpys740C8rIXZZXjDxvAL9+mNJsqIcxZhQnv6d//
         PVEqrKLWSkppUxSnUe7Nd1YN662X0VEdKKOwtfUceidoqHPiCHV1zZwsUYYgzB/hMSNB
         vbp3vGUkXaT9j2BkJau+/Kn5u9LVwIshzPpBPcfQAqBTn/e2b2AQzu2fi4gGGetWxvGu
         T++rLUYg3Ew4bQdJIJH4o0iQW+Rg/laOMDaNu/r7zC+TI1f+vJjYMb6YyYYnjOKklTiy
         Ob2w==
X-Forwarded-Encrypted: i=1; AHgh+RrZ4mPAxJB9UEY769YWLiF81AMilNP43bbaSxUPqCeA6sb71jgL7aW/YO+vv1U376cER3ja/NoG8ps=@vger.kernel.org
X-Gm-Message-State: AFuF++m1ymmM2WVps6aTvw5pV0A7iiBsI0E4NmhUbNEcU3LsBhu6oHUM
	XHzQLqITYgIe9ZB/Ck179AyCaBddV8LxVi4oG8T7Thrd8TEECApwom9FQnFG5ijSONU=
X-Gm-Gg: AR+sD11x4YtY6oToD6G/h419C3v6nMYaz4mcJugnQmzzr9BRqOTPYo8ytVMzm692sYu
	skf7SsYPuy6jReWew8YVEhFrTM+lPeaCn/zO8rtUvvIN8z4hw5tULBsj06gdMbre04Gv2y35FiZ
	SNM2cQWlUb09JDRJ9nPT+iwi7aSx9KvPXGT6ws0rcjDlNQQHqe5uLEyKDyFvhYgMBS1rupJ9L6x
	zIyN0KH61xWKYAaJmTyWC6l7uz4sV+UdgO+9oyPXXjM5WRyIzSMJ9H+m6ar6CjdOUdhVNPPN5tK
	TsogsTuFHETXLCAIAtwXQOzq0+Af3SBhmEuzzNrPLnVWXgtfXtJt83MHGZVfT+5NoB1lgn2ZrWo
	DmvdvX54j0DpVuSOijq4zkCHR1zQAA7VZNexN4P4p70fUMs9e/OKM/yWQCqrKTRp+tWNISwzMPD
	O7yb74WHKxQjp3CGGhyjRdJRrx+ztB53+tvIpMCHjUJ2w9QXHD9CeS3FvVR7L+/JyTDaDJfag=
X-Received: by 2002:a05:600c:524e:b0:49b:9438:7785 with SMTP id 5b1f17b1804b1-49b94387aaemr213444345e9.4.1788094915126;
        Sun, 30 Aug 2026 06:01:55 -0700 (PDT)
Received: from [192.168.1.36] ([83.214.235.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm449355905e9.2.2026.08.30.06.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 06:01:54 -0700 (PDT)
Message-ID: <2bbff6c2-7308-4152-b7fa-f24e95541aa5@linaro.org>
Date: Sun, 30 Aug 2026 15:01:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: amlogic: t7: khadas-vim4: add the
 PWM-driven supplies
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
 <20260829094758.23248-4-tanure@linux.com>
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
In-Reply-To: <20260829094758.23248-4-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/26 11:47, Lucas Tanure wrote:
> The board powers its two CPU clusters, the GPU, the NPU, the memory and
> the always-on domain from regulators steered by PWM outputs. None of
> them were described, so Linux treated those outputs as unused and
> switched them off part way through boot. The supplies then drifted away
> from the levels the bootloader had set, which showed up as random hangs
> and memory corruption.
> 
> Describe each supply so it has an owner and is left alone.
> 
> The voltage ranges are read off the feedback networks on the board
> schematic. VDDNPU is deliberately not the range in Amlogic's own
> device tree: this board fits a different feedback resistor, which
> puts it about 40mV higher at both ends.
> 
> Fixes: 8c45bf9ae4ef ("arm64: dts: amlogic: t7: khadas-vim4: Add power regulators")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 110 +++++++++++++++++-
>   1 file changed, 109 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> index c94afaaf8826..77abfd555ec5 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
> @@ -104,6 +104,66 @@ vcc5v0_usb: regulator-vcc-usb {
>   		enable-active-high;
>   	};
>   
> +	vdd_ddr: regulator-vddddr {
> +		/*
> +		 * SY8003ADFC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDDDR";
> +		regulator-min-microvolt = <690000>;
> +		regulator-max-microvolt = <890000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_gh 0 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vdd_ee: regulator-vddee {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDEE";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <922000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ab 0 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vdd_gpu: regulator-vddgpu {
> +		/*
> +		 * SY8003ADFC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDGPU";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <922000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ef 0 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vdd_npu: regulator-vddnpu {
> +		/*
> +		 * SY8003ADFC Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDNPU";
> +		regulator-min-microvolt = <733000>;
> +		regulator-max-microvolt = <933000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ef 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>   	vddao_1v8: regulator-vddao-1v8 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VDDAO_1V8";
> @@ -122,6 +182,36 @@ vddao_3v3: regulator-vddao-3v3 {
>   		regulator-always-on;
>   	};
>   
> +	vddcpu_a: regulator-vddcpu-a {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_A";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_cd 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vddcpu_b: regulator-vddcpu-b {
> +		/*
> +		 * MP8756GD Regulator.
> +		 */
> +		compatible = "pwm-regulator";
> +		regulator-name = "VDDCPU_B";
> +		regulator-min-microvolt = <689000>;
> +		regulator-max-microvolt = <1049000>;
> +		pwm-supply = <&dc_in>;
> +		pwms = <&pwm_ao_ab 1 1500 0>;
> +		pwm-dutycycle-range = <100 0>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>   	vddio_1v8: regulator-vddio-1v8 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "VDDIO_1V8";
> @@ -172,9 +262,27 @@ &pwm_ab {
>   	pinctrl-names = "default";
>   };
>   
> +&pwm_ao_ab {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_a_pins>, <&pwm_ao_b_pins>;
> +	pinctrl-names = "default";
> +};
> +
>   &pwm_ao_cd {
>   	status = "okay";
> -	pinctrl-0 = <&pwm_ao_c_d_pins>;
> +	pinctrl-0 = <&pwm_ao_c_d_pins>, <&pwm_ao_d_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ao_ef {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_e_pins>, <&pwm_ao_f_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&pwm_ao_gh {
> +	status = "okay";
> +	pinctrl-0 = <&pwm_ao_g_e_pins>;
>   	pinctrl-names = "default";
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
