Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31806C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 20:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233302AbiFYUAo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 25 Jun 2022 16:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233276AbiFYUAn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Jun 2022 16:00:43 -0400
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com [IPv6:2001:4860:4864:20::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F44B7E9
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 13:00:39 -0700 (PDT)
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-101d96fe0a5so8185231fac.2
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 13:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GoHTL5pc7929tKgNPXg2nW2kzENqcme0/+lvG0VCiB8=;
        b=P9/d2vqi0S4nDX0/Q7iwQJQXtcSWzOF+75qBFEQXnxYG012L7l7Y6rZtrqpnV8sn/H
         g6rkxGsOBdw13y9r9b2vdilnR5zuwrJOXtyxuvDPJzKEf0Lbq+ZBVoAyKOKdkC/cB4XA
         62sQOQ5g6gDJMRDKtabVKkCKdTOvHdHeGBsPV9KIPRaS27ikp7AkPtt0Iup0UrRyTAx4
         Sm+rnL8iYjCrhJmFosCSClpgwoO51DrA9dEU3vmnEzFAZpUGk2Usoy/yg9y1Pe0Sf3qH
         wpM6zJpivs+tmMMYDJ1iK2sapz3k1ejoqNaNhp9r3IcEcRy66Hq93qfnhpX+EDBbrlS3
         XqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GoHTL5pc7929tKgNPXg2nW2kzENqcme0/+lvG0VCiB8=;
        b=GwZ2pb1OJq36HKnN+77HFLLVraAKpWfLC2JIcnzgzU2dNvUMkxSfRH5e28EIR6gS14
         amhsRsFvgteNiOe0olIS+eH84a1kz0+o8tl9mrmTGooX7oUcy/J3ULHTX0dGE7IAKd5b
         3uXlIKtlRXHmLP64IpsuxVlGcYpK8GOsgPpR1OT9dEQ+VscL86TcA176VuJ+HxptEI0c
         j5vQ5ZhTRgTbcd7cPE1sfPSFqCsVr+Zg6hdh/blalQ81bhPeKPi8J42kBN4dyvxgcP+Y
         zNW2Mj9fxOooXoPdsvqn1BIt99zWbVM8ks+zREKcIu7EbKnyP76JVaxiIcetwGXmwlMi
         xwLg==
X-Gm-Message-State: AJIora9cAPxjkS11yLrhr2eXZfeq14gABt2K0mCirkk0xnceBxlKmWVZ
        mZ81G4TiKI2RXg/l0Sdpp326FQ==
X-Google-Smtp-Source: AGRyM1uS2g0J6WOPaAL2iqi0XdzNdGYJ9SATCQGmKDYOVVcrz9/DIH+EaNp3mGkr0Upk6fjqJEr4MQ==
X-Received: by 2002:a05:6870:3920:b0:101:d628:b053 with SMTP id b32-20020a056870392000b00101d628b053mr6084774oap.111.1656187239166;
        Sat, 25 Jun 2022 13:00:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y21-20020a056870419500b000f3321caa73sm4160632oac.16.2022.06.25.13.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 13:00:38 -0700 (PDT)
Date:   Sat, 25 Jun 2022 15:00:36 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH] clk: qcom: rpmh: Add note about sleep/wake state for BCMs
Message-ID: <YrdpZHbsJ+2m/fI+@builder.lan>
References: <20220517190949.2922197-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517190949.2922197-1-swboyd@chromium.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 17 May 14:09 CDT 2022, Stephen Boyd wrote:

> The sleep/wake state doesn't need to be set here because of specific
> RPMh behavior that carries over the active state when sleep/wake state
> hasn't been modified. Add a note to the code so we aren't tempted to set
> the sleep/wake states.
> 
> Cc: Alex Elder <elder@linaro.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
> 
> This superseedes a previous patch[1] I sent that tried to fix this.
> 
>  drivers/clk/qcom/clk-rpmh.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index aed907982344..c07cab6905cb 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -274,6 +274,11 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
>  		cmd.addr = c->res_addr;
>  		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);
>  
> +		/*
> +		 * Send only an active only state request. RPMh continues to
> +		 * use the active state when we're in sleep/wake state as long
> +		 * as the sleep/wake state has never been set.
> +		 */
>  		ret = clk_rpmh_send(c, RPMH_ACTIVE_ONLY_STATE, &cmd, enable);
>  		if (ret) {
>  			dev_err(c->dev, "set active state of %s failed: (%d)\n",
> 
> base-commit: 42226c989789d8da4af1de0c31070c96726d990c
> -- 
> https://chromeos.dev
> [1] https://lore.kernel.org/r/20220412194505.614002-1-swboyd@chromium.org
