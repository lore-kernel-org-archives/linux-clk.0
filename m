Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CA7C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 17:14:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B57520643
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 17:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="tzQNLFE7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbfCKRO2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 13:14:28 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36049 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfCKRO1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 13:14:27 -0400
Received: by mail-lj1-f196.google.com with SMTP id v10so4800365lji.3
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 10:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tm2sboZ+m13IuloFkRzB7RkPN72xfHg8nIovqn8OW6M=;
        b=tzQNLFE7DyCxKE81v72sPyCg+S8APQYVucN5HwP1bv+mSV7YPCEF8sOdIZGcsfIcH7
         dwtxS5nknb98SFjLlskAI/a6rl/2N7IUeQzP+Ivri3w+1Zhuspa416XaLtRWBkeFfxw5
         dPAB99nue9BeDOKt5MjF26nM8Grr3ypVX8UUDT4p4G4bMFT7xDQfPTbXAgNjuX+BZsvL
         KqaCn+FPXdrymsyWFKStuPbehf3wIZjexRXrnO9HsdH5B/3oFbuTsyjWsYDCBemhti5c
         Lm7nAjZyZks+YajXpMJj77s1Xq0cyXUIA/ZYtmOamTuzoSdWvXeakM1+bHaxv1Civ+p0
         vP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Tm2sboZ+m13IuloFkRzB7RkPN72xfHg8nIovqn8OW6M=;
        b=XknJupRNmC8KkWUJhlD7I2FJsIy/4o7vIE1OPSd7M4UQWbkrtcUdzCbrE4WNXiVG6Z
         j65hSG8aQnOtbim3k6vSbsRkiT2Aa6KUSrwXhcRGiY+voPaxpH2BjFXWNwW4MhFqaRXR
         lP6Iqy0J+BkeJ1wea6aXSLPwvHeTRF3WYTrS+QcmtoAosguMDP4zVfVK562QR+Gq0tv+
         NxVTZsMSfZB8x8pQWnbb3tsOZOtPk7oDGaUk55ewk47Fxa1LzlcGOZoie5JBANE8DX2X
         hvEa+bAHIyBvKtMNjWUSclDckhJEIumrEXN+tOhVKcjmKuY0uHXJTcQTxkz81UdWVcCD
         xKLg==
X-Gm-Message-State: APjAAAUf0+PpllgIkr0G4Me+JoFCOzujPl8y0JUVaN8BC9qkLGQoDSb6
        1xO8rRhIF4+ZsY28gqQGp10uBwRtLis=
X-Google-Smtp-Source: APXvYqzkgHVpwEUQven0sKqYYjA9A1fQspIOm2/aYWBU64d5Ly1uiTt6WRcJEaYNHceoopOq9saxSw==
X-Received: by 2002:a2e:85d2:: with SMTP id h18mr1237923ljj.69.1552324465349;
        Mon, 11 Mar 2019 10:14:25 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.87.168])
        by smtp.gmail.com with ESMTPSA id t81sm515163lff.21.2019.03.11.10.14.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 10:14:24 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] clk: renesas: r8a77980-cpg-mssr: fix RPC-IF module
 clock's parent
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
References: <f1c53dd5-2dc5-9f11-44e3-8e222ed21903@cogentembedded.com>
 <ebc41558-2a0a-bf6d-05df-077e3c769344@cogentembedded.com>
 <CAMuHMdWxkM2YbLqyz3BemcVJphWYSZi4ejuLiG+fpfDdnuU4Uw@mail.gmail.com>
Organization: Cogent Embedded
Message-ID: <981d0e06-76b8-fe69-1a8e-91661ad0faba@cogentembedded.com>
Date:   Mon, 11 Mar 2019 20:14:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWxkM2YbLqyz3BemcVJphWYSZi4ejuLiG+fpfDdnuU4Uw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/11/2019 12:30 PM, Geert Uytterhoeven wrote:

>> Testing has shown that the RPC-IF module clock's parent is the RPCD2 clock,
>> not the RPC one -- the RPC-IF register reads stall otherwise...
> 
> Perhaps... Or something else is wrong with how the RPC driver uses the
> clock hierarchy.

   Yes, explicitly enabling RPCD2 did help as well.

> According to the docs, RPC clocks RPC-PHY, and RPCD2 clocks RPC-LINK.

   I've also read the manual. Note it's not that reading a PHY register
hangs the kernel but reading CMNCR...

> Currently nothing references RPCD2, so it is disabled automatically.

  Only on V3H.

> If you make RPC -> RPCD2 -> RPC-IF, enabling RPC-IF indeed enables
> both RPC and RPCD2.

   Sure, it does. :-)

> Perhaps the RPC device node does need a reference to RPCD2?

   Looks like that wouldn't hurt either...

> Is this also the case on R-Car V3M, where RPCD2 is not controlled by the
> CPG, but by the DIVREG register in the RPC-IF module itself?

   No hangs were seen on V3M, despite the RPCD2 clock remained disabled.
The RPC clocks on both V3H and V3M suffer from a lack of clear documentation...

> See also section 62.4.7 (Frequency change), which does not have a
> subsection for V3H, but it may be impacted (changing RPCD2 causes
> an additional read of RPCCKR, satisfying the read-after-write requirement
> documented there).

   Hmm, haven't seen this item before; it looks like we can't use the standard
divider component. BTW, this section in the 1.50 manual tells to use the soft
reset on V3MOK. OK, I'll investigate this...

>> Fixes: 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
