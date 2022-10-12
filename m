Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5351DC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 09:34:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJLJev (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 05:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiJLJeu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 05:34:50 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C578912ABC
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1665567287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=jBzK4ypyTyHQCNsT9nCK4l5oSXyU6JxsUtx75WhdJEc=;
        b=OMKlKQ1AZSpx0sRAdiwHtGhLgcPklIT346oCIfPUsH5PX2opgLnvTUitMwbZzZUobsZ7mJ
        IVOGKq1dhAKD9/dl4SXv0l1RdfZbdej+TivVRa/PSOAtyvdxZsektJ6C66koUeuifLgs0v
        jUaC41DIr8pDb3kiCh4dAuLVPrku68uXAPPdaANYci5nM6gQwhuLGb+dQL/2P8DJqRUSNl
        nOHD8G5F2Hcaj+jmIcGNBuTN2mX7VrXa0ZouGCsDK8wJhb3TbmgkXjuXcsd+rbbDsFUetl
        6IDX51TrRmiVc4bnYJvyQCflWo/uSfQF0EjwbtDqlkJXPG14tdz2vNihg9h+mQ==
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-wcHC7N6QNyu98OiJV2Nl3w-1; Wed, 12 Oct 2022 05:34:46 -0400
X-MC-Unique: wcHC7N6QNyu98OiJV2Nl3w-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by DS7PR19MB4616.namprd19.prod.outlook.com (2603:10b6:5:2c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 09:34:43 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c%6]) with mapi id 15.20.5709.022; Wed, 12 Oct 2022
 09:34:43 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-kernel@" <"vger.kernel.org linux-kernel"@vger.kernel.org>,
        linux-lgm-soc <linux-lgm-soc@maxlinear.com>,
        Yi xin Zhu <yzhu@maxlinear.com>
Subject: Re: [PATCH RESEND v2 3/5] clk: mxl: Avoid disabling gate clocks from
 clk driver
Thread-Topic: [PATCH RESEND v2 3/5] clk: mxl: Avoid disabling gate clocks from
 clk driver
Thread-Index: AQHYzkwFrQSJjUImDUOzXbBrfYxegA==
Date:   Wed, 12 Oct 2022 09:34:42 +0000
Message-ID: <MN2PR19MB369399EDEB4E73307F94E41AB1229@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <cover.1663827071.git.rtanwar@maxlinear.com>
 <5a88bd5a9e93cc6e794080e5cac821ae0c27ec56.1663827071.git.rtanwar@maxlinear.com>
 <20220929001745.A4F9FC433B5@smtp.kernel.org>
 <MN2PR19MB3693EEC08EAC5370F1D195FBB1579@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20220930010123.38984C4347C@smtp.kernel.org>
 <MN2PR19MB369301BFE8DFB56C348CD6C0B15D9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20221005202037.E7B43C433C1@smtp.kernel.org>
 <MN2PR19MB3693031CD60B09AE87885F5BB1239@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20221011174345.906BAC433D7@smtp.kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR19MB3693:EE_|DS7PR19MB4616:EE_
