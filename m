Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAAE5C07545
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 17:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233387AbjJYRlj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 13:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbjJYRlh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 13:41:37 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D71A18B
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:41:35 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9c2a0725825so4747166b.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698255693; x=1698860493; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cBNaTjBwmD7DDb8oYXr337UXXRS17wg2IqMWRZnMrPs=;
        b=a8ADbzxA97WkVE7jEmgvzOP35ExZG5aEKw5LffNswukF9Em9Lei/Q4mPAgqRrl0SAh
         1a4Nvm88a967sAuXajj4zZnilwgzuIYgpej3CWwi4jJPWJYnT7i4HM/kB8Z7v5sjg4RB
         NQRxHZs/n+dypH+lk97sE2B0KTiY+oAKZELtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698255693; x=1698860493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBNaTjBwmD7DDb8oYXr337UXXRS17wg2IqMWRZnMrPs=;
        b=h3NjHmrBZQDdqlsLfC6Bf1NXHqh3SpPUEu7OG6/X98L1a5KH3BIu/06cwKQbE1vKFh
         zwpAsXf3AcRKKKQH9tOlVx8wBOynbZjD9yBw3E2oMrlRawSXtDn34eO0i2PnTDIqMWJ/
         rGyxrfT6RS8KwXr214wI1mVEGxXh0uwoO9lBRXVR972X3ZrmgEArk/Hrhkv0xRVRqus9
         xcrVxWTdKdtdbVbtQXkyGXB17eAvnOsxJluOm+iy1dXEz5eTgZpqAMwaSmgmxYKW3sw9
         4UIIH0Btt6A5xKpOqZxg/uIrADBcMRmsLivhjBlrZ8G8c+ksehz508aUHx1e4JnGafOF
         irQQ==
X-Gm-Message-State: AOJu0YxsCIEOOcUprAgWp9qJKEyRE18s3bssdYjqlkWJAsc8HLCGCHE2
        fdb0pMU0pHR84qt+f+LE036UqrCygh+O1HV/zzNZgA==
X-Google-Smtp-Source: AGHT+IFpXmkWS0ETen/zhZWKI2FJ3DetytKxKRWSNksvv6QhAUIVJfV2X3xAMqAenM2k/ALqV/E9bQ==
X-Received: by 2002:a17:906:d552:b0:9bf:7a4d:590d with SMTP id cr18-20020a170906d55200b009bf7a4d590dmr13004696ejc.24.1698255693286;
        Wed, 25 Oct 2023 10:41:33 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id n20-20020a17090673d400b009b95787eb6dsm10209464ejl.48.2023.10.25.10.41.32
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Oct 2023 10:41:32 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-53dd3f169d8so8992172a12.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 10:41:32 -0700 (PDT)
X-Received: by 2002:a17:906:fd45:b0:9c3:cefa:93c6 with SMTP id
 wi5-20020a170906fd4500b009c3cefa93c6mr7840525ejb.10.1698255692298; Wed, 25
 Oct 2023 10:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231024161931.78567-1-sebastian.reichel@collabora.com>
 <20231024161931.78567-2-sebastian.reichel@collabora.com> <CAHk-=whYDbZ29fx_xeSxtYSjtF8WJkaLjzyB8RN5_Rk9Sh-YyQ@mail.gmail.com>
 <CAHk-=wjO5ivM6k7iMiThO9JfxH0dhLe=mcC4TQwReU0nBCnWpg@mail.gmail.com> <4c2d36375bd74d94a2e6ef5d2fa0df99@AcuMS.aculab.com>
In-Reply-To: <4c2d36375bd74d94a2e6ef5d2fa0df99@AcuMS.aculab.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 25 Oct 2023 07:41:15 -1000
X-Gmail-Original-Message-ID: <CAHk-=whrytmsiaLS=rn==qrYw81y2Qiv6dAZxvGzwgX=dMFxng@mail.gmail.com>
Message-ID: <CAHk-=whrytmsiaLS=rn==qrYw81y2Qiv6dAZxvGzwgX=dMFxng@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] math.h: add DIV_ROUND_UP_NO_OVERFLOW
To:     David Laight <David.Laight@aculab.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 Oct 2023 at 22:38, David Laight <David.Laight@aculab.com> wrote:
>
> From: Linus Torvalds
> > >  - we can't even use a statement expression and __auto_type, because
> > > these things are used in type definitions etc and need to be constant
> > > expressions
>
> Doesn't min() get around that by using is_constexpr() and
> __builtin_choose_exptr() - the same could be done here.

Nope. I wanted to do it that way - it would have made things much
simpler and avoid the whole _Generic() thing, but try it - you cannot
use statement expressions in a non-function context even with
__builtin_choose_expr().

And no, min/max have never been usable in that context

                 Linus
