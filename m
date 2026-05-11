Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E305495501
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 19:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526551; cv=pass; b=Nn0VyDLyDaNNAIPjaodJ44GsFFzQFrBIXO++yTUaVrN7VTzoSWzJ+ZYiosGb1++OYxBI70Oeh8Jzl1M6rUUtoxkL20U7SR83uLzeedCITsgLXsnZSg2HjQTCvweEXWJeby4A/6urcpjWcVRgZqy4TTXjdm5nUCqOo1zGxuLfDZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526551; c=relaxed/simple;
	bh=uyHVXUPbXEnsGpfCCIYHGgONLD4uHS67zMM9NzPaBoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzTfmcy99kz2ueODVHclroWtdHOjkpjmMz2l05OLd4aaNpsw2pJCN+WTykLyGlrinBtYqhMpiYUEVvg9wrHU3LiYZCkoPSTK8YfoVvuZUcQUMzfdpeWCWsYrCM7n7DYZTfpL+8qMFPQWgP66AxyKcj+4FXA5M6McfB7REreUUyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2PkZv2r; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2PkZv2r"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67be871ed3fso9071418a12.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 12:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778526548; cv=none;
        d=google.com; s=arc-20240605;
        b=OyKGpg0Z8nhWuDGk3W7I5uctfB1PPstR9Hu5AqD8CDd96POyoUNVYEVp4ndob5KbQx
         0jwY7SgRBfzOhAiOA2NqXaTcQdB+O1eBHSWCzEc/Rx4ck7hWUMsOjzc7ifnHSiKCAXUJ
         kyvGXbAkzpcm7QxedSXQBsC/A77UqcEQketqiDNTL3ZePjOY/S7xcfmqljQPet1WTqcf
         OedxB+b3GChOwydUL8csEdGXkG0ENFnmIa9wgoM2SGcumYWwidllkr6Ph4emdx1D5wIk
         Y4PxjhFOSFAVTd9gS6M8Nu7iqnw69iFsyNPWhuJ8GyWgkBFMTd7dGCk2nc2o1U80Kmoy
         TYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=;
        fh=tEsStm+1MWrCXyVT+vxZT6sfS1GUamghVssMM0znFLk=;
        b=lRIEJsll85sVoBtU1noaStjnbu5HH7ce/4D5ErXQYK0oWPZzGFDXUcRNmI9NpdoVwK
         HhK4NDQOeqEC/dAAFwQLlHyDOMaRO6l4pYEjalg+iS334IAkP21SDmvPSS9qbCl7vPzg
         Zjt9YUPBaNVEUxy0+UW8R9rQktLrXvr6S+ZAnsP5ZmzV2FnUFAZFyNyPiZkPzkTX8UH3
         VIIfoJRqqr3QhqMNWNMFmGEwj4w+Sg7VLtMflrDN4P4C6mqd7fBHenYqAPkiknugTmMC
         00zMKP8f6SntwZmp52S/w7Xsttr4mGH+GRPXP7kWJVfvux0mGNWFPsSrd5NMCAirRAca
         E2Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526548; x=1779131348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=;
        b=U2PkZv2rFbgXHSuTWXWlh7tjpg7EZ6wYK9P5m511PxU6c3k/UKEhc9fH5l8rAN9GaF
         nHz3piXR3DnoFUGb45pLTicYbZt9hzlTGiGfAjjqJOWqgtjSz5Ekq32WJPljihCm9s71
         w1GFCtMKlq6je6cLne+HFKH9g+9nHF25rtFgiSHEbStZ5waGzWL/8bg1j4HiKpAd2Frz
         dAL9p33jrrt0fppkwAR0Qy1zI9Dd0Xu5jLAjJ130UcoXI8LcBP2GQouy5sgph1UpxVGr
         kMtZfWk9hfvDRC1jTnLYYgct+ZM/rR+jUvlIPZgOmQQibt1XXQUmDvLlNGfo2hn+TMHe
         cVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526548; x=1779131348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOTjIaa1U5hMq9uBW5pbtBS83bE1arv/7hzssbbHaGU=;
        b=YzeA58YBPT99OQrlGNvrpaCEMZDuO4njHLgPTl51XLF/zg/nYbwZp8tWbIfzJtGCmH
         pC9cKRPsl8o/XNuLutDLMDdasRi0dZ7XwDJ/dx+GaZGTmFrlfssg18372D+uUuqGWZ5w
         K4ju6w77yrGuv8eGeHAQBpQKcrNVMK+KHOBFDWBH1VwGEHmTXiT7t+DFh4FAaY0UWzzv
         Ynapa7VMRtDyteza0kc9kEKJWCzId8yQjp6ojCG6HCNVmRgatThaNIg9PZ4nNC0NDlxT
         L8WCIL+NReWxALwK8Fu0nmYbXv0yIRIVeLc69C1U/FwdqcklYdV6aq05zkV32V6LPt18
         ZZJw==
X-Gm-Message-State: AOJu0YznoF0qolYMoOYrb2qfehoIVzRM1Qvkn2dwPuuYw7s0vkurZVTX
	Vvxd5bTk9hmkOU3/hjxzzkQuq6jofLaXDRauZYLIx4Bz5Kghzs/zXZU+ThttDAPKcEBHDbvTewi
	sGFlE2shOPTv1LHz+yicwDrUvptmbscg=
