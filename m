Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B12C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  5 Oct 2022 09:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiJEJgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Oct 2022 05:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiJEJgK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Oct 2022 05:36:10 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.133.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60DFC2936C
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1664962565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=NdBRMw3Yy37NtZ2ieMtYhF7+LkkD8kcSoReu5tYTjR4=;
        b=JMkuSxOVHUn7EumgIEGC/tS0PwZ/68g/lpbzra/RChLk77Sc2R7BFfmFqoUIXyEjm+ua80
        40agp2ChahDJnQ+hIxw4fqUm3p4nNPWbq7rrYzf97CAoSI7nK1VKRM0GhyzzS7vi13+b0k
        9DCgtGfU0PfTw6EmJ4olxeXCSn9v4PAIxhtTTEMKi5wUHNVZkdj54GJLs6Pebx6lz13uXu
        L88k7PGJtFbElzTToSaq1K0fE9pCyIB3MyJ/eMoTEJKFAcL8LSu6MWHCsvtaIHjBObmiJJ
        Wt0QbqeARBUQZks7KK5CN17kDN32LCtB5B1oIQ7vAmdennt/tH+5+deBgfl12g==
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-ynJklXcKM0i35GEhUtQ1Sw-1; Wed, 05 Oct 2022 05:36:03 -0400
X-MC-Unique: ynJklXcKM0i35GEhUtQ1Sw-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by SJ0PR19MB4416.namprd19.prod.outlook.com (2603:10b6:a03:280::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 09:36:01 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c%6]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 09:36:00 +0000
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
Date:   Wed, 5 Oct 2022 09:36:00 +0000
Message-ID: <MN2PR19MB369301BFE8DFB56C348CD6C0B15D9@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <cover.1663827071.git.rtanwar@maxlinear.com>
 <5a88bd5a9e93cc6e794080e5cac821ae0c27ec56.1663827071.git.rtanwar@maxlinear.com>
 <20220929001745.A4F9FC433B5@smtp.kernel.org>
 <MN2PR19MB3693EEC08EAC5370F1D195FBB1579@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20220930010123.38984C4347C@smtp.kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR19MB3693:EE_|SJ0PR19MB4416:EE_
