Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D453BCDB474
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 23:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443053AbjJLXV6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 19:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443006AbjJLXV6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 19:21:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720BEA9;
        Thu, 12 Oct 2023 16:21:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E20AC433C8;
        Thu, 12 Oct 2023 23:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697152917;
        bh=EA6Bl+hhODmC0/E8k4cIgSih/ZiH5lISftxciVURJ/E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=k2Xv5ewEz5mm7XAmyzk48w9floovjPuJtd9MQLAHpAbU2AUUz/zfcXdbppK+BWnzW
         3xm+kZzb7CLusCkj52UvQjxq66Lnq4YrYzib90M1Tpsac6hxfyBFJ9SAbthpRXQUb/
         B7DGSlzntsrElca2mcILI66lPuTPyCiKJBoUWWyJT8k0ihwIkMSnre65noLGUUBs6r
         sKeWY9Eod3+pLx4OaJn8ofOn+dMfs9g47Uj3rQD1FTBdBPO6WumirFADMhPcu2a+w5
         6pGodNQWQcsylhC+vEZPsYnGCtCEW3XBr62uaJl/WRYt1oJ5ZoStRTQ/ePdQXq2hc6
         mxAfWiJ2sUw3Q==
Message-ID: <2350c4a3e6c2ed214dd232abc73b2074.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230921073217.572151-1-alessandro.carminati@gmail.com>
References: <20230921073217.572151-1-alessandro.carminati@gmail.com>
Subject: Re: [PATCH v2] clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_parent_name
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Alessandro Carminati <alessandro.carminati@gmail.com>,
        linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Philip Daly <pdaly@redhat.com>
To:     Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 12 Oct 2023 16:21:54 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Alessandro Carminati (Red Hat) (2023-09-21 00:32:17)
> From: Alessandro Carminati <alessandro.carminati@gmail.com>
>=20
> In the possible_parent_show function, ensure proper handling of the return
> value from of_clk_get_parent_name to prevent potential issues arising from
> a NULL return.
> The current implementation invokes seq_puts directly on the result of
> of_clk_get_parent_name without verifying the return value, which can lead
> to kernel panic if the function returns NULL.
>=20
> This patch addresses the concern by introducing a check on the return
> value of of_clk_get_parent_name. If the return value is not NULL, the
> function proceeds to call seq_puts, providing the returned value as
> argument.
> However, if of_clk_get_parent_name returns NULL, the function provides a
> static string as argument, avoiding the panic.
>=20
> Fixes: 1ccc0ddf046a ("clk: Use seq_puts() in possible_parent_show()")
> Reported-by: Philip Daly <pdaly@redhat.com>
> Signed-off-by: Alessandro Carminati (Red Hat) <alessandro.carminati@gmail=
.com>
> ---

Applied to clk-fixes
