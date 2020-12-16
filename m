Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E2BC4361B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 01:43:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA37822D75
	for <linux-clk@archiver.kernel.org>; Wed, 16 Dec 2020 01:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgLPBnl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgLPBnl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Dec 2020 20:43:41 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E8CC061794
        for <linux-clk@vger.kernel.org>; Tue, 15 Dec 2020 17:43:01 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w5so15708506pgj.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Dec 2020 17:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=DGe/kRe3MPa9vd1aCEWGdtZxWk4QoHI77u2B0aTPVnk=;
        b=QuNnQeUg3VuTh7gBLVXdIVgxTypFlOGy6oePrOx2wgkTrttR5ak2rIv7STrsRFoatP
         fjv1prlnss/4pkuopcEJa1cNeW1zThsNa4mGSOMHXhBDRnZQwEr/+7Z5BbYGhxMkl1Qp
         7NEMjOpUCkzq2liC0dhW38IdMnm+WmqmUiM0WVEU10mnaF6MYa3Pm3xhDMSfyK3XUgql
         XnTeaoxOZo3m2wf518FOBMf03pVB/ns4Z1qGHCUE+oyjlUNhogEUlthqZ9QKuoT6ssCx
         HY1NaeRuF8kGFlsZRtVDrPPqbMZHgm+Rh+UbiIe+7zDwGsHMSx05rWiz+uM6g4TRe4St
         4v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=DGe/kRe3MPa9vd1aCEWGdtZxWk4QoHI77u2B0aTPVnk=;
        b=JlWIGy0RyYAgCtiFe0DMOIOUlabHTjp5ruMQ93AZwxYxKHY7fDxWZhzqY1G7asaQHh
         87I6TQ0w8c69noH4nQVOZhPArVX06xotw5Q280t2f6Ge22ok5NzIX2ilzSTd4YCEFALx
         lK+QBx/I8y1QcHHJWKKyFTtcec2AZ6eK3+ynI0saZGmFQneG0gbM3d1K1IUd/wBwEEI4
         47y5Yino91mMojV2v5Rhj+d34KkO5j/1fBlnb+6ew8qTv481IuMCx0IfDWyTvDcsamgd
         AUgRYwAJK3vmrpXwSQdJQ2jUn59uUQZKj+8soha4sMVour+5ABArJPQLtZNTxL6uYx6H
         AktQ==
X-Gm-Message-State: AOAM530WQk5HkEhp0A3OrEDMUR8uBzZYnzHaJmLfqYK6kzoCL0le5661
        mOoVscxdp90LufPwM8eQIvhZWQ==
X-Google-Smtp-Source: ABdhPJyD+Cum/1oT2A0wUWaIVXeLrYJ3kkq1S47NQ3+eDX2q876+qo+YidZox/GyTlXMcM5A3tbvNg==
X-Received: by 2002:a63:4950:: with SMTP id y16mr31128740pgk.415.1608082980594;
        Tue, 15 Dec 2020 17:43:00 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id o11sm154817pjs.36.2020.12.15.17.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 17:42:59 -0800 (PST)
Date:   Tue, 15 Dec 2020 17:42:59 -0800 (PST)
X-Google-Original-Date: Tue, 15 Dec 2020 17:42:58 PST (-0800)
Subject:     Re: [PATCH v8 00/22] RISC-V Kendryte K210 support improvements
In-Reply-To: <f47e089de657073d09ee5407af690e8f97bc6e95.camel@wdc.com>
CC:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, sboyd@kernel.org,
        linus.walleij@linaro.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, linux-clk@vger.kernel.org, seanga2@gmail.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-bdf9260d-0bbf-42e5-b32e-c75b870227b9@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 13 Dec 2020 00:06:22 PST (-0800), Damien Le Moal wrote:
> On Sat, 2020-12-12 at 22:04 -0800, Stephen Boyd wrote:
>> Quoting Damien Le Moal (2020-12-10 06:02:51)
>> > 
>> > Finally the last two patches updates the k210 nommu defconfig to include
>> > the newly implemented drivers and provide a new default configuration
>> > file enabling SD card support.
>> > 
>> > A lot of the work on the device tree and on the K210 drivers come from
>> > the work by Sean Anderson for the U-Boot project support of the K210
>> > SoC. Sean also helped with debugging many aspects of this series.
>> > 
>> > A tree with all patches applied is available here:
>> > https://github.com/damien-lemoal/linux, k210-sysctl-v20 branch.
>> > A demonstration of this series used on a SiPeed MAIX Dock
>> > board together with an I2C servo controller can be seen here:
>> > https://damien-lemoal.github.io/linux-robot-arm/#example
>> > 
>> > This tree was used to build userspace busybox environment image that is
>> > then copied onto an SD card formatted with ext2:
>> > https://github.com/damien-lemoal/buildroot
>> > Of note is that running this userspace environment requires a revert of
>> > commit 2217b982624680d19a80ebb4600d05c8586c4f96 introduced during the
>> > 5.9 development cycle. Without this revert, execution of the init
>> > process fails. A problem with the riscv port of elf2flt is suspected but
>> > not confirmed. I am now starting to investigate this problem.
>> > 
>> > Reviews and comments are as always much welcome.
>> 
>> What's the merge plan for this series? I'd like to apply the clk patches
>> but they're combined with the sysctl driver so I guess I can't?
> 
> Not sure. Palmer ? What is your plan for this series ? Can you queue the
> riscv/DT pieces for 5.11 ?
> 
> I will post a v9 to address Rob's comment on the sysctl and fpioa drivers
> binding doc, not other with v8 changes beside that.

I guess I got hung up on that bultin DT thing, but I've sort of decided I don't
really care that much (though I guess I didn't decide enough to reply to the
email...).  I don't think it's 5.11 material: we were told to be stricter this
time around because of the timing, and I'm trying to sort out a boot issue
that's manifesting post 5.10+for-next merge so I probably won't have time to
take more stuff.

Also: I'm kind of trying to avoid the whole thing where I take patches that
have a bunch of versions sent either right before or during the merge window,
as it just makes things too hard to keep track of.
