Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007B1C433ED
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 23:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B14A361284
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 23:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhDGXax (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 19:30:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhDGXax (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 19:30:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 663A86124C;
        Wed,  7 Apr 2021 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617838243;
        bh=ZBOVS78Z+71jqdTjd9rdh/4JXGk8AErxnO6HDkeMvsQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Y6QRxObD1MNWwnXq6pCCez4ClyvjmNC2LJWcNGMSXZWYJH9Bk7iDt/VnczCT4B7g+
         ux65il7q3wTtoSXX2lNwsznkEIYnArM/0k9vRPPiQ7gFjnnEI5FAaQXetJxURbHDr0
         qoEmGzcODy4EsgmAKQ2/XyxzVVbfYbO1urkzJJcTjja47FDvGyotWFBWTOKfiIDp+0
         TqcO8pHZa7DMYlJD7rCcWe3CTPwTE5F8crBAqSBInPn4u7gvgsk6kiZgLm/uN4W32b
         L9wDuASqEFuPv7yq16sUDtFRMC5I8BUNChha1jLQHmSV4+RwQP+Ixz2IELMt6WbcSj
         xbyhknViFqy6g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210406182746.432861-1-colin.king@canonical.com>
References: <20210406182746.432861-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] clk: socfpga: remove redundant initialization of variable div
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Colin King <colin.king@canonical.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 07 Apr 2021 16:30:42 -0700
Message-ID: <161783824210.3790633.2851438974412347019@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Colin King (2021-04-06 11:27:46)
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The variable div is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
>=20
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied to clk-next
