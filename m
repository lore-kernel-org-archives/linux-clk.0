Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0CB21CA13
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 13:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533157; cv=none; b=Bo98wQiCyDOrfH9R8dzzF+NXQZQhKJjhX93ftyUJ5qFGcNHst82GmqQoiI0JyOqugSLnZzYdXTKygWK1RVsWIj+5YDDyG42gt7BdvDit71DKFpjcUga6KkLBGTIvzQMUEIT98PmK4BdZUHs6upr35ZRtfsBd2C76IHa6szt5U1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533157; c=relaxed/simple;
	bh=2WS1pWOrnRdikMjrPLLMfFl5HfazgYWGkCTV2dU/KsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZR61+KJV6txbnrh09J+RQNHbN9AXrSg55Vxw67A839J+xt6PMhCbWWfRI2ia2halkXdeQN7jVUtz5EqqUoBwaVT+EaOTRvygzy5QjTHf7QihWIPoetcEkB6wFvT7CY/t8NCRh5cm/VPO0/rJKRmo+KCV55Vsye7pkwQEcWgnuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so277570241.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533156; x=1775137956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ysjP5a+B96pRuzECfyLK+hXAxAu29VfLSma5EDPanM=;
        b=qKD2iRg8HIXQxdL+UtITWIGNWRDrADOv1Dzej/6dvrDeArdqaJPotFpQg+ZjTFHyCT
         DhOrI7QPQWQjdlzsWJnmvrAEjqW7NRCzOkmNfqq8kobcyiKWJ9DTuHnAIbE/BqkDSYD7
         Kjby3dHrzTMxp8+wYxr7jakNw13Qj9GMX8B4xIb4BeGFFhuA1Sv+m95yMocIL2kKTFrF
         0656+dkB7fbe1ew+JHiM5MpcmhSRmdEN8kvQxLAw6DHHbYpQBjDyQFWBmPawkxjHPEWB
         vI7K/EjgPhslgIB8fv7MDHWQTsrt4elYX/Wiyv67Vw0yIKdE98o+LemdKqbiTFiXTs1j
         mOaw==
X-Forwarded-Encrypted: i=1; AJvYcCWbMj9nMe7BJBoMe0qelg0nBIfBOkqFtUDWzxdAYRng1PajzqqgXubT2R360AtVvGVrSGqqZLCUxvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSKC+CCLcbjnZ1wb6lpaWxNOuhFG31jlaWWBVeKyhqLwnkAn8
	CrFPHl+S1n8QzZgM2/SWrl6VocL+ZR3nayoiTqHi7D/2n6xtkES5qsbiXP2BXU6WMyI=
X-Gm-Gg: ATEYQzwiPXSmwPyI7wQ27i9Lu3lEjUIvwh1vEm/y+7IRwZCMz6FwCBz0N1QeflthV5J
	pMNqEP+H2WXn4tVVhR8dDFaBk4Lsh+NexI7YUhz/joJUZkxD7tVR+M3EXMF1iDVJ1UQA0aNZwch
	NGFIg+nKspN7QTtn60VsoVr/BUxEse2cE2OJIqiTNmPDYwVTgxXfK9HuNHeMPTA9yeEiP7HaG5O
	QBgZu4QNZb6YitXzBeVtjAM6xpD7HZv7O/Yo0QSSbyhmiM549hUQTLmraFOBWRC6brihChIKLoZ
	nVfcAIh4C1/9dWk06y8mikfPLCllOv9qWjcPpD9eBGGj0GSqga8cZbOqjfaARnJSMnbxpsFrIbJ
	MyyAPJo55xUuPvz4lqu1X7WvTHIcEyJRlrORiLE3H+D3L4DnPXOFay0YxBHC5fcnpnM8tVUhVeu
	qXTvjY8ZucLDZbALBcs5hkMr+iWeyDfNrKXLxymAxP2Lzw3mAPQQb0l7+0cJ0e
X-Received: by 2002:a05:6102:3f51:b0:603:2432:9fe4 with SMTP id ada2fe7eead31-603873188dfmr3447166137.27.1774533155517;
        Thu, 26 Mar 2026 06:52:35 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be5afc43sm3597593241.13.2026.03.26.06.52.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:52:34 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-950b77942deso300664241.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 06:52:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXhjl3pjhSCNgLQMRQmSdxtnyBKOxDt93woS+ugwnihhXLWP+2DPD5hH/zr3bf979DnV5fK+UtDNGA=@vger.kernel.org
X-Received: by 2002:a05:6102:8091:b0:604:d2c4:98e5 with SMTP id
 ada2fe7eead31-604d2c4a190mr1811064137.21.1774533153627; Thu, 26 Mar 2026
 06:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:52:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVE8m0eecRcNCXKZJ0sZaS8_0zki9U1+nD47gPmYY_7JA@mail.gmail.com>
X-Gm-Features: AQROBzA0Vdc8m-cj4-2ur0khV-FgVpkh92Y_dq8oIvaD3RiOpSnCN6m0_EvBGfw
Message-ID: <CAMuHMdVE8m0eecRcNCXKZJ0sZaS8_0zki9U1+nD47gPmYY_7JA@mail.gmail.com>
Subject: Re: [PATCH v8 05/11] clk: renesas: rzg2l-cpg: Add rzg2l_mod_clock_init_mstop_helper()
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Refactor the mstop initialisation logic in rzg2l_mod_clock_init_mstop()
> into a dedicated helper function rzg2l_mod_clock_init_mstop_helper(). This
> decouples the logic for setting module stop state on disabled clocks from
> the iteration loop, allowing it to be reused during resume to re-enable
> critical clocks.
>
> No functional change.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
