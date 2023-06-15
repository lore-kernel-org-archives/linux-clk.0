Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0539EB64DC
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jun 2023 00:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237277AbjFOAf4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 20:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236821AbjFOAfz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 20:35:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF76269A;
        Wed, 14 Jun 2023 17:35:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 51F516290F;
        Thu, 15 Jun 2023 00:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C5CC433C0;
        Thu, 15 Jun 2023 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686789353;
        bh=9VWiK/eOWLvZAKTWuUz2vckGtlkNMVjZPGK1dSYO8TU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a8IV6EKuz5VGKLcVPi7xk9OAzQME4tGt8COClUV4rg+DbzrTFs0Mkj0Xl2IPXXlyf
         S7QD0PI3B2XXiQLUZJ7/lfUL7EMTb4RWEloimV6gY3LQTz9M9bEvAYsKjHsfLhis/Y
         tQTDLddJ/QR4VaRhHpD/cqaVj0u5M7D5KtiySuXsas6pKO3I4BxOfv+/6yVtmgJXZB
         x6iURX+5igJchKjbmqzo+ckn/JkLcscS1gpTF+6dJ2frvtXknzbtCLNbtA/iVOBuzH
         E3rEkRshvfKd32llpNyB7Ue7KiDUypSS4JTuTLtImqF411nywe6jtFxWUwu2+mnqGQ
         6fzAImssbH0uw==
Message-ID: <b07d3bfae4702417010ed5ee14739bb0.sboyd@kernel.org>
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
Date:   Wed, 14 Jun 2023 17:35:51 -0700
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

It's not clear if I should pick this up. Do you want to take it through
some DT tree?
