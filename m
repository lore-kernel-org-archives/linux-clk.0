Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B64C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C102C611C1
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhDHAQf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:16:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229747AbhDHAQe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:16:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6102961178;
        Thu,  8 Apr 2021 00:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840984;
        bh=s2bZShW45vp6KjIde1UXvlcJ91pbHgp0NuVbXCQGp8Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uyxst1hdSrh1qt4ZsAAGfmrxKWe3W3yqhskanx5EYwGyZu+NYs7+OZaLVgUxA8dCc
         KyE5TmNEppg0a2u9o27DwLZJW3fXKqMLEBXtpR61iAWy1eVpSdTp+wiyIfLuFpADxK
         Y9sg8AVKQHS0tHm16xx0MLMdpj2r2HT5A+CMMl3o5j6LICrG5DMHdibNqmv/mSw8s/
         jSssvl2aM5imeLZKJIWyQTxfn4zJxPJJuBe9usws2Wpfngj8JPziGReJhWendn5iED
         8Im3mDDn83OJwFZOTrSLqn4BHt2/koxqAm6QjZeiSSuKC957rbmf1b0j07Wguqdmup
         KpMAnoSJN7H7Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-18-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-18-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 17/33] clk: qcom: dispcc-sc7180: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:23 -0700
Message-ID: <161784098318.3790633.4781415847549769486@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:27)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
