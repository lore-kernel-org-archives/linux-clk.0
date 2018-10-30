Return-Path: <SRS0=0weS=NK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AC3C2BC61
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 09:49:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D86B62080A
	for <linux-clk@archiver.kernel.org>; Tue, 30 Oct 2018 09:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D86B62080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbeJ3SmA convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Oct 2018 14:42:00 -0400
Received: from mail.bootlin.com ([62.4.15.54]:53433 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbeJ3SmA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 30 Oct 2018 14:42:00 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 035B02072D; Tue, 30 Oct 2018 10:49:14 +0100 (CET)
Received: from xps13 (aaubervilliers-681-1-12-210.w90-88.abo.wanadoo.fr [90.88.133.210])
        by mail.bootlin.com (Postfix) with ESMTPSA id B3917207CF;
        Tue, 30 Oct 2018 10:49:03 +0100 (CET)
Date:   Tue, 30 Oct 2018 10:49:03 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Romain Izard <romain.izard.pro@gmail.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-clk@vger.kernel.org
Subject: Re: Clock configuration for the SAMA5D2 NAND controller
Message-ID: <20181030104903.518f1fdd@xps13>
In-Reply-To: <CAGkQfmMphvck9rraYq+o8zA254q7ETYyniiUV-QBsUR9X+OFKQ@mail.gmail.com>
References: <CAGkQfmNuROsD29jR_7opiXcfPB6=FuaoxaK-hF5Ezz7r-1pBZA@mail.gmail.com>
        <CAGkQfmMphvck9rraYq+o8zA254q7ETYyniiUV-QBsUR9X+OFKQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Romain,

Romain Izard <romain.izard.pro@gmail.com> wrote on Wed, 17 Oct 2018
12:42:28 +0200:

> +linux-mtd, linux-clk
> 
> Le mer. 10 oct. 2018 à 19:05, Romain Izard
> <romain.izard.pro@gmail.com> a écrit :
> >
> > Hello,
> >
> > While evaluating a new flash memory chip for my product based on a SAMA5D2
> > chip, I tried to update my software to use the latest device tree bindings.
> >
> > Until now, I was using the legacy bindings for the NAND controller, that
> > preserved the timings configured by the bootloader in the EBI registers. The
> > bindings introduced in Linux 4.13 are used together with the NAND driver to
> > reconfigure the timings of the memory interface to match the speed profile
> > declared by some NAND components.
> >
> > However, when comparing the timings in the registers, there was a large
> > difference between what I calculated by hand in the past and the values
> > configured by the drivers. The difference was in fact a 2 factor.
> >
> > For me, the issue is due to the clock configuration declared in the SAMA5D2
> > device tree: The reference clock used by the nand-controller driver is the
> > clock for its parent node, which is directly the Master Clock. And on my
> > end, what I understood when writing the clock settings for my bootloader was
> > that the reference clock was the HSMC clock, which derives from the H32MX
> > clock, which runs at half the rate of the Master Clock.
> >
> > The documentation for the SAMA5D2 is not very precise on this topic, so I
> > would like to have some feedback. Is the clock used as a reference for the
> > chip select configuration registers the Master Clock itself, or is it the
> > peripheral clock for the HSMC module ?
> >

FYI I had the same issue on the Marvell NAND controller: the actual
frequency of the controller clock was half of the "parent" clock
retrieved by clk_get_rate(), hence I needed to double the clock period
for the timings derivation in ->setup_data_interface().

If you can't get more feedback from SAMA5 people and if this works for
you, please send a patch with a nice comment.


Thanks,
Miquèl
