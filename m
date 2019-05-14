Return-Path: <SRS0=Uhbp=TO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26159C04AB4
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 08:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA953208C3
	for <linux-clk@archiver.kernel.org>; Tue, 14 May 2019 08:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="e+dJOnSH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbfENIsE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 May 2019 04:48:04 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:5676 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfENIsD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 May 2019 04:48:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cda80c80001>; Tue, 14 May 2019 01:48:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 14 May 2019 01:48:02 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 14 May 2019 01:48:02 -0700
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 May
 2019 08:47:59 +0000
Subject: Re: [PATCH V3 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-6-josephl@nvidia.com>
 <dc580a9b-4d37-ae20-888d-3956b284c43b@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <54203d4d-aced-543e-6ebb-6ffacb7c8a85@nvidia.com>
Date:   Tue, 14 May 2019 16:47:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dc580a9b-4d37-ae20-888d-3956b284c43b@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557823689; bh=2pDfR96ft+DkHmObeX7LimIgSYODRuPau+zOD02fwpc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=e+dJOnSHOc5lSyMjLif3L9flzVZF7VkRCma6Vq9NP8sL9qeXsttDnqKBDpVH9zep+
         sg4j2QjNmORbgyyXYK1mOyjAIskuDCuTtKDxj0mONmo3j7r/Vi9Dso1/zgo56pl3Eb
         xO5p3msARxfr30PhrJZYbhDrnhYo36eJKi3xrk4B0WJrrWcT2jH1pwZa2QXzkOcDer
         y1dk9K/jgQMHcQpx8WNo9Bsyx3iT/0D/BA/zlEI3MUhZQQIjj+EoTb8Iq5KSoDwVg7
         /Ewv5T687dhkWU48rVnJtNbZmP0pOSsp/eoY9wudqW/xdLreBOdNGXdFfRZnoFE3ai
         aIW0xf+EP8T2Q==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/14/19 1:02 AM, Dmitry Osipenko wrote:
> 10.05.2019 11:47, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> This patch adds the required APIs and variables for the EMC scaling
>> sequence code on Tegra210.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
snip.
>> +void do_clock_change(struct tegra_emc *emc, u32 clksrc)
>> +{
>> +	int err;
>> +
>> +	mc_readl(emc->mc, MC_EMEM_ADR_CFG);
>> +	emc_readl(emc, EMC_INTSTATUS);
>> +
>> +	tegra210_clk_emc_update_setting(clksrc);
>> +
>> +	err =3D wait_for_update(emc, EMC_INTSTATUS,
>> +			      EMC_INTSTATUS_CLKCHANGE_COMPLETE, true, REG_EMC);
>> +	if (err) {
>> +		pr_err("%s: clock change completion error: %d", __func__, err);
>> +		WARN_ON(1);
>> +	}
>> +}
>> +
>> +struct emc_table *get_timing_from_freq(struct tegra_emc *emc,
>> +				       unsigned long rate)
>> +{
>> +	int i;
>> +
>> +	for (i =3D 0; i < emc->emc_table_size; i++)
>> +		if (emc->emc_table[i].rate =3D=3D rate)
>> +			return &emc->emc_table[i];
>> +
>> +	return NULL;
>> +}
>> +
>> +int wait_for_update(struct tegra_emc *emc, u32 status_reg, u32 bit_mask=
,
>> +		    bool updated_state, int chan)
>> +{
>=20
> This and all other global functions have very generic names. Either
> squash it all into a single source file and make all functions static,
> or change the names to something more unique.
>=20

Okay, will fix it.

Thanks,
Joseph
