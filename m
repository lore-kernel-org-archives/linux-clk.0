Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B4BCD68E4
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 03:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441973AbjJJD3j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 23:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442030AbjJJD33 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 23:29:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4197E6;
        Mon,  9 Oct 2023 20:29:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B20C433C7;
        Tue, 10 Oct 2023 03:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696908565;
        bh=m+miSewHgnnZ4CvYkS05Myx+fjJwv6+T/g8zw8RWGy0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ipj9zpa3i/M0nGYU25upqV0zIJCptKapEZ/P/pKRpUrhOFjVugbtfJVESSEgvnblE
         PN7EOzZve8j+/Y978an9eO9zujhreZIiypWhsCI9tpLFn8AwKffq9BhIFxbKSFvhP9
         6dicMvdhD6Va5v0546lXHkol2TYk9Bl1sEA1iqmtdcxCvKznmkEIhTz9h0Z9CeQjLj
         qTZVOa5R/TxWIJSAW2K95LKLMkAl8sOVB8vbeSGDxnCs2I3XV1DjRRJk3hcHCkGdzG
         AeEcEZGtUbfwMji/pu8+lT846Y1+DLR5FzOwyAv63FC8su05g2S2dd9Wmky3LULmzr
         hWsqif/D0uAWg==
Message-ID: <55dca452d3fd5b6f51d66ac8c4e0e5e0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230929-clk-maple-si-v1-5-e26cfcaf27bd@kernel.org>
References: <20230929-clk-maple-si-v1-0-e26cfcaf27bd@kernel.org> <20230929-clk-maple-si-v1-5-e26cfcaf27bd@kernel.org>
Subject: Re: [PATCH 5/5] clk: si570: Convert to use maple tree register cache
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
To:     Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:29:23 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mark Brown (2023-09-29 05:22:03)
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-next
