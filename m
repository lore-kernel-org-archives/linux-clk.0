Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFA2C6FD19
	for <linux-clk@archiver.kernel.org>; Fri, 10 Mar 2023 07:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjCJHza (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 10 Mar 2023 02:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbjCJHz3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 10 Mar 2023 02:55:29 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650D6E191A
        for <linux-clk@vger.kernel.org>; Thu,  9 Mar 2023 23:55:23 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id l1so4165424wry.12
        for <linux-clk@vger.kernel.org>; Thu, 09 Mar 2023 23:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678434922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg8gm9UXcuofNWv7bFMURJvZUDWceYZ+g4VoqacHVTs=;
        b=XcSpm5S1c3LTIpRC/qSv/wD4Phhsa4jCsOLrRowE6+YdUtdlMT2Koo4r4ka6wFxa4s
         mtmwQTOSxubEKjDOJHdMhFnLsJGYGswUw+sr1KNk2NKS2T3JoyJ4tC2yQ7YMYIa1d3Mt
         rHkS/x1f4mBTfXxgRjQzy3tmceUijtRWfxMuKBwmqxZWRKc7Z53+obu/JywSWMi4tQEc
         vz5tAeb/V/iMQ9/rY/c15TPEilikvL592wkSLIgZUx2SfyPHnWmM/7/g3imS6vKW19yI
         ym6Zc3ZpQIlu8g5Hy7T8VPCgf5PMVTYE/XTZxI225FdRPvGAKhPftedSSGQ2tCGKfR3b
         I7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678434922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hg8gm9UXcuofNWv7bFMURJvZUDWceYZ+g4VoqacHVTs=;
        b=vHfOv7hXS4IzdPlcTtXdtEBMGwlvu/MynIwuVqwrLbOLxWF7hY8Sj/GCgsLC5eMy0s
         L5Xv/cpaL2gQqnx5Ytsg7twtdWgkb/alxtkXJT9f5AOuQSxhz58h9oER3/edCZE1NCMk
         B/XAPzF5dVjC6kGNNDT0HJecNBkKObsX2mZXTOBc2tcOlqYoZJgkSjQbk/Ibl5H4PQ3M
         cMaQGdhgqS69Mm0KDOwY8OR/6zbaKM+RFCAgbMw9H4+E4RZGWs6DgQbmiLqUbhtluntc
         emVy1GK/su2ZfqAITpzSB9wjXdbMbI4O9K0gFYU6iuWFrOc+qctWSRLjSuxeGI7RSLWz
         +qZw==
X-Gm-Message-State: AO0yUKXLXl81UTGj6RDZ4B/O7ivxKl+gvz0TGl4uKQIpBsMlcgnvFNqe
        jqo/9yZoIPmm/DphcW6/ExU1z6JlQhkfb6+HpwWA3A==
X-Google-Smtp-Source: AK7set8YJqVZRqtut+bMEQTqwl6r469KIAYC+a6PXbytDy5dL9Ft02+G7BXUCv4WmitzpSAnNx588vSN5VKBNG4uKa8=
X-Received: by 2002:adf:fc0d:0:b0:2c5:8377:3eaf with SMTP id
 i13-20020adffc0d000000b002c583773eafmr4846173wrr.2.1678434921777; Thu, 09 Mar
 2023 23:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20230302013822.1808711-1-sboyd@kernel.org> <20230302013822.1808711-2-sboyd@kernel.org>
 <CABVgOSkxOxpaHVtq1YpvNEshTZ3nic1p7NjV5DPdz066=tiS-A@mail.gmail.com> <377046f369227a11fbf9e67c3c122d79.sboyd@kernel.org>
In-Reply-To: <377046f369227a11fbf9e67c3c122d79.sboyd@kernel.org>
From:   David Gow <davidgow@google.com>
Date:   Fri, 10 Mar 2023 15:55:09 +0800
Message-ID: <CABVgOSm_yRjqKYegZeFkObkS9cgXaDfD2CTeoE1s7RRLo=RuEg@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: Add linux,kunit binding
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        patches@lists.linux.dev,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-um@lists.infradead.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 10 Mar 2023 at 07:12, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting David Gow (2023-03-02 23:14:55)
> > On Thu, 2 Mar 2023 at 09:38, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Document the linux,kunit board compatible string. This board is loaded
> > > into the Linux kernel when KUnit is testing devicetree dependent code.
> >
> > As with the series as a whole, this might need to change a little bit
> > if we want to either use devicetree overlays and/or other
> > architectures.
> >
> > That being said, I'm okay with having this until then: the only real
> > topic for bikeshedding is the name.
> > - Is KUnit best as a board name, or part of the vendor name?
> > - Do we want to include the architecture in the name?
> > Should it be "linux,kunit", "linux-kunit,uml", "linux,kunit-uml", etc?
>
> I think I will drop this patch. I have overlays working. I hijacked
> of_core_init() to load the testcase data from drivers/of/unittest-data
> and made a container node for kunit overlays to apply to.

Makes sense to me, thanks!

Looking forward to seeing how the overlays work in practice!
