Return-Path: <SRS0=IhfR=UZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23413C48BD6
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 13:18:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F023C214DA
	for <linux-clk@archiver.kernel.org>; Wed, 26 Jun 2019 13:18:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FjuGCbrO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727489AbfFZNSH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Jun 2019 09:18:07 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:9436 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726599AbfFZNSH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Jun 2019 09:18:07 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5QDFRRZ024310;
        Wed, 26 Jun 2019 08:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=9x7ieykS+IyQbN06xr+YUpt1YDVMVJvEsUxN+0EF/jc=;
 b=FjuGCbrO6MFd0U1wUpuNgBOR/29CfV/079IOIuJfkp3EQ/ngkw4p0Qmq1c6Rnh6EtkPO
 1eaXJMoMnnWEv5PiNOtQzsX9MfnsTasfFi0h6hYGWn6Cws30VFrgMnydoBdrgflzPMd0
 rDek0UAoxiIw1WJhl5CjbBNwoiwHZIvo6C7RmmCLfFpo8iIJljLpRz6aJGPIcojbGHjz
 76KUECnqdxWAD+Y4HBIWfRzweQVeQ6ZTCMrfi/DHIXJCWjACrK/XtfdXZ0+3gNOQXogk
 TaOI5L8asI38HtuxRqDzomFvlKk1aSZoVre7nwHJju0R0xbjIp8ecsxxfFK3eJBt6wit Ew== 
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail2.cirrus.com (mail2.cirrus.com [141.131.128.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2tc7gt868x-1;
        Wed, 26 Jun 2019 08:18:03 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail2.cirrus.com (Postfix) with ESMTP id 53380605A680;
        Wed, 26 Jun 2019 08:18:03 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 26 Jun
 2019 14:18:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 26 Jun 2019 14:18:02 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9B7F944;
        Wed, 26 Jun 2019 14:18:02 +0100 (BST)
Date:   Wed, 26 Jun 2019 14:18:02 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v3 RESEND] clk: lochnagar: Use new parent_data approach
 to register clock parents
Message-ID: <20190626131802.GE54126@ediswmail.ad.cirrus.com>
References: <20190625131053.25407-1-ckeepax@opensource.cirrus.com>
 <20190625234500.14A052086D@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190625234500.14A052086D@mail.kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260158
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jun 25, 2019 at 04:44:59PM -0700, Stephen Boyd wrote:
> Quoting Charles Keepax (2019-06-25 06:10:53)
> > -static const char * const lochnagar1_clk_parents[] = {
> > -       "ln-none",
> > -       "ln-spdif-mclk",
> > -       "ln-psia1-mclk",
> > -       "ln-psia2-mclk",
> > -       "ln-cdc-clkout",
> > -       "ln-dsp-clkout",
> > -       "ln-pmic-32k",
> > -       "ln-gf-mclk1",
> > -       "ln-gf-mclk3",
> > -       "ln-gf-mclk2",
> > -       "ln-gf-mclk4",
> > +#define LN_PARENT(NAME) { .name = NAME, .fw_name = NAME }
> > +
> > +static const struct clk_parent_data lochnagar1_clk_parents[] = {
> > +       LN_PARENT("ln-none"),
> > +       LN_PARENT("ln-spdif-mclk"),
> 
> The above two aren't documented in the binding. Is it intentional? I'd
> like to apply this patch, but I don't want it to use undocumented
> bindings.
> 

ln-none is intentionally missing from the binding, it isn't really
used at the moment, it is really more of a place holder for when
the clocks are not parented to anything as many will generate a
clock in that case. Maybe in the future it might be used to allow
clocks to be put back into that state after being parented but that
probably requires more thought.

ln-spdif-mclk should be in the binding though I will do a patch
to add it. Do you want me to resend this patch as well? Feels
like this stuff is orthogonal to what this patch is doing.

Thanks,
Charles

> > +       LN_PARENT("ln-psia1-mclk"),
> > +       LN_PARENT("ln-psia2-mclk"),
> > +       LN_PARENT("ln-cdc-clkout"),
> > +       LN_PARENT("ln-dsp-clkout"),
> > +       LN_PARENT("ln-pmic-32k"),
> > +       LN_PARENT("ln-gf-mclk1"),
> > +       LN_PARENT("ln-gf-mclk3"),
> > +       LN_PARENT("ln-gf-mclk2"),
> > +       LN_PARENT("ln-gf-mclk4"),
> >  };
> >  
