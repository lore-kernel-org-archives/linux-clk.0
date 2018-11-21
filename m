Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0C3C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 19:24:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 30642214DB
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 19:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1xp4smNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30642214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730624AbeKVGAH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Nov 2018 01:00:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:47548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728993AbeKVGAH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Nov 2018 01:00:07 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2F7C214DA;
        Wed, 21 Nov 2018 19:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1542828271;
        bh=U32eRbh4J6+I+ONGT7L+TRXjYD3HfUxMm72tcae9J08=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=1xp4smNhO2wnL8GJq7w+3O2Gn4OIS9XVfMuZm7Vz1aeua3hHHio84Cu8B3w6jgjPv
         ZXE+ewKfkm9Oo8shdcL2XN7MajIHHybOE9YFEoeOFlGqkKyF0mItohgkzAmV30AUU6
         g7nvpkF3V8pSxPDIIrgw5apoRtlT3pttRASm/DgA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Jordan Crouse <jcrouse@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20181121150006.GH31792@jcrouse-lnx.qualcomm.com>
Cc:     mturquette@baylibre.com, andy.gross@linaro.org,
        david.brown@linaro.org, rnayak@codeaurora.org,
        okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.orgi, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, robdclark@gmail.com,
        freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
 <20181119234706.5821-5-jcrouse@codeaurora.org>
 <154278688660.88331.17378009987496625085@swboyd.mtv.corp.google.com>
 <20181121150006.GH31792@jcrouse-lnx.qualcomm.com>
Message-ID: <154282827100.88331.17877088165837589553@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH 4/4] drm/msm/gpu: Attach to the GPU GX power domain
Date:   Wed, 21 Nov 2018 11:24:31 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jordan Crouse (2018-11-21 07:00:06)
> On Tue, Nov 20, 2018 at 11:54:46PM -0800, Stephen Boyd wrote:
> > Quoting Jordan Crouse (2018-11-19 15:47:06)
> > > @@ -1203,6 +1236,12 @@ int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, =
struct device_node *node)
> > >         if (gmu->hfi_irq < 0 || gmu->gmu_irq < 0)
> > >                 goto err;
> > >  =

> > > +       /*
> > > +        * Get a link to the GX power domain to reset the GPU in case=
 of GMU
> > > +        * crash
> > > +        */
> > > +       gmu->gxpd =3D dev_pm_domain_attach_by_name(gmu->dev, "gx");
> > =

> > Are there a6xx devices that don't have this genpd? Just curious if we
> > could always assume that if it's an a6xx gpu then this must be there and
> > we can always call pm_runtime_get/put on it and avoid the if (!IS_ERR())
> > checks.
> =

> Mainly I was trying to be backwards compatible with the device tree. I di=
dn't
> want to derail various development efforts. I don't mind the checks (thou=
gh I
> wish that pm_runtime_* was error tolerant) but folks really hate them we =
can
> replace this with an error return and force people to update their device=
 trees.
> =


Ok. Well we don't have this DT node in mainline yet so either followup
after the merge cycle and remove the checks, or just take the pain now
and remove the checks and tell people using out of tree DT to update?

