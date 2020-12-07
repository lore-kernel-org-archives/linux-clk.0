Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C73C4361B
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 22:14:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B14DC23976
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 22:14:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgLGWOa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 17:14:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:54780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726003AbgLGWO3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Dec 2020 17:14:29 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607379229;
        bh=VRw0itRaDhYY63IPliLn46L/J7AaERKVB2Wt9FzEiTU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VU929KXr3wzoa8IerYptKP37Og3nIax+MBTJ6CcEiffJOc+R32YmpkX5rtsl5KlAx
         2GKLx3SVuxA5hwu+OUfsRwU9m+BdrwCtVYi16YWPiLLHokSUulooCuVIJJB/PCFtpP
         Guo6RMoimIAj9mARRgwZJ2bNZOshwW8nahWhn42ip1yZxYUPGNS+ma9plJtq+RxM8P
         8d7W5n+qgfe1uZsTFp/0vXlinoBzqi1dm4y0eUjSnp5ydLpqSMDISEohcuw2byfEl+
         AUXwysqk7q7XMVYV3m9b8DTyEni/tcY8WiYHITG9dutka5Ksu/cVucqZNCdcAJRspq
         rYsv3uSMOkFgQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201105192746.19564-2-michael@walle.cc>
References: <20201105192746.19564-1-michael@walle.cc> <20201105192746.19564-2-michael@walle.cc>
Subject: Re: [PATCH v2 1/3] clk: fsl-sai: fix memory leak
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Michael Walle <michael@walle.cc>
To:     Michael Walle <michael@walle.cc>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 07 Dec 2020 14:13:47 -0800
Message-ID: <160737922779.1580929.217609162257405895@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Walle (2020-11-05 11:27:44)
> If the device is removed we don't unregister the composite clock. Fix
> that.
>=20
> Fixes: 9cd10205227c ("clk: fsl-sai: new driver")
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Applied to clk-next
