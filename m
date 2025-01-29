Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7CEBA50
	for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738167919; cv=none; b=Jjn4kE/7ZxOfqijC7kXjKcHA6naiq6sdUtbTIuC1tNfvPyRM2C2TZIcCdo4IcW4Tt8Lk/8YrDa7HK7WIZ1io0NC7wR16o+wyDYUcV7cSkKLC4c9KgGZ3rFwWYcre6ym7e5VR0oLzDbmEumDUy4F0o/VxnAQHeVQFIoQyDYUI6VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738167919; c=relaxed/simple;
	bh=eTe7u4R9tM7SfXPBUlFg06jXBlzWIenc8aOm26K9+hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2G/zqiDc1geZtBsujaz5ofjYJUnaJV7quUqLp4IbN6EYAF2pnbJKUX5/ju6RmaMf02OZVAUKT62BBsbMKmpSg+Gp+AEQ/z5k5si+wZH7thM5KP5BNU74ZPW8s9n35PxswLbSCeg2igxxlDbVSPvOY8q00VraHx01TB3NC566hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0gWxZq1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0gWxZq1"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e3778bffdso7694784e87.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Jan 2025 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738167916; x=1738772716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QO/x1oTf7a0srTFjfunlm88nqvMdqFvIe3oraA8GH6U=;
        b=k0gWxZq1KnD9iBxzzd0wh5Y/Fmy9nTalgJZxGJ1ddHsiAULIVVPvUiPm8haRfHyXgJ
         I3wWFnUiLIxQfBiNTyI2ldTqoaCDEWKGtb9jws5wdsah0fFgRod7Nvf7zNH+G0jOlcIZ
         7p1pDn7wwloaMKn3WIRqAcrrhgqmPh2+bIt67fG1/c0xUua0I1DJWuO0/IoPCKxvgKVz
         mCN3/oHPD3XRVedzxmg7i9qORjMK2Vw/POC+UTAz/Lzk47/TYkswkn8xRIX5fIpTnt3G
         cgIE4pl0uaSqbm8YtQVpY2BWZAkKHq73xwMwLlU+hvIPeQMLChLwSB1aY9VpQ4lYp52w
         RyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167916; x=1738772716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QO/x1oTf7a0srTFjfunlm88nqvMdqFvIe3oraA8GH6U=;
        b=Ws5iREOBbqdgi2hOZjuP8/64kfN/CxQehqEnab5duF4l4BpCNs5tEiynyj3h7e6QOp
         oq/x5+ykpA/tvYv+hONXvi0sR1iTk3QP6JdXPedrQhzwFCa6KoXPADaI9GbHor9Nsebz
         ybu1xMSM0X3YOGxgIYnWqEkMoh/Ppti4n0J+D/isanmggys9rrbqvUKI66woApI1jEW/
         mEPxrgc402Xa9ftd5C1qA6G8yyxXqLmdhXbCkgMDBNQPvEDep9FIclV9obdgfcKEANIT
         J6HUmWcpDY2DvAeaoikp0IPWudRd2UMaKdoUiE45/7hpB8pC9jPEgW8DYAU8bHzuJ7JU
         dMjw==
X-Forwarded-Encrypted: i=1; AJvYcCWjXkFQiF/ZWwOTgtS3HOI1vTnWM5Wo8y3hu+pRXAIOXXEfocp5oo/m/8qyqFTthOSlZgVgq55z7J8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcLpq/67w+UD7D/qLX/NC0xDolSTydv3QSL3zThWWSCmL9eKu8
	Rd6TD6RWev0Xw07xyGPHJIxPAGvowSRYi6w1nFE9G+H4fYdgZcWXBSH9K8ZmFLIpCSiuO+vftJK
	KGqg=
X-Gm-Gg: ASbGncsfXnpfuLm9RGRSmbBCCxpS78pl3lZVgNj4CVAIqS1kWiHobJR7SKUlkazr7ru
	EiW7LSFa9TgEvLNqyWzLH/fOS0sc9Vp5SFUED+cStYkGMf80hnpTCgwgTknUKk9oXiwwFUes2ea
	1fSHjPWaiTakQC8GPD6sazEU9/MoVNJ9KCCCxnvgBWSOaK76UQ3Hf/jTkESoovJp1bx4c74PLVW
	UTELVWz//FNY65DVfZxHNakFXjTaB4Stw0z7/mMhXEjlOxiqhSAAXpYQLsgQ1iB/P6Cxz2zBAYN
	ETnH3HS4866XGcR3Xer/wb7oc5kx3RepJyOcrQmV3g3GtMGIwcAzETcNsQD1zgRAyEjAW6k=
X-Google-Smtp-Source: AGHT+IET0XFFm4nQy05VSjs4EMucd01BjcVOGhckKXNaEyF8FTW0tgtOo7C/7RncS5097j7cJOotMg==
X-Received: by 2002:ac2:4c86:0:b0:540:2188:763c with SMTP id 2adb3069b0e04-543e4c31246mr1146851e87.37.1738167916238;
        Wed, 29 Jan 2025 08:25:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83682f4sm2001573e87.113.2025.01.29.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:25:15 -0800 (PST)
Date: Wed, 29 Jan 2025 18:25:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect
 CLK_SET_RATE_PARENT on byte intf parent
Message-ID: <ktwnhspd2krxwzcswrqj7ffoyhdzplplosy3f6bu6gqrzi5uxj@i5xqxthpha4n>
References: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>

On Wed, Jan 29, 2025 at 04:45:19PM +0100, Krzysztof Kozlowski wrote:
> The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
> the rates, because this messes up entire clock hierarchy when setting
> clock rates in MSM DSI driver.
> 
> The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
> via dev_pm_opp_set_rate() on byte clock and then sets individual clock
> rates, like pixel and byte_intf clocks, to proper frequencies.  Having
> CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
> clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
> and align with SM8550 and SM8650.
> 
> Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Fix for v6.14-rcX.
> ---
>  drivers/clk/qcom/dispcc-sm8750.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
