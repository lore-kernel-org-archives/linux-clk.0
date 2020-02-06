Return-Path: <SRS0=wpFC=32=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52475C2D0B1
	for <linux-clk@archiver.kernel.org>; Thu,  6 Feb 2020 08:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2645F206CC
	for <linux-clk@archiver.kernel.org>; Thu,  6 Feb 2020 08:27:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="M/XsjuOE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgBFI1d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Feb 2020 03:27:33 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35518 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbgBFI1c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Feb 2020 03:27:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id w12so6041342wrt.2
        for <linux-clk@vger.kernel.org>; Thu, 06 Feb 2020 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=9kljaJ45DR7PK3QOBkDdJqbWjqa2Tn065YYQ2Cnf0cU=;
        b=M/XsjuOEGL4+SDRcqZM4k7xs5BWiR5BWhcOiQUTN4Iq+uK335R0Z2fZKFz04p+ty8K
         gmFnwUfDFrDM3vFLB0o0htXtQ/vl+TmeboSwIe3sdy0wEfuF+/2CSGUINcfyNQsmBOdw
         7N4Vi1GfzzkciICyvJPRYNQ8KTus8C/ZJjmJ+ydKONjVr+Qx1Mw/h7HrQV9fJWk7cIl6
         Ex2I3Tefye97+rhQIT6I1sAFpzfUVbzrWroMKin7AeFe3hTLyxKTLfkI3ie61CaRs1kC
         VDLC1inK51KM0OS5tpeA/1yLAwRWhzdASQDKE0sgdDxI0ycsKoGx8kcC5B5C6mEvJGV7
         yclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=9kljaJ45DR7PK3QOBkDdJqbWjqa2Tn065YYQ2Cnf0cU=;
        b=LZG0A5FPiq4v/Z7/2k/mYZqY5Kmq3S6IfPtXo2Xsuy1rcypFheltewGTv0XbfDJPOv
         GsA23q83J5VWe/IfDkv3HFoUI3EySPRmLNT8zkc1ZZgPx7YUEw58Fb4OCgDE8sgEnY/O
         psO0VIaotCnZRzt/Wt4dQwudYrwEm7kkUT+E3vrpgpfaRmN4bnVKfq5YBgThJ3fBYjjs
         wIvUzZgxlvZNW0oZ3HMu7f1CFBhbmm/3jdD7YKR3/4Zpj3ZKQVx1nQtqlt1eG6t98RFu
         6CsYGLb0SQMZdfcUqwWejK7ugqOMONv1JLSdWQ2Ever7uvwi6SmJSn6eK/3oEEfoT+9R
         rpLw==
X-Gm-Message-State: APjAAAUqpcrhwqJsHJn07BIg4k1lYjO8xbxjwEqvF/+niX0Xv30b9OFf
        e1THasQJhiyiayF0OYsO+7I63w==
X-Google-Smtp-Source: APXvYqx8yxt1KY4kzNaVuOxm7JyXWMOe8beX4W95UoZ08fJdBJtFC4At07M9rapBBTwcDh+bVp5smA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr2376014wrm.13.1580977649868;
        Thu, 06 Feb 2020 00:27:29 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net. [82.243.161.21])
        by smtp.gmail.com with ESMTPSA id c13sm3320923wrn.46.2020.02.06.00.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 00:27:29 -0800 (PST)
References: <20200205232802.29184-1-sboyd@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 0/4] clk_phase error caching problems
In-reply-to: <20200205232802.29184-1-sboyd@kernel.org>
Date:   Thu, 06 Feb 2020 09:27:28 +0100
Message-ID: <1jtv44aznz.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 06 Feb 2020 at 00:27, Stephen Boyd <sboyd@kernel.org> wrote:

> This patch series is a follow up to[1] which I sent out a few months
> ago. We no longer cache the clk phase if it's an error value, so that
> things like debugfs don't return us nonsense values for the phase.
>
> Futhermore, the last patch fixes up the locking so that debugfs code
> can avoid doing a recursive prepare lock because we know what we're
> doing in that case. While we get some more functions, we avoid taking
> the lock again.
>
> Changes from v1:
>  * A pile of new patches
>  * Rebased to clk-next
>  * New patch to bail out of registration if getting the phase fails

Series look good - comment on patch 1 is just a nitpick

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
>
> Stephen Boyd (4):
>   clk: Don't cache errors from clk_ops::get_phase()
>   clk: Use 'parent' to shorten lines in __clk_core_init()
>   clk: Move rate and accuracy recalc to mostly consumer APIs
>   clk: Bail out when calculating phase fails during clk registration
>
>  drivers/clk/clk.c | 119 +++++++++++++++++++++++++++-------------------
>  1 file changed, 70 insertions(+), 49 deletions(-)
>
> [1] https://lkml.kernel.org/r/20191001174439.182435-1-sboyd@kernel.org
>
> base-commit: 5df867145f8adad9e5cdf9d67db1fbc0f71351e9

