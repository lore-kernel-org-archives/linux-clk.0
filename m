Return-Path: <SRS0=APof=QO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7282AC282C2
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 10:45:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4002921872
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 10:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfBGKpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:45:46 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:36506 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726732AbfBGKpp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Feb 2019 05:45:45 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x17Ahu2L013612;
        Thu, 7 Feb 2019 04:45:39 -0600
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0a-001ae601.pphosted.com with ESMTP id 2qfp5paa7a-1;
        Thu, 07 Feb 2019 04:45:39 -0600
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id C9EA5611C8B6;
        Thu,  7 Feb 2019 04:45:38 -0600 (CST)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Thu, 7 Feb 2019
 10:45:38 +0000
Received: from imbe.wolfsonmicro.main (imbe.wolfsonmicro.main [198.61.95.81])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x17AjaCt023017; Thu,
 7 Feb 2019 10:45:36 GMT
Date:   Thu, 7 Feb 2019 10:45:36 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <linus.walleij@linaro.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 4/6] mfd: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Message-ID: <20190207104536.GA6336@imbe.wolfsonmicro.main>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
 <20190130114128.21083-4-ckeepax@opensource.cirrus.com>
 <20190207075011.GC4672@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190207075011.GC4672@dell>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=933 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902070085
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 07, 2019 at 07:50:11AM +0000, Lee Jones wrote:
> On Wed, 30 Jan 2019, Charles Keepax wrote:
> >  MAINTAINERS                         |  17 ++
> >  drivers/mfd/Kconfig                 |   8 +
> >  drivers/mfd/Makefile                |   2 +
> >  drivers/mfd/lochnagar-i2c.c         | 398 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/lochnagar.h       |  55 +++++
> >  include/linux/mfd/lochnagar1_regs.h | 157 ++++++++++++++
> >  include/linux/mfd/lochnagar2_regs.h | 291 ++++++++++++++++++++++++++
> >  7 files changed, 928 insertions(+)
> >  create mode 100644 drivers/mfd/lochnagar-i2c.c
> >  create mode 100644 include/linux/mfd/lochnagar.h
> >  create mode 100644 include/linux/mfd/lochnagar1_regs.h
> >  create mode 100644 include/linux/mfd/lochnagar2_regs.h
> 
> Looks quite suitable now.  Thanks for sticking with it.
> 

No problem, we got there.

> Applied, thanks.
> 

Thanks,
Charles
