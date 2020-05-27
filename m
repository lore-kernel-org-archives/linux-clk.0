Return-Path: <SRS0=u/0O=7J=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1374AC433DF
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 05:49:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D37222078C
	for <linux-clk@archiver.kernel.org>; Wed, 27 May 2020 05:49:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHURO0ex"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgE0FtV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 May 2020 01:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0FtV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 May 2020 01:49:21 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA529C03E96E
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2020 22:49:20 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so27405102ljj.1
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2020 22:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Ey3RUpCGa5Aox52KZ5G497GPuu8CFMaGOEj0YfbRCE=;
        b=IHURO0exP8ThsysvtvUVDN5cTBjZW1A5ogekeUUqLNeYB2FGz4d/s/pWf9IREZvWh9
         6f3oUSCkM5uanpvYDqHX3Mm1dW6YEvprJ2NdjOmDgkcMox49wszIokbgRyhNb/ash0mu
         qYG2m30mWdIbE6HauFvsy7lUAeG0MY1Cm+vBQsDVjJpR9COGe8J5mWSqMVoOZlsvr2IP
         oU15BvzZaVmPzyM5p78RnO4P8b+XQ8wJv69PMeJ0ggxtY8eq28DwZ3LeT+ptx8vU9z0A
         KVTOsFtyrGmTzfq1xSBTHeSDuo80Ah7EpSzJJflNND68IyDuCgHx9iUdQKy9CgFuAM0I
         +6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Ey3RUpCGa5Aox52KZ5G497GPuu8CFMaGOEj0YfbRCE=;
        b=qPAiAtlTIYsdqhC9TD0QK/w2+GYynaHEsnNxo5FZLIJUHdt8jzXP6lh5+Vxmh2+v7w
         FaRo4TvYp85ljPNtpUkU4XbDz7ziFLw0nCUa7J0fbCgz2cEjf4EPqGmJQnc5medxPdaX
         rucIgwGJaCXVt04jfjmWYoPpUqZvSoGtABr+f7rkSOyfp5ozbG8Tlzot1eXlMU/LAuo7
         BIBT8aGc2KUijySK+JSMPWpE5dAQ++Y4GNs5txXSXf/DcGQH1iDGUdPHCg+avKTD/McC
         eBx2/mHJjh8C4RmsUhgye0ySTPQZgjqq05v26Q+p5jMp2T4qIomgNd2RxgPQJo5SXCnF
         1YyQ==
X-Gm-Message-State: AOAM533HVQ2P3HnXQ4Dv7avMcA4bR6UK5sJy/M/AHwZbVhgqAkRkYDju
        vmvZgHW3+fVAVEaUzvcFZ3O1Qr+02WYHnN9G4igF2w==
X-Google-Smtp-Source: ABdhPJwnO7GDTOtyL2kiFe3jVfkqBAg7nq2J7SDhBgiLgtUefNePgtYaoje9dfB2Zk33EfyfNamq1jgS7Fz6Jg4SKys=
X-Received: by 2002:a2e:8e91:: with SMTP id z17mr2117948ljk.144.1590558559281;
 Tue, 26 May 2020 22:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200526224116.63549-1-colin.king@canonical.com>
In-Reply-To: <20200526224116.63549-1-colin.king@canonical.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 May 2020 07:49:08 +0200
Message-ID: <CACRpkdb7s77aOnQxMQ=Gi9zcy_fz37PZ5E3+vk0=P5N8wjA6sw@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile: remove redundant assignment to pointer clk
To:     Colin King <colin.king@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 27, 2020 at 12:41 AM Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer clk is being initialized with a value that is never read
> and is being updated with a new value later on. The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
