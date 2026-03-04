Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F122F25A2BB
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 16:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772642420; cv=pass; b=ffh6K5Xt7FOyXPMA+zivY2H8mbpRVcfVRw2bJW9wt+0lV6zmZsGIrzQnTYaM0csjVRE4Tz9dJ736XURt/B7wW4jLJLR0oSyRE8clrsnTW2Bd7JT9F6wvJH9F1voydFf88WVSs0TgQg2kruF2Ll/Z2rMgIkJUrLPtQPbu5lI3MwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772642420; c=relaxed/simple;
	bh=uL43VjEctIxXlw6hfOKZx5Hdui6DUz3CbVGEqLWLTO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHJ/gFe//qGdW8Z1faWSXSxRM1efhStDX+8loJWDP5GDsIV+aXiSaDz4v6Gs3406exmJDrbt7s1ZjAQyxZVkayl5ZtsUT4nA6Mn/ZnU1K0//gjhArsLfaEvLcGnV+TlI5d++f4VmxBT7hbPrenj5ffxMrZc9Purg3dE7jBWFBJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Og939dyn; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Og939dyn"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7985ce90542so70872517b3.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 08:40:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772642417; cv=none;
        d=google.com; s=arc-20240605;
        b=RoOblkW+9y2E9MZMx4zUO7nTDN8BR1ADY8kCOL2dh1VDUFpn6N1yUsdL3V6vNYxnZb
         K8DM0v8jYEP+ecl1sjLE8QpGfyOujZZJZy/ldwoL7+iQSLm8tKUxZogSqBwscve132au
         v6fviYURKLMG44JxwblPxel5DJ7i7gn85YY1SRImpTvTZvCpenBMwo8zGlmO9Lh73S4E
         5NaZ7IPl9jpXjdQFoTTRkOtmhx/rGbl0ttM9PxN1LRsEyc7F89PijCKiZNN+NJwwzVUm
         ZqaTWvQes8tMXdGzwRXcf9AQGiTwwatt0Jj/1Z7YM27XmyPcHW5CJA8qcFQVG3jhUhJR
         tywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7EIelfbqraTFDtG4K3GfpmwKk/JIi60v+RZZy/F1gPo=;
        fh=BSyvVwQiaTBjnSn3aUxX8OW0Gse1bQ3b7H5Mr3xtU9s=;
        b=jqUI7zAl4PBr/MJxXTNnvw5xZNBdIDDJekN/vnufcIjI805jSYdmyDLCfg97VV+nCJ
         ereC+b1xvdtq8XVIFBokBsohPCjxq9wXNU6+8kfGEMo3ENfDfXV4rJLFUFQWGYsEk4TE
         X5sX02SnPZjYV4Ucjgq/krILDNOZM2gWv/wCXgRaGz2BLDgtgwZ0ElP+KJj/4u5/XATQ
         jL3vkfwFstOcgCW/P6z3taBcIuKMv3S3S3mub+tbszQ5MXk4IjLBzhqZUaS2k4wdm2U1
         rfrbw4OcOmZ6UCg76djq2U5cpxnELAgNYGiBjlUcdADxfbarm9hVreY4z6/x+Fqel7/9
         OSYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772642417; x=1773247217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EIelfbqraTFDtG4K3GfpmwKk/JIi60v+RZZy/F1gPo=;
        b=Og939dyndTym+FaM+ITjAD35MkqVTtCHD45K1NIefF0mcjilsWwM1n+EaiOC7nWHaW
         rG/l0ZNtIuQzk6Bvuke0jh4oMnBKrfixrJWv33UijaLkQVNU2hRSCr+pvCK0LUZECNef
         BXv2AbKrN+v6fTLpR6JYDnfxx8zzg+ian3ONdzDLv9/axDRFEIgMtss5vp2prpb/l554
         SFLPMPEUXkQTFQV4cbUTn9lS5OPcHigTDZf60Fqbj/iuVzzITh6GBeVJA8oErg8hactW
         PSeoBl31v0oTYg26uK82808NnY3NTp2bOT57vukUmbvcjUlb+58jJHWqsgNp8r8hwbVL
         qIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642417; x=1773247217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EIelfbqraTFDtG4K3GfpmwKk/JIi60v+RZZy/F1gPo=;
        b=Xlzwng2AubtmeMfXBpvCPwQclxWeQEA/0Af0feJCQsu5q5RUeIt5XDMjoGtx2uNWOP
         K0103AFx7mOLm1SVxswNuDQ3Zf3msyZVo2TqnLBtQXXvF4M9MEzKZNkoissuArvgQDll
         kV2unf6j3b4mahqAnWOUyzS8R1l+YzUjq6xvJSdY1M7YU5F1vGQCwDu+zRyosdJXVGLm
         yXdOQnFAuLtX2SJ02HkXBa8eZu3JQ/706P853fmH/Ooi4AFAZWpQZzcI10eEGRAjZDzV
         DeULZXah8GLvE5ck+Pq+Xjf4JoKjL1m3RyB+Z2bWJ5by2Ogu15D4D3GimpnLbc41VIvS
         pBVg==
