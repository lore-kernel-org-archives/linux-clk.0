Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33135 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751154AbdHCQaw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Aug 2017 12:30:52 -0400
Date: Thu, 3 Aug 2017 11:30:49 -0500
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] dt-bindings: add binding for the SY8160A voltage
 regulator
Message-ID: <20170803163049.3v24y763c4giz7ov@rob-hp-laptop>
References: <20170723102749.17323-1-icenowy@aosc.io>
 <20170723102749.17323-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170723102749.17323-2-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sun, Jul 23, 2017 at 06:27:40PM +0800, Icenowy Zheng wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> SY8106A is an I2C-controlled adjustable voltage regulator made by
> Silergy Corp.
> 
> Add its device tree binding.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> [Icenowy: Change commit message]
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  .../bindings/regulator/sy8106a-regulator.txt        | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/sy8106a-regulator.txt

Acked-by: Rob Herring <robh@kernel.org>

