Return-Path: <SRS0=AG5N=4Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD9DC3F2CD
	for <linux-clk@archiver.kernel.org>; Fri, 28 Feb 2020 18:57:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C461C246A0
	for <linux-clk@archiver.kernel.org>; Fri, 28 Feb 2020 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582916240;
	bh=6M7pXVWWre2e2ApSFg0EEx4F52HDkqy46uC0+j2UT1w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=1gaeVwEnU6CO5WAmqF9ot5Qwk8Tgo9R/Avx+ZCIbCJFtOJhn/zNtcg3gmDzR+Potf
	 PuHXU8KAwAvEYOloqPYHOmx4lLbHW0mM6Ci3cGMu9BeTX7eKwtb5JPfd1VTFeGUOUv
	 CYoNSiNBe1RKzA/BTWZXLx18yswemm5L6E/KTkX4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgB1S5U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Feb 2020 13:57:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:44958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgB1S5U (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 28 Feb 2020 13:57:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 984C22468E;
        Fri, 28 Feb 2020 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582916239;
        bh=6M7pXVWWre2e2ApSFg0EEx4F52HDkqy46uC0+j2UT1w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Q2fy//tN9dDc17GZ8yOZt/J9oSknD+GsvvJ/8A07r2MPT4l0iJ83O8y5NdYmqcD1P
         HdPPODV4ZZepe7Fg3mSLLLn2vwfRFsSl6RHAoIygQar0IIDpdHTgPNkVTz96otvF60
         1rkyFTqbqipOPI6UgMWJW8eHf9S9nuoaqeOa+YUg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200225134248.919889-1-maxime@cerno.tech>
References: <20200225134248.919889-1-maxime@cerno.tech>
Subject: Re: [PATCH] clk: Fix phase init check
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Date:   Fri, 28 Feb 2020 10:57:18 -0800
Message-ID: <158291623878.4688.18216915906506970755@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-02-25 05:42:48)
> Commit 2760878662a2 ("clk: Bail out when calculating phase fails during c=
lk
> registration") introduced a check on error values at the time the clock is
> registered to bail out when such an error occurs.
>=20
> However, it doesn't check whether the returned value is positive which wi=
ll
> happen if the driver returns a non-zero phase, and ends up returning that
> to the caller on success, breaking the API that implies that the driver
> should return 0 on success.
>=20
> Fixes: 2760878662a2 ("clk: Bail out when calculating phase fails during c=
lk registration")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Applied to clk-next
