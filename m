Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B334CC433C1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 03:22:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F35F61A1B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 03:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhCYDWL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Mar 2021 23:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhCYDVr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Mar 2021 23:21:47 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3617C06174A
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 20:21:46 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so643377ote.6
        for <linux-clk@vger.kernel.org>; Wed, 24 Mar 2021 20:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0LhekbqtuOQcfnVYM+NJjvLu7V0qQ67rxH10e15NhwU=;
        b=D8FXZDPcOdvkffEjYsCLmwlu5glW+BEuFYiGaC3gUvLryjkAsjHRZ69IYCpmBI5hBi
         gUbZMtTcuAnjZv8QY77mUAMEIFD4wLCmNsZ7rPXFnTZYBBPrihXWcmF1D4b/ef7ER1y1
         xUsixWI+MxDbixZ9JRO3I0ZEs5ArqAt9ujLF63lHEQv2CnPqxXo7mUJc+90RS+LBVyMi
         ed5UJH4OhHFA9HwORZ+/ymKbz/gj6kI/PNN6qfBTgQAuiOlkjtAm5AMdAyi4VvQ8mHHM
         z7cTI2cjp2Q0SHbrANCk1w7F09KhRe6QXMapAm3kMzQvJahwemJWTEVHfT0AK5AjNnFA
         y/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0LhekbqtuOQcfnVYM+NJjvLu7V0qQ67rxH10e15NhwU=;
        b=dZv7fWLuA6ZMQSQud7eNU88HS2KLXX4/Rfe2ikaM0hnEs2l8SUuWO49592VTy4YLQ0
         epwWWofrmuA01h9US6MwaF0nqCt8NYHRlbR0YZg8mxiWrBLM+ADzN+ZzRimAcadgSc+K
         Hv30xgHLSqr8auE3NXajFm/Ga3gIjKEq2O0ZLhNwGVX1bXTE70fKzstnEh+cyTDGPbbr
         KPiVPdgn7Bkb9FY/t5gjlaiOvUsboTv3onGo6EVYffKOe+ALDhfo5J04EWNJGxNL4rs7
         RyuvnCgDu8mslXmVUoVDMvSSEWXjDORyiU5dT2gEThnVh6h420X6ZzJIHfxenTKsE3Lw
         wTfg==
X-Gm-Message-State: AOAM532RMcsofykH9Zgn7GWGWQPZtZqkalDt+LoGefoU+n0DbQUo8Zly
        tQgRXcIGutna66ic1T7WgksMEUVVFfBAqQQA2ZU2Sg==
X-Google-Smtp-Source: ABdhPJxTgql0rnGsMW0v8subIn7KHnS5/dyuNMyqc1AF0dE5WKZizvZf4u+nCF+96sl4XogDLPJEp2g3p79JZoDdKc4=
X-Received: by 2002:a9d:6249:: with SMTP id i9mr5760502otk.166.1616642505612;
 Wed, 24 Mar 2021 20:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com> <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
In-Reply-To: <871rc4on36.fsf@igel.home>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 25 Mar 2021 11:21:35 +0800
Message-ID: <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
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
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 24, 2021 at 6:36 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> Were you able to reproduce the problem?
>

Hi Andreas,

Sorry, I'm not available past few days, I'm just coming back, I would
take a look at this again. Could you also let me know which bootloader
you used (FSBL or U-boot-SPL)? Thanks.

> Andreas.
>
> --
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."
