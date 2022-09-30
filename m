Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2286C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 00:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiI3AyF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 20:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiI3AyB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 20:54:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DE041533;
        Thu, 29 Sep 2022 17:53:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0872C61729;
        Fri, 30 Sep 2022 00:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A25C433D6;
        Fri, 30 Sep 2022 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664499236;
        bh=I9QA23vfoNrD0AkuqNaEj2pXmfChCoIPU6a0UA3lmb0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ITLjs3ktxk8Dy1aohKTJK1cntg9yqkyb42kzgS+VmEeHOA9aiWahT5Se8TnKZOxGv
         5NoEbEPJWSpkLAblBR9f2f9y4Araw6r3JReQSLd5yQyojzXgq5z/n1oIU3UE55WVfH
         fm6Sgq910FuFN2rITKwGBut01LlnVGGg/CJVHdSfrAgrjZDMvf2z6Z0vHGW+RWNlvu
         HUvgqAoA6jVib8REpVU1MkJ0wya0CxgbBObLuOyOS1ZrXx3ShkmK6U5q7Vw3N4vvZ+
         AEzFVKtstRI1hGebCLIwFUEZHTfcreE7jV+AR4ps05cMQwqeQjZtu56OwT0lXFIcbk
         TM4tRZpEpHgpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1663929905-10492-2-git-send-email-jun.li@nxp.com>
References: <1663929905-10492-1-git-send-email-jun.li@nxp.com> <1663929905-10492-2-git-send-email-jun.li@nxp.com>
Subject: Re: [PATCH RESEND v3 2/3] clk: imx: imx8mp: add shared clk gate for usb suspend clk
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, mturquette@baylibre.com,
        l.stach@pengutronix.de, peng.fan@nxp.com,
        alexander.stein@ew.tq-group.com, gregkh@linuxfoundation.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
To:     Li Jun <jun.li@nxp.com>, abelvesa@kernel.org
Date:   Thu, 29 Sep 2022 17:53:54 -0700
User-Agent: alot/0.10
Message-Id: <20220930005356.66A25C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Li Jun (2022-09-23 03:45:04)
> 32K usb suspend clock gate is shared with usb_root_clk.
>=20
> Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> Cc: stable@vger.kernel.org # v5.19+

Why is stable Cced? The commit text doesn't tell me what sort of
regression is being fixed. Please help!
