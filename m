Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF38C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E37F20844
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:28:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbfBEJ2W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 04:28:22 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:38550 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbfBEJ2W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 04:28:22 -0500
Received: by mail-vs1-f65.google.com with SMTP id x64so1728333vsa.5;
        Tue, 05 Feb 2019 01:28:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+hPhrRULY9cVwEU2YskynSJDfPtnjZLNaGAMVr6/o34=;
        b=Ygq42YTakFfZ+f8ICXul1nN2SraOFsDMZDstodKYpHhPfY5G9jsFUcx/Yvv5Fp1h9C
         9djzTDvA26V1JWFFbQfhReQYKlFC9HNhHgPDVXLHm4/ULZNiuJQOZBfNk0Q9NDkiTPJC
         yrdRcJdFGgcwNYSUDIFw7Z6Mnu9NfB6nTwpFyeyUy1YoWQBFzuxWN/BLfzw+zg+icBEb
         MfkPRPxyRhZtWazpvsoix52HBYSDwt0G4Pyza1H7Ms8DU7USFC3PinNjH6Rpn3qnlhKc
         e0vbnPNmAP6VC3iq4GFOjzXVlJPm4zAp6CJQL7nq99AcoPJq0hfgkMbN3HPGyoq6+RNN
         Wgzw==
X-Gm-Message-State: AHQUAuatyoLUixsfjT2Dh20clZ1siU3wT3HA6ITLhczrfajf7isqu5ig
        LEYH40KCwWeKNioHn6E8HXYo2IT2mqtko73VPj0=
X-Google-Smtp-Source: AHgI3IZgOUutHj+w0VdjgvVZE3YaqD+qpKdnyeQItNyOPo1ZfsqqAP7IAy3U9kMfSJSgnviM1eip4lCLuKiuyRk5arQ=
X-Received: by 2002:a67:b60d:: with SMTP id d13mr1646233vsm.152.1549358900995;
 Tue, 05 Feb 2019 01:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au> <20190131094021.3092-3-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-3-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 10:28:09 +0100
Message-ID: <CAMuHMdWpcQ=s12R9MRV3TzvmOXz4D6UOvF_KX_b1TF6UM+Kbjw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] clk: renesas: rcar-gen3: Parameterise Z and Z2
 clock offset
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Parameterise the offset of control bits within the FRQCRC register
> for Z and Z2 clocks.
>
> This is in preparation for supporting the Z2 clock on the R-Car E3
> (r8a77990) SoC which uses a different offset for control bits to
> other, already, supported SoCs.
>
> This mechanism should be extendable to other clocks, such as ZG,
> f.e. by adding the number of control bits as a parameter to
> cpg_z_clk_register().
>
> As suggested by Geert Uytterhoeven.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
