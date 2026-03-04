Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B323F347528
	for <linux-clk@vger.kernel.org>; Wed,  4 Mar 2026 23:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772667822; cv=pass; b=sjmK7z+K6eROTFeuIIqmLkqywpxskCKqBaFDrgQ3QRC1iqM19rUd1rgVi10qu7kY8+ycsDQdAiM6I52r9o1v44YOIuVJ1UuljWQYUmQy3XNjqanO4/mALxsiP4JZqJM00yCiYVtN+MHol6/xinsQKtKRz0+D2iapepg92ao1EvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772667822; c=relaxed/simple;
	bh=liAMEsOY+3ttBSYvExcPovT+V1g7cYkOMKIYUBzjg4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKHTOwRfB7+Uhy/kL1E60yCkhwQM3eTEs05QfV5NS/FnR2vv0W9Lk3ue3/D6+dKtiDWC0SvtdXe65vgESQWO2zCN6d/ZBew8oP4qHd+Xv9M/Nr2VaRNap69Rf4TSmzkf4QnQSI7GQhJ1DNvPCExeQovc+WJ0WVkiRAHF0uEw0ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=YdS3VQIo; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="YdS3VQIo"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79827d28fc4so68363787b3.1
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 15:43:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772667820; cv=none;
        d=google.com; s=arc-20240605;
        b=bksq4WuwiEW9L5DP8WrdDnrxJrzPwViFWxdhcFCPbGjN+lzAvMU0R2F3Vax2OTsrvP
         I2LkH5HY8lkVvhM3leAbV75Hcg/OUBz9tZC0yx/IsUhgteLYOM5D874cv3MQSINtMdWb
         E2hrGhHwpBWJg83CfaCdWwXJFdARYNFxIaTjO3RTejVH7CctJ3NJr+QFWwGy04SHakzn
         ZImBjKUjMVJq3HoYSD4+juCP8B0U1Lbg1cT66GtpG9GdfOK5K1KxDGq/w/p4rABj3f7E
         p5eE0NnlckXf0rjZ657ZbIZFlkWYmH+VQSPkn321+RaOw5PLoJnnpt456f9pdrblGIHi
         Z0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=th9Dubm5MZo7OqHj9TXvS+R0ZyOofjALKbBnj/rhigU=;
        fh=bTkgXcBdD8rxiiarn2Jrp1WrQGcV14i67b0rSw8ANlQ=;
        b=XZIUuPdB3v2D66fHSTFd6gN78zQoGXaXfbyupkcX4DcpKI4hOdBSCcoR2HthDWyXPh
         DyWlN4sLmWmsS14I4BNtBpuCs80xcbFDjSHwbJ9CRdfHokH8fFl5ngSJos7V0IqRXlf7
         8MaXmbDd1QIFEdQTofgAerxINDdF3YmLRXLmZ8KwqT4Abqwog/zOUIdjdvKo0J8G4XbV
         mwzufQIyo5ygobW35hzgpfGaIz/OMP3gjXT1Tcem69n1aEMpjx2Ej4IX5Dr1OL0Oskuq
         KgEF0u97yahqjDowVHnuuMnpl1s2cw7bBgZABXkjtNQOmoxHu0J54tLFgk5tIpzYU6ki
         SsqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772667820; x=1773272620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th9Dubm5MZo7OqHj9TXvS+R0ZyOofjALKbBnj/rhigU=;
        b=YdS3VQIo6+idAZgjb7Jpw12eYSvYy9oPgoadWR7a7Vhm79uOZns1IwWi0CYtbYJERS
         4SGQtL+AdrWzv/q6Cel/orH/+kDW5uLMC4037NRvfZv9Hl6Ht5dJtwjCiYHeMjhCP5iP
         M7lW6GAdP7ZUUOfzIW0+zJqB0ULOv3GoyPO3abEFyISaQ8YHIzvf9z1shyVBGIJn+wx3
         5v78F86qRSLFHqF6bqkr7cI9y4CnkW4ix6dVMUsAHCqBcks9kZ0eW5YgBH8uyZsdfyzc
         rlI4P9Eip8yqvnbAAgb/tP2AAGaJTie6RUj1YzT9e3uI1oXeKYVdkbiJk4lN1Bi6xHRh
         NJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772667820; x=1773272620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=th9Dubm5MZo7OqHj9TXvS+R0ZyOofjALKbBnj/rhigU=;
        b=pheR+5jC2BhxVU97JvRr08SxQq9Dux0tPXr83tqnzEOiaY9lJB04LW/nX4tmB1VZzM
         oeg2rVtZg/03ncukhHI17jjiCt5vxBwWxHXkxxGehmegYMC624upxAtBEwBYtGdgyVlP
         UKmUfmZInq8fd70xosWy6tBhypK6D8MJO56ks+0k4CPH098kOKsOu1m0SNEsHbDH4Fy9
         Q65ZX6ZdDyIeFEWQEJQlHZTNZq3qLdTLbbtb+32C3DiUKPe0riZv4qoCxAhqXw9pBDlD
         CSherIlxbB1jiKYJRbk9JWU5VhA3NYDLVCkgGeBDGOUuvXp8Or8i9isVGbLkwlHO/Xxl
         h5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUcgM4+v2BEn4jnWA1WQ/C+rThtCFFtt1dXR5dJgSPynLRIHBoZFUbjvkJf+N+5UbMcVd350NANe00=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRAQukUMoiH640WoNgV9zxmqP5ntIADG0xMbXla8HyxlfXB4ht
	sYAEDyWXn6JXA3WgRCFjyhoqH/O5t5rbb3lDGaXFm8n1Mvybj+SUI0l3FlmcdFvu5UwyKtVVXDI
	xQtmWZoNNnB2wejhiT7GIEMw4wWJr83KkNFzYVJC45w==
