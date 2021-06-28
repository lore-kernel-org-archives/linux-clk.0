Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBBCC48BC2
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B888261C2A
	for <linux-clk@archiver.kernel.org>; Mon, 28 Jun 2021 01:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbhF1Bhh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 27 Jun 2021 21:37:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231739AbhF1Bhg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 27 Jun 2021 21:37:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 297AA61A1D;
        Mon, 28 Jun 2021 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624844112;
        bh=mo0a5EHGTZydLuZ4bq+W7XUfGfXmUmf19EHcWrqP9/I=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vICWJoA7kSTRqLzmf2ixgZPhX0EaDuOh48FPduY0HOgiI9Omr3O9jajlnkD+2F+7i
         RPmD+fD/K5CNkqYinByBnl+uoZEl6hz8UmkFkLL3fYBNdVGy2K+idI6fJJQjlQN7Je
         KFp37Y2FKOOYNOfIcWiL0R8FpOoD8YHkWfYUGWc+b1rph4WqhLjTjZG2leK4VAfWog
         eucyvtCKYdCLlUc2w4rEEz3TnQS2jV2CJuCG9SQq846a6SpUNQQoHoQurj8blGEv0x
         ZG4KDGbOjvfqXvu+DboFAxYbRGuf4EGhheF46v0dGDwieNVs/zVgr8pnLMRgs6KKMO
         9lCPkbUX8Aspg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210617051814.12018-5-gabriel.fernandez@foss.st.com>
References: <20210617051814.12018-1-gabriel.fernandez@foss.st.com> <20210617051814.12018-5-gabriel.fernandez@foss.st.com>
Subject: Re: [RESEND PATCH v3 04/11] clk: stm32mp1: convert to module driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, marex@denx.de
Date:   Sun, 27 Jun 2021 18:35:11 -0700
Message-ID: <162484411101.3259633.4335030443605638144@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2021-06-16 22:18:07)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> Adds support for  probe deferral in way to prepare
> integration of the security in RCC clock and reset
> drivers.
> Some kernel clocks will be provided by the SCMI drivers.
> Since RCC clock driver create clocks which parents
> are SCMI clocks, RCC clock driver probe can be deferred.
>=20
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
