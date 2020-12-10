Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DD8C4361B
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 20:30:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07F6223E24
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 20:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393799AbgLJUaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Dec 2020 15:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:45338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393791AbgLJUaG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Dec 2020 15:30:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607632166;
        bh=terPMDI+i5uYvAC9fmRVPQ2lr7ppkEVvNbWYOTv5+Pk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=EV5clCX/WhsADJkU3A8/TeLuOAmLM4oSYNOJNEE8t99yHNU3atF76+em2yMCmwWkR
         FoOE7AeYOne3jHfchemtKW3Np1jX9NsrYCtdfd1bEzBus6PKyaz15ayLt4EUgXQqjq
         WdLslfmbHN2EdX+5jeDLLafGZhYHrHioGeR+66nLsVL8GWJ3gESxgdFXQptUvbFjOA
         2I2e7FuEyiVJRNEkiIUfI3XkC9iqfX+Yqhi+g+g8r09TgCKJGYpM+/tydCAXcxTtCR
         8DnvAXDevLN13eRMdk2WaLE24wnM1R278vfA3pLcMQrNFh7X54GnItN5fF0LbnLZ0z
         0auk2AbOm9eCw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1605890417-721-1-git-send-email-tdas@codeaurora.org>
References: <1605890417-721-1-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1] clk: qcom: lpasscc: Introduce pm autosuspend for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Thu, 10 Dec 2020 12:29:25 -0800
Message-ID: <160763216506.1580929.6174191600096749295@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2020-11-20 08:40:17)
> The LPASSCC driver's suspend/resume is invoked multiple number of times
> and thus allow the device to autosuspend for 500ms.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next
