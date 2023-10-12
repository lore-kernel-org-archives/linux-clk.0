Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C919CDB474
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 23:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbjJLXre (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 19:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjJLXrd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 19:47:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE7BC0;
        Thu, 12 Oct 2023 16:47:32 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1C4C433C8;
        Thu, 12 Oct 2023 23:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697154451;
        bh=g0j0ntI7cDursByucgnzG9BJl82/ZPQ8pgpkva55nnE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dK8W5ZmTFp+nRPaYMnqtSLj8r06kz2uUeV6PikgHxVbIdah6Kn6Bb8WNEMyUylTYZ
         Uk2ugUn8P3sbz0Lv2tZK8HV508ta0OnNSRN8KpXu4MHjrdvzQEeBNLaJIUZax3VzFW
         P7NkX8xDZn2tT/H03E+bhTHSS8YUpmmzJheYBfigCbRjHtbOCzQOx14pCXb5kxneiN
         1CIjSW1fib+3wFN+OI54384AqtxoUeowMXkcNxjMNc4ut+fgEheSjQWrmTpRcQjpe7
         n5KfSVpAWgKv49p9PdExdzMSmS+hAv7hJI2JO+Q6OmZ+07CAl7VdcEcqfemKF5XUbE
         anlVynjdKNAKA==
Message-ID: <8ec3d2c6458d6979d780936d3521cf1d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
References: <d9a78453-9b40-48c1-830e-00751ba3ecb8@kili.mountain>
Subject: Re: [PATCH] clk: stm32: Fix a signedness issue in clk_stm32_composite_determine_rate()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        kernel-janitors@vger.kernel.org
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Date:   Thu, 12 Oct 2023 16:47:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2023-10-10 06:35:28)
> The divider_ro_round_rate() function could potentially return -EINVAL on
> error but the error handling doesn't work because "rate" is unsigned.
> It should be a type long.
>=20
> Fixes: 06ed0fc0fbac ("clk: stm32: composite: Switch to determine_rate")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Applied to clk-fixes
