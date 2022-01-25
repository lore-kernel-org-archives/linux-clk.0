Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC1AC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 22:30:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbiAYWaA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 17:30:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233856AbiAYW34 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 17:29:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD6AC061744;
        Tue, 25 Jan 2022 14:29:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3076D6185A;
        Tue, 25 Jan 2022 22:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBBDC340E7;
        Tue, 25 Jan 2022 22:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643149794;
        bh=jy7EqBNfRb6JcTpQ27IS3crYtAT6dfNHWCqIirelhX4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MKCS4sBbOerhP1vvt+y1i/xjKv5jCY89P/lBXKjuFMcvn+who3zwkJDPFqjTacIFg
         g6ba1riPtg32wxnSrviLt2RwmfBYAS7aNPE63KJBZsf6sSo0Zqr5XWlQwNfmxAavrG
         QO/PhA259fuOdYGyP6AyhDfiRE/NtqqVGgusRjdDcTVUzMjUmAyIBnZiaypifOTBVf
         w9dNp/PSnI03kW/Rgpm5ixMPt04HIIMdO3/8V6xAgjugC2y6va0MhiUSBnmEQ+rc0x
         tbrOJoplMO3+blUGCPIEEcYonoolJW75fPGrdJ+CiI+yluAnUAg7YGV1+aW6wzAE8/
         QenER5tD0kgjg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125093336.226787-6-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org> <20220125093336.226787-6-daniel@zonque.org>
Subject: Re: [PATCH RESEND v4 5/9] clk: cs2000-cp: Make aux output function controllable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
To:     Daniel Mack <daniel@zonque.org>, mturquette@baylibre.com
Date:   Tue, 25 Jan 2022 14:29:52 -0800
User-Agent: alot/0.10
Message-Id: <20220125222954.7FBBDC340E7@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Daniel Mack (2022-01-25 01:33:32)
> The aux output pin can be configured to output either of the two clock
> inputs, the generated clock or the pll lock status. Allow access to
> this feature through a new optional device-tree property.
>=20
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---

Applied to clk-next
