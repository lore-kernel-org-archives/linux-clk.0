Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C1EC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 20 May 2022 16:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351251AbiETQBS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 May 2022 12:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351300AbiETQBO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 May 2022 12:01:14 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23AE43465C
        for <linux-clk@vger.kernel.org>; Fri, 20 May 2022 09:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npkMDmYuSB8+GCzpckv+dp3l8JRcrWHMj/2G0ge6ZZi/6lMwVxl6JWGkxj+90jJi4TzeoS6HVkq1TjboXjqFTpBZ5i+aG3lTR3VLhPDIszXecUK48WsR56EWRC5YpEviz6AvY9liaisWtQEZ2QWwh2tYCYv/sH7J9D/PfEg71ANU0RmyStyULBmFLpFp+ZlnALECnxlMaLqVggImhM0AYXBCfthnYmQyPKO3MNqStTesVyEeeTaz+iRij/+OoyAhNGkNJlnrqvnM7xueRfp7mUo24g4jQOYjUfW6aiSaEo3o2UCb13+bzNRQbtw6bUCYf4sxBVQbs5uI4tDwRpDZcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zx1wq5HLCcx0qyOnRoM9OPXeQVv7kOdTqTU8cnKyLlM=;
 b=hoK+7Vjmr87HCb/WFg8rwcnWwJbkCia1XUeK/YmDv1a8Stud4hb/8muwXEe6rQjOt5KPavkKooWqk0QRApOhQNWOc2jrNBEgmyVP6vOsCCY2XdnqLEN68zuxXJHyBDQPqIRz65wSZiWWaZDms4VZL0nHs3dWn23slxMUqf6m1pwA9m1glz3rxYq+rFDIhBD4xeaoO2yRfGYaDatlbIV0qc3AYUVT8GDI9KJJRs/Fy25dUPNVtayE29gAECEdhu9gtclqiIFlGPtOppTb6etZX+vmPVOYDy93YGylcZI3zEBK+k0V2e+MmOi8YOo9KogIO8GeYWYiO77EphHOESQeAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx1wq5HLCcx0qyOnRoM9OPXeQVv7kOdTqTU8cnKyLlM=;
 b=gYP13joCBkha8y4K0yp9hVPIi1Nt1nN8SGX78pHJ5/d0pVPjM3dE8EVJ5rvchk+ESQVd2X/uyJg5DVXF6JTZOVBo/+YAkgkIJjThCl3AIzRhLzxW56OwrTnJbIL/ctxy7Yvbu5ZLAgAw6ea69U+WBJDO+D84p5I3jnS/3m1qmo0=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OS0PR01MB5842.jpnprd01.prod.outlook.com (2603:1096:604:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 16:01:10 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%8]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 16:01:10 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Markus Elfring <Markus.Elfring@web.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "cocci@inria.fr" <cocci@inria.fr>
CC:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: RE: [cocci] [RFC] coccinelle: Add test for unnecessary check before
 calling clk_disable_unprepare()
Thread-Topic: [cocci] [RFC] coccinelle: Add test for unnecessary check before
 calling clk_disable_unprepare()
Thread-Index: AQHYafMQ1GqDaGPIYUKMw5zLbxeQC60mn8+AgAEtr7CAACLhgIAAANuA
Date:   Fri, 20 May 2022 16:01:10 +0000
Message-ID: <TYYPR01MB70862DC60F78A1F38F8CAA48F5D39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220517133556.6934-1-phil.edworthy@renesas.com>
 <c1d5d00d-d770-530b-abfa-0c1f462e5f22@web.de>
 <TYYPR01MB7086773272C8B95C344E663FF5D39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <46c9b89a-a97f-1955-e231-de42be1d8e35@web.de>
