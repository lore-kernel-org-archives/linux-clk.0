Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D6BC2B9F4
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 22:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB4CF61942
	for <linux-clk@archiver.kernel.org>; Fri, 25 Jun 2021 22:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhFYWoy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Jun 2021 18:44:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:33834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229776AbhFYWox (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Jun 2021 18:44:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DA0B6194D;
        Fri, 25 Jun 2021 22:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624660952;
        bh=jBNRh5nIgcoO3D4kMdljIbRW/JHNlunnR/cmpWsnrMQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=E5EnB9hc2b/zIxr2kRJJKylm6zScSIx0NDwrlavMCz3Fq5WMci3Bvn1bsm72YvJo4
         wNcC8AXi/uTaUssq/7d6JBhIkjcuupVrehD5eWPvRMCdYZ6e0Ieh65DWDxH9u+ZDcP
         tmO7apBR6WjPJzkZiiZScUXMbj6hs0ToYjlnH8xbIr8KSlscHmDhrQtQ0vTs0amz4g
         SmvyVn63Y1BDwneGXtKjdJRooNupwzbFPKQ7l5deskf/Xn1OAmblDH5957IeV8xseL
         aa/UEzTilBxYVfLk9rLetIYdbrik4TGLL0LRAdysYdNgqqs9dBtMWW345v2DSvC1xr
         Ek+JI90Q9jAPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <14cb3b4da446f26a4780e0bd1b58788eb6085d05.1623414619.git.geert+renesas@glider.be>
References: <14cb3b4da446f26a4780e0bd1b58788eb6085d05.1623414619.git.geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: clock: gpio-mux-clock: Convert to json-schema
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Sergej Sawazki <ce3a@gmx.de>
Date:   Fri, 25 Jun 2021 15:42:31 -0700
Message-ID: <162466095121.3259633.9785508230496915344@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2021-06-11 05:30:47)
> Convert the simple GPIO clock multiplexer Device Tree binding
> documentation to json-schema.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
