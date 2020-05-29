Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E79AC433DF
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 01:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DC61207F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 01:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZvvmXCR+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438237AbgE2BMm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 May 2020 21:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438297AbgE2BMf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 May 2020 21:12:35 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9069DC08C5C8
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2020 18:12:34 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p30so480148pgl.11
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2020 18:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kI4zkU+qRTGbgWBmmIaqkd0hMY6ChqTdeDWJXNLS2lY=;
        b=ZvvmXCR+Jg6K8NJ5TP9zOcwdNhzYRynNjJaxE9BOTaQ4WMT0cuAK53MhuVB57WbOQK
         DIMMu5xbsbYDtoZBkAXIqsFLAV0S8qVPpSQjVshNcMDxg5EM1F40Sgi9sY/gDyXyTX+f
         z+gUA6CT2Pu2DiOB6T/chOupLze71KYm9GAMZBXookN3b+bO9a/W+8/PqcryQRI2RcTv
         gz6Gok+AZtkjRlb20hYQKsgwv1A9E+/wQT/UK0Pn123vnoVOzsGpVQbPv1DOqrQKtSNe
         Lj/qUb93fp5Lm9yu5G9EFWwrJDmjbfr9iB5WA2FM50ui6VDRlxeD2zCNvARtNlSHhZJx
         F37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kI4zkU+qRTGbgWBmmIaqkd0hMY6ChqTdeDWJXNLS2lY=;
        b=OtXxt0aw7hp9TC3qI5g/p9xKpL3ZwqO9NV1ntSc+uwsVwpMssPEtBfpfLOaHzA3jj5
         78BfPgWAenC9gKfTpyHRlsYwr/AEgFGN2zauhEGuiuPaJqG+Z74UuEqAhLKXr+pIDSvn
         j5U6+D2r/VDIa67QTtR/nRIxMS4V/9sWb0WJ84K9bq5VLcqxhWN0GY6pnTgid6ZvQno+
         EBT1yHPW3/dFEPAkNnah9w3XdFEJJZLOL1RA2nE3ovjD7lu64Wr8bo7Dhwqmew6+XDE7
         GKIi8zHEuDB2wiXgT3BkoR2bqDpaQK4joKF+YoHZoX8b1JAm7fBxi6ZecfQ4wHLxr8z6
         NfVQ==
X-Gm-Message-State: AOAM533BN1JBML7fdylnSKSh/tzPD0FPk95UqLc00g4mDuRrpqFRBg8F
        z9f2giZKBV1gQ+p31QjE1H2mAg==
X-Google-Smtp-Source: ABdhPJwfjsWrwj+SXPUBxHF2kWpN9zDhmEMPQN5652Q6TkJ5xvT3OmNnv6s97SHc8D/O4uvjVFeMVw==
X-Received: by 2002:a65:64c1:: with SMTP id t1mr5957407pgv.247.1590714753667;
        Thu, 28 May 2020 18:12:33 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 74sm2353876pfa.87.2020.05.28.18.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:12:32 -0700 (PDT)
Date:   Thu, 28 May 2020 18:11:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 08/10] clk: qcom: Add graphics clock controller driver
 for SM8250
Message-ID: <20200529011127.GJ279327@builder.lan>
References: <20200524210615.17035-1-jonathan@marek.ca>
 <20200524210615.17035-9-jonathan@marek.ca>
 <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d43cf01b6d014fdc2258abb94eb2c5@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 25 May 02:47 PDT 2020, Sai Prakash Ranjan wrote:

> Hi Jonathan,
> 
> On 2020-05-25 02:36, Jonathan Marek wrote:
> > Add support for the graphics clock controller found on SM8250
> > based devices. This would allow graphics drivers to probe and
> > control their clocks.
> > 
> > This is copied from the downstream kernel, adapted for upstream.
> > For example, GDSCs have been added.
> > 
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> 
> Since this is taken from downstream, maintain the original author's
> signed-off and add yourself as the co-developer if you have done
> any modifications. Same applies to all other patches.
> 

I disagree with this.

As expressed in the commit message, this patch is based on the
downstream driver, not the individual patch.  As such, the _patch_ is
prepared by Jonathan and by his Signed-off-by certifies the origin of
the contribution per section 11.a or 11.b of submitting-patches.rst.



Regarding co-developed-by; this should not be used when "forwarding" an
existing patch. Per section 11.c the contributor should add their
Signed-off-by to certify the origin of the patch. Any modifications
should be documented in immediately proceeding the s-o-b, as described
later in section 11.

Thanks,
Bjorn
