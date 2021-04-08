Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8BEC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:14:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70AED61178
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhDHAO6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:14:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:41834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAO6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:14:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD13261178;
        Thu,  8 Apr 2021 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840887;
        bh=CjcNotMzAiS7nsA/+J8t5DiGnGSCGc0vKPJ5V7H3OL4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sdQ8CCXuMnWbf2lOcvrCm7DaoxmNZjBS+isp4ySmAW2CCXoDceSUQ83RHZvEHhWTu
         fHVdD8WVpijjOurkKuRhH9kws5XWPbc/Kwz+Y6B2xnehhcWX6BT03vjPcq+kmq5Rmq
         1SnBU10EYVmvXN+V++Z/Z0jVWRg+whPK5MfPk46Ga69kEi6hWThysDtA+yG1hpKK3R
         4CvS4+7MZEbOssHS24bMZ0r4Y4NChHDkJu2aBuBLThWkG2ZtTza3KIl4llGNLzBUq1
         UrwXjtCRWTyBGvvMsxRWtjlUokdIjlg9zXl9hyxGrqBupQVMy7npyVQZ1Xdqxh1uSr
         yKsfX+GkleshQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-3-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-3-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 02/33] clk: qcom: dispcc-sm8250: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:14:46 -0700
Message-ID: <161784088671.3790633.15887980841687498824@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:12)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