x-ms-office365-filtering-correlation-id: b2850c54-5c25-4c96-e1ed-08daac34fe45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 8JbL5z5JIcFr+PpWQFNEJCbfOGNxpTxs9CspZvDxtJ5MNpObxhs0PyuqLb2P+6O3JwaH+Rb7c84lELIIIFrjpukZvgv4Bgi5DJif/Fmcrbe2pIeqc93UELTkVrfyRvMRZmHcDu6ZhREVSt7AsxFifbvCtFhZjhT9NNt2nZa1c6klZdKm/pP5V9QbWpQhISjfgzmj/SLtgdteAGqmtOheR90Bqd1Gd6NX0L+grdhUbXfdaAr8QONQFr5tWpzK+8ETvXBeUdN6BydkimYtwXAJhoBdAbJzSH4Jyb9mXEvwRiJCrP2BnZ5kbyxgsNnhGtkNlLv+qzPx8D8nXIlbPoh/L458YwbTTvquN6l6uA0clNa5da3+ORyArk2u/lQIAyc8tNmQlS65Bz8KMNxFsPVL1q3V9KQiBJc5RBgWiqQ/XCs3WVAqRqUx+qeipjGnxucxz+eyxA7kgGPUH/02c+4oYQIu3KMsJ4eg2cv/gusNVDa37bf2ckCvU2xOK1FL0AacUYYBm4agLCwMsGMfey+U0SR+32rwcXCGbhhQtb88vbYIGGIyDsVEuYsWWnjFcrRKnopQ5Fi8DWasrpldQFEzd6YlIpa40RE1wzUTNmxgiuw1o44208hEmhuz3F4BTpqtuVNBTtumI7EqfbNZgw/CyMmuS2TH18Bro7A35q8G6LAVzB3XZ0k7AW0iID5ZyE9rTXCvcU0TtSzWPbTdiKWk1z4gP5rx2OmW0YVhF63/Gxx1FmvIXnwwxMVrbQBvRxZEWAN7CKAscZLP/2w+mD3foA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(33656002)(86362001)(66899015)(5660300002)(38100700002)(122000001)(186003)(83380400001)(38070700005)(8676002)(53546011)(478600001)(7696005)(6506007)(71200400001)(26005)(107886003)(9686003)(4001150100001)(316002)(76116006)(91956017)(66556008)(54906003)(66946007)(66476007)(66446008)(64756008)(8936002)(55016003)(4326008)(41300700001)(52536014)(2906002)(110136005);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?92hMtiTjzvs/YOLae4bTpdKD1UqIFl3jEsQtNjdtAKrigBmXJPatKpQKoZx+?=
 =?us-ascii?Q?FDXGvgveIFRxPQ2kHlvI1Lgm9w1sQ+wsg5+B6jL2puuNaGxkz+ecqJnyNB8q?=
 =?us-ascii?Q?4pE/RH62wfINSu096lMq9/IRRDr+rpj0lJ7x31p4HQsSU/sl+b4fl26UpImn?=
 =?us-ascii?Q?/9BpxkVGdsUIrZMPt8/d8Y7s2KGxkxdh/Qqc642GUFleiNu8ZpfxjlkmwCTP?=
 =?us-ascii?Q?HZueS8qsGzatd+Mv3wUz7YSWr5Byuj0Wd92zJ1gr4QoPOM6ZZoq8YqTk3m7c?=
 =?us-ascii?Q?n/xcwX+2pdF1AH5hmLk0H9c+BNwNzCJiIjVCVqVv3OSGMOjczEYk+LyVqiM/?=
 =?us-ascii?Q?o/80XCS2NGxvXZ/IJVuWstYkcW4NIzqHxGd+QkbN9C0wIddO++0JeRAyDQOG?=
 =?us-ascii?Q?UwrkiNrK9V9ng/QsbzPmiiHMl2Coh82i5spoVPpSCYjAlJ64o55RZ1lJ0N1c?=
 =?us-ascii?Q?/zmw/31RVn/WhAryjaDvhxtyABU2oWh+g2G/QrvBxyu92aQxu83DbNlA3E2v?=
 =?us-ascii?Q?AtEs6k//J0nMTiaQ0HGAFAbZNE6iQN1CEY49KJXRpLHUE0qHNiVKZr41hCyi?=
 =?us-ascii?Q?UxYNVflmF++nB0BJS5eT5Q80dzf1sb/ZwfRLJxBTnm20cw/EZqciKIs2lSP4?=
 =?us-ascii?Q?4f4o6FNJFGRs2Vvu9DcFbtcQYKv7evkwlJrlKwaJrENmjO9RbdF83TFWfocf?=
 =?us-ascii?Q?DEd5tdzW2Oz6fUTl8RVF2nnrzgY7rQRcD9W1EMf0XoTOIaGlsXsWJlOv5fC2?=
 =?us-ascii?Q?7Ho48bq/kAeOjvqAImicpsh4RDlXTcRUQ+ABUWbpRhjHlIY3BD3vOlBKCMfX?=
 =?us-ascii?Q?MfNLtfdA6hACH2iOk7ITILWONTWLD82Qf49yyAH3JjBQxBdytk7TKRSmNnpI?=
 =?us-ascii?Q?DnUXV3uc1Gc7EESLkYYYNXW98eEmqA2RLmks++kePrXkbCS7IQtOnmfu1fpK?=
 =?us-ascii?Q?L8v+e0V8tqv8BGDBl07gL2XimM13CqPHHBAIWk+ud6o9R8vQn7RU5bI9YgOm?=
 =?us-ascii?Q?wG5nPAQai6LhpnUY2ksnST4p/gtMU5/3Nj5m3sYA7Cd/amW5E5X+pnBsIiMK?=
 =?us-ascii?Q?N3B9lHfhPi07le51xIsnTK2yXNRxhnRprIViBsii5JptKIONqBxULyVD8xJP?=
 =?us-ascii?Q?jYGjcSuXV3G5pJagNf3ff9qKPcbwK6oCx5DdubyLo9mPq9sD/8bNv+aV62gs?=
 =?us-ascii?Q?eFoJJ8nKfw8ONQBD3DJBahrZ5HElR2SYB08kb2kR0DCnv0wfcbkjGvZe5xAN?=
 =?us-ascii?Q?FPFyo7uJRg1yetfMrJwBYu5t0NEelkQHsVvjEeOWA4GzoK6o8b0OJe6OFM6L?=
 =?us-ascii?Q?l4GAar9JhQi2ly7kGG5atVaK38jVC8EXAigNOObHDitjtZ/gRjhOOYYppMwF?=
 =?us-ascii?Q?isddLV9IG2JW2hLkibsLUUtFqC/Un703QB6+MCl0ZEwJ1VVTH0dbItGpzqqb?=
 =?us-ascii?Q?FByQIWO4A7ZZEFO4W0iuwQxnKTxeu117Qa9niB1IevPiBgAGKSrz4+M+U2Tb?=
 =?us-ascii?Q?NvobmaqvF+VAwARjARtQVdjHN/kc8bqFjjGBebGA/q+cy4jtBqFtwW1dFqr/?=
 =?us-ascii?Q?AymY06nKQj8ffywLDQSy1MEd/zoUUuqv6xnbEt0vgRPqvXVnPWwG0DpjSdUU?=
 =?us-ascii?Q?lw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2850c54-5c25-4c96-e1ed-08daac34fe45
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2022 09:34:42.9991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7jNRdihmr0LQiR7vGgEDcyMBYeJm9Ul8TlNb31NuqB78gGD5flg5bnNVeb/BsMDKRS7MBF/c0xuMlWxDyKvikA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4616
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,=0A=0AOn 12/10/2022 1:43 am, Stephen Boyd wrote:=0A> This email =
was sent from outside of MaxLinear.=0A>=20=0A>=20=0A> Quoting Rahul Tanwar =
(2022-10-11 00:28:56)=0A>>=0A>> I agree that what you are suggesting is the=
 ideal way to handle such=0A>> clks. If i understand you correctly, you are=
 suggesting below (please=0A>> correct me if i am mistaken):=0A>>=0A>> 1. D=
