Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0EBDC04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 15:56:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2C9A20848
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 15:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C9A20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbeLCP4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 10:56:06 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:41614 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbeLCP4G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 10:56:06 -0500
Received: by mail-ed1-f51.google.com with SMTP id z28so11163991edi.8
        for <linux-clk@vger.kernel.org>; Mon, 03 Dec 2018 07:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAnxLB+TJ6bHatdarlSwB2K3TfkjfM4vuOINtj6TAao=;
        b=Hv87fxZVBCjzGnM1tXUUVYv14FLBCqZMg799GYGD9cF0eDqwdv0Elm8/pvNHMJamG6
         R95JaLiNdKjPwgWILaTb40j04Ff9eFt2QOBMAmnMCmZs7pHkaaDZ/0YrPpITeh8aoMrm
         EvfCsSh6XQXkWyhLDR1WKLkp2GDN5wnwUVKOjQ3JvQwaHSF9NgEoLKeMfjclmUJZ7RfY
         wOoH9TC3yDd8DICVrKIdWnOETfKZy31rb1/4u7f06aRFZZEiPHChZPkQoWYEwMs2zUtE
         HJIfMTa0WkQjO9UGCqu2AZ8Y55XE3wNzINDJNJxUJICwZ0fIqFVhefmLpyggLgKD1nTk
         kZ5w==
X-Gm-Message-State: AA+aEWZXhljoVP7+lJ9/Pn37PngQkB0KpUwRyUgk9lP9xP4BXcp/kTN+
        iJT5rBTrPSAiYXJ8HYf99B8GiUC5rGhKbQ==
X-Google-Smtp-Source: AFSGD/XmehTSJgzD232A0VnecxrMjUpW7z+eYinnQOZohFQb9SOldpr6S/jRw9/sgTiv0+A75btSgA==
X-Received: by 2002:a50:9724:: with SMTP id c33mr15219721edb.288.1543852561306;
        Mon, 03 Dec 2018 07:56:01 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id t21-v6sm2280092ejk.33.2018.12.03.07.56.00
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Dec 2018 07:56:01 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id s14so6428274wmh.1
        for <linux-clk@vger.kernel.org>; Mon, 03 Dec 2018 07:56:00 -0800 (PST)
X-Received: by 2002:a1c:2382:: with SMTP id j124mr8653160wmj.14.1543852560391;
 Mon, 03 Dec 2018 07:56:00 -0800 (PST)
MIME-Version: 1.0
References: <20181130053328.24183-1-wens@csie.org> <154356169535.88331.6559008649310425840@swboyd.mtv.corp.google.com>
In-Reply-To: <154356169535.88331.6559008649310425840@swboyd.mtv.corp.google.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 3 Dec 2018 23:55:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v6507htA6HGn2HXgSHyWLp-Ny+XZiGQ1XFHU_CYyHhNYYw@mail.gmail.com>
Message-ID: <CAGb2v6507htA6HGn2HXgSHyWLp-Ny+XZiGQ1XFHU_CYyHhNYYw@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: h3/h5: Fix CSI_MCLK parent
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Nov 30, 2018 at 3:08 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Chen-Yu Tsai (2018-11-29 21:33:28)
> > The third parent of CSI_MCLK is PLL_PERIPH1, not PLL_PERIPH0.
> > Fix it.
> >
> > Fixes: 0577e4853bfb ("clk: sunxi-ng: Add H3 clocks")
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Merged for 4.21. Thanks.
