Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593DD4503E8
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 09:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514606; cv=pass; b=GZFw5itlZIk1TTKBNJj6vSY/p02L0uYTxT+iSyindwpmYpESjSj4f2YitwtQNG3MHeVCQUwC9VyeF5U0L+VjETs91lUT1QlQEoIGDAAsAr682Ht6mG5NZK3jA8p1dJ+66d4vaYIiHjEYdlPDVFQUmtvLorItQvWysBNeQDfZZLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514606; c=relaxed/simple;
	bh=QteNhBbouIKWVtzj6YPZ4nEGqku6UxFrqvjnm3W1tNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2DhKo0J4Xfc3z3ZmJbhjX5cN0WvT100SB3u8dhKc7icYQ56uH76ATRX0LEuBtBuPwLc7mdyLkkIjJfdoHsPQWcTYB10q8A9HCdeyNdN8ibGSsGE2BvBsZClbOXPy3brFn1trH5PvIxkgptfvX/xqUCEKX7cU2pfqdmsQiPqVio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=8BC7UYUP; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="8BC7UYUP"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c207cb16cf5so117984366b.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 02:36:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514602; cv=none;
        d=google.com; s=arc-20260327;
        b=JhSn9q472nlvtnPI+Oda2VTp71tQZgfaG4ptHY8KHSafYvyw/wedL+4767AOae5pMX
         YFj1VgVMMU+XDcYgxvJebBHNbbVa9Wvn8XbqHzF8KlVU9DXGQ2BUlsV2umPBBaWkfZdp
         pFo1uj9lQ2JXmQ5HQHYij5sbHyOAbTdYYBJn5wcBJodIummsRxhTzpOgS8NJySIoOQJN
         +4bTxYlEEobikHgWvPYxqu1+D500mtFGoZwpdUt02SwTCIOUjBLBTXi3F/xx0omLlsXZ
         Miv+SbL5rXnO7sg0DoTRnGl26JjA+uTOTU0oStxhXWRl09uBhQKWk0KuLQcTVwF4MML3
         b2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=;
        fh=ALNVo1aiQDFn6yD1+aj3nC7B48pUzyb1+cviatAzZ64=;
        b=bWoJrAEQ0YpWLDrhLP05cf/CPWBLeFcW4oZMB29brsL988pU6u1+U1vdBLtmkiO653
         krWeAKzgB3ywYbZGw12m1DbcT1+5wKRjr2dpajqbmR8EvOWMHnkRjTfqYUgHgqwT7llw
         IZ9pjS9XRDlPukgNQCQaEr/fIlu693TLa8d0ID6k4wrb2kYcPv7snWjIbjTUmgF3a1J4
         hP8XEEpKVXINrIXwGPun3OlDskfhbVUxkniZ5Iqwm8afIRfcy42nQ5GNHuQ1K4Ngz8rd
         o0YDnKkIlGfIilQAE6UeORdo6ERPXcC9C5VQv+cS4WDfasJBzDMP5KdBGoFychbsZ4+0
         PvsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788514602; x=1789119402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=;
        b=8BC7UYUPtM/UkdBtaQABuuU//IsJbu6mmodpCG9Blcbv2VkKh6XgKn9P7UwoH5Acgj
         UI58eHhLWrK7l6fupemMQb887tbosICV/GxhLpWhGQOJHDXXXy46voUjPeJ0Y/iG5z0c
         sA7Iy3+4o7Yd7IA4wX3WNxebxmJ/Xuh5J62sqXTIRQVzQxioh2+VFRHz99UaenFfWQWd
         /NNUEwuTa9ZVGU3O6QGC1cZCbv6sipDF7vIZ6QXvPrOhG/f7zZyBhUAA9+UV7QuK2C+f
         qRI75yvE91TK33k3PCIdZsGBHhawQQvImxuCE8DTrViOlyJjbAcdA05BB6GleC7lgR5u
         88kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514602; x=1789119402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foFTrG5K5GBINGP1ISszqyndvxgyaNt7XJ7LpKu6ReU=;
        b=VGf4gueEh6kEjuaas4iDMDAgym1t5sTsrOzaSatFXjFkzpDQLaMjb6tpOlUL+f3i3f
         pExxtxtiaNHE3YeGFj387ON7DmZ98Y7W84TH4EBVdV34m83q/oyij1dQ0A8jTVhQescr
         V/+VtUBue525zjUROIMrJ1JCwgvEiCSzqtrA2Qjx7XtOplyp465HvE5Z6bSjlyMzJWwz
         Df1zvOJosf8NzhSINuhflQHl3ER4it6PZysnCodhYNaENUCTLzSAd5UG8BzVKfcUwLiU
         OOAXg/95A4ZNw9E5sgYxsTGVHtafiLms3moLsFcpuvdUmL9gs5Wz+JF0fmm4WJSe3UoQ
         i5Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwcvQRTE0GpxPcy/cU+s+luT/FPzOedCCwOwadeyoTpY/kxYjazr4eQPZMTmz5W5HJ0UBb7LwyP+K0=@vger.kernel.org