isable/remove such clocks from corresponding driver's devicetree=0A>> nodes=
. This will make devm_clk_get() or clk_get() return failure.=0A>=20=0A> No.=
 Don't remove anything from devicetree, simply make the clk provider=0A> re=
turn NULL when the clk_src_get() function pointer is asked for the clk=0A> =
index that represents the clks that have no abilities to do anything.=0A>=
=20=0A>>=0A>> 2. Modify all drivers which use such clks=0A>>=0A>> from:=0A>=
>=0A>>      clk =3D devm_clk_get(...);=0A>>      if (IS_ERR(clk))=0A>>     =
     return -ERROR;=0A>>      clk_prepare_enable(clk);=0A>>      clk_get/se=
t_rate();=0A>>      ...=0A>>=0A>> to:=0A>>      clk =3D devm_clk_get(...);=
=0A>>      if (!(IS_ERR(clk)) {=0A>>          clk_prepare_enable(clk);=0A>>=
          clk_get/set_rate();=0A>>          ...=0A>>      } else {=0A>>    =
     // print error info - do nothing, no clk_ops calls=0A>>      }=0A>=20=
=0A> No. Nothing in the drivers changes. The 'clk' pointer will be NULL, th=
at=0A> will not make the 'if (IS_ERR(clk))' condition be true, so return -E=
RROR=0A> won't happen. Similarly, clk_prepare_enable() will return 0 when c=
alled=0A> with a NULL pointer. Please try it out.=0A>=20=0A>>=0A>> But the =
problem that we have is that 80% of the clks that we use fall=0A>> under th=
is category (around 65 clks). And if we follow this approach,=0A>> then we =
will have to make above changes in all of the drivers which use=0A>> these =
clks & retest them again. That seems like a overhaul. We already=0A>> keep =
a internal driver flag in each clk entry data structure and we=0A>> already=
 use it in the driver for other types of clks for e.g MUX_CLKs.=0A>> So usi=
ng the internal flag to handle this becomes a preferable &=0A>> existing dr=
iver design aligned approach for us.=0A>>=0A>=20=0A> There isn't an overhau=
l.=0A>=20=0A=0A=0AAfter going through the code again together with your com=
ments, now i=20=0Aunderstand exactly what you are suggesting. I will make t=
he changes=20=0Aaccordingly in v4. Thanks for your valuable inputs.=0A=0ARa=
hul=0A=0A>=20=0A=0A

