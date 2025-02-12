Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352EA1E7C19
	for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378798; cv=none; b=uLP8uYDBGNlQqASEU+LSqdUArbkJ2Z8NR+JqsTP0En1NWU5d5KeOW2Z8zC2sWcVhGo+vQEKn92/gqVvVhlk94/RkIDhX2OeYFNpXKljk1O7kpqL1DaCgfoBe8VwwpwbRNQlg5HZZfzM4q8JN0DnPE+R5wIUweABdlcarY/q1Nas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378798; c=relaxed/simple;
	bh=BULMItlD7UmqT+FeS+xvhAotN9kxf42G+uPp6a158Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zu9fa1tZiKYhrVUiRlIKtTjzVRi92/9/RrtqqJKaH5V6UE6dNBHnH98/FepfpCR91DPD2r8DGh53dae+az+XG+rKzCdGGJ7eBthn7xlNysodiXb5fqVHteoTsetPa/1cxsqZdrE731HuJnIWK5wHbvCvZIDBaOM++5hTDK8PO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aAhb2azD; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aAhb2azD"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so9461782a12.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739378795; x=1739983595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=aAhb2azDA6qbNHJUEOshwDAbcIZrXFUgrjwIGu6ipPkuaHmlDmXHmVzSPVoO+53GE0
         zrNE6uwARATLIN+biyR/19wC4vqw0o+Z0qFJrYBJG8RwSyHnnP+RjHGj+HPOOsJM2FuQ
         d+kz0qL8b2z+lYCKIHD1U8cRsR+r/wYqTqTDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378795; x=1739983595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/UVNzfG26hpAhqe/4xRhycTEgEJVFinn+tffb17O7s=;
        b=tVhV0jxARiHNY84/GKaicqRZwN1XcTxLHFN3NmvNTNIVRiRArWH/2JH2r3DFF4x4IS
         Dbd2VG4+JA/AbF+V4HLT/UwtliA3xwUtMTFXitwGslXloiqn68xJ3JkJFBvYTPILcI0R
         shilal/7LSD8J728fhO4Z5CCkdsePdgzhtHQUN8ipQQMc1SJvzM1u4AjV+bdViy0i1zI
         O/REaPoSOn0J1No4ExeVWhF1nOi0+jkEaNh9Qb0F/S3ctEPcfuquVUDrJV65HilKOkvu
         f9EjhV0GMPxwGBfWmPGlFomjPWsdgZdxMZ66ypjrnn38uGqj/53kRhUZR/a8mHoV69CS
         UfIw==
X-Forwarded-Encrypted: i=1; AJvYcCX7fKgXTuiU9rS69yBi8D+dUJ4qXBKLQiCwNNJjEpcSk5JRb/vXpLJ5rzXjsCSbEClVcOyNx1MPq6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPI8RB10+cF1TLApwgWrvESc/uQZkuBKrYMnPUI4oor5obWq1D
	4pTOdKLJT8gYqMF6ZrLN/qbbJjfNr5imbF3qRgAPNSAdZOAkl/ylvWa3RE90oxlBEW2GW4hGRK3
	F1Z8Y
X-Gm-Gg: ASbGnct2Qe1XRn02VWUEKMzBrPURwcxSv3HVlR9fZTHLTUshRkSwMtFavK6auFr3Syy
	HB277ktemZq5sMu7ZfV0emYMOczNkLLKh6+TK0rSJeLcQAbT6nwrj0HZ/FoytE5MdGYnE/sax+d
	d6tQ1a3e9RLm/5AnKc3lPjyidLj4HrkSH2X8dqt+EbfOvk2s9aTUxCnhUbbhvxXhW7bQIkHHz20
	fks1nYQEAXDot2i15pLQ/qnDFojMsSadRa/4DqGbMQRuTysg2xM3Cc06wogVKGUuwXXBkRR1TRC
	JTvX2MoqjJyPM4wRYDJwofsk0lHE0p9DVchj4ZIOiUi2tOCqpvKg/Us=
X-Google-Smtp-Source: AGHT+IEPz9ObjAR2zXyJ78Vmgg8vKfN4GeAIy5ZVaQZhOtMLY/ft4DvnKitgpMkMT8HuMF2kNOxGgQ==
X-Received: by 2002:a05:6402:238e:b0:5de:bb61:5d81 with SMTP id 4fb4d7f45d1cf-5debb615e8cmr1185101a12.20.1739378795133;
        Wed, 12 Feb 2025 08:46:35 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b7ade9sm11728345a12.25.2025.02.12.08.46.34
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 08:46:34 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de56ff9851so9461737a12.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Feb 2025 08:46:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWzNQV8poLfvGerYERXnWauIlim3QHyuvh5idRX3S+oyBn9mHO92ypPjHkvaGJf835Coojhjt7LNFI=@vger.kernel.org
X-Received: by 2002:a05:6512:1195:b0:545:9e1:e824 with SMTP id
 2adb3069b0e04-545184bc12fmr1571346e87.48.1739378317154; Wed, 12 Feb 2025
 08:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com> <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
In-Reply-To: <20250211-aux-device-create-helper-v3-3-7edb50524909@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Feb 2025 08:38:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
X-Gm-Features: AWEUYZnEAQCx0nU_sk8MYOvtfC7Gu1h5Zsl0lbrfbQPnQTV4y2laVQqsVCR6NTE
Message-ID: <CAD=FV=WQsFzAmpcqSG-eAm6SW-i3Q7EdbxEKyuhyovVXVRxC8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] drm/bridge: ti-sn65dsi86: use the auxiliary device
 creation helper
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

On Tue, Feb 11, 2025 at 9:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 84 +++++++++--------------------=
------
>  1 file changed, 20 insertions(+), 64 deletions(-)

Thanks for creating the helpers and getting rid of some boilerplate!
This conflicts with commit 574f5ee2c85a ("drm/bridge: ti-sn65dsi86:
Fix multiple instances") which is in drm-next, though. Please resolve.

Since nothing here is urgent, I would assume patch #1 would land and
then we'd just wait until it made it to mainline before landing the
other patches in their respective trees?


> -static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device **aux_out,
> -                                      const char *name)
> -{
> -       struct device *dev =3D pdata->dev;
> -       struct auxiliary_device *aux;
> -       int ret;
> -
> -       aux =3D kzalloc(sizeof(*aux), GFP_KERNEL);
> -       if (!aux)
> -               return -ENOMEM;
> -
> -       aux->name =3D name;
> -       aux->dev.parent =3D dev;
> -       aux->dev.release =3D ti_sn65dsi86_aux_device_release;
> -       device_set_of_node_from_dev(&aux->dev, dev);
> -       ret =3D auxiliary_device_init(aux);
> -       if (ret) {
> -               kfree(aux);
> -               return ret;
> -       }
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, au=
x);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D auxiliary_device_add(aux);
> -       if (ret)
> -               return ret;
> -       ret =3D devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, au=
x);
> -       if (!ret)
> -               *aux_out =3D aux;

I notice that your new code has one fewer devm_add_action_or_reset()
than the code here which you're replacing. That means it needs to call
"uninit" explicitly in one extra place. It still seems clean enough,
though, so I don't have any real objections to the way you're doing it
there. ;-)

-Doug
