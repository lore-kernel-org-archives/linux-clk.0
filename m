Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B833EEB64DB
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 17:35:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238023AbjFORfl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jun 2023 13:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjFORfk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jun 2023 13:35:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42281FF9;
        Thu, 15 Jun 2023 10:35:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F9AE63AE7;
        Thu, 15 Jun 2023 17:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926F3C433C8;
        Thu, 15 Jun 2023 17:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686850538;
        bh=iIQcIkQ1b5r+KU0ywdmvEZarkCGumgu/khmjPv5GYhw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e2WuWovPyXjfCVns8eymSfLhSyDxgvmEKAIrCyfolaQEeM8RSRiSGAXr4zpdXE2JM
         A/vZZ5FRVlnMPhZMQJMyAtfuLQXJHiq3MFUkUQLjaUTZwDGAgi+WnF+EezzCx0TzGj
         lyaZGnBOnF4wfuAmwCtKqzl/cfPXg+kQ2hURsRtdGBk1tp5rr+o8ogMSb4kblSA/xv
         E1joP/NZ8vlnoSLO2f5Ggr/xPqXxrRrAUlEEOo62vT/lHn/OsE/Uy/GK62RLQxMMBv
         sXWuWhKDB8f/Y2hWI8n0LlgfmXwEKQTuQyRSgZOFMr11cB1r2MfgteKi8kycRX7Fc1
         +qHEOfNMA3uzA==
Message-ID: <b65e8ead63e253350f47c1a2d32d797b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230609140751.65129-1-krzysztof.kozlowski@linaro.org>
References: <20230609140751.65129-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: clock: drop unneeded quotes and use absolute /schemas path
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Conor Dooley <conor+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Date:   Thu, 15 Jun 2023 10:35:36 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Krzysztof Kozlowski (2023-06-09 07:07:51)
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.  Also absolute path
> starting with /schemas is preferred.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
