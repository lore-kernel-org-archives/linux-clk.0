Return-Path: <SRS0=APof=QO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAEBC282C2
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 10:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A526C21872
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 10:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbfBGKvN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Feb 2019 05:51:13 -0500
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:56674 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfBGKvM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Feb 2019 05:51:12 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x17AhGRa014680;
        Thu, 7 Feb 2019 04:51:05 -0600
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2qfp68t4wm-1;
        Thu, 07 Feb 2019 04:51:05 -0600
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 2FF35611C8A7;
        Thu,  7 Feb 2019 04:51:05 -0600 (CST)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Thu, 7 Feb 2019
 10:51:04 +0000
Received: from imbe.wolfsonmicro.main (imbe.wolfsonmicro.main [198.61.95.81])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x17Ap4AW024283; Thu,
 7 Feb 2019 10:51:04 GMT
Date:   Thu, 7 Feb 2019 10:51:04 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <lee.jones@linaro.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linus.walleij@linaro.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 6/6] pinctrl: lochnagar: Add support for the Cirrus
 Logic Lochnagar
Message-ID: <20190207105104.GB6336@imbe.wolfsonmicro.main>
References: <20190130114128.21083-1-ckeepax@opensource.cirrus.com>
 <20190130114128.21083-6-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190130114128.21083-6-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902070085
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 30, 2019 at 11:41:28AM +0000, Charles Keepax wrote:
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform. This driver supports the board
> controller chip on the Lochnagar board.
> 
> Lochnagar provides many pins which can generally be used for an
> audio function such as an AIF or a PDM interface, but also as
> GPIOs.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> 
> No changes since v6.
> 
> Thanks,
> Charles
> 
>  drivers/pinctrl/cirrus/Kconfig             |   10 +
>  drivers/pinctrl/cirrus/Makefile            |    2 +
>  drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 1236 ++++++++++++++++++++++++++++
>  3 files changed, 1248 insertions(+)
>  create mode 100644 drivers/pinctrl/cirrus/pinctrl-lochnagar.c
> 
> +LN2_PIN_MUX(FPGA_GPIO1,    "fgpa-gpio1");
> +LN2_PIN_MUX(FPGA_GPIO2,    "fgpa-gpio2");
> +LN2_PIN_MUX(FPGA_GPIO3,    "fgpa-gpio3");
> +LN2_PIN_MUX(FPGA_GPIO4,    "fgpa-gpio4");
> +LN2_PIN_MUX(FPGA_GPIO5,    "fgpa-gpio5");
> +LN2_PIN_MUX(FPGA_GPIO6,    "fgpa-gpio6");

Apologies for this late spot but there is typo here, these should
of course read fpga not fgpa. I will resend, going to start
sending the sub drivers separately now, since Lee has merged the
MFD cut down on the email traffic for everyone a little.

Thanks,
Charles
