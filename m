Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97423C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:17:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E39361184
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 00:17:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDHARN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 20:17:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:42596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhDHARM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 20:17:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B8F061178;
        Thu,  8 Apr 2021 00:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617841022;
        bh=XnhoEGAZ+6T38D5/YGISSeojtmFxZPksjeDHnRAwAm0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TDOwAqn66VTxcyCtbRoIP4hqn5qKqzxVj66Hqu3a57y8daitraqOI66MUvXvhON1q
         olYpcYAp8eGxhTqgrftNEKinUn9LbDOwwMBCeTjWMOXMV+2Rkk2b9zozDFSL93wIRp
         mXmXTSUWEqmF2MZQd2hKoyes4LjBHtnSMYWh8lVYVI8zIC2KuMBDLh3o7eqfsv/KQx
         qzBX/JWQupEQb47v/9Q+Ws9oO1MMfqdD0tJwsg71tlO+gkdZJMH+ajOiL8B1GES/Ub
         basu2Yuni272I0SWEHcjAyIzcK+SLZcesRGN3xlLfCj4+a8ABNpbh8LbhNSFq+ZBT3
         MEVng5L0zXc/w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210405224743.590029-24-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org> <20210405224743.590029-24-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 23/33] clk: qcom: gcc-sm8250: use parent_hws where possible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Wed, 07 Apr 2021 17:17:01 -0700
Message-ID: <161784102128.3790633.2356562776249158357@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dmitry Baryshkov (2021-04-05 15:47:33)
> Switch to using parent_hws instead of parent_data when parents are
> defined in this driver and so accessible using clk_hw.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
