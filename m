Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B23CC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 755A261184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhDHAPn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:15:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPm (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA77061178;
        Thu,  8 Apr 2021 00:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840932;
        bh=mVIh3Kdqv9YohUuQAZJU7bJg7q+y7iMSbaifSHoGdXU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lekEmjYG44KiTB5+1ao1yUx1/FsyfK4S8YiTfqAznULSYbGtUA4l4zsfzSsyornvt
         liUkhegiNpZIxZ8iI4mc8Biw72OmqVBqXOzdsc4cSE4FSvVcV/07QPnTjxAVZU7RFX
         4Fb78IRve2bCiZxZKkNImdswwTeUj1VTyFSt0jetxYO5PwbxvKmH5wAiQ+z07eekH9
         nqELMXniFnSuY9GJ+HMYLYMaCD6aOnsYEt93jgUVQbUzLz6MuZESAc+RM4rL7JP0Lp
         U2/sI3h5wR9uiYjN3wleXhC+ISSQ4bNulThPA+xLMPgbXYUX1P14uA+4LWdjsQ2+/H
         G2kr4YlaTk79w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-10-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-10-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 09/33] clk: qcom: videocc-sm8150: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:30 -0700
Message-ID: <161784093069.3790633.17762083967275693455@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:19)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
