Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD735C25B47
	for <linux-clk@archiver.kernel.org>; Fri, 27 Oct 2023 08:56:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345598AbjJ0I4J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Oct 2023 04:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345544AbjJ0I4I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Oct 2023 04:56:08 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2112.outbound.protection.outlook.com [40.107.21.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C687106
        for <linux-clk@vger.kernel.org>; Fri, 27 Oct 2023 01:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQ1SHvrUPPUw6keucHWjj90iFCVZqU6HFKfvY33xUQUTehq5/1DeVwwfiSLZTb/fPO/3Zh099k+w2qQxZZSUKcrkKqJYhbUbm7NYmSJ9uRJ8547f99zWNtai1kk+X+ViixbgfZTQBWo4RyHgq9pun+lZJamBNjeR2aI00QPXjTlIqNYFHPn7MV3TEJlVfXvxhoA1eaaJlFBt/EvoB3uE9TKiYT0Gv1f7mH+BHRU2ilRgWvE4n8EW0oDK/hN5udG0mJFK/V0MshV2GGFCYV2jJk57RWM9FWu89InpinWJ7qMDhURG+Xaq/hwh5VN4NNZNBZfXEaFTkybSHDfmgNhTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTB6vhhhdonk85x9C9KbydPE4HTX28PIkV1mV3tUeGI=;
 b=F183ijFAvkKZStbFUD14t8ViIO5nD3NUBuwS9Hzela/i0vmW9TTtHQ44pvotOePkI9bsMhKvfKdnag2Sp/GE4W5JTt32qOoi4Si14i3kW7FBsGqWXT2mZcxAk4djBJsLWlbjFmcUsw/sAhwXBEV34lc+eYIu13v4aCqfdsOeY7uaQGxBqAbJHSb5bt3FCRuglWVzmzuzy6KK0CAkN4Dm/Pi+g0NGQeJLFeo6Bf4LOs5ho4MdYbX8fJE7JscS6WEtgttBAFIKMji9PzE4dY0NvLtGiQSq2N6yIzESuarDEgepqLRuu4gmILsk1MOb80aQtZD7OJW/Azj+V5Ov/4hQ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTB6vhhhdonk85x9C9KbydPE4HTX28PIkV1mV3tUeGI=;
 b=ShNArDFM8IbUlDbFCpOfSAuoTgvvwzhfCltIPPCgni09kWubBbI1+uIgXKMLk30UxsHRz5IF+yaiUdeIRR3zKNF37jk+mvA8hQb53wl4IyQhZ0MonjiXR+nBl/5RdYwa/e6ChCDwFbnYEO2Oit7E+U8DriuT47pF2aqEHRhYcHg=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PA4PR03MB8271.eurprd03.prod.outlook.com (2603:10a6:102:271::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 08:56:00 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 08:56:00 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOrBZcqWAgADDtACAAD9RgIAA+aUAgADPqACAAMQpgIAAoroAgADjSgA=
Date:   Fri, 27 Oct 2023 08:56:00 +0000
Message-ID: <ZTt7FsnDVcbEmNGc@emil-HP-ZBook-Studio-G5>
References: <20230414125207.33722-1-emas@bang-olufsen.dk>
 <a45ff881c83827189be308e2a8e4e13a.sboyd@kernel.org>
 <ZTfapJurCE3T2caX@emil-HP-ZBook-Studio-G5>
 <6ae70c7185bc8806299915181b282b19.sboyd@kernel.org>
 <ZTjhLPl+TfeBiX0o@emil-HP-ZBook-Studio-G5>
 <ce50bcdaf831faa5dc63f5e505bde1f8.sboyd@kernel.org>
 <ZToz6ztMDkeR+npf@emil-HP-ZBook-Studio-G5>
 <1b3144e39af5c852f33891f313e72079.sboyd@kernel.org>
In-Reply-To: <1b3144e39af5c852f33891f313e72079.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PA4PR03MB8271:EE_
x-ms-office365-filtering-correlation-id: 32bbd39c-e0c9-45cf-513e-08dbd6ca8ad8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z59ljFpaCPByRk1DU/nFw+sjD+3AiizglUuYqa1ZPi/joQnY/yChz7FzV0zLmu8kskOgM2TEI4ACp0J6CsBcxDHOEpaFzVBzZeVptlL1xcRLLnFfOT3fm9MX27StVFzc+lEBuvdUFv43y8Vdj5pmmIriA7e43o42lDRjECXkvDeyTPxMUxVtp3uvUqDTOLaYG+Z7UgORqLObHyh7eNNV7s7E/siw8m7mHnOZnz/lXCoJC0SMq0JxcfOowRsvi9wExpEBhO/O7N3SgDHWSCDV+qkjjHl5EOIDs3LZgHL8pTtprNGP5GfyMPg5hXfSmAuA41COcEdaniu4a2WxPvpAAdwdcPCK5854KuQ2WlzRo8DHTM/TyTuNjyg999Hou9zuRbVN32EUbCR8RExfB2kLstA5pdXy4g3wCdxafrw/0nE12NvEVAzbuTHsxVYLLlBeGL/mIB6680qYUQDyezFhRLLLRdgU867+96vKZG4mpizIHhkJobRYWCTr8ca/PgUn0Wn2LSy3yetYHEQ2a35gWpSXBEX/bGC1R4wo36zNhXG7KZNTqsc2mnCVY0qnpRxl8QWFB1AirKfAwcNgw0OHJFerbsGxw8SnWkl/cqhByE5jYlK1bUkBD19leIsw83FX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(4326008)(122000001)(4001150100001)(2906002)(8936002)(38100700002)(478600001)(66946007)(71200400001)(9686003)(6512007)(76116006)(91956017)(5660300002)(83380400001)(6486002)(316002)(66556008)(6916009)(26005)(41300700001)(64756008)(8676002)(54906003)(66476007)(66446008)(86362001)(6506007)(33716001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c47OqDN4Wf9bNkw52waI9gQ4J6BOtXX/fpw9UB1m9yudjdsgdNIHGtvTvaY2?=
 =?us-ascii?Q?xdj85eqyneUXqOlI8w1Zgsqg1eHmbN7PitjZvBq5s2pGGiD/bEKMHg4XMM3J?=
 =?us-ascii?Q?Cx6q/1xZq07ococt/WNlKDSAgJYf75S49krKaMQwARlKTiswYMP4yVrCFnxT?=
 =?us-ascii?Q?7k8pUjwZ921zVHEV6fSw8iPQR6YCloEZuPkNY/piOplvWbjhISCkaTqEo3RF?=
 =?us-ascii?Q?y04jXlGBIO+8Lo0imQW+sh4RiMXD8yWIYb4tUwHu6npwf/qMwyYzh83RmKIF?=
 =?us-ascii?Q?a5Z/4Fpvb4Is38uscLg2dzvuoLKNHmwjffw7gB2itOEI4Fo62xyiIQRrsqJt?=
 =?us-ascii?Q?OYcc6MdyD6W0Q61KehyITVkxOkjLWxKkQ/8Z5scR+bg1ysML0m+6Npwnaj2e?=
 =?us-ascii?Q?a6yUkS0tE3CrOdu18AX0IK4C+ipI+QlFXZeGYNZpuYzCzoMliuWAHpsS2z/S?=
 =?us-ascii?Q?S4kneaaT93egs0TS1HGHFXoB1jGe/WnwefyxUmM4L509UnnzsGxadO/8bdbJ?=
 =?us-ascii?Q?TFlwbgGo/JJHl2Uj3MLTtx/4Is7zvvkQPqrO1+U0IocClOsyAgLiHexzG8bt?=
 =?us-ascii?Q?Lre9AowS9mJVMmWqc3xaCvKn6t2Y4+RMLnEh/iJhjpQePBWrSq+S7503vna9?=
 =?us-ascii?Q?dEST8iUo7RzkGMhbMnlKgHc7oejPaZNzHc0ALokIQlPXphfyAq10+0fL2IQX?=
 =?us-ascii?Q?e2QA/5EOsMqXByPp3qeR66T5cxjZvRkl6CjvvYXa2MFmIQasnLO9L3ktng8t?=
 =?us-ascii?Q?5Qm4BTIQucNTuX4rsfqRkOkgDjzHQk8jGwNVdKv/F0qjZVVfjOCOeE+baQSp?=
 =?us-ascii?Q?chJy0DO1grS8vopIj7Nsj5CD6dsPhB4C+sIArpy/BrhaJq0BvNGdZjORUAsF?=
 =?us-ascii?Q?TDJewlAaSF6fgeOwBFtWhFVnfY/zVXOUnmWpLUHR9KE440eKwBC/FccRp4u/?=
 =?us-ascii?Q?7gSw/bvRrzvJhEYo2vi66lz1o7j+tVSy4090zAAGgPeaFEHcum9hcILpvzrj?=
 =?us-ascii?Q?rAtEFniSiKawXZVEAWaio3Nlmrk5sxFMfzb7L4bnc696jZjIp5zgoIUgrpfM?=
 =?us-ascii?Q?oS7VlukpS9Yiu/jb0q2W7lunHiL/wC/kJj9HqqM2vhDDs8y6iHOkaE1pe7OW?=
 =?us-ascii?Q?O68px2tjnXJsl7qfUbFytwqrectaAe3O3T6P6ipJTZAnezyDB5wTk7u+Fi+s?=
 =?us-ascii?Q?dUOmnMFQu8vpBVSVBN0WeY+HQcsK42jqZd6VryiWR76hnVmiFqXUn/R7CVk5?=
 =?us-ascii?Q?ENKQ68E4HPcLgFrTF27egJwJznhWyd8Z6zX3y+bvfCSfPXDWh4uPgySftBZ9?=
 =?us-ascii?Q?VHolTTwcG0maTp/Ftg3aB46ZF5FmF0Tvcc66Oqa4Lc2jjmWk0oEDl42yrnKM?=
 =?us-ascii?Q?SVfzQV9H1arJau6d29R0qn8Zak6r1jD7Mw+C01BEj5S32QgPs058AzrRDVv1?=
 =?us-ascii?Q?9z+yWcCCcPcvPjEOLbXnXM6Kx3hOBAE2/IrcUQuGKArp6gtudA26QdyF4V1J?=
 =?us-ascii?Q?MA75FL7k9ZDa+DDHHKFkUF0KuM9xh2fGsqLhOskMU8onPv8eFX+Nte9jfSBz?=
 =?us-ascii?Q?Xe0I4NZzY5J6ay2mAYCfvY+F+TFST15anQ8O21g0rafkCNy4O1V88MAQcKL8?=
 =?us-ascii?Q?mQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A3FE3EEE3962824D8BE3810E3CA11068@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32bbd39c-e0c9-45cf-513e-08dbd6ca8ad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 08:56:00.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/HDtb2Y+aBJfrvVRoA9oVuWoP3oE83EgvVcm6n2pCwFPk/3OHwStGaqMRnIBUk7gbL8IVtJxIX+MQ5qzLK4oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8271
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 26, 2023 at 12:22:20PM -0700, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-10-26 02:40:04)
> > On Wed, Oct 25, 2023 at 02:57:50PM -0700, Stephen Boyd wrote:
> > > Quoting Emil Abildgaard Svendsen (2023-10-25 02:34:49)
> > > > On Tue, Oct 24, 2023 at 11:41:05AM -0700, Stephen Boyd wrote:
> > > > > Quoting Emil Abildgaard Svendsen (2023-10-24 07:54:28)
> > > > > > On Mon, Oct 23, 2023 at 08:14:01PM -0700, Stephen Boyd wrote:
> > > > > > > Quoting Emil Abildgaard Svendsen (2023-04-14 05:52:16)
> > > > > > > > When initializing clock providers "of_clk_init" will try an=
d init
> > > > > > > > parents first. But if parent clock is provided by a platfor=
m driver it
> > > > > > > > can't. Then clocks will be forced on and OF_POPULATED flag =
will be set
> > > > > > > > blindly. So if setup failes e.g. with -EPROBE_DEFER the clo=
ck will not
> > > > > > > > be probed later on.
> > > > > > > >=20
> > > > > > > > This patch will clear the OF_POPULATED falg if clock setup =
failes.
> > > > > > >=20
> > > > > > > Are you actually running into a problem with of_clk_init() fa=
iling to
> > > > > > > register a fixed rate of fixed factor clk from DT?
> > >=20
> > > Sorry, this was "fixed rate or fixed factor"
> >=20
> > Fixed factor
> >=20
> > > > >=20
> > > > > Can you answer this question?
> > > >=20
> > > > I wouldn't call it a problem with of_clk_init() because how does it=
 know
> > > > when fixed-factor-clk fails to register a clock when the setup func=
tion
> > > > returns void?=20
> > >=20
> > > Let's not debate the semantics of the question. Does the clk get
> > > registered with the framework during of_clk_init()?
> >=20
> > No the clk doesn't get registered by of_clk_init().
>=20
> Thanks!
>=20
> >=20
> > > >=20
> > > > > > > I don't understand
> > > > > > > why that is happening. I agree it's good hygiene to clear the=
 flag, but
> > > > > > > I don't see why this is failing.
> > > > > >=20
> > > > > > The problem is of_clk_init() will not wait for clock providers
> > > > > > registered by a platform driver that returns -EPROBE_DEFER. Whi=
ch can
> > > > > > result in final probe to be delayed quite a bit. If this happen=
s and
> > > > > > CLK_OF_DECLARE tries to setup a fixed-factor-clock with a defer=
red
> > > > > > clock parent, it will fail.
> > > > >=20
> > > > > Doesn't the 'force' local variable get set to true in this case, =
and
> > > > > then the fixed factor clk is registered anyway? The clk framework=
 tries
> > > > > hard to let clks be registered in any order so that parents don't=
 need
> > > > > to be registered before children. From what I remember, we want t=
o wait
> > > > > for parents because of_clk_set_defaults() may fail otherwise.
> > > >=20
> > > > Yes, the 'force' local variable get set. But it's the setup functio=
n of
> > > > fixed-factor-clk that fails to register the clock.
> > >=20
> > > Ok. What part of __clk_hw_register_fixed_factor() fails? Or is it the
> > > caller, _of_fixed_factor_clk_setup()?
> >=20
> > It's the caller _of_fixed_factor_clk_setup() in of_clk_add_hw_provider(=
)
> > after __clk_hw_register_fixed_factor().
>=20
> Ok, so is of_clk_set_defaults() failing for some reason?

It's __set_clk_rates() that failes with EPROBE_DEFER when calling
of_clk_get_from_provider().

> Can you provide
> more details about the DTB, or DT node being used?

The clock parent is the master clock from a SAI where the MCLK gets
registered in the SAI driver. Where fixed-factor-clock's will create
bit clk and frame clk.

Extra details: SAI can provide BCLK and FCLK but the codec needs FCLK
running all the time and the SAI can only keep the MCLK running. Like on
pause/XRUNS.=
