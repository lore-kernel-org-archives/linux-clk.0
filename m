Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8988FC47093
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 23:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5995E613CA
	for <linux-clk@archiver.kernel.org>; Tue,  1 Jun 2021 23:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235170AbhFAXgP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 19:36:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:49854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234766AbhFAXgP (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Jun 2021 19:36:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF4FE613AD;
        Tue,  1 Jun 2021 23:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622590472;
        bh=3N9Ow6RjNZiK6n6O0U9afn11SS+zfLMQUpx7lSRKRcw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=i1Tu1RIxkip2sYDnBwJ8JuCYXzA9Dlso/mo0yiLaOD3ufgDzcs8ihTzQGnIy07uKk
         GRFNiRDTzZMRJrtJldsgnqd94JVk2I2+sSbICEn/fDya7bKMZ0DWA0qqAWkJpSsmNR
         C1SsrPbLz+uhcaiUzxITY0rkGRFWJARG12/L/e2M56bw7VWDy/4CczFaKXBvSMdeqz
         H1PX/kJX5NTNplvEKEGrMk4aO91SlsdDpUxd11l71sKeMR9g0hgCB3fgvbkScoPl9X
         afDpGlhTUcuX0gzfQVP6wXCK6QBw/xnLlDnHpxI8C8M0VtCr0TJF4Lr902CvVVC+iC
         GWumhpyVBjMwA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YJotlJBJ1CVAgvMT@mwanda>
References: <YJotlJBJ1CVAgvMT@mwanda>
Subject: Re: [PATCH] clk: qcom: cleanup some dev_err_probe() calls
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Date:   Tue, 01 Jun 2021 16:34:31 -0700
Message-ID: <162259047131.4130789.3552758881567534695@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dan Carpenter (2021-05-11 00:09:08)
> The dev_err_probe() function prints an error message if the error
> code is not -EPROBE_DEFER.  If we know the error code in is -ENODEV
> then there is no reason to check.  Conversely, we do not need to
> check for -EPROBE_DEFER before calling.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Applied to clk-next with some manual effort
