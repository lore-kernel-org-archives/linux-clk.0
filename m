Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:34468 "EHLO
        mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751033AbdDBRC7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Apr 2017 13:02:59 -0400
MIME-Version: 1.0
In-Reply-To: <5c8339900fa1bd6215fb94d4386f7e06@agner.ch>
References: <20170330005029.6472-1-stefan@agner.ch> <20170330005029.6472-2-stefan@agner.ch>
 <20170401030312.GB24882@b29396-OptiPlex-7040> <5c8339900fa1bd6215fb94d4386f7e06@agner.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 2 Apr 2017 14:02:58 -0300
Message-ID: <CAOMZO5CprxqnqRXMFJLBAgYAZGGnXNs3ZciyVz_mSLRnnSQQRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx7: add USDHC NAND clock to SDHC instances
To: Stefan Agner <stefan@agner.ch>
Cc: Dong Aisheng <dongas86@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sat, Apr 1, 2017 at 1:15 AM, Stefan Agner <stefan@agner.ch> wrote:

> IMX7D_IPG_ROOT_CLK is currently not a valid clock in upstream... So we
> would have to add it to the clock driver first.
>
> I guess we could/should add it anyway at one point? But probably also as
> init on, just to make sure Linux does not disable it since it is
> currently used by several IPs implicitly.

Yes, I made a previous attempt do add  IMX7D_IPG_ROOT_CLK and it did
not work as I did not put it in the init_on clock list.

Will submit a new patch adding it to init_on, thanks.
