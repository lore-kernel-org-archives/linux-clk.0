Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A557C4360F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 04:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1852B206B7
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 04:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554265608;
	bh=5nEs65n22BWPNmTlbcsE451hcELAvEwA4lAN2tfwRYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=kV+/MJEgHkYm/Ec7TReaHnl4nF0jxD73bK23y8wdGLRHNrN6rMklm9XTUVnTJAucM
	 Cqh17UFZIKI7W3BMFNfW/bWSHMXO25BGpudtaY4sik1sC7IxupR6cmXAAQcapL4/ta
	 SBeuCS/F7kVTdXbYELUecJ14QhjRjEenxT26gqBU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfDCE0r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 00:26:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbfDCE0r (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Apr 2019 00:26:47 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2107C20882;
        Wed,  3 Apr 2019 04:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1554265606;
        bh=5nEs65n22BWPNmTlbcsE451hcELAvEwA4lAN2tfwRYc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wZwzLbbbOCH43YxRkQuNSC/+D7oIAEjWIx++eai8q9NbgIZ2TbAU8z/yNauV5kO8w
         zyxJ1CNud9OLjJC1u7icNqp/8zEiNVTxFs3BPzzd+sp5hMe7uSIgU6wR5ApvSwai4I
         okhnTyZDEsjASwixP/kfAILKUXl8JmuaMA9Wlsgo=
Received: by mail-qk1-f173.google.com with SMTP id c1so9366964qkk.4;
        Tue, 02 Apr 2019 21:26:46 -0700 (PDT)
X-Gm-Message-State: APjAAAVCmPxv5h7w4PXiIPwvhEBvnxSClrLuUcGogXUJfT8lbevUBm1p
        fcF1Plv8rOcSKyl9uURwDdVEDq85gOL84MsNGQ==
X-Google-Smtp-Source: APXvYqx0kC8CrDmDtHIJHeCX3D9HiBvCpBlJuxrUwS+/0q4h+yN7jGcgGkjrvgpo97rZARChx3TVe4May3Y0Mid9Pt0=
X-Received: by 2002:a37:9e0d:: with SMTP id h13mr58034293qke.135.1554265605359;
 Tue, 02 Apr 2019 21:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190325074523.26456-1-josephl@nvidia.com> <20190325074523.26456-2-josephl@nvidia.com>
 <5ca06133.1c69fb81.11ebf.91ce@mx.google.com> <7d680700-d2f2-7b6c-a8bf-dca6d54dbf2c@nvidia.com>
In-Reply-To: <7d680700-d2f2-7b6c-a8bf-dca6d54dbf2c@nvidia.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 2 Apr 2019 23:26:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLL5g7vGNmwcNQw5KBXFP4tE69zGyWd0msP3sexve_sNQ@mail.gmail.com>
Message-ID: <CAL_JsqLL5g7vGNmwcNQw5KBXFP4tE69zGyWd0msP3sexve_sNQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: memory: tegra: Add Tegra210 EMC bindings
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-tegra@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 1, 2019 at 2:58 AM Joseph Lo <josephl@nvidia.com> wrote:
>
> On 3/31/19 2:41 PM, Rob Herring wrote:
> > On Mon, Mar 25, 2019 at 03:45:16PM +0800, Joseph Lo wrote:
> >> Add the binding document for the external memory controller (EMC) which
> >> communicates with external LPDDR4 devices. It includes the bindings of
> >> the EMC node and the EMC table of different rates.
> >>
> >> To support high rates for LPDDR4, the EMC table must be trained before
> >> it can be used for runtime clock switching. It has been done by firmware
> >> and merged to the table that Linux kernel uses. For backward
> >> compatibility with the devices that had been launched on the market, like
> >> Shield and Jetson platforms, the bindings in the EMC table should remain
> >> the same. So the firmware can recognize them and merge the trained EMC
> >> table for the kernel.
>
> Hi Rob,
>
> Thanks for reviewing.
>
> >
> > Overall seems pretty bloated. How much of this really varies by board
> > vs. just being a dump of all the register values to stuff?
>
> Most of them are register values. And by different SDRAM devices that
> could be used on the same platform (use ram code to identify them), the
> value could be different.
>
> >
> > Primarily, I'm leary of getting a similar binding for every vendor's DDR
> > setup.
> >
> > Some mostly trivial comments follow.
>
> Really sorry about that. I understand these basic rules for DT bindings,
> but the case here is that these un-reviewed bindings have been used in
> the firmware on the shipped products. To support the same with the
> upstream kernel and consider the firmware blob may not be updated, we
> have no choice to just use the same bindings in the upstream kernel.
>
> How can we deal with this case?

Simply, we do not accept bindings as-is. If we did, then there would
be no point in documenting and reviewing bindings. NVidia chose this
path and now gets to live with it.

Rob
