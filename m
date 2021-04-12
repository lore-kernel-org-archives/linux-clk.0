Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2D3C433B4
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 02:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3322761207
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 02:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236624AbhDLCiV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 11 Apr 2021 22:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235857AbhDLCiV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 11 Apr 2021 22:38:21 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF40FC061574
        for <linux-clk@vger.kernel.org>; Sun, 11 Apr 2021 19:38:03 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id o5so11989789qkb.0
        for <linux-clk@vger.kernel.org>; Sun, 11 Apr 2021 19:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TmSSElCK4cYcHvK5QFQubtH5iynsu2VpzHMHEgHy8BA=;
        b=mbWzSh1p+trrWvmtrxYTsTS6r7o6U7fHTEwOt2citEUHclf1uB5FPBJiH6Uq16l2JV
         7WuM8/9cc+Q9XA+OT8dgVf3al8k3AXpsDyC+v53R4+AnBjGFPwhPBmMep7dSG9qWwiPn
         y2lOHpMaMhzoaGwBKLgF+AXBg5myeg5sNVvR2DhVPVJ4Y4d/nMyhUal2MZ4RnV0f35y9
         O2ZdG6+rWoMod5Bi2v9MraiB0Ky4PpWQYtFh5Uhau9HcJmkvZROGHW6sCvLRbRmgS5im
         07TfdfkFA6AVfyhc/SPPmM2Ee2RgKBFftH43pPgOwx8c+uyoIclHVSsQuVVlAXdF9IQg
         6OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TmSSElCK4cYcHvK5QFQubtH5iynsu2VpzHMHEgHy8BA=;
        b=ZzDnz6dywdHxMcvHxleK6+6zCT0BdZHf9hBnXhAX5+a70E0g2cpXLS6uJaS6YBzJ5L
         Axj9Tjoqtn/7WQpLmCmupdRr3wT2DmmmO/CNKoox/LTqHVbdMJBM+jU+mJyVnypFD/Wp
         EJZt+vqmCdMSXCgeBZ35lBDF5IWJyf/YEZHRh9bP6Fz5Ujwi29UGiJj6qAFVyM3gBQSC
         Jioy9hcpRcEXJKuJLJlD41MPFGp+b0TfTGGs2l8m/gxhKEmrQktUoookmD+gUZ8uJbC0
         pJLufIMUiG5rqupHEPo/IZ5AjwYKmAkU+YQ8bit4O1Dz4wfM8tExn2WH7SKvU3k+kfa1
         Knhg==
X-Gm-Message-State: AOAM533TogCSpir5fObvW/qMRz79TTZQ7VzEZGNmTgdJEQuOZLKMKhr/
        v631EUMnQeGA9aH482YtgEqTfuRJO54HNeAlVBv99Q==
X-Google-Smtp-Source: ABdhPJwOWzULd337c8NuXMd1ABRPnJWVXcSMZ167cl2J0oTgGU5gvgRC+qgOHXrTrA96Yon0OE2bEBoQct1g2/W01Fo=
X-Received: by 2002:a05:620a:1497:: with SMTP id w23mr24922931qkj.260.1618195083134;
 Sun, 11 Apr 2021 19:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210406092634.50465-1-greentime.hu@sifive.com> <161795835843.16967.18210803147557738620.b4-ty@arm.com>
In-Reply-To: <161795835843.16967.18210803147557738620.b4-ty@arm.com>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Mon, 12 Apr 2021 10:37:50 +0800
Message-ID: <CAHCEehJajVGWnAwvX+Jg3_U=WNxaNq89Xq3uvcfcHzt04qNfMQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver support
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>
Cc:     jh80.chung@samsung.com, Zong Li <zong.li@sifive.com>,
        robh+dt@kernel.org, vidyas@nvidia.com, alex.dewar90@gmail.com,
        Erik Danie <erik.danie@sifive.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Stephen Boyd <sboyd@kernel.org>,
        hayashi.kunihiko@socionext.com, hes@sifive.com,
        khilman@baylibre.com, Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Helgaas <helgaas@kernel.org>, devicetree@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> =E6=96=BC 2021=E5=B9=B44=E6=
=9C=889=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:54=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> On Tue, 6 Apr 2021 17:26:28 +0800, Greentime Hu wrote:
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
> >
> > [...]
>
> Applied to pci/dwc [dropped patch 6], thanks!
>
> [1/6] clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
>       https://git.kernel.org/lpieralisi/pci/c/f3ce593b1a
> [2/6] clk: sifive: Use reset-simple in prci driver for PCIe driver
>       https://git.kernel.org/lpieralisi/pci/c/0a78fcfd3d
> [3/6] MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
>       https://git.kernel.org/lpieralisi/pci/c/8bb1c66a90
> [4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
>       https://git.kernel.org/lpieralisi/pci/c/b86d55c107
> [5/6] PCI: fu740: Add SiFive FU740 PCIe host controller driver
>       https://git.kernel.org/lpieralisi/pci/c/327c333a79
>
> Thanks,
> Lorenzo

Hi Palmer,

Since the PCIE driver has been applied, would you please pick patch 6
to RISC-V for-next tree?
Thank you. :)
