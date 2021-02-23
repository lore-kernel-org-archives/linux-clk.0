Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377A2C433E0
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 00:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB58D64E57
	for <linux-clk@archiver.kernel.org>; Tue, 23 Feb 2021 00:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhBWAnd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Feb 2021 19:43:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:33272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231223AbhBWAnc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Feb 2021 19:43:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C40964E4D;
        Tue, 23 Feb 2021 00:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614040972;
        bh=ilCT5oYh23ohebSk42NoBcvnet+XpmhjryKDTDePABI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U34BdGm8NO7+enm4vnEBHaCAAVSNRBPVcS911G3MNviKTU3q2ARDnQPOmZ7XWMKnp
         tAPI2j41kmIjttg0pfbvb8cWmS5so/qlFB0Aub9cQ8kM+gxxFndF+LxGHWMsj+bNyz
         mXBEcQh5ePnFcGfldZj5DTB9WdBo3iT1no/p6SfahsIPZsCgJ5TRPErQ+3f3DDHy/5
         vX9+0uDAH4z9JnKOgZgVgFuSMRf/Aq8ymFeMdAfYo4hm7omNKMQfRltXTo/YF5wYCW
         DuYrpfVhQx539h7/Fiukn2yTb+uFtL1LNyb/pAn4cyALkUji1PYM6jJrB1JyHgxlE2
         j8PVa8AeA1CjA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210220155618.176559-6-konrad.dybcio@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org> <20210220155618.176559-6-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 6/6] clk: qcom: gcc-sdm660: Add CLK_SET_RATE_PARENT where applicable
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Mon, 22 Feb 2021 16:42:50 -0800
Message-ID: <161404097084.1254594.16485341937086704738@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Konrad Dybcio (2021-02-20 07:56:17)
> Some branch clocks should explicitly set this flag to make sure
> they inherit their frequencies from the parent clock.

This flag doesn't have anything to do with inheriting the rate from the
parent.

>=20
> Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver=
 for SDM660")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
