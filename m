Return-Path: <SRS0=7bnF=UX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6902C43613
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 07:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CA3C2083D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Jun 2019 07:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561363099;
	bh=kVDcI31FJiBeQjNCXXdfs7eUHWmy92Y3czi8wuLH5wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=PF/ER389Sxi8goY5Je3WiQylQ3r8SbIjQGdT3vv80ie0LOUmelXHGGdcfqz3ORB05
	 hjk73SU4pt8WLlT6gao/DY8KY+SlmsGh52QuecLnpygsU1Qsi2HrMUJXXqqzAntzKn
	 io4WQ9C0i0vmmPIYMlOalSeJvb0+205V4YChHg54=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfFXH6T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Jun 2019 03:58:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725916AbfFXH6T (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Jun 2019 03:58:19 -0400
Received: from localhost (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D35E32083D;
        Mon, 24 Jun 2019 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561363098;
        bh=kVDcI31FJiBeQjNCXXdfs7eUHWmy92Y3czi8wuLH5wI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPTtIiAselJiL7oUTaniU7q2/RVh73sobFdW2O5+XihToq6h6heKCbEVvcaB9lgFL
         IrvSEmlzyReh8B2NoQLQ5qRURdF+LLPDbu6Cas/pEtIZksLtsEFpTOe9cHY1IyMdye
         wF0UJd9brQf+ubvGMzWV3KP2GukvJ0AjZYgi2RAM=
Date:   Mon, 24 Jun 2019 13:25:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: qcom: gcc-qcs404: Add MODULE_ALIAS
Message-ID: <20190624075509.GY2962@vkoul-mobl>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-4-vkoul@kernel.org>
 <20190617042649.GF750@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617042649.GF750@tuxbook-pro>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-06-19, 21:26, Bjorn Andersson wrote:
> On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:
> 
> > MODULE_ALIAS was missing for this driver which can be built as a
> > module, so add the MODULE_ALIAS.
> > 
> 
> MODULE_ALIAS() serves the purpose of providing an module alias for the
> driver, which allows the automatic kernel module loader to insmod the
> driver as a device needing it is being registered.
> 
> When the device is instantiated through the OF code path the compatible
> will be matched against the MODULE_DEVICE_TABLE(of, ) and if the device
> is programmatically registered (through platform_device_register_*())
> then the alias "platform:XYZ" will be used.

Thanks for the explanation Bjorn :)
> 
> So, unless we're going to support module autoloading of this driver from
> a board file no alias should be needed.

Nope we dont, so will drop this one and as well as from SM8150 driver

-- 
~Vinod
