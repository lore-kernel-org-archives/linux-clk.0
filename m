Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5C51465AC
	for <linux-clk@vger.kernel.org>; Fri,  6 Sep 2024 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605912; cv=none; b=UxcbEiVJY7E2i1D+E+LqCQPZhz6/y6kAkGMxPxV9LUwpNJWd6FfoR129F0gNwpkHDi6bdWdIbGLWjGDUz/7LgSGX4/URGKzoBAi99ldNkCRBw+fTLCJ1mN64PCtSVfERXX++hmrat1yy145cuD7Hc6rgMjO4tVGV6UdsehMdREo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605912; c=relaxed/simple;
	bh=MrUJLJe77lTwJNI/F7ntnLZneKog1thDzZ87Z72CBKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mvsrGnqTwHAQksVpIW/0svz8v0syl8L8eMO+6g2ja/dyxH2qaDVEU1zErM++f1RRF9kbLqa9ngZ+zXAu3ek98ZQv/zXXzinwHh/Xoi47GUtF10YDWHc29OuydmPbevO/i8HK9eNcdSm9lUzvcvbkp6aiKjzo5v3wzDWY4QLxLXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p4ag2K48; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p4ag2K48"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42c7a384b18so13153715e9.0
        for <linux-clk@vger.kernel.org>; Thu, 05 Sep 2024 23:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725605905; x=1726210705; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix3H5f1VUNP2HoArupSCtbBV1RYMrnCibJgmIW2VIQA=;
        b=p4ag2K485E+vHmceRt9fDtLz7KfkZnIjWJGpzMMHqIiqkKvQD3FUVkyCpFHdNkq4ID
         AvzA+6fe48dwN6UvfuYAbBJBOdjJLLEFoMYMNtUwN/xrIf9h/iWm8Eb3UMYgVcJS8XVL
         YsYkacAbDbf1Eouei56mX+8VADdDfURVnNAZ7VUHpjDddTyHWh/114I325uShpW4Dknt
         tVRsnksfSHYr/qFH+jlg/wFo/phWMbNurqVB0RSSq2sW2ryd+ha51pWRs0bfZl1XFYDx
         WSbUcW2jFnhSpYmwSXKGWZp5paBdvcCvNhoQVL/E7mwqUGwytQV5GtO+y6Xlewa+9fvX
         MQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605905; x=1726210705;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ix3H5f1VUNP2HoArupSCtbBV1RYMrnCibJgmIW2VIQA=;
        b=wn1F/csYiFhEdSrSfUvOYXuGsUZ+7xWXlUZikkntlQogmhs4Jb58Evc8faE4pVfblj
         rn+xxb9ZrbjFoaMvoAnXHND8vWXAulb3QH8+T8tTxOK5uwCb3g5Ckru+SPWpPA8N9eMM
         qUechlM5wcGutvwx2fX01J9BqSeeK8WgAGg41hcyp0Vlzatv0xj/Nd1rZ34wO5gduseI
         dgnrjhn+jNcGK843m9lILsxZczLjw/JrlKjCEM2Tdyfp5rRoZEzg4Za56YHrxIqIoMAz
         h2Ei3LHP6SzB2G5qTQHnQFKcTKMd5S+/6Ul8mKt8ukFEPBsWAlk6xjLbb/dqmWVmDQoP
         9JgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9a3dN2x7B7PyY5wgxZM0/JKwbOYc+/JzNWivgLpWNRmZB+UjEp6I01FC3nlXG6ss4tVeRD5/f0v0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4FOHVEZOiJ7f/NGqiqmnYXEHmQF3wFzJKSmypDclbqnI08uK
	mcwAGeaGXty6y0WnyhILPsLfnaTnKLg0hWmes63/cBKRLs+NsvVQL1AhtZckld4=
X-Google-Smtp-Source: AGHT+IGRqDKkE0IR4DNooBH1qA1IUgx6jQLK/m12iWtXvY9LxpMhMFNXKtqOkdjlNyX16vc5mNGEBw==
X-Received: by 2002:a05:6000:507:b0:368:41bd:149b with SMTP id ffacd0b85a97d-37889612a68mr849398f8f.34.1725605905322;
        Thu, 05 Sep 2024 23:58:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b9859486sm17815559f8f.111.2024.09.05.23.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:58:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: meson: s4: pll: hifi_pll support fractional
 multiplier
In-Reply-To: <20240906-fix_clk-v1-3-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:35 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
	<20240906-fix_clk-v1-3-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 08:58:24 +0200
Message-ID: <1jttetqne7.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> The s4's hifi_pll supports a fractional frequency multiplier, but frac
> parameters are not configured in the driver.

That should probably have been sent separately.
It's about frac, yes, but it has nothing to do with the issue described
in the cover letter.

>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/s4-pll.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index b0258933fb9d..a97e19057b05 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -329,7 +329,6 @@ static struct clk_regmap s4_gp0_pll = {
>   * Internal hifi pll emulation configuration parameters
>   */
>  static const struct reg_sequence s4_hifi_init_regs[] = {
> -	{ .reg = ANACTRL_HIFIPLL_CTRL1,	.def = 0x00010e56 },
>  	{ .reg = ANACTRL_HIFIPLL_CTRL2,	.def = 0x00000000 },
>  	{ .reg = ANACTRL_HIFIPLL_CTRL3,	.def = 0x6a285c00 },
>  	{ .reg = ANACTRL_HIFIPLL_CTRL4,	.def = 0x65771290 },
> @@ -354,6 +353,11 @@ static struct clk_regmap s4_hifi_pll_dco = {
>  			.shift   = 10,
>  			.width   = 5,
>  		},
> +		.frac = {
> +			.reg_off = ANACTRL_HIFIPLL_CTRL1,
> +			.shift   = 0,
> +			.width   = 17,
> +		},
>  		.l = {
>  			.reg_off = ANACTRL_HIFIPLL_CTRL0,
>  			.shift   = 31,

-- 
Jerome
