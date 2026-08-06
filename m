Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5903F482E
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006729; cv=none; b=jpelmpg5BzXxnZluVKPxkm71PuAVTB8omUen2R4tXfukQr1BENQypEb9/j9sgRJ1p+uaVXfZg11LWB5usSB7a0ykcAuqOV6N8hp7caZwOrdhUP3jpZne0cLuCuLHhfqG5w1yOagJ1kxQD6f8MYj9M7KUtgfy3HRDN2RNONCStwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006729; c=relaxed/simple;
	bh=Wp5Awetz8x1lkJd7iV42zxvDh1yQD5wNbmheE5eZ5No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnLMsCR5lihv0JZfKDPxlQROw10udFS9lamxG6LMzsTu/b8sOeBp+kJvtC+SD3FgwRNf00Rlv6drq67gFZcJVhhz+qApec0539yQrwVqDvR0OYMfBQbHLowdhAyksvWTg8FGMoTFDt0myFNtlJ7f1Zx4ayqJAeuWYPbYHKgqshk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c2dbaf828eso671862e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 01:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006726; x=1786611526;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/Tg3lEpqdaiPRfyjPgi2cmAvw9BxKYOOcBoKp4sZn8=;
        b=O6VZXFpdHjBrLXJZpxtUeRVPXIP+egtQDVsG7HUc7KTAnVXvlZ+LIC6gfk7sLRjWRX
         TBw8q9l+5ZyxzU1ynwwhVj4Rhxh7CDLOm00JBi9u+8ZfdJFHJzponxRKCtc79sioc9Fz
         92knflxcnlvLXc9G4dWIDA3GKfH7ITeDwXkbSOh1RL8GFN+hEFpN8js4QyK9VsOBwODW
         Gb3XPTEdZQzFXrrt4J3wOJE1s86oGpLDUHeGzxuCKbRFx8XJ8dI7KXmr//ECqha3v7BJ
         ie1ZKWcuLiv/4/o/pb5iiKisRIU95S7wO010SWQ1EhJyRLabVGtyXQUKBSH8W4mbUomf
         1E5w==
X-Forwarded-Encrypted: i=1; AHgh+RrckO0Qg/3uTPdiOopLvN7+p2tHof3/HynhOcMY29FLMtIE8g54zq4gXnszvVssLIdVpL8l1x760RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YweAATHCgXFlXQDZu1YobFS7QjSpSsI+JMDXLCP0evcDMYOeoey
	uA9+/Y4qhp2XSLwL/q4cajIB4n4DcB15upOghMgOlxohzZzrcPTkM7ZxB2/s9J1i
X-Gm-Gg: AR+sD12TmJE7MJJYI5SRdLesKLBJ90ijdQuTNX32NzLmpkWiI/677PMgbMxkT6suVKE
	b9O1OF/ol5XA0w9sQBCaXLJlvQ5y1mN/Vf1jiq31KMTj724LfSUw+llHL0LVHKr4d8Fsn6QspH1
	S7naC9UdIqbQ3vmq8sVPQKnWsvfUqpla8ok3KLLMCaGM4R5ZtOUORQQB39wHbeVPSnEt3G9tdiJ
	BCOqaSichzogWv+rFGlsXEYUZitrF5Ofxt+czv1qdemaUWH2ESNWx4HgtjEfh2SrkCxsEcSn80m
	yfPzGuioI5Ojf2hrbI2qkETaGPcx8j4ToiVBaDoq2oaYqCiEJ/nWMI/lsVhz1++Bb+FIEYDSYVm
	kfAcq6TtqUHepclkgWkMTpNCLcbfah7CziS+SmviUjRswR/eDo2f4Nwdv5aydBftbiRu/J/iu1c
	53m8mSb9yK48gEQGSeinbNHXmDWSNilA+RkIESvU1A5LCxyc0gcVFACJ0Czg0W8YCnfpOBdu7jK
	8I3AUZ1qunS2Elmig7RJeVbCQ==
X-Received: by 2002:a05:6122:6603:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5c3d9270610mr1754861e0c.10.1786006725729;
        Thu, 06 Aug 2026 01:58:45 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c3eb9f62e8sm1389571e0c.1.2026.08.06.01.58.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 01:58:45 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-963a722ed59so507092241.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 01:58:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq6JLUROezz7wpHLhXvuGsCXF9KNBB4VHqUyddry71z+AOBO/LcVjFQ4db4iqkoUBDyWpZNPWqnEgE=@vger.kernel.org
X-Received: by 2002:a05:6102:374e:b0:739:626d:4473 with SMTP id
 ada2fe7eead31-760e3698c49mr3173857137.0.1786006724650; Thu, 06 Aug 2026
 01:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
In-Reply-To: <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 10:58:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
X-Gm-Features: AUfX_mwUZKZac7nMaa-VOsxeMPj2DizVJUU-sXiHc_DXR1wX8yJ0IgF-oPKqM3c
Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Philipp,

On Thu, 6 Aug 2026 at 10:13, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mi, 2026-08-05 at 17:20 +0200, Geert Uytterhoeven wrote:
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> > For now this just supports the always-on power domains, and dummy module
> > clocks and resets for the serial console (which is enabled by the boot
> > loader).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >
> > v2:
> >   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
> >     driver",
> >   - Add default support not using SCMI,
> >   - Drop all SCMI remapping support,
> >   - Document use of -1 as a sentinel,
> >   - Rename struct r8a78000_mdlc_info to mdlc_info,
> >   - Print HW IDs in hexadecimal,
> >   - Reduce log level for unsupported MDLC instances from warn to dbg,
> > ---
> >  drivers/pmdomain/renesas/Kconfig         |   4 +
> >  drivers/pmdomain/renesas/Makefile        |   1 +
> >  drivers/pmdomain/renesas/r8a78000-mdlc.c | 330 +++++++++++++++++++++++
> >  drivers/soc/renesas/Kconfig              |   1 +
> >  4 files changed, 336 insertions(+)
> >  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
> >
> > diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > new file mode 100644
> > index 0000000000000000..5c8acead7cff9bdd
> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > @@ -0,0 +1,330 @@
> [...]
> > +#define DEFINE_MDLC_RESET_WRAPPER(op)                                            \
> > +     static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcdev, \
> > +                                     unsigned long id)                   \
> > +     {                                                                   \
> > +             struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);     \
> > +                                                                         \
> > +             dev_dbg(priv->dev, "%s: Ignoring\n", __func__);             \
> > +             return 0;                                                   \
> > +     }
> > +
> > +DEFINE_MDLC_RESET_WRAPPER(reset)
> > +DEFINE_MDLC_RESET_WRAPPER(assert)
> > +DEFINE_MDLC_RESET_WRAPPER(deassert)
> > +DEFINE_MDLC_RESET_WRAPPER(status)
> > +
> > +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> > +     .reset = r8a78000_mdlc_reset,
> > +     .assert = r8a78000_mdlc_assert,
> > +     .deassert = r8a78000_mdlc_deassert,
> > +     .status = r8a78000_mdlc_status,
>
> Are .reset and .status needed by any consumers?
> I'd leave them -ENOTSUPP otherwise.

.reset is used by a variety of R-Car drivers.
.status is used by the R-Car I2C and PCIe drivers.

So both will be used later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
