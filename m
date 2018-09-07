Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:47706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728425AbeIGSkA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Sep 2018 14:40:00 -0400
MIME-Version: 1.0
References: <20180905193738.19325-1-robh@kernel.org> <CAHTX3d+BFKM-jFo8Ww_dXwAzsDVoWqE==erfwVTeijHfh8kkOw@mail.gmail.com>
In-Reply-To: <CAHTX3d+BFKM-jFo8Ww_dXwAzsDVoWqE==erfwVTeijHfh8kkOw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Sep 2018 08:58:41 -0500
Message-ID: <CAL_JsqLvLoekvxcaBMxrboJzqS=NyB69NHLShos+LhETj7zNwQ@mail.gmail.com>
Subject: Re: [PATCH 00/21] DT cpu node iterator
To: Michal Simek <monstr@monstr.eu>
Cc: devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jonas Bonn <jonas@southpole.se>,
        Ley Foon Tan <lftan@altera.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Salter <msalter@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        nios2-dev@lists.rocketboards.org,
        Openrisc <openrisc@lists.librecores.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        Rich Felker <dalias@libc.org>,
        Simon Horman <horms@verge.net.au>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, vitb@kernel.crashing.org,
        Will Deacon <will.deacon@arm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        linux-c6x-dev@linux-c6x.org, linux-clk <linux-clk@vger.kernel.org>,
        linux-edac@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        SH-Linux <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 7, 2018 at 7:54 AM Michal Simek <monstr@monstr.eu> wrote:
>
> Hi Rob,
>
> 2018-09-05 21:37 GMT+02:00 Rob Herring <robh@kernel.org>:
>>
>> This series adds an iterator for cpu nodes and converts users over to use
>> it or of_get_cpu_node in some cases. This allows us to remove the
>> dependency on device_type property for cpu nodes though removing that
>> from DTS files will have to wait for some time. In some cases, this makes
>> the DT search more strict by only looking in /cpus child nodes rather
>> than any node with the device_type == cpu. The iterator also honors the
>> status property which is often forgotten.
>>
>> I've only tested on ARM under QEMU and compiled powerpc.
>
>
>
> Do you have this somewhere in your tree not to apply 21 patches by hand?

Yes, dt/cpu-type branch on my kernel.org tree.

Rob
