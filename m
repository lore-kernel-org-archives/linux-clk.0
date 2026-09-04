Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CC43A6B85
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 21:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788558102; cv=pass; b=T7T3YGgJqesVuOprDNtyfDr5JXxecUvYRLKQTGG8Y2lB0IWDcte+E2LFgdlHQK6LKW4CqUFK1RPNXWKHtFCr43IXPQE7EphxbshX4WDKJe4IsBCgkUPUcmVg/5NF4GiYS49KnnsODlOcYT968lBRvGrvDcHukbFGpn7iWL1rcC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788558102; c=relaxed/simple;
	bh=6qBbNjXDHOLmiw/AhEzWP+67PIsC4qlOfgllIR4mAT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhIi/AHGEYbq96xQYdyBQsyF5caXKzX1HdjyR9XdqVkLddRg6MnIc3yaric1toLGrRt3XE8eY1hBZpjNyM31JA/d2hRH4kkBeWfty00eMsP9huvn1vJgsvGEcgpFV/7/ceaAHnUSlNTcFda+ULtesCaYidHRvYx95sn/B6IPZuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEUQTAer; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEUQTAer"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so2400010a12.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 14:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788558099; cv=none;
        d=google.com; s=arc-20260327;
        b=oIVup6mak8z7ItCyIXkOv0XL+Hy4BlY/fjuy8bFnsD6C/GFaqNju0VgMjnGRCjmOvd
         yRIRnX7BIxnKU57bR+1Az7cNZnx3QA5xTZDcwgTDEwt1D8K2pwns1dF/VYvRdb4+4Mym
         l4oGeyPE8Rrpz4XlpkSVflQhMwKdeLJXl6NNAXLCuPqYdR5zAdJWkAmtFhbYXdEWxEn/
         x2o6zbq0a27Tc2l5VCPNqTZs0uS8E/t1P8W0D39EOGA4QtgahR6dN2N8zvI8V8yuGwag
         Z4IelbUtqzGTIk6IpeAA6GxEbxJCQAs3ELQIZWvcondUdhm40mIcHFemuAkW0YYxlqMP
         c2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        fh=QAt8EuHSlaPrHw0piFAg8DPnAE0J6v8HS8SSDOyzfuo=;
        b=iwOnv+hfEAo5OVumuqsdmyEJHJhn1csYIvuiPb+eNtLxqcgF46sSbkp7mHYt0lKaki
         /bO78m0BH+RYLes2TQXHT/py2jV+a4cbZ6WP6PMnx1pmf9XMlSKPEWWBEWk/NCYpfhTL
         tp5aDOrmZ1kHIRGQqbUKwuc7TBKR3GsDzLuxqq7EjzL+v99Kj7zaN6ih6X8rs6A1VdXd
         NJ3uuxWvN05Jci0ntfXVC6qlhLUDIhzU9qA+aAz7pUS5Pht5/VfDEy/tb+FqBqiI36Vu
         z/+5sVbTtcGp6OFSsrZ28TWW1mnerzhYHJEx4Ytomiu4pc0OAxxQCX/szWEeZLxZy0Qv
         Q4Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788558099; x=1789162899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        b=jEUQTAersCPK6se9AdsihXqp38CevC0tw31LUoS5h7ljgcTGouHg8mZWtDDeMa82me
         saxUL3/87S2T/l8x+ZrbCXL0rXs0CexLZzflinvpQFktgg35ajetV4cA+TpUguUUmPjc
         llXLpXQ/PKu/cyRGCkyegUa/Pw8tHTj88aSHiyO42WOPL3NMx923hfIHrf9b5RiJPX6h
         2RMJZQNgjUR0qDkvmFTU95E3zKmn8qgZAjq2RuLYXYbLqTT2WSD+rsb2vAxqzuc1+Jh2
         JiqQwFujtPpNOsktWMMKdkK/aXw2UU5Xxw5uaQG6F+pQaHXxeJ5xrR6ePLIFjw9HCP7k
         bXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788558099; x=1789162899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kue2/Pm3HbmZQzjeKahvdcnYX4KwQ6G8saPWSb5Rn6g=;
        b=UYR25o+hcdw1aXiaa5fnQrflKEnroQx9/lE9fPjIu6Nmxs50NPkKfaXPUL3Iz1yw1P
         HUMnrhEHS1yhZcGuur4OaxP4ksdKUuo0ZeRlMJjRXR3k2A6qQQ01Jbyatffz1L8crRn7
         7OEEjWLfxuh9hj9PvzuXkAWrG5nNw+sKEYlkK/ghDZ7++H5GAlWfhczBs2+3pFIhvTsi
         CXgvioDQEWME6Y9dLLpnvS5DMzsbWY+hLmtwn75prab0zHVdHTA+L7APMuKCVOoq1zgY
         vDokgPxxapkplDOdlOI1r524fZ+H/m4qHjaklAbgC1MBdCzgsZ2D7BB5PBz2uPhmpM0i
         mtzA==
X-Gm-Message-State: AFuF++nC+CIqGzilIhz1lvv9kHIWC9lNKrE6uIv//oq3okUcN8q3hBVC
	+tOaxUO+71P59nIs6JcubiS9MpH6+Pmbn4yzyQ8yRDuyszqK9Xm3Qmd9ommepur6wN3N6iZJMUg
	v1Wfu/9hp8PyHaZsD/LaoTvUqkTPStRE=
