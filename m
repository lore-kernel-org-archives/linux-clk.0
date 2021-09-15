Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4608C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA0786115B
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 01:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhIOBDg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 21:03:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231365AbhIOBDe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 21:03:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CBB061184;
        Wed, 15 Sep 2021 01:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631667736;
        bh=qUdgKvTWbVpkmH7Y0GzCX1Y0jQ1VDOBmef86FNV1N2o=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nAdMww3vBmo/kFHW8ej3GJsgjd8IADmwPdnoK6UEv+SnaF9xMae+Veki2mv+bm36g
         93UHaJD5IXfqc5jBZAJ4aqJjZ8GEY6YE2r6OKBBdWx3cSo7GaX4TM/6GwyxOc+m8UA
         JcMEmje2ODdsZoViz8jeSTbUN7PV3+fjQMDYoZ0xL2RcnnsGtiqNnKk2EhjBJsBoEN
         x+5khB0zLtNjADaoa0Ies+DE32teUDGLhEuT4GhqO8LdzBVth8wW92Y1MxiAyTKPmd
         gcPOpkRSKoClCacLYaMyLLjDNc9YDjB+yD6/L6Uol4es245IBzzPGPcxSQwcOmxbeD
         QqmAWo/aXMI0A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1631521490-17171-3-git-send-email-abel.vesa@nxp.com>
References: <1631521490-17171-1-git-send-email-abel.vesa@nxp.com> <1631521490-17171-3-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH 2/8] clk: imx: Make mux/mux2 clk based helpers use clk_hw based ones
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org, Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>
Date:   Tue, 14 Sep 2021 18:02:15 -0700
Message-ID: <163166773554.763609.2397985335163872840@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2021-09-13 01:24:44)
> Implement the clk based helpers as macros rather than as inline
> functions. Once all the provider drivers have switch to clk_hw,
> all the clk based macros will go away.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
