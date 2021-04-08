Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177F2C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E279161184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbhDHAPZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:15:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:41992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2530F61178;
        Thu,  8 Apr 2021 00:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840913;
        bh=HzzJHyAQP9qDtBX1D3HJK4IUSSptJH+xmEcyA32juXU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=m1iADW94z2GJ7MRmNkaHx6judaBU4cwooMQTrc6bHyYGjAYgObXCMTFJ93XF6YWZo
         /1G/iFIvmLMUhNFq8x+UCcGE1PRc3eh2Zfjh7orVvsRHvPRMZMXwmFAj/iJn21SUgP
         vow4CZTjb9SdF8Zduehn+3wOX+AyCW1zcNprs0g0leS2dosVwg6wumgzdu33/vvvxp
         +b5D7z0EmN/T1eosIcrLgXUdMcB4Zn2JiEAsJpXhs0agIHuwZbGh7Mhv/SDID2szg6
         qAk2QKRDkXGkP3LgF7qRyPdqC/RnuYKReYAUobVtX3uRBruf6dki2cBQg5Jgq/mXxR
         1vXwveDW9myuw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-7-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-7-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 06/33] clk: qcom: gpucc-sm8150: drop unused enum entries
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:11 -0700
Message-ID: <161784091194.3790633.3619836163774484683@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:16)
> Drop unused enum entries from the list of parent enums.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
