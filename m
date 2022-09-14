Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44C3ECAAD8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Sep 2022 03:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiINDTi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 23:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiINDTg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 23:19:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1EDF113B;
        Tue, 13 Sep 2022 20:19:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E5FF61764;
        Wed, 14 Sep 2022 03:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA931C433D6;
        Wed, 14 Sep 2022 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663125571;
        bh=9y3+3IOaXGKW43Ul90HWFINdLCD43Jpd6InoIzGi9Es=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cx/LNHahoJNoGX3sVhUBPvKIXdMXkpHpzCgGDUB++QXtZrdQmQst0q3ZH43Tp6RSF
         DGVYXv+T3FF4J7dJB339C0jI3m/csVSYWOgzEIoyDra64HOPKJNGZl5+jGMB49Vapw
         HoOOvBOLEZfxivt0vtsUoEmRAAeRPEnW/yGhBqsa5EqBYY0tII+IQfsbI1VO9tVQPC
         xySZ75eRuA/rB5EnmzrshuhhSgUrIDe6P/KeUZEZ6rEa2fIBDh4EHfX9mXZI6hjvrB
         dQ+/1bZGfQAhah1b3rm0sTpbL3p6AjOQFgx5I+q+PFXTvy3EdCL2Z43I38NDLvM7ja
         ZxskiGqwb4oRw==
Date:   Tue, 13 Sep 2022 22:19:28 -0500
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the
 driver
Message-ID: <20220914031928.i6x6gumzcvdilgh3@builder.lan>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
 <013f2dd7-c15f-5b0e-c98a-595dd4d5a2c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013f2dd7-c15f-5b0e-c98a-595dd4d5a2c5@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 09, 2022 at 01:22:40PM +0300, Dmitry Baryshkov wrote:
> On 14/07/2022 13:03, Dmitry Baryshkov wrote:
> > This patch series depends on patches 1-5 from [1].
> > 
> > Path 1 is slightly fixed version of patch 6 from the mentioned
> > patch series (fixed to use parent_hws where applicable). The rest is
> > minor cleanup of the driver.
> > 
> > [1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/
> > 
> 
> Gracious ping. Yassing, Bjorn, Konrad?
> 

As I haven't heard anything from Yassine or Konrad I went ahead and
tried to pick this, unfortunately [1] doesn't apply.

Could you please rebase the patches from [1] that you want applied and
resubmit that?

Thanks,
Bjorn

> > 
> > Dmitry Baryshkov (5):
> >    clk: qcom: cpu-8996: switch to devm_clk_notifier_register
> >    clk: qcom: cpu-8996: declare ACD clocks
> >    clk: qcom: cpu-8996: move ACD logic to
> >      clk_cpu_8996_pmux_determine_rate
> >    clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
> >    clk: qcom: cpu-8996: use constant mask for pmux
> > 
> > Yassine Oudjana (1):
> >    clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
> > 
> >   drivers/clk/qcom/clk-cpu-8996.c | 191 +++++++++++++++++---------------
> >   1 file changed, 100 insertions(+), 91 deletions(-)
> > 
> > 
> > base-commit: ca48adcc40b09d7f26a7754d4d54cfc4bd611f38
> > prerequisite-patch-id: ff67ff7bea1aef8e367a2589c46cf2c9ebb48664
> > prerequisite-patch-id: 1fdf02d8161689f3e571816d73ec94b115f51c34
> > prerequisite-patch-id: 837945fbb40427dac2e95a58b7660a3cf26d7d53
> > prerequisite-patch-id: df10945929f6f558c1363a23e2993d748a40236f
> > prerequisite-patch-id: a657a27256ef4be0cb932cb0ca7b3e4768e466f9
> 
> -- 
> With best wishes
> Dmitry
> 
