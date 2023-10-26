Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA299C25B48
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 16:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjJZQye (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 12:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231699AbjJZQya (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 12:54:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6726A4
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 09:54:27 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so1919265a12.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 09:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698339266; x=1698944066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ant3aW5o4UfJ9+pGAMWn3sv1qIYaJ3ZE24ECRvWTTJY=;
        b=RampxnR4KBqfIh3i/GkpCQ4mSOOYVRkDhFLjkxsvIqZ7EvRa/6SCmJYCCKBu81dgvb
         +TseekiscFTBC+7lee+ymiWvP2MATt7qMOTyFnbSGCvOjQYjvCR021d+eBZDilgUXeO/
         ilxa6oOy/rh81nBbHRg4tPAo7Yvko3gz568tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698339266; x=1698944066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ant3aW5o4UfJ9+pGAMWn3sv1qIYaJ3ZE24ECRvWTTJY=;
        b=i0M4tGrltcNhymUvC/awAhDmG1s52sYYXGIT9o4G41uS+Yo66tNiHPr913xsumzCaG
         IP02mkBIzWIeiml04jMvoOAZClqis3CmWrfbwePWPRU3GgApHrjMaokCZarmkpmnOa1o
         VqNIbzC489oLgVw8rbuFRpEqJvll/vu8+bkpNiuprCFpD96mIRVOTdQVptCaXmQ0uQ/8
         DnzBKDjiY1DCHRB8gNVqZb6PxCi0Wr9hNsK3ARZ/UoPvxv9Hnkn9SfMOTR/Rufta/RRY
         FlSMKUVe86l5At1vA4SCmAhaw0Grd4vB0x5aa/FPiuBQR2N5BBAVp1MhE+pV5wUcqLRZ
         4s3g==
X-Gm-Message-State: AOJu0YwqThbm2EkCTAkTCeyQQ1pcUarUPwTa9Q8aJnjDWe54CVLetc2G
        387FgiOQKA5RCVGFR7uOAGfPJ+1WAACzvpKAk3z+8OvY
X-Google-Smtp-Source: AGHT+IEltVo5dQHQ5aafJe0HclAmyaBFxDwXIwxWU+PHarrZDWvmf8Ticwr6WmE60v/+6vvkvK1SOQ==
X-Received: by 2002:a05:6402:1bc4:b0:53e:3b8f:8a58 with SMTP id ch4-20020a0564021bc400b0053e3b8f8a58mr323849edb.11.1698339265879;
        Thu, 26 Oct 2023 09:54:25 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id n4-20020a05640205c400b0053f9578ec97sm11521618edx.56.2023.10.26.09.54.25
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 09:54:25 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so1919170a12.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 09:54:25 -0700 (PDT)
X-Received: by 2002:a05:6402:3586:b0:538:a47:89d3 with SMTP id
 y6-20020a056402358600b005380a4789d3mr295557edc.21.1698339264715; Thu, 26 Oct
 2023 09:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231024161931.78567-1-sebastian.reichel@collabora.com>
 <20231024161931.78567-2-sebastian.reichel@collabora.com> <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
 <CAHk-=wjO5ivM6k7iMiThO9JfxH0dhLe=mcC4TQwReU0nBCnWpg@mail.gmail.com>
 <your-ad-here.call-01698246313-ext-3263@work.hours> <CAHk-=wgs2DDdckcONG+YbB-GDH2QFCoZJ=Vm+YXxb1moZzuDgQ@mail.gmail.com>
 <055dd714f98f4e45b2add561b7663378@AcuMS.aculab.com>
In-Reply-To: <055dd714f98f4e45b2add561b7663378@AcuMS.aculab.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 26 Oct 2023 06:54:07 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgBM7Swi7wmvi0M+sBFjzn-vEv1KzgM-hbJ4h3J3BR+UA@mail.gmail.com>
Message-ID: <CAHk-=wgBM7Swi7wmvi0M+sBFjzn-vEv1KzgM-hbJ4h3J3BR+UA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] math.h: add DIV_ROUND_UP_NO_OVERFLOW
To:     David Laight <David.Laight@aculab.com>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 25 Oct 2023 at 22:57, David Laight <David.Laight@aculab.com> wrote:
>
> Doesn't that version end up calling inline functions?
> So won't be usable in static initialisers - the same as statement functions.

David, please either read what I write, or actually test things out,
instead of just adding noise.

It is not a problem to have a _Generic() - or a
__builtin_chooise_expr() - that has an inline function that doesn't
get used. The compiler will remove it.

The problem is literally that you can't use "__auto_type", because
*STATEMENT EXPRESSIONS* do not work outside of function definitions,
because gcc won't even *parse* them, and just says

  error: braced-group within expression allowed only inside a function

exactly like I explained in the comment of the patch that does the _Generic().

Which is why my solution ended up using those inline functions, and
splitting manually by type, instead of an expression statement and
__auto_type.

Whether you then split into different expressions with _Generic() or
by using __builtin_choose_expr() is irrelevant, although once you do
"split by type", _Generic() ends up being much more convenient because
that's what it's designed for (and you don't end up trying to figure
out the size with sizeof() and typeof tricks).

               Linus
