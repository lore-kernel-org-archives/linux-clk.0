Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19BD376A0A
	for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930761; cv=none; b=kA0551NLIzDSzTYH2J2dIfybAetpDbiWc7BOfZ52ZyWq1xm++dzuzX90AYI2CoChEp56HRk/gaUa5Z3ryBlkLSLeiKMP6Gxae8JvwDPDcPgSDj0MW3Rn6gnKAWS0f9bZd4h3P7uTBNZIGENhuKo2Hib3PpYzLrj/gpKQZhWMhfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930761; c=relaxed/simple;
	bh=Psfrc3G7bXxsl7ECubdBiSlZDy7VaNL3f7/IvFNPlmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFz0rl8AqPaW50xR3E8CNHwsy8sLAY88NwdyHuXongFNNiPF5UwYDcmPbbtL2IOfpBVXhMGIApnlm+485CPJr/1jpXw36bzqK1CMUK3A2XuAATaTOMI3cIH+fTtMo74K+aB1kRpuclO+dFEguD5P3UmQ1tc4fvAU4tvgBhJuFXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bfa6766cf6so1868679e0c.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 01:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930759; x=1784535559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cK7IMBHRP2FdUnWCkfnYLPOObmzv4mtZRa495nyVkt0=;
        b=hB6Fs556s872gzhP3qQM9Z0dfJ712QWG0TJpwULyFNHxZUKyAOLWtNm8U8ePj7Sy7P
         GeRmkNjz1Gw1QUuQJ0svuFj5tXfBqo9IIvXR/bgmy4fF66jFtkP8Zq51bT4Jeu+ckDQy
         5/oV8cAInO6DZc7o94eClne3L0A2mkAj9i47C0zvo9gUik92dlzvjKVfvaZkKPoiSxhZ
         80t7dkKLjuxO8UHR8ekY4Wohi0ruteQKNpyY9/Y/O6bFDl9j0niCCOStKpiBt5/BXzzG
         Y807ZBMVSbts77h/tAy+huyjAaTlo+rSHlgV6wTs/4rzWBitPftJpyI+MQtMwO3/o21z
         wq5g==
X-Forwarded-Encrypted: i=1; AHgh+RquauYHcAhicHd0H41cosfQQILQsiqbahTxa6h1zMB8/cng2na90VoeC5FWOKBH/Aga7T1h2LE6iuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZrff4GXKidqahBxXTK6sL5a7UN1GgOyL7x4z//AseeprOit3
	XzrjsmVaPB96T9Wgjj5ngKASXiUrL6K7HBZOpJpMNYhkofnu1go1ptUFXUXa7oF1
X-Gm-Gg: AfdE7clEJUCEyK8LHTzrjg1wwsAJh97x/YY4TSckbYkUVoelbgUAfMQdB2nZC91NhFj
	M7uGj46+UrNJ/iaP9rTrRqKwX54Wlp+4dsu8nlBzv1wMuZclWpxit1D3l0SZ2MdGwqYTqdpY0r7
	wkxAHqgPL3kgqTLu4srLDXetUM4ldY+S51i0U3vimzDuK4b3zj/my2OkI13gV4awkI6AxrWM22H
	CUChvXWwII0s6tVEP2bfiyf621J84+2E+9eEFNjtwDqPaOtTZDqLxeMtC/REgsyWEoQXODT2AyU
	Mq8HFJ/zy72qgOtpCyF/ZW+JgnwGOMR/TFh+GYBFOrjSt+ceWVzFp+/C92+p2efFdgyntIYKpjE
	1W3cvxHOiyFmxKj7bT0wWFuknulC2JYYt8aggK4E13qkpRmbdr3VRb0dysmScfos5E99EDWFEqk
	yr5o3b5tlDDAZCKBDQKm43P9Q/c774PlipYD0FuQfW6zdaU9T/MQ==
X-Received: by 2002:a05:6122:3c56:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5bfbf0a4377mr5075023e0c.1.1783930759665;
        Mon, 13 Jul 2026 01:19:19 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfc655c77fsm2983871e0c.15.2026.07.13.01.19.15
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 01:19:17 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-74019ed06aeso2350618137.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jul 2026 01:19:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro0zqdEZTuUUP6L1H1W0JDfjR+qwihIjnNiCQqhDd0xPns2m9/BTxXMcsBAtU6DFQQymgDDr/pwDsM=@vger.kernel.org
X-Received: by 2002:a05:6102:f83:b0:6f0:3c5b:ce7a with SMTP id
 ada2fe7eead31-74533d7c9f8mr5298165137.17.1783930755575; Mon, 13 Jul 2026
 01:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
 <alQTnZwVRwpVTVUf@monoceros>
In-Reply-To: <alQTnZwVRwpVTVUf@monoceros>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 10:19:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
X-Gm-Features: AUfX_mzM4sxy25iOR9jBU-xAME53IzNcexx6a8MgetXZ4RYeb2wzLaySAOrHbao
Message-ID: <CAMuHMdWMS0ymenXwSasZ7f5aTcK30kTxq8U2W3Dhj43y1UAcTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Mon, 13 Jul 2026 at 00:22, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> > +#include <linux/mod_devicetable.h>
>
> Please don't add new users for this header file. Only use those
> <linux/device-id/*.h> that you actually need (if any).
>
> Ditto for patch 4.

Thanks, will do after the rebase to v7.2-rc3 ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
