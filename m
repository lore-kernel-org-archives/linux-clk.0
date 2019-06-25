Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD61C48BD4
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 08:56:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3DAD215EA
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 08:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="swXBv7qi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730978AbfFYI4G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 04:56:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43703 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730905AbfFYI4G (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 04:56:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id p13so16870594wru.10
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=cfaOZkANMwu44tL34oJmOKtMH5CsINC0TJ7SIxnqEAA=;
        b=swXBv7qi9HZUpONZ6YkxoWLj5Qxn/BP6RLInNEY/laOVxaa1Xx82Ylp3QzQYIqg7LS
         76K3qwaxIEfb9y21jCPWZGaO0H39E/FjGG4DI0ox4fFuXsckYZZmmDKuOj77vucYjNT6
         62+z6hIsaZI0mWoSrl8pgxjt2lsmXUqle2ugzsFMdtmp/NMjetm/AF+iDMB5IliGyakn
         aotsGXY+y6L692CxaeITKJ7YYDP/7rxXeQ4ettcRas9N6hpN+H5w7JAdenj7iKPlvQPz
         u1aRob71mk/MOPyNeAhNfS6TCKWvhk15NMOkZJUQ+pF+Ku2YDeiwvkAQGzRPWGLyU9Lz
         todQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=cfaOZkANMwu44tL34oJmOKtMH5CsINC0TJ7SIxnqEAA=;
        b=j3+mN1/QlW4IuEGZk/2QWZu2/Mvfda5keR9OFTU7co18OIZbTq0mDi1pWU982iUHx9
         4ONPEZiimWNQS6PP5OqstcPl5yL4yVHAxOYeDQi99FdUioUd/P8WOO17c4H0LbR11dm8
         foKkULNvdhB3T2vG7+maHVGOXTnmORXIW//m4aQDKQQQyzzOFACucZhnefMD92VlOJ1b
         3kYCnjGp1BSq0qC9NXF5f8BfTyMwsDVPLJdWjSwIRd50H9zFfW828BRs+48Ii6Tx2+nt
         vmEl2A8T1SXu2JnADvj6S0TAkupUEp1OH6+FySq33dsLTzloBs/qjF4HiNwYOZEecQfK
         OqYQ==
X-Gm-Message-State: APjAAAWZHR/Bmw5YD+ooTwb3w8IHY+NnXq+VnWec+LgZZxcEX9dYsafc
        SJ4EpYNBoqELAyJHIVRWhUQMww==
X-Google-Smtp-Source: APXvYqwTrpHPSGEW1+VvK0lRPAdQP0t16ak5m/1igVT58l6NUTGkndJAhuJUwhdLzQnH2EiAQEqE4w==
X-Received: by 2002:a05:6000:12:: with SMTP id h18mr49242077wrx.29.1561452963946;
        Tue, 25 Jun 2019 01:56:03 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e21sm23970154wra.27.2019.06.25.01.56.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 01:56:03 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list\:ARM\/Amlogic Meson..." 
        <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] clk: meson: update for v5.3
In-Reply-To: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
References: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
Date:   Tue, 25 Jun 2019 10:56:02 +0200
Message-ID: <1jv9wuyrfh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 11 Jun 2019 at 14:38, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Dear clock maintainers,
>
> Below is a request to pull Amlogic clock update for v5.3 based on the fixes
> we just send. This update add the init() callback to the mpll clock driver
> as discussed in the previous cycle. As promised, the rework to register/deregister
> will follow.
>
> Apart from this, we've got a fairly regular update, adding a bunch of new
> clocks to several SoC families. It also adds support for g12b derived from the
> g12a, which explains the significant line count in the g12a file.
>
> The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>
>   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
>
> are available in the Git repository at:
>
>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1
>
> for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:
>
>   clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)
>

Hi Stephen,

Could let us if you intend to take this PR as it is or if you are expecting
any change ?

Best regards
Jerome
