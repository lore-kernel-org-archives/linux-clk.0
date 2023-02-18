Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D45C636D6
	for <linux-clk@archiver.kernel.org>; Sat, 18 Feb 2023 01:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjBRBnN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 20:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBRBnM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 20:43:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E53E056;
        Fri, 17 Feb 2023 17:43:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59EB462094;
        Sat, 18 Feb 2023 01:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4285C433EF;
        Sat, 18 Feb 2023 01:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676684590;
        bh=XyPvO2lxQRLQ7KUn63ddK0Wz47UDsVGn6Ulo2mdtLZ8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=AOho79VNMYw4iJt5BhMXx5RQcXZqb1ovqYQfXDM7jrOnk89ZlbMsL33BfyMtnzOvw
         oC7jxwLWly7FSyv0rFiIDWTY78BkPSkvWpAlJiSDYzJunzgkgKMXGUBpL7qa+YG3cV
         Xs8MPXdXv324g8VUvVLtJ20MjQx+kNV9qGBvTmpkZ6IIptZeUSAIPGsrl2kmPFRsPp
         yoVA4M7bWzNzIvtQ8C8TBH+27fiIpZq+8RXuvgacoHmGxC/PzZv/wa/lsVS6EiGuXV
         G42fUG1Ps28v9aqSwPRqcwhRfpqEUrnIpMWI4VetIrd3ZCBr1G5eVjDenCQgeg+14I
         1fYRGk/O8jftw==
Message-ID: <041ed22b036eaa1feaf029dbc7b9b2f6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230213081038.3958833-1-abel.vesa@linaro.org>
References: <20230213081038.3958833-1-abel.vesa@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: clk: imx: Add Peng Fan as reviewer
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     Abel Vesa <abel.vesa@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>
Date:   Fri, 17 Feb 2023 17:43:08 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2023-02-13 00:10:38)
> Peng Fan will step up to help with reviewing.
> Add his email to the i.MX clocks drivers entry.
>=20
> Cc: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Applied to clk-next
