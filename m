Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE18C7EE2F
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 19:19:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjCATTp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 14:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjCATTo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 14:19:44 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC7817CFC
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 11:19:42 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id v13so1423334ybu.0
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 11:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677698381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIVo0hDObYKHS2lBiY6rq4gYddvjZSEuHQth4mrGMJs=;
        b=ff99HF//1TLhMk2DSZVOJGZ/4i+X3V04Q7GbNaptF7odxp5W3FWVQxIUMwDeVqkxCw
         X6V/G8BL0SAy6k+nCunKp1nREOG4LuwmAWs+Kwd7EufojR7IfCAwQ8o61TG84Roo5S/C
         OVhXn7DbGazFSHdVjTqRprzwMouYBvJWoX/YEOsR9Ld6UXnZ5zMQzlgEdEIxZLnBwL4/
         MSb0Zt09t8LHNn26B9nC9j2TubBD+2SQn0V9l4fVsUZGTryMva7FCM3JjkbdY+Zdg2ws
         jfvsG7TuYvXX2rPQ7kglZsLdZpJm/Zj44eHD3iUdcHNralP0/ly9b+f/BEwc/qWG/+sf
         tF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677698381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIVo0hDObYKHS2lBiY6rq4gYddvjZSEuHQth4mrGMJs=;
        b=D1/znwdZ0X6lBeHIaGQMUhMiHZsQSQJ9nkCr4FVA0GpzgTljlZVlyGYEtkwogu6l4M
         1NNNc/l5XezhepXe1W1d5R6soyvJj/wl9Ze2GER8A6diezmYF+HUkOcT1Qpw27Bq7oBY
         P09sNFo1PI48TKEEvg/lhFp3D2g3srBLwgaD6ofFaVAHIlW4kHJrhLuRk6zJrYVbjlMe
         kBC72hhDQUMU9FKP4EXmT5EIZTzMFiQ/pDs299tNmPB6v0trt80znzNx2VEQlWZafiEw
         DZKZyaWUMq1S/AS9bsWYxsKOWv+dPIBnKtfREwvpp5JNr6ebOf+ijKjtONbHm11Abwmk
         kY5Q==
X-Gm-Message-State: AO0yUKXZH302I00SnQlAjGvIobzGTUdJU+RoNIcRWXheRspzhMtmYrd6
        r25zNk+ip54xy+VF34lDOwbXK3dCkAMz/b7hjGL1lw==
X-Google-Smtp-Source: AK7set/c+ED7Rsy5i4DQbDf3QRd4aGdnQ+nVsaNwMkWfz2fGDb5HnbL7NuBE4npCeLRgH7zPhsk+AbiDzK188yMp6lI=
X-Received: by 2002:a05:6902:343:b0:aa9:bd2e:3744 with SMTP id
 e3-20020a056902034300b00aa9bd2e3744mr3304488ybs.9.1677698381619; Wed, 01 Mar
 2023 11:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20230227183937.377612-1-ralph.siemsen@linaro.org>
 <20230227183937.377612-5-ralph.siemsen@linaro.org> <20230301135808.6fefe5b9@xps-13>
In-Reply-To: <20230301135808.6fefe5b9@xps-13>
From:   Ralph Siemsen <ralph.siemsen@linaro.org>
Date:   Wed, 1 Mar 2023 14:19:31 -0500
Message-ID: <CANp-EDb3XPEHya8igTh9fnyQW9yUs2MM6tCD9Pa3DCSwNZGvVg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a06g032: improve clock tables
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Miqu=C3=A8l,

On Wed, Mar 1, 2023 at 7:58=E2=80=AFAM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> > Introduce a "struct regbit" which still occupies only 16 bits, but
> > allows the register and bit values to be specified explicitly. Convert
> > all previous uses of u16 for reg/bit into "struct regbit".
>
> I was sure the structure would be bigger than 2B but yeah, gcc seems to
> keep it small. However if at some point we add another member, we
> might consider packing it.

If we should need to expand this, eg. to handle something more
complicated than a single-bit control, then I would probably want to
rename the structure as well.

> > The bulk of this patch converts the clock table to use struct regbit,
> > making use of the RB() helper macro. The conversion was automated by
> > script, and as a further verification, the compiled binary of the table
> > was compared before/after the change (with objdump -D).
>
> I will trust your tool on the conversion.

I'm going to check again using objdump, just to make sure nothing slips thr=
ough.

> > +#define RB(_reg, _bit) ((struct regbit) { \
> > +     .reg =3D (_reg) >> 2, \
>
> Here and below, I would really prefer a "* 4" and a "/ 4". IMHO
> shifts should stay reserved to bit operations. Here, what we want
> is to convert a 1-byte offset into a 4-byte offset, thus the operation
> is a multiplication.

Reasonable, I'll make the change.

> > +     u32 bit =3D rb.bit;
> > +     u32 __iomem *reg;
> > +     u32 val;
> >
> > -     val =3D (val & ~(1U << (one & 0x1f))) | ((!!on) << (one & 0x1f));
> > +     if (!offset && !bit)
>
> 'bit' being an offset, is it correct to refuse writing BIT(0) ?

This replaces the check that callers previously did on the combined u16 val=
ue:

        if (g->reset)
                 clk_rdesc_set(clocks, g->reset, 1);

As you can see, it used zero as a special value to indicate "no reset
bit". I just kept the same approach, but moved the test inside the
function, to streamline the callers.

Of course, this means we cannot control a BIT(0) at register offset=3D0.
This is okay on RZ/N1 since offset=3D0 is an unrelated USB mode
configuration register.

> > +     reg =3D clocks->reg + offset;
> > +     val =3D readl(reg);
>
> Could you unify the how reg is accessed here and below? I think I have
> a slight preference for:
>
> u32 __iomem *reg =3D clocks->reg + (rb.reg * 4);

Yes, I will unify both.

Ralph
