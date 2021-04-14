Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B8BC433ED
	for <linux-clk@archiver.kernel.org>; Wed, 14 Apr 2021 14:13:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AB1061139
	for <linux-clk@archiver.kernel.org>; Wed, 14 Apr 2021 14:13:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhDNONe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Apr 2021 10:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhDNONd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Apr 2021 10:13:33 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96DAC061756
        for <linux-clk@vger.kernel.org>; Wed, 14 Apr 2021 07:13:12 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id c6-20020a4aacc60000b02901e6260b12e2so2134273oon.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Apr 2021 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sb+yeDNpNA+Bz8H8xtWBwZnjUmpmY3Grk6ocFL4I/TQ=;
        b=HVfk+QtkxRTNz90nOoRDFi1g41C5yA5NI/ndLkdC2nUXutLyI0cslXbLRurCPBCNIp
         6P1nWTfHukY5aUH9ge6nL0/7tuPhJiOVRjTGSjn01VihAi5+D9DqH0yVSNTAZzge9FH0
         eClYBXJwNw+fiSRccdpqbtOX1sih8b1fMI5CB2q6pQKwN24LAPV9nVRBsOQ4R+UlJrvp
         ZS66rwnXzQ1n/r0TGT0Ltnclq3Z2dhqbmDZENQxVBOvkM/ci8U2MrwgiW7KW/QCTkwWr
         7MXKkeQIgRWHYn7Q7jju7/9tGgU2tl3UfYj02SBFrgOe/h1hZohzbpzID2cSeV14xDom
         LtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sb+yeDNpNA+Bz8H8xtWBwZnjUmpmY3Grk6ocFL4I/TQ=;
        b=nqyfMCWDI0q8721t0QHtnVi+0wDB1XYs/qbt0Em+jCZna1eAacMDaDa/kY6vs5a4oR
         rGCHqYoDHOD7Lk9HSjFwXBF1xBtDDJNGgMwE1Wy84yMfKh6l3BbdG0z1rQWuiwi920s2
         a4xNMjLreL3zNAwvDSbNEGHEWwa+2zWOO09YfvNjwuT+gawfuCGDnfWsQcgWtL3JCKrN
         zv5yEfU5ooh95iNcTT5usn0uslvl5QG0n3g5yGl6fbuI0gnnGSWkIWAt8TVujJ6g/u+r
         n4yAVrI/N62YCsIijzHHd99cpG7P2eF/bH4w0DWsy6b42LeZ/UfJlwD3nA+7KiNkm3/8
         qMeg==
X-Gm-Message-State: AOAM531iWqQcU5rInFaxmomASekDkGgE2smK/wnHrENSydkoMWcNCmDJ
        RKZ0v75YVv/C8sZErlQY5G0Kkshc9NrjvD/pGeWQ1w==
X-Google-Smtp-Source: ABdhPJzVqDgUTs0CSOHiGCtXMVUP29nRAd/nar8/zWXZGwSyMpmH6yKoTRiRNGStUZoW4T97KmUZzdsisS7I7MQE5SE=
X-Received: by 2002:a4a:925a:: with SMTP id g26mr18617165ooh.29.1618409592066;
 Wed, 14 Apr 2021 07:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com> <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home> <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home> <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home> <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home> <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
 <87tuob7n8g.fsf@igel.home>
In-Reply-To: <87tuob7n8g.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 14 Apr 2021 22:13:00 +0800
Message-ID: <CANXhq0rTC8grpRe_Q0vG6_52b-41OuN4vHum8RvouMbE6xiXpQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 12, 2021 at 7:31 PM Andreas Schwab <schwab@linux-m68k.org> wrot=
e:
>
> On M=C3=A4r 31 2021, Zong Li wrote:
>
> > I found that the gemgxlpll was disabled immediately by power
> > management after macb driver install. The mainline's defconfig doesn't
> > enable CONFIG_PM, so the network is fine on it. The opensuse defconfig
> > enables CONFIG_PM, and the patch
> > 732374a0b440d9a79c8412f318a25cd37ba6f4e2 added the enable/disable
> > callback functions, so the gemgxlpll PLL, I have no idea why power
> > management disable it, I would keep trace it.
>
> Does that mean that CONFIG_PM also affects the FU740?
>

Yes, we got the same problem on the FU740. We are checking the issue.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
