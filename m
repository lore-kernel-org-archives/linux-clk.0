Return-Path: <SRS0=W3Yt=WC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D46AC31E40
	for <linux-clk@archiver.kernel.org>; Tue,  6 Aug 2019 12:53:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C98632075B
	for <linux-clk@archiver.kernel.org>; Tue,  6 Aug 2019 12:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UdhpRIRR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbfHFMxc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Aug 2019 08:53:32 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32951 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730222AbfHFMxc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Aug 2019 08:53:32 -0400
Received: by mail-lj1-f195.google.com with SMTP id h10so10691277ljg.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Aug 2019 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HV09zpybfsy+I3fJbUAkGtQHbBc426YvIl5qaG1i4W8=;
        b=UdhpRIRR6fzwMx5vTEcn6+DpO3eK9AAXv6NwTfA6CFtU3xyvOCvIF4CXm8tI2TXq6E
         WKjFc2iD924G2t4KLDnsoxrM+jIpeTWzQ2cVE8806JarIISiphInjI1X7l6q7bzAqVR0
         pJgeyJGBXtIpRzVkRR6F3HcR6MWu1gxNr6KQjt/xOz0vuz4bv+jRS3IMFEZXfeLIStnF
         +HBhqcC9lNQZ9iluPad7URnLDNVqhUGyr3/2vT7QWrCBQOrDUMJcKc9w2hEk0obE8N3E
         1WaZ30vDiQ6jmpBcRei9cVbMaGfgmuy/GgORwI3MsvAt5Iip7iGHzJfY5+AHhPJBWZBz
         xy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HV09zpybfsy+I3fJbUAkGtQHbBc426YvIl5qaG1i4W8=;
        b=HdgsdLsgOGNAPxwRyn+C0LbIEAYQWhPz+PhZOSNu7r6q1rzFJXt4NZFJqjViqaHctc
         F8sSLNI+puEac0OtvwQ7hK67egRalPf/3yZNRR1xbrprRPs63qVlIQBAPA8tdFHObTqA
         K5HCaWcDpKX0UerMVGcJoAl/kOnrNoMiqTQHnTpxFKBrvJZ18HDB7SkhSZ73+/tS8r8M
         9otUpBj1HAHAYSX3SlECyk5dTA3RG+wSi2h7JsNIILrECmUXzL6i3H5ZVbI1LOsFiWHu
         lPoWR9QKq9AK+xennk7q/eDbEX8+Aqqaj6KNYDUQX01qfHIxqrCGmQAVkFfUvwAImDB9
         v68A==
X-Gm-Message-State: APjAAAWhJgQ/cqE+1EP4/NTTYdTVDFsv1rOK5H7KMy///OktTiz5w3RW
        dikTJbJmf+IBYSxpxWShgjYo6JS87suzU86W9A2S6A==
X-Google-Smtp-Source: APXvYqwzjP8TFgqBE05qT9MDh1E1Lu5UcaY925WA0Nnx9/LH4CPLcq4VNPSmnGg+FJerwiR/lYW3/QuHn0NqhSYf/tU=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr1636402ljg.62.1565096010210;
 Tue, 06 Aug 2019 05:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190804163445.6862-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804163445.6862-1-nishkadg.linux@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Aug 2019 14:53:19 +0200
Message-ID: <CACRpkdZCE3nXaF9MK_VTpvyrADqhF1oVta649rUzMb9O57XVYw@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: Add of_node_put() in cm_osc_setup()
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Aug 4, 2019 at 6:34 PM Nishka Dasgupta <nishkadg.linux@gmail.com> wrote:

> In function cm_osc_setup, variable parent takes the value returned by
> of_get_parent, which gets a node but does not put it. If parent is not
> put before it goes out of scope, it may cause a memory leak.
> Hence put parent before the function terminates.
> Issue found with Coccinelle.
>
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
