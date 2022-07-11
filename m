Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EEBC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 16:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGKQ2Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 12:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiGKQ2X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 12:28:23 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6537B34D
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 09:28:22 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id n7so5399539ioo.7
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 09:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4/tk/TUFQLGbAdc70/LIvZeDeOJPiToJkYt+rZXyPGA=;
        b=IeKhf7GuNYxyS7A5kM2JnoniDfNQzoVPthpIqtMv3+6U30NTpn6G07pu9vGhiao0Ku
         fHX6DxUhj/z6yZ8A4BTcS3XVPgK4E37NvLzwlIwit3s048xuQ0lEsx1D6G/cziobV95g
         kL+hNzr0FzjVGCF8iK/wrfStmG8e229zrMTTdG+5DFA5jqKM9SGRlTxepl9ymN99vdOK
         HbeIr/4224WR8ed88hoL62IwD6IbRuc0dDeyE2H2BJKdftrtu/F+Sf6YyIHKefGxkZcU
         o8PuiOoSFZz6F8Bhl3jEnt5VS7fDFdomJLpy8lEcWZvyh3ICImSa257DaJtZ73Y2xWkT
         QIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4/tk/TUFQLGbAdc70/LIvZeDeOJPiToJkYt+rZXyPGA=;
        b=QUne+Au7uK3lW2aaJec+1sgKidvVJYYld96HhJbHIFfqpHOFOGbS1f5JMdNrzrV0ax
         /FFVrsyXsIeTWhcPXMB78m+4ymGI7OtDXg1vg9y+uvoo+ELoYr0uwR8ZtDm6bdOr7BZ2
         n8Bo0V0u0GgycQ9gTAuPsCRZ+oJxG32K1bbZY0kqeyRSCTg7TchP34ZGz4R7a6KNsAki
         jf9WgY7n9uJNUeFq6E4ATM1SifvcVM7K7FfQGpS40KmbeLYm78aq0PtER1ZWgqKRzgqZ
         H4zA1Toil7F45eFeaVWF6tF730W/NpZLN/bei3f0BPPaIsBtYNwBRfn+t+KzKiV+SjZ/
         fKEw==
X-Gm-Message-State: AJIora8Srf7vEJFaM784L8FkxwQhpQ3yX7Q2Doq6yo0LLP4Btr4kOYmY
        rEpcZQbEOw0VW+syiYyrknVwbYpjsPdj+8zBpGQPUQ==
X-Google-Smtp-Source: AGRyM1tDNLf6Lfp+ypFfP4tVKghz09e9evCMz55QESThGK1cUTEIZHaOrDekXzJ95vPb9tlIuBBvhWZYko2arK0dFeQ=
X-Received: by 2002:a6b:3e83:0:b0:678:e63b:355d with SMTP id
 l125-20020a6b3e83000000b00678e63b355dmr9793523ioa.134.1657556901473; Mon, 11
 Jul 2022 09:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220708162711.1309633-1-dlatypov@google.com> <20220711144651.yekrivauz3phkuvm@houat>
 <CAGS_qxp=UAJ19zQOZKP8ywPiNAj4wT80ubH2YW060mmADoqBcw@mail.gmail.com> <20220711155005.lnebdh534ntmf4sv@houat>
In-Reply-To: <20220711155005.lnebdh534ntmf4sv@houat>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Mon, 11 Jul 2022 09:28:10 -0700
Message-ID: <CAGS_qxqFAdSCJBrmgY=FvwSjLrdMHqYW4gjh41VaYYh=1PybqQ@mail.gmail.com>
Subject: Re: [PATCH v3] kunit: tool: Enable virtio/PCI by default on UML
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     brendanhiggins@google.com, davidgow@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, skhan@linuxfoundation.org,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jul 11, 2022 at 8:50 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > A simple fix we could carry in the KUnit branch is this:
> >
> > diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
> > index cdbc7d7deba9..2fbeb71316f8 100644
> > --- a/drivers/clk/.kunitconfig
> > +++ b/drivers/clk/.kunitconfig
> > @@ -2,3 +2,4 @@ CONFIG_KUNIT=y
> >  CONFIG_COMMON_CLK=y
> >  CONFIG_CLK_KUNIT_TEST=y
> >  CONFIG_CLK_GATE_KUNIT_TEST=y
> > +CONFIG_UML_PCI_OVER_VIRTIO=n
>
> It works for me now thanks
>
> Feel free to add my Tested-by
>
> Maxime

Thanks, sending out
https://lore.kernel.org/linux-kselftest/20220711162713.2467476-1-dlatypov@google.com
