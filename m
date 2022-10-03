Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C69C433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 19:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiJCTEO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 15:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJCTEO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 15:04:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB3A2F649;
        Mon,  3 Oct 2022 12:04:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C33CB611AB;
        Mon,  3 Oct 2022 19:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1813DC433D6;
        Mon,  3 Oct 2022 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664823852;
        bh=GGHjDBuneKODHhVfWDf+o6RXwIz9ZZ4eGxmJXVNC5So=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=kqtBDu9XDb2Pd8gh2nRvyS2Cz/32TJ/RH/jQCpJQvVTuq6IFj8vYPKMNM6KAjsA83
         UX+Fp/EVNuCXnL3QO8pilwdfbSBhpSIcoC9+gmF6fAbPrZZPH6Y130C8QvC0clpAfw
         xV900u0u8fbf/1FWCjYhQtcVuJlDKLzz+OKggk8tgLuz2VqgAcoYKigMBAHLvygOTl
         tY8/DLcviGsu+vdUpwskgrIPQ+mdBPcKwD1XRMBtWCsVgi4/fUjhLP1MJb+4Rfa0IW
         1RdsBDOAAfalvKtnq6Yurj8HwJaQo7dFUSgYLGiV9FB6cruckkDCEyqU+bTC45O3+M
         OTzfUiPhudp6g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220511053455.360335-1-matthias.fend@emfend.at>
References: <20220511053455.360335-1-matthias.fend@emfend.at>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: vc5: Add 5P49V6975
From:   Stephen Boyd <sboyd@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, matthias.fend@emfend.at
Date:   Mon, 03 Oct 2022 12:04:10 -0700
User-Agent: alot/0.10
Message-Id: <20221003190412.1813DC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Matthias Fend (2022-05-10 22:34:54)
> The 5P49V6975 is a member of the VersaClock 6E family and supports four
> fractional dividers (FODs), five clock outputs and an internal oscillator.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---

Applied to clk-next
