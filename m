Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5F2C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B8872075E
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjQcvGN3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfC1OGK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 10:06:10 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46899 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbfC1OGK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Mar 2019 10:06:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id q1so3488632pgv.13;
        Thu, 28 Mar 2019 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lLpkIFZ9nt37H0SAlPl+6P/8jD+VWoX/qtH+Ne4/Eh4=;
        b=CjQcvGN3o6J/1T2TdbsRR3DdPNBVNhbFBVqWjKnn++hs94fLqFSkGZLjMcjE2kysLH
         iBrqAEcfPngbgtLAV7tPDi+TaNm5RVWdSIq3MNrEntiUw4z6KbdD/GrpMfcGKXPpeVz+
         BNexw5TRLnPH7TahTR8Ukn0oryTKZaV4HegKOsnl/jEEsRJ21FNj75X/Ho4wU0eQWZYR
         Csam8dHkfWu1zc4hLsKq8/OGv918gyjtWsOye4Y/EYugqkZn40QAwSd8BaSGf8Qdk5eK
         OAp4N6ah3aXc2ny5BA7i06Ioj40IQ+W9Z03PUiEWlxTqAWtaCwQLE7rUFM9QeORRr/Hv
         VK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lLpkIFZ9nt37H0SAlPl+6P/8jD+VWoX/qtH+Ne4/Eh4=;
        b=FkV/HSeA4ntj/o/MthuEjpq7UyySAoG56Z/LOercilGEygV4POk3Kb8YbQ01C5ld61
         l0HyLXM7udeiqH0HeA5oJs0SDd0ybsA28FHCBYoCkhma7V7sYBWvRmMzHKQBljc3e2wo
         mqn2nJJDcZ9eDUGWGqd/PBr0Gb24wnlv4UHgAdRgN6J9Xu1jCKqJQ5pt4WbhzUX7jmwW
         lHpUS5rwz59mo8dV/lGW412Hth/AF5gFj6Tn5R0ZBbbB5uef2N/iCepIxbuQ9RDfYphl
         8cNhbXz6HkHj2wpkcaPzxL4dDaPsuutjyE3jH+E3KuAWcCoNs5HeS7VNqWF2Zbvw5knF
         ledw==
X-Gm-Message-State: APjAAAXtG2dBXPtIuUKJ5RoUN6rNtJN6nRj1WLV1YzsBU0szJWCLNSMO
        n1dr9/Xt9uleC3mxz+AI5TxWC7+JKSvdUkWniUJBBRIZloc=
X-Google-Smtp-Source: APXvYqxvwkBAD9vPCPLdFo0rcy5HS3bRNKd1+P5zPqlVCEUYlSbB263GRRV2ZLkEoSmNzufIe9+0dHTkLNeAhJ0TaDg=
X-Received: by 2002:a62:1d90:: with SMTP id d138mr6041567pfd.232.1553781969694;
 Thu, 28 Mar 2019 07:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
In-Reply-To: <20190328124939.23139-1-dave.mueller@gmx.ch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 28 Mar 2019 16:05:57 +0200
Message-ID: <CAHp75VdYKj+TkrciaTF2Puw_uyD-i3TwF35vKcuQAHh5VEMMiQ@mail.gmail.com>
Subject: Re: [PATCH] clk: x86: Add system specific quirk to mark clocks as critical
To:     =?UTF-8?Q?David_M=C3=BCller?= <dave.mueller@gmx.ch>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Mar 28, 2019 at 2:50 PM David M=C3=BCller <dave.mueller@gmx.ch> wro=
te:
>
> Since commit 648e921888ad ("clk: x86: Stop marking clocks as
> CLK_IS_CRITICAL"), the pmc_plt_clocks of the Bay Trail SoC are
> unconditionally gated off. Unfortunately this will break systems
> where these clocks are used for external purposes beyond the kernel's
> knowledge.
> Fix it by implementing a system specific quirk to mark the necessary
> pmc_plt_clks as critical.
>

I didn't see a reply to this:
https://marc.info/?l=3Dlinux-clk&m=3D155371441300575&w=3D2

I think we can avoid this hack to be returned back.

> Fixes: 648e921888ad ("clk: x86: Stop marking clocks as CLK_IS_CRITICAL")

--=20
With Best Regards,
Andy Shevchenko
