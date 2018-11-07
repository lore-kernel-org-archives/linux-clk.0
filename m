Return-Path: <SRS0=FPSA=NS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE0C0044C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 20:35:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 838C42086C
	for <linux-clk@archiver.kernel.org>; Wed,  7 Nov 2018 20:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="Yq4V51bA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 838C42086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbeKHGHW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Nov 2018 01:07:22 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41971 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbeKHGHV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Nov 2018 01:07:21 -0500
Received: by mail-lj1-f194.google.com with SMTP id z80-v6so15963641ljb.8
        for <linux-clk@vger.kernel.org>; Wed, 07 Nov 2018 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=f9k63G31/6joH9fmBOlrYi5nLWOfw2itPe2tz08+7yc=;
        b=Yq4V51bA1qv5ZMGJgpNcRAdekx8kfdzlkyvyZI0OpKAACotYw/oyOnkxf8yEFbz3pY
         taFChpw4UOb03Cy+gYefL/ZUTIOcWr5KYhRnCm80PCfr/pWvpTza8KMZAtOP7fuiHqMR
         vCxn2AoCbzWr1Jfjkc/xVy73YwPYagDM7r4s/Bz8Vs5yjljEYFU16x7mWePK6O35t8sA
         pQyMSUuvKg9neXQxKKehZwWVEyIH5xGIwAFa1QM1WcXx4wfFSDlR64o4X80wWy+xifZP
         +DqSln6BeVv/hz7P7zfd3iAB1demsJTuKkgAiMSoIIeAzb3425AaErr3m1AihjtWOWQK
         NpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=f9k63G31/6joH9fmBOlrYi5nLWOfw2itPe2tz08+7yc=;
        b=hbHAo/932Vpg7BzcUfZfxHpu1J8gwvrq6s9PdqsuAUSj6ArV6XVoq153MZLROiqsMG
         XfSLRBvuGgitaszfftsKKwvJDMLeGaPo6Fr54YxrjmyHOPSn8wz8A98SPejcwjWLi3YK
         qiC51ymQbNNUS2wGpo+OSx5UAzHvpXvD/j1fmiwxO7p3RMKB4CX1Sa8j3qYbBvg2Zc+c
         zaEOSKD4M3zgwnk//m0/vNKG4FXseqTPld7cjXabacpT8n9gsMBhGaJGC7JOrJBBx+e3
         rT7VaM5BPaQOM3EDzU+lc+GGkrCa/unE2esf5EBkg7uoE2LrW7wF9vM8O6Dtc5GogHNh
         SpHQ==
X-Gm-Message-State: AGRZ1gJnQJdIOYBXNznZVJAccR1ve/NxjxHpCh385XIAnsrNPIpYszFl
        EdvX8ereMQ2OljcURktvz2xS79KS+fvkLKCf5NE2k2k+TS8=
X-Google-Smtp-Source: AJdET5fbaGod6/puaG3t4AOklchVqQ7d9RBuc/vjBPFlGPGgzKWmqMAO/KuritPnuTm0EsPIOCoBK4fhMl5+JAd7NFo=
X-Received: by 2002:a2e:94ce:: with SMTP id r14-v6mr1111712ljh.34.1541622918700;
 Wed, 07 Nov 2018 12:35:18 -0800 (PST)
MIME-Version: 1.0
References: <CAOesGMgVPsK9YsV2nGoBptWwtHYv=3yMytLx2_tF_ujS5c5p3Q@mail.gmail.com>
 <20181107171723.GI9919@thunk.org> <CAOesGMheCcvDQCd+7fyh4yOk4BYDfm2QRqsdawqA_fg8s9YYEQ@mail.gmail.com>
 <CAOesGMg+jW7SN2+E_FYbwi8GdNhc8KrEsahB-Nn+AseO6kLGXA@mail.gmail.com> <20181107203245.GK9919@thunk.org>
In-Reply-To: <20181107203245.GK9919@thunk.org>
From:   Olof Johansson <olof@lixom.net>
Date:   Wed, 7 Nov 2018 12:35:06 -0800
Message-ID: <CAOesGMhf-RHtjZGZ9D9i=7=C08zmT9=eW5qnYTO6foB=cz06vA@mail.gmail.com>
Subject: Re: [TECH TOPIC] SoC maintainer group
To:     Theodore Tso <tytso@mit.edu>,
        ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Russell King <rmk@armlinux.org.uk>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kevin Hilman <khilman@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 7, 2018 at 12:33 PM Theodore Y. Ts'o <tytso@mit.edu> wrote:
>
> On Wed, Nov 07, 2018 at 10:47:24AM -0800, Olof Johansson wrote:
> >
> > Can we have 3pm-3:30pm on Thursday? It seems relatively low on
> > embedded-related conflicts and at 3  people would have time to migrate
> > from Daniel Vetter's gitlab talk if needed.
>
> I'd really like to keep the slots all 45 minutes, aligned with the LPC
> referreed paper track, since that's what most MC runners were also
> strongly encouraged to do.  (Although to be fair, it looks like most
> of the MC runners haven't really stuck with that.)
>
> The rooms are all fairly close to one another, and if you want to wait
> a few minutes pack up and move next door or across the hall, that's
> fine.  But it's going to be a lot simpler of we tell people that the
> official starting time is 2:45pm.

Thanks, we can definitely work with that and just start a few minutes
late if there's a lot of movement between the rooms.

(Previous email seems to have crossed in compose/flight, happy to move
to the other thread but it seems like we're maybe mostly done?)


-Olof
