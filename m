Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D8AC43461
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27ECD61242
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhDHAQZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:16:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:42376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAQZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FE9A61178;
        Thu,  8 Apr 2021 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840975;
        bh=F0YKiu9IYtkvCIWl2rixjASVooXtxBkkyrvF+sUCNz8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=V6uH18Ovi2L6jMWKLwWurUtr2phHYrAMqertB29bk7+IGGW4dfB8YKcIbrj7PXYRY
         5PWTjfwGm/007xUmidzpKaFqmSdMAzwMUua8tkzKvU2765dtYpFytABr/EQgpBSYL3
         3wibJfGbTGL4FFCKNfZsujUwVNPZoRGO8oWsD4IWJHUkJG4mi86tUa/czv+3FnHxvS
         MhjpJhDX1GttunasyJh1cGmMtQJ1IGGUjrcUgdvOF46ue4KT+i18Vi1T+Vc5/P6Sv5
         w1BvshoyUb68+mCPDIqhiOwndz3xqgh/PLN1/c5+53XH0OPKJArOwm0s2Ozvw0/k02
         u3kvDZHL2ufug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-17-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-17-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 16/33] clk: qcom: videocc-sdm845: get rid of the test clock
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:14 -0700
Message-ID: <161784097419.3790633.28541264217561180@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:26)
> The test clock isn't in the bindings and apparently it's not used by
> anyone upstream.  Remove it.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
