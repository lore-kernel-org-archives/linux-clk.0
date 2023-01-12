Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AE2C678D7
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 19:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbjALT31 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240657AbjALT2t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 14:28:49 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1583CE1B;
        Thu, 12 Jan 2023 11:23:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D8B2620DC;
        Thu, 12 Jan 2023 19:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1E3C433D2;
        Thu, 12 Jan 2023 19:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673551429;
        bh=mNHfMB3ezBgR8E+cgbYWNGEAYRYvBC+Ckld+7VwpKI4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U/sz9ySymWQOfzlbuF6hk1ogRqlSggYFIKlcGlB8LtSNs6pqgDFvdKyqMAguQ1Fgl
         Hsus+i96/5xLerGUriHLsRY2uEm9JeTJhYKN9/hiInRx6t3CqMKgygQdTs34Q6TduB
         zvcIH/B9R4HmCAKyoTMTNEmHhj6dporLzNM4CdHLZolP2hhj2kQRuLXDTiGKPI6EF/
         2LDjnEmafWpb2rjovYc/ryF5ivOi84E43ImYfj0tmQCn3/aPrmoP9T4vG3t7SvDfdO
         rS4/grmaw1ja5qADg+xebHeFslHGHvEYtLQGFb+4TcytK71VbibCfNjNPrnLo+GVGr
         cfMyA3UJf+tIw==
Message-ID: <6acc49ceefa3ac55433dc3c9f1259fb0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221223030540.62018-1-peng.fan@oss.nxp.com>
References: <20221223030540.62018-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] dt-bindings: clock: imx8m-clock: correct i.MX8MQ node name
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
To:     Peng Fan (OSS) <peng.fan@oss.nxp.com>, abel.vesa@linaro.org,
        abelvesa@kernel.org, festevam@gmail.com, kernel@pengutronix.de,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Date:   Thu, 12 Jan 2023 11:23:47 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Peng Fan (OSS) (2022-12-22 19:05:40)
> From: Peng Fan <peng.fan@nxp.com>
>=20
> i.MX8MQ CCM is at address 0x30380000, so correct it.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Applied to clk-next
