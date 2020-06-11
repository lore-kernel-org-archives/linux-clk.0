Return-Path: <SRS0=Q/ZM=7Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A84C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 01:06:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C408720848
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 01:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1591837604;
	bh=W6LKa2P4P/rOjYxLOpN3TGjHxp6jobdkYSFv//1nxqI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=TNwLP/M0V2Hihwm5+r13xXCiIOIyra3jShHcF4IHXDM0KOkFYEhw7oRm9AZa3NTO3
	 vWbnNa7wBB4cOazfIblngZVs32dlqeJhlhG4x5YUxXV45oKBKv0LnP2/TrWRCq+Wlr
	 ma/xXr3dO9mVhURy0mlPwbMo33ic+1Zs4W3DFtL0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgFKBGo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 21:06:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:46534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726163AbgFKBGn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Jun 2020 21:06:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 643962078D;
        Thu, 11 Jun 2020 01:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591837603;
        bh=W6LKa2P4P/rOjYxLOpN3TGjHxp6jobdkYSFv//1nxqI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=p5Ws/B7v9A2CtqbLecns1vXEfFust/09wjIA3exRacTuoXpAUu1lFo/8oQi1QviGH
         rWzf2rT+Jx9bbxyjuuDKAZ99lRt4PBEKCa6Ia+lB0qKC2dS7eA5KYoR0vt+H6Q2ioR
         eddd++OO/z0hFuBbX8Tdf2N+8e0S9oruT9rl4AJE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3ac34bd7-bc5b-bc04-99ba-8ba3c5a9a691@codeaurora.org>
References: <1589707344-8871-1-git-send-email-tdas@codeaurora.org> <1589707344-8871-5-git-send-email-tdas@codeaurora.org> <159054904061.88029.1394425232497625411@swboyd.mtv.corp.google.com> <3ac34bd7-bc5b-bc04-99ba-8ba3c5a9a691@codeaurora.org>
Subject: Re: [PATCH v2 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 10 Jun 2020 18:06:42 -0700
Message-ID: <159183760269.242598.3005455698894049563@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Taniya Das (2020-06-10 10:11:49)
> On 5/27/2020 8:40 AM, Stephen Boyd wrote:
> > Quoting Taniya Das (2020-05-17 02:22:24)
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       lpass_core_cc_sc7180_regmap_config.name =3D "lpass_core_cc";
> >> +       regmap =3D qcom_cc_map(pdev, &lpass_core_cc_sc7180_desc);
> >> +       if (IS_ERR(regmap))
> >> +               return PTR_ERR(regmap);
> >> +
> >> +       /*
> >> +        * Keep the CLK always-ON
> >=20
> > Why? Presumably to make sure we can access the lpass sysnoc path all the
> > time?
> >=20
>=20
> This is an always ON clock from HW, just making sure to keep it enabled.

I'm not following. Hardware says it must always be enabled? If it isn't
enabled is it even possible to write this register?

>=20
> >> +        * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
> >> +        */
> >> +       regmap_update_bits(regmap, 0x24000, BIT(0), BIT(0));
> >> +
