Return-Path: <SRS0=AOYt=X5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F47EC4360C
	for <linux-clk@archiver.kernel.org>; Fri,  4 Oct 2019 21:17:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 637AE21D81
	for <linux-clk@archiver.kernel.org>; Fri,  4 Oct 2019 21:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lK2gFZ1q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730882AbfJDVRC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Oct 2019 17:17:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37146 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJDVRB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Oct 2019 17:17:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id l21so7883451lje.4
        for <linux-clk@vger.kernel.org>; Fri, 04 Oct 2019 14:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mitmi3lOMqSpYTCDDP4OehKdhas886p4UDP9S7yQMAs=;
        b=lK2gFZ1qa+irwSUDd4m5G0GGGVDwSqXGEGwE9XSPDVK9mkW5D5pX8lir0ilN0Wl9Ww
         tTa7IohtNwD7QWPSsI/kieHPMvZNDLQLySmZ5WTBTPlHo6cge7H4hKRpXAqZToukjHwK
         BvIDHYzaLPxqn3yqyv5w7FTZbCI3FkhQkHXHGtdDlYffqKNKqCEbjeL6QEPfHYaAWiZ5
         1DUmkNepBkT1xVg9q4MWBde5ANLw1r5w/FuUm09/5z9MkdeGleQ0APAeNcWqoDXK454w
         QE9A9NA8qgdzVNbZirmmQuKsoTvhBWF8vkHdLqs2BIUh6rxxErtCPe1p7KM9FvB/oO4H
         0G8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mitmi3lOMqSpYTCDDP4OehKdhas886p4UDP9S7yQMAs=;
        b=RUcyLVgDIw/+xVQONIvj9Wzqmmf261NMz8J63FgU25QR3ilrJxRlhEXknWHHkkHwAW
         lRSR0ak3w2uuOGLuBMaQGSVwqttHESIMUPiFlzTSPpzk012dI/f1OC8wky22jlrqhWb0
         J6/Lexpsqi1dAtnhdG/IR++x1yrHcuGYs731oYEdlzFj+tfdSts0hB35PVgYDna3aNaw
         AykDdNOIUkhJGafE2f2xH6DRueuB30KD2aUezQdeC0cPTG7lAoDO3qRVxbieHxaut3Ep
         uGVMbkog6bfRbRebj43H6noFWQJffrGNicqW1IXC8wYWfEQYxl8erswzn0U8MqQl7qYY
         3EMQ==
X-Gm-Message-State: APjAAAXVf/XGxzR3jNnQG4yKHTM4hiWhiZVsrQgcobsZM+d/mzcVfMGK
        f3bDNlL/IfybQZ3gGC4paYlMB+6CvsOzLdZWkU311g==
X-Google-Smtp-Source: APXvYqyvx1ZJVx3BdlEwVPKWVbrlnWhYW68EF/q5bhSKJMO+egyDnB8hTFcsfD4uKHWflQL5bAmuc673rey06t4k4d8=
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr10497466ljg.41.1570223818492;
 Fri, 04 Oct 2019 14:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190921101207.65042-1-kholk11@gmail.com> <20190921101207.65042-2-kholk11@gmail.com>
In-Reply-To: <20190921101207.65042-2-kholk11@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:16:46 +0200
Message-ID: <CACRpkdZH9VxYHh5c7r405nKHo8vq8PWZZnncP4yzTyJe_Zvnng@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: qcom: Add a pinctrl driver for MSM8976 and 8956
To:     kholk11@gmail.com
Cc:     MSM <linux-arm-msm@vger.kernel.org>, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Angelo!

Thanks for your patch!

On Sat, Sep 21, 2019 at 12:12 PM <kholk11@gmail.com> wrote:

> From: "Angelo G. Del Regno" <kholk11@gmail.com>
>
> Add the pinctrl driver to support pin configuration with the
> pinctrl framework on MSM8976, MSM8956, APQ8056, APQ8076.
>
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>

This changes device tree bindings so you need to Cc devicetree@vger.kernel.org.

Usually they want the device tree changes in a separate patch.

It'd be great if I can apply the pinctrl patches separately from the rest of
the series.

Also I need Bjorn's review on it first.

Yours,
Linus Walleij
