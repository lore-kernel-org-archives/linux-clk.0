Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793787336;
	b=rhYVTl1jUlEHBGfiAWOXfs1fnbYenhBYkR8g2T83lSkt8d85dpVnv6FoOcgp1TwAOoOP
	 hYzE+Vi4bPgAtcNK+LIhC2A2FlN0ktyHB06L6Bk817h3nkmioySGTIYGuzH6YFXjkPhSP
	 s0hjDpieZFG83zG3iZ73QEr3EFNTMen7sab3X0JRs2GHrbMvrJV+/P7cIIF+2ijk68XFU
	 Jk6KaIJFNSaOLHTqxJPGOs3oCnX9Me9I9kep3qq62bCCE3b1Q9N9yrxkgcJ35+Ox/JgrR
	 FwKDm3Cp4C/T9juAaSavj/JRas5VPMzdIGFaDCyCQ8XwTV+eNfVmZIzc+WwbSWr7gjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
	b=ND5+BLAPKIEwBCw4evTvt/JD/52MDD0XM1lEjJfnfKliEmp2paT0VL39gT6fRZ7BZ2ER
	 N89qwcWnzm9FPngrAypdq+5oLlGG6AAqcZYCL/zu6YazSXVcXhNBTbTr/r5T66z8trLhy
	 Nw3bYKIAhCd87xpFU+QmW8cn5DDPMUYwp8jLNve45A1PZ4DPkc2MlmJzsrsYgJN9jOewi
	 p4A9jN/dMJdu0fwtqy8oDdjkbpBze4kiartsZPtYOH+Vt8O70jhQo0cq4bsD+mg410f91
	 Pl9VbWafujos+jp7CUgj9Q8xkllEdfnthpgSiZA2D/UwsYoNn+/sRLXLepNHwIcPM3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CsW3eM3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA5E606A31B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA5E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CsW3eM3q
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6767d92cde6so623788d50.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:15:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793787335; cv=none;
        d=google.com; s=arc-20260327;
        b=SQVcjxglqPVJvhqNdrVUb0LlrIWB5ZfWPNkrraHg7gKSKpR3J3FkVfnOCirrsZnQ+8
         QlVliyIzJwN6xotstg6McKAQd8UX/Q2wr5SD0+CM4yuHbmImhX87sGNlMmFByvVOMBJP
         Y2PT4IBs4+3bC1erx+KYTnJBZfDJC3M46Axv1Zqy6fWCer/YxoAV5dD/uZTA4/e/HawR
         54l9SK7tVBrJLlr9mVXM/abal9UgPEbPCLG8cNLe2zhPyQL4uyCDUANIhmT7oWqutH3n
         zhXAdDuz/50fNXwUI8I+csClEq/s7D88uHYpQAukBUwjx/bcEY6MqWxrSNbiM/YINLNt
         vH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
        fh=sm564Tsr0WMjZRFjvuNBrRVuXgqBAl9YPNradnvkYXY=;
        b=LIWO3HGz+9kVLGM9aCZV54wtv4PRXuqJeHkMcX7999jK7EFERa/sS5pSsHl5G4psgy
         a5uKRvhKK18QVfzwwcVamqmAmS9yLlqv4Fi5cIu7R40Mq0BXvvzvtzIyvUf2klmqCTM1
         lpei/A4bGyyuXf8+oLxqapr+/mC1wMTLUjJ4qK9q2jQu5H6FSzSUWMxvJqHjJxSLRXFZ
         8zkEh1TlcC+VUwviCh+FOVS7Ppkow0dJpOEbU4Q05mUtHXYeBnV0ffI04yxSO3wKYiTx
         lSPElYLnmOOfSC5WYyIGMvXD0tTuoQBME2Ltstdm7Dh3ye1BD2RjXMioq0SA2koS0+TG
         v2sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787335; x=1794392135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
        b=CsW3eM3q+zrDVPeiuScolojFCOCYBWgyo4clxbjKxraJ46mUtejaySprZYxuQFfDiK
         BWIHUXQxMEXycsc0m29HMmGfjhzeSwHbsZ9ul0adZrdff4Jua8v/NQ+ILnzPDu0hgAuA
         oVpQR+rgVMvln+aBlcXumRF6WMOEyHlEtHmG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787335; x=1794392135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GeAVtba64Qwv71o9CiCo+TFgxn75Fuo5tCC+2rZXz+U=;
        b=KB2r8i4Z1gb+zww5BO6LuwHtGf+470ytY+Ob0WoasB2tidT7OyO4dYZ3ND8z9me1AH
         tql9k+YWRjjjSlzjFvFPLXjnH7pCpenn0rroULdfBO3NIqrQW8nGPqha3sdIEb7iw7OX
         4+RIGbefEooBjaLTs/tzEu59vBL0AsfQKNsM6+IbpoOpmma+eG1FkNlHU7C0QS3JfdJB
         mEetTHG4Wr5wmzHKGWu2Zi8gri1EygNy4MHUaInRGEwpopF5Zb0I5iOgqwOf5kSFZUSK
         Lk2i14QzRfYvqS0WkfR+sDwu7OP9cGJ69up1RliHr8iwzBQWgbnfN3FFIzwNeqnA83md
         AalA==
X-Forwarded-Encrypted: i=1; AKwUvBzOxB/AeLTkZwb/tGmAgRoBAe0MdBXa0Wpc5VFZULjpta1H7dYXrCWrLlqnXHcwJuugXCSmUzJpxas=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nhgv0n1HBD3cgE3tzWyhKAMXrJNWMfQ/B4ui8HPPR3rRwItgr
	SyarpKwGdl32MirDxg4w7/1o6trTbHD+xQpzW62yaVxgJJQIDOUo4AgzfEbwWUOlzUPlQGqe+b3
	TUV8TONHCIHQUutmlX67A5K1xDDFeQ6HS5VV83g6mlQ==
