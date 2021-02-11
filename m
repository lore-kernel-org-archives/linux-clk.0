Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883C8C433E9
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A6F664E44
	for <linux-clk@archiver.kernel.org>; Thu, 11 Feb 2021 19:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhBKT63 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Feb 2021 14:58:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:39396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230039AbhBKT5y (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Feb 2021 14:57:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7367B64E56;
        Thu, 11 Feb 2021 19:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613073433;
        bh=ypvDi03E74u/ah1oiL+ZS6z3v6sX7kxXBm+WVY/s508=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Va+EhHMJJ2atdEcts23sjP8Ku57gjYeK5if+tXCY4uUgHl/hrCuLDO+zjJvMFbBa2
         TY9HN8Y0Taqo5abuuXKMSsxCfwo/LnTOVcaNz5KJY3o6D1XdyS9K+hQCecV8abpjAc
         1IwsDiSEe7oAXSiBtZOQycjYPA8Pve0pZyIdDmhpOJ/27NGJf3MpVU+drpU4a30au3
         NM+Sn9nzGMizck8KCgo5vtWIv/Z1o/UOEV1IRHsiTpJGlks4+X6DrZlLzgBPo+36WA
         1rEkzUOFAfohzY2mxXMQ04lyQQaTqwt9g1+CGRVsmMwE3E6y4bAZbhBoJUBt/0Fz7T
         802detJCfTnzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126124540.3320214-17-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org> <20210126124540.3320214-17-lee.jones@linaro.org>
Subject: Re: [PATCH 16/21] clk: qcom: mmcc-msm8974: Remove unused static const tables 'mmcc_xo_mmpll0_1_2_gpll0{map}'
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     lee.jones@linaro.org
Date:   Thu, 11 Feb 2021 11:57:12 -0800
Message-ID: <161307343229.1254594.9274758977515883530@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Lee Jones (2021-01-26 04:45:35)
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/clk/qcom/mmcc-msm8974.c:85:27: warning: =E2=80=98mmcc_xo_mmpll0_=
1_2_gpll0=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>  drivers/clk/qcom/mmcc-msm8974.c:77:32: warning: =E2=80=98mmcc_xo_mmpll0_=
1_2_gpll0_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>=20
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---

Applied to clk-next
