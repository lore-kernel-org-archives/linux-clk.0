Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307A7E105
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282112; cv=pass; b=BCwvriH1lilWtm68+ZFq0pccHNYgh3KUJXr7hau5GplI2AtxMMmRbYOZ4vYBFynl+NvI+cIyWigfKlIkGr2jV9kCfY3Z4xOexEh50FsqWpOSa4giWZvfplP0K+G9xXtvfVZZ1f6dJqqmgfukNjMeriQrjEQrJVWoZidT+74wHOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282112; c=relaxed/simple;
	bh=qLI1JvQzyKv4BwtYgCrnQHax8Ud0O9Lnv3TWfOrkeY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l6JW095lf1/JiC9NeaHKM6wuI3HHUHjMz+tjwwPO8irGMi8J+X7JO6s6rMaJ9O03QJqujIbV2wLADoaQPRyzW/5f+sBi+5Qca/UFgiDcXaQ8s9xFyABytaZgIf0aP+gW+kP4Q3PCQZcrsmbseikvXNZe83EWNrNABEwRlyJzp10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h663ofPM; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h663ofPM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69532288224so1188674a12.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 23:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782282109; cv=none;
        d=google.com; s=arc-20240605;
        b=LjFgMB4wK+uLJ9a5ufR3IdR9f6hPqqqfNijRXb2MWt0Hqv/j6mcYWNAYrD5nV1grxo
         Y1kOl0dLKByoFAnJ93WLxwUUfpKV9nCxZKUk+BWOhFXF6P4hbGiGHrgStPExdEKjPS1r
         h5Y576xlMwuX2JloFWyLiGT5uk+cDtEKe/q/B49UmR9NjzJ2wlLCsxNkKNXNnLzZMsSF
         ts0zaYRiqXRPKCONTASHgamVBEI3uiZO/DOM8qn/4f1ee/x3uetNyHfv93QgGvsz14Wz
         pc9J+1wCbGe6/yMpy7GyeziK/wfjdVSxlHwiE0MKtZF68zReWF6RZaKsYfMLMmFcRGCA
         IliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        fh=B8hibHnhxC9b6F5cajc2+vx2s3WKHFRi+80KRLi49iU=;
        b=RQ71TGlRO+sEgNFH3swBjfr/iQ5S8hLiBeHbW2Y214M6gTEUx7QO2n5vX5iQFOap1e
         5Rl4S8Is2WeWZaW7UJKxrTRmxepvq6XTlJUxo2ZIOgLztOu4lmqd58uX8v6uTZU/Tyjg
         MwcPCLrgGMM26C/YaMbj+2Pp3CbiDxSOFKnrgmTUqPNmzr0Awq0tEvPRdfi+HeQ0WCLE
         oamIxhpP2xLIuGYV97xplt80HeWDjX0bd0TpP4l9Pe7GlN1khfGqVndqU6WBRjl/F8vQ
         wDbF0pM2uUArEJmcDzHTk8akSCFpBUWoFvWkUF2hiB/49sur90whVnMkb5ENXKuggUIs
         8Ttw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282109; x=1782886909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        b=h663ofPMfWxXGMQj6c8PwloUZjn2WuFAVBGRshMX3rQONvBglpD8OnBFV+3L2bXKbO
         Ji9Sy0F5NznHT83KTqHmcp5jvbPtXjYMhJ2tPnHCy8phOA+Y7Sj67eIePPoH/Q4UB8YP
         EDW/wHRylOnsaEQ6UnHH2brv2t9QBJLRUF8+snm4yTY4aDLd4oS6GeTZNsBm93O9Dbav
         W3v8UiHmZGqO4TXs/hTC62qtqPwAr+25NCbtjK3utEqNe4YBUNujUc1Q5m93dRdXppho
         pCpxNLowvvEl1xk/JQem0ieKkzSKV2n/mGN/F0mu5mvTl+0owJ5M9wAwxFCtmeWrbEt7
         YeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282109; x=1782886909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4zsNmFH32BNumBf06wrsZrJajJ8+DyGEAl3O6e7hqWI=;
        b=hX4zl2oEo8YDNq7EoyQ61U6jq5wcpra3aZYJsQiS1Wsx6vo7mQnXLo7oXSTAZjVfF1
         gHO6A0K94ml011Dgmk/UldFPHvqf7SQOc4n3ahX/iRZlox/syUGUJj8KB+R76lMJN4o+
         vRjbEm/lUUrM9oHkhl57sLoJ6uKIyJUIKcKbWrCxiGhwgRyFbsWXfDJyypQvtM9HUELG
         kmP8o+otgOhEBoGaWILGf5IVHHaQbgAifszHUKn6TJLwlcL7DFfbv13t01O2Wr5YUOqS
         SHMZum6ZteyJmvnyjcGnJeEzRRil25W34E6Emcl8IwgaMQTDrutN4An6HeNlnbighlad
         m/tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EfOZ7//BCml0EvLOKjM0Jg9D08GgyXg+VSAJsoUvgxHnU/wOecrZ+6+LFyD0gUgZkjeh1tVZHFWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiDzHZdm7r6gUYd1h5d1/8KiolBGeTUSSS6SQOn+u7fihSWGv8
	+dFNUD4Mc1PmUJkz1BSda54p//1ZuLh5zivfZ4Va4SDwxvHwFsyBb9YEu5vi8LqUd+YtWNo2orF
	rQzpAqNaZIAzSE4aEZfsoqc9GvApWRQ==