X-Gm-Gg: ATEYQzwnxrN9UHmu8o47ioD1E+s/xkCQ9ARUAjV5ZSPBiosQMQx8nH4a+I9qjt0Y/PH
	2zwywWNX/SXx+LabdodAJM4b3huFzIk6UpqRWWk0jbaIwPCpqkeELkoUqAeei/n0TGjWQ6H+kSE
	ABT8N/ZooCelNEuVIbIU2KQ1imf5vkUHZp/N3I1UuAnJEt1vC0RnksulIDgYuG0p4Q6p9M43v51
	PPADOv9pkEYnjyK/eW1UcLrHuMJkEcun3smF/24ym5ZvEd+GSODt/+1PpCt8ZH0ms0Qz/1nFz0E
	t7QYBvRwuQcoWKvC5T/k9jN8zKqbo/mePaLEl69y5CZsYKjhu1G2aksT9JwlKsPHghhZDIZWL/5
	2X551cys=
X-Received: by 2002:a05:690c:64ca:b0:798:77ee:cc0b with SMTP id
 00721157ae682-798c6d250a2mr28157897b3.64.1772667819690; Wed, 04 Mar 2026
 15:43:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
 <20260303-atlantis-clocks-v7-3-415c9dda086a@oss.tenstorrent.com>
 <aadhd3LwZQPkT3A4@redhat.com> <CAEev2e_hxUBQjVdxisqBXHQRzspQq6dHT0kCZHUW-6dEyV4faQ@mail.gmail.com>
 <CAEev2e9fEsFqN5b4sAT9cbjVAvJEPvqxoqy74e5mG8K10xBQdg@mail.gmail.com> <aaiwYxQuoptMDbBk@redhat.com>
In-Reply-To: <aaiwYxQuoptMDbBk@redhat.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 4 Mar 2026 17:43:28 -0600
X-Gm-Features: AaiRm51XS5TgJvKLSFcENIB5eXoLABmGDu_OTsDM4l8lKFxkTWPNl6bFP6Nwjco
Message-ID: <CAEev2e80Rs1gO7-cUCRaJiYGbhMMmR8V=X=9hHQ4AFoLLiFpMA@mail.gmail.com>
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

Hi Brian,

