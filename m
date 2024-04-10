Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796E158207
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712740868; cv=none; b=mSaAE0h9KaRl1RDQftZ39+fscqXD20k6t5d8h6GJz7LWY9axGr+o0B6xJcn1V44QHGJJnYHCQeFAQKCbz2tG6OCG9LZ+CQofO+98PwKfiMfJhJyZwRIqkA0xtT+GckwmlCHhyXUT4RLcWSEC3J1OwxBG2osNLtBNWDb1LbAgVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712740868; c=relaxed/simple;
	bh=GOyZlPbibYKkgQOc58qrSRIZg7WlqZDBuxYBzqa/E28=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=mR3LFhPfQ9+BiVqbFFtF9cszMv0FvbUPaViNUfNcGtfYZAAsR2fzPp5cN4vcDXWOzRUTDMk6nIN1Cug4U7diSuO/rRwVaY+cZn+x6CNpuu542GFIWmym2HbkXieen7djrx/yZ8xeAt5IZkvs/WJL2AliQH802AIMkID2G7MbBFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jQC1D+xy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jQC1D+xy"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4173f9e5d73so1787505e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 02:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712740863; x=1713345663; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=OUZ8sj/QyEa+cNbVJTvPrBz5RGRP8IPnLWYdgXsAut4=;
        b=jQC1D+xy38nUW2UZNKxO+FNwH4GgXSBEeMTEz+A5F8MdEpwdKzqYpJj7blzcNnTWS+
         Tlgq0AZ70MQqD29z3w79auE/7imgdi26wpCiq0r/Koq4znTBQs2/NZQye8vG5As59ZD+
         qtMbn3G/2Aki4V7UBQq7oxzungQJkNXDuoDnS8kW60qCJCnNHPlEnIMoTcHdVGm9J56+
         cmEv0jeVkg4p8jbLfsXTtZy8xQZ6bQgH7goBx+gE8K3zCTfUhm/sNNOVwdrcPdEyj0i2
         ir/oPvyjQinLSrKAIjlhAcgyZUFRklTI8TmK59U0KwnNv6AxWXvuuy132jjbQMvTwagn
         E+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740863; x=1713345663;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUZ8sj/QyEa+cNbVJTvPrBz5RGRP8IPnLWYdgXsAut4=;
        b=J+65FuPbW2gWJAssSJmLixRZnRJAQF4REPQZXE8vgIBv/tF98Vu+3V5YOh9snP6EYQ
         H8MIQ7gQzO7AtyeLnLTBF76JahuQkFLaBWllRKrmavGW1xLAHY69JelS19d9cfFUTL03
         +yiEQZSXDcT7axSiN/EaerNRCHijhxoI7890wLf7Z3tyQidzcuEA9CXcdhJe5qJFcZLe
         4P67fZziDrQsHOyiS4U0tU1ax//JL2QmNQmaqs7zgGLW7i8ZpmziuJX2pXBbVNhQqw3x
         H4Rqze7unrXr6y7bF9aYiSDZwXylFcGC33+XVCgBy2iI9DPDX+ZfVRGgx3aazsGuRLzs
         5GZw==
X-Forwarded-Encrypted: i=1; AJvYcCUwzHR9K0efWslLPDa201svGwOzkRFhaKLRA6umibCtGml8Qoh6U1jl2Mc92r13mlomPANhSaFVzADha3QFHCZqDgyWLdFZGx84
X-Gm-Message-State: AOJu0YxWP68hY8QFIPE5gx9IFu5TEDQRHelhbiMUpqSoKiLoo2dnQ7gr
	182SGfBRpNjnN8kkONRk8TqLMx9UdeMj9Q9bzu0Vj1iR9LgJdnCMxo4XO5rrrc8=
X-Google-Smtp-Source: AGHT+IHz7uEirOiTQ6nUGo5cn1c95MQa2CNHbq/vvNf0n1UrWoBuifyOgUpJWz1pEK/x5Eg2R4xW8w==
X-Received: by 2002:a05:600c:35ce:b0:416:afb2:1df1 with SMTP id r14-20020a05600c35ce00b00416afb21df1mr1507548wmq.7.1712740863156;
        Wed, 10 Apr 2024 02:21:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:49de:129e:d25e:c803])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b0041562a58b75sm1650891wmb.13.2024.04.10.02.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:21:02 -0700 (PDT)
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
 <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
 <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
 <20240408-numerator-escargot-a642507a598e@spud>
 <20240409-shallow-voice-c84ed791bc7d@spud>
 <dde59dd2ef4da81528e31f65844e0b3f.sboyd@kernel.org>
 <b9ee67f1a6d782e6b6ee9e273bc8c6fa5bc1813b.camel@pengutronix.de>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor@kernel.org>, Jan
 Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Michael  Turquette <mturquette@baylibre.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin  Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's
 code to separate module
Date: Wed, 10 Apr 2024 11:17:14 +0200
In-reply-to: <b9ee67f1a6d782e6b6ee9e273bc8c6fa5bc1813b.camel@pengutronix.de>
Message-ID: <1jedbdpo8x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


On Wed 10 Apr 2024 at 10:56, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Di, 2024-04-09 at 19:27 -0700, Stephen Boyd wrote:
>> Quoting Conor Dooley (2024-04-09 05:05:37)
>> > On Mon, Apr 08, 2024 at 06:05:51PM +0100, Conor Dooley wrote:
>> > 
>> > > > > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
>> > > > > starfive-jh7110 drivers are examples of this.
>> > > > > 
>> > > > > > The auxiliary device creation function can also be in the
>> > > > > > drivers/reset/ directory so that the clk driver calls some function
>> > > > > > to create and register the device.
>> > > > > 
>> > > > > I'm undecided about this, do you think mpfs_reset_controller_register()
>> > > > > and jh7110_reset_controller_register() should rather live with the
>> > > > > reset aux drivers in drivers/reset/ ?
>> > > > 
>> > > > Yes, and also mpfs_reset_read() and friends. We should pass the base
>> > > > iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
>> > > > then move all that code into drivers/reset with some header file
>> > > > exported function to call. That way the clk driver hands over the data
>> > > > without having to implement half the implementation.
>> > > 
>> > > I'll todo list that :)
>> > 
>> > Something like the below?
>> > 
>> > -- >8 --
>> > From a12f281d2cb869bcd9a6ffc45d0c6a0d3aa2e9e2 Mon Sep 17 00:00:00 2001
>> > From: Conor Dooley <conor.dooley@microchip.com>
>> > Date: Tue, 9 Apr 2024 11:54:34 +0100
>> > Subject: [PATCH] clock, reset: microchip: move all mpfs reset code to the
>> >  reset subsystem
>> > 
>> > <insert something here>
>> > 
>> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> 
>> Looks pretty good.
>
> Yes, that does look convincing.

Thanks a lot for the example Conor !

When it comes to Amlogic, I think the bits of reset instanciated by
clock drivers could probably share (part of) the code of the existing
amlogic reset driver. Some have toggle only, no level, but it is mostly
the same.

I'll try to have a look at it

>
> regards
> Philipp


-- 
Jerome
