Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0333F58D8
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700935; cv=none; b=iBkmyaTgv3im4cOJn3Imf8BejjnP8zlXvrhE9QRQ5rzugDiXRg/xZu3gLoce4mWB7SPiOKOuy98uq682KA0rMBRDQxTu3+zqJabW5UqLOuO0SxofonaiT37CCaO8VNFJJuiM5g/I4fK9vky59uXMJIGoBmk01MqepKUkaNR0PSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700935; c=relaxed/simple;
	bh=0/aJZ1+qcFjE5raZSmrVX9byG/kJAxaY8lPPVD7F6bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UEAvfZOjdCMPdWumTUdzhEmo4NehZVkKA/00PZE+hb2rlaM/AHKdBpa0r10whk13+zUSUAAKOYIXoQlugjU2TBmmmYQG+W0OpwFe2zs3yOt+Q166OdE+HTewtmVFGn0ID6jwxXx7WVPr/WA8WOt1OJmituW0jUOBbtQcl5SPONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-59dc1714d44so1926620e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700933; x=1782305733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swsEpNagNzyxpR27JaeGBqQ3WkRXyoY0gcVkfq2WrNA=;
        b=KGMbd/+FYw21QNechIVb+vsLuaFlHAo2BgMlkuKvo62LOhBz0sD6u/8BNDKCnxEo6V
         6szkoCLWNJfnY1o1h2SfFFwyxnLYAXhqOIaR+SgXdnRgz02M+EgVPB4DZVnxPDsMdpaB
         vaYANvrjVwFuc3PDEOGb8ueCQStgDiPAsISyRnXAah99mjVJgNzz/rWmXbOilRgIV5IY
         dofnumKXsQs++xkLf+vMGBuuMAoOH4rNDjqcS4JZX5UWHlE4uj4xZPJkqBmb4NQ/H/jX
         +Ety7+FplEuQKAhG0WoyMULRrD8kVCuf3musQQecM/XRa7IArg+CUVOZhYalK7b2GFIo
         aVGw==
X-Forwarded-Encrypted: i=1; AFNElJ+rlLH0AbToBLR1XuVgY23c+QEeeZLwd8US3Wipcc7WSjP4VuCsotcA/M+PzAC0Z/NMNLotH+CH1co=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRbKlHwxVr6Wjtx5dvqvIveW8kbj4ziDzOddC30LgVyEmb49m
	9vGOJ5NpDkKweFP8xqN+z6nKl6+/fC0lwDKfcbrMZPjxRygRTnABqKKHLE+EHijL
X-Gm-Gg: AfdE7clld548qIeD6i3Cb8eHy6alCmXnEsDma+RSTTbJLqDouNP4sfFI4UjW/GcNIYB
	QdbFv3xIbTyuAzl6Ct1BpzpQ/uB41e7AZXteNHkopSEfiZga3JkMcZUKFdbuQ4yg9HQYACTm9U5
	tZ3/jibDUqj0M4h4ubq4S2Ba68W/PtpNSbHGrR+5ofpAgxwqLcX0jLfnf9t2uBafycbyqF1fwiA
	3sTxe328PyO9BzmrNtFlnJYAQRuAF2EAnG8/oZzs0EVYbUiN9Z46NoXLzsJlHkexXxsEIara0sT
	3gLDpLlGOtVfYMMNnjnvqlGA9HJnCLDpJ1sVGWTcny/ByJEF3PEZ/nzgVz+ojiGXkXNLgKOQPBB
	W7/GQkjBMlnhbnXgrlDOOxbGhTWIb50P13xD566CKwp1N/8H40536uVeW/Pd0Hn6cvO/SHDNoMI
	dmZBbaNjTvHoDhceleG2RXM9qZNi3FfUH9tPJF6gvjzEvjmeWlwJGsK5ySZtz2WDXG
X-Received: by 2002:a05:6122:658a:b0:575:24a9:78da with SMTP id 71dfb90a1353d-5bbbe6f8b86mr1739432e0c.11.1781700932634;
        Wed, 17 Jun 2026 05:55:32 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966a05a7067sm7312832241.9.2026.06.17.05.55.31
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:55:32 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso2134751e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 05:55:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ppFJOfsyKft/Np3jmbIPAJNtQgPyfpJG4z3xv/Ir/t53KsqZwQclxtDqIRby6y7RSC3Uw+69HWvE=@vger.kernel.org
X-Received: by 2002:a05:6122:658a:b0:575:24a9:78da with SMTP id
 71dfb90a1353d-5bbbe6f8b86mr1739412e0c.11.1781700931517; Wed, 17 Jun 2026
 05:55:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com> <20260603065731.93243-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603065731.93243-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 14:55:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX_a799cCu4CtA-A98BOSeWJfmhoQjG23UDNsivrdJOtQ@mail.gmail.com>
X-Gm-Features: AVVi8CcRu24rZi7169625C1e-vNyTdWNf4LeGohuQVxPxnk-RbJiJI4sNd-KtyA
Message-ID: <CAMuHMdX_a799cCu4CtA-A98BOSeWJfmhoQjG23UDNsivrdJOtQ@mail.gmail.com>
Subject: Re: [PATCH v17 02/17] clk: renesas: r9a08g046: Add clock and reset
 entries for SDHI
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jun 2026 at 08:57, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add clock and reset entries for SDHI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
