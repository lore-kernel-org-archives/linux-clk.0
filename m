Return-Path: <SRS0=T3R6=TB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5996EC43219
	for <linux-clk@archiver.kernel.org>; Wed,  1 May 2019 08:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 315E020835
	for <linux-clk@archiver.kernel.org>; Wed,  1 May 2019 08:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfEAIdW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 May 2019 04:33:22 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:45148 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725776AbfEAIdW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 May 2019 04:33:22 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x418NisY000381;
        Wed, 1 May 2019 03:33:19 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2s6xhyrrg3-1;
        Wed, 01 May 2019 03:33:19 -0500
Received: from EDIEX01.ad.cirrus.com (unknown [198.61.84.80])
        by mail1.cirrus.com (Postfix) with ESMTP id B1509611C8C0;
        Wed,  1 May 2019 03:33:18 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 1 May
 2019 09:33:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Wed, 1 May 2019 09:33:18 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F081445;
        Wed,  1 May 2019 09:33:17 +0100 (BST)
Date:   Wed, 1 May 2019 09:33:17 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] clk: Ensure new parent is looked up when changing
 parents
Message-ID: <20190501083317.GF81578@ediswmail.ad.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
 <155664268919.168659.14590969678316998228@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <155664268919.168659.14590969678316998228@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905010056
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Apr 30, 2019 at 09:44:49AM -0700, Stephen Boyd wrote:
> Quoting Charles Keepax (2019-04-30 07:44:11)
> > clk_core_fill_parent_index is called from clk_mux_determine_rate_flags
> > and for the initial parent of the clock but seems to not get called on
> > the path changing a clocks parent. This can cause a clock parent change
> > to fail, fix this by adding a call in clk_fetch_parent_index.
> > 
> > Fixes: fc0c209c147f ("clk: Allow parents to be specified without string names")
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  drivers/clk/clk.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index ffd33b63c37eb..5aa180180ee95 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1601,6 +1601,9 @@ static int clk_fetch_parent_index(struct clk_core *core,
> >                 return -EINVAL;
> >  
> >         for (i = 0; i < core->num_parents; i++) {
> > +               if (!core->parents[i].core)
> > +                       clk_core_fill_parent_index(core, i);
> > +
> 
> Hm... are you not specifying 'names' for the parent, so just clk_hw
> pointer? Maybe we need to compare clk_hw pointers with clk_hw pointers
> and then fill in the core pointer with what we have in hand. Pretty much
> at all costs we shouldn't call clk_core_fill_parent_index() here because
> drivers may fall into the trap of searching the entire clk tree for a
> pointer we already have.
> 

Apologies perhaps I am misunderstanding how this new system
works. In the event of the parent clocks being specified in
DT, whilst going round this loop would you expect the clock to
match on the core == parent check?  Or on the fallback unique
name check? My assumption was on the core == parent check, and
if that is the case how would you expect the parents[i].core
field to have been populated?

Thanks,
Charles
