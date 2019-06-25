Return-Path: <SRS0=Kcvz=UY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7973C48BD4
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 09:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7705420883
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jun 2019 09:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W/ctZ5sK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725921AbfFYJ0V (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jun 2019 05:26:21 -0400
Received: from mail-wm1-f41.google.com ([209.85.128.41]:37102 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731495AbfFYJ0V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jun 2019 05:26:21 -0400
Received: by mail-wm1-f41.google.com with SMTP id f17so2180838wme.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2019 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=/458Fsfbmxm3r35MW4l5JCPflKQAaAPGKlBQ13aGDYg=;
        b=W/ctZ5sKpFFzLmeDLTZeNdA1KRnAT3H/e+0IDSuP05zSFgDWJNknbQJSqU8zh5bjRy
         Hb4A51RLamU36+wFsxxVZ0brdvip6L6rSxRQzNjZ09B0kXdQZd/t3DlIjResWXl/wr7f
         6OKNSNY9XGBCfQN9ZOIB/5Qmxm5g4HXxMcRAWZrc/ksWHbfd96X4CBlBitTg7S+fQjzk
         9o9gyTb1GbbgUg1zCRax/pWViIPPALnts1xRSZAdzymSyMXIajjpC1Wjg84UcYU2HT29
         9UauFzSCwlr6pzQwDL0ob7TEXs10/YDeJrj9JxfkXVZI8rgc1bwyXl5n3k0kDoWsCYlB
         ZkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=/458Fsfbmxm3r35MW4l5JCPflKQAaAPGKlBQ13aGDYg=;
        b=CcrV6AY+bKDlOvGEseWLLAqlNmfpqqBXw1vQ7I6an8FRBisH0hwt6wpmRi11736gII
         7PwoXElwnMp+DyvQWGzle4vyo+H1nOlddReRnGVIvI2g3FNMufG8EYjwuZeC9LX/56MD
         QiFpF1hiGi1hZhg0IiE3XhteXGmKZxKS8ZqUzT66qSKS5dgTpMHcptK11aW6oizRNMuk
         UMyY9CTO7iqgMIDatbZ4n12mh6PehmDnzot7O5L1hzcsginzaEiA6ZtUKTNcIr2X08ft
         CN9LyUFNTsWZIwYcuTPHOnq7e5aQseaIjtgH40qN7vl3KluztLycUt59WPVuL9SfpmkA
         vZYQ==
X-Gm-Message-State: APjAAAXBsb2MOo7QHuZmwH40zxDT9isQjGgh3/Mk1OxE8pHE5/BLY5fX
        Bai469SAj10n+Z7JHA04GrHu4Q==
X-Google-Smtp-Source: APXvYqxKxw5Ug545jBsBa5P365/JMaSJWj3VKzQDexpDtRW8cZ87UyO23ZxOXVh5oOzKqh7FmzClAA==
X-Received: by 2002:a1c:18a:: with SMTP id 132mr19341185wmb.101.1561454778702;
        Tue, 25 Jun 2019 02:26:18 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a67sm2140439wmh.40.2019.06.25.02.26.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 02:26:18 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list\:ARM\/Amlogic Meson..." 
        <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] clk: meson: update for v5.3
In-Reply-To: <1jv9wuyrfh.fsf@starbuckisacylon.baylibre.com>
References: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com> <1jv9wuyrfh.fsf@starbuckisacylon.baylibre.com>
Date:   Tue, 25 Jun 2019 11:26:17 +0200
Message-ID: <1jsgryyq12.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 25 Jun 2019 at 10:56, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Tue 11 Jun 2019 at 14:38, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> Dear clock maintainers,
>>
>> Below is a request to pull Amlogic clock update for v5.3 based on the fixes
>> we just send. This update add the init() callback to the mpll clock driver
>> as discussed in the previous cycle. As promised, the rework to register/deregister
>> will follow.
>>
>> Apart from this, we've got a fairly regular update, adding a bunch of new
>> clocks to several SoC families. It also adds support for g12b derived from the
>> g12a, which explains the significant line count in the g12a file.
>>
>> The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>>
>>   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1
>>
>> for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:
>>
>>   clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)
>>
>
> Hi Stephen,
>
> Could let us if you intend to take this PR as it is or if you are expecting
> any change ?
>
> Best regards
> Jerome

Nevermind, I missed your reply.
Thanks for merging.

Regards
