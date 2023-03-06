Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F83C61DA4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 22:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbjCFWSx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 17:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjCFWSx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 17:18:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E284122DCA;
        Mon,  6 Mar 2023 14:18:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7C0CB8112D;
        Mon,  6 Mar 2023 22:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B215C433EF;
        Mon,  6 Mar 2023 22:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678141129;
        bh=drPE2tfS83JBT+QhIwghT7rQZ/+Cdkequ9Dh2QXOkq0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ARx8HmPtoLZ9fzcCotD+7fE25isz2AC0zd5YIdesxYdBf2zutOcyTDDxSKtmZ8ogb
         wS379NDFTRbEU99ixOPTLIw1eEf+1vwP77UmLzJ5slVn1T7dgaPehRcrqTkManRVQU
         zHNSEPj5BdD9cIlGIoJ8CLXt4iVMqQExrLRzjsZ9u3G9Urfcqv7IVx0n8Gq7PiRRtC
         iXHUU05l6aZ+TMN8+3JP8ObFfJKx83Lj5VUVnLrA0J8X78ff0auUdZA+Hq/mw74+Vw
         JYrE++IO9hNmpjHh3Xs8mmCNiIvMxN/BTfs3kuD6Xea49qInSbXmaaYoRpptGcyNEM
         2b3uCrr9mkQaA==
Message-ID: <cc6a0ded69becc0b3f7e9ac5190d8f64.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230302005834.13171-6-jk@codeconstruct.com.au>
References: <20230302005834.13171-1-jk@codeconstruct.com.au> <20230302005834.13171-6-jk@codeconstruct.com.au>
Subject: Re: [PATCH v5 5/6] clk: ast2600: Add comment about combined clock + reset handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
To:     Jeremy Kerr <jk@codeconstruct.com.au>, devicetree@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Date:   Mon, 06 Mar 2023 14:18:47 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jeremy Kerr (2023-03-01 16:58:33)
> Add a little description about how reset lines can be implicit with
> clock enable/disable. This is mostly based on the commit message
> from the original submission in 15ed8ce5f8.
>=20
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---

Applied to clk-next
