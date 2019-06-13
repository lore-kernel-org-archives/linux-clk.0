Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF3AC31E45
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 19:08:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 383A22173C
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 19:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WkPt5Yf6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729126AbfFMTIA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 15:08:00 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34322 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbfFMTH7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 15:07:59 -0400
Received: by mail-pl1-f194.google.com with SMTP id i2so8535641plt.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2019 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=GMnghIl7eXWXzs6/0zMCrD5jkYbNpzmrrUy+d4e0iJU=;
        b=WkPt5Yf6Jc/jE8ojCnCJ4Kr86w57zSBU5UOq7t1FQ8y6mOmpr9OZZjVjAkg7c4VUpB
         hf+8g5lfbocX8ZWwRefESSQBv5voTSbCTb4JyTRfspIKqwrWNRuEPKOOpRDetar/W+7R
         YvCOKqUMOLTz4j612toG7PRYuH6C9xT07ToIKfFCi1yHZhOTy912m5P1K5kogRroJr01
         sGcgZRC71k0GrkKc9YL9SIzXRKFOyh4hD7yFjIZH66V6mTouR1d0FWJsl54/eECWeXfl
         jbxYps1d1NqT5d62EgLSZibs0JRdUDtnqGZgdeFoyI8bcSS4/c6spBJQ0WErIMXHkXae
         pCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=GMnghIl7eXWXzs6/0zMCrD5jkYbNpzmrrUy+d4e0iJU=;
        b=FYl3LmKvMff/5D/RQgplATUdbpU9JLM1oqnZBrSESlW+Z6XxO0LBHc4dSk8S6sHgHy
         jrwKt87edVe6SztISV+wpkVpVMfjIArz7Q52DjTZSALZPrj+KnEUxVOYa8QRfoO7TQNX
         JccdxjhAqqMb0DZEW9pV20PALb52QSsOPGWYkQCqVOsjjcYjiyxFI06Ii31qmaq6ZIRO
         O96WvG2xDTQ/hg6TZRBrdimoQA2QXsGjjEldAEpZ0CYl8npxd4uDH9IE2zgkNAJfut1W
         pCfwxXajEip3avmZqYoNT2YJlIS6gvlU8dswmpiJdnH8P4vQkYJ3WoHBJOaTU2zysOV4
         z+SQ==
X-Gm-Message-State: APjAAAVPJVIc4Uxr8yijzl5LUICVOqr8knsvcjF11SGrixh/lIHzW8iu
        PqHFM5WWcImUGRgQSa7/s3hN7Q==
X-Google-Smtp-Source: APXvYqw9VdST2x6sbLH0VNcls856gB7kMteKDCmWa0BzccKnV9n2mkwqg0v1z57AORxB8mwtaA1o2w==
X-Received: by 2002:a17:902:2bc5:: with SMTP id l63mr89422886plb.221.1560452878443;
        Thu, 13 Jun 2019 12:07:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.googlemail.com with ESMTPSA id w16sm500200pfj.85.2019.06.13.12.07.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 12:07:57 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     "open list\:ARM\/Amlogic Meson..." 
        <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
In-Reply-To: <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com> <20190612230201.3692F20896@mail.kernel.org> <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com>
Date:   Thu, 13 Jun 2019 12:07:57 -0700
Message-ID: <7hlfy54836.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Wed, 2019-06-12 at 16:02 -0700, Stephen Boyd wrote:
>> Quoting Jerome Brunet (2019-06-11 05:23:33)
>> > Dear clock maintainers,
>> > 
>> > Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
>> > These are typos in recently added clocks, the most annoying one being in
>> > the DT binding identifier on the MPLL50M which is used by the network PLL.
>> > 
>> > Regards
>> > 
>> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>> > 
>> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>> > 
>> > are available in the Git repository at:
>> > 
>> >   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
>> > 
>> > for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>> > 
>> >   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
>> > 
>> > ----------------------------------------------------------------
>> 
>> Thanks. Pulled into clk-next.
>> 
>
> Hi Stephen,
>
> This was actually meant for clk-fixes
> We could probably cope with next, but it would be preferable if the typo in the
> bindings was fixed by the 5.2 release.

Yes please.  That would help my dependency management also.

Kevin
