Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF41DC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91A7361184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhDHAPz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:15:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:42180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229484AbhDHAPy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:15:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA2E61178;
        Thu,  8 Apr 2021 00:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617840944;
        bh=hbjG+VM+aEyLDNFteu4vpM5ENhINXD35zqyGiXswPf4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=exak0bh/phCpVVP5WaEiHucXO7ewLGSNkLGJcXNRC4u6KbHKWEuLglRpu+vIJkouv
         7s9HBPWFc3A3yFHt17oIAbqe7AVk4kP1a6rVOaJGng2U58CGrMAgDKTGBRNfdvRvSh
         pTN1067TQxvQvKY0V5rXtwLUXv+Ff/ZQuQHbaLnS0Ib2pAvE1CFGwkEhEUXxlATzo8
         H3SXl0vojGMSDy27Pcs7FuHtW4hdLm1l7rqMyrKciH5aELt3tGZvbUatw4bWr1CB6w
         TV18fNVQQKXrR7Qeph6JHr3Fdhz3PRBC42xOFSzju3tEAUyIPw2sYNfYT7vcIGASHJ
         DDabgPnvdSHlw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-12-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-12-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 11/33] clk: qcom: dispcc-sdm845: convert to parent data
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:15:43 -0700
Message-ID: <161784094346.3790633.17424703608371060250@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:21)
> Convert the clock driver to specify parent data rather than parent
> names, to actually bind using 'clock-names' specified in the DTS rather
> than global clock names.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
