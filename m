Return-Path: <SRS0=aD5i=U6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8931EC0650E
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 13:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 423A12089F
	for <linux-clk@archiver.kernel.org>; Mon,  1 Jul 2019 13:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QVMHP+mT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbfGANNz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 1 Jul 2019 09:13:55 -0400
Received: from mail-eopbgr20082.outbound.protection.outlook.com ([40.107.2.82]:50663
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726329AbfGANNy (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 1 Jul 2019 09:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fueU2UwK+/gsfQtwExuuI6ZQTbXw3lV0Mpoy/e8Zu0=;
 b=QVMHP+mTT55Z2ZJmvmEhaxijb34dupKo/QYFdN/WiSvYagsfXIyursqKP4BBJ5yIuGJwbk0egXfj9SOKNiom8qSQwuBm+9KOON4H0B9wX0Qy0lWrjwNYRp5MUOoyruvtUWrvaIgL6fqF6pyCWBMnDLAQ+5kRZc8i9/pb/GI4T2A=
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com (20.177.50.140) by
 VI1PR04MB5136.eurprd04.prod.outlook.com (20.177.50.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Mon, 1 Jul 2019 13:13:52 +0000
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::d83:14c4:dedb:213b]) by VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::d83:14c4:dedb:213b%5]) with mapi id 15.20.2032.019; Mon, 1 Jul 2019
 13:13:52 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: Add clk_min/max_rate entries in debugfs
Thread-Topic: [PATCH v2] clk: Add clk_min/max_rate entries in debugfs
Thread-Index: AQHVLajUq4SmNwzvekSbL/iOzo8zow==
Date:   Mon, 1 Jul 2019 13:13:52 +0000
Message-ID: <VI1PR04MB50555EBAFE8CF34189635B18EEF90@VI1PR04MB5055.eurprd04.prod.outlook.com>
References: <0c12208398cadb7450b6b7745e99c55770c0ccf8.1561709827.git.leonard.crestez@nxp.com>
 <CAMuHMdWVoYPZFZPmfTWMU3pZc633uqkn70MyApcPhgUSgmCW-A@mail.gmail.com>
 <20190628193556.BC814208CB@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [82.144.34.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40dd0c26-23db-427a-796e-08d6fe25f68f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5136;
x-ms-traffictypediagnostic: VI1PR04MB5136:
x-microsoft-antispam-prvs: <VI1PR04MB51362912B69052ABD788C92DEEF90@VI1PR04MB5136.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(199004)(189003)(102836004)(53936002)(8676002)(76176011)(55016002)(99286004)(5660300002)(3846002)(9686003)(54906003)(53546011)(71190400001)(6246003)(8936002)(186003)(81166006)(81156014)(6116002)(229853002)(316002)(14454004)(26005)(6436002)(7696005)(71200400001)(6506007)(25786009)(4326008)(110136005)(478600001)(446003)(256004)(66066001)(14444005)(476003)(74316002)(66556008)(44832011)(2906002)(86362001)(73956011)(66946007)(66476007)(486006)(66446008)(64756008)(68736007)(91956017)(76116006)(7736002)(33656002)(52536014)(305945005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5136;H:VI1PR04MB5055.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SBTYgtpRajBVQzl+AWbogus3M3DNdhvBh3J/bQZwdiitgKbs0XjirHGoqg3DDoIZ9k3mKT6LZjyXo00+GhYjDFTxwIV9ot7+ss70MtuPQs2jX6HKnOWBHlpH54qMYRzfQuxqAb+diCiYFKJzD3wSQznU0bf/x7rXG9wmg0zogO52LiXtMdQDEUT0GVK8UhpZQqf5Ux5/n4cg7hjht2jM1SpPxDESt1V98ssE45makkoznWAmKZuiZ0phHxasdVR5LOa2uTT5P+5DwYa5gw9f3QoOcU9L2vG0HVr56j7r6jelU310mjNXVpG6pZ+CxyAzqPZC9VMmqpqlPcJy/pPpkZgzH4eP9zHzV7WUZ64FjuDsi8dpIHQV92XgfVgpJ1JjSluy/uAf5e7b3vmpOXGRH3YPF+cSvnlkt929VZ64t4Y=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dd0c26-23db-427a-796e-08d6fe25f68f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 13:13:52.1887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leonard.crestez@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5136
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/28/2019 10:36 PM, Stephen Boyd wrote:=0A=
> Quoting Geert Uytterhoeven (2019-06-28 04:58:27)=0A=
>> On Fri, Jun 28, 2019 at 10:19 AM Leonard Crestez=0A=
>>=0A=
>>> --- a/drivers/clk/clk.c=0A=
>>> +++ b/drivers/clk/clk.c=0A=
>>> @@ -591,10 +591,12 @@ static void clk_core_get_boundaries(struct clk_co=
re *core,=0A=
>>>                                      unsigned long *min_rate,=0A=
>>>                                      unsigned long *max_rate)=0A=
>>>   {=0A=
>>>          struct clk *clk_user;=0A=
>>>=0A=
>>> +       lockdep_assert_held(&prepare_lock);=0A=
>>> +=0A=
>>=0A=
>> I guess the clock maintainers want to see the addition of this check=0A=
>> spun off into a separate patch....=0A=
> =0A=
> Yes. I'm not sure we should have the assertion in there. I seem to=0A=
> recall that we thought it might not always be necessary to have the=0A=
> lock, but maybe that was wrong.=0A=
=0A=
The clk_core_get_boundaries function iterates consumers so locking is =0A=
required. Looking at other functions manipulating clks_node (such as =0A=
__clk_put, clk_core_link/unlink_consumer) this is always done under =0A=
prepare_lock.=0A=
=0A=
In theory without locking debugfs could read freed memory if it happens =0A=
at the same time as device removal.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
