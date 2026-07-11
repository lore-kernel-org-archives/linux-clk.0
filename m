Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366332D617
	for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783778826; cv=pass; b=e9wFrJPu/GODu2O67Mr/i7T6t77bJnFdzZDYKz/Lg9Ha4D6UTBJJO0NanxKqcYoov175RaDduq2+2ZEA95pAoU74e62XsxY8DLlIEmhuvxM70JkrSDcfnTCza65NJAyV35jfvv617vZQEFbi0h5LBEmebE4EGhYSlvh1F3+h3pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783778826; c=relaxed/simple;
	bh=XYZHmXO266PnG+XtLrDYbMOcTwPN8wpA+X4UQuJ4BBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvLrATzNUiKmMMjrqP0yzV+vCf902gjdFR1UbUDiD4J21Zd5x+5G+ZjWd3x1gQs9GzJgM+5FL6F/zsoY1YkyHaQOwo8xvz7uNMy8wTMNT5SbzYmPVYIRVqq9NxCya4TqfSo3/+ZL8tEiQB/+OMHpnDsqrNPqc/lKxg7nbhTHgyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0Bm6gp3; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0Bm6gp3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e03c2763so360102966b.0
        for <linux-clk@vger.kernel.org>; Sat, 11 Jul 2026 07:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783778823; cv=none;
        d=google.com; s=arc-20260327;
        b=hQdZ572LSjCjJLovGBaMRufnMrqenytgeakgXJ1yEc+eaxue0LKUme3x4xmksthmos
         r0d8PQIwWquCbDFPrbTloozY0qC8fMbdGWbJ3AXVdAWluDExWibL9/BCS4xaYY1eOkvr
         UIvgZhabIEAgKPGHZx1xq9zVWu/uZ/dWKlbXIhrfn3IPG8XT0Do3TI5OhYIssn7a1zXt
         XB1ytbMsXiOCOnxK2c+6G0vR3eUREQLuR3GtSM9/yC91TT4s+e/4CxGdXBAqpcawaKrG
         ZMkBzWak84ghp6H7in85Z8m3YYigw1UhDsxnaKYS6OsGimCoLLYU0Dyn2QfOGoE5P+Jr
         LW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JV8xpg/us8vz85Qr2YfvUTne/idxb/qEJaYj2rdfl2Q=;
        fh=n8G9dM0xK1RwhS+xsvG5p58Vqr6hcdKzV78hSfjlQMc=;
        b=DBvNbFSlqx9pu8PWQmnoGtUq5ftLP3zp3BokvGA0rdu4N4j1EPmG9zesARXEchygPO
         Ifvtcvg+8pdMCxlGL2fgp3/j3sOW1ndTOVf7ugN5ZGoYymFzd0spFDKMKDUr1VOYDGLz
         DzNFow01oAOz/z2mdafBrcqVbFi1DbhBer7iTAspXhnpiMPZzCQtoD+Fz2Hzbcw/wcXo
         NztXPArIyUS8ui/r31lDKNJPIiBusEPmL0MKfwJRHoMxPsA2myCafF7WdhiJ++Svswg+
         KzMDkZrP8e0lRqSUK8rYR9PRJTFOkC4M1Cb0XSA6RCGluGRcaf6h78kXO0C+7CxHJ3Au
         Smzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783778823; x=1784383623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JV8xpg/us8vz85Qr2YfvUTne/idxb/qEJaYj2rdfl2Q=;
        b=k0Bm6gp3yeiOdgmfrY+1copiqJv4MYlc4M90z4S9RG+bYQi97jvgeBthfO3Le36bFI
         jJnE4TKJrAgxYdJUrx1Pc6KYlT7QQmjTysIYtjKfoS/z3Fkueh6iCTGY/JIK+YJXLSVw
         pDQY2jvXqK32i3TfePtaeJbRa690RwpQQugX07920FHWH89J4zMx5p18xeLx6wjefrk8
         1Jp2niyPkru6Rel9/fMeUlYTQnr1i8x8sFjQqVZ33EVFgPgpqDX3o52SoELXKijIMMaP
         vrV3pCIx3ZyyeJ7JfKsNIkkkLJYrGu8en9vAw1X/yQuI37yibyOd1J1dClIw5416pU4I
         1j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783778823; x=1784383623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JV8xpg/us8vz85Qr2YfvUTne/idxb/qEJaYj2rdfl2Q=;
        b=mnHX23rZHDz6G9Du+OteGr5Q20t6HOVB3fqb8criOxOf4yaTtercV3ZMnDN/kVAVAl
         wM65KtEhpr7LQmjh08CXm2XbCr62v8joSWz2MqFZFMtNr1qYgw8woKDkQBGV8f05OKmC
         pi4xmsSQl/QLuMfbKKVgopztrA2Nm/3x9lzE9WqdbI/RZadDEddZqSzRfeNALVQu6p+R
         1amJshi7TNHKRICq7k5ShPuN9gq4ziplQ3dkT3D2uyuQAyd8SmgNmE5N6iUVy5KXMRLC
         +1kBd/NfvUM6mxfTDPQJrzPt2roYlgvvcXOKx9iMcudfPlAyBTb07SBu19f9HVhX+r9K
         kTOA==
