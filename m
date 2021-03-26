Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF33C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 17:55:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C91761A24
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 17:55:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhCZRz0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:55:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:56050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230194AbhCZRzD (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 26 Mar 2021 13:55:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CA58619F8;
        Fri, 26 Mar 2021 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616781302;
        bh=z94jWlXkkNIPohBNjAXWPmZYEgxWFOHibcc+JgnRvj0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CTuz7BolqhoBqwcGIdbPLGVT5HyVNWrk0lMHGhTK/atho9KQzRywn1P8E32jclyS/
         VkDm8d8ufAMYz9fJqni6deXhak8TAOsew2gt+5iIJkHKMhOklULRz2wWS9b+HbFp+b
         RBTBrQeACxWibmIx+oe5TlNJV2ZNQ8hDyHfrXHnwcat5RQBij1Dq9XoCvpfjMYtRfZ
         xfpLQHClF3IujwwpRcfOTCA/1/x7f5sLyNwgZZ+viUjoG0LmpgFRajZlw1NbFVuqkD
         mbzdGbNjQIYsFt6lxBiQfb4vOXFjkRxVenVHOgZvfVGmN5UQcBnORLMoqn4PNYNWLK
         iLlk5W/nRWFpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326120833.1578153-1-geert+renesas@glider.be>
References: <20210326120833.1578153-1-geert+renesas@glider.be>
Subject: Re: [PATCH] [trivial] clk: Drop double "if" in clk_core_determine_round_nolock() comment
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jiri Kosina <trivial@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 26 Mar 2021 10:55:00 -0700
Message-ID: <161678130085.3012082.14324517330833394520@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Geert Uytterhoeven (2021-03-26 05:08:33)
> The comments for clk_core_determine_round_nolock() contain a double
> "if": one at the end of a line, followed by another one at the beginning
> of the next line.  Drop the former.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to clk-next
