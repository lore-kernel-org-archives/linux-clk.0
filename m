Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F15B3C4540
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 12:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157838; cv=none; b=fptQctwZhyM0MfZWWTyC161H/8pVN7oja/aPbeWUJFgfJRnjSnjphOuKNnrL4SkL4crlDrdUonslZtfm4sgAnxhciUCchOWyhiQ6TRuAe7lDwJlGUMW1VpKzH0oZXg8L9ip8Kw40Qh8upoDdbzPnzviDTB3rgSrV05iiHOXQBVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157838; c=relaxed/simple;
	bh=rft0aVnDH8ZzPFslD/JdSdefiUxSK0vyAFPTrermtaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZoftrWMX53J0YganzAe8Jc8zQDhTrkoXNq6UIPlyThKRTuUzKX1t9sT7C2vslCir7cFQU6lqWB87m1D4YBLs12VXbVVCqbM50yTorVGbOGIyN2Nmax+SfZy0DYAGqKAYcrxHqhispjCYseTEGYgcxgk9WEvejcKUGhWsZPXwagY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bc2a455fd55so114732366b.2
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778157836; x=1778762636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU1MIdjdd4TqOwGpxaQwie0Eo0zv2bJJ/ujL1e37AW0=;
        b=GpUO39kABaCp32TToz6+1jhl6/9+jTIT9CvY77ESKCT7Fc7CyjeZVxwbTw2am9ZNTo
         ssUUgkl1ONfSVolKCNraresqm6xSg7IlumxNCnTlqrnvb0BmZJWCrNchs60VJWgYJzGb
         v5q3IQaeW9JlYIaAaqzUT9LJ0eSNazqPHsHA8yu7PlbXNsco3b7H4433zjgMfilQhpdy
         oMv4KpSVntVvHZecD7P+8lj++w4qXSuE3WtssN5BLeEOLy9ZRsq0c1A0wJV7nnIRHJtk
         1qqc1XBia6qYjZynj8ewD4GlMKqUuF3/EgsCKtrUoREze1GValS9RqsTz4j30yC8l9gf
         NdLw==
X-Forwarded-Encrypted: i=1; AFNElJ91VMDZQzP4VGQyjTcJsUcXoR/Bxbx2m942z6nOaqnfbZnIu1qfxZZWxR8HhpI2iwPWJGW6Ck0wbVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZxSCgCyoyB/RctT4RBi+QTmN8vkXnEME0DqkyO0J2brU7YOla
	9eekesXLkJyVs+v5n2wlBN+Q8fzD0wJv2TEFg8HIRSISXA7ysnPpOfwASaD1vCnr4Fc=
X-Gm-Gg: AeBDieuYmqx7RVw47bJD87kq4BQlOZfMldYFErTV6Rb3vytv2aVNodyXxK15lswQ2Is
	bdHJW+FpN+HFV3XIqIWiV6QzhLVrUR22cpvE9DtXcZ1JnwhUQwJhLgaJb9PnoS7WXZHXlpn5l33
	lyfBCrgNYWC5F3XQkFtShHl81AHxe02N5pyvLoj60t8ggriMH4fSQGK3s8RbEpVkfTb43TS0lnO
	Z9WEWKXGadzApETUo4kQLgkrwmKAnSB/pfOvPCSEdlzNlSg9e63h4V6MeJwDDLNL6kaCTsAfeP3
	Jjd7Pi2tA8eWzNZZ+4brJhG4WPHD5jR1vyaTHBCjO8xNwu014ZFVLMeXj5ygdQ5t1c34QdGPeWz
	h7YN8C5Yv8nVxF5nEuJpU4EjV16JX8aDCUhjRfOc0qCJLD/kpiPNchzZth2cy3mTrLD81txLF5x
	pKuUn5cfqJGmAv3HrmLYn83SzaeMEEEYnBUw4It+5ZxcmfjvVHhGmDj4tgNpPwEE4qTW1g18b6o
	v8KT0XmRQ==
X-Received: by 2002:a17:907:7b94:b0:bc3:6acd:f3f with SMTP id a640c23a62f3a-bc56b8394d1mr422466066b.19.1778157835042;
        Thu, 07 May 2026 05:43:55 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc81cd34da8sm80950866b.11.2026.05.07.05.43.53
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:43:53 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b941762394aso126555966b.1
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 05:43:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZdlZ72Hf8vms4OOgAOxkEIJdPb1MUec/qoUYxqdrvQ5f+rsyWsoKPTQOwxQWcc/U7SzuInTmkb+g=@vger.kernel.org
X-Received: by 2002:a17:906:7944:b0:bb7:be3b:ba3e with SMTP id
 a640c23a62f3a-bc56e01902emr413569866b.45.1778157833530; Thu, 07 May 2026
 05:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com> <20260505071544.8965-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505071544.8965-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:43:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2Dt4=ptwoaXNttV6gAa=G4mtGRYtA_z3qdqcUtd8A2w@mail.gmail.com>
X-Gm-Features: AVHnY4I9idqK1VcaIrFYUBfD3vXqjTzr4uBBYEWs1epY9RmzhXeZEn8Y3hIUwgM
Message-ID: <CAMuHMdU2Dt4=ptwoaXNttV6gAa=G4mtGRYtA_z3qdqcUtd8A2w@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: r9a08g046: Add clock and reset entries
 for the RSCI
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 5 May 2026 at 09:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for the Serial Communications Interface (RSCI)
> found on the RZ/G3L SoC. This includes various dividers and mux clocks
> needed for the four RSCI channels.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -137,6 +167,7 @@ static const char * const sel_eth0_rm[] = { ".pll6_div10", "eth0_rxc_rx_clk" };
>  static const char * const sel_eth1_tx[] = { ".div_eth1_tr", "eth1_txc_tx_clk" };
>  static const char * const sel_eth1_rx[] = { ".div_eth1_tr", "eth1_rxc_rx_clk" };
>  static const char * const sel_eth1_rm[] = { ".pll6_div10", "eth1_rxc_rx_clk" };
> +static const char * const sel_rsci[] = { ".pll2_div5", ".pll2_div6", ".pll2_div7", ".pll2_div2_4" };

OK if I rename sel_rsci to sel_rsci_rspi while applying, so it can
be reused?

>  static const char * const sel_eth0_clk_tx_i[] = { ".sel_eth0_tx", ".div_eth0_rm" };
>  static const char * const sel_eth0_clk_rx_i[] = { ".sel_eth0_rx", ".div_eth0_rm" };
>  static const char * const sel_eth1_clk_tx_i[] = { ".sel_eth1_tx", ".div_eth1_rm" };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
