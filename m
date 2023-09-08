Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA7FEE57E0
	for <linux-clk@archiver.kernel.org>; Fri,  8 Sep 2023 08:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238973AbjIHIKz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Sep 2023 04:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbjIHIKy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Sep 2023 04:10:54 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 936D61BD8
        for <linux-clk@vger.kernel.org>; Fri,  8 Sep 2023 01:10:50 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-d7e904674aeso1628462276.3
        for <linux-clk@vger.kernel.org>; Fri, 08 Sep 2023 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694160650; x=1694765450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LX8a9RtwGTkNLy+xzOfITbjsoPIkf7czyOLexbXeC30=;
        b=Ta0p6zxQby92DMNhDSTt1AvTBovOoRn8asPZr1gk8V+gWfRAw2lZ8kV6N2h5VheLA9
         JTwBoy+SlBso8p8yiQeZw9m8VIslhXrjcvZ5E2UZym2iFFPZRUZ19C2h6TFQcteH11vf
         tCWseemtS2uDnmZUvC5Xigx02zT3ivXvtqF0lUjngafAifpN9hdj6jNDqYqLTE2gaMBu
         iytiWf5lqdP3in57u48TCk3CgK/d/Em9rG3zXv15NAbtJ7j+4oUTFyWueOaeLjTW0u68
         rBdsg0qwP0Cvh4Mrxlp0yxGPAiscP+VSfYH4+kJmZCpGHS0cI2peLG93YXdqz4+8AHmr
         5rqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694160650; x=1694765450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LX8a9RtwGTkNLy+xzOfITbjsoPIkf7czyOLexbXeC30=;
        b=f/IRDl6Nn74z3m56elUAHhKTJPlTtDxaOcuG6iMcPxsXnyPwXWI0FcToP1XQfq9JpC
         HDHdGBfUQ9rR+/HXdUyCIjkVgOu2X4fTa/uP+GovorgK9JNYuz1aDChUgbV5TnfMtIqn
         ulKZLRMiBdEnDmVpzCQg9nmTGdRFAffXia/utrZJB2eH0F46lkv45cyHIE/KxruNzaY3
         Hzk6lgErJphMTp5lHyajlA16+lZdOeU5vpdRhxiE6rJpfH4f4C8PZ82QP7ygvbP8uPp2
         pSKrDJSdpDyNGGtJt7Rris/V1bZCf1pXruSWBmadnwkLwVAe1BZ5frfhDQs4T4zmxmAh
         tmFQ==
X-Gm-Message-State: AOJu0YzmO2OmCl82JsZNOSuKQGJ9Agn0Aekr6i3dC/Fwi9kYgdMQQy9x
        36/66NAUYlG2s9j3wlOQG8all088Ji9ycNlLcso6sg==
X-Google-Smtp-Source: AGHT+IEIhWm+dbLokHs4WzlKU9nNAycGL1sYfhy4ej/rUnehmE6v6eMqoNyWh18rq8tDXFFLvVdbX78B2EnbokZq5wM=
X-Received: by 2002:a5b:c4d:0:b0:d80:14ed:d294 with SMTP id
 d13-20020a5b0c4d000000b00d8014edd294mr1579706ybr.36.1694160649746; Fri, 08
 Sep 2023 01:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <a03a6e1d-e99c-40a3-bdac-0075b5339beb@gmail.com>
In-Reply-To: <a03a6e1d-e99c-40a3-bdac-0075b5339beb@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 8 Sep 2023 10:10:37 +0200
Message-ID: <CACRpkdahWm9aP+UasDx=s3th+vyjAfuWrKB5HS9BKEbz90ZmKw@mail.gmail.com>
Subject: Re: ARM BCM53573 SoC hangs/lockups caused by locks/clock/random changes
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        openwrt-devel@lists.openwrt.org,
        bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Rafal,

On Mon, Sep 4, 2023 at 10:34=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:

> I'm clueless at this point.
> Maybe someone can come up with an idea of actual issue & ideally a
> solution.

Damn this is frustrating.

> 2. Clock (arm,armv7-timer)
>
> While comparing main clock in Broadcom's SDK with upstream one I noticed
> a tiny difference: mask value. I don't know it it makes any sense but
> switching from CLOCKSOURCE_MASK(56) to CLOCKSOURCE_MASK(64) in
> arm_arch_timer.c (to match SDK) increases average uptime (time before a
> hang/lockup happens) from 4 minutes to 36 minutes.

This could be related to how often the system goes to idle.

> +       if (cpu_idle_force_poll =3D=3D 1234)
> +               arch_cpu_idle();
> +       if (cpu_idle_force_poll =3D=3D 5678)
> +               arch_cpu_idle();
> +       if (cpu_idle_force_poll =3D=3D 1234)
> +               arch_cpu_idle();
> +       if (cpu_idle_force_poll =3D=3D 5678)
> +               arch_cpu_idle();
> +       if (cpu_idle_force_poll =3D=3D 1234)
> +               arch_cpu_idle();
> +       if (cpu_idle_force_poll =3D=3D 5678)
> +               arch_cpu_idle();
> +       if (cpu_idle_force_poll =3D=3D 1234)
> +               arch_cpu_idle();

Idle again.

I would have tried to see what arch_cpu_idle() is doing.

arm_pm_idle() or cpu_do_idle()?

What happens if you just put return in arch_cpu_idle()
so it does nothing?

Yours,
Linus Walleij
