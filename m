Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4607A3750D6
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421987; cv=none; b=RyCuBuSv4aoSQKQuEaoBhlFpQRkz5rIcejfLjGMh5268gW3IrWXu+61D0267oZBvnNaBxjZ7HeUq3Vn63Ez+/BDqEXfGxvrb1W6nk/5cWr4yputyyVKXrSVk2nGN+yNayc0ZVKHlbu9Bk28Z431hgv1U4rZqOYqK2XSh1ACu4fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421987; c=relaxed/simple;
	bh=WFDqwfiLhzlLAxGgLTojwoFhRArb9ZzqLhJka+qIiuk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oZg6q9uemGSc3vZUjOcaoSR4klSgbSUhqRhE7WrLCZnGa7xwn4bFV1wBw3tyrHH//wbqJbSgQUG8JSjmoiqJRWEsY5iuse9QKd6krYtRKG60hwuC//NfVOmWC/R45NEseKnMn7PLCIev0KaegcsIVqLhqta8BAUDL2sVhfsMQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF0Jy4lg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF0Jy4lg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABFD71F01562
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421984;
	bh=WFDqwfiLhzlLAxGgLTojwoFhRArb9ZzqLhJka+qIiuk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=IF0Jy4lggG3pPTXJSNQn+Rwh3TEOTpmyYfE+DktBqwRfZizfuvky4VwQFHfIeBC9g
	 1Nvf13iOUS0CPr1zHbrJNiAOxeOk7imw4esLbQkd7NNdIgJdl08bL1c2MuCMyv9MOt
	 b8QgYJYpmquHHzxgaPdO3fmLu7DnkxCUXCtwzimGit5homuLPZhJYrnheqV6fAWKwx
	 33isIPhWeQksPDx4G+0QmVXUiiBzMDajY+Y6nETg4Xg1apQi3keNH5aO3+Umy+WZ89
	 OXZTXQPMGegc+JM8/erWgWF50CS+s7ayA3nQcK3i978tPyKVMJdNXyPXYBlS6RWH4w
	 r5xFkQxPMOmSg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a20f56876eso19082821fa.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 00:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykwiJxzHPXyzALIC1rqkrEkAuDty5ktMYJOvdHFQ0dIGLaskUjAqOZRpeURz4G6IKcofJ5DgCmevs=@vger.kernel.org
X-Gm-Message-State: AFuF++nPFJAHmQ1V/jolNPwn0W8MT5xo2VJyaBKIScNrattR3VESrJEM
	6up+TOLdSFZa40IurMt20AfI21C/Ndhf8jd0NJcJe62oPfjOSukzmn2xvymKlagVnXLUqUScj9q
	0Pz6sI0YoxaRCR1UOpTSDcaut8M5BcdX3ZbT3d3VF5Q==
X-Received: by 2002:a05:651c:2117:b0:3a3:52a7:3a1c with SMTP id
 38308e7fff4ca-3a352a73adfmr18741561fa.4.1788421983258; Thu, 03 Sep 2026
 00:53:03 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 00:53:01 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 00:53:01 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <57832670-6066-424d-a75f-4eb1f1f0cf73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788346553.git.mazziesaccount@gmail.com>
 <5eb294e68b8d5d2c1d3a12b14a55dd2a9c075a09.1788346553.git.mazziesaccount@gmail.com>
 <CAMRc=MchpaOib+jgMniG7=BBYwB1yqLvJG1sMkjXfRaMFPodgA@mail.gmail.com> <57832670-6066-424d-a75f-4eb1f1f0cf73@gmail.com>
Date: Thu, 3 Sep 2026 00:53:01 -0700
X-Gmail-Original-Message-ID: <CAMRc=McED871rSf-_3Ahjjxg7QO56cZRuf_2=Xc7+Q4kwMGqnQ@mail.gmail.com>
X-Gm-Features: AcwNN1W51dTT611YKOF8alZj0OVA9lXPGK61Ff-vrlum5Ji76Da9N2L8zMOMPh4
Message-ID: <CAMRc=McED871rSf-_3Ahjjxg7QO56cZRuf_2=Xc7+Q4kwMGqnQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@linux.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Walle <mwalle@kernel.org>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sep 2026 07:00:24 +0200, Matti Vaittinen
<mazziesaccount@gmail.com> said:
>>
>> Why not return PTR_ERR_OR_ZERO(devm_gpio_regmap_register())?
>
> How strongly do you feel about it? It's not a big deal, but I always
> find it a bit harder to read when functions / macros are called inside a
> parameter list. Thus I'd rather keep it like this, just for the sake of
> my own eyes :)
>

If you need to respin, please change it, if not, I've given my Ack and LGTM.
Same above.

Bart
