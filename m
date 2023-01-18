Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB487C004D4
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 09:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjARJZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 04:25:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjARJTs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 04:19:48 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9841731E11
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 00:36:50 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id k16so3438588wms.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 00:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr06O8+W1sZizWGYArRkHB/dtHQ3jw0hjkts8auzEDE=;
        b=fKXbCTo7EeN6KYvgEFqkRBP599jfdlGXNHPulXDVTXtwYQgIb9kUNcGD6wz4NVkaIy
         zW3xyYU4j1loeH/A1viCrVawCbMpF7dK1vgzleW+Dodigbk/dsdrd3gud563prgSXiFl
         PtkBYMS8olXllMk6nBio3MJ6QVwoXdciL46sAPgQYkRjhlQixRZT+7mRVuMr07+uaCHp
         3t7zid9epPIjUIpegC58ylfbzH5j4qfgsTQfFZ9hnDCEhFSbGTrfOjIFAKEGQig3MOVt
         W7WQM23Hwk9n0u/euB6n/eKNb+lHpI0Q97SY5LZKqnrMJe5VGzLIqpOr3MZuGvi0MU++
         ohPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xr06O8+W1sZizWGYArRkHB/dtHQ3jw0hjkts8auzEDE=;
        b=t9Nj2IAmF22/CABziKy5EcV9/lS850Aum7FNXEoxauAgK6JsbjWHbm7fLdMIiMZf7k
         2Te7UorUxWPFFbK5/CHN6Ovnc+dONJ+uVeuVSATberr47Yt1J5xmcgtH5IS7oqqyrFm2
         GFy9O6yrkkPNBq+qtGyN0QEmVBK3FtC6Y9DRyMa0wl7QIEIc85g1zPK+OBvANy6Da4JA
         Lhl3gPf7HTc53vh0uYX/XP7x4MoIIvdsslTS2qlWcbMRpFI0IdifMxi7kpaLtdMk608n
         UEgbURVCHwqWDO4LBXVCxtk6XpBNLm8IHmfhWS9UCTA9AN7morwSSeh9LAdvaUjLMp+9
         LDwg==
X-Gm-Message-State: AFqh2kplBaVu4fNDG0jGYlkSvk//MV+gK59qvz/Ie6df885H1b/PI3Es
        bJNNN/eGYnAQnfF2walk+fA=
X-Google-Smtp-Source: AMrXdXtKQhT8TnWPOKreOAAUc4AsLxXQUWO2I/Ba6/8kWkOMsTsOStng0OU1TRNqO2COLT0Cxn3hpA==
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id a8-20020a05600c348800b003cf68f8790bmr1763913wmq.11.1674031009058;
        Wed, 18 Jan 2023 00:36:49 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l11-20020a1ced0b000000b003dafb0c8dfbsm1582835wmh.14.2023.01.18.00.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:36:48 -0800 (PST)
Date:   Wed, 18 Jan 2023 11:36:45 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Antoine Tenart <atenart@kernel.org>
Cc:     linux-clk@vger.kernel.org
Subject: Re: [bug report] net: macb: convert to phylink
Message-ID: <Y8evnRh4y6GVMnyZ@kadam>
References: <Y8apdBlLDcqydGcG@kili>
 <167396948997.3401.13412978788541812942@kwain.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167396948997.3401.13412978788541812942@kwain.local>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 17, 2023 at 04:31:29PM +0100, Antoine Tenart wrote:
> Quoting Dan Carpenter (2023-01-17 14:58:12)
> > 
> > The patch 7897b071ac3b: "net: macb: convert to phylink" from Nov 13,
> > 2019, leads to the following Smatch static checker warning:
> 
> I don't think the above commit is the right one, macb_set_tx_clk wasn't
> called while holding a spinlock at the time. This behaviour seemed to
> have been introduced by commit 633e98a711ac ("net: macb: use resolved
> link config in mac_link_up()").
> 

Oh, yeah.  You're right.  Let me send this to Russell.

regards,
dan carpenter

