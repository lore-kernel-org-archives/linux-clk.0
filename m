Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E4EC47080
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 23:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D7CF60FF2
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 23:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbhFAXgi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 19:36:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:49940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234766AbhFAXgh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Jun 2021 19:36:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B237E613AD;
        Tue,  1 Jun 2021 23:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622590495;
        bh=5A9aheARWti/x6OyoUXGEKOR3eHWdzZgctfs5xwHqCQ=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=JZi/LPuzLZbdhNkcL0nUIcHZ+SCyoN0Q8KhNVG97WF9sh5TGjcISF9/bGygQpitzz
         6v4Jcl3iEL5R4rSyj/qE/l0CunjB9BHG8ozRBs+AiMxFbhGqnWZu31qb92uWwmH2LM
         wGuYWQQJ+/CGgIoszpGHomG1tgAKcjJ/vLNUW5pdy4TbloexBLT63czJSaRvrUNDAg
         jpZeFs3qKAwpE4RGwYcGgNYMQSpKVtRHtKk09bOdAw6I+UkCsThPxIG+jUSScTjOsV
         ffBBbsTBEmks3SJzTAERQ/YB3nmyT5ixxF9tkR4EEmC/ULfnoAs8uvxr0UQHWhNpMm
         jY7Qmfj97b/UA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210427164522.2886825-1-uwe@kleine-koenig.org>
References: <20210427164522.2886825-1-uwe@kleine-koenig.org>
Subject: Re: [PATCH] clk: qcom: Simplify usage of dev_err_probe()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Date:   Tue, 01 Jun 2021 16:34:54 -0700
Message-ID: <162259049451.4130789.1895825694015712742@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

(My MUA probably messed this up)

Quoting Uwe Kleine-K=C3=B6nig (2021-04-27 09:45:22)
> dev_err_probe() returns the error code passed as second parameter. Also if
> the error code is -EPROBE_DEFER dev_err_probe() is silent, so there is no
> need to check for this value before calling dev_err_probe().
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> ---

Applied to clk-next
