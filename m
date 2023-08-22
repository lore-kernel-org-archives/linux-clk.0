Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B215EE49A5
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 21:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjHVVyE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 17:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbjHVVyD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 17:54:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6825E45;
        Tue, 22 Aug 2023 14:54:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 512F964E72;
        Tue, 22 Aug 2023 21:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84C1C433C7;
        Tue, 22 Aug 2023 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692741239;
        bh=deB6//pRXkwQ966Z5NGZScuxhVRHvqj0uokC23Oac/Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nqyW9nSMYaB5GsZwqOxLKKWp5zWOOklKyThEhgbTUVA/6nLPM3Z2dzXP1OqrOI/kK
         xxp/0RgoOYj0R6o3/n6EB+X4ReIASlvRUxA7xI4AKI+WqTZzJJr4cFg8FizRGKE7Qi
         zRBp6o51a2AQG+OLPLESoh+U2HRTAYDjMbfBtmnQwL3tudf68k0gnb1839f7eBAEjP
         rOGadDBgIbTgYFeuSs71IE0yA1pgxEyHDB4pqhXbYXZ4Lbi9V7Nyg1ngMrRyq+pfXa
         koJcFhzKmOWrLdhTrJWclZGne6cnZYDx3nb3FC1tPKHUT/zVR+NQtpWdIMzdrGf7eV
         SEFSkwUQ9zyLw==
Message-ID: <e4c2b34fea34e1e57a636c9db5c95d9c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230705065313.67043-5-frank.li@vivo.com>
References: <20230705065313.67043-1-frank.li@vivo.com> <20230705065313.67043-5-frank.li@vivo.com>
Subject: Re: [PATCH 05/13] clk: fsl-sai: Convert to devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yangtao Li <frank.li@vivo.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Yangtao Li <frank.li@vivo.com>
Date:   Tue, 22 Aug 2023 14:53:57 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yangtao Li (2023-07-04 23:53:05)
> Use devm_platform_ioremap_resource() to simplify code.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Applied to clk-next
