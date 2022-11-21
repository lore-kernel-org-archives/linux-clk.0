Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094AEC4332F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 11:36:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiKULgp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 06:36:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbiKULgK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 06:36:10 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782BE20367
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 03:32:47 -0800 (PST)
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6185F3F328
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1669030365;
        bh=Wdu8vQakfdIXWZI6cloLPICZaVlSsHqCpUijZ/K0Ym4=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=BxYeTZYL9ML+KOFtlaVAMiIAOIuAvAzGfdfGzEsxa9CEpphRrjHqO3lUztvLf7sHV
         nV4R19atCRitUd+/jKad5aXIQkDDl2msndz+IlUesHqG+DMNTey0eclHfIWIZXwqd/
         t/lT4dODmcXn36Wj8TcVNpLDQ8IKnWvuYLul+fU9QV0MVsSzedeMrRkq1DCJcv+dhQ
         yReXdi+8Q1ctQFhTToJiRvWfxQ3lgiacksCYq2hnbAAHuU1U1djRoP9QLR4x8BYi+u
         rMymglwiZRsu2qbmy9JS/f92BMqrnfmmeDcfREEF23FSTgJmNVHxozbNDtUepgO2bj
         QPpG2Ug1yC5mQ==
Received: by mail-yb1-f198.google.com with SMTP id t5-20020a5b07c5000000b006dfa2102debso10728102ybq.4
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 03:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wdu8vQakfdIXWZI6cloLPICZaVlSsHqCpUijZ/K0Ym4=;
        b=WVkrEa2aKP01EHT4pj6qyePDhstvDuEKSxOE+NntgfqUAa1bhtc4BRshb5KoYd1dlO
         vD2VFRRGYS8CuD4dTBI2SKIWbNjW1BD/QP6b+1W7U7pRQNZRa0SqBL4L52Rjn6FN99YQ
         oajJtxb7gJJNsq1A6zXlZ9hnw0XviFgw/UnQ9816kZmoaSQV3tGfR+1SRQZXwlsUVYBw
         xnz7LUpR2bUCkXsGzFlbR76NRtOy4kBbI2KG4U+N/be6LuMb7gU4m0CUQecsV4MDHVpH
         /p6LZJ1rPQh0ZdMVV69/itMGJ4HdcIMRimr4BQ3n6Fgv662WNRpIW3FlcYu7k1/gmfIg
         A3LQ==
X-Gm-Message-State: ANoB5pk+6S27yKWBvPgAQxzvmFYGL8hahLVPx9OJZCEIe9qYNmNB75Wn
        d01Y1SglaLLVtKvdhVZSvVcoojyXCcIx4Syh9XkeaMtX3rk7AG8HXGtv2bMjkTyeEam1TqIzFwJ
        jItobFHNzl4Fcx76Xki8gP41G0/H+h3X3L8sXyrbc4LZoy2j5kdIwdA==
X-Received: by 2002:a05:690c:582:b0:391:fccf:db48 with SMTP id bo2-20020a05690c058200b00391fccfdb48mr16027169ywb.257.1669030360335;
        Mon, 21 Nov 2022 03:32:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7N94HxBZ+Phe4pBPmAyuYlGRxUDO4LFZpUy/j94PlMnqUevStF7XkySMLq/crkVuRUqW5EdlT7wLqM6xkcUyE=
X-Received: by 2002:a05:690c:582:b0:391:fccf:db48 with SMTP id
 bo2-20020a05690c058200b00391fccfdb48mr16027152ywb.257.1669030360150; Mon, 21
 Nov 2022 03:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-3-hal.feng@starfivetech.com> <CAJM55Z-Zftr29oGzeBFzOKuGixABSJEzPF-R2c0U9Pg5qDcRCQ@mail.gmail.com>
 <13578755-ab98-7567-258d-bc6c4164ee6c@starfivetech.com>
In-Reply-To: <13578755-ab98-7567-258d-bc6c4164ee6c@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 21 Nov 2022 12:32:24 +0100
Message-ID: <CAJM55Z-a1Pg2q7ZyvhwU2sp9YpsJZmE8y161UM-Ap7egCdgYVw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] clk: starfive: Rename "jh7100" to "jh71x0" for
 the common code
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 21 Nov 2022 at 08:16, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Sat, 19 Nov 2022 00:26:27 +0800, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> > >
> > > Rename "clk-starfive-jh7100.h" to "clk-starfive-jh71x0.h" and rename
> > > some variables from "jh7100" or "JH7100" to "jh71x0" or "JH71X0".
> > >
> > > Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> >
> > The patch is fine, but I'm a little unsure about this Co-developed-by.
> > This patch is taken directly from my jh7110 branch so does Hal sending
> > it count as co-developed-by?
>
> Your original patch merged patch 1 and patch 2. Suggested by Stephen, I
> split the patch into two patches, and I need to add a new commit. My
> previous thinking was that the Co-developed-by tag should not be added
> to the commit author, so I added it to you.

Even if you didn't just copy it[1] I still don't think splitting
patches counts as "developed by". You can set the author of new
commits or copy them from a previous commit with git commit -c.

[1]: https://github.com/esmil/linux/commit/df4bcbc307e97cb6a0e7b8ed5ecc66487395176d

> Best regards,
> Hal
>
> >
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>
