Return-Path: <SRS0=zhrK=AP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C84AC433E2
	for <linux-clk@archiver.kernel.org>; Sat,  4 Jul 2020 09:17:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA5B20EDD
	for <linux-clk@archiver.kernel.org>; Sat,  4 Jul 2020 09:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="SCXoRevB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbgGDJR1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 4 Jul 2020 05:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDJR0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 4 Jul 2020 05:17:26 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF95C08C5DE
        for <linux-clk@vger.kernel.org>; Sat,  4 Jul 2020 02:17:24 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id dm19so23643397edb.13
        for <linux-clk@vger.kernel.org>; Sat, 04 Jul 2020 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/TRH+R1Jd8bkRDtLQE4V1BauMMxUIjDQbhrcVAnS+Y=;
        b=SCXoRevBc0YwM9J9u9Sa97afiHyxdiz7b0+aXHvuS7zS4Pfi7qbP1VfMqEiWoQM5ET
         iTru0AzQeUchb3hj+nbINcockWsxFxRntPxnTA8jFD1jIcHOOqQkygVhv85LIJXGCm7b
         kUkEJHjDU3X3QY5wFGzHlmah96sI8DpQDTMrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/TRH+R1Jd8bkRDtLQE4V1BauMMxUIjDQbhrcVAnS+Y=;
        b=qB12N0xl6OwRyWBtop5Q4P/xkVbTS3jNec+8J78EE7edCvcEyZQBnKbB+Ds8VvgzaL
         x6T0GBvC2IZ3Vd2acx4Q6/ZgUL2FzrXvxWArWebGHDJwluFp9oq/mdUP1LY/oFVMmVPP
         3de2uI3qwez+Ecwya1+nn2bBL+Z5a2QEAkOdSgAnzgKlHnuN7BQCT/3gnXlS6jhLpJzb
         VRaRYpwWeiP78JGPkXkQH6Qk1YnXHsU2HG9oEUmSBTev52GY9+frQ8RkgZ6a4bue8YRu
         KQkEj8IQFQIW7BYq4e+a2suaT8xVPvqXwgSagFF2jaeukHGt66TI6YYvUBja7zEPVq/q
         Zp+w==
X-Gm-Message-State: AOAM531Utk9xY25rfDmV3RgHJXoIQYvdw+X5r4H8cfMF5AVlMgDL2+pB
        LXN9tWqzJaA+q4DudKeOhNOLceK0qyLwQ2BxeUTLCQ==
X-Google-Smtp-Source: ABdhPJwlefxsAbGTCRPLIBaYv9lxYvdEX0dTSqQ0Eif4z0YohHwTAySzp2vMit7sAuH5RhITj6dd324GeKAxdmHfpCk=
X-Received: by 2002:aa7:ca05:: with SMTP id y5mr18051705eds.204.1593854242943;
 Sat, 04 Jul 2020 02:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200703154948.260369-1-heiko@sntech.de>
In-Reply-To: <20200703154948.260369-1-heiko@sntech.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Sat, 4 Jul 2020 14:47:11 +0530
Message-ID: <CAMty3ZD7jBSCEWLRK9qNXKGQC2_0eJyo5NkbV4MfaTNbC4Br2A@mail.gmail.com>
Subject: Re: [PATCH v2] clk: rockchip: use separate compatibles for rk3288w-cru
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@collabora.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 3, 2020 at 9:19 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
>
> Commit 1627f683636d ("clk: rockchip: Handle clock tree for rk3288w variant")
> added the check for rk3288w-specific clock-tree changes but in turn would
> require a double-compatible due to re-using the main rockchip,rk3288-cru
> compatible as entry point.
>
> The binding change actually describes the compatibles as one or the other
> so adapt the code accordingly and add a real second entry-point for the
> clock controller.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # rock-pi-n8

Note: These are U-Boot changes,
https://patchwork.ozlabs.org/project/uboot/list/?series=187546

Jagan.
