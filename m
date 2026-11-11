Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794436185;
	b=BGrNvzGZpeMlrf/z3akrxUcOvmGqIx+ZPIKTei0C8Ew/UUm3t+02qPYCrExMJfyY40K9
	 LWffFC8q2KwLjbeGq9+5Qxkj5ei4bpBEj5ZlAJbtwrgXGI56FKARNzpAzTEwpbBpOT6dE
	 8KSmh1VZi2Pt/7hifdpC6JmD+3/I9Nb9J0HbHw7Ti2ZFvtCOwzk5+uSolO4oTtAS4vRmA
	 3WrKr7rbxwWwdaN8i9INZBh9VVfldH6R8DcEuSf+LQtAzMEbvJyxab4bf18oe8YQJaaem
	 C34CGMzQ2xSV87PJ4ZydhRqkukwTK2r17HYjdDsIMg9+4ySe7idtXkS/U0OdFzLK7tA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
	b=cIoec/zF1veskasw/q1/ZOGej1VUKB54op13pTXSZTILZQRUdp2Id4kLzUlhu8j+f4Na
	 6z2CSUFrh3YqveeJrOtyLHw7ZXTJCVz845H2lrU+ph9o6L8eGa8a+LKdKCfV/I7OGz2bQ
	 89moE5GIkU6LloQ0fET1l1LOcVM5gwnMlNWg3Mzq3VAjoCG4z2sb5QVEnl3AVBrqbTdNZ
	 gzQbkAujUKK+v+2asOeG75rsCCCWlw+TTlL5rDBo2yG0nAZa5Uen1+dpl6L7ozn4w5zs1
	 4s2zvKWrRCBVGGLKcww6BlgoFt/xe0eTnMPh4lnA3oM78kLRh0yaIUBVEkfdVD+fCSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zh1V8q9k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED00606E20C
	for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 22:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED00606E20C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zh1V8q9k
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so4666312a12.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 14:29:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794436183; cv=none;
        d=google.com; s=arc-20260327;
        b=AHVZwgoJwZMjzySP01oJRUI4SuEea+S1BLwjBNtf5MnX+dWCrjgumQ4yYaD81EIPQ6
         DaLK9L9Kl/akyRxh6xoPCKF2/1bAJBgmogiYaXjJwKHOJNkEZ/VeVa++RMyBc7r982VP
         Y48C/R+b8E0uYQLs+dEmnaPrYOzPPfm/PpkaJXKw1yHokOXJQyaO2gZo5r6xoxLWYeo6
         r5mKHOOfHoFnv0CcPX72juSLaSYMekXaBOOy9VV6UXxqVuKszIQqIzAp5zaJ91UFcoSr
         VDOGUTawkAL0swnIfF3hpaMlzxgpQivKK9op74swjFj39u2b3Tgfgh8vAY2VMCNteMC4
         3y2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        fh=3vEt61QNJOheRnm9fd3Av6wBGJCAISb+cqsY1Q+5YgY=;
        b=qK7lFL6RS7DNIC4HT+/+Cc3XlcCDj+RsRkyLSpP9TZtBJushbZ7pb0CQ4lqoooYYvY
         htlOWXqrvv1AfccnQRGYGr/aWbf/Vi/Ik8w3r25b7KiqpqtK1HOpCaA6xQEU0rqw3mHO
         1e9tkq0SkPd7kB91SZ7d0AVPf/yuHtwokQxwmXoZAxwIvIz0QJdrvlviedGStjwFnuH0
         dWoSBtZhvcLxp+nm8qHYd1dmX0ndy95VX+F9wq0Qgk7rtmy7OxYvfErkpijDsKJUpAUM
         y4E9dc2AIN1EMkDguE4YgH3aSVjYHjn8X5AKjvInB0BO0wOGjQGsP+OCp5+FZEbMrWo8
         jR5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794436183; x=1795040983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        b=Zh1V8q9kqkpQMSlTai0vxhcwchFjHaXTHjbGVEyxL8NDHpebeRgslCUDB6EIEZb5Yj
         +5+lUMVMNOoknVJUxNdnoNExBYqpG9G4r2QyRNNBisDZ2ScD1oQnOgXodbJ4ZZtnO7U3
         bEUSrr7q6FwRSllf2g/eZMWAtUd3G6Q1OLiCkHfcjO9s6Mc45u/L+9RMTPynJuwxOr06
         VON8kAMmC7yHGn74m8ySlqoUJADqnPEXj+RFZiJprG2kj70C3hr332mI6XsDNDKCr7sk
         JepbhpqxjeAIQMqASoQBumn68OBEVKAOdwdKXoObid6rZScZvFgoDKc0BQuCTSJKar8D
         lMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436183; x=1795040983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l88aQEthU6YDCYl3Vpu0UwlZOCfC9J5sQ3/7Brd6dlY=;
        b=d11hR8cwqfoTLB4x6aVRYHoCEcOrMMotc9h+NzgvtG1xAgqCcE4CCMKg7ot0XRBfhK
         8V3/KQa0Rz4/cyzD+BtRGBpo4JLeqHWh4NyumNLyKJMlhC/2SldMqAIQuN8La3JEgYws
         jmhQL4/zh7nTRPEdZo45zgwdCB5zwreYDuDQJdVp/nCasvGE0UKL1u0bJcmnwE+Lj6dw
         jQdoBBRH4Ippvdxwyi17QBZy4yCxJnxAZPjdzNcSISyox1voydXe0t3rjMGHiNJ28REH
         aotSDcAAS6A7KVjSbGf52ZUxuufc90RYF+AX7LV90GMKTJPRanCit9J1yEY24rS4pmhB
         gUxQ==
