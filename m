Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1223C04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 07:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C19FB20881
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 07:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Djwtup3M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfEOHZy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 03:25:54 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:2875 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfEOHZy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 03:25:54 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cdbbed80000>; Wed, 15 May 2019 00:25:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 15 May 2019 00:25:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 15 May 2019 00:25:53 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 May
 2019 07:25:50 +0000
Subject: Re: [PATCH V3 3/8] clk: tegra: Export functions for EMC clock scaling
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-4-josephl@nvidia.com>
 <502f213b-2101-9d56-54c9-8be48f1be5b8@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <ec33f656-707c-df2c-dc53-206c9a533cb9@nvidia.com>
Date:   Wed, 15 May 2019 15:25:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <502f213b-2101-9d56-54c9-8be48f1be5b8@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557905112; bh=jrnWqN2/5mZMwT6yqfzkk1cAC05bsa3N0rVhz8ivnBw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Djwtup3MPZ9WaM+OX9pCCkzVZ1n+AniGRTXwqfU98gs0OEie4LDloDV9kn5ljcAW+
         UTE5flHwi2RWdIkxBCnEkjP7AabAezQIqLIQgV7EKnKwkpxLkZmGUVWYNByIjgmOAh
         0SAnyo05p2xI/0EY9wWlN6Xro2503AVuilkIX2BgB+wN69BQsR9103gV4vsAd0UOqN
         RLPbKQUqsT/HpzbVE5KknEB3NEYdWQheWRjC2bMf68fAMsdf23Ez+cRsB6G1nwPw4c
         DkMUKR2xesbgigUmPI+HckS90msI6s8jREn4tDApO3XobOzYgqAZiUxoK9Nkggr/3i
         6Tqup70/Mx91Q==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/15/19 12:29 AM, Dmitry Osipenko wrote:
> 10.05.2019 11:47, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Export functions to allow accessing the CAR register required by EMC
>> clock scaling. These functions will be used to access the CAR register
>> as part of the scaling sequence.
>=20
>> DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dnvidia.c=
om; s=3Dn1;
>> 	t=1557478018; bh=3Demd3R6nSFwL5B+aWA2W+bJqcZ1Jhvwnayz1wGOPSA4M=3D;
>> 	h=3DX-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
>> 	 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
>> 	 Content-Transfer-Encoding:Content-Type;
>> 	b=3DfW7ddx6p6BuGNLGA6jAL5AxsojqeQcOg9fZBqbA1Ze45XU3gt7tiL88s8g7gTftA+
>> 	 NdruKRXPLS0r4iOgKqEUf3bmoBP0Kf+l0PQcJu55U5v55XnP6cuKrQw2cmbDaw/g2Z
>> 	 a6DZrAIbUZzi3P3b764ZDmUlRD1sHAWWswZwG3kHwBP0TDOXNjAEVcp7NPm868VOvv
>> 	 aJrdb6VblknwjNkE6OV7ktGB1ODge5YSAePDLNAplZBw+BFnogtESwvf0cFcYVbxCG
>> 	 COh/UNKdlJuOM95IgbZiom9I8NiwuS07bA2WzudSgnMKbhNI6VlFgDu5A6JaPt3Irv
>> 	 N4nuUT4+Ln3Fg=3D
>>
>=20
> What's that?
>=20
Sorry, I don't know how does that come from. I didn't see that in my=20
mail client when receiving this patch.

I did notice this patch was missing in the Tegra Patchwork, but it's=20
okay in the Linux ARM Kernel patchwork.
http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D107142
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D116097

So I guess maybe something wrong when the server handling this patch.
