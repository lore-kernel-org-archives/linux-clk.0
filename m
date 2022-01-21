Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F83C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 21 Jan 2022 05:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244598AbiAUFZR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Jan 2022 00:25:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbiAUFZQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Jan 2022 00:25:16 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 205BEC061574
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 21:25:16 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id n10so22595007edv.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 21:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUrI0CIbeLsYv1K8VuO7jjapZZBa6rAM4oNdt35HhBQ=;
        b=nFVBOkpSgHJc4AlHP02L/VnMzkC+F1mwWuJKODmbTEBtoXE2Gt9Muz4iwkmA1NHYbu
         g2fJOV6zjvG+06kAx2tweNmPzIoZeog9Za6k67I5QPFPadl+mxd5GEddHn8V/eynXLp0
         VWhAy+0UNLEMtMR4v2gFMfy9QRIzoZctdCPWbgIq2/3uZVz0ovrZQqjiXlkG0EkYrOam
         sdoOKLv8d1C4R4wCsIZc5SgNUMtt5M53agHwrYc6Qe9r5hQTeCdNjRAD0uqlnSTmhtmc
         kmkbCvED08PDmZdHlWGElwJAOHmaPTLwVvMMGCYiM/hgGJwSV8xo8zpGjNJJ6J/OJ36N
         wqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUrI0CIbeLsYv1K8VuO7jjapZZBa6rAM4oNdt35HhBQ=;
        b=QRfK0m7/vTcnkF9SXRFHWl+L54MP8yeSjx9Dx1Al6CRXLspxvbWVtF2s9oiMMYIyVK
         nAoJVHQZOJ4kYLe+drPSudREQdshl9NxEWdYfLwJcODHyYVfDorRQyxuhCIE2wOgiC3E
         484sWWhjPFRNThqhUXzmsv/H886zdQRaW7BFKUeErmWMGUOCYfwKvp74ctpTf74KFoh5
         TiX2BASjGBYnVy0LNNArbg2JnfAOvU6lqGQTH9SR0j2LoyxLCdCj2kYcquIDb5WuENAh
         H4nAWNZchxsJxO22eKCi96sUgb3ORmMPdxf6OY4fHVovBXzy44V/FOwXgHLVM4p3924b
         CCXA==
X-Gm-Message-State: AOAM532jn95A5oWF3OzYRiAInXo9b1x/uAf9cdPi8TaANdaLweHqhBRH
        LjZk6Z2NJI84LlR57WDEjThptAxgLfcmMbGLJUl4nw==
X-Google-Smtp-Source: ABdhPJyjuwwdwV2Mz8K14saU4//UOA3m1H12Enxava4+yiBjdJ+h/yvlXZtzCmwIzkDkN8OjGAjE31OwskKBu1i2iIQ=
X-Received: by 2002:a17:907:7f86:: with SMTP id qk6mr1992726ejc.631.1642742714101;
 Thu, 20 Jan 2022 21:25:14 -0800 (PST)
MIME-Version: 1.0
References: <20220120143417.543744-1-maxime@cerno.tech> <20220120143417.543744-2-maxime@cerno.tech>
 <20220120213118.40F0AC340E3@smtp.kernel.org> <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
 <20220121043408.6C186C340E1@smtp.kernel.org>
In-Reply-To: <20220121043408.6C186C340E1@smtp.kernel.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 20 Jan 2022 21:25:03 -0800
Message-ID: <CAGS_qxpHuN5nyn8V7LGeZ1VTzboCgDwrz=p3TFPi73tZ0pWOBQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 20, 2022 at 8:34 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Latypov (2022-01-20 13:56:39)
> > On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > KUnit doesn't have hard technical limitations in this regard.
> >
> > You could have something like this
> >
> > static void my_optional_kunit_test(struct kunit *test)
> > {
> > #ifdef CONFIG_OPTIONAL_FEATURE
> >
> > # else
> >   kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
> > #endif
> > }
> >
> > I think it's just a matter of what's least confusing to users.
>
> Ok, I see. Is there some way to have multiple configs checked into the
> tree so we can test different kernel configuration code paths? This

Multiple kunitconfigs?
There's no restrictions on those

$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk/kunitconfig.foo
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk/kunitconfig.bar

The first one will assume drivers/clk/.kunitconfig.
But there's no reason you need to have a file called that.
One could just have multiple standalone kunitconfigs, named however they like.

--kunitconfig is new enough (5.12+) that there's no real conventions yet.

Another option is
$ ./tools/testing/kunit/kunit.py run --kunitconfig=drivers/clk \
   --kconfig_add=CONFIG_RARELY_USED=y

This is another case where we can do whatever is least confusing.

> discussion isn't really relevant to this patch so we can take this up in
> another thread if you like.
>
> >
> > >
> > > Maybe kunit should check that there was an EXPECT on return from the
> > > test. Daniel?
> >
> > Sorry, I'm not sure I understand the question.
> >
> > Are you saying you want kunit to flag cases like
> >   static void empty_test(struct kunit *) {}
> > ?
>
> Yes. I'd like kunit to enforce that all tests have at least one
> EXPECT_*() in them.

I totally understand the rationale.
It's a bit misleading to say PASSED if no expectation/assertion passed.
One might want a NO_STATUS (or maybe SKIPPED) result instead.

But other unit test frameworks act the way KUnit does here, so there's
an argument for consistency with others so users don't have to have a
whole new mental model.

Some examples below for reference.
All of these output something like
  test result: ok. 1 passed; ...

E.g. in Python
import unittest

class ExampleTest(unittest.TestCase):
  def test_foo(self):
    pass

if __name__ == '__main__':
  unittest.main()

In Golang:
package example

import "testing"

func TestFoo(t *testing.T) {}

In C++ using Googletest:
#include "gtest/gtest.h"

TEST(Suite, Case) { }

In Rust:
#[cfg(test)]
mod tests {
    #[test]
    fn test_empty() {}
}
