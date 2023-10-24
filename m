Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4D2C07545
	for <linux-clk@archiver.kernel.org>; Tue, 24 Oct 2023 14:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbjJXOyg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Oct 2023 10:54:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234469AbjJXOyf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Oct 2023 10:54:35 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2123.outbound.protection.outlook.com [40.107.13.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2A6A6
        for <linux-clk@vger.kernel.org>; Tue, 24 Oct 2023 07:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNvmW2cDXsUjxbcou45ubs5ICCYVxbipK+pGfka4JKSIL3eo+vCGvADo70gafxiUxg/+9FdBbV0fVaV585jQwDLItZXfr4zoTDz1ynzxZpv7td0fZRu9FGGzARMK5JUcB2FFCoY6BubITtUtnZd5nPlkxrYXwUFvDuRLITEbhRPXGvpICH5Slp5TYZ6LFJ3/+/Q9/kwUHMLpXMa0WVjfsBOM+No27JeBW4K0QRt6l2USXwGN0fQSisucfi/JPo+9WkZsPPAYQsq3RdRD4sJzw8KczCHufb7TfLxf2KLDu4yNcC2EdsSLA1tFn2wzeBPC01qLk3hedOboNmwVM2kTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqSeLgrcNZg6g36zvE5RF7Yn0bbVded5BEaTZlgW2fQ=;
 b=MNZRFqykFgNqu63mlH4njxv8tRTX55ST0rBKRJ7d6mO9CoIOcZeI+RmUGhcaZixs8kv/qlR+AqR/bSJKMjBW3JdOesrfDGOXpFdydSu8oXNu5TXdkVD9rS7qIiz6EPBcg3BbUey38QoimOgkzkfM6EZG9Lx7xKIY+V0+dacLvO+4zJIVETYG3DQ6srb0cM16gfcku9QorAfxknXjzGAznLvZxe48SJtQy2zih8cufXqkTRAWxvGP5Obuy7v7/EtYANxTQOSjNkob69Phq9EG1G1LrEPujuL5ZAtmS3K9AxkULzFqpW/s3rTsaTKiJ6dw+gTHsAHEARmoZCqf5CY2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqSeLgrcNZg6g36zvE5RF7Yn0bbVded5BEaTZlgW2fQ=;
 b=mVzxFYpFUCbwn7wKiA6//+EyuRYbepCgLWLJt9vIpkLzoLwd4cltONDY/pwVE2OrGyZaI7N4jv4GjH9IRoMUIpScWpNdsT1Rzcu8qC4NjXJn7navf+fpLe+hQ++SgBIEzXZOWiDchXSO2If/FZPrnLO03Lh3L8sxe2sNDw4v9tA=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by DU0PR03MB8718.eurprd03.prod.outlook.com (2603:10a6:10:3ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 14:54:29 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 14:54:28 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOrBZcqWAgADDtAA=
Date:   Tue, 24 Oct 2023 14:54:28 +0000
Message-ID: <ZTfapJurCE3T2caX@emil-HP-ZBook-Studio-G5>
References: <20230414125207.33722-1-emas@bang-olufsen.dk>
 <a45ff881c83827189be308e2a8e4e13a.sboyd@kernel.org>
In-Reply-To: <a45ff881c83827189be308e2a8e4e13a.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|DU0PR03MB8718:EE_
x-ms-office365-filtering-correlation-id: 83da156b-da38-408e-b0d3-08dbd4a11f8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NSYRV+zbhdDBMOFfNYl7bajMM2lERc1H4oUak4KSAuGbqYDBvmGndUzyKSkGaDyWcr0iEdf6DV8SPEq6wpPmX8CEt1kFdXDJ6cFyGepy0+F7RRdYKjmtv2LAVS4GZ2YZnUEqBpiWNGYoVnHJKX2F9JtIpUuOwZX5lPjhgg8ZL24uO+3W/G1s+9WncW8PYiU/bQh+Iqry+3LIDObPThRgJ9U/vZALYTakfxVhC94yOOh1PIvLgymM+Zc4p5DmX11/xegvGoWyIZyZEjI2Y+119ma8bTImlaczvCwDqx6JXJcNWsV/3uK5ANrojpPCnKz5jSOQwhtvBfRci0+vLfTQI8jMhsEVXKrDENvb/tHizuZjAz04nM8F3/Lv2OOGIW6+2Lq7wK1SVhi8Ms7tt/2IkfUhtSR/esnWiye+hFBu9ZRJMZdEKWcfY/k25i67yExFdZfu+B7UlOSDYBfLNRu5CRZ2p0JugpC/khetpkyqzgpLrfanddRecEOREOsUDXV83JKCD/mX2wVVBu/vNsNbKfNaL0zQmQ3ccdk5Nr2eeqp18b8zEOaoiG2iWHmtgIDdIH/aKaKhwVjqjGvey+gYJYk06c9t5IK8uFwDkwg6QVnTp/637PyzPHoZ/mCFOlrC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(396003)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(8676002)(76116006)(66946007)(6916009)(5660300002)(66476007)(9686003)(54906003)(91956017)(66556008)(6506007)(66446008)(64756008)(6512007)(316002)(6486002)(478600001)(86362001)(71200400001)(4326008)(2906002)(8936002)(38100700002)(26005)(41300700001)(122000001)(33716001)(83380400001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DM+d6efILbmqZSvItPgKABaloTyfkQ/2OWxGYBNNDTy2CC3on/zfFi/JUJcO?=
 =?us-ascii?Q?SWJqlnnGKiBT/aFATyXMVJqY1WzstFaOnMeNZ5E/CGqPpX+TST3msnbh4/Ap?=
 =?us-ascii?Q?gWQp3/bQvCzq/czjx0noznuFsprHtjhUauSOTXPUEsHStE1fbGvQikxWAmVq?=
 =?us-ascii?Q?42eKXrbSSOKQ+JJqGVXqksCjbDv8oRuhVCiSw+HSevOPr1QQwNid5PRBV8YJ?=
 =?us-ascii?Q?DLeggxIZpSIejaz25tH44KswxJuc5CrEvg2Y0JDn5JS6OJWwkTT4uUEzzv+H?=
 =?us-ascii?Q?ngYh88OE9Xe5vroY5sHxST16c/10gUtT8qhw6Xo/kUaaozYN/WGldyK0YjVT?=
 =?us-ascii?Q?edu0+MQEYDfyCqNmqPCRifoAmxvLYEXT70FPXTjXSNueQ4E+nrcYh3VyTWW6?=
 =?us-ascii?Q?xKv0+Z8WjctmXyUwef0oGaa17D4eVh+Zcq9nz9KCMDK+OUVzC2Z+Gc/tC6g0?=
 =?us-ascii?Q?eoXyZ9zJ3DFc++bLjbp7kI0RZyjj4UvHbxp5/GN8aY0+GqPCYG6COpKFluCg?=
 =?us-ascii?Q?4txsuK8vZlZ6+pV6ngvNg+jUgc35iIi/0zHz/hoDM9f13oRgL8qb4wsjp3mM?=
 =?us-ascii?Q?kqTFTgl+5Zb7fTY/hX0oD19g4fZ4BlssLpGjKUDH6xYnKwxm7+K4+3yYAnMw?=
 =?us-ascii?Q?BR9yDhyBpT5RCm4U61YivfcNuTEtLIXEkYKfudLE0RmbnQLVTCcfVkcDZhOG?=
 =?us-ascii?Q?TxI1XUTwNyL2qslUyU+TJ6Oz8Pdqhbn5+lG2MMbk6PrJib8NRMoowY7q3YGM?=
 =?us-ascii?Q?rr5hdJT60C4c48z6hqRL3Mt5+1WKv0wM6LUPvN7W+VlxsFYDd+xb4cPzwBql?=
 =?us-ascii?Q?befTPelkyJ1FLxCZFRwuZwOCU0L+dmgYF4B2iMWuAL1os5qRj71OtugNrOd0?=
 =?us-ascii?Q?/yqpFL31vbNUjS2/PkfiiHze8t1UlSJKDls9vb9ReGd+kYerNhQVUMC6JTSv?=
 =?us-ascii?Q?oktCLgtgY7q9z+LGPMYPnROSEqZv61khJ62yQr/JUBizfoLWRLx49MEITT7+?=
 =?us-ascii?Q?XR6db616U3Y7k7ebQ5/6EXaU4BnG6+R+vo8uZpR7oDypi3gxqvjtWGoRFpKo?=
 =?us-ascii?Q?IkwuQQ1sWJNgtrkZnvvHV43djKJKYLJD6azQwp6XW0pUw5zo+XS9PvcLJdY9?=
 =?us-ascii?Q?aB79eEEook0Vir/5s10pfg1RLp4545H6Tmgzw9gqfWURguhfHsz3lWDTu/ZI?=
 =?us-ascii?Q?Y7+/XdxPbvFxLY1E28amu8aIXoR/i2nVqXHAUG4tazmNmSy0vFVxQ2bd/XNw?=
 =?us-ascii?Q?EO7j+TP74ZGN7f8+24nz4gtIJDbWU3O5cMijOGB1eqpbjrhcbNuqZRxXqavr?=
 =?us-ascii?Q?oTHjzEUNTdWj+A7j6JGm8MR5N20J2Y0IoXJcz3NSjFFDW8TYSPPpu9uZW+ck?=
 =?us-ascii?Q?tEVzMSPpDv6eyYqHczmH3x3h+VqIfPluR/Dp0An5Lz04SY1ct/ES5mh84gmD?=
 =?us-ascii?Q?kUZmmWtRBFDk8AHfle0j+sRkLcCdBhtZTFFMRL82cqPu6YuS28FRbV5gK+oy?=
 =?us-ascii?Q?m69ks31MIss6rR9bGupmhzQ284GfNJ2MOkxi5mRus8PdrN5NkUf0soGgv8zl?=
 =?us-ascii?Q?FsH84FdVStLBix0bN5SAX83SjthUx1rvKK9Xz5u5+vvFYWFO/wIKUoeUH0yD?=
 =?us-ascii?Q?kA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <36751857A0AB9940AB35963D8F9DB905@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83da156b-da38-408e-b0d3-08dbd4a11f8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 14:54:28.7081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWB3KK1uDK0TxP9tK5J+cOL7E73w/UMDkdUq4twUXdqEA455FKR7hxNxjm5EIfFGJ1HKw1FWzDT5071LXlIruA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8718
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 23, 2023 at 08:14:01PM -0700, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-04-14 05:52:16)
> > When initializing clock providers "of_clk_init" will try and init
> > parents first. But if parent clock is provided by a platform driver it
> > can't. Then clocks will be forced on and OF_POPULATED flag will be set
> > blindly. So if setup failes e.g. with -EPROBE_DEFER the clock will not
> > be probed later on.
> >=20
> > This patch will clear the OF_POPULATED falg if clock setup failes.
>=20
> Are you actually running into a problem with of_clk_init() failing to
> register a fixed rate of fixed factor clk from DT? I don't understand
> why that is happening. I agree it's good hygiene to clear the flag, but
> I don't see why this is failing.

The problem is of_clk_init() will not wait for clock providers
registered by a platform driver that returns -EPROBE_DEFER. Which can
result in final probe to be delayed quite a bit. If this happens and
CLK_OF_DECLARE tries to setup a fixed-factor-clock with a deferred
clock parent, it will fail. Clearing the flag will allow the
fixed-factor-clock to be probed after the clock provider has been
successfully created.
