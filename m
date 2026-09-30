Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577353CBE6E
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757390; cv=pass; b=nxaPU7dHMIOoo3Xxr+6ARZvo18KRBZgiNpxC0YVdov+eINUVkLzXxabw6OASKmcBYyjmcd+xqfdYNVPwIrDyryeH8wvtRP9jvxhsah3PwYY+nt64mT2zcfohZdk9oW1hgajnEFaMaHJx7OpjKcFvViOA8IPRRWdgmrd/IICjuDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757390; c=relaxed/simple;
	bh=HjdOFxmrol1vUnD9FKIi4UFta8BjlFpXjkromc99kSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYVpIF9teCP/gzX1aS40aBEnoEqrol0NOtGiKAyi7B4knQ284YCrfTa++2hCaHcGRbiMMJpB3GSO68ThHDrwXAtoJfTtnxYNrAkI8/3abih/MFnptFLUJCnK9YvwcIw5Wkul0kjxgymNks9coPvFYw12CEgq3aiULoI7TnaZZmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPP9lv96; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPP9lv96"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4887d3c59ecso735502f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 01:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790757387; cv=none;
        d=google.com; s=arc-20260327;
        b=a/Vyqo2A/KyecMjFFYC26oJ6wr+OTL62FB9syTSkAwkgj35CMdraDR2JAYFqFxvY5x
         NRZObKVFCrgC+5vZVChE/5pADiqYrkD06p73xdpQBUzTZ+xv5Pg+TxMy7iHMUSdC91Na
         hRC8rfNXME2Gpc+ICSYO+B9547ery70jpcLt6RShmwlMZ29QaO/VgT00Eg8EzPV83hm8
         Q4TcNy6/k+KUJ9CK0LrNHw2Djxky8jfLXa1WaJetZA2hYEeqlMBcRMRMBQmFoGn3sxiH
         sooV/xu66hId8wOUt4Gn187cVsgehhoCYpKjEt0r4xeOMfP5Rha8a1ZLAvsr8r8OeKQp
         0/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        fh=qMmGyPF82QM2IA+MRiSiDCDf5+FA4CAk2RSqvKLIL+Y=;
        b=bLLcu0gucPkATs15ruvCd0/NyLARg6Ya9NhoxB9ndeB2zEsBmF4I/Z71Zr0Qkez5Dx
         /UljPGkn2w+HzHpGw6+CI0urDLvOHa303R+mwV0ide/MLXzdU+v5FrLVKDRdzH7Axbw8
         I6IdIobd7+SVaShvhD3modH6VD04UbmZUlW4jdvHaNbSGppQP7Cjr2uU7+gm2JLoMRTR
         lxK/5q8Jd2YkzDo/R+19V6g3bZUmy6o1vy83JvxEI5boiMj/kFeN89XczuQWuK2u0zY6
         ImKwovSoSzFq0bw2oKNgLRgmwmfijemP11XmmiCm5p9hQzYkeiJDXck1lXkzlu87hCzX
         5nYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790757387; x=1791362187; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        b=fPP9lv96gucxheuD/UTtuwMLtRAubDXO6WGg74NbhRj4tuAn4KBKQ+RWXrNeSi8GPI
         mfCZqPOC4R3qYvxuSRl8a0qTaw6LpWt6Foq0S+81hAq5LsAf2W6PjsJZGfiSZl/4nSr9
         GcwVDBW3HAa3HSoKBFbNd1v2cC6sgXo97nXeWmbDHwq6zOpW+ywSnscCG8VNMh86gfuM
         q4QWhSJdmrkdfIww3F9Cgr9D/RneVfoD5dZNXEItcwosil4qsfSpZX8iUhKSQ1a2zgWF
         cQO+Z6UJeYPAZnfg2nJPSsMhJ93/Wlc/sNjA/7JKIJo3KiN512Ar3cU8zlXufdC0pW1e
         zlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790757387; x=1791362187;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZaIHzaOhcnhKP+I2Nw6s6CnueUSh0ItyVCxd7z2kOw=;
        b=yikAhAb7W7Yo0zolblCdnkiaX4NLR1jGUfn9HaYOVxil+I7WQ16rSfSj2/W1CZuv6h
         xrLa8ph90I8kJWy5xTRRF7K6pIdF9qn2Kx6pqhSMk8rNx3zlP3iMLRDlpPZN0M2Y+zfz
         PSh0QEWbTccN1B45PjLZd8DCLLHsaRiS9/maoTSKzeEkgYshIt74Yo6wm/qeJWIRRBOH
         gAkRELLPoILG0YZScZaXdus/lAH1EcLTxRx2e7uL67rTlBZsdfeiZGegiWmQqiQGgdNb
         oIXtVHG8m4cqhCahhrTKfND+nd3o2wXAM04LS9IoyV5JOfS7cNMtlM6bzDHYmj5dQnJT
         vGyg==
