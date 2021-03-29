Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E64C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 03:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 210D76195E
	for <linux-clk@archiver.kernel.org>; Mon, 29 Mar 2021 03:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbhC2DkO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 28 Mar 2021 23:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhC2DkH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Mar 2021 23:40:07 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8C1C061756
        for <linux-clk@vger.kernel.org>; Sun, 28 Mar 2021 20:40:07 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id x27so5861357qvd.2
        for <linux-clk@vger.kernel.org>; Sun, 28 Mar 2021 20:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t+xrhMH6Gr2A3zI8Lcey2uhccYuzey1LBxw8FGRBr38=;
        b=GlrshGa0JheYxNSV53Bg30loaFV1EoaqTDeQ4sNl5yMfy0XcZRrlxMtdMSPW1A7Yf4
         EbTgvKP2xqK9gpYlJKevK6F099bP6A7MjXe561/2v+ADngUOs3cryvs85OYWgtjJZXfk
         1iQoDgHm2qxjio8Y9Ymp80ANC43PudXOfx/WUcIOvInOgXAy7VcIgWyRsm98QhImbst5
         +/1tM1ELbjLI5lHjScnDyL90S4FRIHjiUbfHkrmzex7q+YurcZfSlSqSK3bSb3xrZVAs
         MnNvbTC7Hmn51U/oVHggPrGZ47AxohQwlQ8dtGXWZ4z6bqbTVeScW2T0abx16japHG9X
         wOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t+xrhMH6Gr2A3zI8Lcey2uhccYuzey1LBxw8FGRBr38=;
        b=loeoFhBFMZdHaqdg5b8xqaXq2nrxEsZSwPfiBIX1azHgaBDs32KcOGm7Cc40f4V+XX
         weG9WS1KK7IzoWVvHbT0NqgxGvCMzOe4xm0GrmyV6+6E+1CWcoF2ZO0Tybm7+4JG80ZS
         XHGlaMnNwLL8gSE5tmTpA+pLYL00AhF5i5IOJJJgVyf53RrwihwpKa/aKXidhALkPcbr
         em1ZB0/QVcK0p2yLt0Y/BtirzklvEJAHAm3TcgmCU06z88YlLnR8+DBHY2yN2snjtLAD
         DVaw7QF9eJeFpITDV2DJ7ad9u5XbfjpTsug22jnQn4yQx/SLJZKsr8EBrdZzSgH82Yl3
         ahfA==
X-Gm-Message-State: AOAM531pzbJx7lAO+MorhIEM7T3FvbXSBiwyB8pjYlImP378qRNdZ8vR
        wRl5sI9P2ZtEReyv8rLFHt2ve75k/rppDmvhgAIC1Q==
X-Google-Smtp-Source: ABdhPJwtzOJzKprrFyS651SYxqerVpA4YQVKn1jE961aUbyTUomzkbGS4bOkuGuS6qbJozSOfhU9WUXqdidGPMyRNcE=
X-Received: by 2002:a0c:dd14:: with SMTP id u20mr24167583qvk.13.1616989206452;
 Sun, 28 Mar 2021 20:40:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1615954045.git.greentime.hu@sifive.com> <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
 <20210323203508.GA1251968@robh.at.kernel.org>
In-Reply-To: <20210323203508.GA1251968@robh.at.kernel.org>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Mon, 29 Mar 2021 11:39:54 +0800
Message-ID: <CAHCEehKw2Sb6DN-hQCZB8-ARuaOf47mmzS18Fqm1amr4sXVCRg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host controller
To:     Rob Herring <robh@kernel.org>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>, hes@sifive.com,
        Erik Danie <erik.danie@sifive.com>,
        Zong Li <zong.li@sifive.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        lorenzo.pieralisi@arm.com, Philipp Zabel <p.zabel@pengutronix.de>,
        alex.dewar90@gmail.com, khilman@baylibre.com,
        hayashi.kunihiko@socionext.com, vidyas@nvidia.com,
        jh80.chung@samsung.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rob Herring <robh@kernel.org> =E6=96=BC 2021=E5=B9=B43=E6=9C=8824=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=884:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Mar 18, 2021 at 02:08:11PM +0800, Greentime Hu wrote:
> > Add PCIe host controller DT bindings of SiFive FU740.
> >
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > ---
> >  .../bindings/pci/sifive,fu740-pcie.yaml       | 119 ++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-=
pcie.yaml
[...]
> > +examples:
> > +  - |
> > +    pcie@e00000000 {
> > +        #address-cells =3D <3>;
> > +        #interrupt-cells =3D <1>;
> > +        #size-cells =3D <2>;
> > +        compatible =3D "sifive,fu740-pcie";
> > +        reg =3D <0xe 0x00000000 0x1 0x0
>
> Humm, 4GB for DBI space? The DWC controller doesn't have that much
> space, and the kernel will map *all* of that. That's not an
> insignificant amount of memory just for page tables.

Thank you for review and point this out. :)

I check the spec description for DBI in DWC_pcie_ctl_dm_databook.pdf
section 3.15 3.16 and table 3-17.

I think CX_SRIOV_ENABLE and CX_ARI_ENABLE will be set to 0 because
these 2 are endpoint mode features.
Single Root I/O Virtualization (SR-IOV) This section describes the
SR-IOV features implemented in EP mode. The parameter for enabling
SR-IOV is CX_SRIOV_ENABLE
Alternative Routing-ID Interpretation (ARI) ARI allows an endpoint to
support more than eight physical functions (PFs). ARI is enabled by
the CX_ARI_ENABLE parameter.

So based on Table 3-17, we will need to map 2GB(bit30) instead of 4GB(bit31=
).
