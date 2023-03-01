Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F3CC678D4
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 21:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjCAVZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Mar 2023 16:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjCAVZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Mar 2023 16:25:52 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38AA515D9
        for <linux-clk@vger.kernel.org>; Wed,  1 Mar 2023 13:25:50 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id a9so5316695plh.11
        for <linux-clk@vger.kernel.org>; Wed, 01 Mar 2023 13:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677705950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfDKxSNXUZkyr9HPYqhhs/0ANtQuBaTHkbXalVBy5zk=;
        b=UNGsJ3biOKSzh4RkNSFGw9vcwiKQpSji4f8sFivPMkcAccNzJr/fls/Y8X4hOX8Pce
         7S156qAgFm+qrhwcB8sKV5XDzlbkBGDYicDP+vAkdTcJP6cZCzeWrZmeLQjN47nc8y03
         gljP0LTitATXr04lm/ypv09bUdJIZQbfok13rUfQtvD7trvQ5iGqHns6Ja4HY5JePA0T
         R5FEsUB5sDbiG+m0gQtpP7Sc3tvqV+byjuHnx1PEQ+b2VJMm7qU1yLMNonjU6AmgjFuf
         Bmkb2i2wikqRjC8XXuQ8ieo2csFBsxqSnZ/CpRjFcXT7yekWjF1zmo+JW6Kne9GRhLLs
         s8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677705950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfDKxSNXUZkyr9HPYqhhs/0ANtQuBaTHkbXalVBy5zk=;
        b=pjnKNrh7fGLKWXmdioF++w+sg/+RLPHxm5M2d3PblJuaPt370UjSu+R8CHXib1c/8R
         xCZVaiQp2CB235/pVRbsrDDRaLG7ky5uwxQcqybgl/+Zh06xWgOLWwh9owKKJdnfWYMv
         yHUu7LHvWj3OhsT7yLgBg7LU1+L7WgwV7SoZaOSv1fhoPMFf+6+mywzFqWTRfWXDbZKi
         4KB66ZT94Q9IyGdmW5fANQ6wQE5o3y7qaqgiHLcJOLuBOgzwfRyzk/LFKGQXmUvxXPu6
         +Kv+hwIBOd13MJJiF5leJzh4W1JrkTGY6wpE9UexSBv+ctv1g/ziqWhtViC7mH0PR82O
         FADg==
X-Gm-Message-State: AO0yUKVOddKNZs4FZHB1NR+iFJvKphSOh2uPwtd/BlDhSyQyESAEtzYa
        hmcThk/3uwRkAk/eY3XKUbKjdroj6A+RlYlWrEhLvg==
X-Google-Smtp-Source: AK7set8JQ40suSmwkx15PVX6UZ1AsVJmYZ4GetG+ODueLpuC0f3mO9pZzDoFq5Kx5Y1JyJlY4nvKWZ0FKjAVzqseTgc=
X-Received: by 2002:a17:90a:39c8:b0:233:cc2c:7dae with SMTP id
 k8-20020a17090a39c800b00233cc2c7daemr3061292pjf.8.1677705950059; Wed, 01 Mar
 2023 13:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20230301012506.1401883-1-saravanak@google.com>
 <31ae9957edf319416d4551f14eba2071.sboyd@kernel.org> <7cca9a24b24d849565cd6a4f40ddbee9.sboyd@kernel.org>
In-Reply-To: <7cca9a24b24d849565cd6a4f40ddbee9.sboyd@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 1 Mar 2023 13:25:13 -0800
Message-ID: <CAGETcx82r-YC7cBUY5xa57FCEOUP_BeGNp2zURG=HUJkUMSVPA@mail.gmail.com>
Subject: Re: [PATCH v1] clk: Mark a fwnode as initialized when using
 CLK_OF_DECLARE* macros
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

On Wed, Mar 1, 2023 at 12:48=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Stephen Boyd (2023-03-01 12:40:03)
> > Quoting Saravana Kannan (2023-02-28 17:25:06)
> > > The CLK_OF_DECLARE macros sometimes prevent the creation of struct
> > > devices for the device node being handled. It does this by
> > > setting/clearing OF_POPULATED flag. This can block the probing of som=
e
> > > devices because fw_devlink will block the consumers of this node till=
 a
> > > struct device is created and probed.
> >
> > Why can't you use CLK_OF_DECLARE_DRIVER()?
>
> Ah I misunderstood. CLK_OF_DECLARE() _always_ prevents the creation of a
> struct device for the device node being handled. The 'sometimes' threw
> me off.

The "sometimes" is because dependending on the macro we go back and
clear the flag.

> >
> > >
> > > Set the appropriate fwnode flags when these device nodes are initiali=
zed
> > > by the clock framework and when OF_POPULATED flag is set/cleared. Thi=
s
> > > will allow fw_devlink to handle the dependencies correctly.
>
> How is this different from commit 3c9ea42802a1 ("clk: Mark fwnodes when
> their clock provider is added/removed")? Do you have some user of
> CLK_OF_DECLARE() that isn't registering an OF clk provider?

So it looks like drivers don't always register the same node used for
CLK_OF_DECLARE() as the clock provider. So, this is covering for the
case when that's not true.

-Saravana