X-Gm-Gg: Acq92OGepe/GvGzvmUF0n8QysdTT4U7f30gyXOpcFHBI0CpLD8oGuC/Goin72n76Mff
	vTABzlUCGhadyswE2OkZIOcjNTNYB+tpLNuj1vS/tafwxYf3K6GkHK+h7QPpu4P60RJXK7Gjyt1
	u7IHLtYC2+T7NeLW7haKv5xhduaJRWiJ/Mdhok/3hBS4gvE7byyADxZ4URg2ijmwM5q+E2o4UPd
	e/uDIARFefmioP2wtVxXkPOIxd98KpBFBi2hXRJ6CVEanx+WN0t+AhMk0jFFgqwEed+vhzUUz3e
	MS5o1kf45/ktJr/Ds8PS422DIROhXUUnAkLcKERltIhKe+6E9iV/B/Dk+aJ2ewztbiJrikC8gmE
	zuUOguy8kxYOcwoPxLaj2bPCeyLbs1cbewdpPyxexgJh/UDTM5xL2Lia64rz1l2Fxzqm2
X-Received: by 2002:a05:6402:34ca:b0:67b:7d11:758e with SMTP id
 4fb4d7f45d1cf-67f709eda8emr5625760a12.11.1778526548340; Mon, 11 May 2026
 12:09:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511032252.361906-1-rosenp@gmail.com> <agH-ivEdw12_3OJz@redhat.com>
In-Reply-To: <agH-ivEdw12_3OJz@redhat.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 11 May 2026 12:08:56 -0700
X-Gm-Features: AVHnY4KyFKhYps1EIl-0Wn5HhtmX4f1BubILShxhOA0VtEaA21RrQRgVM-Ihf6o
Message-ID: <CAKxU2N-nEx-=KFh9djQRGZVTR_HJTSrJYzAa8NR+4QcNvbkxqw@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: Use flexible array for clock table
To: Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 9:06=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Rosen,
>
> On Sun, May 10, 2026 at 08:22:52PM -0700, Rosen Penev wrote:
> > Store the clock lookup table in the Rockchip clock provider
> > allocation instead of allocating it separately.
> >
> > This ties the table lifetime directly to the provider and removes a
> > separate allocation failure path while preserving the clk_onecell_data
> > lookup interface.
> >
> > Assisted-by: Codex:GPT-5.5
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/clk/rockchip/clk.c | 17 ++++-------------
> >  drivers/clk/rockchip/clk.h |  2 ++
> >  2 files changed, 6 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/clk/rockchip/clk.c b/drivers/clk/rockchip/clk.c
> > index ee8c79b938d3..dbb4b6f33abb 100644
> > --- a/drivers/clk/rockchip/clk.c
> > +++ b/drivers/clk/rockchip/clk.c
> > @@ -359,26 +359,21 @@ static struct rockchip_clk_provider *rockchip_clk=
_init_base(
> >               unsigned long nr_clks, bool has_late_clocks)
> >  {
> >       struct rockchip_clk_provider *ctx;
> > -     struct clk **clk_table;
> >       struct clk *default_clk_val;
> >       int i;
> >
> >       default_clk_val =3D ERR_PTR(has_late_clocks ? -EPROBE_DEFER : -EN=
OENT);
> >
> > -     ctx =3D kzalloc_obj(struct rockchip_clk_provider);
> > +     ctx =3D kzalloc_flex(*ctx, clk_table, nr_clks);
> >       if (!ctx)
> >               return ERR_PTR(-ENOMEM);
> >
> > -     clk_table =3D kzalloc_objs(struct clk *, nr_clks);
> > -     if (!clk_table)
> > -             goto err_free;
> > -
> >       for (i =3D 0; i < nr_clks; ++i)
> > -             clk_table[i] =3D default_clk_val;
> > +             ctx->clk_table[i] =3D default_clk_val;
> >
> > -     ctx->reg_base =3D base;
> > -     ctx->clk_data.clks =3D clk_table;
> >       ctx->clk_data.clk_num =3D nr_clks;
> > +     ctx->clk_data.clks =3D ctx->clk_table;
>
> Where's the __counted_by? Also struct clk_onecell_data is embedded
> inside struct rockchip_clk_provider, and I'm not sure offhand how
> that'll work.
Not present. __counted_by does not work with embedded struct members.
No need to add one IMO.
>
> Brian
>
>
> > +     ctx->reg_base =3D base;
> >       ctx->cru_node =3D np;
> >       spin_lock_init(&ctx->lock);
> >
> > @@ -388,10 +383,6 @@ static struct rockchip_clk_provider *rockchip_clk_=
init_base(
> >                                                  "rockchip,grf");
> >
> >       return ctx;
> > -
> > -err_free:
> > -     kfree(ctx);
> > -     return ERR_PTR(-ENOMEM);
> >  }
> >
> >  struct rockchip_clk_provider *rockchip_clk_init(struct device_node *np=
,
> > diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
> > index 9e3503e2ffc2..d4033bf750f5 100644
> > --- a/drivers/clk/rockchip/clk.h
> > +++ b/drivers/clk/rockchip/clk.h
> > @@ -604,6 +604,7 @@ struct rockchip_aux_grf {
> >   * @grf: regmap of the general-register-files syscon
> >   * @aux_grf_table: hashtable of auxiliary GRF regmaps, indexed by grf_=
type
> >   * @lock: maintains exclusion between callbacks for a given clock-prov=
ider.
> > + * @clk_table: clock lookup table.
> >   */
> >  struct rockchip_clk_provider {
> >       void __iomem *reg_base;
> > @@ -612,6 +613,7 @@ struct rockchip_clk_provider {
> >       struct regmap *grf;
> >       DECLARE_HASHTABLE(aux_grf_table, GRF_HASH_ORDER);
> >       spinlock_t lock;
> > +     struct clk *clk_table[];
> >  };
> >
> >  struct rockchip_pll_rate_table {
> > --
> > 2.54.0
> >
>
