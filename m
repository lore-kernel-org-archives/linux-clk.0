Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E78D1C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 00:37:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiFXAhS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 20:37:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbiFXAhR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 20:37:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E09563B9;
        Thu, 23 Jun 2022 17:37:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DD1ADB824D7;
        Fri, 24 Jun 2022 00:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918ACC3411D;
        Fri, 24 Jun 2022 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656031034;
        bh=WMRdrGXuOc8CDXCOCyIZvExYYf3XnIJWGBZiRPmrL+4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fdS1Gw4M6Z3bRCrqAibW9djFqkkecEaVwuqLG/XJtXouZxf6PEflzggyXSdS/o1Vo
         1oJ5+h8Ovcx69mHNt8crtvCvA/YXaZ5+fnp8VkfeXymPICbGXVLIlJisg7up2XLyFK
         ZzDppVcrTte97+LEtehbkZtpDWmAQqM+n8FRI1FIqJrtfx4W4fKTyaL8lqYxwKiRNl
         nve9lEdtne6K4Wn1NYJ6XKJ3YyOyl40yakbNjktjLZEWqSfxFQxj4pZkKJh1E+VT5e
         d8AN/bB7OCLYBlJGG9JgDGvUs50f0kbGxnoClOSUWMEq1C2/bd7tUrRNhgMXUiFi0R
         SjRTJyzNKzMdg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
References: <20220620215150.1875557-1-dmitry.baryshkov@linaro.org> <CAE-0n53X6mwQuoZAgC-mBP42HKqy=NuE7nJpgHGk-pYSFQpcjQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq806x: use parent_data for the last remaining entry
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Thu, 23 Jun 2022 17:37:12 -0700
User-Agent: alot/0.10
Message-Id: <20220624003714.918ACC3411D@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2022-06-23 17:27:18)
> Quoting Dmitry Baryshkov (2022-06-20 14:51:50)
> > Use parent_data for the last remaining entry (pll4). This clock is
> > provided by the lcc device.
> >=20
> > Fixes: cb02866f9a74 ("clk: qcom: gcc-ipq806x: convert parent_names to p=
arent_data")
> > Cc: Ansuel Smith <ansuelsmth@gmail.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/clk/qcom/gcc-ipq806x.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq8=
06x.c
> > index 718de17a1e60..6447f3e81b55 100644
> > --- a/drivers/clk/qcom/gcc-ipq806x.c
> > +++ b/drivers/clk/qcom/gcc-ipq806x.c
> > @@ -79,7 +79,9 @@ static struct clk_regmap pll4_vote =3D {
> >         .enable_mask =3D BIT(4),
> >         .hw.init =3D &(struct clk_init_data){
> >                 .name =3D "pll4_vote",
> > -               .parent_names =3D (const char *[]){ "pll4" },
> > +               .parent_data =3D &(const struct clk_parent_data){
> > +                       .fw_name =3D "pll4", .name =3D "pll4",
>=20
> Is there a DT binding update?

Also I'd appreciate clk patches be sent to my kernel.org email instead
of chromium to help my filters.
