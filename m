Return-Path: <SRS0=Sfi7=UJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543A1C31E43
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jun 2019 17:17:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 27EB1207E0
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jun 2019 17:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o5/B+j0m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfFJRRY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jun 2019 13:17:24 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52176 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfFJRRY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jun 2019 13:17:24 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5AH9LVu063324;
        Mon, 10 Jun 2019 17:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=9FkmUjvyN8H/QH8XIc5IIkwUov+U2wYpeDNQ6ZQm7Iw=;
 b=o5/B+j0mMS1GI8a9zyhd+Ew+CzaKEU+uo65gCuv+P7MYBwqtr4077C4T9TDpZsrTPGaG
 2hPllZdfLnk7X9kEP7PBolZizmOJDzNFEdGbhHPx2bZMee1qe2vgUzxU8JMDW5N2t8zY
 n1G6TJF95I+Mzeh+W/rN51jyTuz38NdirQcZ27xvid634A/MgiuViEOrc+oimCs3BQUS
 vY2/xiZETMX1GfecJYLXgWkBGPrmRC8xImOcjQ0+afcweRDezusuATG2X3OJV1a62HLg
 F+QZouIn0CZx1nZFCS2BegUsbaNCXd2+8wTDBWiiFBJOjI+4NCw0X78ecCXiMokSBV+9 qA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 2t02hegcq4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 Jun 2019 17:17:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5AHHFoU123791;
        Mon, 10 Jun 2019 17:17:15 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2t024txpmj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 Jun 2019 17:17:14 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5AHHC8E000308;
        Mon, 10 Jun 2019 17:17:12 GMT
Received: from [10.209.242.19] (/10.209.242.19)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 10 Jun 2019 10:17:11 -0700
Subject: Re: [GIT PULL] clk: keystone: changes for 5.3
To:     Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <3bd8aa21-60a5-f36a-b86f-425ce4f0163e@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <fe1da566-d8f4-8f53-cad7-d3b2a6e2c638@oracle.com>
Date:   Mon, 10 Jun 2019 10:17:11 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3bd8aa21-60a5-f36a-b86f-425ce4f0163e@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906100117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906100117
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/10/19 5:13 AM, Tero Kristo wrote:
> Hi Stephen, Mike, Santosh,
> 
> Here's a pull request for the clock changes for keystone SoC for 5.3. 
> The patches were acked by Santosh, so I took liberty to create a 
> pull-request for these also. I snipped patch #5 out of the series (it is 
> against drivers/firmware) and am planning to send a separate 
> pull-request for this, or alternatively agree with Santosh how to handle 
> it.
> 
[...]
> 
> The following changes since commit 
> a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>    Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
> tags/keystone-clk-for-5.3
> 
Am assuming Mike/Stephen will pick this up.

Regards,
Santosh
