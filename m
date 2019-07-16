Return-Path: <SRS0=Gp7K=VN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B414C76188
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 10:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0E8320880
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 10:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VXU/JIj7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732336AbfGPKcs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jul 2019 06:32:48 -0400
Received: from mail-eopbgr10041.outbound.protection.outlook.com ([40.107.1.41]:42438
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728235AbfGPKcs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 16 Jul 2019 06:32:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go0dhRXsuYuYA5nFgyYWy680H2aNy+yPVhYqd56RoAK+5F7ScjTmEH+j4YDDDHqmyO6I9KEB71rgFzb5+lkPpALxpZt9LFjosJmswbDSeu4j++LNbt+j5z/HS5a99LHSz4PIbTXDpIwojKuiWoGjWrAQKdN/YNbTbkI7pRxqKEeY5gHvWtNlXA3lKlKGN+WCZcVqPKTj5cF5OBrAWXNCVur3ECgiPZssN5MYoZ9HTP6gISPzbSBpgmimNpEPpdDUOu9lqTSlPuYFGE1IVn501RpXHjq393U0rJ7z+o7rGqjeorj+/x4lNF/Hf+qQ2+Bf5WHip2SQs/ALY1LXKRH/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxDm6koKt7aZ2A2TrqtuS0/UNiocHQdKiIuCJVbRsIE=;
 b=JizwBiaQ7k3GM0AXjKGtcoU3/XqHNkUGuZ06c4Rlm6ErZh3aNYU0zQBHxm2LsEsnIA33f3XHDU8YwzntuVjN38HlhMh5q229Exb8CwX8oHi/wLYp8An76fn+KB3PRlmTJsZGd+Si/0kAEHnO0mFYW6ddPqw9LkjWetXvWhnbEakFvlBrn7L6Gr4C5/L1sVU+HVGbDcbzycIJOQptIvUN2iWePWG3nmAYZt0rp63G3LtUWcF0+lBavo0/SJw/RaRfytuvioTliq/VoeLfrGVYE7EeujuQaD746wWHZzQt94VTl2mA03vjDAu/av6xuA0VsX8+mHsfWwpR2Y8DlDzDSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxDm6koKt7aZ2A2TrqtuS0/UNiocHQdKiIuCJVbRsIE=;
 b=VXU/JIj7s8H65vib3SyOvY63GB1qKnEUVO3nGLdAjNXRtWAN8dJ2zN2Mmf7hUOzhv+H787CHSqiS2RkbUeTv1CvJ0VC1ooyBSXPfwRUEfKwaQPtyA/45+Q/6m4g1eU6B8b7kWRHcebUX7F7LURrtTKakzakRXgx2vghIgzyZelA=
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com (20.177.50.140) by
 VI1PR04MB5680.eurprd04.prod.outlook.com (20.178.126.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Tue, 16 Jul 2019 10:32:44 +0000
Received: from VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::41:43ca:bf4c:7b99]) by VI1PR04MB5055.eurprd04.prod.outlook.com
 ([fe80::41:43ca:bf4c:7b99%3]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 10:32:44 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
Thread-Topic: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
Thread-Index: AQHVO8HMJm4SzDzHR06bIGekZVgUfg==
Date:   Tue, 16 Jul 2019 10:32:44 +0000
Message-ID: <VI1PR04MB5055F2D2C814BA8C83ACF273EECE0@VI1PR04MB5055.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8eb629e-4a27-4411-c186-08d709d8f07a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB5680;
x-ms-traffictypediagnostic: VI1PR04MB5680:
x-microsoft-antispam-prvs: <VI1PR04MB5680A634BD4453046608E05AEECE0@VI1PR04MB5680.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(71190400001)(6506007)(66946007)(64756008)(3846002)(6116002)(4326008)(54906003)(99286004)(66476007)(66556008)(66446008)(76116006)(91956017)(102836004)(55016002)(44832011)(5660300002)(7696005)(6246003)(486006)(66066001)(8676002)(53936002)(25786009)(9686003)(86362001)(558084003)(476003)(33656002)(229853002)(2906002)(6916009)(256004)(186003)(81166006)(81156014)(6436002)(8936002)(14454004)(26005)(68736007)(71200400001)(316002)(52536014)(305945005)(74316002)(478600001)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5680;H:VI1PR04MB5055.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wLmJqGwUit4COboG3zaoomOj8Vw5EOSxgeinukjKIth40UA+ujS7iz/x/oPlBAwQYj3pGyf6K6J4VETqW2WOrZXqtHASFUUwIB5D6YwOaILAUxI7oZz2l9Dbze6pMCp7wq2+Uv+rx/1j7J+/d/b22ZnUZJblvnOwx0rPXUUMr7LQ0uuHNllpWpUF6RtF1JHTRvoHpzywuJihfnTZDeLtQQt29HUUrH6tnTTQjAILu11iD92sgkT3O/2/s0x8ZKxZ0d8I8VDVZ9L8Z/+KQLb1V9nYX0UivAf2VV3NtXXwGFUuikR7whOUyGHkfYYlsvHqX7nHDmZ23IrXKtYff3PjnJ5vnDQv4dWq8a5Zl/+ptIs2F13ziNHBQ3OrHiQEMuRjZQ6HKIUzWXScekwS6KAi9a5flWfCygZsYxS4oXMvZx8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eb629e-4a27-4411-c186-08d709d8f07a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 10:32:44.6728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leonard.crestez@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5680
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Gentle ping.=0A=
=0A=
This patch shows up on patchwork but not in my inbox so maybe it was =0A=
lost in spam filters somehow?=0A=
=0A=
Geert offered a reviewed-by in v2 but I forgot to add it.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
