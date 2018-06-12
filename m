Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-yb0-f195.google.com ([209.85.213.195]:44318 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933793AbeFLVy0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jun 2018 17:54:26 -0400
Date: Tue, 12 Jun 2018 15:54:22 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: clk: at91: Document all the PMC
 compatibles
Message-ID: <20180612215422.GA7376@rob-hp-laptop>
References: <20180607084107.4461-1-alexandre.belloni@bootlin.com>
 <20180607084107.4461-3-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180607084107.4461-3-alexandre.belloni@bootlin.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jun 07, 2018 at 10:41:05AM +0200, Alexandre Belloni wrote:
> Add missing PMC compatibles to the list of available compatibles.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  Documentation/devicetree/bindings/clock/at91-clock.txt | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

