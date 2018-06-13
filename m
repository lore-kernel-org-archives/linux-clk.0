Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44093 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935314AbeFMMs7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jun 2018 08:48:59 -0400
Date: Wed, 13 Jun 2018 14:48:50 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dong Aisheng <dongas86@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] mailbox: Add support for i.MX7D messaging unit
Message-ID: <20180613124850.w3bzerkpkbql6ite@pengutronix.de>
References: <20180601065821.28234-1-o.rempel@pengutronix.de>
 <20180601065821.28234-5-o.rempel@pengutronix.de>
 <CAA+hA=RpoRXUK+jB18F4OeYE9PG73SDa_NLYeN5Q2G3B1bC-JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAA+hA=RpoRXUK+jB18F4OeYE9PG73SDa_NLYeN5Q2G3B1bC-JA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jun 13, 2018 at 08:21:10PM +0800, Dong Aisheng wrote:
> Hi Oleksij,
> 
> On Fri, Jun 1, 2018 at 2:58 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> > The Mailbox controller is able to send messages (up to 4 32 bit words)
> > between the endpoints.
> 
> Could we really be able to send up to 4 42bit words with this driver?
> 
> It looks to me the current Mailbox framework is more designed for share mem
> transfer which does not fit i.MX MU well.

The mailbox framework just defines channels and messages. A message is a
void * which may contain arbitrary data or even no data at all; some
drivers simply ignore the message pointer, so in fact they act as a
doorbell unit only.

There's nothing about shared memory in the mailbox framework, but of
course you can combine a mailbox driver and shared memory to a remote
message mechanism. That could be done with the i.MX MU aswell and would
indeed be a good match for the hardware.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
