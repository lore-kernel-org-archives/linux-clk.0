Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACACC433E6
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:10:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6313464E4A
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 20:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbhBKUKu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 15:10:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:43258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231216AbhBKUKm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 15:10:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E1BE64D9A;
        Thu, 11 Feb 2021 20:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613074201;
        bh=g7vSfwDEr1DJ6p1OUiUrX/2KShMTngpd0PmBgIZsAss=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GUkHpjvgIfAf7yIoGmHh+3RfGQf9OS/KNzOUa1fNv471EJpEOJ8+gE46bV8P17RIx
         nv6onxfP96rfatOofbCmCuCX1yt9izHleuaPAuy2L8KT0nBlORKtnJnno/L19J5xH5
         t3YeBN/hbAuZGQLYhQMu4V4gwfBpYKp3OhtDi3t0j4gk06nroI5bj7ic9WwIWEJUaA
         n7VeQd+8Tua7F3AEiM78FSbzFn7mqdQceWlPnYKennXyIzHH/AXAw2xQQVxwC1dAKw
         HZpNh9VSQ20BUWcTwkbAxaFaVlkBjeGs+6+iCg7r8ZvHLYHDzR+BtgSQLeZE5G+xhX
         Q4mPCknf+XKJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210207185140.3653350-1-aford173@gmail.com>
References: <20210207185140.3653350-1-aford173@gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: clk: versaclock5: Add optional load capacitance property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Adam Ford <aford173@gmail.com>, linux-clk@vger.kernel.org
Date:   Thu, 11 Feb 2021 12:09:59 -0800
Message-ID: <161307419998.1254594.18143429322756749129@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Adam Ford (2021-02-07 10:51:38)
> There are two registers which can set the load capacitance for
> XTAL1 and XTAL2. These are optional registers when using an
> external crystal.  Since XTAL1 and XTAL2 will set to the same value,
> update the binding to support a single property called
> xtal-load-femtofarads.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---

Applied to clk-next