X-Gm-Gg: AYBFou2ep1jJcrBhgKyMXPexWpLU34af8uzRI7yiKDlbFvjwr/QmBi2IFcJzchRJPl0
	x9dedtWVrRzOO8Y4awBbxMWkQPYYUzPsJAethmH0Ykf8cbdImF17/mAqprjyhOvSH16vhthIZrj
	2rQCcP5NdEMU18cKfC5yAV+Y6iMtmh6RZm8pbkdKVQ/Su9qP6tvBDuNuSwiJ47X4AgOIk2nGSVs
	8cCcpi/aWgOJWng/BZRtTMLU1+EUwAp3j9jW8nut/NGKeEUWus+0v17rYmHU9D2o60c8OoIZGF0
	CrnbZI4ZAEoZGX7IgXJAcRvCWKkYBixeniTxUCHEwYFmrG28zzNeGgBWOaCrq1VUgcUKHg5WIlp
	bCF3mK/3IpyTflfNEhUGxt64x6jcvj3AV1Q2lKt2vn32yafDgOgHKtZF0Ry8RMEtcUEdeYaioay
	0Ozr6Cn4WzM45BSte2fJatPsli+M7MU8jrCM3moWC9YiAZWOWtApqYK1t3DgmohVYxyw==
X-Received: by 2002:a05:6402:2752:b0:6a7:ea54:376 with SMTP id
 4fb4d7f45d1cf-6a7ea541ef3mr2147241a12.30.1788558099252; Fri, 04 Sep 2026
 14:41:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511032252.361906-1-rosenp@gmail.com> <agH-ivEdw12_3OJz@redhat.com>
 <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com> <agI_ANymmPyyWxuE@redhat.com>
In-Reply-To: <agI_ANymmPyyWxuE@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 4 Sep 2026 14:41:27 -0700
X-Gm-Features: AcwNN1VOkSQ_1hll8MMht--OgvQL0IoR_OsYRYOz3Zmp855n0-aj2ZBGahPJ2b8
Message-ID: <CAKxU2N8YimZyKFoWtHT+FZwzD1R+MzvaXoCu0MhVEzvGHd9VhA@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 1:41=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> + Gustavo
>
> On Mon, May 11, 2026 at 12:08:56PM -0700, Rosen Penev wrote:
> > On Mon, May 11, 2026 at 9:06=E2=80=AFAM Brian Masney <bmasney@redhat.co=
m> wrote:
> > >
> > > Hi Rosen,
> > >
> > > On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > > > Store the clock lookup table in the Rockchip clock provider
> > > > allocation instead of allocating it separately.
> > > >
> > > > This ties the table lifetime directly to the provider and removes a
> > > > separate allocation failure path while preserving the clk_onecell_d=
ata
> > > > lookup interface.
> > > >
> > > > Assisted-by: Codex:GPT-5.5
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> > > >  drivers/clk/rockchip/clk.h |  2 ++
> > > >  2 files changed, 6 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.=
c
> > > > index ee8c79b938d3..dbb4b6f33abb 100644
> > > > --- a/drivers/clk/rockchip/clk.c
> > > > +++ b/drivers/clk/rockchip/clk.c
> > > > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip=
_clk_init_base(
> > > >               unsigned long nr_clks, bool has_late_clocks)
> > > >  {
> > > >       struct rockchip_clk_provider *ctx;
> > > > -     struct clk **clk_table;
> > > >       struct clk *default_clk_val;
> > > >       int i;
> > > >
> > > >       default_clk_val =3D ERR_PTR(has_late_clocks ? -EPROBE_DEFER :=
 -ENOENT);
> > > >
> > > > -     ctx =3D kzalloc_obj(struct rockchip_clk_provider);
> > > > +     ctx =3D kzalloc_flex(*ctx, clk_table, nr_clks);
> > > >       if (!ctx)
> > > >               return ERR_PTR(-ENOMEM);
> > > >
> > > > -     clk_table =3D kzalloc_objs(struct clk *, nr_clks);
> > > > -     if (!clk_table)
> > > > -             goto err_free;
> > > > -
> > > >       for (i =3D 0; i < nr_clks; ++i)
> > > > -             clk_table[i] =3D default_clk_val;
> > > > +             ctx->clk_table[i] =3D default_clk_val;
> > > >
> > > > -     ctx->reg_base =3D base;
> > > > -     ctx->clk_data.clks =3D clk_table;
> > > >       ctx->clk_data.clk_num =3D nr_clks;
> > > > +     ctx->clk_data.clks =3D ctx->clk_table;
> > >
> > > Where's the __counted_by? Also struct clk_onecell_data is embedded
> > > inside struct rockchip_clk_provider, and I'm not sure offhand how
> > > that'll work.
> > Not present. __counted_by does not work with embedded struct members.
> > No need to add one IMO.
>
> I'll be honest that I'm not sure what's correct here. I added Gustavo
> since I saw comments from him before about these types of changes.
Anything else? The comments AFAIK were about descriptions of why the
counting variable assignment was moved. There's no counting variable
here.
>
> Brian
>
