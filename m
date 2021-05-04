Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F80CC433ED
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 10:59:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1317D613B4
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 10:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhEDK75 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 06:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230130AbhEDK75 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 06:59:57 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807D1C061761
        for <linux-clk@vger.kernel.org>; Tue,  4 May 2021 03:59:02 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id g1so5923729qtq.6
        for <linux-clk@vger.kernel.org>; Tue, 04 May 2021 03:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r3B/fNK84CltMBPJVMASlwyz4bmYLgsBN7IeNMwteLY=;
        b=fYjOBRjkNxcEFYH/GZC2GUibotMx4lt0t8HlvtRV1msaEy7HFSquKGnQjm5nusthRn
         asH48V14SWbn9KKpIV7x79gyKtTtx5SV2TDrHeUht9ZNlL7fDB3jhCDMSpIyuJGgofvN
         XVGO6+ASgsfEvIW9UvfflNpPfhGX6mNfwxUhauKEopZJ4RsRCwjrz6Mux0toZgPaD1lA
         RZ5cMsWNiuGgX/WxCkNmv+ieg2nsRj4tymChF1frw8bEuI0/Wch04C4CFJlB5AUcDeb5
         yd65HZpxzvU5JwVqj9NXYkxJdUeF+dmwbfxEWRwpbExLEqBRM9XjIxOL9/CKzg3LL6ll
         j+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r3B/fNK84CltMBPJVMASlwyz4bmYLgsBN7IeNMwteLY=;
        b=riyvHN1Gb3XB+8ASduqaZU3ESl8HmaCaJ+R4Yp6E47ZahCH+pcQ6uKKZ2U4lzITFbR
         pPxhRSES0ZzAFY97NnC7LppoclMRTdYHFSMmMR7sbwNnWLyNpsFn/FXk/I6mav3EPhoz
         VMtbtWh1Ut4bTlS2jmF7Nz0VgTskiAd88rKw2frpdkOfl0c4q0mCLahuoMHgVdQahrbi
         YgtqC0K9o3B2ekvuUmwkay+OsWFTME1j3jh6FDODf9Zca3lP2SftQWSBnIuoFULPafXC
         tBdG5ihdurfZ9M+3iMHOFhQACOMjATWL91fZFBsJNDN69K1jE/58MyxQfMVj0k2U9yk7
         N4nw==
X-Gm-Message-State: AOAM533FGGCOf7HiqUuVtGLNoci93V8lbDYboX2Xgo0+WcMy8HMNbWUB
        JT/YRLpKmYNKUMfHc0ZnxTF4aoXtnpI1MnruRc536g==
X-Google-Smtp-Source: ABdhPJziNqv7NZ3RvX7OYxfEOn3d+D7csr2IH8GytFp9h9C3he0BUgktsCt8o1F76/bufM6qWmtrJwFoilBmBTj9qg4=
X-Received: by 2002:ac8:48d4:: with SMTP id l20mr21419522qtr.113.1620125941473;
 Tue, 04 May 2021 03:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210406092634.50465-1-greentime.hu@sifive.com>
 <20210503164023.GA919777@bjorn-Precision-5520> <CAHCEeh+cMrEnHNG3W3ZNzdgT-m7BMorDawF6D8qkFYGg=RJMOw@mail.gmail.com>
 <20210504101201.GA20729@lpieralisi>
In-Reply-To: <20210504101201.GA20729@lpieralisi>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Tue, 4 May 2021 18:58:48 +0800
Message-ID: <CAHCEehJsUFxs71MuY5f4VbDT-NroCzJ=mnbbYYa4VwT-QWcQNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver support
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com,
        Erik Danie <erik.danie@sifive.com>,
        Zong Li <zong.li@sifive.com>,
        Bjorn Helgaas <bhelgaas@google.com>, robh+dt@kernel.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, alex.dewar90@gmail.com,
        khilman@baylibre.com, hayashi.kunihiko@socionext.com,
        vidyas@nvidia.com, jh80.chung@samsung.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> =E6=96=BC 2021=E5=B9=B45=E6=
=9C=884=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:12=E5=AF=AB=E9=81=
=93=EF=BC=9A

>
> On Tue, May 04, 2021 at 03:20:00PM +0800, Greentime Hu wrote:
> > Bjorn Helgaas <helgaas@kernel.org> =E6=96=BC 2021=E5=B9=B45=E6=9C=884=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=8812:40=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Tue, Apr 06, 2021 at 05:26:28PM +0800, Greentime Hu wrote:
> > > > This patchset includes SiFive FU740 PCIe host controller driver. We=
 also
