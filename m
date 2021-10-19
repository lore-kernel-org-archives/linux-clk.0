Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B66CC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 23:58:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B4B36101A
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 23:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJTAAW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Oct 2021 20:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhJTAAV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Oct 2021 20:00:21 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24718C06161C
        for <linux-clk@vger.kernel.org>; Tue, 19 Oct 2021 16:58:08 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y15so11099168lfk.7
        for <linux-clk@vger.kernel.org>; Tue, 19 Oct 2021 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoJoRicRoKRwwH8sKnmnAcz3hOYI18/6K1zt/5RQ9go=;
        b=uGEx80SNXwGvds4c/nV7QzKKF44gFULTkt9Z7sZ7/5pBoLD3FDnOZQZNYOh9vANTJJ
         fsJ9l9ZtfuL6hDwjSAt0zOCZbC46bqdDDDhUBGUNUCiymt5sHNcDTW3vghQGRQInKCto
         zXpjam2T5800N19jcCfpaQyc9yGaX0EhrEEKWrTBMF1rmd43c4m4S8xNIk7XfIN9KqTg
         NXgH7avcU9zq2EKc8FvGANV1Jm0tK++xoVf+1BrstiLN53caOOMCnAb9Z6BTToHOYC6j
         egSTmjcaQj1ul9t2WznwAaANfIST2W1rGBcDTDdSUu3/U94/Nnzi2azbY/CwgkknwM/i
         TA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoJoRicRoKRwwH8sKnmnAcz3hOYI18/6K1zt/5RQ9go=;
        b=ZGwUxqZfZYKwXad4ya7gBqt2r2CLSSL+JFRCB9758g+4ovHpLgtmPzb/cqg2z87i8/
         y+HfG9UmFfL4qCSg4tkppoMB+c7HoGHUbIgpqsOdEfbJsPrcFH0Cwp1kGu18s4TVooXg
         yalX+s9jcN8ExBRc80Pz31VnR5Lvg0zqIaMWGivrHAxMIxU/dyHSsY0jvAPzjsvvNQF3
         KMflawGVmy6Xjf4nnDi5oHEGahWCIEI8GQTZMxao04MfWjb+4oNUsWEKeoG+YnFrvRGq
         CcL6sYIl/4vmvdlx/iuO7kVdffp6rnd/iIMOLhPChSHfnfjG/l7v7W/HHwXUOFsJrPaJ
         364Q==
X-Gm-Message-State: AOAM533s57En5VxYmGVsPPB7LrXXepBICobBzIa5yV5ItZRcnOT92pOd
        xBp5YMARfhDIXph/N1AoNgZjN7cSfLDKgQ2vccTlCQ==
X-Google-Smtp-Source: ABdhPJyoM9l8GvG83pjRDT4StPbmgxeFTQFY2sOhwsdvTesKlg43bvAnzMTLP7bn1KwSWpGRKh288WjUmAjh41mxTSo=
X-Received: by 2002:a05:6512:3d27:: with SMTP id d39mr8729458lfv.229.1634687886423;
 Tue, 19 Oct 2021 16:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210921184803.1757916-1-linus.walleij@linaro.org>
In-Reply-To: <20210921184803.1757916-1-linus.walleij@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Oct 2021 01:57:55 +0200
Message-ID: <CACRpkdbLxhUtXHs2+hy6U6OW2V3YTxrjxp0AxVP3PnV1hoFNKw@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] dt-bindings: clock: u8500: Rewrite in YAML and extend
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Sep 21, 2021 at 8:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> This rewrites the ux500/u8500 clock bindings in YAML schema and extends them
> with the PRCC reset controller.
>
> The bindings are a bit idiomatic but it just reflects their age, the ux500
> platform was used as guinea pig for early device tree conversion of platforms
> in 2015. The new subnode for the reset controller follows the pattern of the
> old bindings and adds a node with reset-cells for this.
>
> Cc: devicetree@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

One month has passed, can we merge this patch?

Yours,
Linus Walleij
