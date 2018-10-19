Return-Path: <SRS0=xlmH=M7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164A3ECDE43
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 06:28:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D64472083E
	for <linux-clk@archiver.kernel.org>; Fri, 19 Oct 2018 06:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D64472083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buserror.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbeJSOcv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Oct 2018 10:32:51 -0400
Received: from baldur.buserror.net ([165.227.176.147]:42458 "EHLO
        baldur.buserror.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbeJSOcv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Oct 2018 10:32:51 -0400
Received: from [2601:449:8400:7293:12bf:48ff:fe84:c9a0]
        by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <oss@buserror.net>)
        id 1gDOGT-0001df-El; Fri, 19 Oct 2018 01:28:06 -0500
Message-ID: <05005bca663190ca375e7ddcdc9221f99655010d.camel@buserror.net>
From:   Scott Wood <oss@buserror.net>
To:     Andy Tang <andy.tang@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Date:   Fri, 19 Oct 2018 01:28:04 -0500
In-Reply-To: <DB5PR0401MB221359C5FB8FE3AAA36A3F0BF3F80@DB5PR0401MB2213.eurprd04.prod.outlook.com>
References: <20180919073906.34187-1-andy.tang@nxp.com>
         <DB5PR0401MB22134ACEF603C05F6B0D9980F3FE0@DB5PR0401MB2213.eurprd04.prod.outlook.com>
         <153979005694.5275.12929241736979814342@swboyd.mtv.corp.google.com>
         <DB5PR0401MB221359C5FB8FE3AAA36A3F0BF3F80@DB5PR0401MB2213.eurprd04.prod.outlook.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8400:7293:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: andy.tang@nxp.com, sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
X-SA-Exim-Mail-From: oss@buserror.net
Subject: Re: [PATCH 1/3] clk: qoriq: add t1023 soc support
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 2018-10-18 at 01:00 +0000, Andy Tang wrote:
> > -----Original Message-----
> > From: Stephen Boyd <sboyd@kernel.org>
> > Sent: 2018年10月17日 23:28
> > To: mturquette@baylibre.com; oss@buserror.net; Andy Tang
> > <andy.tang@nxp.com>
> > Cc: robh+dt@kernel.org; mark.rutland@arm.com;
> > linux-clk@vger.kernel.org; devicetree@vger.kernel.org
> > Subject: RE: [PATCH 1/3] clk: qoriq: add t1023 soc support
> > 
> > Quoting Andy Tang (2018-10-15 23:17:18)
> > > Hi,
> > > 
> > > Appreciate if you can take a look at this patch set.
> > > 
> > 
> > I can pick the clk patches, but not the dts bits. Sound good?
> 
> Let's see what Scott say.
> 
> Hi Scott,
> 
> Do you have any comments about this patch set?
> 
> Do you thinik it is ok if Stephen picks up the clk patch and you pick up the
> rest of two patches?
> Or one of you Acked the patch and the other one apply them all?

I can take the dts patches.

-Scott

