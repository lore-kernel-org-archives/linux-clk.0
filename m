Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B8DC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 13 Nov 2021 21:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7552760EB6
	for <linux-clk@archiver.kernel.org>; Sat, 13 Nov 2021 21:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236034AbhKMVPj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 13 Nov 2021 16:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236006AbhKMVPj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 13 Nov 2021 16:15:39 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3F3C061766
        for <linux-clk@vger.kernel.org>; Sat, 13 Nov 2021 13:12:46 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id o8so52802430edc.3
        for <linux-clk@vger.kernel.org>; Sat, 13 Nov 2021 13:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMvMRcKJ0xIGHkquIVh8JvQQqviT/pBrCLoX/nW/010=;
        b=f9evVuOycwlxxEVG1R4k96EeegfDVzhi2vQP4BnWHyWCsMOvPwI8iYvAoAFWU3K7zr
         v71zL3b3rjUdTW28xAJTEZ8TJAugnwGr+uAc78d7xTJ4ds2374dmcxA4MzTcj4vCm98J
         YyyWoMsZJLQLG6gAz/8OynlxBjJYAHY7qSwRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMvMRcKJ0xIGHkquIVh8JvQQqviT/pBrCLoX/nW/010=;
        b=XOgx+jkwQsHoKFKH3Yu8dok9g8gU//npJd1ResyqyDFz6R0i1wP9TSnxT/RPwaQ1up
         35EjCQq7OhfwrvJIqKkoD0DXacnco5s1j/zln8FkgPSN/ZtNowlH6d5HsXT0Si1heTQD
         QOYGdAVertxmPeVTen9M7wQ2+xl+sla93kEfJQaPKy5aPrRWtKEWN7E9X+vjtJdOL2cV
         fnLn2Md3OVpi/cRFy6lhsIEGjkVzET6dFOePlCLVBlqeoEd2zvhT5ZkISuwi7ukxY9cV
         0kWuzJ9Gkc4pwl32q/tdTxA/ah7R7YevVDV/Mb8bbF3YR/QBoH8Rt4MwbOuSpS+jOYJb
         ACAg==
X-Gm-Message-State: AOAM532aF0SIqzKDUNO8dj7e/s+5dbB/0Y4ZqgNRjaOTqmHgYYODVhl8
        nzSsH7EG/FgTsKTohru2E7G2I4cTQRrLFx4fmhE=
X-Google-Smtp-Source: ABdhPJysxj7hYgoabsURH3Mr1wd3LXu3PbzSOrQVUGyKhtn05cPhQj5NOMnHaph3n82cpFGnGmMZkg==
X-Received: by 2002:a50:c909:: with SMTP id o9mr36326234edh.122.1636837964607;
        Sat, 13 Nov 2021 13:12:44 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id qk13sm4254418ejc.3.2021.11.13.13.12.44
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Nov 2021 13:12:44 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id d24so22200590wra.0
        for <linux-clk@vger.kernel.org>; Sat, 13 Nov 2021 13:12:44 -0800 (PST)
X-Received: by 2002:adf:d082:: with SMTP id y2mr30282675wrh.214.1636837963987;
 Sat, 13 Nov 2021 13:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20211113063648.3184640-1-sboyd@kernel.org>
In-Reply-To: <20211113063648.3184640-1-sboyd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 13 Nov 2021 13:12:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgs19T7XiA00EEzO6960VFpCAO7PQTWUFYn4AZr=ra-BA@mail.gmail.com>
Message-ID: <CAHk-=wgs19T7XiA00EEzO6960VFpCAO7PQTWUFYn4AZr=ra-BA@mail.gmail.com>
Subject: Re: [GIT PULL] More clk changes for the merge window
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Nov 12, 2021 at 10:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
>  - Revert the module platform driver support for Rockchip out
>    because it wasn't actually tested

I'm not sure how to parse that sentence, and the actual commit didn't
give me any hints either.

I ended up just removing the word "out".

              Linus
