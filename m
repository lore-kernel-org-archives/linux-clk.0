Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:35411 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752508AbeCEWWp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 5 Mar 2018 17:22:45 -0500
Date: Mon, 5 Mar 2018 16:22:44 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: imx7d: add the Keypad Port module clock
Message-ID: <20180305222244.xa42gzjru2ysezyu@rob-hp-laptop>
References: <20180227160544.11446-1-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180227160544.11446-1-stefan@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 27, 2018 at 05:05:43PM +0100, Stefan Agner wrote:
> According to the i.MX7D Reference Manual, the Keypad Port module
> (KPP) requires this clock gate to be enabled.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/clk/imx/clk-imx7d.c             | 1 +
>  include/dt-bindings/clock/imx7d-clock.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
