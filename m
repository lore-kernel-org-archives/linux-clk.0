Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1D5C2B9F4
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 20:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 371DC61352
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jun 2021 20:03:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbhFVUFb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:05:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231888AbhFVUFb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Jun 2021 16:05:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74EB1610C7;
        Tue, 22 Jun 2021 20:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624392195;
        bh=go77Z5qcOi92oqSCP0X3Wkf0SGvUNQ54cyTYeQXyxD4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a//JT9yhimRsFDeR2r2+xrMutFRxeGqB+0BaQxwRUrUqqLORNYvhri2w69ZwBaQQw
         XKBQTpBVtytBr7uyN0NwOIEuaz6SE9IWgx+7EKgkkCdpb1uhhHCksmKYorBKu9LMYC
         Ljx0lRfGjo4AbgbBDeWwABthKr8IZCaUpAT4PTSq860FN+tXPiaivaDsuA+WmF1C3H
         LqwH+RUQ9J94/eJWJWW6PX3jFYQnC6yNJjz7v0rgOSP5GuGRIir/ZKYdynk5ORrDfv
         RtGWcVdFwkeU+jaPLzht0JGqCGSh+iMicoRN1p+N8/jSx8/wjzTyqR76o8tn5qyxyr
         gQKJvaOcowDrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1j4ke6215o.fsf@starbuckisacylon.baylibre.com>
References: <1j4ke6215o.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [GIT PULL] clk: meson: amlogic updates for v5.14
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
To:     Jerome Brunet <jbrunet@baylibre.com>
Date:   Tue, 22 Jun 2021 13:03:14 -0700
Message-ID: <162439219417.3552334.8471238257904070782@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jerome Brunet (2021-06-09 14:12:03)
>=20
> Hi Stephen,
>=20
> Here are the updates of the amlogic clocks for v5.14. Nothing out the
> ordinary. Please pull.
>=20
> Thx.
> Cheers
>=20
> Jerome
>=20
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627=
b5:
>=20
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://github.com/BayLibre/clk-meson.git clk-meson-v5.14-1
>=20
> for you to fetch changes up to 8271813e404cd0620f99fbccffd2746f85a17259:
>=20
>   clk: meson: g12a: Add missing NNA source clocks for g12b (2021-06-09 21=
:39:50 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
