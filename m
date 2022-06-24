Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA026C43334
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 16:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbiFXQkd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 12:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiFXQkd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 12:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 859AE50B32
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656088831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n8dnSmLnMjgwT5vMe64j54S8t18apFExaSS8ijTHrlc=;
        b=a3hkPg0DUVp9u1kMboSvzrTIeuuQ0ELzCTm7YTTOQuxJKTeQ3v6RDbkJWnxbe6X4wcbK3o
        Q32hiOE4r5xEM88sBG5j2cYRVS0CjiH1GRMThWfMuh8HTKfi/LnWmMQNF9K1c33EDBRS1W
        jeHBxy2qHdMp28SYwpfsahHPqhfb+kU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-FCgd6rNLN8KDaRBwRdBS9Q-1; Fri, 24 Jun 2022 12:40:29 -0400
X-MC-Unique: FCgd6rNLN8KDaRBwRdBS9Q-1
Received: by mail-qk1-f197.google.com with SMTP id o10-20020a05620a2a0a00b006a77a64cd23so3126847qkp.21
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 09:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8dnSmLnMjgwT5vMe64j54S8t18apFExaSS8ijTHrlc=;
        b=MM8OEVmiv6hq9IvwJtPkMDjNwXqxagQpFjRydiNVcrI5FFEP/Id28+kktEIyIwP+td
         mIWVVKrd9RHAdAtwOUEwV8dZXmWYhlMXgE3GQpHNIEREc4TWKBpjwAOx3+eQjMFO7q+8
         F4MIq8nb5GRBS89+TlE//yiRRxWviuBZ/mchbeJDMw+463g447Zbttw62nKscZff+BzA
         1zOGoM+3ul2UvI0G+b3DXdn0VTCCisImEHPgreZoIDSG8SKxiwAI1VUgVH8kddsoBxxq
         F2PPA7SIGJG0khHvbb9lEvAsg/93mlNDwNjrdXgob3hPSu+OPm4X86CG1nt21NEbo015
         3wgw==
X-Gm-Message-State: AJIora9dC0NEiTzEIFj7cTsbnOxf8KtdgDx/QuTQg/aeY43glLoum30x
        5hK0zDzKn4rqkaoUr2fBt5T8Eh9RPS5KLRprLGULzqRTIAOcsXLClfxlA9HzY2pkTNBsNmFAFfn
        Xm4BKJNr49lfEXJ4YFje5
X-Received: by 2002:a05:620a:570:b0:6ab:91fc:59c6 with SMTP id p16-20020a05620a057000b006ab91fc59c6mr11437615qkp.707.1656088828951;
        Fri, 24 Jun 2022 09:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqIV6HjcrEOXeE3hIpiQoSxjY9PaPqQRY3anfHa/xGyouZ9QZhIZc62/U1nlcbovrv0ARCZQ==
X-Received: by 2002:a05:620a:570:b0:6ab:91fc:59c6 with SMTP id p16-20020a05620a057000b006ab91fc59c6mr11437579qkp.707.1656088828311;
        Fri, 24 Jun 2022 09:40:28 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id o1-20020a05620a2a0100b006a79479657fsm2408131qkp.108.2022.06.24.09.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:40:27 -0700 (PDT)
Date:   Fri, 24 Jun 2022 12:40:26 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        ahalaney@redhat.com, echanude@redhat.com
Subject: Re: [PATCH] clk: qcom: sc8280xp: add parent to gcc_ufs_phy_axi_clk
 for sa8540p
Message-ID: <YrXo+i3wwl2ERKIj@xps13>
References: <20220623142837.3140680-1-bmasney@redhat.com>
 <20220624002055.58BCFC341C0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624002055.58BCFC341C0@smtp.kernel.org>
User-Agent: Mutt/2.2.5 (2022-05-16)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 23, 2022 at 05:20:53PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2022-06-23 07:28:37)
> > diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> > index 4b894442fdf5..4639b50da418 100644
> > --- a/drivers/clk/qcom/gcc-sc8280xp.c
> > +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> > @@ -5696,6 +5709,7 @@ static struct clk_branch gcc_ufs_phy_axi_clk = {
> >                 .hw.init = &(const struct clk_init_data) {
> >                         .name = "gcc_ufs_phy_axi_clk",
> >                         .parent_hws = (const struct clk_hw*[]){
> > +                               &gcc_ufs_ref_clkref_clk.clkr.hw,
> >                                 &gcc_ufs_phy_axi_clk_src.clkr.hw,
> >                         },
> >                         .num_parents = 1,
> 
> num_parents needs an update. 

Oops!

> But this is a branch, not a mux, so it can't have more than one
> parent.

Would a mux be represented with 'struct clk_rcg2'?

Brian