X-Forwarded-Encrypted: i=1; AJvYcCUx9ZQ5k53DTJPwzkmNJPaZ1V+7rfjbEQ+Y/YWg307jtZXoRxUrWITBvCrujMjOx6zA90jBEf28cug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtPj+Qp2KJlMNiW/OCQ+bgoZ1OfSrF8zl11DESCl2fAb7h1Yh
	DwWjEAdKs/Ou/ZLDsRnHaS7oL9NuC5Nie+FqPKte3itxNFVtDKscahbNHQIC27+xkvZ0Py7qvGr
	TACxNfPO4/NodypxyBqMer4TID3wdww/TvifVYVEa5zuD62z8YPJz0A4=
X-Gm-Gg: ATEYQzwudBVr2nVwRc6vnyu5DfFRq95wqWaGyrdVqtH4D6U+jPltX7kASSBnbZTiF09
	5viZjyVKEcJ3be3W7AJTIV06W27j6qV50Rf4deHvzCm/Od6zpylSzJDivT2aTtoasy1I82tnsDY
	btt8eR39vb6MFDU3u1JsSzcx/L+kbf1KAfvJcccRvc8oV/4Vs6lA915L7CL5rpqps52HQrvbvV8
	p5omhTDpF0Y3HDHakS7pWT+i0hYKAkxUAFdyfgechSSTNMqr+HpDo3rUbaX7aNzbSG/wwdeCOGb
	n/DEiNaUVPp3H8wxf60aBzTRYEkF+TFXcJIpmXU29XSvt2CJ
X-Received: by 2002:a05:690e:1182:b0:64c:c616:c31e with SMTP id
 956f58d0204a3-64cf9b4a17amr1809437d50.31.1772642416711; Wed, 04 Mar 2026
 08:40:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com> <aadhd3LwZQPkT3A4@redhat.com>
In-Reply-To: <aadhd3LwZQPkT3A4@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 4 Mar 2026 10:40:06 -0600
X-Gm-Features: AaiRm50FY6wPHOB4TxURj9oFXJQofl38DtBDhZDZ6HR-WZ_J2vlxwwj0jTHvOUw
Message-ID: <CAEev2e_hxUBQjVdxisqBXHQRzspQq6dHT0kCZHUW-6dEyV4faQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Brian,

