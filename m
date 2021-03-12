Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36189C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 09:29:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0797764F00
	for <linux-clk@archiver.kernel.org>; Fri, 12 Mar 2021 09:29:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhCLJ23 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 04:28:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:47422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232444AbhCLJ2C (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Mar 2021 04:28:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B80CB64EBB;
        Fri, 12 Mar 2021 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615541282;
        bh=LJ7K6jXC7zs6FWLwpBlB/sPWKqyCjGtiXjYrCWOKjbU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BjMm1DLoEir7REhQeRXXzZ6FyMC725jW6KlD2n7l85yHzFVYldpBWvwm855dpgzWV
         7PYdqWX+ZjSpUcL9GFHv+Rz7BRcFlKpBvAlHt2L9tDzH5rJFLvTr39YJozXPNT1fp9
         NXdWPELd+8qOoLrtZ6ec7449LJzZFOeQ8R1qdkzT5555peu+kPJtspCf0lYzLGKo/W
         zrVCfc80nY/7z8WBttwvg4In4GeiV+WZ09GQw6jeNhSCxCjs7lsteHEgytZAumHnLw
         4u5Ebf9j/1y0ofaD9YEpjMCwEjt1wCl55i2/xjagBu0kQvEcM/l+6DAZYAneUVignF
         1N8E9iZWOtH5g==
Date:   Fri, 12 Mar 2021 10:27:57 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andre Heider <a.heider@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?B?R8OpcmFsZA==?= Kerma <gerald@gk2.net>,
        Konstantin Porotchkin <kostap@marvell.com>
Subject: Re: [PATCH mvebu v3 00/10] Armada 37xx: Fix cpufreq changing base
 CPU speed to 800 MHz from 1000 MHz
Message-ID: <20210312102757.6e319adf@kernel.org>
In-Reply-To: <87a6r8ka6x.fsf@BL-laptop>
References: <20210114124032.12765-1-pali@kernel.org>
        <20210222194158.12342-1-pali@kernel.org>
        <20210301192024.tgvp6f5zscbknepo@pali>
        <87a6r8ka6x.fsf@BL-laptop>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 12 Mar 2021 10:12:06 +0100
Gregory CLEMENT <gregory.clement@bootlin.com> wrote:

> Hello Pali,
> 
> > Hello Gregory!
> >
> > Patches are the for almost two months and more people have tested them.
> > They are marked with Fixed/CC-stable tags, they should go also into
> > stable trees as they are fixing CPU scaling and instability issues.
> >
> > Are there any issues with these patches? If not, could you please merge
> > them for upcoming Linux version?  
> 
> Actually I am not the maintainer of the clk and cpufreq subsystems, so
> the only thing I can apply is the device tree relative patch.
> 
> Gregory

Gregory, could you at least add Acked-by, or Reviewed-by? So that
clk subsystem maintainer will trust these changes, since you are the
original author of armada-37xx-periph.

Marek
