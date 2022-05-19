Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 610DDC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 13:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238462AbiESNIO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 09:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbiESNIM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 09:08:12 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D01B82EE
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 06:08:11 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-2fed823dd32so55676047b3.12
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 06:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=La/7OOALhauUEG5Ji2oO8YvO8VOzXhhzoK6CQFuGens=;
        b=Mc01J4Jmev0FOw6h6XJqZkIQNwLAXIZdmviiHFc4dS0SXngMNt4uVOaGj3sQE+/AjG
         iHVJtLxz0SRFtzC6KZYGso767mBxZ0YMoWEKrI7sHpnTFU1GKZB5x4FT+6l2iD4pSFEU
         TK/IfXww27HTOb/Kd3t2LMc2606sodqY9RPc2jYCO39lTbk2OoWLDBBks1MollfDd9JR
         6CDvrRNyslLM/+JKHLfknToZJXU87WXzxjUn8DFRZxC2orM1AQSKre+uvW2SO+Y/mspm
         Q7lV5BmKPsaiawxHFXDNhHZiDGHjki0iHzM1FgKHhRjoSO660JbHtVqDs/JDdIbLySAR
         Ho0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=La/7OOALhauUEG5Ji2oO8YvO8VOzXhhzoK6CQFuGens=;
        b=ij/6u8JAi/aCBPsBUv+tLruuSp4OhhGLQ3c6aa3kSDkpyPVQT1tAGvTv0UbXACIZFp
         F0zBhfpSa6yfgnHwDkTzeaLfywIwXXJRJNzGjsS1KnzH5ev0Lubysg8Dw+ekmu1hFXdD
         hSBBc8xAVZobUjWCgxNbmDGuZP20jdb8zqOyiFY4QfTpI1uFaRgM/a6CPZvoSfATE5mU
         3G4f3CvShYc94IjSvw+vnx877xPlZd+0lprf39iPn8zDZx+s2IggdAaYzS/iQb9/5+dh
         MwZ1taETLGnxBnvnwTCWAMZUNnncJCAs0GCAtwD16zo+OlymDim3HE3XvAd1195sT+RI
         nutw==
X-Gm-Message-State: AOAM531cbCpDXQwOBJXr/iWvGf9iZAtDlk/23fP6Rw6PYUUE1Q5QRENx
        FUXmE3sgeCYUaIOgqMOj/ZxuB3TxF79CHwMhCSkW8w==
X-Google-Smtp-Source: ABdhPJzjXaM6yDiZGQ6JFS2PFd8kAqU9kyb5veZ5kmD7lX3tGNCp8MwcAxKVbfGmkiMRw+pGuRJzDHAhcSYdhHAWbZg=
X-Received: by 2002:a0d:f0c3:0:b0:2f4:d291:9dde with SMTP id
 z186-20020a0df0c3000000b002f4d2919ddemr4419526ywe.437.1652965691192; Thu, 19
 May 2022 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220517032802.451743-1-Mr.Bossman075@gmail.com> <20220517032802.451743-11-Mr.Bossman075@gmail.com>
In-Reply-To: <20220517032802.451743-11-Mr.Bossman075@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:08:00 +0200
Message-ID: <CACRpkdbjLiF=ZU1tjPQ+=eKd24aEOi+tZ4wZYamuKyC0B=DisA@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: freescale: Add i.MXRT1170 pinctrl
 driver support
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
        marcel.ziswiler@toradex.com, tharvey@gateworks.com,
        leoyang.li@nxp.com, sebastian.reichel@collabora.com,
        cniedermaier@dh-electronics.com, clin@suse.com,
        giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 17, 2022 at 5:28 AM Jesse Taube <mr.bossman075@gmail.com> wrote:

> Add the pinctrl driver support for i.MXRT1170.
>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> V1 -> V2:
>  - Nothing done
> V2 -> V3:
>  - Nothing done

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