X-Gm-Gg: AYBFou3OiK4oVad6JrbgA2/X/WKx3dTds7NLT4O6ZX8uMFwjRQnRjCOmHwGVezFoJfc
	PK1JwHkSpm8etVs7UBx8twMmEb4QRoCYUOpc6fM/g48tR1gQeqUpdDlo8Lf8Hp719DYjeiq1A8l
	FhrnqsX7ZhCxwQkqUdkecKkLeCgt+qqptBW/6LJuRPi2pOn+QM7XWCj/glXky9vgkXNCXMJlLI/
	eVGwtidijDZK4o265Kw5DD313WMPEgGI33tOKqPeWy5NXzwJzMcsGkwo3K1IAIW+KTq6e9/9J3Q
	VyVaK2QyOd6ITqOgGszJnFp/HROto/GKIRD2yRkimJgVMuYM0BL3s94UKHSksfGbtC1h3HV+/n1
	ICTth4FdPcTVWPtzWOGDRsLMp/vVoPOqxk6ySoPiryLNW3C4wTSIxziRF9E+AiRNX2m3B
X-Received: by 2002:a05:690e:408d:b0:679:8fa4:4661 with SMTP id
 956f58d0204a3-67ba508cacfmr13916977d50.82.1793787334695; Wed, 04 Nov 2026
 02:15:34 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
 <20261028074436.1958132-4-dario.binacchi@amarulasolutions.com> <179373624826.588706.3689544002135897133.b4-review@b4>
In-Reply-To: <179373624826.588706.3689544002135897133.b4-review@b4>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 4 Nov 2026 11:15:23 +0100
X-Gm-Features: AclHuK8nB_6aYSJgmHxc-dj0dbCRTwWxpOXswi7917sdDsYuWtlywfCGGeD2VAI
Message-ID: <CABGWkvqcOn5mvfe5G060ntDgzdr=kacDcEvo-e+Oyzs6F95Xzw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: ti: dpll: apply the spread spectrum
 configuration right away
To: Brian Masney <masneyb@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	michael@amarulasolutions.com, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Sorry for the noise, resending as plain text since my previous reply
was rejected by the mailing lists.

On Tue, Nov 3, 2026 at 9:04=E2=80=AFPM Brian Masney <masneyb@kernel.org> wr=
ote:
>
> Hi Dario,
>
> > The spread spectrum clocking (SSC) registers are only programmed by
> > set_rate(), which the clock core skips when the requested rate is
> > already the current one, e.g. when the bootloader has set it up.
> > As a result, the SSC configuration is not applied, as it was with the
> > vendor specific properties.
> >
> > Apply it from set_spread_spectrum() instead, reprogramming the DPLL
> > at its current rate.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> > Changes in v3:
> > - Skip reprogramming only if the configuration is already applied
> >   to the hardware
> >
> > Changes in v2:
> > - Check the DPLL lock state instead of its parent, as the reference
> >   and bypass clocks can be the same clock
> >
> >  drivers/clk/ti/dpll3xxx.c | 49 ++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 43 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
> > index 634fe0a1f9fd..d32d81a27bfe 100644
> > --- a/drivers/clk/ti/dpll3xxx.c
> > +++ b/drivers/clk/ti/dpll3xxx.c
> > @@ -690,17 +690,22 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw=
, unsigned long rate,
> >   * @hw: pointer to the clock to set the spread spectrum configuration =
for
> >   * @ss_conf: spread spectrum configuration
> >   *
> > - * Stores the spread spectrum clocking (SSC) configuration of the DPLL=
. The
> > - * configuration is programmed along with the DPLL multiplier and divi=
der
> > - * at the next rate change. The hardware supports center-spread and
> > - * down-spread only. Returns 0 on success, or a negative error value o=
n
> > - * failure.
> > + * Stores the spread spectrum clocking (SSC) configuration of the DPLL=
 and,
> > + * if the DPLL is locked, reprograms it at its current rate to apply i=
t.
> > + * Otherwise the configuration is applied at the next rate change. The
> > + * hardware supports center-spread and down-spread only. Returns 0 on
> > + * success, negative error value otherwise.
> >   */
> >  int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
> >                                          const struct clk_spread_spectr=
um *ss_conf)
> >  {
> >       struct clk_hw_omap *clk =3D to_clk_hw_omap(hw);
> >       struct dpll_data *dd =3D clk->dpll_data;
> > +     struct clk_spread_spectrum old_conf;
> > +     struct clk_rate_request req;
> > +     unsigned long rate;
> > +     int ret;
> > +     u32 ctrl;
> >
> >       if (!dd || !dd->ssc_enable_mask)
> >               return -EOPNOTSUPP;
> > @@ -718,9 +723,41 @@ int omap3_noncore_dpll_set_spread_spectrum(struct =
clk_hw *hw,
> >               return -EINVAL;
> >       }
> >
> > +     ctrl =3D ti_clk_ll_ops->clk_readl(&dd->control_reg);
> > +
> > +     /* Already applied */
> > +     if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)) &&
> > +         !!(ctrl & dd->ssc_enable_mask) =3D=3D (ss_conf->method !=3D C=
LK_SPREAD_NO))
>
> The =3D=3D on this last line has me a little confused right now. Should t=
his
> be an && instead?

The =3D=3D is intended. I agree it is not easy to read, so in v4 I will
split the check into the disabled and enabled cases.

Thanks and regards,
Dario

>
> Brian
>
> --
> Brian Masney <masneyb@kernel.org>



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
