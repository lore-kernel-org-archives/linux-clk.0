Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E174C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbiAYW3h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:29:37 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:37840 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233844AbiAYW3h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:29:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C42E961853;
        Tue, 25 Jan 2022 22:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2357DC340E0;
        Tue, 25 Jan 2022 22:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149776;
        bh=J5xMd6OKHg2q6VIcLrwbGKPoozOB4FGfNctGEXM9xMM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=R41h061Atjf+sAonB9LzfrGAG2NWqapXiPJhsARkJzZhnBIbcywUtdGkfXbL6bhpP
         0jiHcKxJFjuNF4tCL+7cTRScBeoakMJL6QZUns5dVo0R4fwvE5u/XPPyVc4025M2Vz
         PQkTquEchKczs5UOVOC86tXqOKUZW7C87OxFGzBAsoF400ofaxDHximkBWBa4jWsju
         xe50eEGMUCKThYTFnX8H2I6CUOT3vKkMnc5zpvHQ9g0i9W9H2uxVTpycHJxDxYV4G0
         pPo6llA+6BcCmgVKrt8ILNf7Z6Q6w4Z0PWsPHznrYXz80gAn1FvOiFml5ms9WeyWwG
         mpz+rLRdZjUfA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-4-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-4-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 3/9] dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:29:34 -0800
User-Agent: alot/0.10
Message-Id: <20220125222936.2357DC340E0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:30)
> This mode allows the PLL to maintain lock even when CLK_IN has
> missing pulses for up to 20 ms.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Applied to clk-next