> > > > add pcie_aux clock and pcie_power_on_reset controller to prci drive=
r for
> > > > PCIe driver to use it.
> > >
> > > I dropped this series because of the build problem I mentioned [1].
> > > It will not be included in v5.13 unless the build problem is fixed
> > > ASAP.
> > >
> > > [1] https://lore.kernel.org/r/20210428194713.GA314975@bjorn-Precision=
-5520
> > >
> >
> > Hi all,
> >
> > This build failed in x86_64 is because CONFIG_GPIOLIB is disabled in
> > the testing config.
> >
> > diff --git a/drivers/pci/controller/dwc/Kconfig
> > b/drivers/pci/controller/dwc/Kconfig
> > index 0a37d21ed64e..56b66e1fed53 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -323,6 +323,7 @@ config PCIE_FU740
> >         depends on PCI_MSI_IRQ_DOMAIN
> >         depends on SOC_SIFIVE || COMPILE_TEST
> >         select PCIE_DW_HOST
> > +       select GPIOLIB
>
> I think that an include:
>
> #include <linux/gpio/consumer.h>
>
> in the driver would do. Still, I believe we should also add a
> "depends on" in the Kconfig entry rather than a "select".
>
> Please let me know as soon as possible.
>

Hi Lorenzo,

Thank you for suggesting this.
I'll add the include and use "depends on" rather than a "select" and
send the v6 patch.

> Lorenzo
>
> >         help
> >           Say Y here if you want PCIe controller support for the SiFive
> >           FU740.
> >
> > After applying this change, it can build pass.
> >
> > > > This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Rad=
eon R5
> > > > 230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched bas=
ed on
> > > > v5.11 Linux kernel.
> > > >
> > > > Changes in v5:
> > > >  - Fix typo in comments
> > > >  - Keep comments style consistent
> > > >  - Refine some error handling codes
> > > >  - Remove unneeded header file including
> > > >  - Merge fu740_pcie_ltssm_enable implementation to fu740_pcie_start=
_link
> > > >
> > > > Changes in v4:
> > > >  - Fix Wunused-but-set-variable warning in prci driver
> > > >
> > > > Changes in v3:
> > > >  - Remove items that has been defined
> > > >  - Refine format of sifive,fu740-pcie.yaml
> > > >  - Replace perstn-gpios with the common one
> > > >  - Change DBI mapping space to 2GB from 4GB
> > > >  - Refine drivers/reset/Kconfig
> > > >
> > > > Changes in v2:
> > > >  - Refine codes based on reviewers' feedback
> > > >  - Remove define and use the common one
> > > >  - Replace __raw_writel with writel_relaxed
> > > >  - Split fu740_phyregreadwrite to write function
> > > >  - Use readl_poll_timeout in stead of while loop checking
> > > >  - Use dwc common codes
> > > >  - Use gpio descriptors and the gpiod_* api.
> > > >  - Replace devm_ioremap_resource with devm_platform_ioremap_resourc=
e_byname
> > > >  - Replace devm_reset_control_get with devm_reset_control_get_exclu=
sive
> > > >  - Add more comments for delay and sleep
> > > >  - Remove "phy ? x : y" expressions
> > > >  - Refine code logic to remove possible infinite loop
> > > >  - Replace magic number with meaningful define
> > > >  - Remove fu740_pcie_pm_ops
> > > >  - Use builtin_platform_driver
> > > >
> > > > Greentime Hu (5):
> > > >   clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
> > > >   clk: sifive: Use reset-simple in prci driver for PCIe driver
> > > >   MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
> > > >   dt-bindings: PCI: Add SiFive FU740 PCIe host controller
> > > >   riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
> > > >
> > > > Paul Walmsley (1):
> > > >   PCI: fu740: Add SiFive FU740 PCIe host controller driver
> > > >
> > > >  .../bindings/pci/sifive,fu740-pcie.yaml       | 113 +++++++
> > > >  MAINTAINERS                                   |   8 +
> > > >  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  33 ++
> > > >  drivers/clk/sifive/Kconfig                    |   2 +
> > > >  drivers/clk/sifive/fu740-prci.c               |  11 +
> > > >  drivers/clk/sifive/fu740-prci.h               |   2 +-
> > > >  drivers/clk/sifive/sifive-prci.c              |  54 +++
> > > >  drivers/clk/sifive/sifive-prci.h              |  13 +
> > > >  drivers/pci/controller/dwc/Kconfig            |   9 +
> > > >  drivers/pci/controller/dwc/Makefile           |   1 +
> > > >  drivers/pci/controller/dwc/pcie-fu740.c       | 308 ++++++++++++++=
++++
> > > >  drivers/reset/Kconfig                         |   1 +
> > > >  include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
> > > >  13 files changed, 555 insertions(+), 1 deletion(-)
> > > >  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu=
740-pcie.yaml
> > > >  create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c
> > > >
> > > > --
> > > > 2.30.2
> > > >
