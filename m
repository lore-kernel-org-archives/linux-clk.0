Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF85FC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:13:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B67D0610D1
	for <linux-clk@archiver.kernel.org>; Tue, 14 Sep 2021 21:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbhINVOf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:14:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:59668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231472AbhINVOf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Sep 2021 17:14:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7126761178;
        Tue, 14 Sep 2021 21:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631653997;
        bh=8YpUXXkntHsFUlG1VmXFXFQjihnNZ2eNBEyEKdGEgR8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=oyQ49IgI//jXZhFBjNMYL96J++4By0RTfEHokMtk3gma11+SQd56FOUquV/o1b1Ia
         s0oLRGuXwPVK+odmDtmoAM6afbaFJ2CUbjhaER3OKS38jQ6mPmNlAy1wZk00CPQDdH
         Su1BBA+ca5ZFXsGunpNUe6tjm/TGwTL2MgtGdZnmTqSLpEiZ3lahZ227bJLG23VRp4
         zP6WR4za/cvQsZYSFKQpktguFuyCYi4QYAiQM3XoVzKtN4SpdoW41yMfpaPlSYYLNr
         Vznzl1YejK0TEw/ZcgXQTjpmcTbWdnLgXjbeeIMOWHULCKqbwBGPB9ktbymOF04Vw6
         qb64PUYuakX9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829204822.289829-4-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org> <20210829204822.289829-4-marijn.suijten@somainline.org>
Subject: Re: [PATCH 3/4] clk: qcom: mmcc-sdm660: Use ARRAY_SIZE for num_parents
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Tue, 14 Sep 2021 14:13:16 -0700
Message-ID: <163165399631.763609.18187387046127614027@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marijn Suijten (2021-08-29 13:48:21)
> Where possible, use ARRAY_SIZE to determine the number of parents in
> clk_parent_data, instead of hardcoding it.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
