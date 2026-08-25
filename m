Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20CE331A53
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787669235; cv=none; b=rvYnoAeKBNda3ahZKkXHoBOQjVk+dAULiylx4VPP6oBz5+p3bRISRRSS6Ng7IIjr5b0ZWeKvlZ86xpQGvrRtmoAYy/6Sboyjskvfo27vQD1GRewmIhVwkQ9T7d/7utqHFTyAgwrxR3HyOac1rwVAj8Y3esuIqSZEv6ho1I5VCRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787669235; c=relaxed/simple;
	bh=nLpkCbwZynXDMfJEEM7Od0jmnvS7H38PKmlDset+WdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1P/nO8fkI0QjfMnJ6SPzVpGJkkNJ5yvN1TjiP/4ylCTq4d1yMrxALTEWdwbnXNfv/IVnYxLn+nywda/NA9b5QB71lnwUloPBatBQa+qQ4nHwYKIZMbK/nC6Nd7FtCqZ+KJiioBuDGtnrAX/vMve3J+ms/W4pGIHo1ejkihbke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c83e34212so5991426d50.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787669230; x=1788274030;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2zVX3GQV5dux+TGrNQ7XOJ1BZI/EApCvZgLsrH7Hjs=;
        b=A6CWjq0zf9RkGF1VOzllQsU9Im88QeCn3bZfS8L4r2mS4r0TMKI3QPgAXt3mpZwh/g
         0RJd4CuVUw9xDvdg8qzdOG625x8fDBFTkktc2KtaLcrFIlVcno8ZyGNGPROhbx/h16no
         uVxDkOldVfCoXpNErBXWOt9ZJ91R8sVirhlfMG0TSwbmIl3y/imAqHMbQ2Ayd9zUh4u/
         iareVJUFLdQWpkG4fJPn4NbA98xxjE1SMXet73czVrD2LN1VpIxS5IHd/rMQ07wvn1Jk
         XeHGBkRYI9gYLj9Ra0hcKmpe/3rhcK6RvHS9XpxsuJSeD7WZ8qaBFeZjY+1uxAPRcMzb
         6yRg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9E/oNCRcd1OZ6ULmS6g4I/EQgOb38XjqojKLNQoMsTEGqZQ22w1/VuGZcfjJOXUOcJZd1B/3FteA=@vger.kernel.org
X-Gm-Message-State: AFuF++npJPD8do03mPQVgYr4dHtgXsKJBTnK+3NVV8EDZDiJha8nrq/T
	szgvxBjy0nZ+YiqKa1qewydEcoETMrv5zhUK2ruI4FDembr/JndKm0W6xvGmHdHX8Dw=
X-Gm-Gg: AR+sD13GieKBJBDXMS3DvEw34HldRacXne9imFdJWKGnTkY/TjG3sYOJTiKbPAk28fP
	GJUsMYnkdUqSiGD7CUfAM45DpePcUMDXaiathAOo5BsY9AriCRG57KGEmNoK2RcjpciFYaYNspU
	4eaapiGLr2D42RredZlOk4ikWI6KSfKsg8RB1jU3c+i9/XRS96hWKdv/CSjK2Tg26Y/O3Um1SvO
	rLYOH5IlMFn4R7MvZyiihxjEusNAuM/L6Q+gyh0NkEMk8fp6IM4h4l5m+EmG+2rILA11Mj7K8RQ
	g3qmAwXcOWnzvLk3W+hYRWm+IjnlVMuHgCe2ssE4j6+a22sPmLhaWpHSGVJilWFYv3nq90WFAOg
	NEie31EjuGR6buVpqqYHqNAlfA4n4AnZtXYjxYcRGehtwC9/5mI9sN5q6L45kfivAgtsvJXOm64
	mSZBdE2f3M5mORreHryQ5iy0DrMIOAeKo3puUhIeTNcL40BmZ0s7trj9o5jAx9n/WnnRDBmgBLy
	RVwazGe0TnbNu83MPZvgcOIsmWT1A==
X-Received: by 2002:a53:ad08:0:b0:66d:236b:dc75 with SMTP id 956f58d0204a3-66d23eed08fmr187926d50.48.1787669230140;
        Tue, 25 Aug 2026 07:47:10 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66d245524a8sm64451d50.1.2026.08.25.07.47.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:47:09 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8565d77c277so6813957b3.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 07:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqYalnfD1SWrCVYpZQL8N25ylM6XW7T0KSzbV8I8nCEeLPPHFZJIv+FZbhH/QL5h6z/rG6gp+72/1s=@vger.kernel.org
X-Received: by 2002:a05:6102:956:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-77bd288c901mr8711759137.11.1787668885681; Tue, 25 Aug 2026
 07:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev> <20260714173315.1981708-7-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-7-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 16:41:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMhfr=rp9G8X-+=AR5vqW5VrJfrKwjVrHEKk_kJOh0ZQ@mail.gmail.com>
X-Gm-Features: AcwNN1XcBg5LXeoVHCFcLS1DZhjQyfJuS_scF13yf7YemR1ca_DnmJdOHtxK55I
Message-ID: <CAMuHMdXMhfr=rp9G8X-+=AR5vqW5VrJfrKwjVrHEKk_kJOh0ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add support for Renesas RZ/G3S
>
> The Renesas RZ/G3S CAN-FD controller is largely compatible with the
> variant found on the Renesas RZ/G3E. The main differences are:
> - the RZ/G3S provides 16 AFL pages
> - the RZ/G3S supports only two channels
> - the RZ/G3S supports only CAN-FD operation and does not implement the
>   bits used to select between classical CAN-only and CAN FD-only modes.
> - the RZ/G3S includes an internal divider that allows the peripheral
>   clock to be used as the CAN FD clock source.
>
> Add support for the Renesas RZ/G3S.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