X-Gm-Gg: AfdE7ckR9YFH14pXpEbEioWKUBUD9gt4Y4ho9ctQqPBvP+0CNVthKJ2eMPrTNeV0OkV
	7V0TnBTo/PnhuTrqPibOzbBsb+yz0Rzhtz5dfJBwPg39fUTG0T0DUdOwPLp0GE83rttpXO6KDCh
	6lNq3TxEXWowNJiyWVbqbgHYv8Fn4TCm0rOzutX7rKfxZEqoBcjA0nU2X3RUBXlkW9b64jtB3aG
	8srZSJfjyZT4t9+F+ZmjcqTVkJ5xBE3f/pqQLW2LNQrEah818UqrCJkzlIxI6X63AkgvoE2r0pu
	Rr9gMcFDuKP53ctLcMFVfvUA
X-Received: by 2002:a17:907:c001:b0:c08:22ae:6f46 with SMTP id
 a640c23a62f3a-c10810aa410mr290153966b.53.1782282109214; Tue, 23 Jun 2026
 23:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623094125.95791-1-mhun512@gmail.com> <ajqZoOv-TvmOMLCh@redhat.com>
In-Reply-To: <ajqZoOv-TvmOMLCh@redhat.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 24 Jun 2026 15:21:36 +0900
X-Gm-Features: AVVi8Ce3Z-6QUrlwc1vKC_mNWrwGm9QCSsydSqBSnSiXLAHJBuAdHPRbOQVKR9I
Message-ID: <CAGEsz8H7FAq8yRp+GqQeWZosB55ABzShCX8pgz0HvS0Cccni1w@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt6735: Unregister PLLs on probe failure
To: Brian Masney <bmasney@redhat.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the review.

I will send a v2 with mtk_clk_unregister_plls() moved directly into the
devm_of_clk_add_hw_provider() failure branch, and I will make sure it passe=
s
checkpatch before sending.

Best regards,
Myeonghun

2026=EB=85=84 6=EC=9B=94 23=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:35, =
Brian Masney <bmasney@redhat.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi Myeonghun,
>
> On Tue, Jun 23, 2026 at 06:41:11PM +0900, Myeonghun Pak wrote:
> > mtk_clk_register_plls() registers the apmixedsys PLL clocks manually, w=
hile
> > clk_mt6735_apmixed_remove() unregisters them on driver removal.
> >
> > If devm_of_clk_add_hw_provider() fails after the PLL registration succe=
eds,
> > probe returns the error directly and the remove callback is not run. Th=
is
> > leaves the registered PLL clocks behind on the probe failure path.
> >
> > Add an unregister_plls error path so provider registration failures unw=
ind the
> > PLLs before returning the error.
>
> Please run your patches through checkpatch.pl before sending.
>
> >
> > Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 ma=
in clock and reset drivers")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> >  drivers/clk/mediatek/clk-mt6735-apmixedsys.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c b/drivers/clk=
/mediatek/clk-mt6735-apmixedsys.c
> > index 9e30c089a2..04cf9665ec 100644
> > --- a/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> > +++ b/drivers/clk/mediatek/clk-mt6735-apmixedsys.c
> > @@ -102,10 +102,17 @@ static int clk_mt6735_apmixed_probe(struct platfo=
rm_device *pdev)
> >
> >       ret =3D devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell=
_get,
> >                                         clk_data);
> > -     if (ret)
> > +     if (ret) {
> >               dev_err(&pdev->dev,
> >                       "Failed to register clock provider: %d\n", ret);
> > +             goto unregister_plls;
> > +     }
> > +
> > +     return 0;
> >
> > +unregister_plls:
> > +     mtk_clk_unregister_plls(apmixedsys_plls, ARRAY_SIZE(apmixedsys_pl=
ls),
> > +                             clk_data);
> >       return ret;
> >  }
>
> This fix is correct. Since only one path will encounter this, personally
> I would just put the call to mtk_clk_unregister_plls() inside the if
> statement above to simplify this further.
>
> Brian
>
