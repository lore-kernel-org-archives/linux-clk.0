Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827C33DDDC4
	for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106091; cv=none; b=F3fRduOn+3PnKSBfydoyHAuSqE1eNu9frPFJWBITHqKUgzIUA11pwUnLtpt6PF57ewE6RA34yrMgBAi8zOqTnMF4cCwtzbZWdpftde+rV/vpmvszrjDC3Rp9kSTJx7bvpaUdFxthc6cnyk6ANcNi3ma8yt1EKxtjgcNpSpqAR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106091; c=relaxed/simple;
	bh=4D+d1b3Trs/CMs5Bj38QykZaXyZasuM9OpqfOKndXxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1+DrVjPYfK8MREMZZTyx47DONcwuvvoSO4NcVf2WJl1Zu/liFLmhVLs+RALK5NKh/qprIe6JN1m7EWOhX+AAzEFLNQuWw6saJ3m9vOK3Dyj1+bMLTCQvndAohtGK9aq30SHWHH6BVZCtsZEvPt5QROufVKP+uzOD/Pyx13vQH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso927983e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106086; x=1784710886;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7NaVzb/e9FWmfB5ARe3x7cY0vDrs37XFuu/XUXFp10g=;
        b=dSv2JxZKi05S7KWSd0nNCvzDq+OgKRbiTrP9AZ1UH3LkKvKZWtQEYpuXid4d1wS7QK
         HUPXLwAy0UYzpCpRrZE0C7g2fDvybhMGbAtRjXXnqV1naJLadnQrDJ3uI0Fkre5yrFuc
         p7cNwRjgWDtxcZmnrNbwq+ovGhRhfyQSKxos8NpK39ueWrfZmFzq4OjuUVZbGbSkpuUF
         3G6dS/D025UcstmCC+YLasbdZVPSNTKCsbz711gTbxLkp/rC5D1ndzKLurS5cbll09LT
         eQao9TtSjoCPwgeUY/f/bUP1v9KMsKLgmLCdDozQieac8pODy2TewttainfZ2+l3Jxit
         Hzaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr33lNxGavpEsWhs1CyF9gsS3MZJKz2xwNhTIi9zctVBNYH0lgySS7FaGWcpsoxMHDDMO2LHDN6Sas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkfeXhsTw7OgXe3QJUZ3umSBxk4Feof7Yl+njEBqvNaaPrkPyp
	FjZvcWLEb2n00HQRRFgH3bFky9+jc4UPhOdepoyUpwv+ZyLUGkT36ZZzoVgZ7yTAinY=
X-Gm-Gg: AfdE7clU0apspY/4/K2aQYCODlwrNLk6XsyvHjoNBkxZHaoDI8w9wuUcxhUDvN5VALO
	08jiMHNzgsBVM6+R4l8SsAdxnA/DPS63ZGaFW8unHpOkgFxXmYvQyu5PdxP7OEpVvRiY/jzvV4h
	cZzsUO6wPeiVGpY479gl2H76+zZ6iylN3UTdeTHCwRqxznpD546isWpDHFhzUJhepldResJba7w
	G8w4CbYOeIXzCO36MoOv8l00YX+9XkoQ/K6eYtKaGoZpbugCcjC2pIabUOG3ZBB/lmHunAue1FV
	9+DgwXTBOdVZBvQapmi0HbVEfwViHK8k4z+ZSjwOWkoRYNvuBKzGukCK2uqXElaEl2U/2pirp/E
	7Qd7U1aWcoiflbMVINKwkufyAdAgUeQeeTNxv214amCOkugj+VOdEGarp+0QOsrX6iBsSmccZd5
	VySPxGLgSoodOay9dXBhQd5K06dMY+KeXK5Ak2bFTL3e9/7q8JhfiVJQ==
X-Received: by 2002:a05:6122:62f1:b0:5bd:bcb1:453b with SMTP id 71dfb90a1353d-5bfbf2def57mr9507101e0c.10.1784106086045;
        Wed, 15 Jul 2026 02:01:26 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bfba710bd9sm8223760e0c.12.2026.07.15.02.01.23
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:01:24 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so1076507e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Jul 2026 02:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr8/FYlNtsRLK2duLIVvHbLsYWiRzeE8HlvlA3ai604vB9wz2yGHV+Ss1TxISlc6AluM3uqsL3yx3w=@vger.kernel.org
X-Received: by 2002:a05:6122:787:b0:5a5:3eea:4513 with SMTP id
 71dfb90a1353d-5bfbf34947bmr9390069e0c.12.1784106083256; Wed, 15 Jul 2026
 02:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260714173315.1981708-1-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 11:01:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULuz6E+zHt5W9Z9ik05ALSyMz4tkV-mGRTg3Nh=Wx_Hw@mail.gmail.com>
X-Gm-Features: AUfX_mwvtCJ6mQlGxoH1JvfSPfIrIHfInpMsp-NWrZ7U05hkN4A9x-SDsqPOads
Message-ID: <CAMuHMdULuz6E+zHt5W9Z9ik05ALSyMz4tkV-mGRTg3Nh=Wx_Hw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, biju.das.jz@bp.renesas.com, 
	fabrizio.castro.jz@renesas.com, claudiu.beznea@tuxon.dev, 
	linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 14 Jul 2026 at 19:33, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Hi,
>
> Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> fix patch was added on the CAN driver.
>
> Thank you,
> Claudiu
>
> Changes in v3:
> - addressed sashiko review comments

FTR, this doesn't provide any real information.
Fortunately you do list the actual changes in the individual patches ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
