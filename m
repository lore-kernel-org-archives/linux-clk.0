Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1441AC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 03:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbiJKDn0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Oct 2022 23:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiJKDnP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Oct 2022 23:43:15 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121687C74F;
        Mon, 10 Oct 2022 20:43:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 78905CE1695;
        Tue, 11 Oct 2022 03:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA8DC433D6;
        Tue, 11 Oct 2022 03:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665459792;
        bh=3zYEONg5OUToEyaqjtgs0L06XcjjOMaXw52DHEQirhg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fEF5PS349Z2sCVfKK/9Gcfr69L+HiKrd9hv1YF6U6N5Jne+s2lnlUSFAeiXQq8nV+
         1A1dG29kdl7hC2rw9w5RttHNFZb57Sr/7xA7aDAHv4Hx3zxisYcgpAt2tmj7AiNu0j
         u+/HquQPoE6vIeGFOwRADNLwNwWUa2r58xVBFNJNn8OMTuqdeFe/T22ipiWOz1/6x3
         Eqq6vKd+vNUKB83myPdG6XJpqDt/mCOyQaN3KXbiizi/wx9g5uujn0t5pufI8Z62Ox
         cSKdtQEmSvRLdrshdeSPgJgt0TAbqVOs7qQotfeZ5LMlT1rI9jeSj/Z/lgJUQarrsQ
         dhpLwxIcHicYg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221010-rpi-clk-fixes-again-v1-2-d87ba82ac404@cerno.tech>
References: <20221010-rpi-clk-fixes-again-v1-0-d87ba82ac404@cerno.tech> <20221010-rpi-clk-fixes-again-v1-2-d87ba82ac404@cerno.tech>
Subject: Re: [PATCH 2/2] clk: tests: Add tests for notifiers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 10 Oct 2022 20:43:09 -0700
User-Agent: alot/0.10
Message-Id: <20221011034311.DAA8DC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-10-10 07:47:39)
> We're recently encountered a regression due to the rates reported
> through the clk_notifier_data being off when changing parents.
>=20
> Let's add a test suite and a test to make sure that we do get notified
> and with the proper rates.
>=20
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
