Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDD6C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 01:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50FFA64E54
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 01:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbhBJBAM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 20:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234162AbhBJA6F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Feb 2021 19:58:05 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367CCC061756
        for <linux-clk@vger.kernel.org>; Tue,  9 Feb 2021 16:57:25 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id l8so306122ybe.12
        for <linux-clk@vger.kernel.org>; Tue, 09 Feb 2021 16:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rCCDjzP34Ivl3lsXM9x/SwTdAdkeCOcYrLzlWFPV+tM=;
        b=ex5ZWphpx1C8Ig4A82Vb5/qVMtJPVzW90lX+ay6ZhdHBl2wb+K4qpQ3MtpMqK130vn
         zt47/aS7FgI7S4x/0mPyiezsLnNR+PCEmPoeYHmR67tHKS12czECs4z5pS3IV7pv4TTb
         faVT5sVd1O5JvWkFjO15nZ+hB/RIldjZ3LhY/47D+/1rutICuNtmbCsF+/WYh15C7pcb
         McTsc7OVSREU3bsydDFPdoE/ZM75JKiAIWeANdH6bl95PQQ5GymWxyva7nzCug8e6EjU
         mZoAKG3BBOlRdUnm5p5675cMFoD5W0AoILySGAsRBZVFEtqv8hc3xTuGSikVvOkkfVgr
         eKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rCCDjzP34Ivl3lsXM9x/SwTdAdkeCOcYrLzlWFPV+tM=;
        b=LGsxJ8IanaF9c1jfiEaoMs4jvLHUdlOJ+AbKfa5au4KXoWOOYA9STrYRhNBOQXa+K2
         yncNOmlNqPst6WnwYaZhft9OFjVRcSun4lywqslyK2QZ9kog32CH61bjsAGw6k93GU6C
         vDbodjZuAZIZAVkUcwdH/7TGA4bOs3mOOGmYba/vxKVUyuRTD/l2YVMclvpfx8CY0m5C
         ge14OVDM7838m5xJMhv766xWtSNjRfjBqiblt/YwZu73Y2yGMBGC2WXqEt/On1xb+S8z
         CmwyB4c/xXKstNdPg5B3ucLcWN6119J+oMuKFdweYW3XVoVLtnoE71k0zW7gR1Rtt0di
         ZwKA==
X-Gm-Message-State: AOAM5323U9BvbhvSBnB4spskxhCg2plRsvJ09o10EIimdXDSx74lDShX
        ZBhK8a1kTyByGZBPJgVFAwfuqk/kOFOgd0AD3RB8wg==
X-Google-Smtp-Source: ABdhPJxehbw/5RJ+QRtKe+9zFRw3hl9x6b5uKwu1xvC+jjUVpzOAGXZopUVCCD0/vkx9XTYnqC+B2cLCn09LrqKdKmI=
X-Received: by 2002:a25:cc89:: with SMTP id l131mr759286ybf.346.1612918643917;
 Tue, 09 Feb 2021 16:57:23 -0800 (PST)
MIME-Version: 1.0
References: <20210203154332.470587-1-tudor.ambarus@microchip.com>
 <5bc4f5b7-5370-bdd5-143e-429c83447ce1@microchip.com> <161291845517.418021.17378265940034341908@swboyd.mtv.corp.google.com>
In-Reply-To: <161291845517.418021.17378265940034341908@swboyd.mtv.corp.google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 9 Feb 2021 16:56:47 -0800
Message-ID: <CAGETcx9fjRhNmEMF2QoerrzGctC6MMTy+_znVTgPEm1w-+ehqA@mail.gmail.com>
Subject: Re: [PATCH] clk: at91: Fix the declaration of the clocks
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Ludovic Desroches <Ludovic.Desroches@microchip.com>,
        Nicolas.Ferre@microchip.com,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        mirq-linux@rere.qmqm.pl,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>,
        a.fatoum@pengutronix.de, Krzysztof Kozlowski <krzk@kernel.org>,
        Codrin.Ciubotariu@microchip.com,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 9, 2021 at 4:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Tudor.Ambarus@microchip.com (2021-02-08 01:49:45)
> > Hi, Michael, Stephen,
> >
> > Do you plan to take this patch for v5.12?
> > If fw_devlink will remain set to ON for v5.12, some of our boards will
> > no longer boot without this patch.
>
> Is fw_devlink defaulted to on for v5.12?

Yes.

-Saravana
