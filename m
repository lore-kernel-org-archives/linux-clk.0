Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907B7C28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 02:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6530F24430
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 02:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="JOLYJx6H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfE3Cp4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 22:45:56 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9862 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbfE3Cp4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 22:45:56 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cef43e20000>; Wed, 29 May 2019 19:45:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 19:45:55 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 May 2019 19:45:55 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 May
 2019 02:45:52 +0000
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-6-josephl@nvidia.com>
 <5bd95d0b-e1a5-e717-4d5a-b9ef5d5fa4a5@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <f59d78aa-aa70-574f-a8b6-1364861f8319@nvidia.com>
Date:   Thu, 30 May 2019 10:45:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5bd95d0b-e1a5-e717-4d5a-b9ef5d5fa4a5@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559184354; bh=hNctZqd1otSqNs4iEYk392pZ2UDSFDTLmtvDt7XF5Xk=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=JOLYJx6HdqU5nCvkSdqZg8FqBov9nv6dJeAGfZ8VUDRUhBDKKzq0vaSs1smiafYmY
         qexLAIESRrzTn4N4SgJNi1Q47FO6/zHgtgpjIagCiPJjSB3Hek71XxSLpUfkYV9SQw
         DHHpDZG9ZhHEQDKMmThegRM+zKN7NjzDRt+Vrg5YpiIRAp29lSFHcnEFbzMrs61OHn
         VSJGaJ8JsriaLzSIjF86/mht5p7Mt2m08gZCOvVanQDMSbm4smEis7zTOzYkMfsvIS
         Kc4Ddo4Q2aYMKCKJpZdRmoe3JT5ne7AjiBPnC70GF737cA0q0/PVX4jIqDzikwVOok
         GEO1bQPd886cA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/29/19 9:37 PM, Dmitry Osipenko wrote:
> 29.05.2019 11:21, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds the required APIs and variables for the EMC scaling
>> sequence code on Tegra210.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> v4:
>> - fix the API with generic naming
>> - use 'u16' in 'struct emc_table_register_offset'
>> ---
>=20
> [snip]
>=20
>> +void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset)
>> +{
>> +	writel_relaxed(val, emc->emc_base[REG_EMC] + offset);
>> +}
>> +
>>   u32 emc_readl(struct tegra_emc *emc, unsigned long offset)
>>   {
>>   	return readl_relaxed(emc->emc_base[REG_EMC] + offset);
>>   }
>>  =20
>> +u32 emc1_readl(struct tegra_emc *emc, unsigned long offset)
>> +{
>> +	return readl_relaxed(emc->emc_base[REG_EMC1] + offset);
>> +}
>=20
> Please make all the global one-line functions static and inlined, then
> move them out into the header. This will allow compiler to optimize code
> better and also will hide these generic-looking global symbol names from
> unrelated parties in the multiplatform kernel build.

Okay, will do.

Thanks,
Joseph

