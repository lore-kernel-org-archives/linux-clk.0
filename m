Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A41FF61E
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986169; cv=none; b=B2dIb2lWMmzYDJpp/bDPsyuYn8EfBgYIlpANi4FrwjuoJ6K0wQana1OFQlnnr9PwtPMMJ9vVp//hnIr+Zl1ds9jljv/LLilmGr+Jo7wjahKXrOpgCIPOYyMP6tr/DGLtVbE3pWXLFF5H/HxrdFaoQzwL8kJl4Pefp2qP5aP1RXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986169; c=relaxed/simple;
	bh=+6jz4tHMxHorEMU5+vxgQW0NALIa8XqK7viSuGah46c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GY72CNIw0hhIH8nOXjEZeNXQk9e7WP/1q4tNJIviSig8NXSOW/kyk1pmA/D3CyhUQnaipnbdCMy49vIbdbHnYU3wwv+d6/mMyqtH0MdF+Ndzd4B9gD0VLYQXENa7jmX4N+4Ilo02afDQfwArwcwv1IhQn1yaC+KEENemrEtGvmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gt3Xw6sL; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gt3Xw6sL"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-305d843d925so38894801fa.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 05:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737986166; x=1738590966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
        b=gt3Xw6sLC+IZi8QYYULKx60S6wWn4tCn53y3FxmdrgLp3z7rIcP7FjAJYa6vsvq2SK
         qjxBzQcHZBDg2d6/OxLyNiHsIk/BdTsiuNOBKjDPdB/adc1h2zDQ8Ayc+ykOS3z+qvay
         VZmpEKb1nWVPhT3dr/U2XEPqtqsbNCS2HPtPGv4cu7Mp096NofS/VjIS0ZAqRqV606/d
         RjqjAmbxhZl1+D7ytAKPXBABDgeEg+9dyhb9Z/PA3nAtmNheyxHNs14muLAj+/4hvKJs
         aWEJ+vQbSCOgNrOVbUp2s9JfSeoqgKt703IiReaL/k7LiXqdK0Z5s5BlFNIGkGsQ/HPw
         9y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737986166; x=1738590966;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt4sS6zTyCweAZYH++LZePNO/qvVROY3D8Q5U1D/3eY=;
        b=plp0/lyQvdDBYnoKQLNw7VWOUM46y48SfmRem0qHFrwEDZXCKkzY71svNv17eKa8qc
         31fczbZpZ83ki6p2PGKYkOdPlTmBYXPA21uWRrlpFVxHwtjlNYgS4pNYtoNE6qA+aORI
         IlfKxoZ3mKf8/rabVK5L1QZ7fCL8r8ydQQPoXzWTn8sy2RGVhWIy1GHNRpiBEmT+/jpu
         25oOJ8p/yijrnme7paaKBE11H7yledW1C/BL3RYcS4WQjjMwNktVpkSzQHE4C+UIFL6j
         1aHOYoXkGX1SCcd0XRxv2lNNdeeucFeYtY2PBO9+BJbN6yuxK3LaoRywenlUudv703bj
         ULkA==
X-Forwarded-Encrypted: i=1; AJvYcCXy6bWrelJyXbkp4fORGJLGpj10337EMQXqLfwZCF/QiNEbhXFpXg2jD4HIEZwr52GmQ++YsRSMwE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOAQzQi/gR4DPxZmT05wmkxL7NwLiUfwE1SVklyDnFTNggHhGQ
	6AfIH7l6pPqlh6QjAssPKsX1m65I82wkTvIyKlf1YiPA2tB//0yBBy5wBXfVA3Q=
X-Gm-Gg: ASbGncv6y7nttDIIQ+/juRllsPdC/8dXFPJmUBWHyxXA1CKSKlHrK9dUryVnKIeJkcg
	P8zEArZUJ+kWZ0qXk1cUIcvstfY03pUTtPX7LoUQtR9oNki/0vL9xnBXK44sVo+tWGh4vHKR4H7
	vK8spdoW9p8ecO0E4S7Ibgw7UPOtkEhvK1A3Dr1EpujfQbY1WvpxM93WcYhUqHpC4bcVr0nppEF
	2D/5Dsc7fispI33Q4N6fGXEnfFShGD4erB5Un+9iiuLrd/ocz+mCJ2MGJveCNkvmsgF3CLrCOKB
	xjVGZy0+B69h6PnzNJ2l+/kp9OzkXry32jVU1zZJJOs/TUaITb6urwHBwIO/
X-Google-Smtp-Source: AGHT+IEndS/LVqeUqSpxsvwA84LzRH+l+YBnVxcXQWp9YfcsB2fe5zmaDUUkUk95OVNxnfDlx/rsmw==
X-Received: by 2002:a05:651c:2104:b0:301:12:1ef3 with SMTP id 38308e7fff4ca-3072ca5bc35mr153845421fa.4.1737986166078;
        Mon, 27 Jan 2025 05:56:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc49b5fsm14359241fa.101.2025.01.27.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:56:05 -0800 (PST)
Date: Mon, 27 Jan 2025 15:56:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/dsi-phy: Add header with
 exposed clock IDs
Message-ID: <4vy6tjdvhkplly3uqqekdmz6brkcbac6pijrn6gdyz4x3hralr@meeugoua2ats>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>

On Mon, Jan 27, 2025 at 02:21:04PM +0100, Krzysztof Kozlowski wrote:
> DSI phys, from earliest (28 nm) up to newest (3 nm) generation, provide
> two clocks.  The respective clock ID is used by drivers and DTS, so it
> should be documented as explicit ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch for Display tree, although with Ack from clock.
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml  | 2 ++
>  MAINTAINERS                                              | 1 +
>  include/dt-bindings/clock/qcom,dsi-phy-28nm.h            | 9 +++++++++
>  3 files changed, 12 insertions(+)
>  create mode 100644 include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> 

> diff --git a/include/dt-bindings/clock/qcom,dsi-phy-28nm.h b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h
> new file mode 100644
> index 000000000000..ab94d58377a1
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dsi-phy-28nm.h

I think this should be dt-bindings/phy/qcom,foo.h

Other than that LGTM

> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +#define _DT_BINDINGS_CLK_QCOM_DSI_PHY_28NM_H
> +
> +#define DSI_BYTE_PLL_CLK		0
> +#define DSI_PIXEL_PLL_CLK		1
> +
> +#endif
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
