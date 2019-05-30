Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCC8C28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 02:07:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3607F2441D
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 02:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="KTAd8UyR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfE3CHL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 22:07:11 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:6547 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfE3CHL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 22:07:11 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cef3ac40000>; Wed, 29 May 2019 19:07:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 May 2019 19:07:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 May 2019 19:07:09 -0700
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 May
 2019 02:07:06 +0000
Subject: Re: [PATCH V4 7/8] clk: tegra: Remove the old emc_mux clock for
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
 <20190529082139.5581-8-josephl@nvidia.com>
 <6651442d-d501-9363-ff95-988e1a4a3982@gmail.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <75aa10d9-ac01-3581-49f8-020c742ea251@nvidia.com>
Date:   Thu, 30 May 2019 10:06:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6651442d-d501-9363-ff95-988e1a4a3982@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1559182020; bh=UWdWtW4j+KOak+WZ2j6xAhxesQy6AFdueC5SP3hK5EE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=KTAd8UyRioFQjhThEeu/VBvoQCLVHUIs+2Cd/VvGtn9gv+t0ZnTaME4auzC1NiY+y
         0unlBnBvoghWUh4+c0ciYIFFEgiFr/c9FOasaN59s9Ddz3JEW2EjrA+zQcRmikDfpT
         IKFCP8mCELck0vWq9YARfmEsgJcI7HIIGjV88zOz3qhXu/04pVnDlRJgCWm4KUQNPo
         SwISy6NZbe7GvFdfRM8iyHwcxhh1os4kV76pcRVusUVgBPtLoc4oslLNgiTGMlLdzu
         CGc9pGbvt5VA1BIz7wNd9tj1+tppbJGqaVFJPL853VgB+7Xf8+U3MFF2nw3ja8Wvus
         /N2P1b6PIAAqg==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5/29/19 8:49 PM, Dmitry Osipenko wrote:
> 29.05.2019 11:21, Joseph Lo =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Remove the old emc_mux clock and don't use the common EMC clock
>> definition. This will be replaced by a new clock defined in the
>> EMC driver.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> v4:
>> - make sure the behavior is compatible with case if the kernel still
>>    uses the older DTB which doesn't have EMC node. And the MC and EMC
>>    clock can still be registered successuflly.
>> v3:
>> - split to 3 patches from the previous version
>> ---
>>   drivers/clk/tegra/clk-tegra210.c | 42 ++++++++++++++++++++------------
>>   1 file changed, 27 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-te=
gra210.c
>> index 1d52354820ca..8b209e8b5eaf 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -28,6 +28,7 @@
>>   #include <dt-bindings/reset/tegra210-car.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/sizes.h>
>> +#include <soc/tegra/emc.h>
>>   #include <soc/tegra/pmc.h>
>>  =20
>>   #include "clk.h"
>> @@ -324,12 +325,6 @@ static unsigned long tegra210_input_freq[] =3D {
>>   	[8] =3D 12000000,
>>   };
>>  =20
>> -static const char *mux_pllmcp_clkm[] =3D {
>> -	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
>> -	"pll_p",
>> -};
>> -#define mux_pllmcp_clkm_idx NULL
>> -
>>   #define PLL_ENABLE			(1 << 30)
>>  =20
>>   #define PLLCX_MISC1_IDDQ		(1 << 27)
>> @@ -2346,7 +2341,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_ma=
x] __initdata =3D {
>>   	[tegra_clk_i2c2] =3D { .dt_id =3D TEGRA210_CLK_I2C2, .present =3D tru=
e },
>>   	[tegra_clk_uartc_8] =3D { .dt_id =3D TEGRA210_CLK_UARTC, .present =3D=
 true },
>>   	[tegra_clk_mipi_cal] =3D { .dt_id =3D TEGRA210_CLK_MIPI_CAL, .present=
 =3D true },
>> -	[tegra_clk_emc] =3D { .dt_id =3D TEGRA210_CLK_EMC, .present =3D true }=
,
>>   	[tegra_clk_usb2] =3D { .dt_id =3D TEGRA210_CLK_USB2, .present =3D tru=
e },
>>   	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA210_CLK_BSEV, .present =3D tru=
e },
>>   	[tegra_clk_uartd_8] =3D { .dt_id =3D TEGRA210_CLK_UARTD, .present =3D=
 true },
>> @@ -2957,6 +2951,27 @@ static int tegra210_init_pllu(void)
>>   	return 0;
>>   }
>>  =20
>> +static const struct clk_div_table mc_div_table_tegra210[] =3D {
>> +	{ .val =3D 0, .div =3D 2 },
>> +	{ .val =3D 1, .div =3D 4 },
>> +	{ .val =3D 2, .div =3D 1 },
>> +	{ .val =3D 3, .div =3D 2 },
>> +	{ .val =3D 0, .div =3D 0 },
>> +};
>> +
>> +static void tegra210_clk_register_mc(const char *name,
>> +				     const char *parent_name)
>> +{
>> +	struct clk *clk;
>> +
>> +	clk =3D clk_register_divider_table(NULL, name, parent_name,
>> +					 CLK_IS_CRITICAL,
>> +					 clk_base + CLK_SOURCE_EMC,
>> +					 15, 2, CLK_DIVIDER_READ_ONLY,
>> +					 mc_div_table_tegra210, &emc_lock);
>=20
> This doesn't look right, you're mixing up the MC divider with the EMC
> divider here. The MC clock is always sourced from EMC and there is only
> one bit for the MC divider, the bit 16 MC_EMC_SAME_FREQ.
>=20
> When EMC clock is divided down by 2 (bit 15 EMC_CLK_DIV2_EN), then the
> clk-framework will take care of it by calculating the MC rate based on
> the actual parent EMC rate.
>=20
>> +	clks[TEGRA210_CLK_MC] =3D clk;
>> +}
>> +
>>   static const char * const sor1_out_parents[] =3D {
>>   	/*
>>   	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, s=
o
>> @@ -3040,15 +3055,12 @@ static __init void tegra210_periph_clk_init(void=
 __iomem *clk_base,
>>   			CLK_SOURCE_LA, 0);
>>   	clks[TEGRA210_CLK_LA] =3D clk;
>>  =20
>> -	/* emc mux */
>> -	clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
>> -			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
>> -			       clk_base + CLK_SOURCE_EMC,
>> -			       29, 3, 0, &emc_lock);
>> +	/* emc */
>> +	clk =3D tegra210_clk_register_emc();
>> +	clks[TEGRA210_CLK_EMC] =3D clk;
>>  =20
>> -	clk =3D tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_E=
MC,
>> -				    &emc_lock);
>> -	clks[TEGRA210_CLK_MC] =3D clk;
>> +	/* mc */
>> +	tegra210_clk_register_mc("mc", "emc");
>>  =20
>>   	/* cml0 */
>>   	clk =3D clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_A=
UX,
>>
>=20
> You should leave the common tegra_clk_register_mc() usage as-is and only
> s/emc_mux/emc/ in the argument.

Ah, yes, that was wrong mixing up with two irrelevant bits. Fixed in my=20
local patch.

Thanks,
Joseph
