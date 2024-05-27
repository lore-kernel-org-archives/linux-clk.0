Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290B16D32F
	for <linux-clk@vger.kernel.org>; Mon, 27 May 2024 14:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716820687; cv=none; b=BMgGyqJG3pSjBHwt+nVmnKTFIhZQiGQVPnbVrw6+R9VatCRuwxXXbrgXSmIfPFqck28eHX78pKWZrRqLCvGwOjP4UCD1+J5/gk2Xfjn8jVaz/BJpba7uEpNzTLDSp7VvNSX5u/XogqCZWV9xpZaDe51a/ZB+5ZoK1t9CpTCoMnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716820687; c=relaxed/simple;
	bh=TsORAf+30DK49YwxeDsXCfFaQYfYRcUm4oGKDiMwiIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOMgYYVB1BzS8n5O13rODmKI3sx9mBR1MgZ4ZA9BEs1LMtrhP1eSr0HFGoD2i1yUCqzjcHUCrlDoN4WBOkHRB3PQvjw/PKCbE/si4JpSp/3ZwRcZfTmHg9XtRFMbhecpjApvRS6ZBdGxRdKvJiqAw+adftyINIgORNslv/qAo88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DPuHgg+4; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DPuHgg+4"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-df4df150f29so4747257276.0
        for <linux-clk@vger.kernel.org>; Mon, 27 May 2024 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716820684; x=1717425484; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TsORAf+30DK49YwxeDsXCfFaQYfYRcUm4oGKDiMwiIg=;
        b=DPuHgg+4KYNWgq7fqY/iFCm3R1+zkrtT3WVhwz5XfVtHmbGcdwr1y7ltnmbWu74aev
         f8t6wAdtq3CMWCgh/1UfGv65PaDwGHiQuuz7qO0JNXLaALFq7zVQhnB1kNnkTV9PUmmu
         M9BL9m+WL0VE9Qz8PSgmkY3WpbvKe8oj+9pnRsnwmMlmuD/h7VtZRDbgWfbC78LHY4qO
         W2j2+JPRWk1zDKAYz1QcLP0cXJ59RTEKX7kod+RtkWxL217Ut1dc3w7s94HKyhZg58uh
         wiTZTJyWvjppGdncahdFWW189eVr4qDXHVmavrzQHqqAI/4tPNeRlfFDeJow4DuOstRF
         FEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716820684; x=1717425484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsORAf+30DK49YwxeDsXCfFaQYfYRcUm4oGKDiMwiIg=;
        b=lYi9N5mytrquTYeLlscrRajo0ptAsdpnw9LF8DHCFwf8C7zVseceBGnEww5aGIINUc
         Ldfc1l9wcnRauyPnjMuZEWYJEblcskKJYXTbMWEx0pok/iNcxfRaRVmSDjwDmxQkn7rz
         wbGG8AUVkzu+yfvbEwb9LIEU43IzpCIbCOrYKAUkifBc8m42NqZZX4e9dqRzHCP31WuI
         9iglQ5bhSfE2jh78bCJVaI/i7A2ADZOoXaVA8q/LNdPgq/Ccb0e9H27LkgbfSubUJj5H
         jQfYqud9hV4ogioj6opzN8R0tv6kAifp06HaBLAdkpB+WrdlE2A6cOeu+E4a41N7s2qM
         XjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqCfjR3gAit3x9Cjlm3zVwG/jrF+HSHuomuTv1H5/I1zPuk7sqK2MHgHZg16K5j8QOt+InKA+opFkdMyv15J5oLh8Vk4JN9eFB
X-Gm-Message-State: AOJu0YyGgjTfiONSjKupGsP4pl6d5SSmGTqh9rPwxEo63IDft2D1Qhl9
	q16ibj1X+RKMG5NPgAPE6tDQG+b5wh+gqGMypS4Yb92bX1w+ixOgye/GTY48NzHzTz1Dnjap/6n
	0zD4pbrhmbfYxvLbFKcii4FTHLcHP/JRDdOAtxg==
X-Google-Smtp-Source: AGHT+IEwTZzUZTnOFyK1J+Cmkx0U06fySsAKy1c+9/Zyl9b38yE9jX5xO+y6/SfRx/NvtCMT1w5cN419DuraUe6mJAc=
X-Received: by 2002:a25:ab8a:0:b0:df4:df29:bcc6 with SMTP id
 3f1490d57ef6-df7721a2897mr8786729276.31.1716820684554; Mon, 27 May 2024
 07:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com>
 <CAPDyKFp4V8f0iyeRASSEu4YaCSz0m56=8ssBJ9ogSvqG1dzMZA@mail.gmail.com> <a04b3939-081a-49e0-a063-5b50d3321ca7@sirena.org.uk>
In-Reply-To: <a04b3939-081a-49e0-a063-5b50d3321ca7@sirena.org.uk>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 May 2024 16:37:28 +0200
Message-ID: <CAPDyKFrhvB9bXiuQS6QKd28S2tOu7WJ-48qHP7KEBTpE8SSi+Q@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: imx: gpcv2: Add delay after power up handshake
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, heiko@sntech.de, u.kleine-koenig@pengutronix.de, 
	geert+renesas@glider.be, rafael@kernel.org, linux-pm@vger.kernel.org, 
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	shengjiu.wang@gmail.com, frank.li@nxp.com, mkl@pengutronix.de, 
	linus.walleij@linaro.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 May 2024 at 14:49, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, May 21, 2024 at 12:22:41PM +0200, Ulf Hansson wrote:
> > On Sat, 11 May 2024 at 05:15, Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> > > The BLK-CTL module needs to add delay to wait for a handshake request finished.
> > > For some BLK-CTL module (eg. AudioMix on i.MX8MP) doesn't have BUS clk-en
> > > bit, it is better to add delay in this driver, as the BLK-CTL module doesn't
> > > need to care about how it is powered up.
>
> > Sorry for the delay!
>
> > Applied for fixes, thanks!
>
> I see this is in -next but mainline is currently broken for i.MX8
> platforms - could we get it in for -rc2?

Yes, I am preparing a pull-request as of right now!

Kind regards
Uffe
