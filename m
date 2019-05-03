Return-Path: <SRS0=gieW=TD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C03CC43219
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 16:33:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 577DD20651
	for <linux-clk@archiver.kernel.org>; Fri,  3 May 2019 16:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbfECQd0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 May 2019 12:33:26 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:50618 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726585AbfECQd0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 May 2019 12:33:26 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x43GUGhD021709;
        Fri, 3 May 2019 11:33:23 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2s6xhyvp23-1;
        Fri, 03 May 2019 11:33:23 -0500
Received: from EDIEX02.ad.cirrus.com (unknown [198.61.84.81])
        by mail1.cirrus.com (Postfix) with ESMTP id CB2CA611C8C5;
        Fri,  3 May 2019 11:33:22 -0500 (CDT)
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Fri, 3 May
 2019 17:33:22 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via Frontend
 Transport; Fri, 3 May 2019 17:33:22 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2CE622A1;
        Fri,  3 May 2019 17:33:22 +0100 (BST)
Date:   Fri, 3 May 2019 17:33:22 +0100
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] clk: Ensure new parent is looked up when changing
 parents
Message-ID: <20190503163322.GH81578@ediswmail.ad.cirrus.com>
References: <20190430144412.20950-1-ckeepax@opensource.cirrus.com>
 <155664268919.168659.14590969678316998228@swboyd.mtv.corp.google.com>
 <20190501083317.GF81578@ediswmail.ad.cirrus.com>
 <155674078882.168659.17440291177352926788@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <155674078882.168659.17440291177352926788@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905030105
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 01, 2019 at 12:59:48PM -0700, Stephen Boyd wrote:
> Quoting Charles Keepax (2019-05-01 01:33:17)
> > On Tue, Apr 30, 2019 at 09:44:49AM -0700, Stephen Boyd wrote:
> > > Quoting Charles Keepax (2019-04-30 07:44:11)

Thank you for the explanation think I am starting to get there.

> I don't expect parents[i].core to be populated until we do the fallback
> string match in this function when the globally unique names match or if
> it's already populated by some other path calling
> clk_core_fill_parent_index(). The problem is we just fixed a long
> standing regression in this function with commit ede77858473a ("clk:
> Remove global clk traversal on fetch parent index"). Calling
> clk_core_fill_parent_index() will bring that performance problem back,
> so we need to figure out how to find the index for a clk without doing
> the global search.
> 

There is a slight error in the commit message there I think, the
change doesn't affect clk_mux_determine_rate_flags which still
calls clk_core_get_parent_by_index so will still do the full
lookup. It looks like it affects clk_calc_new_rates instead.

Which I guess does raise the question would an optimisation on
the determine_rate path help these power issues as well?

> It seems that some clk providers specify parents that may never exist,
> so we'll possibly spend time looping through the parents each time doing
> a global string comparison on hundreds of clks. It would be best to
> avoid that, so we shouldn't really do any sort of caching here except
> for the one clk_core pointer we already have passed in.
> 
> So you're saying this happens in the clk_set_parent() path, where the
> parent passed into this function has never been cached before?

Yeah that seems to be what is happening in my case. As best I
can figure out so far, this relates to our clocks not having
any rate setting capabilities, as it looks like most of the
cache population comes from those paths.

> +
> +		/* Maybe it hasn't been cached (clk_set_parent() path) */
> +		if (parent == clk_core_get(core, i))
> +			return i;

This part does fix my issue. Is there a reason not to update
core->parents[i].core on this path?

Thanks,
Charles
