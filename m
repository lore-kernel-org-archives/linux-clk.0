Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E1828FA89
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143774; cv=none; b=b3rBuxN/rn7pdDDmgdNTcqFxRsfD3U+vJo+iu6ZhaArRgava2MA1FCbCoTqsI7Js/qMkGzg6vVJbcrfx3tVljwPPU1mgoTsH8sZLs56+ZtoylBa08qTMYHshAImf96qpG+7xKyUvThbKRdwm0LeOIYNuLOHiEfBWllEij9+mLrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143774; c=relaxed/simple;
	bh=cXtCqNVBtfHAR3Wz41FoENDIF0sXd1+ZLkqfbG9Hmy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEoRiO04Y02epqOwmgl9NBisCEIBZCp98/VfJYqqbATfkZOnQfD26I9ZnqwzYE5BHuZueIpK49uCkTdD8DL94BDtkZoC1aY+xUnFlj0C74b7CPk/fjZFGE4QYy7l08Jb2Z101jwtckFgvGkByFU6kzdsmYnzOiQmTX1Hh3XEIps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ORnehZRE; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ORnehZRE"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fc5bc05f99so10836473a12.3
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 06:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747143770; x=1747748570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K9aJRU5NnMYxotDGMJbw8Txya51AKLb246t5s3qUk+k=;
        b=ORnehZREY8Ek0ANnXDuft2QyzjybT4f2S/Je3RgZRb62Xl71eSlZEpskd99wWCu3TD
         6aB0yrc6+Ht+rPYVnqw8TOb5f+zLjqxBDwUxVAnzhF24uXuD/jnun6axLR+RduDnJgAj
         GoqOyZ7oXEJUK57lJoCnsfaVAUI+YCnFz3F9H0E4FsDvK7ispagAKdRqT+cu/KxAGDJX
         KTK6qfxzz14GwyjDvDxru9NLPQmFiFQdVtBEE2Wzu1PmCX7qQQk8e1q/fJhfCLHuuSrV
         ebiGSropFk8EDe4ig4HB3C0au+54v34mUYFjXNR8TBzSacCw7jibYGHw/HgwVcNUEs+W
         kjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747143770; x=1747748570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9aJRU5NnMYxotDGMJbw8Txya51AKLb246t5s3qUk+k=;
        b=EGD5IwHWw3ERO3iP2mj9RTFYSIQ1aUbF62OSANmr5sK6fXDoTwN40R14RR6bUy4XXA
         MOPkSj1cdXahvDml8st9U42qA1qtVQbFI1K5mxiw6ej9XBItL1/6y+xFI+EZfzKkd3kp
         1wET1QFZjq8tYQou9XAzuadqzVhHX7zWW2XhBTfeLXQPE4d0d4GeFfxUE88TWx8opbuL
         iHVTU+X/EOyvDwmuxtg3iAu7/4siEYj5fEpBiWo5pAY5IokXVHcU8xlZ/Z7XsL8xRk5s
         8QN6JYaFR2+f4ytMvubdrrxPEELTNlc1xf7h1wc5HcAld8WkBDJ6ZohHfyTXHiSDQff/
         iTzg==
X-Forwarded-Encrypted: i=1; AJvYcCUbbf914uVqo4g1aJGCfM197dbkkNiTE+e/h1Gq+P9Z8TEI74trvIGUO5E8gzZdaZ525O7oMAr7Mnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBoX5w9uPbzU1sg7lGeio0z4pY8OfOwi1FR6qJs8J1uwvgY9na
	hwaxEOPSOknY5rq838agRqUPCpI5KgKdhKTfrnrmof1h4gC/DELHHKrWJqbqVc8=
X-Gm-Gg: ASbGncuhFT7c5kcGusW4bLGjfoOA8PpXxjGp5umBcFXsdCgkz6koQMPv+6aQL26LICs
	14zO0rynpETAco9OimiQJ8/rwGJzPgcoDWe2xQL7rp1ESjGcC2W1SB4jc6FST+y3o6o5SBG0b28
	RCLC0xxVclzqc9gOTL/QsuYT9evrKiCkZpXtK7CC8w/c35pY0n8T27u49rZC14AhY/qJ1xEewFu
	KjuQfA7aP7F2EHvR0iF9scsSeDOKjwJze2xKbop5iuZuiEUdKoWUXEddPtck4vt29aAtZFG7ZQm
	QRouXebCjWvdANgL/6TILagplBhLKGnk1/b6iEepZomwEw/g
X-Google-Smtp-Source: AGHT+IGfQ6YvcHSNfv2dnuJBtshq2DA0StbbcUkMKGymnYuscXLUWxhwrxXFZ9g4zAoXPV49pVkndw==
X-Received: by 2002:a05:6402:354a:b0:5e5:bb58:d6bd with SMTP id 4fb4d7f45d1cf-5fca0759a40mr15005682a12.10.1747143770505;
        Tue, 13 May 2025 06:42:50 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5feadd3957csm2485544a12.67.2025.05.13.06.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:42:49 -0700 (PDT)
Date: Tue, 13 May 2025 16:42:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] clk: imx: Updates for v6.16
Message-ID: <aCNMWP1MF2+ATdgb@linaro.org>
References: <20250507123528.585447-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507123528.585447-1-abel.vesa@linaro.org>

On 25-05-07 15:35:28, Abel Vesa wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.16
> 
> for you to fetch changes up to 6a55647af3334f1d935ece67de4a838a864b53fc:
> 
>   dt-bindings: clock: imx8m-clock: add PLLs (2025-05-05 10:48:56 +0300)
> 
> ----------------------------------------------------------------
> i.MX clock changes for 6.16
> 
> - Add video PLL clocks to both i.MX8MM and i.MX8MP
>   while dropping the numeral suffix.
> - Add imx_anatop_get_clk_hw helper
> - Add anatop clock providers for i.MX8M[MNP]
> - Drop ccm_ prefix from base in i.MX8MP clock provider
> - Document bindings for PLLs in imx8m-clock schema
> 
> ----------------------------------------------------------------
> Dario Binacchi (11):
>       dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>       clk: imx8mm: rename video_pll1 to video_pll
>       dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>       clk: imx8mp: rename video_pll1 to video_pll
>       dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>       clk: imx: add hw API imx_anatop_get_clk_hw
>       clk: imx: add support for i.MX8MM anatop clock driver
>       clk: imx: add support for i.MX8MN anatop clock driver
>       clk: imx: add support for i.MX8MP anatop clock driver
>       clk: imx8mp: rename ccm_base to base
>       dt-bindings: clock: imx8m-clock: add PLLs

Hi Stephen,

Please ignore this pull request. It currently breaks everything: ABI,
build, boot.

This patchset will have to wait until next merge window, at least.

Sorry for the mess.

Abel
