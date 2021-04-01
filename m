Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0594C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 06:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1BE861057
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 06:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhDAGRD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 02:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbhDAGQk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 02:16:40 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBE7C061788
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 23:16:40 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id y5so1200632qkl.9
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 23:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/tdHq+eMgfvUCfgr19g4KGgjUw8dwNFaPcptJLMvv20=;
        b=d1tet9Y2otJ4bPKkudFR7D1GN4TSxbb31ttdrlkl/P3sIGNBKqc6I78rPuwagFZLLP
         91dZeX1IuFNgTohpD/7akTLAyWiZR/t0GCbC7hQJFaTYIzg/1yxYzN48AUTERaZYb92I
         d5X5ASx9YOH20slwp7tXU1V8OlvUf4JNjbmasNAhuntVXe11XdwFpLt/Pqm/VPF3LI98
         wj9AKLkB4qVEmBFKJposxVO3VlPRrmBgrjmHiJRND+jlasqobxNVWZF6L0k5Po8PJh5Q
         DK3ZIR+/syfAhiRsujKvn1J0W61ILlAfeucEfPwH7DPcWSxFLVCfg/WaEjEWdcWbeJQO
         TDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/tdHq+eMgfvUCfgr19g4KGgjUw8dwNFaPcptJLMvv20=;
        b=JfVkxxGEyOveFrC2WX36SR37DztDgNdbXNP8BmuUCZPiuf/cJntmJHSXrCbFXMEYeP
         vibmgMmtW6lvHZM+B1DEXWe5ksPruDXYl8DG/JQExt2YWVWJg+PCkiz9VOxR7AHpjYu+
         W35fuZuiAZEqRmPE3DQpvQtz+lQtyZN6HLDhPyWq4uko5LPalImQ99T5Yc8YTKz75bsD
         ODBL15ypJlLqm4rPWEyvIZQgEFlJQdHQPap/nozPtuezd4P9fDhA9EqoVH3TJN7U1dDN
         wQi39wXjmA14BywVJlCyUZpU+4jGlMq4x4KNV4w2+wo7WmKpFD2NprQo0iaVIQhfkbUz
         0XOg==
X-Gm-Message-State: AOAM5329Ew+Lm3C806GhuK5z7NWCniA3lR2ciEFAmWt5dmCUWgKtqscI
        /GkVvddkJWdmXdzpFzQ4PGwnjZAn8ZsMN9oQy5zxjg==
X-Google-Smtp-Source: ABdhPJxN7gKZfahwJhOWLIepnEZQQrrtp1Bkzqp9sIf8uf8W7egGtdMcqMlqet9G2ktx96KkylccNRofqZFJM0jdU/A=
X-Received: by 2002:a37:66cd:: with SMTP id a196mr7046403qkc.374.1617257799357;
 Wed, 31 Mar 2021 23:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615954045.git.greentime.hu@sifive.com> <161704512808.3012082.7539298875497991635@swboyd.mtv.corp.google.com>
In-Reply-To: <161704512808.3012082.7539298875497991635@swboyd.mtv.corp.google.com>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Thu, 1 Apr 2021 14:16:28 +0800
Message-ID: <CAHCEehJyzsTOHpMhRQ4U3Ex+QiO8h2emBAq3ZemFrgqB-XRZNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Add SiFive FU740 PCIe host controller driver support
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     alex.dewar90@gmail.com, Albert Ou <aou@eecs.berkeley.edu>,
        Bjorn Helgaas <bhelgaas@google.com>,
        devicetree@vger.kernel.org, Erik Danie <erik.danie@sifive.com>,
        hayashi.kunihiko@socionext.com, Bjorn Helgaas <helgaas@kernel.org>,
        hes@sifive.com, jh80.chung@samsung.com, khilman@baylibre.com,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        lorenzo.pieralisi@arm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org,
        vidyas@nvidia.com, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen Boyd <sboyd@kernel.org> =E6=96=BC 2021=E5=B9=B43=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Quoting Greentime Hu (2021-03-17 23:08:07)
> > This patchset includes SiFive FU740 PCIe host controller driver. We als=
o
> > add pcie_aux clock and pcie_power_on_reset controller to prci driver fo=
r
> > PCIe driver to use it.
> >
> > This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon =
R5
> > 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based o=
n
> > v5.11 Linux kernel.
>
> Can I merge the clk patches to clk-next? Or is the dts patch going to be
> sent in for the merge window? I'd like to merge the clk patches if the
> other patches are going to miss the next merge window.

Hi Stephen,

Thank you for reviewing. I am ok with either way. :)
