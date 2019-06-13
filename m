Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBBAC31E45
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 16:32:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3A6720449
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 16:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ii3ivdWm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbfFMQcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 12:32:12 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:38425 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730859AbfFMIT5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 04:19:57 -0400
Received: by mail-wm1-f48.google.com with SMTP id s15so9112806wmj.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2019 01:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lMgrbgr5m4Rq383287CDalQy+dWiEqm9D3wZKZJwVy0=;
        b=Ii3ivdWmrHA0L8XZV2P3l5I1A/5IfUpok0nrJ9pPWLa2IWymXolnQquEyavScsIeLh
         Vrl3jl3bKOERQkvJVrPpUPYaMyNg+HdYxS2uMhD+LiemEdRHGl+/Q4hEsbYTrSq8noXg
         iviXzrJYDonmf93KMDsRLuaRX/CVlBZSOFwiGG69Awm0Mq3yUNOAbJ2YO4mAEqoPzl90
         bW7EOuY/IkpRaCSTYd2jCr3s26DtImg58AY53+ELiluZSIBwKujI8SBqnOlYQAisNsCb
         aL8KZ1677LH065FzPs9kvDQmVfr3MLyeluZtqf2RGt5X46B8QKsz5lN5LXoAiEY2bRCA
         CGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lMgrbgr5m4Rq383287CDalQy+dWiEqm9D3wZKZJwVy0=;
        b=MUhQSYpctAaQ9aB93HtQ0x2GJpb2y2DJ2qZH/LXe/5KcHERAXTUeveJGukMZNOCq7O
         JEhcYyCqDZEsB9rmdwRcluxtgWePxPh3u+MSphecyTXzPBJZAkLLDy4Gmx0FUg8Ca5pI
         e2sTk5fZk0xWuXP9BKaBewzcXoC039KqjsS7CAOXnlPf6vR6KMxR97LzInHiQqJTqkGU
         nviF9635B9AbKC9kTHmSBMDVtVUExJl2gAe3B3G61MobEmV0wDmozkhlbfWHKlyemkcY
         dBkwonxHsE21J71HxBRhUd8G8MLOQGnc+iVQn1yACjSDsvS+mhOZ9fA8SyuujDBw7oLl
         rcoQ==
X-Gm-Message-State: APjAAAXj5J2OfuCRW1drGIvLLqM3tzz6Bkh7kTPRL82pLLmT28bp0NMB
        5N75UpdycKpgkxs3pykPkCFgtwHkUe0=
X-Google-Smtp-Source: APXvYqwAhEgTqcc4HsUpnrH3aYRdCJ35vX3Cult1dw2Ys29bWPKwU+d0WEqChPnt/nYzuchsbvx4cA==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr2627651wmh.141.1560413995247;
        Thu, 13 Jun 2019 01:19:55 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l9sm2382040wrt.13.2019.06.13.01.19.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 01:19:54 -0700 (PDT)
Message-ID: <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Date:   Thu, 13 Jun 2019 10:19:53 +0200
In-Reply-To: <20190612230201.3692F20896@mail.kernel.org>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
         <20190612230201.3692F20896@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2019-06-12 at 16:02 -0700, Stephen Boyd wrote:
> Quoting Jerome Brunet (2019-06-11 05:23:33)
> > Dear clock maintainers,
> > 
> > Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
> > These are typos in recently added clocks, the most annoying one being in
> > the DT binding identifier on the MPLL50M which is used by the network PLL.
> > 
> > Regards
> > 
> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> > 
> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
> > 
> > for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
> > 
> >   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
> > 
> > ----------------------------------------------------------------
> 
> Thanks. Pulled into clk-next.
> 

Hi Stephen,

This was actually meant for clk-fixes
We could probably cope with next, but it would be preferable if the typo in the
bindings was fixed by the 5.2 release.

Thx
Jerome

