Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB762EB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jun 2023 09:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbjFSJG3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jun 2023 05:06:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjFSJG2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Jun 2023 05:06:28 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B16F0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:06:25 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-341d2018360so14192605ab.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687165585; x=1689757585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73UFP3t8bqb8g7lRxRg12r50WZsfcyr2bTaBvl7g6DI=;
        b=Mn+nKD/wyB3o0mN9yxlPrEFihNKnSHUo62EkRjzNmL3X4A8nrX3j8pirPx03mWoGVd
         U7Th91y2IRLJHrFAM5ocqsuO2zGew8ddd5M3x+bALzSdUju/RHJV406udcHlOSjZ5Mm+
         Jtxl2QSf+7v/OL28dfLjB5KCN/m3UtFelr9+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687165585; x=1689757585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73UFP3t8bqb8g7lRxRg12r50WZsfcyr2bTaBvl7g6DI=;
        b=BidPW0e1nUk6hCqTDorqNUwjP0x7y9a5j+V9BU4OBaz7hmX/s8jO4sDyvluseImVHr
         jnwND2HzUe8XoXjFE7X8L79UM1oObog0U1ODvSS5GoH7jS2ImenClY5W5Dq6iIC44Lnm
         EVk7pHgpP/rrefz/vMJ9NNw/ZfSPJKuoh+rvhARzRUyDKlnpRckFKMa2Pjt6dyqg9q6H
         k3dM+1aK5tr8hWyQYLHBhnYOOcV2wkco9pr5Rl3X86Hf/0Nv1G1OD5joySkxGrppDJAs
         TwfhqjE0XI81FWnJYWotZMxsa//wyeORad/WReE+q1lPhI0Yy2pu2JxFCYUF2zFtF8Ah
         BFvw==
X-Gm-Message-State: AC+VfDz4LaLXj3V5KlTSSUgEgWLnMgYWPju/l6u9TF0rS8vAMxGUZwIM
        ZA/A47CN64wFIAc1+W3RLi3y9BTlkkqBCsoxMwA1hQ==
X-Google-Smtp-Source: ACHHUZ4fUYysWeo3aAYS+XNDWJiTnZKYLv0B72parNHT/NnTmEK9oqBIST9G0SrqGV0Lkhcv83Sjnw==
X-Received: by 2002:a92:611:0:b0:343:13e1:68b0 with SMTP id x17-20020a920611000000b0034313e168b0mr336422ilg.25.1687165584973;
        Mon, 19 Jun 2023 02:06:24 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id x9-20020a92dc49000000b00342612c48f6sm892055ilq.53.2023.06.19.02.06.24
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:06:24 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-341d2018360so14192545ab.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Jun 2023 02:06:24 -0700 (PDT)
X-Received: by 2002:a05:6602:2013:b0:763:5f1b:2f6f with SMTP id
 y19-20020a056602201300b007635f1b2f6fmr7963281iod.7.1687165584097; Mon, 19 Jun
 2023 02:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230619112253.v2.1.I13f060c10549ef181603e921291bdea95f83033c@changeid>
 <35f6212e-69f8-432f-a5c8-99ed5c844f11@moroto.mountain>
In-Reply-To: <35f6212e-69f8-432f-a5c8-99ed5c844f11@moroto.mountain>
From:   Fei Shao <fshao@chromium.org>
Date:   Mon, 19 Jun 2023 17:05:47 +0800
X-Gmail-Original-Message-ID: <CAC=S1njwxLfw7LcnXkgY7pbiFaqvNQVyAzHVhK9+nYJC63d=Zw@mail.gmail.com>
Message-ID: <CAC=S1njwxLfw7LcnXkgY7pbiFaqvNQVyAzHVhK9+nYJC63d=Zw@mail.gmail.com>
Subject: Re: [PATCH v2] clk: Fix memory leak in devm_clk_notifier_register()
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jun 19, 2023 at 4:48=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Mon, Jun 19, 2023 at 11:22:53AM +0800, Fei Shao wrote:
> > devm_clk_notifier_register() allocates a devres resource for clk
> > notifier but didn't register that to the device, so the notifier didn't
> > get unregistered on device detach and the allocated resource was leaked=
.
> >
> > Fix the issue by registering the resource through devres_add().
> >
> > Fixes: 6d30d50d037d ("clk: add devm variant of clk_notifier_register")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> How did you find this bug?
>
> I can think of some ways to find this bug with static analysis.
>

It was actually detected by kmemleak on an unreleased Chromebook device.
I added the trace snippet in the message at first but removed that
before sending this. Maybe I shouldn't have.

I can resend a v3 to add that back if that's preferable. What do you think?

Regards,
Fei


> KTODO: static analysis:  look at unused parameters
>
> Both GCC and Clang have a warning for unused parameters.  I think the
> last time I looked at GCC it had a lot of false positives for functions
> which were called as pointers but hopefully that has been fixed now?
> Smatch does not have a check for this.  If someone were to write it,
> I would probably the check under the --pedantic flag so it would be
> turned off by default.
>
> regards,
> dan carpenter
>
