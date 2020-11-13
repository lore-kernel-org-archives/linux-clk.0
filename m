Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5418DC388F7
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:23:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0365221EB
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 08:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="nZAbvzrv";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="fLoQFWps"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKMIXz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 03:23:55 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:26349 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgKMIXz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2020 03:23:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605255834; x=1636791834;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=29Z5YjYNrx6WukaroPzEE/0q3MH9MJWWZ1HM9I/j/uM=;
  b=nZAbvzrvotopIXWtRSet+AKPrTjgo1fU6YiSFGHMgkXOr7EFHJvDbSyB
   z7mP/UApySc6VPX+vAjLlfRbcdbxcCwP6VzMY9YNSNNvu9zyWzIJbYwub
   3n/hmmf/HdQvtuqsbsznrxMtKk3t8mzy/c3M6Aw+cP1UhB32s/QJdcw0N
   ItVANd0H1XbgD6cf+XjY3fCJQdr8f8qcCKPeY+7NWmVwV/zwZ6FpjTjvO
   Ae0PJyVwe4XWx46qjUERFyDWEGfc/uZdkh/kUG88l2yAcRKqCn+N3orE9
   9zwBije/bxQTPulmaqQVx9h4dWbnqjXeGQteXE3jMQfJ8vW1RCXt1BDPh
   g==;
IronPort-SDR: WWt+EBeNLMfMA7KtbEB4HFtYJqFKAJpPphYDe7K1neag7TRCdWDPqtsfrcs44AdgeRXqfvMiMr
 ae7KVdgO3aV522cfL8mxXaEvO3hDFpBYsCpS6AnoDIjYOgw3VvDlGKRD8w1NIfxK6kcdYfDZ/j
 222ODwpYO2SWXxSwc0pGAmU1/valj8g/CXqD1MOQ/JWSNu6GgtYjgVJyns7tIgCwu1j01gy2nj
 cl82cZ0irWJUkW6nKk8b4b0t8GF1fdmLevnZY5BadCiNPm/jV3lEiU0w0lnLgMWxheBq5bdLzz
 8gY=
