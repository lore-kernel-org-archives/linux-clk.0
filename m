Return-Path: <SRS0=klTJ=DV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF95C433DF
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69A4D22201
	for <linux-clk@archiver.kernel.org>; Wed, 14 Oct 2020 03:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602644808;
	bh=ql3qZCl3Fj8AB0GtsV48nH2+OfWWqFk1iAkSL1s+g94=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=AFyg+V5KhGDGt3E9Q/di94D/PP1wxdDemx+TDyH9cNcd66KZr0xoAj+biWLqAXSRB
	 6V/y7Cn+TFnjZNDWtN/dS/MpdkuXR/B+da7eLUuyM56McMnjvugDBPmCim2VgnUeb4
	 uV5KTjDr8r35AchEk+47MqxkLPcGH7rFcV635kZs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgJNDGs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Oct 2020 23:06:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728925AbgJNDGr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 13 Oct 2020 23:06:47 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D82D21D7F;
        Wed, 14 Oct 2020 03:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602644807;
        bh=ql3qZCl3Fj8AB0GtsV48nH2+OfWWqFk1iAkSL1s+g94=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MMmw+6DpWDygCk6V2qZPbgGKT5r5kQrW5DTBmVsDoCRTW3qYgMvEZcmZDWxdeoN4C
         oPbxM699NXBQif8Xqp3N7+9XloJkQ6DtMEz3BMN4GvelCY2TzJ7Il6wODS9QQBs6dt
         gzXgcYHa9uJSgYP6G1LeIzzqWtDL84o9HdYRmS2Y=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200903015048.3091523-5-paul@crapouillou.net>
References: <20200903015048.3091523-1-paul@crapouillou.net> <20200903015048.3091523-5-paul@crapouillou.net>
Subject: Re: [PATCH 5/5] clk: ingenic: Respect CLK_SET_RATE_PARENT in .round_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     od@zcrc.me, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>
Date:   Tue, 13 Oct 2020 20:06:46 -0700
Message-ID: <160264480620.310579.9836141922826340588@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Paul Cercueil (2020-09-02 18:50:48)
> Clocks that don't have a divider are in our case all marked with the
> CLK_SET_RATE_PARENT flag. In this case, the .round_rate implementation
> should modify the value pointed to by parent_rate, in order to propagate
> the rate change to the parent, as explained in the documentation of
> clk_set_rate().
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Applied to clk-next
