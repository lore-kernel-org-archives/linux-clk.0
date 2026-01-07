Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBCC22A4E8
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802278; cv=none; b=aTxFaWXdiCS6cK0alSltA8eq6m+dISlKOq/+9bfjCf+e4F1OSbaN6quep1iVAwi1zyrhooJYm63GsrXGIhUDeNta1P7a/ZvCAhxB5sFgV3W3qyHHH0RJoJ8FQ2PZHQsBzpX7gKNLfjqp8qBkA+wCNFKIv5J0m/SRmNwzmvMFtBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802278; c=relaxed/simple;
	bh=CpBdb8uA3gICTaZOWderu+gSLW0UKeJVNwn2Z74IFJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOQZfvNkEPr/1uyt/NZa/a62h91rgua5uLFvEEiAKHsmBh2W1OXMTMNXckH6EurHsSpDLw2NWS5Hn0/vOIOLKQ/cZVoxTFD/NHBtZ3nSWOG3REcCG8z4UiqtjHWB2TAfyZEy2WaxHxEn4Nr4QPwoqHDOj/WIKqgl2Cq/ewSlzVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3f0ec55ce57so1485972fac.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 08:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802267; x=1768407067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+WCu+NesYEsPhaWEsmjj2oKeCV3O8/e7q9g5ocoFc8=;
        b=jcaV6A5GqJ8JCMEOgTjr2Ufja1OxYSuX46q7IovKigIIFbBRScCitSmxPbQ+2ktOdF
         PO/tP0IWxcY4gquQZ7qRZaWwLQRv5OQ1FkVS33vUngE8y8kpBqpGM1orQ2TakmqOBn96
         CeXU2WPNOuZSuKdtrPzlgHreX+iHo0ofh19U0PSn1eX6qd0mcVwdBDgy5dsJGfhXn9n8
         G6wr1zJCxw+Nn04NFSVUxhv2bqNRTaPbS4aT5uomC8RdGKMpP//eUy6rhLlM1eDTocZ+
         BUZyWtKZMP4Aj62MdYWOJDg0RH0OWMbm/EqHhTXf36P7UqlVX+Mn4eeK3rpCPSOluEfg
         v2CA==
X-Forwarded-Encrypted: i=1; AJvYcCVRP30J2uxpx7zhTSypHl6SY4t0phxnsIwWzVz7Wudi0wLODFXYrr4FZ1iCvfQLoeucEutWJyp2msQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjqtSu13cqPHZncanED/IWyjixh/+meQQt0q4LXt8G9ZcTejsO
	gaxkwiV9Tg+Q2EVmcXzTixHEO0Odct64KSoBfcFUoM3Hr8VlgOvT53AXq0WAEhaR
X-Gm-Gg: AY/fxX6GrvZMFDZ/dcQ+V1z9y+vRGYpAr82/7vkuZBXZSEz3rIhN+uiwk53Isy6qpWX
	86biDNRXeXRM7qaK7+PbbvElbm57CsqbimOiy3+9lb37wgV7YP3uiBs1STWjrSBno3xTCV1aiKi
	4ViUlOO7jjRrfyvDSObBSB8rq/tCMLzI0KSrZ/RudCHhkHrY+qOeNpnlcDuU1EsYVecFu89l1eE
	sPS565xhbaxhnEj8sUuzqd+O05orAbAWFVe1AnB4qSz8owr6iHmgZCIroBQiJvp8JOnF1cYTY2E
	Ehx8L+3tgik0G+89u2fG6PFEsGN61uDW3ulc9sLCQ0LUA8jEblmq9YNautbRKEAGJznswjMnPSX
	OprfrYcTheSIPo6yck0USALBXy7Si6MUy3HipGc+MI+rlnFdnccZFl9vHD0SvOh4FnIiAiDRBBX
	IFKeS4/sNkWqsydUPHI4XOAAgZ3wxSbRT6Lc+uSISrLZdgVi8AJUsG
X-Google-Smtp-Source: AGHT+IEpwScbv0V8FJuHA3iMIqjUxEJsyE+PKMICUJg8Sx7aWaTmXqwLmivHaaTaoj5W7cRmv8RzOw==
X-Received: by 2002:a05:6122:421b:b0:559:b2cb:5dad with SMTP id 71dfb90a1353d-56347d54f4bmr963279e0c.3.1767795804870;
        Wed, 07 Jan 2026 06:23:24 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a3f78d8sm3107194e0c.10.2026.01.07.06.23.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:23:23 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-560227999d2so707154e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 07 Jan 2026 06:23:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUh8lBY+DIbKfWXHAJCWyiLeIHeE28I4+WLJAqot+Bgsi7am2ezKYoAn1PzZLc6PqKLPHq/AEdvivI=@vger.kernel.org
X-Received: by 2002:a05:6122:459a:b0:55b:74ac:72cf with SMTP id
 71dfb90a1353d-56347ffe7d5mr865823e0c.17.1767795803413; Wed, 07 Jan 2026
 06:23:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 Jan 2026 15:23:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
X-Gm-Features: AQt7F2p2JFuPY0xBDR_ju4-zvH5ugvq6zrCABYNExmkCYao6s0vjsGxlKuY5Ntk
Message-ID: <CAMuHMdVsupnaWOWkus769mp4Psn-z=5mYin4EwbX3xn0crJU_g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Unlock before reset verification
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Pavel Machek <pavel@nabladev.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Jan 2026 at 15:06, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Move spin_unlock_irqrestore() before verifying the reset result and
> printing errors. The verification condition only uses local variables
> and does not require locking.
>
> Reported-by: Pavel Machek <pavel@nabladev.com>
> Closes: https://lore.kernel.org/all/aVujAQJSDn6WyORK@duo.ucw.cz/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -806,14 +806,12 @@ static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcdev,
>
>         /* Verify the operation */
>         val = readl(reg_addr);
> +       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);

I will surround this by blank lines while applying.

>         if (set == !(bitmask & val)) {
>                 dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
> -               spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
>                 return -EIO;
>         }
>
> -       spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> -
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
