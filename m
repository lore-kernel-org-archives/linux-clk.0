Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B92333506D
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 15:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441294; cv=none; b=VKBj+P9gVQRxga+1+uCcLHdbXOGZtyIFFLzEUR+SwWFjmTzv/zxLJHA+uOaMX1AmDcVvEEsFc/m55asePD3pFEebTydEVAt2nFVs9k3Ccyp2YTlrGGXm5kEFiAb1Omkr1CTLXlE+D87uxly2a5kW/IiKTYF2M2bldDLgJX6/sNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441294; c=relaxed/simple;
	bh=nTZYFAn4zz6jIv7uFk83h22IU8Xvf0ATPw3U8GxauAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0mMfNQCVR2QEZxGSTY7dBS1Kp12bKyQin5SqPzlFR+7JWONltvZxSQAUb4SqmezUv+kum7lFTezYH6btbv+8APvlBQY1mk6kurOa5v9UnkRmlEbAvYlANvkuY6p2bQsq4kZl3/f7lXfovovGtdzGzCfu1mBja/j5SD9OladaQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso1661559137.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441292; x=1770046092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqPSDhihrPdf4Khj2S8qKHDF644mb07LvFd5WqEIjGc=;
        b=k0z77wGXZwIB5XSDFwRoRbC5rIKQxn4nJ0mG4xrdDhwokWCt9yIo0T3ZmGrSGsOHuz
         0cElUl1xX0BkvOoz/9VmBujKeYmKEk10MpRbpW2x08Ju8wiQ9EVSREjHLWRVoPF6FeNQ
         sk+GpRHv7+b+cdrAUTYZsugpmYKvEUmWHUPEnhOeDEkezZMbFxsQvKpS8EuQ5cCvPMPE
         JYZp/2x+svuScVCBSfHkLrgmjwIEXJtxScbm7g3wyDIAob42XfNOdcWagJ0Gvda3Huqj
         BIIA2wJKrWPnqx5oLqtjLpe7x2S1eA2DzHxeXEiEV68QKwLafrleU1M7yXP8XDp93EyE
         Q31w==
X-Forwarded-Encrypted: i=1; AJvYcCUwcWXQQuaUV4EEl4vdl7i1HEkvHYzGNlaGLWaPlWuhLy0QW5Q04U3HsDT7E+aOa1r+0dArWvId0Oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/mIs/z7VtQ7184nP3SOUwg/iMwhQ/EnRk9SO0LnCY4YYiQDzM
	iIe7JiIETtrc5hdQ1zQ5SUphEjy1zQBI05WsiMzDZFanVtr3Z9ycGdCd5v1vSwL+
X-Gm-Gg: AZuq6aJg8e9XFR1B1iATp9DtDcy+Ub1VBBDzaMwSpr3s2I0rT/UpwGTQ5Um5Ww1DVAA
	aY/Yjpgk/26vrMT91abACj7acqhTsUqhldZk6HA8aFSGwSUUsU9LRixE15EL/NSeBYV0X+yDj3m
	p31mA9nHScOkBv3sil5qO4i0o+n/mKhzy7Mmi7GCeo/XaeiHvl1ghphsNWyX55fekkPhxXLvDiV
	4B75xpMsS2ejmhDKT7+4/QvF5F4gaFXDG2C0m+w2Jo0kDY9tEsPBrV6OWHqdE1/JVP6fm4KdlDk
	QJ9XytuHDR+bt6iMXDxtR/bwinu1RmhajIb/hukChhFw7PB2bTt5I1NHeYydjbQZuZx0/96yjYw
	lwTmZ9CpnWq2Foipm4Zdu2IH8SOLlW091TY3Txht7e3Y87u24qq0C0R8BnebpU+vnBsTLHwW12N
	fgzExS/VMa6JFhc41TsQzDUuzOlK85jMNroq9WmCLtqAK9OrdM/ONEaV/THKs=
X-Received: by 2002:a05:6102:390c:b0:5f3:67e7:4f94 with SMTP id ada2fe7eead31-5f57635666emr1227001137.15.1769441292029;
        Mon, 26 Jan 2026 07:28:12 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e3728edsm1908239241.9.2026.01.26.07.28.09
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:28:10 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso1661539137.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 07:28:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkrAtP7SzkIbmui0jtXikgRO+yi8jUajZRaASpG9W5r1OCqiMXKp2eSWwoUEgxO6Jo+zz5wQmm1oY=@vger.kernel.org
X-Received: by 2002:a05:6102:e11:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5f5764f908amr1370657137.35.1769441289411; Mon, 26 Jan 2026
 07:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:27:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
X-Gm-Features: AZwV_QiV_Vg-viwqsMsGeXuhl8oqSRausfwmVq5_XCglJk6EVp0gGv8dhCY1AvE
Message-ID: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The r9a09g056_mod_clks array is sorted by CPG_CLKON register number and
> bit position. Move the RSPI 0/1/2 module clock entries to their correct
> position to restore the array sort order.
>
> Fixes: 1f76689d1715 ("clk: renesas: r9a09g056: Add entries for RSCIs")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
