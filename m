Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EEFC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:39:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96EE261183
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:39:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbhINVkx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:40:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232891AbhINVkx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 17:40:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71BA360EE9;
        Tue, 14 Sep 2021 21:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631655575;
        bh=U7AHWLUBc2e/0RhiGmIslCORXsbNWKrjSGkQwA2f8Ko=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j5AUnUyWPUd1rmvIkoF6KbyBZsLLYk1oBSUVR/u/l8NFLrv/qN45pU4kx7pczmMtQ
         LgyDNcvlbwfGG58VKLExf8oYf/MtS6H9EjZA1J7Hjgr7DbiVJ3NQZdq6kuyIANEX/y
         FANrrmOxppXmmBpgUfdMyeV8wn0nulE9YvWv6ZERZ03rIxHfW7qFnjY/8CdZ3x43rw
         V4DcNMU8B4NZnRaju1cXrjp+IM0eWRVT6pF7jsSPNUcfzaSYJUpzdTmLALPZYNoCKl
         2YqTwFnWwoGzivJdsee/l9zZz2LHTTiTIlfbkxogl1vZFzeXEIG3GibeWzE+ehVAe5
         3pCODdNQ/dZoA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210907084851.4050-1-caihuoqing@baidu.com>
References: <20210907084851.4050-1-caihuoqing@baidu.com>
Subject: Re: [PATCH] clk: qcom: common: Make use of the helper function devm_platform_ioremap_resource()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     caihuoqing@baidu.com
Date:   Tue, 14 Sep 2021 14:39:34 -0700
Message-ID: <163165557428.763609.6016761960137886434@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Cai Huoqing (2021-09-07 01:48:50)
> Use the devm_platform_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---

Applied to clk-next
