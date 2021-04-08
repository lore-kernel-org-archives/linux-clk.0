Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90451C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6067961178
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhDHARA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:17:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:42536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 560F961028;
        Thu,  8 Apr 2021 00:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841010;
        bh=0i5KJWro05xgNXRn8v4U4/Bt3JFH7mIcQsNA3kUzMV8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=e+NYEpTdn/vaJ356IGm48pKXtc89mDYQwIjSguB9La1hSo+GD8dQXmvMmdoTTmBdM
         QpUCyZbv51YpPo04qwwt7tiaF6BlL3Xo17zXow1jRVtTqw+DrxIxGJ9iWHMj2RUd5B
         ClbJvgKeIOnwkFSry68fvL4hOuTkpBdgmAy2qx3EVl5LxRtXeyn/i4+rfbn3rSiwJp
         8zCkUOzTQWHF264XepI/UGcsQSy+55/knQbnBrSJ06s+svwlCoOrVMcM93dUItwzSM
         g04qIaTeTRCNT8RBU/Kis/JgcteuhcrwJdVnyQrvhmO8hMjKbYwr0c6Fl83dm3p+X7
         jKHQPjkzHIH7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-22-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-22-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 21/33] clk: qcom: gcc-sdx55: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:16:49 -0700
Message-ID: <161784100919.3790633.16218148793687344529@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:31)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
