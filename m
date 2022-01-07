Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF28C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jan 2022 09:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236770AbiAGJF5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jan 2022 04:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236757AbiAGJF5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jan 2022 04:05:57 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76783C061245
        for <linux-clk@vger.kernel.org>; Fri,  7 Jan 2022 01:05:56 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id h7so13280201lfu.4
        for <linux-clk@vger.kernel.org>; Fri, 07 Jan 2022 01:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rWfVPaOXlttmkAnqDO5xiEwBAZSXcfEI3Fk7/LgIeBQ=;
        b=WMEWvvB+eu+TpWmqZ+1LqwtcFqJJfkG/f5KGdFktartz+GRVCazHr3UukUAzIcHQx5
         Cvl1xx8J8ItemuiGgLFYHkg4k2OE17xymjvHtZJbs+XdWHr4MCXFPqpLxkQOHW2noaOM
         AlABV72ht3q+LI4bw+mMuZyCrjToCaOF5Tbb+19L9Or93k/XDXh8g9qjkEChkO6SM8Qb
         qd3TZBGMM7givZYc11g2qf08PDt+YcKvGZWdTRayttyCXJsiMBlelRfOs5UY2HHUTAaT
         WdxN6L+mIgRXzN1gUx//M0LrEm4yMXaAj6SEKGNlzu8+QR6QOzp/nzE26bcVZMkv5mzJ
         Tzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rWfVPaOXlttmkAnqDO5xiEwBAZSXcfEI3Fk7/LgIeBQ=;
        b=BRpRIgY+pvKsEtTxQ3HmwB3GsOQPGZdqdbOlYT/5+87LCkM4uzVvEPSkb6Mc89+j62
         CWvMFrP/wzG3xDXS3fy9qBNfRUdA6nI/MAP96JnXtBHCWFmHRqbgPfKXa7XxH8Y5LSXA
         IbJv0Dkq3Ax7CKiwgWGxBefqW/y6hjPeGylS6UlcQvTibELlhFZmM8UVMxrCC0ev0cn9
         4/g+ws3h5WJH7199AD746e/ZT9J556X212uQpHMeuWzTcepDjX7LsaRtleTHpmHpItMt
         9F8g2qy/TsobWBDzg2gsUYj4RD+dqg6IymigRDG758H9R154RqH9MDj3uksb7ecUVopD
         ix9w==
X-Gm-Message-State: AOAM530n4exEkBy8zmplnU8joBxC+Zw25iZLvfm1jmOBKsz/7kiV9hb3
        +5akQT9zE3gGD9uZ+PQodB6/K7oAVDIFcgpod/u49Q==
X-Google-Smtp-Source: ABdhPJx+zCx8fuW1g/G9qrXfZqnFLDa/z/ojGkcpJJwtkBwqV1hzJYS0oOObDvwb22hWaTUa6BiBQct3lat5XiekI0Y=
X-Received: by 2002:a2e:5756:: with SMTP id r22mr50324919ljd.71.1641546353703;
 Fri, 07 Jan 2022 01:05:53 -0800 (PST)
MIME-Version: 1.0
References: <a298286a42461e07c92e282224f469d84344feac.1641434305.git.zong.li@sifive.com>
 <20220107002135.B6397C36AE0@smtp.kernel.org>
In-Reply-To: <20220107002135.B6397C36AE0@smtp.kernel.org>
From:   Zong Li <zong.li@sifive.com>
Date:   Fri, 7 Jan 2022 17:05:43 +0800
Message-ID: <CANXhq0rNDZ2b70mRtZ83STkYpzfBaErxzvUPkCVd_ZWEU5NvMw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: sifive: Fix W=1 kernel build warning
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     lee.jones@linaro.org, linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 7, 2022 at 8:21 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2022-01-05 21:58:28)
> > This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> > Declare static const variable 'prci_clk_fu540' where it's used").
> > For fixing W=3D1 kernel build warning(s) about =E2=80=98prci_clk_fu540=
=E2=80=99 defined
> > but not used [-Wunused-const-variable=3D], the problem is that the C fi=
le
> > of fu540 and fu740 doesn't use these variables, but they includes the
> > header files. We could refine the code by moving the definition of thes=
e
> > variables into fu540 and fu740 implementation respectively instead of
> > common core code, then we could still separate the SoCs-dependent data
> > in their own implementation.
> >
> > Changed in v3:
> >  - Rebase on v5.16-rc8
> >  - Add fixes tag
>
> Where?
>

Oops, I messed up on my local end. Please allow me to resend the v3 again.

> >
> > Changed in v2:
> >  - Move definition of variable to C file from header
>
> Please remove the changelog by putting it below the triple dash.
>

Thanks for your tips.

> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/clk/sifive/fu540-prci.c  |  6 +++++-
> >  drivers/clk/sifive/fu540-prci.h  |  6 +-----