x-ms-office365-filtering-correlation-id: b5409c2b-e6d4-49be-68a3-08daa6b503c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: OlYYKuXergn1uTvv723AjI2qW4f0T8adVmTFuBu7AGPIt1TshWHohJq1Q0pKhr6RqLMKnTbzGyXhkoqxWFKQokpZvWk+CQzFMOTTl81GWlsJrNpsqbFwpFjlagbKx5HynUHSo4BYae16aoCIkhdFTTBvmmkCaTVQhJJ+tFUSciO89LIFZHMTziI5/otfdGPNabPOjtE1klvKGutPBtBKXuVttxoszEv2U2D5sy9F2oPbwl+IPVmidF5jCq8P3B+UKcW4Ujgac8TarQfTjSOj0TLRW4UN/gre+wOG05tSZZkqDraXhX+Qi9gymxN+MPvSP2DfcgBt3bj2vvx4tHOa41SWbStRzwI3LPxZJ0VAeJvqut7eDjMS+Htm+Q3fa7egKhtTBmXOqSn8GGGDtjhjL6nYbsPEXGxxqaDF4HbcYEowT7FZYWAF/prCgADYJHXvd86NYFuZIzs4y/wv2CL/niLSUgZ5DseUn61+uSGUkPBixqur8sHTfTXVrCczOx3gQJlEfz1xC9pRvFOaVmHHJm4Bl2p4xVHwxc+egjvvURbW3hTAs6ZFMYypfz/n6CE7S/zzWm0g5Qxh4fmszxo8ivkDll4RxWqcwzGh3mKmr9QOHTSi23TJ7n0zareCh3wDOhXZJApK05Wxk/kjQwBUYbUxoywZ+w9RyFQQ/CInl9rxc+CXLKURFFvqOFiRXoAIMCvZMpQ/qhqM4lWpI1XBvhQ+ETL8A0vsXK8dJcEB8r3EGdsqb6BNnsjQgoEKWS2eIWV0TdHphpwP8YLJfe/8NA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(451199015)(52536014)(66446008)(64756008)(66556008)(66476007)(8936002)(41300700001)(86362001)(110136005)(33656002)(38100700002)(122000001)(38070700005)(83380400001)(7696005)(9686003)(6506007)(53546011)(26005)(107886003)(186003)(71200400001)(54906003)(5660300002)(316002)(66946007)(76116006)(4326008)(8676002)(91956017)(478600001)(2906002)(55016003);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M19UhQ2IgcYLsxBSR4Ndly7J9sn0a6xw/we+JdjpQdfe+5EhzRCLPR3BrTNa?=
 =?us-ascii?Q?2lOUSqrcHFamxlX0tFKsawfBj3TemSTTFiy+P//ZYIqNZF7lQEmtVnlMFv3W?=
 =?us-ascii?Q?G4Bv+BIovmn5Yl19x7f4F1i7gL3wQ9KuOTeQN8JpmooEfmMv+MB4KL1fEs/S?=
 =?us-ascii?Q?VoHD3xix0EizLD4j7RYA59cKfsk20ONW+qBwavvVkjoM6RrI+6YTjLXUG39z?=
 =?us-ascii?Q?cZKA3bCBKNQY1x6yrxuXMS+iZsDc/aYpTrokZoBlqTcpVj9GvM46/Z1Uu7qo?=
 =?us-ascii?Q?aMFlqzYxue04Op89xL752LVMEFukMmXxrSWCMMEUY2qN1PN8PkaNNqyaMXY4?=
 =?us-ascii?Q?to4532ZOVbVrb5frhTDbkrjP/1kqRI3/Wv5A9RuzqQGQFS//9Fjq+UbX//+v?=
 =?us-ascii?Q?Pat/VAd/AEUAFpMS1OLOtynaCDScjt7csw63SauGj19ON6erbDEWe44+LB+G?=
 =?us-ascii?Q?dpNAB6U0yILqh0yFyt3vHE0MaBMIA6Z2IC59i1j6ddhYMjGnj2TmJy+eaE+G?=
 =?us-ascii?Q?Yhn+T73g1KphPUxf0E+kymgoph8Mnq8xsQfYqajhDYIfF9/OWX1jB7F/PeuL?=
 =?us-ascii?Q?XWXqtr0wD8C0t77vrTrYVQ9RvRzv/PYZ9zn1+UQoR5iW9lyt1JMVSV03JGaK?=
 =?us-ascii?Q?MWahwi++N9miPSWSqigGAaHkXvWJQxkQ3FixBkD8uCb4NJfu+ItLBh0zMeib?=
 =?us-ascii?Q?QwtbeMPpjc8Ky6kVkDkpiRCrOg2o2J3wu3vTetxliFy/pPfC2OGS3rb/k/17?=
 =?us-ascii?Q?7M7xTE2r1PcjvaoJtqFxspoXndHjczhxgvlhAKdc71FQE+MR9nynOX4fMXF2?=
 =?us-ascii?Q?K7U52/hHqr17cW0Te/vfRz3NC+hvm8xJcBjU3vD5JUaMRBEkekTIbmmPDkuT?=
 =?us-ascii?Q?PlPEyfvEYRbLd/C1V9QjQkfQDk8tK03rBeEz4F8JBEUYSnyHOUdmlisXTsLb?=
 =?us-ascii?Q?HbkW1XkLUZTy1qgdOlH5q0C4FBUKih2iwnUA0C3AQbktFZpnGCu9jy4hBL7k?=
 =?us-ascii?Q?rJtwhcm0ntlQVbyEXLnJYPbtwwKzzbfbjQ1fL6CFREQz7+BDpXT5CDTnzJrr?=
 =?us-ascii?Q?bf0BY7tv6bAOEgpcszKaO0gW5voWVJ+BXsvnN6pxNcB+CqQ7ojzvtNeJ4Ldg?=
 =?us-ascii?Q?3qZxiOEBNJJX12aUNvoKlXzkLiSBp1VEQue/mYhh5g86h/8oQRiDoB5FXA+G?=
 =?us-ascii?Q?NiDLxEegyLFSWx4qsXvuSZEQOSXIi/HNVUqYKT48GWbx/XWDmxt0EN37wv/n?=
 =?us-ascii?Q?ZEvEIb8pATcx7dbp/VuUw9D+xwYlefgaBNsT2LkG5ygrAev8GaFUGKXj9W3j?=
 =?us-ascii?Q?sEYG42r9bo0c7SuwATDifVTXymIJFxbWepZZvN3rMF6hJt4B3EJiDWaC/nWI?=
 =?us-ascii?Q?AWaEH3Dseue8vbXUK8PcSmu3RPpTn3rECEtCYyXbEU8yyImyq0JRqwGToXMz?=
 =?us-ascii?Q?oyHQfzx1C1eeGfWAreW1gCCTQ3Q/z7kXclrBcPO8ofi2x+DpqBJaPFAoTyqe?=
 =?us-ascii?Q?+A2LsGi992T+pKimDJuXCxf6RazWPIJ7kIt142KRQbhFlRlznFIGfJRavzy1?=
 =?us-ascii?Q?tg3fmTQ1rsTiS8/n1Wc1vh5UFbalGWzMMRh3MboHwPBIeYyN4dqPmUW+tC0I?=
 =?us-ascii?Q?yg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5409c2b-e6d4-49be-68a3-08daa6b503c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 09:36:00.8856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XShQoyMZDhjBJ+OWh7XSkHroYG70j4XA7SrD2N6JoldjW5yPRnswMQOl40ezJ7gcWqB7IRcTgjxDAjvWAUm6HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4416
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,=0A=0AOn 30/9/2022 9:01 am, Stephen Boyd wrote:=0A> This email w=
as sent from outside of MaxLinear.=0A>=20=0A>=20=0A> Quoting Rahul Tanwar (=
2022-09-28 22:45:59)=0A>> On 29/9/2022 8:17 am, Stephen Boyd wrote:=0A>>> T=
his email was sent from outside of MaxLinear.=0A>>>=0A>>>=0A>>> Quoting Rah=
ul Tanwar (2022-09-21 23:24:26)=0A>>>> In MxL's LGM SoC, gate clocks are su=
pposed to be enabled or disabled=0A>>>> from EPU (power management IP) in c=
ertain power saving modes. If gate=0A>>>> clocks are allowed to be enabled/=
disabled from CGU clk driver, then=0A>>>> there arises a conflict where in =
case clk driver disables a gate clk,=0A>>>> and then EPU tries to disable t=
he same gate clk, then it will hang=0A>>>> polling for the clk gated succes=
sful status.=0A>>>=0A>>> Is there any point in registering these clks when =
they're not supposed=0A>>> to be controlled from Linux?=0A>>=0A>>=0A>> As m=
entioned in the full commit log, only reason to register these clks=0A>> is=
 to be backward compatible with older versions of similar SoC's which=0A>> =