X-Forwarded-Encrypted: i=1; AKwUvBwZLCpdibPAjIPb77mVUKKcXV5QMKJRDjvYumrzif6MBDwIuFo4p0CuElc3hwxt/g2sCXjotoB1KJk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMkRm4DWTvz/Y7MKlOIY0UvAP07x73sROXNs7+A4xFqgcVXk3S
	uPuKOxD/WXUHd+rCDXUVOoVV2fJzeFPof2CkLHTNSkKxXlZFhBoUrudJ7vgp2A6XRAX78MSZhf6
	BNT1hkYWYbjLHao1N4D0qfv1trLtGdqg=
X-Gm-Gg: AYBFou34svqZc6IQgHPRKmp0GFe5B+ruScAsXTP8u+LqcJOkCu4m2VUgMDLX3dsA3j9
	++iwcHSBbTwMxBWDHERqkCWcYQQKyOzRw85THAYgS12LhoEIim0e6ZZLJjS690qymVjfP805bB9
	CRun4wBIZfMIhsv5jMg/DrYtOsN2/0PC/N6pGbL8YMjzbhAMeOSibYtI29uvJ6fbNs3xGtQBNSQ
	pd4nb3lXZ5hu1itS4OE4Jmctp0XB6pTJhq6fdux6aCGvKlq8NZ1YxDV9u8m30zQB7b3zj0wgSba
	X59tB6/sfHscKVWWxQ4BcWbXCc9vmmhl6oXp4aQIi6jp6OJnNprb1Ip7AJl/dKao5dDGpyV1/81
	gVbLncEqDg4TCjMfamQCTDHpVlw7ulk3i61cFFNc4jgbVfwp4aS4BfPn/45p25UDh1vB7uSQx1Q
	==
X-Received: by 2002:a5d:588c:0:b0:48a:f11e:6d5e with SMTP id
 ffacd0b85a97d-48b024a6d19mr1630952f8f.11.1790757387095; Wed, 30 Sep 2026
 01:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929105021.542730-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929110602.D533D1F000FF@smtp.kernel.org>
In-Reply-To: <20260929110602.D533D1F000FF@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Sep 2026 09:36:01 +0100
X-Gm-Features: AclHuK8CCNO96WytW0FDoK4wkycLlbK69yfsHonOrEjdyZiIwv_YOfKHdgyoR20
Message-ID: <CA+V-a8sNsgCP6icoYd8irORb9OGMAFG+RrgMOEtAiMoX9gFFdA@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] watchdog: rzv2h: Drop enabling clocks in the
 restart handler
To: sashiko-reviews@lists.linux.dev
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Tue, Sep 29, 2026 at 12:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] watchdog: unintended system reset during suspend due to permanen=
tly enabled clocks
> --
>
> commit 465743d35253a3a281f9ce8cea373ed0c3ae3e5a
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> watchdog: rzv2h: Drop enabling clocks in the restart handler
>
> The commit drops dynamic clock enable/disable operations from the watchdo=
g
> restart handler to avoid deadlocking on the clock framework's global
> enable_lock. Instead, it keeps the peripheral and oscillator clocks enabl=
ed
> for the lifetime of the device using devm_clk_get_enabled() and
> devm_clk_get_optional_enabled().
>
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index f247e42d54f54..55ac11fcfcabd 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
>
> [ ... ]
>
> > @@ -292,11 +279,11 @@ static int rzv2h_wdt_probe(struct platform_device=
 *pdev)
> >       if (IS_ERR(priv->base))
> >               return PTR_ERR(priv->base);
> >
> > -     priv->pclk =3D devm_clk_get_prepared(dev, "pclk");
> > +     priv->pclk =3D devm_clk_get_enabled(dev, "pclk");
> >       if (IS_ERR(priv->pclk))
> >               return dev_err_probe(dev, PTR_ERR(priv->pclk), "Failed to=
 get pclk\n");
> >
> > -     priv->oscclk =3D devm_clk_get_optional_prepared(dev, "oscclk");
> > +     priv->oscclk =3D devm_clk_get_optional_enabled(dev, "oscclk");
>
> [Severity: High]
> Does switching to devm_clk_get_enabled() and devm_clk_get_optional_enable=
d()
> prevent the PM framework from fully gating these clocks during suspend?
>
> By permanently incrementing the CCF enable_count by 1 here in probe, it a=
ppears
> that pm_clk_suspend() will only drop the count from 2 to 1 during system
> suspend, leaving the clocks physically enabled.
>
> If the clocks remain running while the system is suspended and the ping w=
orker
> is frozen, won't the hardware watchdog counter inevitably underflow and t=
rigger
> an unintended system reset?
>
The driver doesn't currently support dev pm ops so I can't test this
scenario. My current intention is to add syscon support so for now
I'll drop this patch and revisit it when adding pm ops.

Cheers,
Prabhakar
