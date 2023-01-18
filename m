Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C092DC32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 18:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjARS52 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 13:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjARS51 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 13:57:27 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9A25B455;
        Wed, 18 Jan 2023 10:57:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A43086199F;
        Wed, 18 Jan 2023 18:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070ADC433F0;
        Wed, 18 Jan 2023 18:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674068245;
        bh=/HdRADiMbWwWn4tnPajehNGFbGQZ7Fly1kGleJWTPHo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=bd3Pz4qMpL/9f9jAWUyBKEJRZRhKF40qG/32+JKl7Rrwk1TO0QutNVw3KtXw0ejs3
         6LXWLAydRelCN0BIZSxGTG5FZzBNYdnAv3bFGwrRP1QRCmSuqjtNIzv39Jeudx/sE/
         rXw5TJnUISvUcCvbjfSH1yxhjNmwkHqSlEWIQkQGVJkLBaIK6vLnXLEOlaMQ9msE5T
         OaDiDVIt7V1vWxMTp48r62t9AxvxvjOhsq6Jvlqy2CJ+8FD06gc+cb40DQ3vY88hZA
         3yspWCmxFJ1KHzZOUGDgWESoBEPJl0xvun9GKc0KLshr3ej/C7p5VaCbvPdQ5/4HfQ
         7WeUzWxZFq6Jg==
Message-ID: <4121e6f0d8c0cb71df9736daa5ddaaee.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230114233500.3294789-2-lars@metafoo.de>
References: <20230114233500.3294789-1-lars@metafoo.de> <20230114233500.3294789-2-lars@metafoo.de>
Subject: Re: [PATCH 2/3] clk: vc5: Add support for 5P49V60
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Lars-Peter Clausen <lars@metafoo.de>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 18 Jan 2023 10:57:22 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lars-Peter Clausen (2023-01-14 15:34:59)
> The 5P49V60 is very similar to the existing supported clock chips of the
> versaclock5 driver and uses the same register map layout. But its maximum
> VCO frequency is 2.7 GHz instead of 3 GHz for the other supported devices.
>=20
> Add a vco_max field to the chip info field to allow to specify a per devi=
ce
> variant maximum VCO frequency.
>=20
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---

Applied to clk-next
