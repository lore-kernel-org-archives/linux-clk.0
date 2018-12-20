Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8661C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 23:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 76723218FE
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 23:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jq9FmGN4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732178AbeLTXUZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 18:20:25 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:54274 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731894AbeLTXUZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Dec 2018 18:20:25 -0500
Received: by mail-it1-f196.google.com with SMTP id i145so4479312ita.4
        for <linux-clk@vger.kernel.org>; Thu, 20 Dec 2018 15:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aJCstcpioKX1kDPN9Do4ajl4wQrLRjEEgz6HAK8MoUY=;
        b=jq9FmGN4dEMDtMTdoSlw+U4KYxRXJEWTp0D/E5gKQxakIGOQlDSyOpAf28F3X6D93Q
         zBWTouplLsJzDsBHyzbPw5I5cneJ2jm5gNKicFCRLDOnZkK23qJn4Olt6gCsRkaBV4ys
         ff+XaSkC4mwtm7wQHD6ms6kOp4MHJ4ZTcCjH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aJCstcpioKX1kDPN9Do4ajl4wQrLRjEEgz6HAK8MoUY=;
        b=gXJGRlAlWiGeeZnTpdBujuUQkOXaJ65FmMgfsCeKayPFII/LyeUkjQv9/yqbsz5RtN
         fGl510SJwp42rca1c9VxfTdD9uCFrSq07GDYD712SI2yXsSvcc8b6aZabyEYkM9l0RmU
         l7N3rScj+hiMb5mLtFcni/6iYxZRplyr3zu4ePpH3YpcKNYQSsz0UXlYYksdGSDB9Wl6
         TD5ULfN4tKCyCjoFL1Dv2XkIfPsWEn025gv0JjRtcLRx+VEqnMf2F1EFmqqpn7Xf4sRn
         KOLIs96tXm0yMYaqx4PWXS726wZWxXnONQxenGthCqG7jn3ZtIxCCljNT49gdHHXZ5sF
         jKAg==
X-Gm-Message-State: AJcUuke6sMC1ly1XEwIJybRAhQCafAH7YNcyeyRK3ithLHBAPlaCCD6D
        qGyByNvetvVQcZfBjveAJ6RMNT1t5j/wt0oZoDdzNQ==
X-Google-Smtp-Source: AFSGD/WPKU3M+3Jvw6zAtXzZltMyw24jz/yuzayxY6/Dl1M0Ds3Tovkz1K5Cs+O0YvNmtCqawmFHb/ey5XpGON0VQjM=
X-Received: by 2002:a24:bd0e:: with SMTP id x14mr502314ite.123.1545348024331;
 Thu, 20 Dec 2018 15:20:24 -0800 (PST)
MIME-Version: 1.0
References: <20181024013132.115907-1-dbasehore@chromium.org> <154534054131.79149.12015186156265337224@swboyd.mtv.corp.google.com>
In-Reply-To: <154534054131.79149.12015186156265337224@swboyd.mtv.corp.google.com>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Thu, 20 Dec 2018 15:20:13 -0800
Message-ID: <CAGAzgsq=p-2N6ybFXNTnz5SDkcdktA+Gk6e3gxrjpJB+L8389A@mail.gmail.com>
Subject: Re: [PATCH 0/6] Coordinated Clks
To:     sboyd@kernel.org
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 20, 2018 at 1:15 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Derek Basehore (2018-10-23 18:31:26)
> > Here's the first set of patches that I'm working on for the Common
> > Clk Framework. Part of this patch series adds a new clk op,
> > pre_rate_req. This is designed to replace the clk notifier approach
> > that many clk drivers use right now to setup alt parents or temporary
> > dividers. This should allow for the removal of the
> > CLK_RECALC_NEW_RATES flag and the implementation of a better locking
> > scheme for the prepare lock.
>
> Are you going to resend this series? I can do a review but I wonder how
> much it will change anyway.
>

I'm going to resend next year. I got distracted trying to get other
code to work. This code has bugs in it, so a new patch set is
required.
