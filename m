Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E434AF177
	for <linux-clk@vger.kernel.org>; Thu,  3 Sep 2026 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442793; cv=none; b=kBeLDKug/SL20odSUMuiC0cQr9s45a9kqx2Y3w8azoRiegutMq/AbumzhHMkZHP5qqc5CdSLOat32saDkCC2C9lHRJkRFhWVTq6xUDxkXHbagF5McfhdlAI9j23uf5Eu6KdR1kRYrTr474g4ZmpbCwIm8Fzkvi86NGsRoBhkPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442793; c=relaxed/simple;
	bh=ImQDDFj9qVjPIWDEX0xwmDVNDBDG8sj0eUt9eSQ9/DY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZd6VB3Wf1b78dvYUSBlIQxDaYvXT+yZXSTfMkOIlqs9kyfDVRpvtQ2rhFqEuUwcOaQ/itqkFIIM4SCgX3sIL9BX1+PFdDVxhctQuKRRnoJnR/ABS0tPL8RmSugI1EW9+RDq2GU979qdOct7kUyE3TUR6miXmljlgn2qUjO4/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4035536a12.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442767; x=1789047567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3kI/3YoXSD5l4MUFY+JdTBHSS/S10bVdqe61ILAQItw=;
        b=U8YAcLgymnZNkjL04JpFe3cn4WHxpCvZJ9rrMalALILZlCurHMPcK9/ZZBsulIpEh2
         udZaFh4PdqIWZpDdpKkDjxE4BQHaGQgnH6lUmbXBg0BnLlGW+tBQKuwwq+Sh+zihCoWo
         hwtWztX1hKCI9N2eeFrScG7ciXWmf2xARZTpa2681c424x9AgeDiySLWlWfQldP9AA5I
         B91/QDVOjKmhAhokReEtOzbePaTQbcfYZJTdEqAHQ6k3rnPjOAs8PYDWWuXEDjQ2j3kt
         33lTbn4LvlxwkfrUzBrvz/zpbw2OMGoDhQHH5iJ/ZmJEz/BPDU0u+ul/FUjE0dz6FbRd
         3nbg==
X-Forwarded-Encrypted: i=1; AKwUvBwBbcpUn+b4EzMTj4PZ+1zUA3p1HfiPtMbCacIiGPTQLUudJ95/JVnhvxIS/5lLdgUsGQYAoLicglQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kbub1fMBx7FB1xzLNQuVdKRiYoKJWuX7xaScY1S2xeze2QKApZ
	b3beAIdWzKKgIP4zvssAdjhqT2kSRWjM4e326PyHVCDLXLgYruwzsDGFJ7YjYjWLc58=
X-Gm-Gg: AYBFou2y9RJCfaj/pfaZYA8yi6toVDOtx8WEvqCMe6/yTnwP3YVexwQmgiqqItTXwVd
	YTcjLsE0CeL/u0w6dhDrqtW1PbupUW2iFpeLR3oX5AyJDkL8yxUSb5yOyG/ZNl0/uRPjQCtvzrI
	9AceZgcrZGrJLhSSKFJk5j7rgJTpBh0bpLxGs/LE+X91A8ojse4kuy9KSU22minEmu17RoHVk1a
	HoWz8bKuvfN5zls0vQWpbjsVyjF3JFLUUJhxeYquZO5An5i9FuH3qyjHsoFpzBjdK3eheSH/vEt
	ObPl4DuBbX8Tf55QL+wvYSEBkB3TPOvDgai/SDPpm1zUUK1LA+8g0oQTFMv7ePRQCiu2GeizL7v
	VlLLhLky48WdaYA47VoTtkGSr5CdNZg4/2yEWAkgk6kW5SIxzL2GxjgvNkTYa3n+Bre3jPdboJA
	vpwDcgTsujIstrarywIBCZfb1gY217dBoXVcV0S4evRRewfA8ht2Hs1w+HGYpHGjoK/y20+CRGx
	Fr98v5CuoDyFrje9TzAAymAAeMbCU+V7uEr
X-Received: by 2002:a05:6402:540c:b0:6a0:a4f5:f4eb with SMTP id 4fb4d7f45d1cf-6a68234c402mr9053052a12.4.1788442766545;
        Thu, 03 Sep 2026 06:39:26 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895f34sm2410360a12.6.2026.09.03.06.39.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:39:26 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4035327a12.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Sep 2026 06:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3z+b6ULh06qkxX0o+KnbPCsqtQ3hwk+VZRhzOl6P0Lmr+adxM5GMcHt7pes4QqnQrLzvrs9M7CnI=@vger.kernel.org
X-Received: by 2002:a05:6402:24d7:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6a68254b68bmr7079678a12.7.1788442762167; Thu, 03 Sep 2026
 06:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902104939.25522-1-ovidiu.panait.rb@renesas.com> <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260902104939.25522-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 15:39:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZrmXfpmuxQdw6phK1YGJHyhndT64vmsdzHE9FO19jJQ@mail.gmail.com>
X-Gm-Features: AcwNN1XvRbtPP7ZOjowl3YDbtGxIvYTtX57sf45BGJvcFDqDNY8G0uf9IogwGTU
Message-ID: <CAMuHMdUZrmXfpmuxQdw6phK1YGJHyhndT64vmsdzHE9FO19jJQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Convert to clk_hw based provider API
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, John Madieu <john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 2 Sept 2026 at 12:50, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> From: John Madieu <john.madieu.xa@bp.renesas.com>
>
> The driver mixes the clk consumer API with the clk_hw provider API for
> its internal clock storage and OF lookup callback. Convert it to use
> clk_hw consistently.
>
> No functional change intended.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Nice, thanks a lot for picking up John's legacy!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
