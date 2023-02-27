Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98073C64ED8
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 09:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjB0JLd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 04:11:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjB0JLT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 04:11:19 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959721B54C;
        Mon, 27 Feb 2023 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677488597; x=1709024597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nyE/K+Pz+wcKKkGoL+rUVG2U0lx/ddOr7NTEO/KWVXw=;
  b=LAvS94sVq3JTcHGrtkBRbFN3ewcL25Z/YY7WYLFMh5ZOAxJ8+cZ2wFSc
   DRSQOQjua2gt0jGXyybrR+uvPNjM3oSZPk6qmBu21bziDyXwqThs95Otn
   WhUVC5dsQCVwQEQQoVEmH4hhP9vIvqA0Pg1bijfu/GkEmgCfLPkAK6cg6
   7oexUZQg2g5X4k/b12K2R+T+nYodEVZ2wsBuGzLLsCYSILg626ahjpL4v
   SBfbt6QawxfRBRrFTxgd9ac0fZr7/Fzn0JH+3nngc/+2rpOxe0HBJUE0z
   5ZexoGuqM4EX8e6GIPRA7uxkfi+siW8UkqfD+ww47txUwskjj7Am+UwK4
   A==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669071600"; 
   d="scan'208";a="29326848"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 27 Feb 2023 09:38:30 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 27 Feb 2023 09:38:30 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 27 Feb 2023 09:38:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1677487110; x=1709023110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nyE/K+Pz+wcKKkGoL+rUVG2U0lx/ddOr7NTEO/KWVXw=;
  b=B9voUwt0fM9sg1rjIn6OwGm4B45G6kG7+QWBk/1Fj/ncaBNc7ZRSluhG
   Dah4+fHRXwV4dAtVI00CbRAdL3UsJoGpsO6lis9GyzFJhdZLfeuj/wiIb
   HQUqMd16ML/Ckn5p48hr5EULFcvJhrq/Yk1vy3F/HZGxri8Mxuy7FT8tC
   Uk1dAZK7ylmLMW4LEq9WsG8gIo3z0rtwM7nmJsT5ZH13tE/fKz6Df+lzw
   SnurgfsVhmtN7INxKoEIlgBFT+SNjM0lA7KIoyI39miPhClk/4c878XEm
   AZ5Xh4dOHxHRDNMYi/c3uGs0hVf8CKJVPLrA/LcuTgU/whp86h0Ad2xeD
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,331,1669071600"; 
   d="scan'208";a="29326847"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 27 Feb 2023 09:38:30 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F2D48280056;
        Mon, 27 Feb 2023 09:38:29 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] clk: Introduce devm_clk_hw_register_gate_parent_data()
Date:   Mon, 27 Feb 2023 09:38:29 +0100
Message-ID: <8196426.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230223171114.59164-1-marex@denx.de>
References: <20230223171114.59164-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

thanks for respinning this series.

Am Donnerstag, 23. Februar 2023, 18:11:10 CET schrieb Marek Vasut:
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
> V3: New patch
> V4: - Rebase on next 20230223
> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 842e72a5348fa..92b7c794c6272 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -608,6 +608,25 @@ struct clk *clk_register_gate(struct device *dev, co=
nst
> char *name, __devm_clk_hw_register_gate((dev), NULL, (name), (parent_name=
),
> NULL, \ NULL, (flags), (reg), (bit_idx),		      \
>  			       (clk_gate_flags), (lock))
> +
> +/**
> + * devm_clk_hw_register_gate - register a gate clock with the clock
> framework + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_data: parent clk data
> + * @flags: framework-specific flags for this clock
> + * @reg: register address to control gating of this clock
> + * @bit_idx: which bit in the register controls gating of this clock
> + * @clk_gate_flags: gate-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data,
> flags,  \ +					      reg,=20
bit_idx, clk_gate_flags,   \
> +					      lock)	=09
	      \
> +	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
> +				    (parent_data), (flags), (reg),=20
(bit_idx), \
> +				    (clk_gate_flags), (lock))
> +
>  void clk_unregister_gate(struct clk *clk);
>  void clk_hw_unregister_gate(struct clk_hw *hw);
>  int clk_gate_is_enabled(struct clk_hw *hw);

Is it worth to add the parent_data paremeter into existing=20
devm_clk_hw_register_gate macro? Just adding this new macro for setting=20
parent_data instead of parent_name seems a bit too much. What if someone wa=
nts=20
to set parent_hw? Add another macro?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


