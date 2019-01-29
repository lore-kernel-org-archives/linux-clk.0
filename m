Return-Path: <SRS0=lEqg=QF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA22C169C4
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 16:58:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3B7202087F
	for <linux-clk@archiver.kernel.org>; Tue, 29 Jan 2019 16:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfA2Q6m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Jan 2019 11:58:42 -0500
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:41086 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727196AbfA2Q6m (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Jan 2019 11:58:42 -0500
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x0TGvWKl028622;
        Tue, 29 Jan 2019 10:58:34 -0600
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0a-001ae601.pphosted.com with ESMTP id 2q8nu7v24v-1;
        Tue, 29 Jan 2019 10:58:34 -0600
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail4.cirrus.com (Postfix) with ESMTP id AB68F611C8B7;
        Tue, 29 Jan 2019 10:58:50 -0600 (CST)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Tue, 29 Jan 2019
 16:58:33 +0000
Received: from imbe.wolfsonmicro.main (imbe.wolfsonmicro.main [198.61.95.81])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x0TGwW8P013718; Tue,
 29 Jan 2019 16:58:32 GMT
Date:   Tue, 29 Jan 2019 16:58:32 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <lee.jones@linaro.org>, <sboyd@kernel.org>,
        <mturquette@baylibre.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linus.walleij@linaro.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 1/6] mfd: lochnagar: Add initial binding documentation
Message-ID: <20190129165832.GK3837@imbe.wolfsonmicro.main>
References: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190117145858.26659-1-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=959 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1901290126
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 17, 2019 at 02:58:53PM +0000, Charles Keepax wrote:
> +Example:
> +
> +lochnagar: lochnagar@22 {
> +	compatible = "cirrus,lochnagar2";
> +	reg = <0x22>;
> +
> +	reset-gpios = <&gpio0 55 0>;
> +	present-gpios = <&gpio0 60 0>;
> +
> +	lochnagar-clk {
> +		compatible = "cirrus,lochnagar2-clk";
> +		...
> +	};
> +
> +	lochnagar-pinctrl {
> +		compatible = "cirrus,lochnagar-pinctrl";
> +		...
> +	};
> +
> +	lochnagar-regulator {
> +		compatible = "cirrus,lochnagar-regulator";
> +		...

Sorry just realised this entry in the example is a hang over from
earlier versions of the regulator code and needs to go apologies I
will respin the series.

Thanks,
Charles
