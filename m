Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4966C4360F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 09:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BF9C2147A
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 09:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FaP4sqjV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbfDCJeT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:34:19 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:38466 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCJeS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Apr 2019 05:34:18 -0400
Received: by mail-lf1-f68.google.com with SMTP id a6so11205037lfl.5
        for <linux-clk@vger.kernel.org>; Wed, 03 Apr 2019 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=prPszsBbmwx/bxg7QJVv8SOuvVz8wCiO3hqr7mFKha0=;
        b=FaP4sqjVPCf19RWOvn8rzpVad3wejKpMjWkUK4GBAYd/ZJrg8O1K9mXTfRS7xZ5yqy
         ZBqFpuBXgbDGM3MBtxDGF5pFOwJxUbGgTlNfpaWIqVN1XtzJCAHBwWGjEeq0QingUJ7+
         W7pTTQOqRskl7nlgCu1a/7twa2YxYzu3SpDdOi6oKaHDNtEGpYA3BI8mPDSWoXfbgLUl
         /iy6c7721nTLp6wZXhTRrcGudOp6khqIEl9siywwfp1aP6pdVALKOPjvMmFUj8/JUWu9
         nWo7WIUSnKZpY5Bq+KH7/LbUtHBJUbCPw7WOOscjlxJ9ix8DvekXa7cx4m1S5wptuHF2
         vEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=prPszsBbmwx/bxg7QJVv8SOuvVz8wCiO3hqr7mFKha0=;
        b=T4AfQlbIWFUAm32feBQz2NeovP5O/v80F5qHhDLgCiuXItqmOQmz4aYkFlwW0XLmVv
         a9V+UoxUrvx/TwZD2HqArF+U8ct5B+5kyWHW0WG0jxxLsWkJQwA+PQH6y/hoa/4+J3Yh
         jlTuaqmCsUjrYne5WxdbIB1zxMT4/EIfkqB0IpCMRzuRdpAoXCCeiKxbmFRcxcvth7w1
         inT7okPp/WYqOm8NXcqFkkOe8iJtn7jE0jXrQWZzEFj2DMLRh4A6gHDkjyesNpzLx+O+
         pR8pFttvWnWE6IMeBEd0lIuYC1cG0hYlwS+6Azby6GQ3MYPohCsA6LppAz40K5xp4JHg
         Q10Q==
X-Gm-Message-State: APjAAAVui9SE2lST9uXz8PlKeibWDIoMeLx42N9Tv9AdOu6dhtQRqbRK
        9ojCs7LlEmzZWT64icgrymdgNpf5CtGhgjUA7FF7fQ==
X-Google-Smtp-Source: APXvYqz3A2w81l3tWDl41mv0bzAPQFKTn1VRyJj9013G1Vm/llF1IZXBelE287BZCVtMD38Skp1c/NMa/0em8yBd4e8=
X-Received: by 2002:ac2:54b0:: with SMTP id w16mr5401278lfk.138.1554284057234;
 Wed, 03 Apr 2019 02:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190312152256.35574-1-icenowy@aosc.io>
In-Reply-To: <20190312152256.35574-1-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Apr 2019 16:34:04 +0700
Message-ID: <CACRpkdY5m1vuJKGJxFhPKyi-h_7F4O32oWuobf51x+=gkSp2cA@mail.gmail.com>
Subject: Re: [PATCH 00/14] Support for Allwinner V3/S3L and Sochip S3
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 12, 2019 at 10:24 PM Icenowy Zheng <icenowy@aosc.io> wrote:

> This patchset tries to add support for Allwinner V3/S3L and Sochip S3.

I see there is some review comments on this patch set so I am waiting
for v2.

When we have something Maxime, Rob etc has ACKed, I suggest I merge
the pinctrl stuff into an immutable branch in the pinctrl tree so that it can
be pulled in to ARM SoC if need be (for DTS files to compile for example).

Yours,
Linus Walleij
