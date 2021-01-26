Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF5FC433E9
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jan 2021 00:28:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D890B206A5
	for <linux-clk@archiver.kernel.org>; Wed, 27 Jan 2021 00:28:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388246AbhA0AV2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 19:21:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30802 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388502AbhAZXXX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 18:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611703315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FFsgQkQMHGcNuO7prFnbNLIMkPeBzSiQZrxd3POXfNg=;
        b=Kihxvzlqq1MbbO//yqVeXlI28T68f/yMLOkgQLQGqwxAr3EC59yoyeuZIJ9ki1NeL6VLbk
        Jt72GxB8vjukeVG2vsZFYMp/hZYK+W1K1tKwmbwafkvMCQgb0tR2ZI4vaM8cYi9a2x9fZj
        ZO4KoaXtLKXLUPD2GTa81ZV4ukjrg8Q=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446--3rOrXJSOJqE2MGOo6GtNA-1; Tue, 26 Jan 2021 18:21:53 -0500
X-MC-Unique: -3rOrXJSOJqE2MGOo6GtNA-1
Received: by mail-qk1-f200.google.com with SMTP id p185so142212qkc.9
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 15:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=FFsgQkQMHGcNuO7prFnbNLIMkPeBzSiQZrxd3POXfNg=;
        b=q+ZVb1Ai907050F3zFJo5A9DSI3OJ0RjwZhOgXto01RDUJylL0HDgA3n2Bm2yN5r9S
         wavTCOJvBjMHoHMeT3qMpKOJGZn79c8p5hXFvGxdojv0Jw/A8kFKhr1EXA9awfiyYqU/
         Da39dkxbTx/tj61mZgWCW4KcaCYEFu8EjmMJQkz3KK31CVxmed8W6OpW2YVbSYeGa2ep
         GxkDEnp98emGfZCQ5h8xoVlY8U4UAqP0cj3KQ/+LozlWhsY4YsMunJ8YXGpcCvvknz7J
         4Mr/8yNWBAjurVOQX2Y37boHarfyaXD9FPzjzQbNPqYASEpiNUgxufmyib/wco2bp2nH
         zcZA==
X-Gm-Message-State: AOAM533EqfUyB7pWz616GR0orQH/2QITQDp64kEvT6R3ioCA1gZAhzRl
        +od7wLd2CSyOeZercBqu9r9/02vh0CLf5AH7qs6vM+8upVNNmE/l6Bqs3StoxVtdEq8tjNmFH2R
        l1yZa4TQzyGqZzwwNkVN4
X-Received: by 2002:a0c:c384:: with SMTP id o4mr8011137qvi.21.1611703313446;
        Tue, 26 Jan 2021 15:21:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQwxGlyfMcY1NOcyyinpE4uDbuVGu0DgI2XyVdUzWX/kxECSPbaveR0jaQIYaDyMXFFNGuVg==
X-Received: by 2002:a0c:c384:: with SMTP id o4mr8011119qvi.21.1611703313228;
        Tue, 26 Jan 2021 15:21:53 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id c12sm154500qtq.76.2021.01.26.15.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 15:21:52 -0800 (PST)
Subject: Re: [PATCH v2 0/3] clk: clk-axiclgen: add support for ZynqMP
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        lars@metafoo.de, linux-fpga@vger.kernel.org, mdf@kernel.org
References: <20210126110826.24221-1-alexandru.ardelean@analog.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <eba46db2-b528-0f6f-7e23-f61fa3e265b2@redhat.com>
Date:   Tue, 26 Jan 2021 15:21:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210126110826.24221-1-alexandru.ardelean@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 1/26/21 3:08 AM, Alexandru Ardelean wrote:
> Previous set:
>  https://lore.kernel.org/linux-clk/20201221144224.50814-1-alexandru.ardelean@analog.com/
>
> Changelog v1 -> v2:
> * split patch 'clk: axi-clkgen: add support for ZynqMP (UltraScale)'
>   into:
>    - clk: axi-clkgen: remove ARCH dependency in Kconfig
>    - clk: clk-axiclkgen: add ZynqMP PFD and VCO limits
> * essentially removed the 'adi,zynq-axi-clkgen-2.00.a' compat string
> * removed architecture dependency on build for driver; the driver should
>   be usable also on PCIe setups
>
> Alexandru Ardelean (3):
>   clk: axi-clkgen: remove ARCH dependency in Kconfig
>   clk: clk-axiclkgen: add ZynqMP PFD and VCO limits
>   dt-bindings: clock: adi,axi-clkgen: add compatible string for ZynqMP
>     support
>
>  .../devicetree/bindings/clock/adi,axi-clkgen.yaml     |  1 +
>  drivers/clk/Kconfig                                   |  1 -
>  drivers/clk/clk-axi-clkgen.c                          | 11 +++++++++++
>  3 files changed, 12 insertions(+), 1 deletion(-)

This whole set looks fine.

Reviewed-by: Tom Rix <trix@redhat.com>

