Return-Path: <SRS0=ATvf=UH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B6CC468BD
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 12:48:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A3F3216C8
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 12:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="n7ndUj4h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfFHMsz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Jun 2019 08:48:55 -0400
Received: from mail-eopbgr140070.outbound.protection.outlook.com ([40.107.14.70]:52608
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726907AbfFHMsz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 8 Jun 2019 08:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J84ZCyTCB+NcZC5aMY5kD6mv80XNaQb5OnZrVx8kTAo=;
 b=n7ndUj4hwr5QgWLngUE/kHkoJTHJnIgKe9TlTNBt5GRrrhSztC07rtWZzEhj0WVxaIcTS9KhneunozpUua6vB31tMueMbuItdNjss+XJJAJAiUa/9+iwL3A15VSYl7v16SCFWBXtUX7xqiiKVYVl7xxxnE0eHn3FeJnxYYNEFpg=
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com (20.177.50.140) by
 VI1PR04MB5614.eurprd04.prod.outlook.com (20.178.125.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Sat, 8 Jun 2019 12:48:51 +0000
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1]) by VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1%7]) with mapi id 15.20.1965.017; Sat, 8 Jun 2019
 12:48:51 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: Add clk_parent entry in debugfs
Thread-Topic: [PATCH] clk: Add clk_parent entry in debugfs
Thread-Index: AQHVEgo8VzXmpj/WDkGGgiXI1N3a1Q==
Date:   Sat, 8 Jun 2019 12:48:51 +0000
Message-ID: <VI1PR04MB505581139250C1B58B5C07FDEE110@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <057720844e78e615e46de34a73b16ffaf7dbfc10.1558686047.git.leonard.crestez@nxp.com>
 <20190607190522.D276520868@mail.kernel.org>
 <VI1PR04MB5055A1DBAC2C4AAC515CB494EE110@VI1PR04MB5055.eurprd04.prod.outlook.com>
 <CAMuHMdW=AmTWZ-_KexHOj2HJS0TRcqONMVo7HLEd19VzAbTZZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [2a04:241e:504:3000:e6e7:49ff:fe63:c221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4e6b936-e42d-4627-7264-08d6ec0fa844
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5614;
x-ms-traffictypediagnostic: VI1PR04MB5614:
x-microsoft-antispam-prvs: <VI1PR04MB56148DB9ADF9D75B89E08B15EE110@VI1PR04MB5614.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(256004)(52536014)(6246003)(71200400001)(71190400001)(8936002)(81166006)(74316002)(305945005)(8676002)(316002)(7736002)(2906002)(81156014)(14454004)(86362001)(33656002)(6116002)(5660300002)(476003)(446003)(76176011)(44832011)(99286004)(46003)(25786009)(4326008)(478600001)(7696005)(486006)(73956011)(76116006)(68736007)(102836004)(66476007)(54906003)(110136005)(55016002)(66946007)(6506007)(6436002)(186003)(53546011)(9686003)(229853002)(64756008)(66446008)(53936002)(66556008);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5614;H:VI1PR04MB5055.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: voUJSrBESWAVEU+CgX2MSNYqDy4KS6Xsv2eJPqJaeIR4/tDqms4dxugOGITylKp8zHYQQM8ytiN5ioJqkwKFR9pDb/mFLIXxi7vuP1oMptapFGlIHNOLhGYkssOdwpHGwm6qYB3AWtrBkHAOTtvuWZ06PnzXfWlSiO3xYw1D1Gt7oA9CnjRTKTGCOZsPbH8AaNU+G/yytD6VYiQ22umeQx/ZQ/BzP6eJGeTrFZKl5DEjYV1D2KYKh+E9rcdPU/ESr0z2lK9A/uwMlU9PWjV9w43nc0MXLyaSZxedjMKVmWPpFODAedMB2oe7ldlBh5y78H6XUcqVlJNPMBmdqQquOhNGWTsXcgdNHeTHY3C28j0yfzCNUICFyF/BKuO00dklWoF1bTb68yhSSrI44LmUWOrU9bRRgW7r6KcgdCh0qbI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e6b936-e42d-4627-7264-08d6ec0fa844
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 12:48:51.0276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leonard.crestez@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5614
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/8/19 3:19 PM, Geert Uytterhoeven wrote:=0A=
> Hi Leonard,=0A=
> =0A=
> On Sat, Jun 8, 2019 at 9:26 AM Leonard Crestez <leonard.crestez@nxp.com> =
wrote:=0A=
>> On 6/7/19 10:05 PM, Stephen Boyd wrote:=0A=
>>> Quoting Leonard Crestez (2019-05-24 01:25:25)=0A=
>>=0A=
>>>> @@ -3040,10 +3051,11 @@ static void clk_debug_create_one(struct clk_co=
re *core, struct dentry *pdentry)=0A=
>>>>           debugfs_create_u32("clk_enable_count", 0444, root, &core->en=
able_count);=0A=
>>>>           debugfs_create_u32("clk_protect_count", 0444, root, &core->p=
rotect_count);=0A=
>>>>           debugfs_create_u32("clk_notifier_count", 0444, root, &core->=
notifier_count);=0A=
>>>>           debugfs_create_file("clk_duty_cycle", 0444, root, core,=0A=
>>>>                               &clk_duty_cycle_fops);=0A=
>>>> +       debugfs_create_file("clk_parent", 0444, root, core, &current_p=
arent_fops);=0A=
>>>=0A=
>>> Shouldn't we skip creation of this file if core->num_parents =3D=3D 0? =
So=0A=
>>> put this under the if condition below?=0A=
>>=0A=
>> It's still useful to determine clk tree structure from debugfs fields,=
=0A=
>> otherwise you'd have to extract by parsing other files.=0A=
>>=0A=
>> Would you hide clk_rate for fixed-rate? I'd rather have everything=0A=
>> available for uniformity, even if it's otherwise constant at runtime.=0A=
> =0A=
> Unless I' missing something, there's a big difference here: all clocks=0A=
> have a rate, but not all clocks have a parent.=0A=
=0A=
Sorry, I got confused and thought that condition checked for muxes so =0A=
the parent of intermediate clk nodes will be hidden. But intermediate =0A=
nodes have num_parents =3D=3D 1.=0A=
=0A=
Will fix in v2.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
