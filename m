Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C89BC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbiI3UoZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:44:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbiI3UoX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:44:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED9C1F349E;
        Fri, 30 Sep 2022 13:44:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 008E0B82A00;
        Fri, 30 Sep 2022 20:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7584C433D6;
        Fri, 30 Sep 2022 20:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570659;
        bh=AfLNpdxD2hqrSjc0y+MYbVVOWkzdGOn41Pw6gso17/o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cyeGgMGHHl8R05HaxpFWiYGp0j/J1iVApzIbaYPiznyb7dYjp016lYqTibLiVDSLg
         FiqpUIh/1W9LeitZInqJLqTUPMnViAjzR40C4E8TODoGNKB40Rg03U2Ddk7HOrwDOE
         P/mIT6YiWbCXgjmguqhwBGVQHhXaqr9NGQ5Fdu14hUuwqjzuAvg09iQ6PfJDh1qBlx
         FlFJSyAAe3dieaccYjgTrNnePwls5oG/VBI9TPiur+AmrSLy8cYeH5Ei1anDWGsYiE
         8RVq0DFJHKhYBI5wBghqZnV5dccoEA+M+c/NBFjL71L5hIZvJDBHLJPrL9UAqxnjAV
         Q4DIlZxp3WQdw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-7-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-7-doug@schmorgal.com>
Subject: Re: [PATCH 06/12] clk: mmp: pxa168: fix incorrect parent clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:44:17 -0700
User-Agent: alot/0.10
Message-Id: <20220930204419.A7584C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:31)
> The UART, SDHC, LCD, and CCIC peripherals' muxed parent clocks didn't
> match the information provided by the PXA168 datasheet:
>=20
> - The UART clocks can be 58.5 MHz or the UART PLL. Previously, the first
>   mux option was being calculated as 117 MHz, confirmed on hardware to
>   be incorrect.
>=20
> - The SDHC clocks can be 48 MHz, 52 MHz, or 78 MHz. Previously, 48 MHz
>   and 52 MHz were swapped. 78 MHz wasn't listed as an option.
>=20
> - The LCD clock can be 624 MHz or 312 Mhz. Previously, it was being
>   calculated as 312 MHz or 52 MHz.
>=20
> - The CCIC clock can be 156 MHz or 78 MHz. Previously, it was being
>   calculated as 312 MHz or 52 MHz.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
