Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E1EC433C1
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 10:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8061561584
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 10:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbhC2KTJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Mar 2021 06:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231761AbhC2KSz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Mar 2021 06:18:55 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A049AC061756
        for <linux-clk@vger.kernel.org>; Mon, 29 Mar 2021 03:18:53 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso11746799oti.11
        for <linux-clk@vger.kernel.org>; Mon, 29 Mar 2021 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=59bVk1U3eAVs4AcTUq5Uzd81CXfJ27eB6Tb5HoqJbm8=;
        b=O7z2KPqex9OWV7rS0vW975GuYu72swPQwIu0JStsGX+5blMKnxF4JEN969+cGkQcUx
         RRAIZCaWVM6UvKRHQZPbSAZAMbND8NkoPZj/pPMFhyPbCIod4KjhS5UC4fhJK4swTo8L
         eDRakI0I851rDSdJIeBVLxdGygwSBLJYHfMkF3i8SiQEgpgJVGIKsxXFNADOE8H2fF5L
         PARIy4Jj0eTGdOO6EJ+FeENXgGnjvxDjY27eIKTOSzZaakkWxL4PBK8iEtxg00HeeAWC
         fo6/CJzNn2hlMDiGOXpFAH/LcDvVyL7OpeoE5X3fIJ7aXM/HOL+Tc4X7VUUQBJSn5354
         g8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=59bVk1U3eAVs4AcTUq5Uzd81CXfJ27eB6Tb5HoqJbm8=;
        b=Nd5x0aXun4JgAB1vRhdJzNjaxfgK5JGpr7CxOPEky3ee6QVdnW/qSafBEJKsHtAMVX
         yjjPbP7rxoPqrQEB4pIVcWnawN1lmm+eM6NmMucXUmsTZWGg6F+I0JRizhPRVYVhFCLb
         AASSFzwLt3OGAFHyhED7fUEiT3SYP/tQMRcn+JJXDPgNkvk7kNz9ypSRkkFRg/sspws7
         Ow33AAFhTbXeUCAvhKQnzq89QUA4b3hkHwAHLtrkYwBvjK0bMM45mkdiWKSryElnapw1
         T50m3aXFcOfTLfYMc4wn9CHI7qfbUlOZR+lGvRIL627HUcaHvt9bzPokxoPyExlcs3Xq
         1Oyg==
X-Gm-Message-State: AOAM531tH7cuOmTZAkwgQvXw+5IHeb1QmLuw9GrOtlRwXe0xhZjS1QoJ
        YGyLxA8jWFK+EyV3Bl0Zt7NkRHLoXrT7/iGXnV9hz8Lkl3nW0w==
X-Google-Smtp-Source: ABdhPJzlGZ/D+OmhIRfsTVba9K6RjVylLGLXIUf2URPu2C4G3q7Koa/dAuoNoQPZI+ZZ6IltV4gHAZx065pDvYORC7g=
X-Received: by 2002:a9d:6249:: with SMTP id i9mr22150688otk.166.1617013133098;
 Mon, 29 Mar 2021 03:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com> <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home> <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home> <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
In-Reply-To: <874kgyfetu.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Mon, 29 Mar 2021 18:18:42 +0800
Message-ID: <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 26, 2021 at 5:24 PM Andreas Schwab <schwab@linux-m68k.org> wrot=
e:
>
> On M=C3=A4r 26 2021, Zong Li wrote:
>
> > 1. Boot on openSUSE-Tumbleweed-RISC-V-JeOS-hifiveunleashed.riscv64.raw.=
xz
> > w/ plugging ethernet cable
> >   - It seems that I encountered a different situation with you, my
> > system hung up and I didn't see the boot message you mentioned yet.
>
> That's exactly the issue.  The process is stuck in D.
>

Yes, I could get the network problem by using the defconfig you
provided, the system hung up when executing 'ifconfig' immediately
after installing macb driver module, the network can work by only
reverting the commit 732374a0b440d9a79c8412f318a25cd37ba6f4e2. But the
network is fine by using the mainline's defconfig, this is a little
bit weird, I will check that and try to find the difference.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC=
1
> "And now for something completely different."