reuse the same clk CGU IP but do not use same power management IP. Such=0A>=
> older SoCs also use the same clk driver and for them these clks are=0A>> =
required to be controlled by clk ops from Linux.=0A>>=0A>=20=0A> Why is the=
 clk driver probing on the new SoCs? Is it providing=0A> something? Can we =
detect that the power management IP exists and not=0A> register these clks?=
=0A>=20=0A=0AWe discussed in the team about not registering gate clks at al=
l as you=20=0Amentioned. But if we do that, all peripheral drivers that use=
 these clks=20=0Awould need modifications so their probe does not fail due =
to failure=20=0Areturns of clk related standard calls for e.g devm_clk_get(=
),=20=0Aclk_prepare_enable(). These are standard calls in probe for all the=
=20=0Adrivers and a lot of them use gate clks. So this would need a lot of=
=20=0Achanges with possibility of breaking working functionalities.=0A=0AAl=
so, i incorrectly mentioned about the reason being backward=20=0Acompatibil=
ity with older SoCs. Main reason is to support different power=20=0Aprofile=
s use cases as per end product requirements some of which might=20=0Acontro=
l it from clk framework i.e. this driver. We keep a internal=20=0Adriver fl=
ag just for this purpose to provide this flexibility depending=20=0Aon the =
use case which is what we have used here.=0A=0AI am sending v3 with more cl=
ear & correct description about it to=20=0Ajustify the need for these chang=
es.=0A=0AThanks,=0ARahul=0A=0A=0A>=20=0A=0A

