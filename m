Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B0829DB86
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756110991; cv=none; b=odeezx4tctR3AUIKn8+KsZ+an4IOCur4yZMH9CCyEvwqyc2UIuN8IF9QriqGHhRhCwNLPw8se0t/TeKd72BXy1QhR5KFUQgzZ/m2FCo1LA1Bpkuzy6ngk4VvUPv9bNKlN/Yr06echpYhXyV0MBlYGLCiBm+Hun5NqaYsz94aMbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756110991; c=relaxed/simple;
	bh=yEIYjWl6ezBClWzYKCGr5752vL7ppckrbHSq1WORKUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A+Z41E6NVzPI4Ff0aJS0FSziD/RgpEvg6V859Nud5094aLfycfaX3w/ckwXcwD+UICJsMVvNqOZpZh/DBx3WtPRmv3AbaEKscc7rmKqmuh5/oELR5g4n6akXcVKwYX8e15wlzTqMNS+YKtzmfd2C+H1+AwXUmr5fEwlmtMPCaWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FUpEX1aA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FUpEX1aA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so21812135e9.2
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756110986; x=1756715786; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=;
        b=FUpEX1aAKSNcHCXt3khGfAz+rLqvRSUZ6pui5i2UTtnM0sSyIeB9g5ydTRErxatRuU
         IlZZjY6Pvapzv+crsCnvMAImPionUmBLjBN+EPIJOgEy++gnBk494T0y3q3vXde3/z6Y
         sOPeiZKCT/1daRuUmBShyzXnbDByhvluc0Fl4DFORdUhOruGC/Ih2fOk/cO03sal78Ms
         jEPDgpJGnZeKAxpxqQrGN6YDvOygDN5hCDoGVU+YhYhfhTJcXUNazH/09LAzxwpZlrV6
         DzML3flc41ZNNHOFKTYpA5nUTnsYB1oIjN93zaXHL3KxNC7NWFFKahOczGj/Q+ICo7b4
         zcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756110986; x=1756715786;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO1+IS9STBCj34Lw+wOXXrOpWS+ZkYDToI4PIiLJ9vs=;
        b=Uujs+M98XGkVTYKrpNZMGXwdQxrDrp6HhoCTch28IJHLp3Zc7I4MlV06BW+0/+RPhO
         znvHOc89keCs905QkLvNqaTpVpbMNsC5Ko6gpkvnmPow6kjku82AUNYbleNE3P11M2CQ
         y5/HT9sEUCsA88Wzr3JaAAGDgTEU2sonetcYGV1vCrQ9MQdKfHfjAwxj3lznkJ9gx+Tb
         1HV5YAepghRx9w9Wj2nsO0Wo3EdZrVXg4mJfPriBeWQuQnRWMObI979xKLb6vSBHtsnd
         YYwh830u9zTEKFsjkJDSbvRPdxo7HgQt5uenBNCljKki1MGNg9WIxFB89mjnNRP9XqBR
         RnqA==
X-Forwarded-Encrypted: i=1; AJvYcCVAT99n1ucMLOBBORN64zDSApnaFEiuX1ERUvSaK41VY0OgT/kSFzl/5uDvTUedCXUFg8Zn0EHAyko=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsvCUPpTa8EfPW39u5w1H9DIanTpVTzVp1uR6I1uMFA04md4kW
	0gmF0jVdvDDk526C6XIUggefBOXO3Dkkf1rB9w6bF5a7aa6I4yyAfvpQpC+rOvNI4HE=
X-Gm-Gg: ASbGncuVVp5Om2w9hLpOYnfABzX4aC7lfQqAGT0rUqrWtcNm66x+3O3h/PK5oecjPCf
	GbNpvSaPkpCOIfc5ODAHg1MJuUR4jsks9k0hQ3Z8rn8KSUDr2tAk1bwQLCTd9xenUKDHCNfN2+5
	kVLX7HXbjpqvK0uotRIlgSFMhkqIoMCJVrFo7UAVtatBae+3OWoVjbIgsATJFhtF3Tj8vrbTf3Y
	XtR0cOdh62HLT3GJ/+6t/plYwhvdhtlQS/IqIRXHQk/ArFg9W6gxm/wrFkkAx9kWrovPh0WKlns
	L5e1wMAtX288hdcqHTimMLVPjCWge+b8ApLSon3cYmRMuo5Y291pxYexvNOGzJSRjhZFutZsotB
	8m9hOsTFj4CVu2nSo/jBXCg==
X-Google-Smtp-Source: AGHT+IGiamtdsGY2kDX6w9f/mzPofYs3vSisqz5ZM4c90dOvsj+B0bgxdt8+7FzKKa6/ub2RebLE1A==
X-Received: by 2002:a05:600c:b8d:b0:459:e35e:a90d with SMTP id 5b1f17b1804b1-45b517c2eebmr91517135e9.27.1756110986280;
        Mon, 25 Aug 2025 01:36:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:af88:b6ba:23b9:97e3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b5753adf7sm99733285e9.7.2025.08.25.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 01:36:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jian Hu <jian.hu@amlogic.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson-g12a: fix bit range for fixed sys and
 hifi pll
In-Reply-To: <20250822002203.1979235-1-da@libre.computer> (Da Xue's message of
	"Thu, 21 Aug 2025 20:22:02 -0400")
References: <20250822002203.1979235-1-da@libre.computer>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 25 Aug 2025 10:36:25 +0200
Message-ID: <1jcy8j6bna.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 21 Aug 2025 at 20:22, Da Xue <da@libre.computer> wrote:

> The bit range 17:0 does not match the datasheet for A311D / S905D3.
> Change the bit range to 18:0 for FIX and HIFI PLLs to match datasheet.
>
> The frac field is missing for sys pll so add that as well.
>
> Patched:
>
> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
> 996999
> 500000
> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>  hifi_pll                      0    +/-1562Hz
>  sys_pll_div16                 0    +/-1562Hz
>  sys_pll_cpub_div16            0    +/-1562Hz
> + sudo cat /sys/kernel/debug/clk/clk_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>     hifi_pll_dco                     0       0        0        0
>        hifi_pll                      0       0        0        0
>     sys_pll_dco                      1       1        0        3999999985
>        sys_pll                       0       0        0        499999999
>           sys_pll_div16_en           0       0        0        499999999
>              sys_pll_div16           0       0        0        31249999
>     fixed_pll_dco                    1       1        1        3987999985
>        fixed_pll                     3       3        1        1993999993
>
> Unpatch:
>
> + sudo cat /sys/devices/system/cpu/cpufreq/policy0/cpuinfo_cur_freq \
> /sys/devices/system/cpu/cpufreq/policy2/cpuinfo_cur_freq
> 1000000
> 500000
> + sudo cat /sys/kernel/debug/meson-clk-msr/measure_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>  hifi_pll                      0    +/-1562Hz
>  sys_pll_div16                 0    +/-1562Hz
>  sys_pll_cpub_div16            0    +/-1562Hz
> + sudo cat /sys/kernel/debug/clk/clk_summary
> + grep -i '\(sys_\|hifi_\|fixed_\)pll'
>     hifi_pll_dco                     0       0        0        0
>        hifi_pll                      0       0        0        0
>     sys_pll_dco                      1       1        0        4800000000
>        sys_pll                       0       0        0        1200000000
>           sys_pll_div16_en           0       0        0        1200000000
>              sys_pll_div16           0       0        0        75000000
>     fixed_pll_dco                    1       1        1        3999999939
>        fixed_pll                     3       3        1        1999999970
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Da Xue <da@libre.computer>
> ---
>  drivers/clk/meson/g12a.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 66f0e817e416..f78cca619ca5 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -157,7 +157,7 @@ static struct clk_regmap g12a_fixed_pll_dco = {
>  		.frac = {
>  			.reg_off = HHI_FIX_PLL_CNTL1,
>  			.shift   = 0,
> -			.width   = 17,
> +			.width   = 19,
>  		},
>  		.l = {
>  			.reg_off = HHI_FIX_PLL_CNTL0,
> @@ -223,6 +223,11 @@ static struct clk_regmap g12a_sys_pll_dco = {
>  			.shift   = 10,
>  			.width   = 5,
>  		},
> +		.frac = {
> +			.reg_off = HHI_SYS_PLL_CNTL1,
> +			.shift   = 0,
> +			.width   = 19,
> +		},
>  		.l = {
>  			.reg_off = HHI_SYS_PLL_CNTL0,
>  			.shift   = 31,
> @@ -1901,7 +1906,7 @@ static struct clk_regmap g12a_hifi_pll_dco = {
>  		.frac = {
>  			.reg_off = HHI_HIFI_PLL_CNTL1,
>  			.shift   = 0,
> -			.width   = 17,
> +			.width   = 19,
>  		},
>  		.l = {
>  			.reg_off = HHI_HIFI_PLL_CNTL0,

Thanks for this.

While this is indeed the same topic, this is doing 2 things at once.
Could you please split this, fixup in one change, adding the missing
frac in another ?

It is much easier to handle in case something needs to be reverted.

-- 
Jerome
