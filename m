Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760E92F39D7
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533187; cv=none; b=je55s9o0GhawfgtkGvKg+JVzhelk0DKrcz8MFBIZDyzusKdeaVJRNtN18ZTiJsENymE9XSI15rPkknu6UpbMWsB/oq1WSNqS4Ub3HxirU3txwdMl9lroJJr1vFJBSfwzGcHQ6fnaS4GlsWooFkdAlb6uIO6swygEPSPTZOGjU8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533187; c=relaxed/simple;
	bh=allQBDylsyvzy4b7xxKpxg8YGaT7Ugf2jj4J2mTkWYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7T2IHVzOtrfejXp/DybzGBcaCQhOE0EBn80cxCyXYtywhA0gZbUtR0pnqwTNJMC8N/wWt7qDPEytuw1WEtjVAPRxJ8yccpU3vsbFbhDdCDUK0Y5HeBSlD7OQIW3C1ayh0oBRyKBGoTapS15MRdiKfGX8xlNg/EUw7qhelpqWEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-94de664b541so293439241.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533185; x=1775137985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzDnEVQxVZBWv38ze2fiTQpDojNrY7cSugpZCyxYmAI=;
        b=Nrh6DowqSyVgK16GBz5RLCSiMbTXyLWM6CWeKjCIS4tv3bxqlmL4GqIUnsvAWqjhKV
         7EoHIDTFUWJSF30iWbQfINzyPZkLcuEYW/fUlSAGGYhNJD8Y3kjQN5bTJ+22hGUDrUKn
         g0HdYEuNdWEsfDNfmqmxW6ipcak2cn0F1kkQdGy/MI1BaQnWMtbkYkAb+/XLKtX6IzU+
         xQLJATnj5SH9vxZ5NcmctKw4Kd62LexCFLl/JQ48JFxewRdjXfUn8CwjFD5bpIOQ3fvY
         kqmEa3yjwqnJWfmGKmuDqQn+XBKSLrWD7OxZrl2V6KBKoKMofJKYMD9zUFf1qEtxV/0t
         U/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXaiKupxPwCfrKiXNyNHVjt+0eHqW986M4tAKU6yNdSpmiYDNeDTJ6fHRnVjjx0t1TelVTWCwDQCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw01+qiKBRkTyqCOLHGgoxYG6VZJUZLbTJpsHubxUyd9oeA3dK/
	xC7yLrlPE0HBf4YlMVFr6GKLM/SAA45UKAcXdKQDP1ifoCLDTe1oVvW3nL+NcKyU46s=
X-Gm-Gg: ATEYQzwaUjPFzYI1LT2AKFNorOeyQK2KXZ8ppKwZDisiObZeKU5v/aAXyNK+0AlGN5K
	DAJaVXZLKAL0m6irMIUevn02BvZYyMm2QOJILkrwvcsnsODMqJ/MucKiiVSj9/s1EhKgFDPoM3z
	13AB8krz4YkH6J7jYvqTGomCLWSOupZtRpeBZyy09GoU6RRa/f02EUeeO/9GvxeCUJqRxuWvs3R
	NzapOgZjkHjBqVWFAb47QWm3xjjfg/qb6TtUzP/asPwfns6ssaEM0t0HR6YuZSgVWhnf2YlQK+3
	gPRxojY9NafFmPTDhDMYkgAs2Vvt7HyatYCXSEpGzPZ8cpmN5Irl7DBdfI1sd3jto/GkWloH1v/
	+wO7FQO1SLuFuRa8PYd3TS5H4Q3Sm3D/4wtd5gKH9icjz+oM+qIDcz0a5/8IFSZ54kBlsVEJG30
	xquCzKDM0biFUqM2+WHUR6dMT6iyfIFZrFPH1ppuEyYFgPL7qGWxH5YFRExsSOo2sSD3kigQxhB
	EA=
X-Received: by 2002:a05:6122:8603:b0:56b:9784:8a2a with SMTP id 71dfb90a1353d-56d22063fa5mr3732373e0c.10.1774533185167;
        Thu, 26 Mar 2026 06:53:05 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d318ff38esm4767766e0c.0.2026.03.26.06.53.04
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:53:04 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso454234e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:53:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV97NP4gbrSu8EBglpFmNVUcO4BrKJ++p3e0YrTVZsrEIcQ+WfzcePPnHMvP+nFqGkwpnPvHB+cP9Y=@vger.kernel.org
X-Received: by 2002:a05:6123:4c:b0:56a:f542:78fb with SMTP id
 71dfb90a1353d-56d21f80b13mr3741795e0c.7.1774533184311; Thu, 26 Mar 2026
 06:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:52:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtXg0q3UCfMQO3sEkp82RfkQZcwrqELjmUXZEV5jF90A@mail.gmail.com>
X-Gm-Features: AQROBzAJ0G4WwA5tQ6aWRHSEvyPd9w-wMcCONronZM5uNnqB1m99PkPK2EgZJI0
Message-ID: <CAMuHMdVtXg0q3UCfMQO3sEkp82RfkQZcwrqELjmUXZEV5jF90A@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] clk: renesas: rzg2l-cpg: Re-enable critical
 module clocks during resume
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> After a suspend/resume cycle, critical module clocks (CLK_IS_CRITICAL) may
> be left disabled as there is no owning driver to restore them, unlike
> regular clocks.
> Add rzg2l_mod_enable_crit_clock_init_mstop() which walks all module clocks
> on resume, re-enables any critical clock found disabled, and then restores
> the MSTOP state for clocks that have one via the existing helper. This
> replaces the direct call to rzg2l_mod_clock_init_mstop() in
> rzg2l_cpg_resume(), preserving the correct clock-before-MSTOP restore
> ordering.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7->v8:
>  * Updated comment in rzg2l_mod_clock_init_mstop_helper() as resume()
>    calls this function.
>  * To avoid setting module state twice and also not to update the initial
>    mstop state for the critical clocks state during probe, replaced
>    rzg2l_mod_clock_endisable()->rzg2l_mod_clock_endisable_helper().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
