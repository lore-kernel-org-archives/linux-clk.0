Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACEBC282D7
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C10220844
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725898AbfBEJ2R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 04:28:17 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34874 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbfBEJ2Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 04:28:16 -0500
Received: by mail-ua1-f65.google.com with SMTP id d2so910642ual.2;
        Tue, 05 Feb 2019 01:28:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aiUy2lvm3ZZdyRIaC4fzRZY32YETyDy3zHJR0tV8LZM=;
        b=G7WCy+riLd4n8dF+7IXQwERLx9e3jRqAKA7yDyoJUD55Vo+p4ufdvOgc6PFktTyvLg
         kxtx5PC4jLs6B3edBgmxQqmbLCwg41SmTPDINROSYekwbDyhMN8Gb9TkDFnhtrRuxCtF
         /I0kPru4wEFCTM3U0tWmRa8IcISDCyO6BADiIRpR5Siksw+PVEeE9j3jTWT/cvlOfc1f
         FSvX6W0O3Uxmbu0UrSz3xHpbFIXwzKD/aMvJSDbZdpBzfrSlh+mKF+54NOzQKwnIRjvl
         6RfSjyeaT1r+0q/8Bd/drP6OLdPRUE9DBs7nU5lcW09iVZB2RqObqSumnhwc5zDafSOR
         rE+Q==
X-Gm-Message-State: AHQUAuYSOJdzQg+5bizQUDg5IgHLGMqnAUaBlVr942M6oo6Id44nLhVr
        gHW4UmjfDO8sHQk3Axr48cwShJ+1KlzwmH342bY=
X-Google-Smtp-Source: AHgI3IbpIOR2LGPJsbxsXsElGE4k+Tt6vVNBMJl0LfxH1XHybjMJut/v05c+PFP4y93cCyIimUsVxrtl++MYGXgLcng=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr1463843ual.20.1549358895795;
 Tue, 05 Feb 2019 01:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au> <20190131094021.3092-2-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-2-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 10:28:04 +0100
Message-ID: <CAMuHMdWdvEiv3GATiczGJaiUfiF4FHt0sTP1ZRdyPgnO4umrPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] clk: renesas: rcar-gen3: Parameterise Z and Z2
 clock fixed divisor
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Parameterise Z and Z2 clock fixed divisor to allow clocks with a fixed
> divisor other than 2, the value used by all such clocks supported to date.
>
> This is in preparation for supporting the Z2 clock on the R-Car E3
> (r8a77990) SoC which has a fixed divisor of 4.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [simon: squashed several patches; rewrote changelog; added r8a774a1 change]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
