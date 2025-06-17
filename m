Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A9CA4B
	for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 00:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750119245; cv=none; b=MXkSw3w9DZZhCGtEtrWwgO0u5rpAqTLLdIb0jGuS1R3aHXMDNMShfBl4QHHiRBTcju5+UJKYaiIEpS0MYXQETUjAkzXdoFF0kALLKGrR3hhoJz4Rely3/csi9PiDlhDKGgd76f9SVktwbY8iOvKTXiGpcQU+WIaC6FqxkD6+MNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750119245; c=relaxed/simple;
	bh=BCUpnu00PdYTBYe5/iMD4TN6t9Gob1BlHNTNi7fYXxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SaQboqGFdOVVF7kJ3o/qSxTGrxhg2hBc+wZz0jMNBGQq75tmjn2GdHNsOd8YCzoetuXi4dy2ZF+fDC4eUNz7Qi6ZoLUf5G1oD0lyfSLx3Z9/GxfUiyk7fiW6MXQRtHwLY5/SYNnW50IwoSTPsnF1it51qzlkYXENBPkKRveErGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jUKeohdZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jUKeohdZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2363616a1a6so39548555ad.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750119243; x=1750724043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=jUKeohdZnZtmsL8mj/emMhk0SSdV9kK1WxVewPB9EnBFgyV4w76cO/HXfb2zeldY4p
         0zmSBWEzC6EzsASERu1MzG10/MQNyBr8M9OSbc4UC5xeWvK+sNGPMpYy9uoZfITZ2lmg
         pi86zvSAu3jxzArN8DplfNlapZjh/QHk+g0FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750119243; x=1750724043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xPzkNisft+m84N4JYez02rZP6098OOb7aM1R5PhuhU=;
        b=JFpCYuRtDgfUiU4mOQBe1foO08FYlTzCUEk6XhXEFmoOG9+rQBEsZv/6bXZ4gcbODt
         SRs+6OXZVpC1dVmuYVRRyY37UFGGAmdBcJgenajBoolUSJEmqzGpZocSxzZb8yv0HOZE
         ArdADIoJ8jRNxH2ZK2pXeAQkQKUcYP4ebOulYYN4E3XusbWXD3Vorajdp73gynV3kpkQ
         CJ2tmqjy2uDAXOKTx0KnyJ7Nu0gPK4EiR/SZstoKePjl95mHKPdW6tj8LW56JwxmgSgt
         fxmQwjsyzpiFwf/Lrd40ONGmCZePGzhiTxOxbZ233k0QFrBxKnir95KBa6y5bZBkYJCc
         8NsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGir9cpu0PeGhV4L3d7Uws1bWWCecuu1J3+1ptXnbc4/VM/pCBoO6VAQtgaE46740fnR8/ucdDzoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9W14K06HO7SSzFvcyK4qUQ+zDkiV+l8O9NMx8uxi4vjfOhbUM
	T1Gcax/UBOx1CFBDPWBq/okBvksqZURK/R6tk33BPRTCh1fydhWKZbM1a7ZkiMmVED5/DIKqznS
	jK3A=
X-Gm-Gg: ASbGnctSrcBmzGkox7bPoylFg61rprUE+LW04bn0E5xRmoCtgSD/gYRrQmk3PIu3q1/
	Kklf+Il+o/cA27PEUHO+QJxKe5OkNL1KYpCf+WS2OPTDSeZsj4S+17kCqDQ5Ls7terDIuZkdMo1
	1xQS5LLjP1WHNp5JkWROLT4OfuLK29Bf+PipmdbSG9oR1FxnyoPZYWADkKymbj8/2g4TDud6Bk+
	8O92MApP4ZM05bfvDev+eCaITsNSDYPX8314En5dhnmRZMzkKUyxuPdKmFRuu57omT3SfAyO9FQ
	ipBjholHRspjGpEKlzjLARKiEtjY96LxgTNCbmTUcQ5aDoyj6R6DyCMNP6Kro1pRWFqXZ3PGg7x
	m61VKRG//ryKNZvwYN+kMr7uNbw==
X-Google-Smtp-Source: AGHT+IEgINy5ZqhD8syWbkUpWqHoKbYzX1bHpxcXRysA1sbFS9JP3RTX4gJTpfnLc4NJVP+x2H3Acg==
X-Received: by 2002:a17:902:f80d:b0:236:7333:f180 with SMTP id d9443c01a7336-2367333f743mr85706735ad.8.1750119243101;
        Mon, 16 Jun 2025 17:14:03 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782d3sm67688445ad.115.2025.06.16.17.14.02
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso3739211a91.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Jun 2025 17:14:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVkHejSzcfceROnRH4Va1Dzn+Qq7b0He2dp61mUlBYxL0gclKidHAlwg/02HgloBLgVO09Apl82NnI=@vger.kernel.org
X-Received: by 2002:a17:90a:da8f:b0:311:ae39:3dad with SMTP id
 98e67ed59e1d1-313f1d05b32mr18262369a91.30.1750119242065; Mon, 16 Jun 2025
 17:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
 <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com> <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
In-Reply-To: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 16 Jun 2025 17:13:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
X-Gm-Features: AX0GCFs2ZyAAIENHNjz3BASVq2N7KuTDsUG8ACNS6wvc-Dx4zSZzUpIgLa-Czmw
Message-ID: <CAD=FV=UOucHSqgGE_OfW9MAeLbwqtk1emCiByxJw-LpQnCbDww@mail.gmail.com>
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

On Mon, Jun 9, 2025 at 8:43=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrot=
e:
> >
> > > Hi,
> > >
> > > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > >>
> > >> The auxiliary device creation of this driver is simple enough to
> > >> use the available auxiliary device creation helper.
> > >>
> > >> Use it and remove some boilerplate code.
> > >>
> > >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > >> ---
> > >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++-------------------=
-----------
> > >>  1 file changed, 7 insertions(+), 42 deletions(-)
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > >
> > > I'll snooze this for a bunch of weeks and check back to see if this
> > > can be landed in drm-misc-next every once in a while. If you notice
> > > that drm-misc-next has the necessary patches before I do then feel
> > > free to poke me and I'll commit it.
> >
> > Hi Doug,
> >
> > FYI, this is safe to take with v6.16-rc1.
> > Please let know in case you prefer a resend.
>
> Thanks for the reminder. Unfortunately, I still need to wait. This
> patch will need to land through drm-misc-next and that doesn't have
> v6.16-rc1 yet.
>
> https://cgit.freedesktop.org/drm/drm-misc/
>
> ...presumably v6.16-rc1 will get merged in before too much longer.
> I'll try to keep an eye on it.

Pushed to drm-misc-next:

[3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
      commit: 6526b02e10209608464f2645af59b2cc955b5a19
