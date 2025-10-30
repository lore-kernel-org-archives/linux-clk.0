Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D62EC54F
	for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761813152; cv=none; b=hKOt0AE63mwXpNqVOxqh/E88Rx46gF9aBSguQFGaGwY8wBcwT952mo4/gOk/l49xWCX008L+w2yfTOCW6KMfvh+yE+bbaSykWB7KEqKIlkC272v9q2O6uDvhq3tNKorul9M5ZJxNp/3hwYZaFB6UC2D74vdrDGYaVjN0Ub16lTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761813152; c=relaxed/simple;
	bh=zXxknCZ3U78u5YvcdxIZ6E4exEcYwT+ah1NLxftWHqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k4ufT8g1Yua4xyRhETpw0YqGNDjwZtz66w+L2d41VG8wI6KfttbFPVzsp2lwLKT5EyVdEiJEFkOCo3sSWEFQpmEW0kghD0OWEX1GxtxVb7yezGN+2DaQOuCld3oQst40VuRR/xPabx3cJNwkybDALrY8AVvIXgw/rd/193oOGaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VZ6uH/4r; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VZ6uH/4r"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso4919995e9.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Oct 2025 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813149; x=1762417949; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQpNXFj7qvzhx2BPwql3tijlryztnIxnxGrC8hqO70I=;
        b=VZ6uH/4r3hFaHl6qEn4UMk0HX5Cxsn63HkXqsJzCpoxo70fDNP7JMFrF/nO+DVmk7f
         1I3sh440RWcuu2gB1ovgF2DCxZfNbzjrJNPFUN6eVSXIdROE1wpdixBtM1DWzde6dSNT
         m+fhBOGpga89SUPv9C3quXnDxVWg69hWRTB3BXcQb7kAHvlctKAWl/5aeKdXuTQcaJdh
         STa+23BOGzTM6AqtWapt0nAVMIlwa0GPGuyv+0hBCO970CEu+MAxpviXON9w/cAX58M9
         lpu2UkYwZmXcwerzbKRRniNYjVzpOfUZJ15Bn10nHZc3S429+cGnuDW8OuLX66y0+frR
         6SFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813149; x=1762417949;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQpNXFj7qvzhx2BPwql3tijlryztnIxnxGrC8hqO70I=;
        b=Y6aLnanmxTIsWLKuIpflN5nS36tNAeJXCHYx7M/r4YKJsne+dJu5XBOwmTCTwUQOY5
         DfZJH6He6JvWcLTJG/RYOj9SmfmFdIeIwRgFH2TUS4GTVEOsZ8WUBQnx4YoXXgO6mPl/
         OJRiHCozn87msmHsRk1V9LOVjEs/iQ5b9lr1xl07U8ZaJczzFuqZuLRX9Gn3CkUHOLjr
         AnBt4kZCQzPDqYqU27kklDeHRxrU62yiAIaMI+/D8GMtkZHTzZJF1NhC1LVmw3Sy2SQE
         TDwX56XhSKBof68IE0AGzy6jtTlzc+PyYo6JTwm7gsZ+l/DNNHQ9PZckaqtbx4ev/6li
         jtyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuuhgxQX2VDElDU6mbkoDsxRCsYyIOlI9tbDtIPdOPfhHz36yZ1Aup95mDNruOEm520zDzThtIraA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DD9tY9WTDJsCCHjwQg+CGT5LmNvQ9UDG2WhZHeJq/y39GA+i
	AbzHYs3s2NZyXP/rHDX5DI2mvnfHF4xob+H1Woj4eDzktTKp/cMwLP++ii/Mn3mMmco=
X-Gm-Gg: ASbGnctFgkxVZTXC84YGmECtAfd2sjNnY0re1sx8ABxCir2KbZHSM/q6OocXr8vUA0k
	1/ro5GgSuIugxtzYUvXhBcFYq4Av/e/MO4g43tobqZIHSu6RMExLXq+cV2JdXA5/4ci6IZ89b2c
	wyMqwhHN6OVq/bcxWXVctJ4Rg30ADmopPmOG3xIt6URmUxw0id8bjQ+iuTDL+lbLOtEwps4sSgN
	2jwWTYq6sR3Du2XFrqHfbGFw9quranLoJGmFrMuwy6KvyyMvzmxit2WwthCHG1wIfIOxB/7i5i/
	Bh/SgCrtmbAldbg27BqOEz2kxcujQLZClnPWLtraAheGDLhxowYYHcLdzpfbSiyaAVJjx7SosWj
	o9EnYWbLwg+FfFG22FpZCMho5kYm3SNiFKlHFl6Z0wemmzHT+1zyvtaj8NfFz1yZOSp9qZnhJXY
	xA7/C3Vxz9
X-Google-Smtp-Source: AGHT+IF53HCqpWXmn28GEFR5xxqhKQykU6oDGofkTXxxX4sugVLIN1Bm6oCHAyukU29ODdUC1YBslg==
X-Received: by 2002:a05:600c:1c22:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4772686f074mr23463575e9.23.1761813148710;
        Thu, 30 Oct 2025 01:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47718fc0335sm62830805e9.2.2025.10.30.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:32:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 3/5] clk: amlogic: Add handling for PLL lock failure
In-Reply-To: <20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:13 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:32:26 +0100
Message-ID: <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> If the PLL fails to lock, it should be disabled, This makes the logic
> more complete, and also helps save unnecessary power consumption when
> the PLL is malfunctioning.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 41 +++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index f81ebf6cc981..6c794adb8ccd 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>  	return -EIO;
>  }
>  
> +static void meson_clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +
> +	/* Put the pll is in reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 1);
> +
> +	/* Disable the pll */
> +	meson_parm_write(clk->map, &pll->en, 0);
> +
> +	/* Disable PLL internal self-adaption current module */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
> +		meson_parm_write(clk->map, &pll->current_en, 0);
> +}
> +
>  static int meson_clk_pll_enable(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
> @@ -397,29 +414,17 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		meson_parm_write(clk->map, &pll->l_detect, 0);
>  	}
>  
> -	if (meson_clk_pll_wait_lock(hw))
> +	if (meson_clk_pll_wait_lock(hw)) {
> +		/* disable PLL when PLL lock failed. */
> +		meson_clk_pll_disable(hw);
> +		pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
> +

This is something that's likely to spam, so pr_warn_once() (if you must warn)
and I don't think 3 "!" are necessary to convey the message.

>  		return -EIO;
> +	}
>  
>  	return 0;
>  }
>  
> -static void meson_clk_pll_disable(struct clk_hw *hw)
> -{
> -	struct clk_regmap *clk = to_clk_regmap(hw);
> -	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> -
> -	/* Put the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> -
> -	/* Disable the pll */
> -	meson_parm_write(clk->map, &pll->en, 0);
> -
> -	/* Disable PLL internal self-adaption current module */
> -	if (MESON_PARM_APPLICABLE(&pll->current_en))
> -		meson_parm_write(clk->map, &pll->current_en, 0);
> -}
> -
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  				  unsigned long parent_rate)
>  {

-- 
Jerome
