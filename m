Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6162C3A59B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 06:29:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA78120851
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 06:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566196188;
	bh=ZWpAO8QSDtl6+Jkb5PfpmEgOiBWyUwySwH5wx/nV7b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZLO7KyPy2X3AvKTV64AiYyX8dO1PYwjsuKFAjE/YRLlLEpPdF7KUWo1dTc8CoiyLd
	 wOkTOTfVuZHD6/YG7CAJM0k8Qr6Ghk+3oN4QThR6QtBLK6N6U8JhqKbyE2vbgAQY4x
	 EGsTE4mhbMMftCmmZN6+BFRvmy2LldnhD0DUw+Fk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfHSG3o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 02:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:33106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbfHSG3o (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Aug 2019 02:29:44 -0400
Received: from localhost (unknown [122.182.221.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1351520851;
        Mon, 19 Aug 2019 06:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566196183;
        bh=ZWpAO8QSDtl6+Jkb5PfpmEgOiBWyUwySwH5wx/nV7b0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z2eZOcRAIUnvXsUrfpOrZPFzDOBpiYH569dKoyLea3syk6QKVRNI3PMD1NhDjhBFt
         oBVmW3MPXJO0dCKVD1ZIJljxsWF060pNlQXvw9hHm0YY9pxOB5QuEfCssgG0cYw4K+
         N9PUF9Jv/oMCDDF6AjTKuH1N0n6whphyHZeRFNzo=
Date:   Mon, 19 Aug 2019 11:58:21 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add support for SM8150
Message-ID: <20190819062821.GF12733@vkoul-mobl.Dlink>
References: <20190814122958.4981-1-vkoul@kernel.org>
 <20190814122958.4981-2-vkoul@kernel.org>
 <20190814171946.E9E8D20665@mail.kernel.org>
 <20190816042440.GY12733@vkoul-mobl.Dlink>
 <20190816165812.BC64B2077C@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816165812.BC64B2077C@mail.kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-08-19, 09:58, Stephen Boyd wrote:
> Quoting Vinod Koul (2019-08-15 21:24:40)
> > On 14-08-19, 10:19, Stephen Boyd wrote:
> > > Quoting Vinod Koul (2019-08-14 05:29:58)
> > > > Add support for rpmh clocks found in SM8150
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > ---
> > > 
> > > Patch looks OK, but can you convert this driver to use the new parent
> > > style and then update the binding to handle it? We can fix the other
> > > platforms and dts files that use this driver in parallel, but sm8150
> > > will be forward looking.
> > 
> > Yes but that would also impact sdm845 as it uses this driver, so I
> > wanted to get this one done so that we have support for rpm clock and
> > then do the conversion.
> > 
> > Would that be okay with you to get this in and then I convert this?
> > 
> 
> How does it impact sdm845? The new way of specifying parents supports
> fallback to legacy string matching.

Yes it does, I have managed to convert this as well as sdm845 and test.
I will send updates shortly

Thanks
-- 
~Vinod
