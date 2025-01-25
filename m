Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF122080FF
	for <linux-clk@vger.kernel.org>; Sat, 25 Jan 2025 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809925; cv=none; b=gF0/SNFIQtZGLBC6twMtOQTxge8YI/wezjtCGDw3RrREyVUEbmcr9gM5N2b5AGSKnDTbQXR4RK2qTrLFTAKFLtn2O1Pjfj8fF67fyOa0Fj1BbDCRsSzmfORpKdS3b40yblSpjThaGkI+83PncC5w3PV7/ZBuxtSpKYsZQPDPwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809925; c=relaxed/simple;
	bh=7mquXriMeiqCrDQ4BHE4GQoKXdy1uMYdwhwW2GBfRlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9RGIk8TtUgs8xhtu65VJroWZX1tlKEWNb1ba+imvHOTJ9MFaegT5alxFmYSFr7MJ5I5SBQ0vFeZkondAnH8pBEA6yk3kZyZQtv2DXRPHHk0SOlThfUlsvCSnd/6R9VATg4L1F0WOUs+7CDiXTVYvJzojq0EaMuyeCKjfLVeo8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lDB+P8Ug; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lDB+P8Ug"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e573136107bso5066431276.3
        for <linux-clk@vger.kernel.org>; Sat, 25 Jan 2025 04:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737809921; x=1738414721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=;
        b=lDB+P8UgJQaP8LsfBuWm4Lc0/QiOUMB85KBOGmMlTb0OgkWmUc/iIZGkqm1xEuzNRd
         tTGcP8OmU3nMkRs6+W2CChzeQbD7SBfo7pywhURARta+oitFlHj43xDBLDxAQnW70Qh3
         U2reWpFg6mGO4kKbgx4CbktI+SO2+okNOgSWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809921; x=1738414721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=el7iGP7OFYeR4PWe14A1/v42PBL2cJsaz3V9X1queIk=;
        b=HoB5apNfaHxFBmKhi0k77eBmA9tZDPMNqnY68R+olWUJBZ3NHYQ90Ft91mDUTmjg9z
         HVbiefxhpJ1BaQo5eZaYrCZtbE9Crz6x4cBACva/vFhQxiV3DmDaMwhxx22UQWTeJRTg
         a5tkbsPp66H2T0XhUU7AAASMNbL9VemtoKZ8mLTRHlEMy3I0BYnujg2S+sxdu0dFzGGX
         SaoLDeZZbynHhWVdu8L1i8LyXtwqwZagdWPkajhiapIBtSduUh8S63AJ5fQ4c93WNhZg
         dFJAgnIuKvuwnYDKv7cWWvuewyApAEEEGDAI6H54B+KrPnnRS53dk44OMh2GDgEFpDti
         3UGw==
X-Forwarded-Encrypted: i=1; AJvYcCXVIUpfWGlhyIHs3qEeHdnrT5iOa4mOu3lc59x7fRtjjJEPddLbWovg0VTR756/cqZ5cVf+07BLSlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDyaBm7/AH0D1RGBGJW3ggqDkuGIcrNBiit4++tn+T98BtNHc
	Y75ImrRP/X2HHMVJgR/GhvBumBu9Q1rA3ih4opE6F7YpxIBb+MI9BoimkHOhuVxM+rkZ5xrHDBO
	uWcnPJXbRJ0q2MwoSFdQE552VefYn7tLpFhTbzw==
X-Gm-Gg: ASbGncsyJLrFB6HbQ8bI6GeRNKbz4+L8LU7Y4NzT3uLItJD/za33MZtp0PxyI4bMS++
	ET4pZvqZ8GwHlzVDdv3ZJtTzcS4SfBiN84WwQb1E3gZ5PAOjQlhBR6aqx7a3C
X-Google-Smtp-Source: AGHT+IEEKpiikrUJ57qyfcCRA/e0fon58biS6P+zSfMgH8jo4xDtyN7iJdHR7Or74nDGVOsMp3enzXojTs8OVWanswA=
X-Received: by 2002:a25:ae54:0:b0:e57:cc1e:2ab4 with SMTP id
 3f1490d57ef6-e57cc1e2c6cmr17264809276.28.1737809921258; Sat, 25 Jan 2025
 04:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
In-Reply-To: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 25 Jan 2025 13:58:30 +0100
X-Gm-Features: AWEUYZnNxDwCk6NAMaoEBBJdy6_TRGTFA2dlWGHDjrD3fTX9PYVK1omwdpabvIA
Message-ID: <CABGWkvpj2bYyqiOp4D9Ss2aWOnoR7BxqDOGpXdRusq=aWu9BEA@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: Support spread spectrum and use it in clk-scmi
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sudeep Holla <sudeep.holla@arm.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 2:19=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> - Introduce clk_set_spread_spectrum to set the parameters for enabling
>   spread spectrum of a clock.
> - Parse 'assigned-clock-sscs' and configure it by default before using th=
e
>   clock. The pull request for this property is at [1]
>   This property is parsed before parsing clock rate.
>
> - Enable this feature for clk-scmi on i.MX95.
>   This may not the best, since checking machine compatibles.
>   I am thinking to provide an API scmi_get_vendor_info, then driver
>   could use it for OEM stuff, such as
>   if (scmi_get_vendor_info returns NXP_IMX)
>       ops->set_spread_spectrum =3D scmi_clk_set_spread_spectrum_imx;
>

I wonder if your solution is truly generic or merely a generalization
of your use case, which seems significantly simpler compared to what
happens on the i.MX8M platform, as discussed in thread
https://lore.kernel.org/lkml/PAXPR04MB8459537D7D2A49221D0E890D88E32@PAXPR04=
MB8459.eurprd04.prod.outlook.com/,
or on the STM32F platform, where parameters are not written directly
to registers but are instead used in calculations involving the
parent_rate and the PLL divider, for example.

I am the author of the patches that introduced spread spectrum
management for the AM33x and STM32Fx platforms, as well as the
series, still pending acceptance, for the i.MX8M.
From my perspective, this functionality varies significantly
from platform to platform, with key differences that must be
considered.

Thanks and regards,
Dario

> [1] https://github.com/devicetree-org/dt-schema/pull/154
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (3):
>       clk: Introduce clk_set_spread_spectrum
>       clk: conf: Support assigned-clock-sscs
>       clk: scmi: Support spread spectrum
>
>  drivers/clk/clk-conf.c        | 68 +++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/clk-scmi.c        | 37 +++++++++++++++++++++++
>  drivers/clk/clk.c             | 39 +++++++++++++++++++++++++
>  include/linux/clk-provider.h  | 22 ++++++++++++++
>  include/linux/clk.h           | 22 ++++++++++++++
>  include/linux/scmi_protocol.h |  5 ++++
>  6 files changed, 193 insertions(+)
> ---
> base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
> change-id: 20250124-clk-ssc-fccd4f60d7e5
>
> Best regards,
> --
> Peng Fan <peng.fan@nxp.com>
>


--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