X-Gm-Message-State: AFuF++kXvcoyxdSrmzv3b8yuOfswSJYl7g06PzAG922ZI52aT4ywClzo
	j7vA2O7lCCsN7BRqfWTQ2TSJCGKQzDrT7DJ7pT4F/z1j0qfQ8Z+Kak6cvtNO7K8HXGQqsfrBEu9
	cp2+KEhysSxauvZNTreuXlQarFswDXj4dSO+JZFOfqg==
X-Gm-Gg: AYBFou0NIP5BTdFV/EF1We/d3P1e2LOEG2jpOjMTcW1I2GQsPnU++zqRftaa3SV7XEn
	n/YrmGP6kf04QREpQM2mjcvcKapFWbuS18swojidqVb1cpOe1PJ5/mvKGMLtSNmZ1/EQQyUZT/q
	Y2U2XCViat3EQ30hydnw+JFPtYgNoHCXoGcB9MA4eiqHTJTpnserP5yfFsh02GZj5s2BSJSmsgr
	Tokq1Jca2WgsgJ7cpiwO18goIgaeCCOkfuQvGd5O8Xth5lm805mWftxy2xf6N0e1h8ZiNpIjIWP
	5OYmzfglaAf225AN25Ec0gCs/LzVgQaxVdkwtC/MOQ8YscyFg5oQcIBZNoJNjcsIYhzzJu82Q9H
	k
X-Received: by 2002:a17:907:fd17:b0:c26:1648:a069 with SMTP id
 a640c23a62f3a-c261648b781mr97301566b.36.1788514602405; Fri, 04 Sep 2026
 02:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901234351.190506-1-anarsoul@gmail.com> <CAKTNdwFqSBt4QVCuYJxTyEDsxkW96JbUirFNAgJYWVLHzGpk4A@mail.gmail.com>
 <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
In-Reply-To: <CA+E=qVcizyQZytw8M6DA72YGrRDDNx_cCvYj565zf9wjMWh8tg@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 4 Sep 2026 13:36:34 +0400
X-Gm-Features: AcwNN1WNG6-4w87ND0ZEi9BFf-EutUvUpsgbnymsPufvucLp1TkkKsdtlvZ3MeQ
Message-ID: <CAKTNdwFQvKtHQA0JD-GAq3bgr5Brq2NyLfccenkHcrKcjeptwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3399: add 85.5 MHz rate to PLL rate table
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 1:59=E2=80=AFAM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> On Wed, Sep 2, 2026 at 1:43=E2=80=AFAM Alexey Charkov <alchark@flipper.ne=
t> wrote:
> >
> > Hi Vasily,
>
> Hey Alexey,
>
> > > diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip=
/clk-rk3399.c
> > > index c2b243d7a5e2..db241d2df625 100644
> > > --- a/drivers/clk/rockchip/clk-rk3399.c
> > > +++ b/drivers/clk/rockchip/clk-rk3399.c
> > > @@ -98,6 +98,7 @@ static struct rockchip_pll_rate_table rk3399_pll_ra=
tes[] =3D {
> > >         RK3036_PLL_RATE( 148500000, 1, 99, 4, 4, 1, 0),
> > >         RK3036_PLL_RATE( 106500000, 1, 71, 4, 4, 1, 0),
> > >         RK3036_PLL_RATE(  96000000, 1, 64, 4, 4, 1, 0),
> > > +       RK3036_PLL_RATE(  85500000, 1, 57, 4, 4, 1, 0),
> >
> > There is already an entry for 1368000000, which is 16x your rate, and
> > the 16x divisor should fit comfortably into the downstream clock's
> > 8-bit divisor field. Do you really need a separate PLL rate? Have you
> > checked what the hardware arrives at with the unmodified PLL table -
> > e.g. via /sys/kernel/debug/clk/clk_summary?
>
> See arch/arm64/boot/dts/rockchip/rk3399-base.dtsi, hdmi ref clock is
> wired directly to VPLL, and dw_hdmi-rockchip calls clk_set_rate() with
> pixel clock for ref clock, see
> dw_hdmi_rockchip_encoder_atomic_mode_set(). So at least in the rk3399
> case VPLL is supposed to support the required pixel clock. Without the
> first patch 1366x768 mode with 85.5MHz pixel clock is just rejected.

I strongly suspect that the dtsi doesn't describe the real clock usage
here. The TRM for RK3399 doesn't show any "ref" clock for HDMI, and no
TRM-documented VPLL users look like anything that could connect
directly to the HDMI controller.

I believe something is hardcoding the divisor (or leaving it at the
power-on default) in the actual DCLK of a VOP which the HDMI
controller uses, instead of modelling it properly as a mux (frac/div)
feeding off VPLL via another mux - both perfectly representable in the
clock framework and already envisaged in the clock driver, making the
PLL table patching unnecessary.

Can you please try re-pointing the "ref" clock at DCLK_VOP0 (or 1,
depending on which one your HDMI controller uses)? Your clock summary
already shows that something is assigning its parent to DCLK_VOPx_DIV
and the latter's parent to PLL_VPLL, so rate changes the current
driver code does on VPLL propagate to the muxed and divided downstream
consumer as a side-effect rather than as an actual rate request.

Best regards,
Alexey
