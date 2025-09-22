Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7D719E7E2
	for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 14:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550154; cv=none; b=b+7eJjUVvzDdK2NHNR92NeKAnc3EjaSKDKFFkXLe1YIO8/8+PaHHV6bTnhLvV8BHnDRTuuC4I+G/woAP1Jwzg25JSavtndN5LAc10cnROXq4m2trEGbFv9hVMDukH4P/rLs7YW5C2vKWe4gC9kOrMXOFrQl9Ah367Vc3zzM1ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550154; c=relaxed/simple;
	bh=c5oVqsPoTa3VSn3rF+3vlXIawS3iS9jeZUv5xAHbhIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZuCuK5t036PbowUysZuAYwYcSbyt3f5AGKNXZDvEEVIQJzYoL32hwUlif4dO600OFOsMDV9HIiiO87gCf5qR7N4+K4RZxPDetsvBAfDPGGXiNeDKzBce+euBhwqtsybHS2zyR70hA9EF/VtFvQawyhJ+Yf/uS+ebHYrGH4BFmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e30a19da78so2617340241.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 07:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550151; x=1759154951;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9myguoJ7hjvRqUVutV6ImQsg8/m76or1A6XOg+N5HvU=;
        b=rHxM4uGfLn+HW7wkGrKp+wu6+5Cq5CRerAFmagkfl2eZD3RV/op9dXffCvpDXxNbQj
         kxBGhalh3bcrRCC+f31aVbFnXtDzkl/2I21dYSC5MaidkvOKLgu/htsNANr0xTUDZ3dZ
         hVqgfruU2hR8MjEfWsSdVT3OEMHcZGXzQHy2UipwuZq3ztsGxQi49BKnNF1moZlaI7y5
         EwsiPBsee2JFxEVDAfOgRc4S7ElxRIOuKTkVgcrEq7AVarDd8gpduZ0OGQ2ylkbWYoSa
         /as9/H8b9q0iJzeN8cwG6RnarOcZjmG6feZtERBvsCsG/shmN8s9YdUzSYFtvVZxAjjh
         v9Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVdF0wb5BAAlY7o5r26ED5dVmge56e1bHhvg3KnlWR96aGFbQtPm5nIJysn3f4rYySlClTcyLDunJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsZUI9yjitL3VdXRO1V9FGJlYEEigtIEX/KmyWQROwRuLZeaEp
	qDTS7PO6CT2ifo/+q9FMvQhMQSIIUb3Ut24xI2qbQaLpggnUWdjqkSBz08qzVP8V
X-Gm-Gg: ASbGnctOlQmYzQKJMgpsRKfOmQz91T2JrtS60LyjANlYtbl+k6Ro3q/eO02CyIziJ5s
	BHtN2/JuI7tpG26SEvtrIUulKFJCvAfWrzl9rVXtP6sudHO5Y8LAeWLZfzMcX54IjOg0HdT2BUg
	YqV84MJxIYfu7Smt54caozLNzXnEa64RL1cTywWsLN01IAlYy2h0U0ooSL9JtTiPABlvbEvcVl+
	P+FNlZ4XVXO6f2TpxeeS6QcQ0n3o5NqwUau7sRbcgb4VJgtGdzA3e7Y7WywnyHOxkJNdvQlZeUR
	EiMBXBu+lRijo6u+r5t48C1crGU9VDqg8rLoZ9QWulrIjmwaRtb4uPSDT8UXOFq6QKkEhNGDg4y
	KZO2LEFpWt9uXDmP/Kx4+dQ1ZrAIiXNrl37ODwTK82SYwgPH4SggPEKfsrZwDMNBsFbkeybw=
X-Google-Smtp-Source: AGHT+IGO6R+VUqDdnAdfYnUm30ulHkK+gbiDBmSTuTGeP4OYEXmO4vhNDq2R3HnDKX4kiQ2QD1LrkQ==
X-Received: by 2002:a05:6122:1d12:b0:544:7d55:78d6 with SMTP id 71dfb90a1353d-54a8371787cmr4239500e0c.2.1758550150684;
        Mon, 22 Sep 2025 07:09:10 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a729e9ac6sm2675556e0c.29.2025.09.22.07.09.10
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 07:09:10 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-58de3ab1831so1726052137.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Sep 2025 07:09:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2iUQ+ruvM4IiAPDKyfSGhz8kY6ZXkHxS97MsCVq26/exWtPYUPkyKE1xLoeR6h9RNvS6BkMc3vxM=@vger.kernel.org
X-Received: by 2002:a05:6102:c0f:b0:57d:9305:63de with SMTP id
 ada2fe7eead31-588e0e89e45mr4003349137.10.1758550149618; Mon, 22 Sep 2025
 07:09:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
 <CA+V-a8sjPx8U+MB3v-SxErRPqbz4irAgZhCvd5CHY=6uO_VoyQ@mail.gmail.com>
 <353db156-e518-49c8-96ac-bd138ee64a01@mailbox.org> <CA+V-a8sLxBq8vSuq2HxcchpLqyQxqTRtkWjUKsRN9tBqGhU7mw@mail.gmail.com>
 <9dbc6022-eb97-49af-bda7-1a7a8069609a@mailbox.org> <CAMuHMdWuCyq+jXSasGdrMOSBP-XmDG-wHsBaXUMTGA3mtq_C5Q@mail.gmail.com>
 <aNFVv_n7y-ZmblX-@shikoro>
In-Reply-To: <aNFVv_n7y-ZmblX-@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 16:08:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7QvQFs_wXYy5B8fyO_TT2-ksHtfRKQXrhe3ouQpJALg@mail.gmail.com>
X-Gm-Features: AS18NWCrW3QxDjpWptl-dOn2GBYoJBw9An_ElV0y7JonoSEdT_C1EiUOZKFlSZM
Message-ID: <CAMuHMdV7QvQFs_wXYy5B8fyO_TT2-ksHtfRKQXrhe3ouQpJALg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to
 assure values latched
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Marek Vasut <marek.vasut@mailbox.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 22 Sept 2025 at 15:57, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > So e.g. MSIOF has synchronized resets, while I2C has not, although
> > both are connected to the peripheral AXI bus...
>
> Is this why we need 'read_poll_timeout_atomic' in 'rcar_i2c_do_reset()'
> then? I have never received a reason besides "HW engineers said so".
> This is pre-Gen4, though.

Perhaps... IIRC there never was any mention of "(a)synchronized resets"
before.

Can you trigger an issue by removing the polling, and does Marek's
patch fix it?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