X-Forwarded-Encrypted: i=1; AHgh+RoUhjq/cv8g0fMRqO18euC8OJu6FdEnzzO8pmB+wdOh6jD37lJLBM/E58WEMY1VlvPes/FGN0EsVmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydqwBqBEMZs8B8LnYhbs5p5E9jVGtUyjt6uO2w3S61FbvvUtTI
	s/dmaCMi/v2VBXPrXx0hQ4QtCE/OeFpqA+ECHCKk/18D3vaBnPB83QF5Wduw3xoB6OlwRjD1x2g
	96VxravCsckb4VmPg3njWKVBRhPy/Og==
X-Gm-Gg: AfdE7cmKicSttAlQrFY1DSRJ0yqO9LnJPTyNTkXIJW8+9bGG50FYw2LaGlqzwHMbUvo
	Z7f6SmYXhpUa6dQZaiu19fOR0nCwHIAdFPu6s0LEWaiYcTVr3Pk1DCKD6IssWzmoYXPyBC8Afjy
	3zlv59YAa17GBQ63Be5O/wQCscwZKI+ZEWYO3uDxmdXZNXaYE6c5t8/70JuAMoZOvHPSUvD4UOp
	YG3ZikwxU0AxhRWkROCn5R0JKv4UsBRYFFoAcu80v0ZBUoIXmZXMaPeT808buK+qJV2UmGE2+H/
	VP83ZJxosfoWySvSw1+cOFEY1gPKSxKVsedi06ilRDxLOConMkN9GQKyEuoYQdWJhpCvYUARsSm
	n9ceBOwjR1Af7oV5o
X-Received: by 2002:a17:907:6e86:b0:c08:5bdb:e904 with SMTP id
 a640c23a62f3a-c161e89a8f7mr100449066b.9.1783778823303; Sat, 11 Jul 2026
 07:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624070602.10328-1-mhun512@gmail.com> <akwTWVaXuJ57OqSO@redhat.com>
In-Reply-To: <akwTWVaXuJ57OqSO@redhat.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sat, 11 Jul 2026 23:06:49 +0900
X-Gm-Features: AUfX_mwmB1JfR_T4C9F8dXMRqaANm7FKg6YxyVXskCFm9rTIs1ypySPg1uu9G54
Message-ID: <CAGEsz8HaSD4_ko92cWFMsNVYy=zJgxv5i5y72ff=ckZP3mRuJQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: palmas: Balance external-control clock prepare
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I split the changes into two patches and sent v3.

