Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F9AC433E0
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 08:16:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7652F64EB8
	for <linux-clk@archiver.kernel.org>; Tue,  9 Feb 2021 08:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbhBIIQM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 03:16:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:42470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229464AbhBIIQK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 9 Feb 2021 03:16:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D27A964DE0;
        Tue,  9 Feb 2021 08:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612858529;
        bh=A4+nKFboC2SFF+NZaAtd3jldZTo0SynlBhbtkbuHIuk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FNtdQs3M5tdTGqUgIuTMzhuDjm/pCgRN8Obfs9qoFiqw4kmYWTN+zBZ5snAHUS5x6
         NWrJJXu1lU5Yq6bP8vWtPZ9/M5YmbqqJ9FfVy04YWLt2aKo8XjzZy2xzkD0fknXDZ4
         Ab2FtuRH0nHRKYUKlF0eQS904/k0p3L3VfHscqr/MHs0TF4rNa2FczJcFltuSU7eSo
         6Ms1gzZnxC/4jdMFt+mf41Xx7VxJTyvLl1KQQZnVtCUXg02NFdZZy0MisXopZ+3juX
         3qT4mpy6fjivTyETzUhsUmIvWgftJ+rPZHcrlxL9pNxSZwHCceRERSvXov+lBC8aZF
         pSe55sTmv40Vw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210130144558.133534-1-festevam@gmail.com>
References: <20210130144558.133534-1-festevam@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: imx: Switch to my personal address
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     shawnguo@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>, robh+dt@kernel.org
Date:   Tue, 09 Feb 2021 00:15:27 -0800
Message-ID: <161285852797.418021.2388361258680638456@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Fabio Estevam (2021-01-30 06:45:58)
> My nxp account will expire soon, so switch to my personal e-mail
> address.
>=20
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---

Applied to clk-next
