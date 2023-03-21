Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D126C6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 10:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbjCUK6i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 06:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjCUK6g (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 06:58:36 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84CC42366E;
        Tue, 21 Mar 2023 03:58:33 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id o12so57942119edb.9;
        Tue, 21 Mar 2023 03:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679396312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xlekolJZJNpYqeRZP2jE+3o7E56WL7sl6ehOjJfpv8=;
        b=h6ShNJs3ppB1oKzTgjzc7MAp2E1KgvjVgCoQPdAJrMR1poEuCuPf+HWYJUsikwwQSz
         VpTZyJLNecrlMrnece1Pdy/yh61uw34J9QoTGgWppJFHaofTnD4780CMU4zB5mSy7mSs
         AlKD/xhvsBxxmWo9/dDnpUOz1Bm9qVcF9QJbK/Lap/rhM2wCSko9zc6uxWyW9JVAD7PG
         ApyU2Oede9idH1ghPuah3+TA1XuAJbO8/MsgawYGzqACX7BGeIARsosZQnJjITmPmA0S
         5D/lxO0QZzlVzJqZ2hwOU8xMcJ82Kr8s3weydfOcK75YcZ/kvYPF0osEILfAE3FCAKD9
         KdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679396312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xlekolJZJNpYqeRZP2jE+3o7E56WL7sl6ehOjJfpv8=;
        b=yE+Ek6nK3PUFRotQHjWuJXdFoOfpi9mH2e+vtjSqxP7DqJSIEu8HiCfzNOjpeEDlQ6
         OzTWduG4AcC0Y/WKCwjyaXATcfEtvxJ/WPNXxY4rTezZqBeYfNLOgCbi1tiW502eTkaS
         w8o4xJLJ09g0VBP4IICZYMPlqYKUBRLgGzh6aFypofcUD9tVnxZKs8V+6m7+7BuBQh3y
         fKUk9bqNjmev5NJFo1YoIrg3ZY8tqN7jRxmxJHs858j80lfVey+DE1Ofc7P0YVM9LMyl
         wEgUWhJ1hG5mNl7n79zeztF+3uI6PBhXQ0o+Jfr5YcqYfx59C2bzmvY8kdaebubvvlhN
         btmg==
X-Gm-Message-State: AO0yUKW92dIPFS+Uwk2Umdw6f0PfmKmeQia3fwrmnMbnMXv4M2nVcFUI
        5tCYECooMh4/+i9nAIajL8igyndyyjFfWWJbC/0=
X-Google-Smtp-Source: AK7set+6s92yKhF8P7ciNAdRReIw2l1D6bnTwlkstvWmOS0XOu11vT/w2cyLDcHtnC10WTyzOr7wfAE3UCqGjxZsCsM=
X-Received: by 2002:a50:bb2d:0:b0:501:d3a2:b4b3 with SMTP id
 y42-20020a50bb2d000000b00501d3a2b4b3mr1419083ede.0.1679396311722; Tue, 21 Mar
 2023 03:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230320104003.407844-1-keguang.zhang@gmail.com>
 <20230320104003.407844-4-keguang.zhang@gmail.com> <591123c5b80d12cf861cc5392688da41.sboyd@kernel.org>
In-Reply-To: <591123c5b80d12cf861cc5392688da41.sboyd@kernel.org>
From:   Keguang Zhang <keguang.zhang@gmail.com>
Date:   Tue, 21 Mar 2023 18:58:15 +0800
Message-ID: <CAJhJPsWhwSzCMMaox6VoKZL7NGretnrYb+YS8pvg9BH1hip8Yw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: loongson1: Re-implement the clock driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 21, 2023 at 4:07=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Keguang Zhang (2023-03-20 03:40:02)
> > Re-implement the clock driver for Loongson-1 to
> > add devicetree support and fit into the clock framework.
> >
> > Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> > ---
> > V3 -> V4: Fix the build error of missing linux/module.h
>
> Most of my review on v3 still applies. This needs a resend.

Will send v5 along with the modifications suggested on v3.
Thanks for your time!

--=20
Best regards,

Keguang Zhang