X-Gm-Message-State: APuU4Z9kNWNrML8cH1hQiP+nlcQVIIDett925i3bnfyx+HhRNuZNe8nu
	OPXmdJm/vBBtl4vcop6AER32xvYJHQbvM13GiU5v/efHlyLGgiuO9aCx3p+Rtp3ZgwuuIYGXPBJ
	E/GNqObb41QcqnV+6zEClP8uQLHHhfsc=
X-Gm-Gg: AYBFou3reMPhK8Hk0tEZMWzPy1Eo8FI38FKjPdQyw/j5b32BNyJBCQbvM5GMWHceSUQ
	UozDYadbPbZWMEArs8K6oFUMh8+RwiGChd9ilmAwWR8QQF5A0mzT0D6GB7uj3Gzi+ObXqirpXgY
	dSvSlPKVcW0Y9jJNkysSDiGR++fTluS54iCR27y29FpOW4NSR7z+/kwRiMXuipt7b3rWz7tSPOQ
	on5Eac2ypkBku5T7jzuNy0UWyKcV8eUtYSWC4lYRtl82TYY6Es4ZvDA94+QH7JvLm6ipmSC/d5Q
	gw5lvw+eICUlfJdRt9zczw7LQz/pu+Df9AdurpauI0C4s5YO9CB3QPU9RDxPmOA8aU0vUsgbExX
	RbuMYOKi0Wlip0uKNfpGnyeujHxCWwbrzBQuGJhyEgRC6U8lPp2C6U7rKaYjVi1dlHHCorUChWX
	lDK+k48EDFqbwJu+OI0RN7igDw5S5GucBTi8o6ibQw8gLvEM4wFSW6jM0Pgc/PZ6pqFIb1dCtLE
	BSIUzj96v/4uMVxP9PCiRrjiGaaJcMbVnoxi9iVJnXPcqHSgA==
X-Received: by 2002:a05:6402:c6c1:10b0:6b5:962e:e00f with SMTP id
 4fb4d7f45d1cf-6b77780f404mr2255040a12.28.1794436182455; Wed, 11 Nov 2026
 14:29:42 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111215729.10683-1-rosenp@gmail.com> <20261111215729.10683-7-rosenp@gmail.com>
 <sashiko-outbox-209774@kernel.org>
In-Reply-To: <sashiko-outbox-209774@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Nov 2026 14:29:31 -0800
X-Gm-Features: AclHuK_NMj1qq8-W9ISvxeZgzbGMriIS_aT5l7uzjtRMavpKllDh5UrOmxBfjQA
Message-ID: <CAKxU2N-DMRg=Azrb1QRmLw4zBjij_fui9s8fubK_ystZAKfBfA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] clk: add a driver for the Atheros/Qualcomm ath79
 PLL controller
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] clk: ath79: zeroed hfrac shift in qca956x_pll_rate()
> --
>
> commit 423abf763de32c1b127032d8210181c833b02aa9
> Author: Rosen Penev <rosenp@gmail.com>
>
> clk: add a driver for the Atheros/Qualcomm ath79 PLL controller
>
> This commit adds a common clock driver for the Atheros/Qualcomm ath79 PLL
> controller to replace the arch/mips/ath79/clock.c setup code.
>
> > diff --git a/drivers/clk/clk-ath79.c b/drivers/clk/clk-ath79.c
> > new file mode 100644
> > index 0000000000000..6eab4cd1a91f7
> > --- /dev/null
> > +++ b/drivers/clk/clk-ath79.c
> > @@ -0,0 +1,782 @@
>
> [ ... ]
>
> > +#define QCA956X_PLL_CONFIG1_NFRAC_L                  GENMASK(4, 0)
> > +#define QCA956X_PLL_CONFIG1_NFRAC_H                  GENMASK(17, 5)
> > +#define QCA956X_PLL_CONFIG1_NINT                     GENMASK(26, 18)
>
> [ ... ]
>
> > +static unsigned long qca956x_pll_rate(unsigned long ref, u32 config,
> > +                                   u32 config1, u32 refdiv_mask,
> > +                                   u32 outdiv_mask)
> > +{
> > +     u32 ref_div, out_div, nint, hfrac, lfrac;
> > +     u64 rate;
> > +
> > +     ref_div =3D (config & refdiv_mask) >> __ffs(refdiv_mask);
> > +     out_div =3D (config & outdiv_mask) >> __ffs(outdiv_mask);
> > +     nint =3D FIELD_GET(QCA956X_PLL_CONFIG1_NINT, config1);
> > +     hfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_H, config1);
> > +     lfrac =3D FIELD_GET(QCA956X_PLL_CONFIG1_NFRAC_L, config1);
> > +
> > +     if (!ref_div)
> > +             return 0;
> > +
> > +     rate =3D div_u64((u64)ref * nint, ref_div);
> > +     rate +=3D div_u64((u64)ref * lfrac, (ref_div * 25) << 13);
> > +     rate +=3D div_u64((u64)ref * (hfrac >> 13), ref_div);
>
> [Severity: Medium]
> Does (hfrac >> 13) always evaluate to 0 here?  QCA956X_PLL_CONFIG1_NFRAC_=
H
> is a 13-bit mask (GENMASK(17, 5)), so hfrac is at most 0x1fff and shiftin=
g
> it right by 13 drops the upper fractional multiplier completely when
> computing the QCA956x CPU, DDR, and AHB clock rates.  Matching the lfrac
> term above, it looks like the divisor should be shifted instead:
> div_u64((u64)ref * hfrac, ref_div << 13).
This was present in the old code. Unfortunately, I don't have the
hardware to test this.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215729.10=
683-1-rosenp@gmail.com?part=3D6
