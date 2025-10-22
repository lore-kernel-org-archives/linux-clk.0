Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D6833F8D8
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134265; cv=none; b=Xm0bbUn6ZRWKLzXlMMQ9swd2k5Cw7RWCnmayuO5SNwPXn/xecVCY+YC0XgobhS3SSdPu+n2Gw+DahSWwhFzf8U8h602FMzHV4HpZBpA935YbV9NiNu2GiwyG2MCInPw71ztUdMC1ErfipNyW+S4D8UCoqyjBRwGJPK+oO7ai2nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134265; c=relaxed/simple;
	bh=8BaPCfQX7vMiRGCgF2IvivSuUs/Be4XjQvQi+SyJU6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tTXMKUmb/vrvZHL+Lw5MZGkx0X4D/J96Sc/Ob4Pfxyh0Mdj17xnX9Ol29t0stjOgtMM6ZBTVroVAU3GMiKAI+5IcXe3aTcJpx9qPrAQJaZuHnzftkc1q2ir7wL3p9lmQ5jXWm4nKiUbA47Oc7A5+H1VO0XyGZEXjTUK0xwH9GRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KGcrgbF/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KGcrgbF/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471131d6121so51572505e9.1
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 04:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761134261; x=1761739061; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvWvVWsMp2HvZc/pRVfJNYeSWgEzu4aPg/sGoBmwFsM=;
        b=KGcrgbF/nxXSNFBtJQd+KbXkPWyf7y2INCIFWkWDIHRbCbj1sFryx8SIUwbbvbrjMF
         GabrLHd2SDU58Gt4I/bFPRUDdztxSKO+BB+x+3mTcHrvbz0BtU3epjqGox74XCnqH2/S
         DFU4TMQbW1QGsOmJ+HpFt0ssk/9BljaFsdbiRhIQD7fj0ignx9zEk8/Ym2fzGDg5vbgg
         TKc1x7mCITfTU2u8UtfKDak/MLJYL4Ijhwh/tK+xuHtGGR5Zp2bYIuPP7Vnro5nbOWTP
         FJhPHvK/cjuhdGI5rftV5euGZkKLrfFiKzmALQABVUYZTI3nOM5zLflM/fCWniqBXZlq
         zDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134261; x=1761739061;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvWvVWsMp2HvZc/pRVfJNYeSWgEzu4aPg/sGoBmwFsM=;
        b=QNCc3ewIFlk5i0cUp4dyRPJbh71/3aAPVir7BU7HW5m0oUpplI/ElAfDZDtOEwp0ZF
         xO2suyTN7aZaAn6L4Il8/5pZDhH/oT4C9Z561dhEOcNtkdep+CyKGedqT6UOZXvRfSwm
         DWuYzOHCuPf7w1TpkBdRCvlau7eg4Yt9m03uoUGc7zCrmsUxDM4AFLHX+u8ZaDsXsXu+
         a26zLfKOD7T+j2AbpUkUzDAy7z8FGGrWgu5+9B44rHryGyQXSlrIzq2CJpEHu2IaZYSo
         7QxU/vP8dXpfvrPKbWXKZlx+BwUZM3xlO4JOErHYQlDo1U3rTgW6zf2KJnU9i6dsphhc
         186Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1VtFNnBxn08SW31v/ZXn+em5e6PmMPKOx08RIEE9hNH5r9DRYZ1ca9PZyua2plTJWMKE1v0ordvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhaQpsyjYiYT05Lj2ETCVZjQV4kZAHu+ZYGPbvkSt5NDK7H3eq
	5snsOCUKIg5NPolZDn6G2exNEyO/mLHzFSxmqlklYzPZ4xKDKqwAg2nGZcYknOASKEE=
X-Gm-Gg: ASbGnctXLnwdfhVqblFcMN1UtubrzsYNS+Uh4ko5YKDG2QpK/Elwo+RYH5tFc389P8n
	GUCQdkOVICW3FEiQS/KDMJ5lEPZvFKyvCQkDatccmtAw8Co2QCye1Y5+xz71f8tPu4JmZE4cYsx
	OgfikzeX7p82jMqCAEVdW/j7sV83wRwhMITx2BQi2pWm70rrFQ6VZAfqs4ZK+LC0ce8mNI9IKTK
	KVIF/QJaVLWz5ElaAMR/OYwyGri9JQYzdVT5wDVlDtp1ZRD4swl2uo4I4Scdg1PpsUrr8xTgt4p
	VA/Xhidunpp4QNBjHijHO4jlyt9xk0glGntWVruVlMq+t3CEyL47PWVn9jJxFYzS3r7HYa/+mkl
	mA/YM0fTFTssHipr+eSsOGFFdfuPbORe3G4XivUf1x9FqZdxDHk8bUtmTJNOXbf+LaE3pE8d7D/
	joDb/npHHhMg==
X-Google-Smtp-Source: AGHT+IHU1kUQ/j+2c0DWldc7DeJQPageEV0i7vez8IloaeUnW6bD/qTCz4m2QvWTUpZaGhquDY3CAg==
X-Received: by 2002:a05:600c:6385:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47117912365mr156602265e9.29.1761134260710;
        Wed, 22 Oct 2025 04:57:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bdae:f4f4:58be:ea26])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c42d9524sm39570535e9.18.2025.10.22.04.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:57:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: amlogic: Fix out-of-range PLL frequency setting
In-Reply-To: <20251022-optimize_pll_driver-v1-1-a275722fb6f4@amlogic.com>
	(Chuan Liu via's message of "Wed, 22 Oct 2025 14:58:51 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-1-a275722fb6f4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Oct 2025 13:57:39 +0200
Message-ID: <1j8qh34098.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed 22 Oct 2025 at 14:58, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> meson_clk_get_pll_range_index incorrectly determines the maximum value
> of 'm'.

This explanation is little light !

How did the problem show up ? Under which condition ? How did you come
this conclusion ?

Other people having problems might benefit from the explanation 

>
> Fixes: 8eed1db1adec6 ("clk: meson: pll: update driver for the g12a")
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..b07e1eb19d12 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -191,7 +191,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
>  	*m = meson_clk_get_pll_range_m(rate, parent_rate, *n, pll);
>  
>  	/* the pre-divider gives a multiplier too big - stop */
> -	if (*m >= (1 << pll->m.width))
> +	if (*m > pll->range->max)

Making sure m does not exceed the maximum value is valid too.
You should check both conditions then

>  		return -EINVAL;
>  
>  	return 0;

-- 
Jerome
