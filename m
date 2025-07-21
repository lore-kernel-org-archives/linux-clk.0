Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13723B62B
	for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753129065; cv=none; b=sFzlYD9217rlJf5cotrwOWd37tofWzwKjuEalbVzCsgsVdEPgmpAps+p8Txu/Dg0isiM3LjSp7VploiYp6Cl7UTFpUSWbjOqvcTuE2icI9zd28tJ43+i6Ed31hbkaGCm1q7PtbjtjuyoBlbKnuAaFMKs65ODMUrBw90dhL/q7j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753129065; c=relaxed/simple;
	bh=qNMjXYg7gSvi1w4o66Q/qp0UaJ/AUdAOz9hXwpFbNPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwLC2MPEx4yfQTY8EQ3IEiow29sReD04+ecbN01uxKIqSVO7jG1g6OI/RM2/jf+PAnXPwpxXErQtvaCaI+hMNx1vg0klFdmfgPKfzHY1JxCyJAexZVSM1WYK6nFTaxpGxRTyDzg0LAiDgqIce83C5ZC79+xGPQpooowmosephVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=merfMegC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="merfMegC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45617887276so32098545e9.2
        for <linux-clk@vger.kernel.org>; Mon, 21 Jul 2025 13:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753129061; x=1753733861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dM8V1L459ePaBP5oquLpSUwSE8BaJwvLWNciMOJOtaY=;
        b=merfMegCMYwWsN27o6ZvoKAxuiIDUz2j+UCUcAXwR4cjDZzRxEDJXuNcS09EE58Wlx
         rCQ2CjyTmdx6FINi2LCktDlVkhBg4Zhqx26Ph9KeelPhiICTgvckMXLPGGzPMLLTy5dh
         xlhFsq0nJq7x5dHhHotX9tnvk5jBzpR+ubTOAUId1ewM100vMauN/LUJIxo+dSwWmkLl
         ZK/U647XyHymDEKFHOgW0iUl/gWtu+53kCixSGvaBdX9GtRmh/oaKEafGa+oW15I0GfU
         TtWx8KAD7MrLdTTa+G7U/FL6VmAZx1O8OYTkcbmBgUadq7MO/oM86zTmrvNKkjjZiEoY
         bAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753129061; x=1753733861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dM8V1L459ePaBP5oquLpSUwSE8BaJwvLWNciMOJOtaY=;
        b=qA/jhT7hb+npj+CpIlWNGp+e4HIItVw1tkzqPxxk311t/NY+aHCu6ANhOL/1bTVWiu
         dGYhHbrW+8Je7Wpmfsy6nmx2MVc38/YmypuGW2wCOMkvb/gldlWRAcUNX5vwwPW1wCvr
         m/Nj+o1X/5ZJ+Vp1qVAIyGqbIvlNhEmkvIhHuXj9QrHcBTDk062PMSZazo4vl45YzInd
         2vVXmWmlKQku6lyvPny7K0QbqQXB4KkzjmO7wXHMktLQHPxymF9D9cvkPBmKu2+1Ha+S
         nOt98dVPbkQIV8xIjs3DFo657EVtLV7pNNPBDb5jZNsmQjQGMTleLmY2Sl/Rr9DlEUpk
         Dn8w==
X-Forwarded-Encrypted: i=1; AJvYcCVx12av3KVzKz9yids0Ka/18NVIWQk61k4qEx5nGdcxReGm7YG9+Z23mj19FF+5UsyeuHB8j5y+g9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSbRLZrGHBiemz5CttQOr/3Bppky7bjGd2+KleqCqDILeqY8ui
	yHl6ipUqRLrEjldad1vOItslgZOE9tzStFu5eMDurVspCHsMarBhriGrMDyEJJRI9iI=
X-Gm-Gg: ASbGncuLCljoS4xzrjLCnvv+8kieg/H+ePC0O0mHYl6qj3GMt5lIMKwK0/1ag3Cav1w
	tcrmcskzSBbkiroR9Mxfku6KLhovL7EVsPwmxQugnKqtcqAUpans1DesG3mnAU6ZqVNszxuAUlh
	0mYY2DpBo2DIByxuc74gkiURScFoG8/9/dQxf68VeseQJ79uC8NYLgaJWGtxP3+XYX3MI/ZuQvC
	ltOP9IQ/3OsUYKSNbJXD/PkxfKKqOPOLzORwCU9JjaijE7dpmmIDq0qeZcgweL8HQlCohlkAUHc
	JxDtyN4SrNQxKL2G0tVSJpnTJ9+BRgLFtgRHzLyDPk3QAQgSKCSaimyjVf0lK2wUx8uQYKECLOs
	ai/q/JD1vM0x87cZnwC7pe1a05orrP2lVEXxZSAO5vQP6WKTEA2K2uDnSpJPQSgc2ZwXYICfihr
	BWkAQ=
X-Google-Smtp-Source: AGHT+IF62Mz23f/3FxKSXRlhY6X69Vv1j/s22nJAkdHPupT9WjDcJMNWjSNh7x1kPOXtrItb7cZ4Dg==
X-Received: by 2002:a5d:64e8:0:b0:3a5:8a68:b839 with SMTP id ffacd0b85a97d-3b60e53ee0amr17139819f8f.45.1753129060690;
        Mon, 21 Jul 2025 13:17:40 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:abd:1f99:991c:5b07:cd28? ([2a0d:e487:135f:abd:1f99:991c:5b07:cd28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca4894asm11444490f8f.49.2025.07.21.13.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 13:17:40 -0700 (PDT)
Message-ID: <8792778e-1fe6-4eff-9328-767ed38a1583@linaro.org>
Date: Mon, 21 Jul 2025 22:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] dt-bindings: thermal: tegra: Document Tegra210B01
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nagarjuna Kristam <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20250714-t210b01-v1-0-e3f5f7de5dce@gmail.com>
 <20250714-t210b01-v1-5-e3f5f7de5dce@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250714-t210b01-v1-5-e3f5f7de5dce@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/25 06:02, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the compatible string for Tegra210B01 SOC_THERM
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Applied patch 5/17

Thanks

> ---
>   Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> index 19bb1f324183bb22bc75630798da67fc834920b8..cf47a1f3b3847d4a0371d0bc711638fc5e3b6cd3 100644
> --- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> +++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
> @@ -21,6 +21,7 @@ properties:
>         - nvidia,tegra124-soctherm
>         - nvidia,tegra132-soctherm
>         - nvidia,tegra210-soctherm
> +      - nvidia,tegra210b01-soctherm
>   
>     reg:
>       maxItems: 2
> @@ -207,6 +208,7 @@ allOf:
>               enum:
>                 - nvidia,tegra124-soctherm
>                 - nvidia,tegra210-soctherm
> +              - nvidia,tegra210b01-soctherm
>       then:
>         properties:
>           reg:
> 


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
