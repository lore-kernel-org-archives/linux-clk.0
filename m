Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D892ECD68EA
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 03:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442020AbjJJDbx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 23:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442021AbjJJDbw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 23:31:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E0692;
        Mon,  9 Oct 2023 20:31:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF73DC433C8;
        Tue, 10 Oct 2023 03:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696908711;
        bh=5a/eXg4zhIfuEa60hhkirr8gSREXauzictNAgXnjWbc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m5YZHZb0WeMcqIdgc8XvoroGMvjehK0/gwTTpYbb4u8YHbYb7k7K6y/ZtkuCZKIV8
         LO8pQVv4XU1JR0/bcF0oQ9vAnJKTkStWfnHNG1PO21sodlfzsUTZ/i7NPac6PuvIPn
         CPqqNxKyao0xEQ1XOqto/F8NP8eQcYoF4dwldu65F75cQPoRMjhIUvj82lYSerE4KI
         cgvSAcNMBJfDB3DnMeAmb3yiN8DUbpL9MzhnT5fP2/vt4Jq5au3nsInQKEztPesbaq
         Vq0Zq/uFgF8gqQ4sd2Q1qjVbn3YA+jwZIrxC8WsIkz8LIgcCk4MoKv3XcQyhhBPfth
         xH3ZM5X6UVLSg==
Message-ID: <1a0da000de972ee9a8c63685c789928b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230929-clk-maple-versaclk-v1-4-24dd5b3d8689@kernel.org>
References: <20230929-clk-maple-versaclk-v1-0-24dd5b3d8689@kernel.org> <20230929-clk-maple-versaclk-v1-4-24dd5b3d8689@kernel.org>
Subject: Re: [PATCH 4/4] clk: versaclock7: Convert to use maple tree register cache
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 09 Oct 2023 20:31:49 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Mark Brown (2023-09-29 07:26:08)
> The maple tree register cache is based on a much more modern data structu=
re
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
>=20
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-next
