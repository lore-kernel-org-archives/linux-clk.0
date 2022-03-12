Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39355C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 03:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiCLDdh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Mar 2022 22:33:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCLDdg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Mar 2022 22:33:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F0C23F3A3;
        Fri, 11 Mar 2022 19:32:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2155A619B3;
        Sat, 12 Mar 2022 03:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB87C340E9;
        Sat, 12 Mar 2022 03:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647055950;
        bh=5c/uqaf7HToSvDPVi8t5ZcxA8su2vJ0/79YKHfkHeB0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ExM6Ngjp3aVt6jQtzDZpF+jinio9XtIB5t7hXIdl3WJufUQEUlr01m6RyVbCA/4rk
         so2vkwtW05akkZA7B/bJOhetDZjnyOYorA2RAAX+AGXEqDTQ52aWVJ+xWtS0SKCZZo
         xSMAzl/1cwSI74vD/7fNveugQxty8loZwgCH1Va5EwoBHUSPRKbpywxunkF4JpxCPw
         JUMMLl5xXjFReE7uOUEMET5HC0dqHpgeuyRHPmHoDBxCFc/5hInN992N1q+xmN7Dnp
         ieuf8kryS2+0HEMhC1EwTyc7XSemipI3/rK6oXwZxMkLNgG/TLxo2ZotUOp+EY9Ndf
         yPFz4iG4jmd1Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220222121143.3316880-2-conor.dooley@microchip.com>
References: <20220222121143.3316880-1-conor.dooley@microchip.com> <20220222121143.3316880-2-conor.dooley@microchip.com>
Subject: Re: [PATCH v12 1/1] clk: microchip: Add driver for Microchip PolarFire SoC
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     krzysztof.kozlowski@canonical.com, geert@linux-m68k.org,
        david.abdurachmanov@gmail.com, palmer@dabbelt.com,
        daire.mcnamara@microchip.com, cyril.jean@microchip.com,
        conor.dooley@microchip.com,
        Padmarao Begari <padmarao.begari@microchip.com>
To:     conor.dooley@microchip.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Date:   Fri, 11 Mar 2022 19:32:27 -0800
User-Agent: alot/0.10
Message-Id: <20220312033230.5CB87C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting conor.dooley@microchip.com (2022-02-22 04:11:44)
> From: Daire McNamara <daire.mcnamara@microchip.com>
>=20
> Add support for clock configuration on Microchip PolarFire SoC
>=20
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Co-developed-by: Padmarao Begari <padmarao.begari@microchip.com>
> Signed-off-by: Padmarao Begari <padmarao.begari@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next