2026=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 5:43, Br=
ian Masney <bmasney@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Myeonghun,
>
> On Wed, Jun 24, 2026 at 04:05:42PM +0900, Myeonghun Pak wrote:
> > palmas_clks_init_configure() prepares the clock when an external contro=
l
> > pin is configured.  The current driver only drops that prepare referenc=
e
> > when external control configuration fails.
> >
> > If provider registration fails after that point, or if the driver is la=
ter
> > removed, the prepare reference remains held.
> >
> > Use devm_add_action_or_reset() to manage the prepare reference.  Use
> > devm_of_clk_add_hw_provider() to manage provider registration.  This
> > balances the prepare reference on probe failure and driver removal.
> >
> > Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaud=
io clocks")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> Please split these into two separate patches. Otherwise, it looks good
> to me.
>
> Brian
>
>
> > ---
> > Changes in v2:
> > - Use devm_of_clk_add_hw_provider() for provider cleanup.
> > - Manage the external-control clk_prepare() with devm_add_action_or_res=
et().
> > - Remove the manual provider remove callback.
> >
> >  drivers/clk/clk-palmas.c | 24 +++++++++++++++---------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
> > index 39049f62db..fdbf8445eb 100644
> > --- a/drivers/clk/clk-palmas.c
> > +++ b/drivers/clk/clk-palmas.c
> > @@ -194,6 +194,13 @@ static void palmas_clks_get_clk_data(struct platfo=
rm_device *pdev,
> >       cinfo->ext_control_pin =3D prop;
> >  }
> >
> > +static void palmas_clks_unprepare_ext_control(void *data)
> > +{
> > +     struct palmas_clock_info *cinfo =3D data;
> > +
> > +     clk_unprepare(cinfo->hw.clk);
> > +}
> > +
> >  static int palmas_clks_init_configure(struct palmas_clock_info *cinfo)
> >  {
> >       int ret;
> > @@ -214,13 +221,18 @@ static int palmas_clks_init_configure(struct palm=
as_clock_info *cinfo)
> >                       return ret;
> >               }
> >
> > +             ret =3D devm_add_action_or_reset(cinfo->dev,
> > +                                            palmas_clks_unprepare_ext_=
control,
> > +                                            cinfo);
> > +             if (ret)
> > +                     return ret;
> > +
> >               ret =3D palmas_ext_control_req_config(cinfo->palmas,
> >                                       cinfo->clk_desc->sleep_reqstr_id,
> >                                       cinfo->ext_control_pin, true);
> >               if (ret < 0) {
> >                       dev_err(cinfo->dev, "Ext config for %s failed, %d=
\n",
> >                               cinfo->clk_desc->clk_name, ret);
> > -                     clk_unprepare(cinfo->hw.clk);
> >                       return ret;
> >               }
> >       }
> > @@ -230,7 +242,6 @@ static int palmas_clks_init_configure(struct palmas=
_clock_info *cinfo)
> >  static int palmas_clks_probe(struct platform_device *pdev)
> >  {
> >       struct palmas *palmas =3D dev_get_drvdata(pdev->dev.parent);
> > -     struct device_node *node =3D pdev->dev.of_node;
> >       const struct palmas_clks_of_match_data *match_data;
> >       struct palmas_clock_info *cinfo;
> >       int ret;
> > @@ -264,24 +275,19 @@ static int palmas_clks_probe(struct platform_devi=
ce *pdev)
> >               return ret;
> >       }
> >
> > -     ret =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, &cinfo=
->hw);
> > +     ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_=
get,
> > +                                       &cinfo->hw);
> >       if (ret < 0)
> >               dev_err(&pdev->dev, "Fail to add clock driver, %d\n", ret=
);
> >       return ret;
> >  }
> >
> > -static void palmas_clks_remove(struct platform_device *pdev)
> > -{
> > -     of_clk_del_provider(pdev->dev.of_node);
> > -}
> > -
> >  static struct platform_driver palmas_clks_driver =3D {
> >       .driver =3D {
> >               .name =3D "palmas-clk",
> >               .of_match_table =3D palmas_clks_of_match,
> >       },
> >       .probe =3D palmas_clks_probe,
> > -     .remove =3D palmas_clks_remove,
> >  };
> >
> >  module_platform_driver(palmas_clks_driver);
> > --
> > 2.47.1
>
