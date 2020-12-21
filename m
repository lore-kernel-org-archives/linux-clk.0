Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68899C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 18:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E941229C4
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 18:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbgLUSqF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 13:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbgLUSqF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 13:46:05 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12AAAC061282
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 10:45:25 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s26so26041621lfc.8
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 10:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1NJtCKrT5aOW2x87MSIaGkuS9YMPQEi6Wvh0DzkfmQ=;
        b=WGQF0hLI1ONKDp8qNn8LUAsqCC/F9IKlBvHTrClCmrxDT9zLY1ZU6+ec+NQhNtzVvu
         FZqiru3fCqV5YvtYbFUpd13yXtge52/4d057zJrIp/0LjcPjEv9j78X3/PRSi24uDQJ3
         7Hn655r/YAKN9E2BdIZdODUXJ3Ws6w164XMv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1NJtCKrT5aOW2x87MSIaGkuS9YMPQEi6Wvh0DzkfmQ=;
        b=U+cULqXVivxY2wzTkSgc3zwrEHS6JZbhwKurGImCfQaGo85ECwFqmXCsQ/rm0gjSl5
         sMVroR4WTqj3Odpcg9ZslQCksZDW2jeZzI13QSyoo0oc7TwgwXDpBXhSh7eVhU8YH1W0
         iPsMNpLI73BocheASLWUXoE5ze/CAJj023aSHwBAnyBtcPNfvuFUr7KwmzinTMYhl7iG
         b1LsH4V/FQ+2EBu38BkN9tu4xwtRaUPe1sweIfmxftfznM7zFPSQQZzv3st0BMal0GgM
         nGhVOGZ4xWALNeJNAcnC9jFL0gy+a6qrGuznPJsB4qBfajiyDgxZiTiUCyn80jq+0if0
         HL1Q==
X-Gm-Message-State: AOAM530vaxVDVXy1hExdGRkL0AKH2G3inNec5q2pn6Aixtngvgornafd
        WMP/3bicnC2bEVhWaMBkWKWYwnMsBgFqAQ==
X-Google-Smtp-Source: ABdhPJy1GYe/NEj/JhAD9VZYWMifdkEQoG+uxU8vxRyA49ayGZ3Ip0hhhenjrg0X+sC4ayiNKZ312A==
X-Received: by 2002:ac2:4576:: with SMTP id k22mr7567235lfm.110.1608576323205;
        Mon, 21 Dec 2020 10:45:23 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id d23sm2170876lfl.115.2020.12.21.10.45.22
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 10:45:22 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id o13so26112973lfr.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 10:45:22 -0800 (PST)
X-Received: by 2002:a2e:9d89:: with SMTP id c9mr8326818ljj.220.1608576321880;
 Mon, 21 Dec 2020 10:45:21 -0800 (PST)
MIME-Version: 1.0
References: <20201221015214.3466681-1-sboyd@kernel.org>
In-Reply-To: <20201221015214.3466681-1-sboyd@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Dec 2020 10:45:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiJUQz6hoosBKpKtupiix1pAS6GCd1bPVK5nW8umPFzAw@mail.gmail.com>
Message-ID: <CAHk-=wiJUQz6hoosBKpKtupiix1pAS6GCd1bPVK5nW8umPFzAw@mail.gmail.com>
Subject: Re: [GIT PULL] clk changes for the merge window
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Dec 20, 2020 at 5:52 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

Of 134 non-merge commits, 22 were committed in the last 48 hours.

I took this, but I'm somewhat pissed off about this. And the next
person who does this to me will get a blunt reply to just go and hide
in a cold, dark ditch somewhere, because between family xmas prep and
people who do things too late, I know which one matters more.

             Linus
