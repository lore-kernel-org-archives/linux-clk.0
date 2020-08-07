Return-Path: <SRS0=RyVB=BR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3584C433DF
	for <linux-clk@archiver.kernel.org>; Fri,  7 Aug 2020 21:42:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2459214F1
	for <linux-clk@archiver.kernel.org>; Fri,  7 Aug 2020 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1596836567;
	bh=amSzRwwB4oYiIBlYBqJnUvxcuZpXcMQU+1NE13Uhz/w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=JiCsv7lAQoyjm3Qd8Dh12anytv2k1HrKZWC0UsqSvf01p7u4MoRvwMOz63uaPi1Ff
	 RuHN/q0kz9zYaPKTtXwREiCzcdfr9QRKEMMbCe8g1DqXsJ0md06/gwhMw2aEx5Gk82
	 FddTZ1EH0mIYy8yPfJzApOBSlO03L359gCZXyMM4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgHGVmp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Aug 2020 17:42:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgHGVmp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 7 Aug 2020 17:42:45 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE0BA2086A;
        Fri,  7 Aug 2020 21:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596836564;
        bh=amSzRwwB4oYiIBlYBqJnUvxcuZpXcMQU+1NE13Uhz/w=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=o3p7EbfjtrsPbqMjEVpHTChatxG2U+g+Y/76zMxBGYfXNq47yA5q1xAtEyNT7UUTA
         AVnyg+xclHYJkn7eJbqYZFYEenzOPSzAbYIobeJ86YspziAZBtnBN382qb27VMzAcs
         FykDgGgEcIVzWrR+yMzt3LPk7wQt6K6G9b8/UIBw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <13ac9aad-2377-472d-b2be-a762a21c2dac@codeaurora.org>
References: <1595606878-2664-1-git-send-email-tdas@codeaurora.org> <1595606878-2664-5-git-send-email-tdas@codeaurora.org> <159665909245.1360974.10366839079633595523@swboyd.mtv.corp.google.com> <13ac9aad-2377-472d-b2be-a762a21c2dac@codeaurora.org>
Subject: Re: [PATCH v5 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 07 Aug 2020 14:42:43 -0700
Message-ID: <159683656359.1360974.18078513144154056292@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2020-08-05 22:23:05)
> On 8/6/2020 1:54 AM, Stephen Boyd wrote:
> >> +                               .hw =3D &core_clk_src.clkr.hw,
> >> +                       },
> >> +                       .num_parents =3D 1,
> >> +                       .flags =3D CLK_SET_RATE_PARENT,
> >> +                       .ops =3D &clk_branch2_ops,
> >> +               },
> >> +       },
> >> +};
> >> +
> >> +static struct clk_regmap *lpass_core_cc_sc7180_clocks[] =3D {
> >> +       [EXT_MCLK0_CLK_SRC] =3D &ext_mclk0_clk_src.clkr,
> >> +       [LPAIF_PRI_CLK_SRC] =3D &lpaif_pri_clk_src.clkr,
> >> +       [LPAIF_SEC_CLK_SRC] =3D &lpaif_sec_clk_src.clkr,
> >> +       [CORE_CLK_SRC] =3D &core_clk_src.clkr,
> >=20
> > And all of these, can they have LPASS_ prefix on the defines? Seems
> > like we're missing a namespace otherwise.
> >=20
>=20
> These are generated as they are in the HW plan. Do you still think I=20
> should update them?
>=20

As long as there aren't going to be conflicts in the clk names I guess
it's OK to do nothing here.
