Return-Path: <SRS0=je5o=EJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03E0C00A89
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 01:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4887722243
	for <linux-clk@archiver.kernel.org>; Tue,  3 Nov 2020 01:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=vt-edu.20150623.gappssmtp.com header.i=@vt-edu.20150623.gappssmtp.com header.b="BCTlhAur"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726312AbgKCBpI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 2 Nov 2020 20:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgKCBpI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 2 Nov 2020 20:45:08 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67417C0617A6
        for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2020 17:45:08 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id j31so3945635qtb.8
        for <linux-clk@vger.kernel.org>; Mon, 02 Nov 2020 17:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:in-reply-to:references:mime-version:date
         :message-id;
        bh=cjxoNYxbu1+SaqzoPnce/Hs00JITYfxQWTJFm6SDY4M=;
        b=BCTlhAur6u1VziO20eWewM72Cq99of9KTcxc+w2vZ0WNhghROr6RgNmHg+bPeyfjVq
         pKzPI8wSjYmyK1uhNnfQmGkrThVhveQat+Ol8Hm1oWwu/2JJWw2JbbgWZycUMjDpZkPa
         litzC4Wx9viykurVhIazVRf/sJXFLJkBfBYP3ws5KMXjzPxpMXnDdPFH7tdm0SnAxTBy
         y6YGezR6s7odPABA7MAdIfkKvQYoSYSEZ4qL01qB5WUNIlCqCc0vxNtyPVQHyrPhGOWO
         zf7FzkY2LzCk0NX//DLRcj9k9W32HfmlowLemoQhispnI4jEr3gqHG5m5HZsXd72SEkO
         rciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :mime-version:date:message-id;
        bh=cjxoNYxbu1+SaqzoPnce/Hs00JITYfxQWTJFm6SDY4M=;
        b=Rm0qg5EA9r2+PWu2IsIy+20NTCA7i2JfHqbuOl0Bx/JeIq8ZT+r+PndiERdzUKWMxV
         nNAWXo3b6kwZzXurfwpITWVZGtTgZJbrAvcw8P8uQdjARRiWSsFWmOKqSg2wc+vjHqbu
         lgGRejev7KXKwdQDXWogmdugPakkltFKbCn04BApSJP/dST4chD1/iAr39wo9YF1vn6x
         eRvk8zGof2MK+MeYlyiC4/1c1lzRV5jiEBCt/aKgkRika93VKWfRzeAYYxWUPuZ5kzi4
         JO55lwvbhChC0VCMCnMMqo6cZ4oDTzTxpwLqCLDhc856eIx2Z3Z9RHprxxXJCxxbr3ML
         J27g==
X-Gm-Message-State: AOAM530ZzEjuz69+2+x+QxnHZN4id2soF2Utk/AxNSQp8rkx/FkOeKol
        Dr2DQKzXqu2AAqf3+XUhtkEWDw==
X-Google-Smtp-Source: ABdhPJwCA1LA4NwvrUfJpr0a/T2v5OrQWQPArlZUx5JCWifS0MgN7sP370U7d1i6+cV/NQedAx0jwA==
X-Received: by 2002:ac8:7b98:: with SMTP id p24mr16682435qtu.31.1604367907411;
        Mon, 02 Nov 2020 17:45:07 -0800 (PST)
Received: from turing-police ([2601:5c0:c380:d61::359])
        by smtp.gmail.com with ESMTPSA id d18sm7587566qka.41.2020.11.02.17.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 17:45:05 -0800 (PST)
Sender: Valdis Kletnieks <valdis@vt.edu>
From:   "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <Valdis.Kletnieks@vt.edu>
X-Mailer: exmh version 2.9.0 11/07/2018 with nmh-1.7+dev
To:     Shawn Guo <shawnguo@kernel.org>
cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] clk: imx: scu: Fix compile error with module build of clk-scu.o
In-reply-to: <20201102235218.GY31601@dragon>
References: <208469.1604318525@turing-police> <6e5a8fdb-0a02-5eae-ca1f-37df8a454e34@infradead.org> <238534.1604350899@turing-police> <0b61c4f4-b389-c853-6e09-ee603455e583@infradead.org>
 <20201102235218.GY31601@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date:   Mon, 02 Nov 2020 20:45:04 -0500
Message-ID: <253486.1604367904@turing-police>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 03 Nov 2020 07:52:19 +0800, Shawn Guo said:

> It's a driver problem which is being addressed by Dong's patch[1].
>
> Shawn
>
> [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201030153733.30160-1-aisheng.dong@nxp.com/

OK, We'll fix it that way then.
