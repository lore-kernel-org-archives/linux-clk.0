Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE18EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 01:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353032AbiCPBzC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 21:55:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353029AbiCPBzB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 21:55:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5A033E8B
        for <linux-clk@vger.kernel.org>; Tue, 15 Mar 2022 18:53:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n19so1436034lfh.8
        for <linux-clk@vger.kernel.org>; Tue, 15 Mar 2022 18:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/w6g4UFapgjJyWigEntfY4YR+4uWCSZSSrQixa3u6+g=;
        b=NOuO/gH2k2r8FqAWGTSFu3/K2RelH8l1bUKZJrYmiVaqA+UTjEqKY666OVXfT8d219
         2YlKjBcEbW9rsLFaO+lVQexhLzkDhDnQGUhQ6bY4urMhIT5FyhNYWPgdC5OvZaiN9swo
         /zne3iP33JmXYXygB8OBviNrskeEf2CIACj4MnvcwOiNM9JiuDaFHLDOnvuVC7Hg/n7i
         XrNztpYGFUn6I7YMjneJT3ad4ZI8dzWyZuSAkx4zMcPbHYeRU8K1Y6jjkkV7xw0ze/KC
         +eMZ95j3B3AybgLC9l3crRekrK+Y0eIwj3PxUJeA1TEud6ZXDuDCRYdWKXyGdbPpzgL8
         W0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/w6g4UFapgjJyWigEntfY4YR+4uWCSZSSrQixa3u6+g=;
        b=bRrsY9lsYJVIK7CS2j5ce6KcvOq3SvZIj+4dTtT1nENqO0LrDnK5DhPpKqLbmpaEva
         a4Gyain5BYN5z8AQC/qXM5ihryVpFnT6ogL8F0sbAgZPhWM7XhcIgE/9JG1AkUWmUab4
         uwr+XwD4oFXewXr3RgTKcuBD8CxxGNVC7sOo2jOZjo9xt6QIgajYrllOJvTzrnCWr2m6
         JstpX5P8qTAuji9I3WPV6X4OdD/2oNZ6+ybhOzlRxYcKfW+jKCApMsxh2VKhNtaxxxHi
         qIkYChJy/yGGGTmKDSLtORQdF1wPosAMHDz5n0IA2/bZ4KOlgCbvOtoZGeY2kgYIu+On
         kf7g==
X-Gm-Message-State: AOAM531MR5O8B1Myb77U3l8Ccn1ohT2pjJha4/dKVDIW8otFyYJnGpx1
        mpviSV4JpUb2cbzF8bHzPwJYxkt7Mb5u2llbkdAnQg==
X-Google-Smtp-Source: ABdhPJwJrWMGPCVAe9Kdw4+yO4dxhyREg9HzABowyT5uPfqBiphteSCarJzNDqam5BVctAGvnqC08Kzr648dwxePEXc=
X-Received: by 2002:a05:6512:1510:b0:445:cbc3:a51f with SMTP id
 bq16-20020a056512151000b00445cbc3a51fmr18924746lfb.116.1647395625908; Tue, 15
 Mar 2022 18:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646388139.git.zong.li@sifive.com> <db92d209fa700f7da8bc8028083476fcc138d80e.1646388139.git.zong.li@sifive.com>
 <20220315225459.73F2DC340E8@smtp.kernel.org> <20220315225652.CDAD1C340E8@smtp.kernel.org>
In-Reply-To: <20220315225652.CDAD1C340E8@smtp.kernel.org>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 16 Mar 2022 09:53:36 +0800
Message-ID: <CANXhq0oAsxqL2PxkB8eOu_8L10pX_oWgwPH5y4edq5tw6ObWiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] riscv: dts: Change the macro name of prci in each
 device node
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Mar 16, 2022 at 6:56 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Stephen Boyd (2022-03-15 15:54:57)
> > Quoting Zong Li (2022-03-04 02:03:19)
> > > We currently change the macro name for fu540 and fu740 by adding the
> > > prefix respectively, these marcos are referenced by some device nodes,
> > > they should be modified as well.
> > >
> > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> >
> > Cool. So it looks like I can take the clk patches and not this one and
> > it should be OK?
>
> To speed things up I can take the whole pile. Thanks for fixing the
> bisection problem.

I appreciate that you are willing to pick them up. Many thanks.
