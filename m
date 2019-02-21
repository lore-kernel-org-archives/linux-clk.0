Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03ABC43381
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 12:37:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A22D32085A
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 12:37:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfBUMhA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 07:37:00 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:40701 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfBUMhA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Feb 2019 07:37:00 -0500
Received: by mail-ua1-f65.google.com with SMTP id c5so7654541uaq.7;
        Thu, 21 Feb 2019 04:36:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lh250ClGOklEUw2oJcXX6UQs+j9ucVz3tgP521RJxuk=;
        b=F980luFBmP/zf/HafbBP+dv1HpVM6168d8dh030pSErVMldLkRp6619UNkxBwiSJp/
         qCzXJdd4wXlHTJR04uluKhIEh/E+hKLJ3XMQe5xvnyj4qcL5I/QQUaF2vZ7ce6hSYG8J
         FG6lI5Wi0nc1dlO3lDerJzcMKWVIAcgCp8Rx69PK0U3mQD4PtjLS6jhBDmr3h2ZioBST
         ZANNqZqdwCpwZzFAMDvdUwX3SSa6AbTQKhm9ugMEGOEs0EODl1BP90M2NQmaPF+0ZGQE
         PBVsw93El86ekSGkfHq5K0XINzqnvNVqUVKr6uzQElDonLyK23RU5NRsj/+C6GuthaCJ
         kakQ==
X-Gm-Message-State: AHQUAuaMoz8DybQbsixRkS+XesHjRTYO1qaxJOxknYrjERJze9fkn03z
        JWWhZcY3+nBswwysggnpc4JwKv3qYaKFuiYOYEWI2A==
X-Google-Smtp-Source: AHgI3IZAOTsvYH2vWwhp+++ziaxq49J/aL3xQKZXWSLaggC2dc42saAUvWv/FM1WBYD6vRydBBYSXmuKioGC7HFtFhM=
X-Received: by 2002:a67:7dd1:: with SMTP id y200mr7087060vsc.96.1550752618962;
 Thu, 21 Feb 2019 04:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20190212102050.32229-1-geert+renesas@glider.be> <CAMuHMdUwNwVQ-4o8WKdH4pEUtk=Jmyq7gy7frXGW82rgu+afVA@mail.gmail.com>
In-Reply-To: <CAMuHMdUwNwVQ-4o8WKdH4pEUtk=Jmyq7gy7frXGW82rgu+afVA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Feb 2019 13:36:46 +0100
Message-ID: <CAMuHMdWy4MQ0FLU-8Yx1oc0Yj2iyn5mydrYwkAyVzn_4JxCpzA@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v5.1 (take two)
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

On Thu, Feb 21, 2019 at 10:18 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Tue, Feb 12, 2019 at 11:48 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > The following changes since commit d9286d9743b6e8cfbf1a13f8db84e9c65c0b09c7:
> >
> >   clk: renesas: r8a774c0: Correct parent clock of DU (2019-01-24 16:01:08 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.1-tag2
> >
> > for you to fetch changes up to d1de227de8145e661e940377e050286098197eeb:
> >
> >   clk: renesas: r8a774c0: Add TMU clock (2019-02-05 10:40:05 +0100)

> I was wondering if you've received my pull request?

Please ignore, I've just saw it appear in today's clk/clk-next.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
