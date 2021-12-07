Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0796C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  7 Dec 2021 20:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbhLGU2T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 15:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhLGU2T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 15:28:19 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE16C061574;
        Tue,  7 Dec 2021 12:24:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0E2DCCE1B8B;
        Tue,  7 Dec 2021 20:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B59C341C3;
        Tue,  7 Dec 2021 20:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638908685;
        bh=7Cl2FNgACf9Ukz+HfpcKZiBzCnj/cNz0yyxaXHqeTLE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=rY9pV41kt/Zmz2h0rFZhrjv17wn3EDDwIHangrwtZjnihT1aYfNZbb31jcWZdgWix
         5wNjnOWnWy8XnO1aon9DGvXemdBHsfV4P5sHnBfZx0JIn5bwf7taiz4lNrTe1YzgMm
         o/b4n2ivp+3vyooIo+k6m6vCLflpitayqKpFLTBQ74t0K0ubCerA6Bn5oIeOjdTvi1
         gyRyHpp8IRLFTsIXr57JTLve21lEfgAw3Xaw3vM/tVeh+07Ev6pQQfCD+9TWUW/TIu
         pSmDY5afz60zonOo3BkG9Z8HZAlzx5vG1xhqTW5qf/Uy/3BVC1DUJh0jIatFUsTxdo
         RIpE0r5h3KvEQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211117072604.GC5237@kili>
References: <20211117072604.GC5237@kili>
Subject: Re: [PATCH] clk: versatile: clk-icst: use after free on error path
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>
Date:   Tue, 07 Dec 2021 12:24:43 -0800
User-Agent: alot/0.9.1
Message-Id: <20211207202445.22B59C341C3@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2021-11-16 23:26:05)
> This frees "name" and then tries to display in as part of the error
> message on the next line.  Swap the order.
>=20
> Fixes: 1b2189f3aa50 ("clk: versatile: clk-icst: Ensure clock names are un=
ique")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next