In-Reply-To: <46c9b89a-a97f-1955-e231-de42be1d8e35@web.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4a2828e-a724-4a27-1fbb-08da3a79f503
x-ms-traffictypediagnostic: OS0PR01MB5842:EE_
x-microsoft-antispam-prvs: <OS0PR01MB58429C43D5BEF96296C7F9BAF5D39@OS0PR01MB5842.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lbKxqkzlzmuFzTlM4ak9hBX9Zr4eMLZ5Gsh6eDAh7cORtcvkwnmgTdK9r1elNr3OKLczW33sajjCc9nt94NVeGWi40J9CwHDWddPir40x7eIbuL3igvo0DIL8bEhytK8Jbz8Uz8gBhHZGQcRQLQrqVPxNux/IxV+gLuGH9hk9IJyFQ90UYN58QF5s6k5zWo1deJVkRnpiRkdRobH8aXTzOr65515FnfIR8akApymhDgVbeA3Bb7V+BcwVoU319RCGNblYZtwvCxgnTlf0NTnHz+FbiS/ZVWlpi8IRT/sF19eWXMFXgdOpZroeyf0EWXu+W2utMpwH21QIRaT1lqFfxhN6LwV59U5GXd0+yIiRoNPiCxN4c4BVn0IfeMcErZRkM6yDzfi50tuuxHyQUDP5u1h7E1v2Vz45DczfSBgXN9qLY1F30uar3qAIKjnDJh+M6HUPz4GebMr9udnv9fIVq7H9NqHLb0WNXlyxP3VQlihGqVBVyR2jRKgI8w7+VfaHBeZuKT/9UWnuHvEO+dTJRzyks5VPv5DU4Yy7GuxQBJ/9y9W0XJh2cLBgpIrp2NUGu38Tl+zR2vVL7TtqAfgZhU3/8urPyf/Mgm0DawZfKZ1WVreVwSO9wANj/i7FJrDbADm069iv5h2h86BUhNY2YE6d2dD7HnsJuEdBQpnRffKGgwqq9jzYhlGeWjAF6zEslUBJi2TNFKSYLuBHAuPmH6OTulD2ug7TldPC2W7zq1xCAG5vLNwhk54XqxHzF11IShCsffsvU/loI2W93OHNZ7UIODx7WSzAEGpOvceeVE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(6506007)(66446008)(55016003)(122000001)(53546011)(83380400001)(8676002)(186003)(64756008)(76116006)(110136005)(508600001)(4326008)(66946007)(66556008)(66476007)(44832011)(38100700002)(316002)(38070700005)(26005)(71200400001)(966005)(5660300002)(9686003)(86362001)(8936002)(2906002)(7696005)(33656002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2fdR8UJDpfIp1isYTaIJ7sD4Iq+A73IqwO7rU3AOK4K7q+cyNPR2qrqtQ0?=
 =?iso-8859-1?Q?cX0DZaz+UWWIaSyOpqpUXxb+w9LVvwiGnEBAkVZeRL+F4a8lPCm9QlaYwE?=
 =?iso-8859-1?Q?M9cs3ILWHwAo8SZKm7+ukusWAv1vaQfpJf6MGwllcIM/lPzTAFx/ekea5Q?=
 =?iso-8859-1?Q?GtxsSoB4S+689DnTzPM8i8d7/DRTyxu2pdulswed3M9Dju0qMNspYpxsNC?=
 =?iso-8859-1?Q?GwpDAXZYd6AytvhGH2xkGpKA5RcV3FGirt++LyrruZHSYCjQGUPjdiGnmL?=
 =?iso-8859-1?Q?iBPI2bZW1QNALJtF4ioyT5g7gufebqcraDriOZOpG9t3DIKCSoD0Hqyiyv?=
 =?iso-8859-1?Q?XJoM4yWAE8bPN3sET3eDDiwDOvnHPyv+LEgwI3NgDbTqh5n9UKiSGdSb7F?=
 =?iso-8859-1?Q?tm51yd9qyM3FYYA62Iuy7Vmk2Uet3SvxqAbn6c02/8dmoeUcLWmfDwLh7v?=
 =?iso-8859-1?Q?QfbL49W7xCFyArw4CWDl5RpcWWlt+IOKKM/04kv8xaOs4yAvuDm/gG0Liw?=
 =?iso-8859-1?Q?nhaNx10YK0zYaHn0IGH/6qpWJJ/UHnFBdBy+RNnHP0o29QecaWWTXMjIOA?=
 =?iso-8859-1?Q?AMJZFYCAN/m2ib/X/JIGBxbMliCqnbzx5KbMujQsCfzhatT/Yj+KM+vQAi?=
 =?iso-8859-1?Q?kWXg4hklLtrHs9ec96ta3tCi7c8NV6cLRsdyY8iFR6TihnwDq3OVKWP0Ce?=
 =?iso-8859-1?Q?j7vm7lI9Ja2CnrYC3k/toxZaS1cjTJr2Iv8e2AQr7saICGVQd+ESiPQTmx?=
 =?iso-8859-1?Q?FmJ0K2aFn0my8epeKBlwCjA1u2qyytuBTFvLPdbcUVqlZdxSW1yVmC8Jnf?=
 =?iso-8859-1?Q?q7LGsZek7oOPHKNr9FY4lHeEqdYEV8a1EaglsEYI2hnlxtCY6P2HgtPh0b?=
 =?iso-8859-1?Q?jc3tf8U30xL2VdJjpAD5K89+KiZA5sIARZPLpmASffMfW8YesnNI8IpW4T?=
 =?iso-8859-1?Q?kZjeUWPB6OyM6yURBKHzqKYC6lfq45vohVbv7BnP/UF66z07nqGpskk45M?=
 =?iso-8859-1?Q?MhnhrYFhnAX+De5pO1Op7bsRphl+hW1FkUlxlYPYiHk+HlWPYryYSggNqk?=
 =?iso-8859-1?Q?lYlFqP+a33Y47Ecmev6M4tGhSGvD3ujHVj1bq1dOw3whbeqNVbwqq9UUWY?=
 =?iso-8859-1?Q?vhkQXvc3+0HJBCsASQvhPMsj7SJbhZdZORXGtNPQkOf4yPAyi6KTHgyWoP?=
 =?iso-8859-1?Q?bAgawZPGTpjmRt3rT95qNMlrAUH8MSaOZinvZZqE/xBW8B5kYxEOwP1ZDV?=
 =?iso-8859-1?Q?85BSV2hHMsSqh2RTz416OTG+hH1ze4Jbcu2TVcGOr5o49aceifMXmV0ufb?=
 =?iso-8859-1?Q?SLn2et8+ywfHD5PdFAVRSSrV4Y0OKjhICb/FBbR1Y3kRAxV6nLIO9Rm6w6?=
 =?iso-8859-1?Q?oTsSWPg9I1F4tZjov/oVTozpIg0zhfH0ZPhi8FofNOM0Lw+380qfXbchIo?=
 =?iso-8859-1?Q?sRpPkjYjUkVizhsyaxBy66Wu5XFVfgKKSFmUEZrEsXWcNuvuoDylKl3Q/b?=
 =?iso-8859-1?Q?ByFcxPkxH1UvCVyRYGUH/dDv9s3a4r3fLtOQfPOZH0SiJGS0m2dc6eMfYL?=
 =?iso-8859-1?Q?LQVgMNdgj07rFnw3EhvzkW/VU0S6Keo/xxwIoDW7t9DOg0nEQdy/+vbGDx?=
 =?iso-8859-1?Q?1n+zBuYCcEUBMg9rOTQEHA1QwEqgSMAYn9fQRHMwDueTxcluRB/IMtQIaR?=
 =?iso-8859-1?Q?dchukvCrC0owDP3NTp0T4gWXDouk94KYXIw04y6du7uO+Bq5jJL+uxz+AD?=
 =?iso-8859-1?Q?tnTLBxD9Z/ghRYRdO/AQp6nLGQZj4hLPTMpQ1uciYf+OSyKWW386xXSmwd?=
 =?iso-8859-1?Q?ED2JXFBgROwOMh0pUtm6IZVglZzxj/4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a2828e-a724-4a27-1fbb-08da3a79f503
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 16:01:10.2110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vfofW0XWIzN9X5VJYlcMvW4YwHaiS6yB2SaCIYrSOXTZ/o6/rjwEBWC3nC6LXpW9ysPAfbHq5M08c1Nyyfar7zvKPuF1Bq3Mt9shPEHZxVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5842
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Markus

On 20 May 2022 16:56 Markus Elfring wrote:
> >> I guess that you would like to mark the curly brackets also for
> deletion.
> >>
> >> How do you think about to handle simple and compound statements with
> your
> >> source code transformation approach?
> > Since we only want to transform code that just calls
> clk_disable_unprepare
> > and nothing else, we tend not to have much code like that, but point
> taken!
> > Sorry, but my coccinelle skills are only a few days old so I'll need to
> > work out how to do that.
>=20
>=20
> I suggest to become more familiar with applications of disjunctions also
> together with the semantic patch language.
> https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/82e87d4b0a9c978b0015=
11270c652a93e72fe64d/docs/manual/cocci_syntax.tex#L1039
>=20
> Example of SmPL code:
> (
> -if ( \( !clk \| clk !=3D NULL \| !IS_ERR(clk)=A0 \| !IS_ERR_OR_NULL(clk)=
 \) )
> =A0clk_disable_unprepare(clk);
> |
> -if ( \( !clk \| clk !=3D NULL \| !IS_ERR(clk)=A0 \| !IS_ERR_OR_NULL(clk)=
 \) )
> -{
> =A0clk_disable_unprepare(clk);
> -}
> )
Thanks, I'll have a read.

> By the way:
> Would you like to add a SmPL rule for the operation mode "context"?
Right.


> >>> +@script:python depends on report@
> >>> +p1 << r.p1;
> >>> +p2 << r.p2;
> >>> +@@
> >>> +
> >>> +msg =3D "ERROR: clk_disable_unprepare already checks for valid ptr s=
o
> >>> +check on line %s is not needed" % (p1[0].line)
> >> I imagine that it can be a bit clearer to split the message into two
> >> sentences.
> >>
> >> Can a line break help here?
> > Sorry, I don't follow you. Perhaps you could make a suggestion for what
> > you want?
>=20
>=20
> The support might be unclear for multi-line messages.
>=20
> How do you think about the following code variant?
>=20
>=20
> coccilib.report.print_report(p2[0],
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "ERROR: clk_disable_unprepare() already
> checks for valid pointer. Thus the repeated check is not needed on line
> %s." % (p1[0].line))
Looks ok to me

Thanks
Phil
