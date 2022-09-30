Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E49BC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 20:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbiI3Uob (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 16:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbiI3Uob (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:44:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5123F1F44D7;
        Fri, 30 Sep 2022 13:44:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 10D6EB82A01;
        Fri, 30 Sep 2022 20:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE63C433D6;
        Fri, 30 Sep 2022 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570667;
        bh=AEcC3UsmWfRUQw8oCYVA+Dx5zs/Wpnz+NY5dtxwN3EQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Xh2OAfjJLrpDnOVf/+wk9NixIpRhvFswUkgmVC5BKk5NGJ9BMo9CSZGUrizrLjqSz
         Yb4HDcHPB5iko7f6Gf9Yd5CiQ6ArWpzAReY/WzMIIRVmdYN3S+DrUds2gFL51os7zx
         KAoqwgXdAuTDXDdwQ0d/eiHHqJ5bBCO7qferFcJwgyuaWWrpuMRuafsSU/DszY2wWr
         Atoh2abx5V8ydhdPICkMqbxVyByHW975G1P7/xLVJ5xUaQ+qC11aDqYapdR7Ll+fkK
         7r73EQlqBiROtcTOmKJD6rU1kdNuhhwjayNunYIlRc+dJWVwwyUaZfvBNfl4O4VO9K
         U74Hva02wR/qg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-8-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-8-doug@schmorgal.com>
Subject: Re: [PATCH 07/12] clk: mmp: pxa168: add muxes for more peripherals
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:44:25 -0700
User-Agent: alot/0.10
Message-Id: <20220930204427.ADE63C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:32)
> The TWSI, KPC, PWM, and DFC peripherals didn't have their muxes modeled
> in the code, but the PXA168 datasheet shows that they are indeed muxed:
>=20
> - TWSI can be 31.2 MHz or 62.4 MHz
> - KPC can be 32 kHz, 16 kHz, or 26 MHz
> - PWM can be 13 MHz or 32 kHz
> - DFC can be 156 MHz or 78 MHz
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
