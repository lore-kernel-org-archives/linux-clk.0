Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D781DC64EC4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 19:15:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbjCFTPz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 14:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjCFTPx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 14:15:53 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834E1584BE
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 11:15:52 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id fa28so6519462pfb.12
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 11:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678130152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQTq48A0smFTBxazgFuCYzX8nJPpycbZKgRdGuCgPA8=;
        b=jYVS7WZrTEKvz71FDfQ34JN0ST0P+aUzC6tPlzcFzudbb+ov3WGDfqOv+31rSlgsR2
         V/OfsNakI0g+/aQ4hlTVaK2qzmARANw1M2gFlwICtHZx7zeN5cCOCbfNSlXnUUj2rpc3
         rSxnrdvolExVaQFy0YGGccNEL1KjXPVxPtDgIVmS+UvDL1r+0ffSzWmCEW6yUjavNyc6
         lLD+G4dopSAb4weZRx/EV2zXBisSJC8+2J/LjBytpIq/3bvw7UiKi8a72txUnuCIIHtZ
         0NNT1MB51eRrQrNNIfdn8b67AdQdDFTjodmOKaXzDHv2CtKzKVTIuHWombydTrzgVvNn
         56qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678130152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQTq48A0smFTBxazgFuCYzX8nJPpycbZKgRdGuCgPA8=;
        b=ytYg76WuM5WiSqH+75uqHWJstd2+f3CJPxVXUa7XeNTvXE37ZZUpB7vYgEIzqS4GpY
         Gl9GggA3EYiMMP1Uvc3Ab9Fx+TQzHcQHSAkFmcbY5+9coVvH8cnMCLvvmCuG3Lwp4C9L
         BZ2bX2hdPMUbvsOVWkOOtv3cvLyDJCMt3CQ/ixfyc2W6Z7Tb6CCc4A3dCV8RDXk3Zfin
         yCd4tGJDl9lnYgeKyGf3I3xkKY8ZnC6ZC02tlw3hnDn3RTDacZ0QoPZjq25YOxN5e1rK
         i2Kq8PgC/RvK76lXsoOIr0OBPia3Vlg3tGJKQWhAKLMNnCkfEZ2xCguONFLvLcR2U9sA
         L3Sw==
X-Gm-Message-State: AO0yUKXy6nMSg8lweTMklgkb64dQvcjvIxEbnngYsDvVyvedR7oeWd9R
        3LMa+LniXDkqzH3TyP4z6b1oQ3y1hSDelGKqksx1OQ==
X-Google-Smtp-Source: AK7set/qzKMDJYNNU34MLpnTanQgazsxR+EckLlaFR3uWegeC67hAN8sXBPvTcYdiHXppJaEtJ5qU22Ly9i3zPKbNKM=
X-Received: by 2002:a65:66c5:0:b0:503:2617:4487 with SMTP id
 c5-20020a6566c5000000b0050326174487mr4132430pgw.7.1678130151669; Mon, 06 Mar
 2023 11:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20230302014639.297514-1-saravanak@google.com> <7e28fb6ea6c1f646b02cd166c9782539.sboyd@kernel.org>
In-Reply-To: <7e28fb6ea6c1f646b02cd166c9782539.sboyd@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 6 Mar 2023 11:15:15 -0800
Message-ID: <CAGETcx9e5vqZeEMy9Q2=pEdfRGLX14RyQQEn3_9CrHssQxJBgw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Mark a fwnode as initialized when using
 CLK_OF_DECLARE() macro
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        kernel-team@android.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Mar 6, 2023 at 11:14=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Saravana Kannan (2023-03-01 17:46:38)
> > We already mark fwnodes as initialized when they are registered as cloc=
k
> > providers. We do this so that fw_devlink can tell when a clock driver
> > doesn't use the driver core framework to probe/initialize its device.
> > This ensures fw_devlink doesn't block the consumers of such a clock
> > provider indefinitely.
> >
> > However, some users of CLK_OF_DECLARE() macros don't use the same node
> > that matches the macro as the node for the clock provider, but they
> > initialize the entire node. To cover these cases, also mark the nodes
> > that match the macros as initialized when the init callback function is
> > called.
> >
> > An example of this is "stericsson,u8500-clks" that's handled using
> > CLK_OF_DECLARE() and looks something like this:
> >
> > clocks {
> >         compatible =3D "stericsson,u8500-clks";
> >
> >         prcmu_clk: prcmu-clock {
> >                 #clock-cells =3D <1>;
> >         };
> >
> >         prcc_pclk: prcc-periph-clock {
> >                 #clock-cells =3D <2>;
> >         };
> >
> >         prcc_kclk: prcc-kernel-clock {
> >                 #clock-cells =3D <2>;
> >         };
> >
> >         prcc_reset: prcc-reset-controller {
> >                 #reset-cells =3D <2>;
> >         };
> >         ...
> >         ...
> > };
> >
> > This patch makes sure that "clocks" is marked as initialized so that
> > fw_devlink knows that all nodes under it have been initialized.
> >
> > If the driver creates struct devices for some of the subnodes,
> > fw_devlink is smart enough to know to wait for those devices to probe.
> > So, no special handling is required for those cases.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reported-by: Linus Walleij <linus.walleij@linaro.org>
> > Link: https://lore.kernel.org/lkml/CACRpkdamxDX6EBVjKX5=3DD3rkHp17f5pwG=
dBVhzFU90-0MHY6dQ@mail.gmail.com/
> > Fixes: 4a032827daa8 ("of: property: Simplify of_link_to_phandle()")
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > ---
>
> Applied to clk-fixes

Thanks!

-Saravana
