Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EABC282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:50:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A71F02190A
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550080239;
	bh=rk1GCNVzZgQmng+N18XiHDaisf0rGIZVVuPtLs0h4KQ=;
	h=To:In-Reply-To:Subject:References:Cc:From:Date:List-ID:From;
	b=lsEg5YV6gyN+fyhGiWrqEI5spm61HgRRGTfHd/eLV8Larzz01xxAR2R4kc/wE8bOd
	 PdY0xprh2rYpT1BlR5fFn+GXPXIUseiqHTwPWic3JQo+l73BKwtc/f++mTVTbyjDew
	 GkVwOSbKMr/VRBG/Z5CFs2Ib5pStc7ss+PX9sM7k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbfBMRuj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:50:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:41320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbfBMRuj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:50:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F2892086C;
        Wed, 13 Feb 2019 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1550080238;
        bh=rk1GCNVzZgQmng+N18XiHDaisf0rGIZVVuPtLs0h4KQ=;
        h=To:In-Reply-To:Subject:References:Cc:From:Date:From;
        b=o9lOpMIIsRLQCcnHaoQ5DSToA+PGWL/OwpkJVzz0CE0R4TxOroxVQsy9+ovezoWQS
         y8PqBtTw0/ARCGYScUbRDyh3LGff+vYfkZNuxgXOY5J24RPWRiUo27FkuDAh4uSn0Y
         cUD/q2LdVHxuws2zI79ziGgNqwr+qaloudN04YN8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        gabriel.fernandez@st.com
In-Reply-To: <20190212135154.2733-7-gabriel.fernandez@st.com>
User-Agent: alot/0.8
Subject: Re: [PATCH 6/7] clk: stm32mp1: remove unnecessary CLK_DIVIDER_ALLOW_ZERO flag
Message-ID: <155008023770.115909.8098641568045051938@swboyd.mtv.corp.google.com>
References: <20190212135154.2733-1-gabriel.fernandez@st.com> <20190212135154.2733-7-gabriel.fernandez@st.com>
Cc:     linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gabriel Fernandez <gabriel.fernandez@st.com>
From:   Stephen Boyd <sboyd@kernel.org>
Date:   Wed, 13 Feb 2019 09:50:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@st.com (2019-02-12 05:51:53)
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
>=20
> This patch removes unnecessary CLK_DIVIDER_ALLOW_ZERO flag of
> ethptp_k and ck_hse_rtc clocks.

Why is it unnecessary? Please write the motivation in the commit text so
we can know why things are the way they are.

