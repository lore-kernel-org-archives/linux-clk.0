Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1BAC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 02:08:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BDD264EE2
	for <linux-clk@archiver.kernel.org>; Thu, 18 Mar 2021 02:08:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhCRCHy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 22:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCRCHn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 22:07:43 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B0FC06175F
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 19:07:43 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id x2so309642oiv.2
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 19:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cBOic09Ji2sUr7lSL2XtTwyzCrDuTRmAgWURvlhvtG0=;
        b=Ndyrp+nu/db70ubdGOP4GiYnNhiVuTIguQnDDahQbyBGQtCYZkmBwbFRrQ0REfFdj2
         dRkdkq4cgKCrJ8QfojElCvKbvTvOOx4+f16SDDder/3dQUojGoLn8e1GIaj4tmukiFd6
         a4QwSiqMelJNPB48P0pbFRbE+P/KM6MHbvLTe+tmVJbozYvI6PqWLDPBILZM84FJTWUW
         lZ00OaIwe0tRb/hp5VmnHACLpUaOuqKvERUGxgLjPUbbSfEwfwmv3yGkidDsLkSHf5Ta
         r4CdscMpJb/kl0YwPHEaEdBuDNozUW8qyLuBqNZRgD94Ul84FkiCjiDZwUJjpYA9dyeZ
         El/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBOic09Ji2sUr7lSL2XtTwyzCrDuTRmAgWURvlhvtG0=;
        b=hZWej19p0Ai+ivltNwGgWz5e761hrfXL1HrP9lDEdSZUlnmSBO2bx7EKEQO8uvo/Zm
         NQejVa7a+LpegQ6I6PCLes+Ewj26+gvwoHt31tguVi6Evlf7dUkJYRZWpt07fzNGkQgT
         QyZgL2ecvXWTGq7cdgaf/LG1vzHTCJASPWfNjaERF2/Tk/mnCGnNeMdre6XPI4xIYMcV
         9ND1Tcf0XbmUZ5ymp2Bw7SA6WTdbuRtTn8SZxqhxTpdT413AYBnfgIMbr2o6V9Xqt6XM
         Y8cq+PRa/cO48q3+HxBN8k2wBUN+84WlqpnhFztWAPRWf1ZIrrf5bKCKkQkw/2t0RlN+
         69NQ==
X-Gm-Message-State: AOAM532VEjdEZIUkFAR9GTjOLQRLwooj5xatOgRTfTIui/obA6qYAT/k
        Cn0k8XiA5asYG3lYCM2umNEkkU7etgu2YrgfYJhWuQ==
X-Google-Smtp-Source: ABdhPJyIpml/gdyY9dmtxfJlp6jCFpscTMsFU75hsrbdN3tUsgB4w6NmCOGaxfR8kIRzYDCQD946laEs77CtO2uP5Ko=
X-Received: by 2002:aca:1c02:: with SMTP id c2mr1352536oic.31.1616033262714;
 Wed, 17 Mar 2021 19:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com> <87v99qyjaz.fsf@igel.home>
In-Reply-To: <87v99qyjaz.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 18 Mar 2021 10:07:30 +0800
Message-ID: <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To:     Andreas Schwab <schwab@linux-m68k.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pragnesh Patel <pragnesh.patel@openfive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        Yash Shah <yash.shah@sifive.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 17, 2021 at 3:45 AM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 09 2020, Zong Li wrote:
>
> > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > clocks than FU540. These patches also refactor the original
> > implementation by spliting the dependent-code of fu540 and fu740
> > respectively.
>
> That breaks ethernet on the fu540.
>

I would check that, thanks for the report.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
