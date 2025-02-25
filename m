Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB21624D8
	for <linux-clk@vger.kernel.org>; Tue, 25 Feb 2025 16:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499896; cv=none; b=uJdtgxEK4ja0JVRfnvgaCvILVX5xwQ9ymfoAKc3YVqGfXhoOFTZVyKHBAr3s69vGwYm2HPnqjofHFy8cXPXDMJn3Hja8eZnzgGAsvP/SfPW2Hf6PLHuJCYri4YVH5aj/16saC14hn8ZrH1niK7ovju8FvJYoJqIxRru3I0pykiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499896; c=relaxed/simple;
	bh=rCByvJMOjUxh8ZzB5E/B1+AmONBCyWA+/sUB1yHUqbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdV/p5TJ3JwAPR5d9vgiHtyS2PvJDNUw0Q1GigIcAXgbHucAfaZ1Rv7G7s7qGU/rd+4giUAfnDsZ7n7SMukOGixmqKhybaTBbRHR7kt5dXpoik8dNF89syguqWSdKDmZMq2tCRkAd97mDfY8uHB2fRLw6ucd9ZwLCG1Dx5xNJio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SOa47uvd; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SOa47uvd"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e0516e7a77so8920917a12.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Feb 2025 08:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740499893; x=1741104693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=SOa47uvdL6NKRjMYKBnsJzOdQLZwzKUfs+ChRdz6izcRhFLfo8cuRweh9S7GfjLpBn
         MxIkTajR347kz21XjBootefrFiU6rDtluXLGQUo4vQYg1heIr52iz9JDuqLfahdDl35F
         bJFy3hxoUU8IO6oP1QdITZQPldDRRxRBdPDHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740499893; x=1741104693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwUSC8OCkUHVVAACMeGE7Ik1ANgp9jf6fyVgqusnzdY=;
        b=ccUhDW2imglXljXY3Tx22l+bYxTFrFjHetrb+jAPXNu/9Buw80Uv399INDTBGJpKJ1
         GEbezdaam4GSvOmMWLqAOV66sewZ15CKOqyTXAQPaAmD1khhBvltz0DyKTIRkHZkYrr9
         ixruHmBlpfXlx+j3DndZgoITy2c56TUo0aHLnGRmTKiro+7iOH471dSWzqRetwGlOmXm
         K+oVm5RTBx+INd/HUyy5luAsasjwKPeS1Lj6m20Fu8Tu0IXkZQr9iM3FOSsjbuS5GajI
         xKSmonq4xIembZrFUc7F0FI6ClnzAmZy0x92XGxgeUz9anwvU9kvxn469Yi9z03+rsGf
         EO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5mcubNqYeGFmwdR3H23yoMdXeCpXzXXQ9fxA3m0ETcWUyqAld+CjN/VTb/d6k1WDGDueNrgnEWyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsQQyiBsGQTCHzBsJ9+nGLRtdCzPh7s3jM3p+7Cv10xg6IcfE8
	GemTl8rX36X4XjUDP3Z0P6eVZ6/N1Fm5N0651P/VPNKY8bulZnKL3OiDd2OSni4FccksWG9Fwn9
	e8/dj
X-Gm-Gg: ASbGncvP/O5a7CfoejpgfArXbv+7qogRYfwQy+VUQEZbRnJ8zl2ebZ70YJoDEnah2A6
	9Wii8blogczHh05FnLPOPs9UzmRZgBboCzQHa3cQLOq1lpNEotfxG675Xz4fdMspg6c54R5s8iI
	6nLIMV9gF2FVIXVkz+4UDWF8/xfpfuxxc7W0K4XjF1s0B4jbxkdOG0c4MudkfQQaWl9r6BJk+Lt
	hpqU7YPXoN1s19F81ku0FO3jNyq/XXdQcSiRCi55EVZPE3UwhkeI/DFsK4ojO3oRpwQ5Ui9DesP
	YGG8oIBzMqdunRhG0YikeliAmvZ0zSX/eXtYWjBQtk/l+JFIebqqmOY6mmuida2aRg==
X-Google-Smtp-Source: AGHT+IGibQS/dJUz+1GIMMKP+a5QIgTieq/wk8HqsDhK2LqX6P4q6zUnKO0V6qsBlkCXXqNlEWfIpQ==
X-Received: by 2002:a17:907:d8f:b0:abb:db78:a25d with SMTP id a640c23a62f3a-abc0d9dc961mr1803106366b.14.1740499893138;
        Tue, 25 Feb 2025 08:11:33 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d696d3sm166337866b.59.2025.02.25.08.11.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 08:11:32 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab7430e27b2so907363966b.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Feb 2025 08:11:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTJ9r1AcBvMFgr0r/G21aA+IzHLE1IS9YAyaSHGUOhMic6Lyadu9i+srSmARHvSj+YrEaCJmmkVUo=@vger.kernel.org
X-Received: by 2002:a05:6512:1241:b0:547:6723:93b6 with SMTP id
 2adb3069b0e04-5483909d1d1mr6678553e87.0.1740499509419; Tue, 25 Feb 2025
 08:05:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com> <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Feb 2025 08:04:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
X-Gm-Features: AWEUYZm3vRrajChqqVao9eJTA9wadMF2aiVVZGdKkNeW96YTlQauMsPFnVVKvC0
Message-ID: <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com>
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

On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
>
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>
> Use it and remove some boilerplate code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++------------------------=
------
>  1 file changed, 7 insertions(+), 42 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll snooze this for a bunch of weeks and check back to see if this
can be landed in drm-misc-next every once in a while. If you notice
that drm-misc-next has the necessary patches before I do then feel
free to poke me and I'll commit it.

-Doug
