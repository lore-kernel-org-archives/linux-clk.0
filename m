Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBB5C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 01:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiDWB7n (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 21:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiDWB7m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 21:59:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20BAAFC415;
        Fri, 22 Apr 2022 18:56:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D7F78B83240;
        Sat, 23 Apr 2022 01:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968EEC385A0;
        Sat, 23 Apr 2022 01:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650679004;
        bh=Bvs159fqlA+szPjoabbxj2y1cL+KWtGzrGMxMCDdbNs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nZVDUQ+UbA6SgSFlg9FR6a2yd6OefS6rhi1F1v0sJ0J53idPCeWU/c1mJ1/sMj1e/
         3thcCdmIUHYwC6dxbKreehRAOb5oXHzY3Rj+5XR26lpUxOAlc6qdHlXIVOuidz/2Cs
         2Vfyc0ATPQwpV6hWXCIgjrZdga/LSa3N+C60DSjlwG0sxVB+d3UlHOvKadpXMeeLjX
         jJhJOUo+OD+UM6vK8hF5KK2BoYWhQsxhQz3xl0T5v5Ddj+wf/ppFjdUNmyKOG9bKgy
         mB0yKscpydW7MASzHtm6l4W7geb31R2WQC2+gZAF/8f1fINaGZtL/dVhh70HPndHSy
         ZzmSYARA425ZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220422094817.f3b7l5hg5inuq7vs@houat>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org> <20220422024914.203CEC385A7@smtp.kernel.org> <20220422094817.f3b7l5hg5inuq7vs@houat>
Subject: Re: [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency calculation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        freedreno@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 22 Apr 2022 18:56:42 -0700
User-Agent: alot/0.10
Message-Id: <20220423015644.968EEC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-22 02:48:17)
> Hi,
>=20
> On Thu, Apr 21, 2022 at 07:49:12PM -0700, Stephen Boyd wrote:
> > +Maxime
> >=20
> > Quoting Dmitry Baryshkov (2022-04-19 16:54:47)
> > > Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> > > the clk_core_determine_round_nolock() would clamp the requested rate
> > > between min and max rates from the rate request. Normally these fields
> > > would be filled by clk_core_get_boundaries() called from
> > > clk_round_rate().
> > >=20
> > > However clk_gfx3d_determine_rate() uses a manually crafted rate reque=
st,
> > > which did not have these fields filled. Thus the requested frequency
> > > would be clamped to 0, resulting in weird frequencies being requested
> > > from the hardware.
> > >=20
> > > Fix this by filling min_rate and max_rate to the values valid for the
> > > respective PLLs (0 and ULONG_MAX).
> > >=20
> > > Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> >=20
> > I hope there aren't others like this lurking.
>=20
> The problem is larger than that (even though I overlooked this
> particular issue), and addressed partially by patches 12-19 here:
> https://lore.kernel.org/linux-clk/20220408091037.2041955-1-maxime@cerno.t=
ech/
>=20
> I wanted to have your feedback before fixing the relevant drivers, but
> these are:

Ok. Let me move the conversation over to that thread. I'm applying this
to clk-fixes.
