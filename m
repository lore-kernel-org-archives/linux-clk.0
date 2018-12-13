Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A702C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:46:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F1A3220880
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="pan41BJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A3220880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbeLMMqQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 07:46:16 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:11837 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbeLMMqQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 07:46:16 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1254940000>; Thu, 13 Dec 2018 04:46:12 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 04:46:15 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 04:46:15 -0800
Received: from [10.26.11.125] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 12:46:13 +0000
Subject: Re: [PATCH V2 09/21] clk: tegra: dfll: add protection for
 find_vdd_map APIs
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-10-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <a56194ce-ce96-8b3a-99e8-b4348db39f42@nvidia.com>
Date:   Thu, 13 Dec 2018 12:46:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-10-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544705172; bh=istd5PyqoqSD9GFMlhdGxaATejw3fr6zPuMcfyTuq3w=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=pan41BJrn7tPR5gaT9tGKTrCOFU7ZFkuTEBVMrL3x2sbpVkAKWP/yj0+np5r9FAGa
         GR2yDlwLoJGUIDrQId5jQLG6A5dDgJ+WdNKDBkwb/r1BJ/lsCPj7LM5PQZ0oEMgOQT
         iTklFugnbIDhC2Q5wqr8J5cQke7FIwGZyrX/uEbNaxvOuZfUvhv4oE40OJgZP15by7
         0iCMq2zOsAQNnI7lNPsibbyeJ1pCNSLqGW1LQj2/w4jd+rG1aZPp6/alQgRqrs+vcK
         nKR7g/6gOJ0eQNLkcGsZ7kjOiFukTdmQBpVBC6Ro2M+rQ98GZLAbVA5BeiI4rwETNm
         vgaPMKKmE6GVA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> The DFLL hardware supports both I2C and PWM based regulator. SW driver
> only touches I2C regulator when generating LUT. And shouldn't touch it
> anymore once the DFLL is enabled.

I am not sure that the last two sentences are above are relevant and
confused me a little at first. I would be tempted to drop them.

> This patch adds the protection for the APIs that only work with I2C mode
> to avoid they could be called accidentally.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>

Furthermore, I would be tempted to squash this into patch #7. I am not
sure another patch is warranted here.

Cheers
Jon

-- 
nvpublic
