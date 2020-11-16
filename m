Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6783C2D0E4
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 03:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B73F20B80
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 03:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MhhQtbTS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgKPDOS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Nov 2020 22:14:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgKPDOR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 15 Nov 2020 22:14:17 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 009ACC0613D1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2020 19:14:15 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id w188so17350896oib.1
        for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2020 19:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UmXDsbkMyG3TLtFxXGtOYPD+kRSyJ20ru4tSJVWRVhU=;
        b=MhhQtbTSSKCTKj6L6N6yRgPmAq/Bi9/wSZ0bci2FRMthAssY1VMWTwL66hm6coRqEs
         Py2l3hJl9C9xA3x9NnWIIgxiuLD9tQwzWAQaMYVD7N09XjTVcHxjXCOiuYduIpgc+me/
         HQEWx7PVG7lgZ3jBkOO3N1GMg6zJWpNfLkCEPOU8OrfFpYvGGgo/y73ztBv0N8rhj2xh
         v1bLlewoDC7u+20WshYT0q6THMLY0PPz0cMLObfbqx+T+opfxL+2P9HcR6xHxhxN1B4H
         pItkSGEtq6zosMdnUlI3xlcrrbfZKkYLId3aNORkM5KTi1XsXB8qzNMMvv17D6l8bEwE
         4EeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UmXDsbkMyG3TLtFxXGtOYPD+kRSyJ20ru4tSJVWRVhU=;
        b=fFjqrfnsVVU9O/FLMCgLMM3TVF3mE24lkJQUWhZseXwrrJbMoek2ZxmSezPyg5SnZv
         rgReZ208MpiNNV5inhP7iuY/NWAqRKImwnsV1fZBUvEG3BwPQm3OnHJcbSAziYeKmojd
         htoAE/QcSGlF9ea+h9TJDmHKN0cRq3j5EKOs9EEGC1aeoh/rnx4yHJ/dXv4FYIm7ucr2
         RCa9aCpQEoZJ3VEdWSjPB7JcWBko9bqUinDOPkKcmc3OEY7iN18Hnvy2VJ5gp0Zt67a/
         KOT5s1ntlWye/o9g1RlrgxUpwodwDRcmlPhqdKsXdEnpGdVl8lf5MyL7XYd4OiCTzzRo
         4rUw==
X-Gm-Message-State: AOAM5310cYjLwyUHEn9r8hpnAHqQkmyTLQE5fVeRRiVml05UNyiWKAES
        IDCO5+AGchdZ3W486zFd87UOPGNJZkt7ss/f4JNhvw==
X-Google-Smtp-Source: ABdhPJyDqNE9q4x0eWvYqW5pk63CuMMdkh8YP/75hsj5Hw4gwBaBxi0hKu8Sv2f1F706gKCXsdakj45MtBoi3gehBCU=
X-Received: by 2002:a05:6808:69a:: with SMTP id k26mr8650729oig.140.1605496455229;
 Sun, 15 Nov 2020 19:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111093514.103155-1-zong.li@sifive.com> <20201111093514.103155-2-zong.li@sifive.com>
 <MN2PR13MB279761320CFB61CEBC340B73EBE80@MN2PR13MB2797.namprd13.prod.outlook.com>
 <160516094980.60232.10838645292668930157@swboyd.mtv.corp.google.com>
In-Reply-To: <160516094980.60232.10838645292668930157@swboyd.mtv.corp.google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Mon, 16 Nov 2020 11:14:05 +0800
Message-ID: <CANXhq0oX63CFqUUMqtcoqQavLnTymWAPHSQrfcboQZxznfc+Cg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: sifive: Extract prci core to common base
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Pragnesh Patel <pragnesh.patel@openfive.com>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "schwab@linux-m68k.org" <schwab@linux-m68k.org>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Yash Shah <yash.shah@openfive.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 12, 2020 at 2:02 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Pragnesh Patel (2020-11-11 01:51:17)
> > >+#define RCI_GEMGXLPLLCFG1_CKE_SHIFT   24
> > >+#define PRCI_GEMGXLPLLCFG1_CKE_MASK   (0x1 <<
> > >PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
> >
> > Same here, Other than this
> >
> > Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> >
>
> Please trim your replies

In v4 patch version, I change the definition of macros to 31 from 24 as follows:
- PRCI_CLTXPLLCFG1_CKE_SHIFT
- PRCI_DVFSCOREPLLCFG1_CKE_SHIFT
- PRCI_HFPCLKPLLCFG1_CKE_SHIFT
- PRCI_DDRPLLCFG1_CKE_SHIFT
- RCI_GEMGXLPLLCFG1_CKE_SHIFT