On Wed, Mar 4, 2026 at 4:21=E2=80=AFPM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Hi Anirudh,
>
> On Wed, Mar 04, 2026 at 11:53:38AM -0600, Anirudh Srinivasan wrote:
> > Sorry for the follow up, but wanted to run something by you.
> >
> > On Wed, Mar 4, 2026 at 10:40=E2=80=AFAM Anirudh Srinivasan <
> > asrinivasan@oss.tenstorrent.com> wrote:
> > >
> > > Hello Brian,
> > >
> > > On Tue, Mar 3, 2026 at 4:32=E2=80=AFPM Brian Masney <bmasney@redhat.c=
om> wrote:
> > > >
> > > > Hi Anirudh,
> > > >
> > > > Thanks for the patch. A few minor comments below with some minor
> > > > nitpicks, additional places to use FIELD_GET(), plus some suggestio=
ns
> > > > for additional regmap helpers to use.
> > > >
> >
> >
> > > > > +
> > > > > +static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
> > > > > +{
> > > > > +     struct atlantis_clk_pll *pll =3D hw_to_atlantis_pll(hw);
> > > > > +     u32 val, en_val, cg_val;
> > > > > +
> > > > > +     regmap_read(pll->common.regmap, pll->config.reg_offset, &va=
l);
> > > > > +     regmap_read(pll->common.regmap, pll->config.en_reg_offset,
> > &en_val);
> > > > > +     regmap_read(pll->common.regmap, pll->config.cg_reg_offset,
> > &cg_val);
> > > > > +
> > > > > +     /* Check if PLL is powered on, locked, not bypassed and Gat=
e
> > clk is enabled */
> > > > > +     return !!(en_val & PLL_CFG_EN_BIT) && !!(val &
> > PLL_CFG_LOCK_BIT) &&
> > > > > +            (!pll->config.cg_reg_enable || (cg_val &
> > pll->config.cg_reg_enable)) &&
> > > > > +            !(val & PLL_CFG_BYPASS_BIT);
> > > >
> > > > Could regmap_test_bits() make this a bit cleaner?
> > > >
> > > > > +}
> > > > > +
> > > > > +static int atlantis_clk_pll_enable(struct clk_hw *hw)
> > > > > +{
> > > > > +     struct atlantis_clk_pll *pll =3D hw_to_atlantis_pll(hw);
> > > > > +     u32 val, en_val, cg_val;
> > > > > +     int ret;
> > > > > +
> > > > > +     regmap_read(pll->common.regmap, pll->config.reg_offset, &va=
l);
> > > > > +     regmap_read(pll->common.regmap, pll->config.en_reg_offset,
> > &en_val);
> > > > > +     regmap_read(pll->common.regmap, pll->config.cg_reg_offset,
> > &cg_val);
> > > > > +
> > > > > +     /* Check if PLL is already enabled, locked, not bypassed an=
d
> > Gate clk is enabled */
> > > > > +     if ((en_val & PLL_CFG_EN_BIT) && (val & PLL_CFG_LOCK_BIT) &=
&
> > > > > +         (!pll->config.cg_reg_enable || (cg_val &
> > pll->config.cg_reg_enable)) &&
> > > > > +         !(val & PLL_CFG_BYPASS_BIT)) {
> > > >
> > > > Same about regmap_test_bits() here.
> > >
> > > These instances have it reading 3 different registers (unlike almost
> > > all the other examples that just read one) and testing bits across
> > > them. But I guess it should be possible to use test_bits here too. I
> > > will update them.
> >
> > This ends up becoming like this.
> >
> > static int atlantis_clk_pll_is_enabled(struct clk_hw *hw)
> >
> > {
> >
> >         struct atlantis_clk_pll *pll =3D hw_to_atlantis_pll(hw);
> >
> >
> >
> >
> >         /* Check if PLL is powered on, locked, not bypassed and Gate cl=
k is
> > enabled */
> >         return regmap_test_bits(pll->common.regmap, pll->config.reg_off=
set,
> > PLL_CFG_LOCK_BIT) &&
> >
> >                 regmap_test_bits(pll->common.regmap,
> > pll->config.en_reg_offset, PLL_CFG_EN_BIT) &&
> >
> >                 regmap_test_bits(pll->common.regmap,
> > pll->config.cg_reg_offset, pll->config.cg_reg_enable) &&
> >
> >                 !regmap_test_bits(pll->common.regmap,
> > pll->config.reg_offset, PLL_CFG_BYPASS_BIT);
> >
> > }
> >
> > We can't use a single call of regmap_test_bits to the
> > pll->config.reg_offset register cause we need to check if PLL_CFG_LOCK_=
BIT
> > is set and PLL_CFG_BYPASS_BIT is unset. We end up needing to make 2 rea=
ds
> > to that register.
> >
> > Any thoughts on whether I should still be using regmap_test_bits here?
>
> If it's not looking good in practice once you implement it, then just
> fall back to the older behavior. It was just a suggestion.

Understood.

>
> I haven't used this yet, however there are also the regmap_field_xxx()
> helpers that are also available. drivers/clk/mstar/clk-msc313-mpll.c
> uses these helpers. I don't know if it would help to simplify your code.

Doesn't look like it'll help simplify things to me, so I'll keep things as =
is.

>
> Brian
>
