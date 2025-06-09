Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FFA21322F
	for <linux-clk@vger.kernel.org>; Mon,  9 Jun 2025 15:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749484153; cv=none; b=gQ4ru0FlUtMGzDYOgc7qTwhLf3zl5HsNPRkurQeE12k38Gcdslv2KTJ2bsv+IRBFGNuFNcycfDtu4uPZMKgPOl44+UE/XiNoYDjmFsy+TOIZRvywFxeBFwUDzmachyXFn8pY/lAOrTydOujHKnBSORtpGcTXpmngx4Hwz34Ec6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749484153; c=relaxed/simple;
	bh=MF8URYVd6paFLRNZA/wbEoqFzCWsn4Uq07b2eMDDSJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYn8A31ioFa5Hh0l7BP3drhtVaov+wiNjAgdY7tFVcnCsbPuoMU+i0KXVoe5qwdwCys5MI7UcmxjGqvG7CZ9vxmk+oAEih3vwe1FVjPot9GJHrSBe69olflMESpjwsQcCa/i/xXF+iUzwC1LLcw51jlO2oiOPtr2ycjZ1oLgc1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eU2tjJ97; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eU2tjJ97"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2e949f81beeso2299000fac.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Jun 2025 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749484149; x=1750088949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=eU2tjJ97vFn+mSpGvWHmNMDrcvoRSvDzbHOKoZ7bMdDx54q9phNURAZtXJCMzXsH8j
         88klNAd4oRrXFBPEV+8Kn1NT2lN0ElENoBuokYIR/pJvy60lW1RR4eTI6HNV82qMPgck
         J6NHpFzOpe3WC99C/c7IcXIoo/zg0PJgCznGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749484149; x=1750088949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=gQFlj9qKs8VclD6300iy71haWded2j05prZF7esNyX+8fkPe5Rms9WLsxwJcTaiAxL
         UvxPczJ08w8LnFs7vGOeBd8K155cDqshM9208j5E2DvydSIn8Q73yJCV3SMxz8OCTX9f
         9OJJ27erM0hWAWD8coKyFjg4O7HGF3xt9lcmpxr8cSaxLcakulcE25EQLeuwHf87LI5d
         7c7qIH2cky+yHa8t78h2Cb+k+Di/D+cCiG/mB2Uzt/GLFSPid7XTPzk1/J4v2zD7fqv2
         a1Q13zCYR56e2Lt/CuBRRAlPS8QkLRce8qLzNu+iykuXVQyUeAQ92X6tWPEhRyJrSN18
         5SIA==
X-Forwarded-Encrypted: i=1; AJvYcCW3OQF/O0BAHepq5QHg4uP6xrmDnfUkTq+cOhd28G9unFJ5shQic9cGHngYBNAmLw5teCv8MzCkhhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw51tXehiNTgrf7i+6pfAVol75cobrot5xSPd9qz+FsSgo9io2F
	8Lmxab3hwZ03lgJWGplYC3Z7NJk7yXupIW7xHqGFMZofnlT+beqbdIsyw9a4BJpvymYfortaMUz
	wPiY=
X-Gm-Gg: ASbGncv+WCYsAUcuF5MuKXJoLV6k4Lp3cTCoFEowYTMAKQU0MhELKuDLsyLPWC+xwfD
	iZ4Szj0AUK+LAmgc0zMKzwA+ZgGL5NiYbejEAmsDXCXI85ywiucZd8mZN+V4VVCfhG0PbyOCZQN
	nXNjkTVhU7u6fXB0u9J+gv7MDMCLtsHPFppSNiBCDEGuxgPldTcZeF0G49eOlqtQAcrAIiryc2A
	N11/jFUih16XFgKIEjjEu9VPuVOkHkn3SEbpVSCRw5EOvwre/BQaG67jUOK2uHyoMQPKCSm35pa
	SVuk3Fv+Q1xHTUFdXvJjGLbGoy5uKqIvQJeuzJoGMeEycH8E/EvUDY5teYPvLaZPI0FOcI8Jxzk
	Jrc8I2KFq6VjI+eMvCiNR77YCO2EexOcZybo0+H8N
X-Google-Smtp-Source: AGHT+IGwNLg8v+5an3lOS0bkip2CCcNC6IVSaQbuHgW4vvOFgSaZD9G9WJw2nij7CYFC8A4jf/p+cw==
X-Received: by 2002:a05:6870:355:b0:29e:2da3:3f7b with SMTP id 586e51a60fabf-2ea007e0d35mr7747577fac.7.1749484149345;
        Mon, 09 Jun 2025 08:49:09 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea06fe5777sm1927931fac.5.2025.06.09.08.49.08
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:49:08 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-400fa6eafa9so3221967b6e.1
        for <linux-clk@vger.kernel.org>; Mon, 09 Jun 2025 08:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXczu2GuY9hZKQvYflL3vk8fooOKsU2ROqFgdO7OSyOOZrgS3E2HKfRznuxXQ7VytSjugQ/SbdspMA=@vger.kernel.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug
