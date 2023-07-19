Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019B3C001B0
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjGSTtr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbjGSTtq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 15:49:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190781BCF;
        Wed, 19 Jul 2023 12:49:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9F391617EE;
        Wed, 19 Jul 2023 19:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064EBC433C8;
        Wed, 19 Jul 2023 19:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689796185;
        bh=ingW8y6sdKgXX/OMnZUdpUJl0w+rjz0jv1JoJE9Q0IE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kdxvGSjyG7M0SFO5B9GhUUsd8SBCMxSs8bJufxF4HgvSu58Q1VdVLZMaQixxAaGFP
         t73Z5/I8uyl5WQSeLNszwMozBaw9I6yzydlR+wwKUoXac9EIWJdPuI3nVtqzUw32gZ
         LIBbSSBeRODdOens2c4zPNCepgqCgeJ1turXhq5B6nTYq2AKJWK66ffNVikcBiMaq+
         mMPl4SZrrgewoWeDjxFejM39Qdmb7KM+pdU1oDC/r67chp3VSFFVVwkDy7LgZuiP82
         VQqQRcZFmyi766E3WoRkOGlTxkcpTYbKTawZJ9ZADvclnr3VyGmihc6tZfcVRsRFvA
         +3LEwO3LT3g5w==
Message-ID: <0fec21782126105bc83420f32c2941f0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230718062616.2822339-1-dylan_hung@aspeedtech.com>
References: <20230718062616.2822339-1-dylan_hung@aspeedtech.com>
Subject: Re: [PATCH v3] dt-bindings: clock: ast2600: Add I3C and MAC reset definitions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     BMC-SW@aspeedtech.com, kobedylan@gmail.com,
        Dylan Hung <dylan_hung@aspeedtech.com>
To:     Dylan Hung <kobedylan@gmail.com>, conor+dt@kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 19 Jul 2023 12:49:42 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dylan Hung (2023-07-17 23:26:16)
> Add reset definitions of AST2600 I3C and MAC controllers. In the case of
> the I3C reset, since there is no reset-line hardware available for
> `ASPEED_RESET_I3C_DMA`, a new macro `ASPEED_RESET_I3C` with the same ID
> is introduced to provide a more accurate representation of the hardware.
> The old macro `ASPEED_RESET_I3C_DMA` is kept to provide backward
> compatibility.
>=20
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>
> ---

Applied to clk-next
