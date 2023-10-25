Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CDAC25B6B
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 09:34:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbjJYJe5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 05:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbjJYJe4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 05:34:56 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2131.outbound.protection.outlook.com [40.107.7.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D879A6
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 02:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBDG1rnxHI+J05ZDj1LuINBIpj8cDFwo8XEEKWA4mYTQZQcYoNtn41Ua3IkpDtFYasun5ypbaSuRRG09uL0F6z//1F7EdXV5GSwnjFAuQ63HJBWNMi1ln25zMKCywbZuCZ3zpCX7fToD+8zCKdu92MSF54mcq1q2jvfLmqLpn1HQ+Wif060wrQw43qlaDSZW4LSbeT8D2Wuw8mfNFo0eK32DdHubMnkql/DuOq0fuZ65DBYWtCNGco4MItNp42JNhLxUfgPET437eMwdwgNXsltScY3xHW5nqvFLBdt81NAbOyn00owaOYko+MvKLMVWrnmqMVS5+ys21ytgBp6nvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78nKLJgma9nxCwinrjB5h478gZVMcKwY2my309qF/5Q=;
 b=ECVv2ja4UYTfAmyQGhyMEd/Cu3CqQ7JjrSovsKdUZiyf+1jJa8M4sfWqjJzNQikX5fNM8IOgfbKRaxds7yXqyZkhYPTvymHqR5BzF0lGXdPxP2eoD+SnLGFZ4OaTHZ/X4pdGefT5MxNfFkewmciBmdWtgSJNO4S4rWankM6k0hB7YbmBeBvjp8kOAHQx2EAoAeWClRCVW16ANNe3ZT/0GIFsflYvTJK763Nd/3cf500a7mZk4GskfTsf6BZeUdWIysl3JiSDrtNsbS0FG+Gos0cmoBaCeu9F+knF5Xiua5KVnjDUs5Y40VsAOTIT6u8qe6m1ygOZHc1UwtkrtladZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78nKLJgma9nxCwinrjB5h478gZVMcKwY2my309qF/5Q=;
 b=SdTX4AfnR/mHqf0Oh/KjZvza7drYtFhpDzhIBv394IvaPd0vzX3NM5bE5R4NGdByH7P+/rBXLtwBS4fhiXz/7kV1+2PxBzkNhci2PTb/Wr8yEtZ3xSyF+5lGGF9WG4+KYMgvMgAGEcVnMZ2VKIF/WVvuN1ntKLFcD9acyRRA9Xs=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by DB9PR03MB7322.eurprd03.prod.outlook.com (2603:10a6:10:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 09:34:49 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%6]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 09:34:49 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOrBZcqWAgADDtACAAD9RgIAA+aUA
Date:   Wed, 25 Oct 2023 09:34:49 +0000
Message-ID: <ZTjhLPl+TfeBiX0o@emil-HP-ZBook-Studio-G5>
References: <20230414125207.33722-1-emas@bang-olufsen.dk>
 <a45ff881c83827189be308e2a8e4e13a.sboyd@kernel.org>
 <ZTfapJurCE3T2caX@emil-HP-ZBook-Studio-G5>
 <6ae70c7185bc8806299915181b282b19.sboyd@kernel.org>
In-Reply-To: <6ae70c7185bc8806299915181b282b19.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|DB9PR03MB7322:EE_
x-ms-office365-filtering-correlation-id: 94195e74-4524-46b9-fe40-08dbd53da210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Po63/SME36AvszH50gfBrjjs0l9ccBCGMFJ693zA4LaK28/WB8vC+ffhYeaPDczCje1zQGcYUDtdlib2Gv7DaY0j9edQ6J5FHIxr/ugTBClDA7CNhhHDZoufHveV/WQHjNDytedo9lPn2SVIG4YfXl42t4lfOFY6FRspaz3FLi4KgmbKVSB+FOu9gNTfAd2SNOCn2hENwHE1CqVzOao30VkoS9drjmsSqyz/pvE6ab6sMNTdQ3CgIUAWADnduX8EnD8fugzuF0M8koNyzzCjWUBFnHGBf0eZA2MblPU9WINxVOLkOSQzqrT0CVUItj0uZT2bXRz4t78QZs5++LTNDGTy4lk6AMWkfPtmHXt8V7ThYwLcmdQ6yFJdYMmtofZgk9guE3dvvJZJr2cWtOJON/WbYxIQSA9AAP/h4S4/4WXzIr+Bpnsw18vl44214d2gN2PDy4L8vcBEf5FMhiriymN8LVs7l6k3jjX6t30tvBVIabsECII8RVemjCPVldNRuXaDUyB8Sz/l3bAGYaysPGJZPJU2ePl7V71RjdWwdLGBv88ufcWi/1cdUJduJW7hgOtSAr0+M+/Xjye1DzgZhUVW0UjK3Yqbgk1tV9PW+D9b15CwD6KaJGmtCfLPWdTMBVmBadE+pQje6bedQpqO2Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(136003)(39850400004)(376002)(396003)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(41300700001)(2906002)(4001150100001)(5660300002)(8936002)(316002)(6916009)(64756008)(54906003)(66476007)(66946007)(76116006)(66446008)(4326008)(8676002)(91956017)(6486002)(478600001)(33716001)(71200400001)(6506007)(6512007)(9686003)(26005)(83380400001)(66556008)(86362001)(122000001)(38100700002)(38070700009)(67856001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f0XmKBkD6TwS5LLGvUerfN3iSuG4k7QvVy79wmfzC0Z6WAa7AWJcIXmTHACx?=
 =?us-ascii?Q?2lJ/nh9ygptSn5geCGpLnxd6UvVNY7JOnbW2G8uAJKvB4U8tAzM7hy9SPWKz?=
 =?us-ascii?Q?zHLVaVEaeU4kQN9E73R3UUcDXg/Dw4YiQPbURQpMxR8QFAdBk7ZTmW3mbLva?=
 =?us-ascii?Q?pZeOO3SY1Vn1ieigLe0dtWZ6xD0cVazYQtijp/BCuMIg/YYbaTM28BIq2NaZ?=
 =?us-ascii?Q?NlHqq8slqDsERGiHBaALFnbmCmsQKXfXWRFI9gwe3Bd69FgwcETJ9scEROPG?=
 =?us-ascii?Q?VZiB3QidCArX7BTPp5wwO6m+J8Jw0qrVQgZ9V/Vp38nvM0YkHtlFSVDj8awB?=
 =?us-ascii?Q?08tBJ2Ilm7h5FSjiw0FE0iF1dSAqJSO2IQtjp8PqlYqDok27gqXjE+l5TYL2?=
 =?us-ascii?Q?3j9vT3AIFBSaxyzCfFtO3iTFYDGpoUzPsSzm5uCy32ozP3b1BUhABLjT800d?=
 =?us-ascii?Q?ubs+V9i86pa0A4SOPlcWwig2SdFl0I7latdbX1y7gNdblDRELk5yxnSXlr/g?=
 =?us-ascii?Q?URcLGzI1ClkZi9nNbPXYAxMgBrYeosTeZFyDIMYDsnlKanU9dVbUIFJ8xMql?=
 =?us-ascii?Q?LbD0553itKpjQKhcJAliRGWNjgZiLUAniBG7f+l8Yp5Bds1/O46XmNjtPuzQ?=
 =?us-ascii?Q?cNhQhNDW/2B3HaOr4hOkJ9JNblVroSXqMTtvdDYBHQdpkkCsXX2GqJ+W+mu6?=
 =?us-ascii?Q?+KUpTIH/aGMGeSqb427aT4u4lVVspvEVvtbMFjGlpQNXIuEeHDWUDBACsFSQ?=
 =?us-ascii?Q?OdACCi9IQpRVGupmgwXr2agToif7Rv8eEDKoBnXgADX7sHoUvYQVhHZwAHCM?=
 =?us-ascii?Q?OKydDwn16bxtVTbaREdcb//+zreAk/SHYj9zOY1SIlmsem9UrnPwSQLlSlnX?=
 =?us-ascii?Q?cu8e/t+mj3lG1r5vwhDNm6OURZXNwc1UMkGwENDTNRC8pFztvC/L5E20DQFg?=
 =?us-ascii?Q?67DMZIKhhjVMXJj15GNmN3cREkMmO1PW0EZEr8NKKtmKcsnheMAIFMGXg6AE?=
 =?us-ascii?Q?Y7SjZb/2LeyluQwJk39kHsK0pmA1ryO2TWBwkfISoV/e4yzMFtE5utgNnzRa?=
 =?us-ascii?Q?DTtPJYnMlI5GmDvFD3Es99TftuihEL5HEqXaV0ZB9YnJbyv8r8bPgWosEPAj?=
 =?us-ascii?Q?4FwmbJvjs4w5yt798Ay2pptuS42qARdYVqSWGK4cv+jZReS87Pk2zMNMoqB8?=
 =?us-ascii?Q?1K+f+5P6k2CtgySBvv/ZhK+KJDAgVwdw+scepHC7yT4m26iazTgtxkt+42oG?=
 =?us-ascii?Q?7Y560+iQSgN0zoFmLcLB3wH2R4Pn0d/4hSvmIZY/JCEpHwtYn/Sz7bwFApVI?=
 =?us-ascii?Q?0aM/YtMGTVDJbDWCv7Btv0JlUNRYI9RuOOa+6wGRcFET/lPEezPOb++Vhg3Q?=
 =?us-ascii?Q?dcUva7V+mJ0k8qFJZrGztoCCcdbZGXDaO0FKxAvNHHNc5Nhryw7tVEzmOGuJ?=
 =?us-ascii?Q?YDUSI+Of8Otmsm8vhx/thNOIEYYo8EnPe0HtWsbYwA/bmqqTUiglh/1K4IBJ?=
 =?us-ascii?Q?rAUGszO+925wN8u2j+CrEV5pMFsPHyEnj6HL7AYmh8BefZndlHnVr/Bpaa41?=
 =?us-ascii?Q?Yx2WxfMQjanWchblHXkxNgxbvpF9ZpSxNGLnP8XYsaavLbwY78OR6wTpukJj?=
 =?us-ascii?Q?aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C125E8E8EB691542BE071BF8D9ECF82D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94195e74-4524-46b9-fe40-08dbd53da210
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:34:49.1790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WGHwd619WoJTMkrsryH/CnXVc42vx+Io913SqRZ5u67BVLEggCDTpJ8tO/lXH4aZeyxKu27a9ppZsPPn3+QnYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7322
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Oct 24, 2023 at 11:41:05AM -0700, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-10-24 07:54:28)
> > On Mon, Oct 23, 2023 at 08:14:01PM -0700, Stephen Boyd wrote:
> > > Quoting Emil Abildgaard Svendsen (2023-04-14 05:52:16)
> > > > When initializing clock providers "of_clk_init" will try and init
> > > > parents first. But if parent clock is provided by a platform driver=
 it
> > > > can't. Then clocks will be forced on and OF_POPULATED flag will be =
set
> > > > blindly. So if setup failes e.g. with -EPROBE_DEFER the clock will =
not
> > > > be probed later on.
> > > >=20
> > > > This patch will clear the OF_POPULATED falg if clock setup failes.
> > >=20
> > > Are you actually running into a problem with of_clk_init() failing to
> > > register a fixed rate of fixed factor clk from DT?
>=20
> Can you answer this question?

I wouldn't call it a problem with of_clk_init() because how does it know
when fixed-factor-clk fails to register a clock when the setup function
returns void?=20

> > > I don't understand
> > > why that is happening. I agree it's good hygiene to clear the flag, b=
ut
> > > I don't see why this is failing.
> >=20
> > The problem is of_clk_init() will not wait for clock providers
> > registered by a platform driver that returns -EPROBE_DEFER. Which can
> > result in final probe to be delayed quite a bit. If this happens and
> > CLK_OF_DECLARE tries to setup a fixed-factor-clock with a deferred
> > clock parent, it will fail.
>=20
> Doesn't the 'force' local variable get set to true in this case, and
> then the fixed factor clk is registered anyway? The clk framework tries
> hard to let clks be registered in any order so that parents don't need
> to be registered before children. From what I remember, we want to wait
> for parents because of_clk_set_defaults() may fail otherwise.

Yes, the 'force' local variable get set. But it's the setup function of
fixed-factor-clk that fails to register the clock.

> > Clearing the flag will allow the
> > fixed-factor-clock to be probed after the clock provider has been
> > successfully created.
>=20
> Got it. By clock provider you mean the parent, right?

Yes, you're correct.=
