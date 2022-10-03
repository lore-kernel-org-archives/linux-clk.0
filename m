Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26F5C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 19:34:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJCTer (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 15:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiJCTep (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 15:34:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12948BF53;
        Mon,  3 Oct 2022 12:34:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3EED7611D0;
        Mon,  3 Oct 2022 19:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96285C433C1;
        Mon,  3 Oct 2022 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664825681;
        bh=YTRCQYS5gwiLBwDfHgyeyCgWl/i616lUexzsbqfs9SY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=F+CxN7j0pcNRA9YSRo2BZuksk3YmOqbog0BGXwm8mpF/GyzItQy/rRNpBkKqaGhjI
         5+uDhAcYozhwWOzM4mhe01CSUMUvMQiRMaijHrcAOtKUT7C26paF8FYcop8Xdhr2OE
         xrPDu2mQoAOUTC8gdzC3scL1xShjgI7y9bOisJ5sViHs1Rd3NnPXpIb0XiHbHwIAX2
         HGcddXetXi9iXg01/INAyBMfHF1ENfn/MVifwZEVzCQCAwrQ+tK54t05cqKgQJ7WPI
         qG+W6uNgW9utC6TXALgdq0EWBDGOMfooiNTogA+GN114auoaXsKK0wzd52KRJE9V6D
         H0hcs31NbSLuQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220521111145.81697-42-Julia.Lawall@inria.fr>
References: <20220521111145.81697-42-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] clk: nxp: fix typo in comment
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 03 Oct 2022 12:34:39 -0700
User-Agent: alot/0.10
Message-Id: <20221003193441.96285C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Julia Lawall (2022-05-21 04:10:52)
> Spelling mistake (triple letters) in comment.
> Detected with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20
> ---

Applied to clk-next
