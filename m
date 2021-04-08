Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FE4C433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6110F61178
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhDHAPL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:15:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:41894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D22361028;
        Thu,  8 Apr 2021 00:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840900;
        bh=X1JhrR0ssqWS7HUd1KY8DhSuzwPTlASKxKKPUbZD5Jw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RTPLT1DYhQz3zwADuEMAhZP1JAiLvn178dAjTn2HRhmRDqzk3bsjrncReV6jnN+0D
         raOOggkDQVVYiWZiRbA9lA+txAnhdhv1jwHrVDpdHLIr3yURYwgi9C5BeP+WUF2J3e
         9kOEUZRFpAC4LV/8nzM9LJk8pZe6zYhHsg/NKX8caSbVGmmzWPMNGA1lLAz9O4N2I5
         /DJOw+9NlyxT48LiEI2npqQwKL4deniSxVxAkY0d8d1FEA2pznLTN3uUZhKvyw05ge
         j1NWaVkIomNsoRxyAf3KYZu8lAfRFQqnQzW74oJjZNGM+uI+CIOMIfZR/2Apn6lit1
         FgT2in8IO4HOA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-5-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 04/33] clk: qcom: gpucc-sc7180: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:14:58 -0700
Message-ID: <161784089899.3790633.13797232366723491578@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:14)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
