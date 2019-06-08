Return-Path: <SRS0=ATvf=UH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA34C28CC5
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 07:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C23521473
	for <linux-clk@archiver.kernel.org>; Sat,  8 Jun 2019 07:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="TRWVuUpU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfFHH0P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 8 Jun 2019 03:26:15 -0400
Received: from mail-eopbgr140045.outbound.protection.outlook.com ([40.107.14.45]:39170
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726042AbfFHH0P (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 8 Jun 2019 03:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOhtXOfOKXuRdNodB75bmf2sWe/Wd42LrJbBPvDrS+c=;
 b=TRWVuUpUl7J1mHAk70mj4bTlxTr7BqgVpGSwXGpMkXx9NsBJoUdQCKpauMiIvMB4SQhz50YaRGqCv95donYWQG+xV8dCOhdGO/KtgFgkdr9wye9HePl+0el/+PGSBr1loEg7pSA3T1hF3KO2soyddRRN05QkxffepCTX/hqWTtc=
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com (20.177.50.140) by
 VI1PR04MB5599.eurprd04.prod.outlook.com (20.178.125.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Sat, 8 Jun 2019 07:26:11 +0000
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1]) by VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::9577:379c:2078:19a1%7]) with mapi id 15.20.1965.011; Sat, 8 Jun 2019
 07:26:11 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
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
Date:   Sat, 8 Jun 2019 07:26:11 +0000
Message-ID: <VI1PR04MB5055A1DBAC2C4AAC515CB494EE110@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <057720844e78e615e46de34a73b16ffaf7dbfc10.1558686047.git.leonard.crestez@nxp.com>
 <20190607190522.D276520868@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [2a04:241e:504:3000:e6e7:49ff:fe63:c221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a898073-9783-4127-cfd4-08d6ebe29511
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5599;
x-ms-traffictypediagnostic: VI1PR04MB5599:
x-microsoft-antispam-prvs: <VI1PR04MB5599EBCB02A0781FA2E1A081EE110@VI1PR04MB5599.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(136003)(39860400002)(346002)(396003)(199004)(189003)(2906002)(6116002)(7696005)(4326008)(52536014)(55016002)(25786009)(76176011)(256004)(102836004)(229853002)(4744005)(476003)(478600001)(54906003)(486006)(44832011)(6916009)(316002)(9686003)(305945005)(7736002)(14454004)(86362001)(71200400001)(71190400001)(6246003)(33656002)(81156014)(53936002)(68736007)(46003)(76116006)(186003)(73956011)(66446008)(64756008)(66556008)(66476007)(66946007)(81166006)(8936002)(446003)(53546011)(99286004)(6436002)(5660300002)(6506007)(74316002)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5599;H:VI1PR04MB5055.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LS61RIcA24PwEirLmqhw+wZzGlLcMlSdtMR4I2ea7CtNJ87YnCuPKCyw/ovphRnhMmZqFSSyt6KTnEEYRBnJUADKVqANy8TBf2LDuvLfai4e4NP+RiIsjlEnCtOwtYpw87ZBZpbAphffsjpfyWxKub5mYzIoqgBD7DN8B2LldYytcd6A5/Q8QmyXI7lOManuyterXFGe9u2b2yQtxiXOjyLuCcbvm4/9Xn5ZnZ0D4XPTc9vuyk/IHBrzVus7vpHXI/Syz4QbEMqtTra+qyh+frxDNthwO9rHUpKuoMA+1b8NpTo3CgzSNhW/gKR+EGvGy3xuqo9iqMWggdcOFb49eeulJi9RhW1SWb3G8ZcrgB85gjW3CYOZs6PwDNizK7JZpYXBLuH7EKNPZct6SQ1M69aAvHIVBV7MCL7+xePRr0I=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a898073-9783-4127-cfd4-08d6ebe29511
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 07:26:11.4693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leonard.crestez@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/7/19 10:05 PM, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-05-24 01:25:25)=0A=
=0A=
>> @@ -3040,10 +3051,11 @@ static void clk_debug_create_one(struct clk_core=
 *core, struct dentry *pdentry)=0A=
>>          debugfs_create_u32("clk_enable_count", 0444, root, &core->enabl=
e_count);=0A=
>>          debugfs_create_u32("clk_protect_count", 0444, root, &core->prot=
ect_count);=0A=
>>          debugfs_create_u32("clk_notifier_count", 0444, root, &core->not=
ifier_count);=0A=
>>          debugfs_create_file("clk_duty_cycle", 0444, root, core,=0A=
>>                              &clk_duty_cycle_fops);=0A=
>> +       debugfs_create_file("clk_parent", 0444, root, core, &current_par=
ent_fops);=0A=
> =0A=
> Shouldn't we skip creation of this file if core->num_parents =3D=3D 0? So=
=0A=
> put this under the if condition below?=0A=
=0A=
It's still useful to determine clk tree structure from debugfs fields, =0A=
otherwise you'd have to extract by parsing other files.=0A=
=0A=
Would you hide clk_rate for fixed-rate? I'd rather have everything =0A=
available for uniformity, even if it's otherwise constant at runtime.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