X-IronPort-AV: E=Sophos;i="5.77,475,1596470400"; 
   d="scan'208";a="152455124"
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
  by ob1.hgst.iphmx.com with ESMTP; 13 Nov 2020 16:23:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSl2l4yYrKxK03LmkUd0bVWGkADRyXbW6pzXJQlBy4x8kcSy1hWTBQ2pnVEXQ4b0rUGzMH51iUBGsRcHv2hd+U5cvZxip/HzgGcnJEmKyOK5EEBOCYfWT+u+8SkxUSldtmYbvXEZm2SIMOwSJBYu62HfKqryPHqP0Bvm8XGJIwdw7H+s+Bnna5YWKE+TU/ZX7b6pIrNzghL2dBbM2uIgcgH33MnAhUyMaU7CVruKTW2uOGQNvQveBB+AN75ZTNcnGTCur+x028pw6m1M/CtWmvYXLQjurfp69t42TNkogm1edTu9i9KkjgQwZIZr3TGDmwntSu7QizMaWjI8DHSTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29Z5YjYNrx6WukaroPzEE/0q3MH9MJWWZ1HM9I/j/uM=;
 b=YqszaHZf3VQKdyJZF+WU64VZ/pCk5IfE6bjqk1WtolbOd36dUZjEZ0aWqCUQzui5wBPWA6aoqutwfqia0XkeTWPyPsG7TOkuNW2GX+sG46EItnePVNMPQz3wTY1ygVBxkbhuVj87LRGfxbw+uyBH+Z/hAeXWLonpknWyhye8lsHL/H9ePwnIaagFcNppHletrrAHiVX8PjjmhPkfyjLYDNGeTLIUDhtGaMSxUCjeaK78TVaSp1TIdfaBcggkxd7JRau96h5cMw3qpu1fOjmN/UjtfM0m9N6bNdduY9ibIohWGi7u70tA5+T9OjxEzve6lbEvAg/GAs+6e7d4jeKuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29Z5YjYNrx6WukaroPzEE/0q3MH9MJWWZ1HM9I/j/uM=;
 b=fLoQFWps5pzGxtY6AVZ9I4LEyDOfQZC5dpqPWxfs17PVF9upd5zYw+3DhHmv6jOt4yWV87xSMTrJPmWgspQO2bg6oFhKTvRoUWM7/46MaSwDO6T520bAx76CfruZJ4ePu2t1Tns5QsUlb8SiiafnFZ7r/j3RT0oQDkQ6PBFaLHo=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6701.namprd04.prod.outlook.com (2603:10b6:208:1ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 08:23:52 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.032; Fri, 13 Nov 2020
 08:23:52 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
CC:     Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Topic: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Index: AQHWtN4Q9ZnQv+4b30qO975eAugUlw==
Date:   Fri, 13 Nov 2020 08:23:52 +0000
Message-ID: <BL0PR04MB65142F688DB54141C46D1D92E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
 <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525508016.60232.12394737512819290718@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:1511:21c9:a204:82eb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2990e162-95af-4fa3-cdee-08d887ad7480
x-ms-traffictypediagnostic: MN2PR04MB6701:
x-microsoft-antispam-prvs: <MN2PR04MB670114B614A3B65CA074945BE7E60@MN2PR04MB6701.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zYK6CtLqIQkjAzOUYIN6DYk8PwebWRuWNYtuVS+ZaTuSiZwiJs7/gqIlqzyGb1la6XNlAkSEiSZrJRVfjxb4rF8BjYaQPWX5Z1Hjtm1UunIdYJcQHLEa1APZKPccbUmrSJ9u+llo+nWiLlIiHmsbi6LCbI6F0Jg3oDqzBQwQuV/JnSw61UCJOyQyNVv4n8B7+j/L1ChaZkuq4hJUGWMHriPCbJYx7i7AWsVyLiAMibU7lgOrLxLN8NG7PZRCFr020k6Z70hrbmMezhzekLJ8LsonSrJbKzHVB8iKeeEoMbg20TDZkTJV9bfKe+uFTO7cXtgBMbv9bbB/ostbl0pqEg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(91956017)(83380400001)(64756008)(4326008)(66946007)(186003)(76116006)(66446008)(33656002)(5660300002)(52536014)(66556008)(66476007)(8936002)(55016002)(86362001)(316002)(9686003)(2906002)(8676002)(7696005)(53546011)(110136005)(4001150100001)(6506007)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: HPRkzMN+c1FwuK/gFoNtBn3B8+drdQMqZFnA+ATJwUDNnDE3rMU1vD78fjU/oCmzP+ZH0/Md2i3RS3CnKtwoV/MUWeiz0k3LXj9Qzz3hYDvdW52k4MFDH65f7zgxjJ8DNqLLOZSpmfzgJs9qAruuk1h2RFdqGz+2EqnbWM8NF1aPvj0vbxayzCkNHSdDxwAz3kI0NQVTPTBOQADy+oYLNqzCD+DwvE//R/pMjVeXbZ8FZhrHVSooVLNzyuHbt4bKY8n5QzAqmt3uozCXmwsLQWUwypndba6CdKVHF8ynmJPicr4zsZLYyR7L6acM8LBE400dMevHU1yd0U72rmBI2IPWzJc+8drSV5rhdgpGl+Trqv6UWVehVL8+QhqNBGuqDXKWiomrXG6OSbX5/xr+4Pr0lt48pd5UEoF+8phi9j7sC02c1wQUZW/bsI422thfJ0RWw+NFkocoyVWZDV1yI6oiR/z7twyhIwpSbPB+jSBVG1nHlk3IRJDITemS3N14dD0yOQbQO0dsqV+nyuy5YSQLKxr/+9QFHmRGLbi1h+Yvo9UZjWjm7M2IeUyuvM0t7NzeijaWEykV5F7IiQhgWV5KMgcav/hYIJM4y1Mzrjatgj2R0j4Q/E5YPFYz5Npv6NB/VUBuxs06YvzGxK/4wo3noCynkBshA1D85rkqbzCDme09uiBjaT7/yStv7x8sasuZG4kW2R4YiiQKHqDAog==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2990e162-95af-4fa3-cdee-08d887ad7480
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 08:23:52.5744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aygEDyPWxCtFMO599tUC0BN5N3tSiy+a+V7zjKsAsfKex7xRzNz+MFs8aYEsiEXfEka9aMBk2hnuNXwHq6Ka1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6701
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020/11/13 17:11, Stephen Boyd wrote:=0A=
> Quoting Damien Le Moal (2020-11-12 23:57:19)=0A=
>> On 2020/11/13 16:53, Stephen Boyd wrote:=0A=
>>>=0A=
>>> Yes it's fine. Just the commit text reads as "If of_clk_init() is not=
=0A=
>>> called in time_init() then nothing works" which is true but made me=0A=
>>> wonder if it was because it needed to be super early or not. The commit=
=0A=
>>> text could be a little clearer here.=0A=
>>=0A=
>> OK. I will clarify the commit message in V2. Working on it now.=0A=
> =0A=
> Thanks!=0A=
> =0A=
>>=0A=
>>> We don't have any good solution for a fallback to call of_clk_init()=0A=
>>> somewhere later. I do wonder if we should generalize this though and=0A=
>>> call of_clk_init() from start_kernel() directly via some Kconfig that=
=0A=
>>> architectures select if they need it for their timer and then move it t=
o=0A=
>>> an initcall if architectures don't select the config. Or throw it into=
=0A=
>>> the of_platform_default_populate_init() hook if the architecture doesn'=
t=0A=
>>> need to call it early.=0A=
>>=0A=
>> This last idea seems reasonable and probably the easiest. And I think it=
 could=0A=
>> be done unconditionally even if the arch calls of_clk_init() early as th=
e=0A=
>> already populated clock provider nodes would not be initialized again.=
=0A=
>>=0A=
> =0A=
> Also of_clk_init() is for the CLK_OF_DECLARE() users and if they can=0A=
> wait to platform bus population time then they could be converted to=0A=
> regular old platform device drivers. Maybe the problem is the clk driver=
=0A=
> you're using is only using CLK_OF_DECLARE() and not registering a=0A=
> platform driver?=0A=
=0A=
Yep, correct, that is what I did. SO yes, indeed, if I where to use a regul=
ar=0A=
platform_driver, then the of_clk_init() change would not be needed.=0A=
=0A=
For the clock driver, I followed the pattern used by most other drivers wit=
h the=0A=
majority I think using CLK_OF_DECLARE(). I did see some using the platform=
=0A=
driver declaration though.=0A=
=0A=
I could spend time trying to figure out if I can get away without using=0A=
CLK_OF_DECLARE(), but since I think other riscv board clock driver are arri=
ving,=0A=
we may as well keep that of_clk_init() change, no ?=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
