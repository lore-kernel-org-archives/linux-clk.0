Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE233A1CD
	for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 15:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463763; cv=none; b=HqnvIiRQ4JA0usu93ejBGDL4Tk7S89CLafEpHTwXxULm2iQ5P3wvPsXlaCYbAnamE2U4MkAzaoOe6fKWeaQQsmGiNvUGvlMHy7jnGZyL9U62rGG7cdercLmd398ltJnZG8uP3+TWC+OcpDedQgWb09bLnwO+7jCMgofhjfv2o4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463763; c=relaxed/simple;
	bh=EB5tKPXi7NNM86vQZ4/x9OqKlx4YTJ1xqabX+NGrs1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cgZrolljUa1tKKD9wgpFFvJ3PJcaV6GeAM/69GcaWjWIqeeSGg6kQebkrokKM7/wBVn8vhQdImqYY3LsncewgYPMy6s2DFbqnHAC/ZK/sM3sF/tz9cn9ROkVdNX4zJ+bqHH0bzl/qPxSWDpz4KL+oG52FKuOEtgjN4WUjz96AGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6312bdd281eso6610638137.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463760; x=1780068560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdOpo31kserPmrGp3GvpU58TPDoGY+y8EflyrkRt+J4=;
        b=JdRcfnMOHGBZTieHcZfmNwZVNtQYoBaFsCvuZjrvbpRb1ZuzAetJz/IbpfB/CNi5gX
         dY66AXtLJpusNjs6AhJvinzGBln1vkyX5I/2Akj2bAPV2/IwEHgBwPz1FEGXbS8FF5GE
         eAk0z/KGaOoxa6+yLsh6vvv4PiRf9hdp2RUv52TnXlhiorMtP35a2NdFbYBM5wVUusg1
         EpC/GjT2NA9KJbCjuHD8cdyjZuBUDcxZHY1MwBexFkrCu+D8L16ZQ20PG8gheYTjK1zI
         A+kjDYnzhC/MrzEPP8yLYWfjhT0+uDDEB9FUfDPZ9knb0f9w272efM/BBhllwfWGbAg1
         BOfQ==
X-Forwarded-Encrypted: i=1; AFNElJ978V41nMpxlb/ciOMTbZH/rf2CQodlTCfAwEhpvFyV9eBraFR1grsEt74N3PuVxX1VzFklH+TWdtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVZ53n3mW4Zs/XlIYJQUdcFsSXOFDjWqxTyP41BPSc4msgfFRz
	oCJrZz9VMxIl9xT4Zjh1zEblxaeyBqdAy1zMSV0sS8NoQM0pJ2MCHfHC0Xb3R++Zc/E=
X-Gm-Gg: Acq92OHUmuOdnKbXKPKwJX3nPh7NPUAOqEIphiUCnMjI9yoS1QPntmBaX2UjaIQ9F1G
	Rv82c0tbD0KkEDBMkIlQy33F24nBvsNC+YD0NHmzHMj0/FBHCL3QGMzciZPlajLQu+MxPYVlGCp
	kGQbemPk8ehEmsuya05Mq495mvkN6BvEHIfQH2ppoEte4wacEP/6hXuGPrwyKqOKIZ30rXkNsGQ
	9iq5GLOfWJz+vpIyBBNJWxJYtPilTezNptqtFCb7bisFYCHdydxTh+6XwScS+whtO17yPPdXidt
	QezP6f7oXQBsZZ1bIKxzdnDysFlPtgYV91AVUGz5FdcsB0btQh02A/NAc1livTO0g8ZioOnzOIn
	1CrUUUzq6A30WsX1PeVYi27FwBxlcKSIQrQhLMAhhJ/2WPXWi1EQ/b7nE8PMijWACkeILjEb74P
	qAMsCQ9ULbeAqpJMr+xaYkgVfLWgWOiXLo2JLhWdUWnMgA7ndfEFBKqfbPti81REUFF5fu/hng2
	UdxLiY4eQ==
X-Received: by 2002:a67:e252:0:b0:643:80f1:350f with SMTP id ada2fe7eead31-673d0531eb5mr3138225137.21.1779463760082;
        Fri, 22 May 2026 08:29:20 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-961738b2babsm1959057241.7.2026.05.22.08.29.19
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 08:29:19 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-6312bdd281eso6610629137.0
        for <linux-clk@vger.kernel.org>; Fri, 22 May 2026 08:29:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+1il2/Si1ZiUemswLUYg/HVgy9AkEGXmR+Kq+PF0cdm6p33bsqXzHiRQVL0MCkR3deE/tOE2DsrA=@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:634:10bd:95c6 with SMTP id
 ada2fe7eead31-673d1c38b59mr4123345137.22.1779463759525; Fri, 22 May 2026
 08:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org> <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 17:29:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
X-Gm-Features: AVHnY4LJMj7MpfiKYvQ9U6raZAqssKkW2xRRdr52QyR92yVonmyMfE85fwhFPPk
Message-ID: <CAMuHMdUNLshTRi8yqOBezHpWc1b=f7VdSyN_+cC=r0dKAi8R7w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 May 2026 at 16:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
