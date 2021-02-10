Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34230C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 04:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F181364E4B
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 04:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhBJEdn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 23:33:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18115 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbhBJEdn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Feb 2021 23:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1612931622; x=1644467622;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=E0uOfDYVuzT3f+moYb0UNEx8D3NVbPLV/VBqIcE0M2c=;
  b=cm18rHy4elEzONO44oiXg8tME+gdz1pyAi1ckUJvQ0mU+e3C+rDKKZ5j
   h0nzNKqh+azZpmRCVFld4rDwmpU1rQEoeqHCbad5b8At6Time18o3QwnL
   Vlmbc9/RoElCp2x+8g3BQwI41mJ5HNKrdn/Ahm3V4rmvjS8x7QwmmDAOu
   JY/poU3DxvB2b0BEBqvf9MpusDlMXSCfRW4HiBTKVJK/J+7Ze59v6AJay
   +OShxMq6U8JOBhTWVmaVDSKBxnvxDYPiaXAvoqrZZk7jKwxdUGjTjb8SE
   5oHClPQeVGisFDqLCPS8rAzCAkG6XGvopu1eQ5EYazvWbDY5id3QiAJjG
   w==;
IronPort-SDR: ADbjB0qvsnX/LAMfnXPabmLjAonWk9QagJX6rtedcB9TUJtt70/MZdLJQE3cq7eK7TYqC+QhQY
 i56UX6q9MCDCqDw86lxONwSAp06DentruC919GKZxDBuXZVp2bLsp8AwJsFQqmTLs8f7Di86rX
 x53TJ5TuFL8UFepH0YU0/LQ+kqhdUu5LvY6XbW8uwfdxEdyq7CJEWEuMbUgZBcgsJusfmQMkaU
 8m4vvG4kdxgVX69oFuP6f3IUSSjuM6ElxTC0BUMlGrYYhYFmglv64ax1982N4JTk4yPyDCEhq2
 lsM=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; 
   d="scan'208";a="159590741"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 12:32:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSkT24ILz8EYAcZF5SLc2HqC/mOZuXdLa182f107wdUGRebNyk5qZEVIgdJIJVcF9xY80HNMzfA1WoKTDChFYCO0a8CX3q3QcA68K7jxlmwM372XEyzLlaEM4O28Lm3xRqf9HyZNDAsNJDsavcTZOUltBV9jBy/6yxa8u3w7W7/h105yfBQOnOz4QabE6gWWWVm4WaBRMW50Mu17ov8e0qSWhiVNkl1E4azTe3yQpmsMZ5W9SOeUWsHUS8cTg7OXZdOdOyARhH78KXj30Mntr52cat67ilvjI1wOl42b3FCJ5QRrV7U4rNwC/oDYAYuMi0wJySjdEcvncMwzPMyq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcPWmhYXFv2QyN/e3nbUlRyKYDPSkRWiV7fLsChD110=;
 b=f5+xtGAI2UwAcBsjDNdjXKBSvaOcnF4lDFwxAIo3ZNB5WgMBqBbH+NMys5PDV5gBrfodwZvHmXyK1fqc36lHvMito1oUcmxRb6UDXkWM2YNYBywEYwbLy41tyhJAvDucWDSQLg+z5v6b/y+MuHqL4NiMlUEeksq4Mkl8hqTvGY4nZhBQUscGp7QnfTpJEm5X638BnqFQDx2KrvQzV4aSL4RiWK/6AFtoV3YmgMJzMVVOzO4rgaFiSpsOutLGvWzvoE5MpUgG6NKfpUtdE4VuwE9H5e/w4+1TQLj8f2jZ8g3rMxg28rKZQCAbx4FaxW5bTD/1z2KwrcUwFhB2K5T8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcPWmhYXFv2QyN/e3nbUlRyKYDPSkRWiV7fLsChD110=;
 b=ZjEFPb1c35s4FuphYmcOGAHCovdfySW0FnBJg3ZuZHSwY88mTd2bexxBx7scrbzCl8T+qxtdD0unBWp05Ofr+d6zrcQex+3ruDBSVjpWPDIrhDYwqsgdBlTW7JjJNUK8cQGV6UxtMUeHI4dRkcCI+XmIIHZ44WPDupjZCDoY4SM=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by BL0PR04MB6482.namprd04.prod.outlook.com (2603:10b6:208:1cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 10 Feb
 2021 04:32:35 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 04:32:35 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
        Sean Anderson <seanga2@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Topic: [PATCH v18 01/16] clk: Add RISC-V Canaan Kendryte K210 clock
 driver
Thread-Index: AQHW/t9XApJD7mlFuEyRKf7oQMzIIQ==
Date:   Wed, 10 Feb 2021 04:32:34 +0000
Message-ID: <BL0PR04MB6514E16F46007EC1EEC5126EE78D9@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
 <20210209123014.165928-2-damien.lemoal@wdc.com>
 <161292028178.418021.10953574123293354986@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514E2ED802BAE7E6350E304E78D9@BL0PR04MB6514.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:4d23:6652:258b:81d8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 92baacb2-0307-4f3b-9d31-08d8cd7ce38a
x-ms-traffictypediagnostic: BL0PR04MB6482:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB6482C14313649D701F5CF845E78D9@BL0PR04MB6482.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rpqt943QaAzXDgzJKi+a1eyjYnI4THNjM0vab85kJA8t2vRS86o4/RwdWAFs5OtmrYxG8ChoFyR2Zy22H7Xlu5jJXA4x4VyAVzzzE9tC5J0tix2ZiBoIFLVE5aKr7ZGLsAjmgXqQL9uAbuO9rglv2/eGtOuufOSOlE6jPZJPmHlU+wkK51BLCOG5JlOnak/Fao1YphCEOS9wsrNhMDUnt42P8t/Xyz6NMhFFnaRycnhhUzZIR73hRMUqflOebKxK74Q49TJYp4R+rPLUqDtjZPN4NH5Rg6/H6l9EF5jHGVLkTREYEQM5ZcJHTUohlM+73QvnXdxwYPwVi3j/2kHVUn3jnF0hH1CfIr4C0XiUu/zO50yFOXh5/N1ampQEKKKwsXcFiGNIDXF9HTjpbAhHPzXbYh5QCoo5Ue29fGpARwTUZs9Lkutat9q9JSoYCV0zvI8JSYKrRRkzwApD45DPQOz+VklCNA4oyFHExf/dYOayQXg+CpxMbVFKEDQogGr8EmwhefRjN+c0IOFwq1w3Sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(366004)(2906002)(7696005)(478600001)(4326008)(86362001)(52536014)(53546011)(54906003)(33656002)(66556008)(66446008)(6506007)(71200400001)(66476007)(64756008)(91956017)(186003)(66946007)(110136005)(76116006)(8936002)(9686003)(8676002)(316002)(5660300002)(83380400001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nN8s8UHOL5AIcEd4I0/uhqDyo5jrb7Td46/SoRPT/GiM8K1h+699N/nr3NmV?=
 =?us-ascii?Q?5ZzNLQGOc9wLFl6FBFty+awHpC8jIyWUM1yrGBvzqd9SFkcAxxm974asofgB?=
 =?us-ascii?Q?tjSX0QUvdWU5HL+lHMHQ1vCY45d+Pf8pG+vKxxXbPGOGl4KNFWpONwqP1JoR?=
 =?us-ascii?Q?nsTz2YMtkhiRUV9lLEyUwT0lI0hi2CeGxWr3n9Bivf7KHbPw74nfhEZIv4Cb?=
 =?us-ascii?Q?AYBZoWEDsmaS8uEVxhLZi/nKLXAKKRJpfvH2NTqu5nrqWoqLJpiNA2McsfRD?=
 =?us-ascii?Q?fzzRY4Y50BmIM3irYJx8nRMMvoIr3eKIL+eHVeje0s0Cw22gyKPp3NyrGo+d?=
 =?us-ascii?Q?+Hc3GpTqfWF8WHrWeHH6xOMu6eEvi9zqL43Ogz4EwUXvCFYHl68jPySOgGUR?=
 =?us-ascii?Q?/cGIUOw2VZU/8+Tk7f28yYepIapwcWhczkdzpoLHKABp9M5BNKAmrogVu5sH?=
 =?us-ascii?Q?kPl44DaMv5RLYTexLknDI56g0dZymRlBTNa93PopDzylg2JLCFn2qoeUnHDq?=
 =?us-ascii?Q?MdQi1l1e8YQ+GfhrYGrqoFk3J2/23HT+5CeGZAlnqsXi9dANGBDOJcPSHnfW?=
 =?us-ascii?Q?4AAtzjGD0jNqHtlkaTkhpCP2WXoLvnV/V9//QaXbV4QKOc1XCZKbQFysToam?=
 =?us-ascii?Q?0+RDCXU5HiqSr5Y0ElTxypjULI58uNYKviltYNcE2etEekXAajFrVgPuerpj?=
 =?us-ascii?Q?nmvJKa4lZ5XGCIJGyzXSUXl+Mk9BZnh9mUN6YqisB88t+2N9tkLqQp935F40?=
 =?us-ascii?Q?uxQDrza04lI2LRq3OOVVluknLf01KQW4IQgjBYd/a6CzkVfsMlYt+qfQGs38?=
 =?us-ascii?Q?4K/BwFeIUvjTVfLkxrdA3nRRAcB7uYa8hG+t0aCcuNZBWPa+CYZpdeMzyMnz?=
 =?us-ascii?Q?ZGD1btRZunltEKCUGM6YUGElw5x23pPZrhr/CwK10D2j08xhj4zmgzCR3IMe?=
 =?us-ascii?Q?sFfXIlVj+Rz9DjdW4F8lxLF6LkDJ5aP/bW6CSlha/ySfhb23ChgWE6BzMFt0?=
 =?us-ascii?Q?q+BpH/TLG4RmncMhXXAy0l6amb1wDD0ArVTxaMqph6dIMrkfk8AOlDfiwWfD?=
 =?us-ascii?Q?Gvl+Xk+ogWh3oX0ldl9ic0GX/Xu/FdjruJ2CfrPjQl3C+EAePZoFaE6lTmrw?=
 =?us-ascii?Q?So4IwiK1ZhRzSRKvHisUzNeav5qT1DSFhpgYd32ZaSgLSb59/aeZ1R+AVwc3?=
 =?us-ascii?Q?TxztxlOrVB7be5xAtRIQgFB1nG2Hg2INXJRJguakj0Uqk0QQlYpOTfpyQ9/n?=
 =?us-ascii?Q?nJOq4gxPzNJsc1IuBvhf2zArNHPvTQvBj19oUETf1NYSMtL55m+q+To+IpHQ?=
 =?us-ascii?Q?I15bblDoQPjLO8FUjL6QPr6+20n83gApuIPqrGLVadv4Ox5zs55y2DvDbnPG?=
 =?us-ascii?Q?gmJOY/WEd0PZlbZbVFev7rLbTvs2BS+eCIvGtzuNCvi51VAaPg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92baacb2-0307-4f3b-9d31-08d8cd7ce38a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 04:32:34.9010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4o8hy695aKOhNDkMpvSftpcIv48g5WgdHJWEMIb8SuXgw2UFup4gmk9mPbBjCEpxJ8Si2bi1AiQNOvQypAcIWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB6482
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2021/02/10 12:15, Damien Le Moal wrote:=0A=
> On 2021/02/10 10:24, Stephen Boyd wrote:=0A=
>> Quoting Damien Le Moal (2021-02-09 04:29:59)=0A=
>>> Add a clock provider driver for the Canaan Kendryte K210 RISC-V SoC.=0A=
>>> This new driver with the compatible string "canaan,k210-clk" implements=
=0A=
>>> support for the full clock structure of the K210 SoC. Since it is=0A=
>>> required for the correct operation of the SoC, this driver is=0A=
>>> selected by default for compilation when the SOC_CANAAN option is=0A=
>>> selected.=0A=
>>>=0A=
>>> With this change, the k210-sysctl driver is turned into a simple=0A=
>>> platform driver which enables its power bus clock and triggers=0A=
>>> populating its child nodes. The sysctl driver retains the SOC early=0A=
>>> initialization code, but the implementation now relies on the new=0A=
>>> function k210_clk_early_init() provided by the new clk-k210 driver.=0A=
>>>=0A=
>>> The clock structure implemented and many of the coding ideas for the=0A=
>>> driver come from the work by Sean Anderson on the K210 support for the=
=0A=
>>> U-Boot project.=0A=
>>>=0A=
>>> Cc: Stephen Boyd <sboyd@kernel.org>=0A=
>>> Cc: Michael Turquette <mturquette@baylibre.com>=0A=
>>> Cc: linux-clk@vger.kernel.org=0A=
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>=0A=
>>> Reviewed-by: Anup Patel <anup@brainfault.org>=0A=
>>> ---=0A=
>>=0A=
>> My inbox has this one patch multiple times and no changelog here. I also=
=0A=
>> don't see the cover letter, so I guess I wasn't Cced? Can you please add=
=0A=
>> a changelog so I know if anything has changed?=0A=
> =0A=
> My apologies about this. I forgot to CC you on the cover letter. Will do =
for the=0A=
> next version.=0A=
> =0A=
> [...]=0A=
>>> +static const struct clk_ops k210_clk_ops =3D {=0A=
>>> +       .enable         =3D k210_clk_enable,=0A=
>>> +       .disable        =3D k210_clk_disable,=0A=
>>> +       .recalc_rate    =3D k210_clk_get_rate,=0A=
>>> +};=0A=
>>=0A=
>> From here...=0A=
>>=0A=
>>> +=0A=
>>> +static void k210_register_clk(struct k210_sysclk *ksc, int id,=0A=
>>> +                             const struct clk_parent_data *parent_data=
,=0A=
>>> +                             int num_parents, unsigned long flags)=0A=
>>> +{=0A=
>>> +       struct k210_clk *kclk =3D &ksc->clks[id];=0A=
>>> +       struct clk_init_data init =3D {};=0A=
>>> +       int ret;=0A=
>>> +=0A=
>>> +       init.name =3D k210_clk_cfgs[id].name;=0A=
>>> +       init.flags =3D flags;=0A=
>>> +       init.parent_data =3D parent_data;=0A=
>>> +       init.num_parents =3D num_parents;=0A=
>>> +       if (num_parents > 1)=0A=
>>> +               init.ops =3D &k210_clk_mux_ops;=0A=
>>> +       else=0A=
>>> +               init.ops =3D &k210_clk_ops;=0A=
>>> +=0A=
>>> +       kclk->id =3D id;=0A=
>>> +       kclk->ksc =3D ksc;=0A=
>>> +       kclk->hw.init =3D &init;=0A=
>>> +=0A=
>>> +       ret =3D clk_hw_register(NULL, &kclk->hw);=0A=
>>> +       if (ret) {=0A=
>>> +               pr_err("%pOFP: register clock %s failed\n",=0A=
>>> +                      ksc->node, k210_clk_cfgs[id].name);=0A=
>>> +               kclk->id =3D -1;=0A=
>>> +       }=0A=
>>> +}=0A=
>>> +=0A=
>>> +/*=0A=
>>> + * All muxed clocks have IN0 and PLL0 as parents.=0A=
>>> + */=0A=
>>> +static inline void k210_register_mux_clk(struct k210_sysclk *ksc,=0A=
>>> +                                        const char *in0, int id)=0A=
>>> +{=0A=
>>> +       const struct clk_parent_data parent_data[2] =3D {=0A=
>>> +               { .name =3D in0 },=0A=
>>> +               { .hw =3D &ksc->plls[K210_PLL0].hw },=0A=
>>> +       };=0A=
>>> +=0A=
>>> +       k210_register_clk(ksc, id, parent_data, 2, 0);=0A=
>>> +}=0A=
>>> +=0A=
>>> +static inline void k210_register_in0_child(struct k210_sysclk *ksc,=0A=
>>> +                                          const char *in0, int id)=0A=
>>> +{=0A=
>>> +       const struct clk_parent_data parent_data =3D {=0A=
>>> +               .name =3D in0,=0A=
>>> +       };=0A=
>>> +=0A=
>>> +       k210_register_clk(ksc, id, &parent_data, 1, 0);=0A=
>>> +}=0A=
>>> +=0A=
>>> +static inline void k210_register_pll_child(struct k210_sysclk *ksc, in=
t id,=0A=
>>> +                                          enum k210_pll_id pllid,=0A=
>>> +                                          unsigned long flags)=0A=
>>> +{=0A=
>>> +       const struct clk_parent_data parent_data =3D {=0A=
>>> +               .hw =3D &ksc->plls[pllid].hw,=0A=
>>> +       };=0A=
>>> +=0A=
>>> +       k210_register_clk(ksc, id, &parent_data, 1, flags);=0A=
>>> +}=0A=
>>> +=0A=
>>> +static inline void k210_register_aclk_child(struct k210_sysclk *ksc, i=
nt id,=0A=
>>> +                                           unsigned long flags)=0A=
>>> +{=0A=
>>> +       const struct clk_parent_data parent_data =3D {=0A=
>>> +               .hw =3D &ksc->aclk,=0A=
>>> +       };=0A=
>>> +=0A=
>>> +       k210_register_clk(ksc, id, &parent_data, 1, flags);=0A=
>>> +}=0A=
>>> +=0A=
>>> +static inline void k210_register_clk_child(struct k210_sysclk *ksc, in=
t id,=0A=
>>> +                                          int parent_id)=0A=
>>> +{=0A=
>>> +       const struct clk_parent_data parent_data =3D {=0A=
>>> +               .hw =3D &ksc->clks[parent_id].hw,=0A=
>>> +       };=0A=
>>> +=0A=
>>> +       k210_register_clk(ksc, id, &parent_data, 1, 0);=0A=
>>> +}=0A=
>>=0A=
>> .. to here, shouldn't these all gain __init?=0A=
> =0A=
> Yes indeed, they can. Fixed that.=0A=
> =0A=
>>> +=0A=
>>> +static struct clk_hw *k210_clk_hw_onecell_get(struct of_phandle_args *=
clkspec,=0A=
>>> +                                             void *data)=0A=
>>> +{=0A=
>>> +       struct k210_sysclk *ksc =3D data;=0A=
>>> +       unsigned int idx =3D clkspec->args[0];=0A=
>>> +=0A=
>>> +       if (idx >=3D K210_NUM_CLKS)=0A=
>>> +               return ERR_PTR(-EINVAL);=0A=
>>> +=0A=
>>> +       return &ksc->clks[idx].hw;=0A=
>>> +}=0A=
>>> +=0A=
>>> +static void __init k210_clk_init(struct device_node *np)=0A=
>>> +{=0A=
>>> +       struct device_node *sysctl_np;=0A=
>>> +       struct k210_sysclk *ksc;=0A=
>>> +       const char *in0;=0A=
>>> +       int i, ret;=0A=
>>> +=0A=
>>> +       ksc =3D kzalloc(sizeof(*ksc), GFP_KERNEL);=0A=
>>> +       if (!ksc)=0A=
>>> +               return;=0A=
>>> +=0A=
>>> +       ksc->node =3D np;=0A=
>>> +       spin_lock_init(&ksc->clk_lock);=0A=
>>> +       sysctl_np =3D of_get_parent(np);=0A=
>>> +       ksc->regs =3D of_iomap(sysctl_np, 0);=0A=
>>> +       of_node_put(sysctl_np);=0A=
>>> +       if (!ksc->regs) {=0A=
>>> +               pr_err("%pOFP: failed to map registers\n", np);=0A=
>>> +               return;=0A=
>>> +       }=0A=
>>> +=0A=
>>> +       in0 =3D of_clk_get_parent_name(np, 0);=0A=
>>=0A=
>> I'm still lost why we need to get the clk parent name here vs. using the=
=0A=
>> index approach and using clk_parent_data. There were some comments about=
=0A=
>> #clock-cells which didn't make sense to me. The fixed rate clk in DT=0A=
>> should have #clock-cells as it is a clk.=0A=
> =0A=
> It is like this because I could not get your suggested approach to work. =
I am=0A=
> using clk_parent_data[]->hw for specifying the parents of the clocks regi=
stered=0A=
> by this driver. But using this data structure, I failed to figure out how=
 to=0A=
> specify the "in0" clock as a parent without using the clock name itself. =
The=0A=
> other option I see is using fw_name (I do not understand that one) and hw=
, but I=0A=
> do not have that pointer since the clock is registered by the common fram=
ework.=0A=
> What am I missing here ?=0A=
=0A=
Revisiting this, I think I got it. All I need to to is set ".index =3D 0" i=
n=0A=
clk_parent_data[] of the clocks that have in0 as a parent. Very simple inde=
ed. I=0A=
removed the ino clock name stuff.=0A=
Testing and sending out v19.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
>>> +       if (!in0) {=0A=
>>> +               pr_err("%pOFP: undefined fixed-rate oscillator clock\n"=
, np);=0A=
>>> +               return;=0A=
>>> +       }=0A=
>>> +=0A=
>>> +       ret =3D k210_register_plls(ksc, in0);=0A=
>>=0A=
>> I suspect the 'np' should be passed to these functions instead, and then=
=0A=
>> use of_clk_hw_register().=0A=
> =0A=
> Done.=0A=
> I also addressed all your nits. Thanks for the comments.=0A=
> =0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