On Tue, Mar 3, 2026 at 4:32=E2=80=AFPM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Hi Anirudh,
>
> Thanks for the patch. A few minor comments below with some minor
> nitpicks, additional places to use FIELD_GET(), plus some suggestions
> for additional regmap helpers to use.
>
> On Tue, Mar 03, 2026 at 11:36:09AM -0600, Anirudh Srinivasan wrote:
> > Add driver for clock controller in Tenstorrent Atlantis SoC. This versi=
on
> > of the driver covers clocks from RCPU subsystem.
> >
> > 5 types of clocks generated by this controller: PLLs (PLLs
> > with bypass functionality and an additional Gate clk at output), Shared
> > Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> > Dividers and Gates. All clocks are implemented using custom clk ops and
> > use the regmap interface associated with the syscon. All clocks are der=
ived
> > from a 24 Mhz oscillator.
> >
> > The reset controller is also setup as an auxiliary device of the clock
> > controller.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

> > +
> > +static u8 atlantis_clk_mux_get_parent(struct clk_hw *hw)
> > +{
> > +     struct atlantis_clk_mux *mux =3D hw_to_atlantis_clk_mux(hw);
> > +     u32 val;
> > +
> > +     regmap_read(mux->common.regmap, mux->config.reg_offset, &val);
> > +     val >>=3D mux->config.shift;
> > +     val &=3D (BIT(mux->config.width) - 1);
> > +
> > +     return val;
>
> FIELD_GET() ?

<copying another snippet from below>

> > +static unsigned long atlantis_clk_divider_recalc_rate(struct clk_hw *h=
w,
> > +                                                   unsigned long paren=
t_rate)
> > +{
> > +     struct atlantis_clk_divider *divider =3D hw_to_atlantis_clk_divid=
er(hw);
> > +     u32 val;
> > +
> > +     regmap_read(divider->common.regmap, divider->config.reg_offset, &=
val);
> > +
> > +     val >>=3D divider->config.shift;
> > +     val &=3D ((1 << (divider->config.width)) - 1);
>
> FIELD_GET() ?

Most uses of FIELD_GET I see have the shift and width for the mask be
static compile time constants, which isn't the case here. I don't
think it makes sense to use it here. You could manually compute the
mask and pass that to FIELD_GET, but you end up with more lines of
code at that point

>
> > +}
> > +
> > +static int atlantis_clk_mux_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +     struct atlantis_clk_mux *mux =3D hw_to_atlantis_clk_mux(hw);
> > +     u32 val =3D index;
> > +
> > +     return regmap_update_bits(mux->common.regmap, mux->config.reg_off=
set,
> > +                               (BIT(mux->config.width) - 1)
> > +                                       << mux->config.shift,
>
> This doesn't make the line that much longer, and is nicer to read:
>
>     (BIT(mux->config.width) - 1) << mux->config.shift,

Ack

> > +static void atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
>
> Should this return an int? This looks like we should use this return
> value below in atlantis_clk_gate_enable().
>
> > +{
> > +     struct atlantis_clk_gate *gate =3D hw_to_atlantis_clk_gate(hw);
> > +     u32 val;
> > +
> > +     if (enable)
> > +             val =3D gate->config.enable;
> > +     else
> > +             val =3D ~(gate->config.enable);
> > +
> > +     regmap_update_bits(gate->common.regmap, gate->config.reg_offset,
> > +                        gate->config.enable, val);
>
> This chunk could be simplified to use regmap_set_bits() and
> regmap_clear_bits().
>
> > +}
> > +
> > +static int atlantis_clk_gate_enable(struct clk_hw *hw)
> > +{
> > +     atlantis_clk_gate_endisable(hw, 1);
> > +
> > +     return 0;
>
> Follow up from above. Any reason why the return value of
> regmap_update_bits() in atlantis_clk_gate_endisable() is discarded?
>
> I know it's not used below in the disable().

For some reason, clk_gate_enable returns an int (I guess we care about
errors here), while clk_gate_disable doesn't return anything (but we
don't here?). I've updated them (and clk_get_endisable) based on your
suggestions so that the return code from regmap_{set|clear}_bits is
passed through.

> > +
> > +static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
> > +{
> > +     struct atlantis_clk_pll *pll =3D hw_to_atlantis_pll(hw);
> > +     u32 val, en_val, cg_val;
> > +
> > +     regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> > +     regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_va=
l);
> > +     regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_va=
l);
> > +
> > +     /* Check if PLL is powered on, locked, not bypassed and Gate clk =
is enabled */
> > +     return !!(en_val & PLL_CFG_EN_BIT) && !!(val & PLL_CFG_LOCK_BIT) =
&&
> > +            (!pll->config.cg_reg_enable || (cg_val & pll->config.cg_re=
g_enable)) &&
> > +            !(val & PLL_CFG_BYPASS_BIT);
>
> Could regmap_test_bits() make this a bit cleaner?
>
> > +}
> > +
> > +static int atlantis_clk_pll_enable(struct clk_hw *hw)
> > +{
> > +     struct atlantis_clk_pll *pll =3D hw_to_atlantis_pll(hw);
> > +     u32 val, en_val, cg_val;
> > +     int ret;
> > +
> > +     regmap_read(pll->common.regmap, pll->config.reg_offset, &val);
> > +     regmap_read(pll->common.regmap, pll->config.en_reg_offset, &en_va=
l);
> > +     regmap_read(pll->common.regmap, pll->config.cg_reg_offset, &cg_va=
l);
> > +
> > +     /* Check if PLL is already enabled, locked, not bypassed and Gate=
 clk is enabled */
> > +     if ((en_val & PLL_CFG_EN_BIT) && (val & PLL_CFG_LOCK_BIT) &&
> > +         (!pll->config.cg_reg_enable || (cg_val & pll->config.cg_reg_e=
nable)) &&
> > +         !(val & PLL_CFG_BYPASS_BIT)) {
>
> Same about regmap_test_bits() here.

These instances have it reading 3 different registers (unlike almost
all the other examples that just read one) and testing bits across
them. But I guess it should be possible to use test_bits here too. I
will update them.

>
> > +             return 0;
> > +     }
> > +
> > +     /* Step 1: Set bypass mode first */
> > +     regmap_update_bits(pll->common.regmap, pll->config.reg_offset,
> > +                        PLL_CFG_BYPASS_BIT, PLL_CFG_BYPASS_BIT);
> > +
> > +     /* Step 2: Enable PLL (clear then set power bit) */
> > +     regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
> > +                        PLL_CFG_EN_BIT, 0);
> > +
> > +     regmap_update_bits(pll->common.regmap, pll->config.en_reg_offset,
> > +                        PLL_CFG_EN_BIT, PLL_CFG_EN_BIT);
> > +
> > +     /* Step 3: Wait for PLL lock */
> > +     ret =3D regmap_read_poll_timeout(pll->common.regmap,
> > +                                    pll->config.reg_offset, val,
> > +                                    val & PLL_CFG_LOCK_BIT, 10,
> > +                                    PLL_BYPASS_WAIT_US);
>
> Should the last two parameters be
> PLL_BYPASS_WAIT_US, PLL_LOCK_TIMEOUT_US instead of
> 10, PLL_BYPASS_WAIT_US?

Yes, thanks for catching this.

> > +
> > +     for (i =3D 0; i < data->num; i++) {
> > +             struct clk_hw *hw =3D data->hws[i];
> > +             struct atlantis_clk_common *common =3D
> > +                     hw_to_atlantis_clk_common(hw);
> > +             common->regmap =3D regmap;
> > +
> > +             ret =3D devm_clk_hw_register(dev, hw);
> > +
>
> Remove newline
>
> > +             if (ret)
> > +                     return ret;
> > +
> > +             clk_data->hws[common->clkid] =3D hw;
> > +     }
> > +
> > +     clk_data->num =3D num_clks;
> > +
> > +     ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, c=
lk_data);
> > +
> > +     return ret;
>
> These 3 lines can be simplified to return devm_..();

Done

Thanks for your comments. I've incorporated  the changes you suggested
on using regmap helpers. I left some comments on the use of FIELD_GET.
Let me know if you have any other suggestions. I'll send an updated
version by the end of this week.

>
> Brian
>
