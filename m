Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D04FC61DA4
	for <linux-clk@archiver.kernel.org>; Fri, 24 Feb 2023 00:25:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjBXAZB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 19:25:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjBXAZB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 19:25:01 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78BB4DBF9;
        Thu, 23 Feb 2023 16:24:59 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso1068431pjb.5;
        Thu, 23 Feb 2023 16:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gysGhMcUQ0n2SpBIwRmVe4+oZ4N6GELTjU0y0sJHeKI=;
        b=qvtCVJebtlULReB8q4nQA9xUaE1XYvjTC6nlbDGgL4XLkr9XSCyxBkqhyWlnwJITDK
         hpaJH1dqwd3W+B0kteA5GKhBmpjoXzxtdwO5Sh0OhXf5y2q6EStBxY+zxVBZji061jU4
         lgrxh+3i7Qfqze1cTNjBQzKZwxsAWoJKcuaR7k34VtEkvzgQiWIVDZagIbxPYxbDisxD
         L/0WzvZqrfcxloOySqIwP7kVPSVH6eomv41c7L944xk31oUdlpE7DsCSnYd+5oGKe9LO
         sSIHnnA6ngGJ8g9iI4fd+gjpxZNERn8zdgDREvxwLDaPcglaQeSY6/SpLvGxmVNYA1mH
         1+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gysGhMcUQ0n2SpBIwRmVe4+oZ4N6GELTjU0y0sJHeKI=;
        b=f6E5/56ft/pJyVHlktMteA1dNQZSjqJ9j4YCu/hLI+04iXXnxSlIXKAjutSwj5cXqd
         Idgdq3WSzBZ7yTavWpBFx8+RSjD+q03gcaLIdlNqxK2uYz/o3aZBa2X4uIU5mL/I3eac
         QiAgsAAf6cja3wmNkMfnBF0dyX2BsU/+pEjZZwyoon5H6johjv7TrHp9jRQhROFzajR2
         ahRRHhORqST2XjvVgBPCgIvi49ngtxeo4GRNlm2b+cB7fhvU1W3019I4rugGYz3Bd7Rl
         Y8s5moBSu6CIaH09QHhE4fqeIEgUCGgiWEmwMovm0pcYsHoxAQy/TKKbTkJWqJtrMjK6
         Yt9Q==
X-Gm-Message-State: AO0yUKXEgsVGxP1s7UMi91YXlmb+4jmPnWkILM3ZGLIBMoODs0jmgnnR
        PJjlBE9SBR/K2VqD1VCuX0MNQusQ8gnHeuxvWwA=
X-Google-Smtp-Source: AK7set/XazoMOetvfmwxlAs8+m/rm0FfjIGQ8anvDUmgg1Nt7S+36MMMPSrbAZ1L3Ab5Dzu7Syoalud5PMnylQW/Dzc=
X-Received: by 2002:a17:90a:8990:b0:22c:aa7:2d98 with SMTP id
 v16-20020a17090a899000b0022c0aa72d98mr1028188pjn.6.1677198299084; Thu, 23 Feb
 2023 16:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20230223171114.59164-1-marex@denx.de>
In-Reply-To: <20230223171114.59164-1-marex@denx.de>
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 23 Feb 2023 18:24:47 -0600
Message-ID: <CAHCN7xLPvV7=GxSfUJFTtUTEi_16cpRQnR3zCGhFTWDzmk4ERA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] clk: Introduce devm_clk_hw_register_gate_parent_data()
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 23, 2023 at 11:12 AM Marek Vasut <marex@denx.de> wrote:
>
> Add an API for clock gate that uses parent_data for the parent instead of
> a string parent_name.
>

For the series:

Tested-by:  Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

adam
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
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 842e72a5348fa..92b7c794c6272 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -608,6 +608,25 @@ struct clk *clk_register_gate(struct device *dev, const char *name,
>         __devm_clk_hw_register_gate((dev), NULL, (name), (parent_name), NULL, \
>                                NULL, (flags), (reg), (bit_idx),               \
>                                (clk_gate_flags), (lock))
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
> +                                             reg, bit_idx, clk_gate_flags,   \
> +                                             lock)                           \
> +       __devm_clk_hw_register_gate((dev), NULL, (name), NULL, NULL,          \
> +                                   (parent_data), (flags), (reg), (bit_idx), \
> +                                   (clk_gate_flags), (lock))
> +
>  void clk_unregister_gate(struct clk *clk);
>  void clk_hw_unregister_gate(struct clk_hw *hw);
>  int clk_gate_is_enabled(struct clk_hw *hw);
> --
> 2.39.1
>
