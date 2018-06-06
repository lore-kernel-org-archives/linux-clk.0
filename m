Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52775 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932394AbeFFIoy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jun 2018 04:44:54 -0400
Date: Wed, 6 Jun 2018 10:44:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Michel Pollet <michel.pollet@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, phil.edworthy@renesas.com,
        Michel Pollet <buserror+upstream@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/5] ARM: dts: Renesas R9A06G032 base device tree file
Message-ID: <20180606084450.vcyqwervf5ya2djh@verge.net.au>
References: <1528187462-47093-1-git-send-email-michel.pollet@bp.renesas.com>
 <1528187462-47093-4-git-send-email-michel.pollet@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1528187462-47093-4-git-send-email-michel.pollet@bp.renesas.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 05, 2018 at 09:29:59AM +0100, Michel Pollet wrote:
> This adds the Renesas R9A06G032 bare bone support.
> 
> This currently only handles the SYSCTRL block node,
> generic parts (gic, architected timer) and a UART.
> 
> Signed-off-by: Michel Pollet <michel.pollet@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Hi,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
