Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF3E1A2C39
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725621783; cv=none; b=otAl/tKTkK/PCqx/ywDQt+Ze7X/3m8w21GRqv6j/ETGGmZDt/9jfBAcQQfNMAcSn3q2Zo3lfsQV6nyiyEuqhFnCp8vk8fRF3cN9xJYdP6e4byASspDBwRpV4fXE7CGQfhznAbUJZsbAF52+rTQRvecp8i+eIu7TdE2w1J90mCAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725621783; c=relaxed/simple;
	bh=Wmp19ZLbe2P0V0jL2Ao3BXfy40ExCrN8gOpbuS8Jyqs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G0jF6Xsy8LpXOl93FyclmNnRYi9OfN0lMAllKgEvCDrf+CxECJBi1plkXXwcKHnoBPYMhKx9pQ3OX8f8sujPOs4iumwiFg2fBrD3PAnAKK4q8i+VKgBAS+zM2XK3bp3Fu2ZVI2HTIMRhGd51NuetxKEso/Z9zJYHA58xVcKPxJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nE54EPjy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nE54EPjy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-371ba7e46easo1169198f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Sep 2024 04:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725621779; x=1726226579; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=92+67uwDsO1hQyzhgte48I/CNhtegYeJx45/P0oF94Y=;
        b=nE54EPjyF0jn2m0WwJAF3FlM27kyBnolT58IuawqnrzmwnaO3xTnxt1HiJRK16o9F0
         qAFQvhpfWPXmR1RrUjg7swJApKC8n0JmvI6kXE//WxwSqlgJ0jiovBWjdQzMbTySdKJ8
         b/zcJpSh4sshb5U62dpOZhGfiFQjii2r7P8gzk2yMXTk+FaNQ/2Kin0T5YRLsXh9YbtK
         GX/01lYngS4RxRwAJs9/O0WmPz5BuDYHKB8biENXnTDt9kdHFHiC75xw8CNFelMmL5A8
         fjVplw+3mvpOs6V2a+w1I3YIO0PtyTtuRLJOYsBUGlQCK9sZx1Izvwff0EVjbeaPjX+V
         E9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725621779; x=1726226579;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92+67uwDsO1hQyzhgte48I/CNhtegYeJx45/P0oF94Y=;
        b=wXBXXd17SRsRq9ovCmB2ywcRTRe/rz9f5XbqxKox9Zl/Dy1F2mlh8qrzouCZaZQzd0
         6l0zqaFAxAWSW+hi+nnfygCZ1DnxcKdNKBa+GKRdf3bugodJzoVTQxp2pk9cgQkLIiNW
         7V0fky2PemqZBiHOlMeZHFD+nytHnG7ShnOkTTfgxGn28qvpywnsIoZTCKry+YHUuoLr
         638KJrZy+khLt+jUXV1SAXa555nGhfDdzUeJDPHCGwzS03R07GBbYONnjz8zkjHLCHva
         sRgkwdbp15jR6q4kiKoEdyjX32+WMR67kUGdF+DGq0u3UG3jQYDeYBZwm1Q0/2tr3aTE
         w0Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWf2nfdEoOb3A8ieoouEDN/CcYlcWMmbKF6nDWJiUal6nEtkGIASXqLupkiQeGF6yerRaJL4dUP4hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZi8Q+RWHkSIUGpnz+7Gj1BM/LgQNDHS1LheX1IxhVwdlD4Zn
	fFwS0Qn888ZG8Ye79T1mMGeJCB8vu5fBmJU9jggDY0wq3fazN+B2VXfUv/UH+Os=
X-Google-Smtp-Source: AGHT+IFj6cn2VhPIBLzycX7f8yDdpZxCP0fnyLUp+RAmxAnbmLYkKHqCh+9DjZxSWH8mgvyVVR5CDA==
X-Received: by 2002:adf:cd0d:0:b0:371:93eb:78a4 with SMTP id ffacd0b85a97d-378895c5b22mr1505513f8f.9.1725621778667;
        Fri, 06 Sep 2024 04:22:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b34725desm18835563f8f.81.2024.09.06.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 04:22:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 18:34:40 +0800")
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
	<20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
Date: Fri, 06 Sep 2024 13:22:57 +0200
Message-ID: <1jjzfpqb5a.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 06 Sep 2024 at 18:34, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Some PLLS with fractional multipliers have fractional denominators with
> fixed values, instead of the previous "(1 << pll-> frc.width)".
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 8 +++++---
>  drivers/clk/meson/clk-pll.h | 1 +
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index bc570a2ff3a3..a141ab450009 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -57,12 +57,13 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>  					  struct meson_clk_pll_data *pll)
>  {
>  	u64 rate = (u64)parent_rate * m;
> +	unsigned int frac_max = unlikely(pll->frac_max) ? pll->frac_max
> :
                                 ^ Please don't play with this unless
                                 you've got justification a for it.

By justification, I mean actual numbers showing the difference it makes
and not just for the platforms listed in this series, but all the
platforms supported by this driver.

> +							  (1 << pll->frac.width);
>  
>  	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
>  		u64 frac_rate = (u64)parent_rate * frac;
>  
> -		rate += DIV_ROUND_UP_ULL(frac_rate,
> -					 (1 << pll->frac.width));
> +		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>  	}
>  
>  	return DIV_ROUND_UP_ULL(rate, n);
> @@ -100,7 +101,8 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>  					   unsigned int n,
>  					   struct meson_clk_pll_data *pll)
>  {
> -	unsigned int frac_max = (1 << pll->frac.width);
> +	unsigned int frac_max = unlikely(pll->frac_max) ? pll->frac_max :
> +							  (1 << pll->frac.width);
>  	u64 val = (u64)rate * n;
>  
>  	/* Bail out if we are already over the requested rate */
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 7b6b87274073..949157fb7bf5 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -43,6 +43,7 @@ struct meson_clk_pll_data {
>  	unsigned int init_count;
>  	const struct pll_params_table *table;
>  	const struct pll_mult_range *range;
> +	unsigned int frac_max;
>  	u8 flags;
>  };

-- 
Jerome
