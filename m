Return-Path: <SRS0=hifp=UD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E579FC282CE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jun 2019 17:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD1662075B
	for <linux-clk@archiver.kernel.org>; Tue,  4 Jun 2019 17:55:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RH7wVy0/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfFDRzi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Jun 2019 13:55:38 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37320 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbfFDRzi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Jun 2019 13:55:38 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x54HsRK4062059;
        Tue, 4 Jun 2019 17:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=I2dCC54Yvnmy1Mikvg0ahxX3ZEk6+/nZ2fqx0icOOQ0=;
 b=RH7wVy0/Q8iRivqVWoWXZo44U48c3aBuTrgtDaWw35kXJAI4ahmqgNESKYru2xypWrQ0
 Fjlwj+tqc/jLZxGqV1pXYo/68jahHkofDvHF++vADB62YYOIB0cagumEhtu4apRyvhYf
 HWsw/SWNnYAdjNs4FEne/5q7D6bA3auHdjOqLw6DxIQvZcEGsqdKblnvE89+bc2ezMOS
 nIP8f+QOBhZWHftfzc1aptfa7QFPP4sMuc0thdnWczsztHYvHPEGdoZycAR9cuXcYLEf
 WY3PLqZrArs2dJMCgFSU2/ZNnVAVT8FzH2SvOX6eGss2iwW016hDr1PP5xwS1Ag7B9fX iw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2sugstekq6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Jun 2019 17:55:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x54HsS6e056383;
        Tue, 4 Jun 2019 17:55:13 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2swnh9r200-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Jun 2019 17:55:13 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x54Ht7a6018917;
        Tue, 4 Jun 2019 17:55:08 GMT
Received: from [10.11.0.40] (/10.11.0.40)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 04 Jun 2019 10:55:07 -0700
Subject: Re: [PATCHv2 0/5] clk: keystone: clock optimizations / fixes
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, ssantosh@kernel.org,
        nm@ti.com
Cc:     linux-arm-kernel@lists.infradead.org
References: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <7d97db9a-71fd-0c44-a4ef-ef4d726cdb20@oracle.com>
Date:   Tue, 4 Jun 2019 10:55:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
 Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1559049024-30872-1-git-send-email-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906040113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9278 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906040114
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/28/19 6:10 AM, Tero Kristo wrote:
> Hi,
> 
> This is a re-base / re-spin of the Keystone clock optimization series [1].
> 
> Changes from v1:
> - rebased on top of 5.2-rc1
> - added support for clk-ids 255+
> - changed patch #3 to parse also 'assigned-clocks' in addition to 'clocks'
>    DT nodes only. This allows automatic (DT based) programming of clocks
>    that are not directly touched by any driver.
> 
> Please note that there is hard dependency between patches 4 & 5, patch #5
> must be applied after patch #4, otherwise bad things will happen (basically
> boot breaks.) The cast magic in patch #4 is done also so that this order
> of patches can be used and bisectability is retained.
> 
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
