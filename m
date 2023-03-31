Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1B5C76196
	for <linux-clk@archiver.kernel.org>; Fri, 31 Mar 2023 12:25:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbjCaMZt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbjCaMZs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 31 Mar 2023 08:25:48 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2147A1F7AF
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:25:27 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so15198378wmq.4
        for <linux-clk@vger.kernel.org>; Fri, 31 Mar 2023 05:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680265525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8HYghAo66yMblfTK3o0c5DfZlVRc0aKeUwrWVglJyP4=;
        b=aN/oqCFS/Lo6aMBW9sPPiJCV3+qFR/v3dGBRHEgZhgpqNgzgR9BRznyalMEBolRcz6
         s7KC/bs57w64iLqaEv1iwT5QtVIbyyDol3EdbJS5qZW5ckbETu5SDT9oJdon9loXlTsP
         Yvyz+Vs+BD2G23MxER6an0MLDH9PkRjaPlsjawF48xEHx46BKuULWhdzqVlS6eLERNO+
         iDQ/pnX46OUmx26b5SDMt660BXDMU1x7z/350kU1bavIxS1NYohAORW1ob6N9OfhnUfm
         emDpO6OoGW3isNxDe2s8NTv9hjnGzXWDJkssgBtvv99Yq9Phlzm/9t7XOeSmSXIGMhqr
         P0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HYghAo66yMblfTK3o0c5DfZlVRc0aKeUwrWVglJyP4=;
        b=iZPMZysClIWupVJBYTN/v7Wej0R8AaajJWESa7GW0P/b6VuKizrzkzRGOVgzDs49gN
         6kSqhff5kcvwWZgRRGKCCSN49Lx463blHnu3QVetJ1hvFVQA4LEkLsIUJwNn+YxZh7XF
         bSqqVPA3wR8AIQlpcWq2j3liiqQ0sNzb5Y18naqFNNrw8T0fh3MVQfRCQek6E9JTv+v0
         r7kEnnZi6eOYJ/SvSx+dsBkrVIsgJ4JgZfAFVNTzeanXcD8kCMnDnMbQ2u0xefuS35vl
         JWU8Pj0p/2Wmy3YAAop5Ue1aJ5hw2QLwyJKilinpW8zFQIDLkEKOVsS+aqcQfgw/g3Cj
         Xzpw==
X-Gm-Message-State: AO0yUKWg2VnF2R8OVV/sljO9ZCzY1gtfI3VmHcqhzqEkFYR98TDaKUcJ
        V5PgDCNBLfHDUSPzS20yokybEA==
X-Google-Smtp-Source: AK7set95AU6PXV/8AzOCjcliGQVfX4hlG+ooUZAbxjznOxWDJQvQIAVmvxrZbwoLr30NuEbkDSgSQA==
X-Received: by 2002:a7b:c409:0:b0:3ed:2a91:3bc9 with SMTP id k9-20020a7bc409000000b003ed2a913bc9mr21152686wmi.15.1680265525488;
        Fri, 31 Mar 2023 05:25:25 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n13-20020a7bc5cd000000b003ede3e54ed7sm2563895wmk.6.2023.03.31.05.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:25:25 -0700 (PDT)
Date:   Fri, 31 Mar 2023 15:25:23 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Adam Ford <aford173@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/5] clk: Introduce
 devm_clk_hw_register_gate_parent_data()
Message-ID: <ZCbRM3uRQUSQitRG@linaro.org>
References: <20230301163257.49005-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301163257.49005-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-03-01 17:32:53, Marek Vasut wrote:
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---

Applied, thanks!

[1/5] clk: Introduce devm_clk_hw_register_gate_parent_data()
      commit: 27fc5ec673b527dbc2f44787246a39c5ecc01de5
[2/5] clk: imx: imx8mp: Add audiomix block control
      commit: 6cd95f7b151cdd7852ed9f212faeea8f98ecba10
[3/5] dt-bindings: clock: imx8mp: Add audiomix block control
      commit: 95a0aa7bb10e79cfbe8a1dc4b993d21dd58c253f


Best regards,
--
Abel Vesa <abel.vesa@linaro.org>

> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jacky Bai <ping.bai@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
> V5: Add TB from Adam and Alexander
> V6: Add RB from Fabio
> V7: Add RB from Peng
> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 842e72a5348fa..92b7c794c6272 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -608,6 +608,25 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
>  	__devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
>  			       NULL, (flags), (reg), (bit_idx),		      \
>  			       (clk_gate_flags), (lock))
> +
> +/**
> + * devm_clk_hw_register_gate - register a gate clock with the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_data: parent clk data
> + * @flags: framework-specific flags for this clock
> + * @reg: register address to control gating of this clock
> + * @bit_idx: which bit in the register controls gating of this clock
> + * @clk_gate_flags: gate-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_gate_parent_data(dev, name, parent_data, flags,  \
> +					      reg, bit_idx, clk_gate_flags,   \
> +					      lock)			      \
> +	__devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,	      \
> +				    (parent_data), (flags), (reg), (bit_idx), \
> +				    (clk_gate_flags), (lock))
> +
>  void clk_unregister_gate(struct clk *clk);
>  void clk_hw_unregister_gate(struct clk_hw *hw);
>  int clk_gate_is_enabled(struct clk_hw *hw);
> -- 
> 2.39.2
> 
