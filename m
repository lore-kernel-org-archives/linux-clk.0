Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA07C25B67
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 02:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbjJXC7U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Oct 2023 22:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjJXC7T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Oct 2023 22:59:19 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56761120
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 19:59:13 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507b96095abso5965612e87.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Oct 2023 19:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698116351; x=1698721151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvrqgGSngoJnXhESnfS3t+NdB91nFoYVT3tITLPVU4M=;
        b=i6dAKWjzP8barq/3IpEpyqf9ssxXqAGHROwrf3JijTpIXBWtc5gt9BV3bE0noUFbV0
         keTtas6Lc4R2EBM/qvtpjuYRgoPnu5VVFPPvK8ySztD/YRpPSnQTFf5xQ+lt1nImXw/j
         6Lk014crdk1PDc5+S2x9v4grmtE6io0haf4y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698116351; x=1698721151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvrqgGSngoJnXhESnfS3t+NdB91nFoYVT3tITLPVU4M=;
        b=mScM/uQmWSYephd30sVkf3xgp69RQONat9usfLbiEORKoNGsOuDf9Q72SJT/z/rx9q
         LSu7RS/D0kJATfldK3jfCcQ0IV+BSMf41M71slkzi0fjS8RJQc1WyADUYHLYP8zeHkO9
         loDKrYYmXAtwst8DdybPH1XVpjhIp7vzdryK5R9x8XmdjUp6up3BDtEZY0AxGthcAQ1S
         81TTbxVyg2d03/eo9fk6glQd8+KvZaURdA78X69gofnA7H0b1bT7zujLwjVJ74gDmYj0
         3uEpU4+sPs/17f48AslAy2F1/yZYjb7jo7ruZxeLHxTUQQVIZsNuwTAPvwyZxhxv3oxF
         xLdg==
X-Gm-Message-State: AOJu0YzYRYuICpAnRaWaZOWWH68sp9w26wC2+NvwOGpoFcmAKYUPX7pU
        gf41IryiD5ykL/n3MCNWMOrd89X3eTB0bh9dUJcvMA==
X-Google-Smtp-Source: AGHT+IGBrjxdShgGwLm/nKBlp6mMXyHZKc8GJR6Sa8BG8WPw9au3jcqx4fC7Aiq/VT+UoJbUAgQ50zuQjPdOXvQt81c=
X-Received: by 2002:ac2:562a:0:b0:500:94c3:8e3b with SMTP id
 b10-20020ac2562a000000b0050094c38e3bmr7076723lff.57.1698116350988; Mon, 23
 Oct 2023 19:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com> <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org>
In-Reply-To: <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 24 Oct 2023 10:58:59 +0800
Message-ID: <CAGXv+5EpBLnXVdxnk9wBZi5F7U5wdJRfYH7fgg4Lkr1HJXm+WA@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent
 to infra
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com,
        matthias.bgg@gmail.com, u.kleine-koenig@pengutronix.de,
        chun-jie.chen@mediatek.com, miles.chen@mediatek.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 24, 2023 at 10:52=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Quoting Chen-Yu Tsai (2023-10-19 22:06:35)
> > On Thu, Oct 19, 2023 at 8:49=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > >
> > > Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6}, as those
> > > are effectively parented to infra_ao_i2c{4-6} and not to the I2C_AP.
> > > This permits the correct (and full) enablement and disablement of the
> > > I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock tree of
> > > those.
> > >
> > > As an example, when requesting to enable imp_iic_wrap_ap_clock_i2c4:
> > >
> > > Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
> > > After:  infra_ao_i2c_ap -> infra_ao_i2c4 -> imp_iic_wrap_ap_clock_i2c=
4
> > >
> > > Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c wrapper clock=
 support")
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> >
> > I'm curious about what led to discovering this error?
> >
>
> Is that an acked-by?

MediaTek engineers are saying the original code already matches the
documentation provided by their hardware engineers. I'm trying to get
them to respond on the mailing list.

ChenYu
