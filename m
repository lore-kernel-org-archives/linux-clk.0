Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA02C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 13:16:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B22520854
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 13:16:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="LxyDFr/H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfCSNQp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 09:16:45 -0400
Received: from mout.gmx.net ([212.227.17.20]:49271 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfCSNQp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Mar 2019 09:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1553001393;
        bh=HHLBaxY8vE2K9B/pXNrSMiPtSyuDWBU75hqtbSN8RT4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=LxyDFr/H3tKcBaY2nz6H9v788+8quRuZ0OkY5ZCvzImVFOQ6YxPl43umVLoxj6yLJ
         NFah2B9KIxXM5MdUylrEEtXqelspQmc1FFWB85AGK3qAcI+HSO5Tl/KZbVrTzf/ykG
         50ESGYA7hmHLicHyjIg/fmDreq1BgKJ2RFutM2bQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MgGDK-1hL2CF2azG-00NgUB; Tue, 19
 Mar 2019 14:16:33 +0100
Subject: Re: clk: x86: Stop marking clocks as CLK_IS_CRITICAL is causing
 non-working hardware.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e6e11d5c-988a-aef4-cb8c-9e3bef254b87@gmx.ch>
 <155257844626.20095.2420043618878828782@swboyd.mtv.corp.google.com>
 <73c30c82-1a69-97e6-40e9-3cdd6059e72d@redhat.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <6948f8df-e6ee-2312-3ad1-8b3b48c99c4e@gmx.ch>
Date:   Tue, 19 Mar 2019 14:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <73c30c82-1a69-97e6-40e9-3cdd6059e72d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yxE05lFXXIt2HGvDsnCLCckGMfF1Z/dQODJhyok1U4zMNrKwYRk
 FM4P7hhlMgH96vYdCGZmpAcink6F1QoOE1B7JMtGbmY0TmLshzeX1KAPLPHd0MkLbw6+KwN
 BbtqCL96kCq+zqDA2NYhoL/vo/yDCZCIwUmrunAzjbeb3VE50xsSATdG/lc6wbk/KDlsEA3
 dwxnmhbin42X7nTOeSKDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7kwZBTEFCsQ=:6/zrtus28+eTptteByEC+k
 OHyfe1vet3+cx9rLlx3zTvxB47XlO3iOj7JWK+RgY2J4T8IgAn5z3eGvuEqk7Sj1QctxR79Nj
 So+Nr7acnr/GBVZgAbMrZPpJj4ijufI0XIY/rMU/6gD4EvV09qRqCTQxU3MaxNCU3JobLJJM3
 bOUd3RBWzSBYBqWQunf5Sn4yFFk80pF4Hd7wWL1Ymt5pAahBMzx9REbYbIKiOhIO82+70EUHm
 Hfq4Vg2rBA7n5RWaK8u8ffy7WtU5AckabsvsXTH7FIFis4oAadYLajRB2XdRMt2Hs45cxK10r
 TSND+sfKBaXlcqBcmpaukIJsRHYBqnRrtHKmnSk7Wkq427JHYP9bROC5WpxH70BjuU6pY2F69
 U2HpXrKS5wgq/w+b0V5AzhBRShg+Hc0I3aRdwk3KyauBDj0g+/6T4nALFRCvDwTJy+VL61DUF
 oV+RpxlvhJpm3GBaNPiXz+U83ajHLHkKjdlEaWqJm4Lp+wklVI0fV6aY7b1lttfRHaOy12Id7
 C6DCgzUPcbob66dX607SHVFLyxLm0tlyR9MJuYW/WfB9YZPbyb8PrWg5OTQF0GpwCkl4DFl6x
 Lt2KBpsVqm+D72ZlP27/w3h2jj5einPBAnVNwiEhds6/zX7NBXuuUV2o0oRXPQVcGEKQzzJQR
 PZFLe2xUlkC5/0BQ9F+Et57jo45tedfNcyUjAfxvrxxXEzH5ancxumPWnrzRc/h9QhD2DZj/F
 e4RYB2hkNDkTc6Y8RtwGiSHOYh/L5Wwi43s9pko+nvZzwCOtuNOK9vsGA2D5gSyZKFVja4jdW
 pXAk+t6v14W0LymdvDmPbUcpMnl5Tzt7GhB7Gw1mfBYteA3yJwsAEJ/G25T0J/dg8pGT96DEu
 S2kaVgGdZCso0+yZgmp3DzRNu1VmRVH3tCeVWZeBk0OAQKPVsbhgOtJlJGpJ0Z/vEXDXUvuSR
 4b+Yiqck9hg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

Hans de Goede wrote:

> So the background here is that the ACPI tables would normally be
> responsible for turning on/off the pmc clocks and they are on cherry-tra=
il
> but on bay-trail the OS is somehow supposed to figure this all out.

Sorry, I'm not familiar with CherryTrail but the "clk-pmc-atom" clk
driver is used by both BayTrail and CherryTrail, isn't it?
I don't see any ACPI related clock handling in this driver. Is it
handled somewhere else?

> Do you know if the kernel already has some special code-paths to deal
> with the HSIC phy in the xhci code ?

The HSIC chip is more an USB hub than a phy. There is also no specific
driver loaded/needed for HSIC to work, at least not on x86.
I have also not seen any "external clock enabling code-paths" in the
xHCI code, but maybe I overlooked it.

> Otherwise I guess we should probably conditionally register a
> platform_usb_phy_clk clock alias (see commit b1e3454d39f992)
> based on a dmi_system_id table and have the xhci driver (optionally)
> request this clock and enable it if present.
> There are some interesting probe-ordering issues here though,
> for this to work the clk-pmc-atom (builtin) platform driver must
> bind to the clk-pmc-atom platform-device *before* the xhci
> driver tries to get the clock.

Wouldn't it be simpler and more straightforward to put a "dmi_system_id
table" based quirk into the clk-pmc-atom driver itself?
That would also avoid any potential probe-ordering issues.
