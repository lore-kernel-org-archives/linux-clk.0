Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CED8C433E6
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 08:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0117522CF7
	for <linux-clk@archiver.kernel.org>; Mon, 21 Dec 2020 08:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgLUIl2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Dec 2020 03:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgLUIl2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Dec 2020 03:41:28 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCEFC061282
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 00:40:47 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id 186so8174155qkj.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Dec 2020 00:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BjslaZR1qcQAnQhxnA6ymSaKB4vgQuxdF9VxZC0FLCk=;
        b=u/RwtavghNtpbWjqn+ZMYpE7O9+RB8LVyc2IbNi7pmz6ot+akq/hJHztjwYhNik0Gl
         COPMnSkotlGHlo5Xzkabr0ZsWmDEhF8h9z/6y3ehKTorOYS43ua0ucldVnE8LARMQZz9
         Vh+oUD/RtD3u6uxp3RjF/f4K2MY4eqBtvp8o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BjslaZR1qcQAnQhxnA6ymSaKB4vgQuxdF9VxZC0FLCk=;
        b=ZWux+M/XAHDMLy0DiNng3Hfn1z/mwTD2MGll+lrBHCCGMCw/bw4IhTC17vWJeJM0rS
         7W17/xhFwzSOrFcFiPdPF4mNnREB5QkD6N6Lrat7E8E6/DdFLr8o0cUy3VW3UsmCw+tE
         /ZL2YwVWzJSk4e0Xh7hTC5qsHCecDiskJb7n+GYtabaQOi/FNCJpnRbucsHBiYzm5h1y
         gQjv8mr15exut4m+x9gRj1R3nmG9xrLugvXiEKD/Iln1GwxFn+BDGd44BSLbbwnTdBwL
         w/sSPWUhrVaUQMKJAax519x42jGlGMkp9fueDIEn4QLUduqU3BNg/dcPNWC6bm7tjJlt
         m4oA==
X-Gm-Message-State: AOAM533VxIJeAPYrNXS6rlVaZnUixQfgDB9vbOTUyCWpXiRTClkHFzZx
        y9XdaDuyjZ5qXi4fRq7cx1zp8cWhSDMm7O5CgozB6Q==
X-Google-Smtp-Source: ABdhPJw7oJ1bLp7G9VRztPrkOy9xTQDXqiw+K3cBPPPBg9PPUueYjcIQ1KRQLQjazbl4Ws56poVKheeZAOhjw/5+vAA=
X-Received: by 2002:a37:c89:: with SMTP id 131mr16379078qkm.468.1608540047125;
 Mon, 21 Dec 2020 00:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20201114135044.724385-1-daniel@0x0f.com> <20201114135044.724385-4-daniel@0x0f.com>
 <160843899675.1580929.13271525932327387602@swboyd.mtv.corp.google.com>
 <CAFr9PXmAe9o5KtTG58twpumWi3A=7YfsM7b7pOwRTk1f=jCKQQ@mail.gmail.com> <160848978734.1580929.11702930284423878688@swboyd.mtv.corp.google.com>
In-Reply-To: <160848978734.1580929.11702930284423878688@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Mon, 21 Dec 2020 17:40:36 +0900
Message-ID: <CAFr9PX=_uaBwB1tWzgmAxZC6hP16TMc4ZQy=5uAKGBoxtWigGg@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mstar: MStar/SigmaStar MPLL driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Mon, 21 Dec 2020 at 03:43, Stephen Boyd <sboyd@kernel.org> wrote:
> Can be part of the same series.

Ok. I have added a small patch that adds devm_clk_hw_register_fixed_factor().
I'll send that in the v2 once the clock names issue is resolved.

Thanks,

Daniel
