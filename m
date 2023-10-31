Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ED6C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 31 Oct 2023 09:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343742AbjJaJSV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Oct 2023 05:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343740AbjJaJSU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Oct 2023 05:18:20 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2123.outbound.protection.outlook.com [40.107.249.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7A49F
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 02:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOR0mSuXA3Re1l8ko/4/XGdz7c/PLldYihqu1SwYkS09Kf7GBey2sRIzVBTgjpNZkyRMZzqpvr3XNYm+SZ8+vkFW1cZWYsFc+4ovOF6XgKAvEDGp0y1d1OwXaq9ksP+BynpJvCTBQ93NBp4c+uLYjZlsaAiBNR4YwI5pGcTd32PQQpEU2Fe9R/HD757xIg2QCm5v8iCafVSMIBV+qD0nHY/+cCt5geY1mVwzIKvoqPEhEUQgZdosoEVe0E3TWTSe/B6Szh0ro3v7B4N2kBVbdO1BY+uZtE0kpFQZTM6Xx5mXw7yTux9syY4W5wW9uOpLbVuKZEESM/AaS3XMD7Epfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt3OapL9N6Gp02W44IowOLFOiTgYAYx6Kzin7tbJ9/U=;
 b=Lh1pEwIeNFhr3RmmyA+Y2/43d899P0Dr7JiBZ+RBPqOaUvD5w4PmAzcMR2whFdveJS9DyL0Y64jdle+gyv8Yt0/A/kJfszoaL8kxV+0NAHG2GWnNQg8+l2mnyoUY3gXqkqni3M/c0I0+oDp+89PCUwNj7S8OcSxqQWU3Cv7BGf37GYDfXV44B7CMWhw0+q4jYlqCiSkWhR/zeQINZps9LJ1NilLRXjH9CSHIGqyuwRh8ECWG61KzjLW18VS/f6y8utQaYx4XGdsNYXJCRw0uACVP4twUGjfT+Uq5cKKerhtgSHOd35RcvviRPCtODcsfPsQ85MPQGG7zuEtUaV6GCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt3OapL9N6Gp02W44IowOLFOiTgYAYx6Kzin7tbJ9/U=;
 b=Kv+mI5i/PzIvjQ8og6hEfnJ9XB4XxOmUhMIsap5wqDf+UGsDW953Oxqsgepv6MmFvwMWNjcExZqDtUXoVkxcmILN1fI0NhjYqafRUQY3m812kxrp4IGjyTiNbi2BMEjTC7E3jIzvVc5FFbhqBtKqqFq+CrUgBdZE4g2gqJxf04s=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by DU0PR03MB8671.eurprd03.prod.outlook.com (2603:10a6:10:3eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 09:18:15 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.6933.024; Tue, 31 Oct 2023
 09:18:14 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOrBZcqWAgADDtACAAD9RgIAA+aUAgADPqACAAMQpgIAAoroAgADjSgCAAS3GgIAFIcWA
Date:   Tue, 31 Oct 2023 09:18:14 +0000
Message-ID: <ZUDGTf49E93RCbjP@emil-HP-ZBook-Studio-G5>
References: <20230414125207.33722-1-emas@bang-olufsen.dk>
 <a45ff881c83827189be308e2a8e4e13a.sboyd@kernel.org>
 <ZTfapJurCE3T2caX@emil-HP-ZBook-Studio-G5>
 <6ae70c7185bc8806299915181b282b19.sboyd@kernel.org>
 <ZTjhLPl+TfeBiX0o@emil-HP-ZBook-Studio-G5>
 <ce50bcdaf831faa5dc63f5e505bde1f8.sboyd@kernel.org>
 <ZToz6ztMDkeR+npf@emil-HP-ZBook-Studio-G5>
 <1b3144e39af5c852f33891f313e72079.sboyd@kernel.org>
 <ZTt7FsnDVcbEmNGc@emil-HP-ZBook-Studio-G5>
 <ef68b9e7704ce5f8a02a7067703b000c.sboyd@kernel.org>
In-Reply-To: <ef68b9e7704ce5f8a02a7067703b000c.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|DU0PR03MB8671:EE_
x-ms-office365-filtering-correlation-id: a50134fb-e37f-47a6-74ff-08dbd9f24fc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CKoj0Xfw6MgtOXV9FPhwbozm7lNhHbO8o/5R9VB/7gX6A41jDnKgTCrtf7PI02bsmKjvOSynmri/IUtmBpjThotJmPFKKGdn5nON0HQgsr9ARGbqPJdhI/hsIcckTKmx7/DovPYqUFOnKtnevoY9D581dyrNZOY1YDaDnGVsXZesg2qkSZxPDoD9vTVsxhs0tPfSFiZGjAes4D7dX8Tref3D5RhG7gPHpJnFYPRK+Pd9yeuvnbzBBxPXM8uYNFXrh/AIZ/LqJS+f3Uz+LlHHDSlfiK7N4RnnGFSLHzJACZ4ifcdrFa/HdMGStnKv7fTW9n8fmFT3MnHRGmiwwiTy495WhmsLjkZwjetEbvYhjZDK3vISYQ/RJ0s1UnL3cxmz7fGzYF8WmAt6Tvs8Y9Xhm0uQfg1mFPhHynM6Eb1njyww/chq/+L9pfYMYLLIslFYfHrkI9jv6j8QlsAUGIO9butdbI57USThtslehMMFRXdJV8vA7OYCqEtXtesWB6fnDwiQsBUU0pUGkc+Vaz732WjMY0wb3gz7A1usSz2Gkkgfy0VCYIvmhc2FtOtlxL2amMZgu8CQ+XBJMgyw3W3CZpcUggflpL2Es7/rnJ6oc/jN2f/xFR7wNDIbalhHlM0e
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(38070700009)(9686003)(6512007)(26005)(71200400001)(38100700002)(86362001)(122000001)(4001150100001)(83380400001)(2906002)(478600001)(6506007)(8676002)(66476007)(6486002)(64756008)(66446008)(66556008)(6916009)(5660300002)(316002)(54906003)(4326008)(8936002)(66946007)(33716001)(41300700001)(91956017)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hf6MAZ2XJSBeJt7UYK+NyqfqOwftBV0j5EienIb7JhvkVWF/lj+oo4Xu3S+K?=
 =?us-ascii?Q?OrlGJLM/oDxBU8MZgQalrqUz9BptV+x616xtKNFl3vQCGtY5K8BIhn5/zE0o?=
 =?us-ascii?Q?cckVPwIBir4Uevhmgi3se7pLF2oBHLPAx6tG6zM9BX65nIkwYIAMs2bNxnoo?=
 =?us-ascii?Q?2n70E8nPBt39/e7tjK5sukNcPSkH547DQZfnMpcS0fKGA7bU8UZbVdjO40HM?=
 =?us-ascii?Q?cbE1LJ5JQOJxHHNHHmAxjotpK+94iurnN/lWB2R53jWKPuHQ54F8Tu7x/iWK?=
 =?us-ascii?Q?y7wUpQwQySXugKRjHCXFzMbLe31gqbu31mHYGMp/n+qoj/gSCegM2R6EWShK?=
 =?us-ascii?Q?TT8rNyrNMFtLCmb87ZFSaCijCz7GAd93MA9Q99BYe0jHD+NQwywbQozyHKau?=
 =?us-ascii?Q?PKun1iTuSSJZgSJTvQedsxxxHAmJrSoQnOI3QyY4h/PnWy8w7B0d/84Xa2ZG?=
 =?us-ascii?Q?vSVAU0HL9sWGmEMbW4KgteOjN1IN+Fc/Zk/6hvMcHccekUXasXmJu6YOOOPk?=
 =?us-ascii?Q?jZ0y1ygTD4a00ruvyd8SdgPsMrPo3OO6V1xp/HXqCCKY18OICcLHwTp7WE97?=
 =?us-ascii?Q?Z1R/DFfdBphNS4+/hoaWyPLmqwrbXBHRYXyn7mje+Ad1aRS0OY5xs9MARdcl?=
 =?us-ascii?Q?/00RmEtMGIURTAszsJGQ8yRfBTzwzNEC0d7vVF6ZKGMwD2tPf8YErROWB304?=
 =?us-ascii?Q?n9VzPqyClxK5yhZ3DkPz2i1P40zCVYT8PVRY2+Xx3VIm4WXyBmW9yivpqZZm?=
 =?us-ascii?Q?YFqHTHd1nMh5Tw7p32pf3AuCR3jfzlaXV+1ETAKH3HRvNjczr/EyTJGL22Hf?=
 =?us-ascii?Q?H1Tn1hZExdgcPVEgo6EwUJs5kolapYZRU2T/lAFTgi9FnpQd1AD9gDvKhaHp?=
 =?us-ascii?Q?EKd3SwPm5UgPBbu61j50CPRIxgz2IFsw9zskcrzoCN6W7HTVfYMVK3FuGLSJ?=
 =?us-ascii?Q?BOYgembunr6DFNo9tMDwqYkABVg/9CV4cg3R/7BAh/p6hMTSFEwf1+Vvx5wK?=
 =?us-ascii?Q?bum2WGNeqAnHM18WYyo6zEscaS4jzNFYRuVJkZYQOmLI/q9t6JixBSyyh5p7?=
 =?us-ascii?Q?GQh3w5DIe49awoTnr3VuwVAI0fWHjUok+seui5cUli3RmQtSycrWDAtd/W+e?=
 =?us-ascii?Q?8bHYkX3dHAg4mjUbxGG/RM/0RfSIGA8g7MgXkum33eKZyL4D6RI1Mq8E7XUO?=
 =?us-ascii?Q?V8SbMuAQ3/Lv/YV7C8523JqJBkndTSwPIEN4TBw6sjnecBVNIGZ4UQP/RXUG?=
 =?us-ascii?Q?AKlby8Sccdwdz8hKvrY6p7TG87ddlSGbF1mt2YXDimHpyx0dtZwEWbIPX2dc?=
 =?us-ascii?Q?cwx1QyPd6/v0am/fKyCGdydHqxoaLK6MoMKx6rCJ7bgpqJJtJhODsUMxDVdp?=
 =?us-ascii?Q?W5o/6U7yuszpuA78XbMLhLf18BTIxSQDzECykRz8riHV3PPzfO6S7L8mhCeW?=
 =?us-ascii?Q?j330gkMPUqAKFojsqoQ1vYeZiUTv/3tPK2SWH+Tz3kDW65FgcAN26Y6XiTT7?=
 =?us-ascii?Q?H5bzwOpfH0KP3gXMrLWeKn+UkSGnlmVZqfP9PQw9/YQAJ0Guw50XFjiZgnnY?=
 =?us-ascii?Q?6/+H4BzpNpABqYBm5UtaAkhjMXiCK1gd8zlJfF9R?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A08F7591FACB6E4988A2B0D4245B073F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50134fb-e37f-47a6-74ff-08dbd9f24fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 09:18:14.6342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/zIjtJ+W2GrMx+1HlOvDzvBIti6sSWHR6RqE4iWQPZopO3kdsPZEBUVRyyKgfNXedssRKmtsxMSnwdK2KXnFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8671
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 27, 2023 at 07:55:55PM -0700, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-10-27 01:56:00)
> > On Thu, Oct 26, 2023 at 12:22:20PM -0700, Stephen Boyd wrote:
> > > Quoting Emil Abildgaard Svendsen (2023-10-26 02:40:04)
> > > > On Wed, Oct 25, 2023 at 02:57:50PM -0700, Stephen Boyd wrote:
> > > > > Quoting Emil Abildgaard Svendsen (2023-10-25 02:34:49)
> > > > > > On Tue, Oct 24, 2023 at 11:41:05AM -0700, Stephen Boyd wrote:
> > > > > > > > > I don't understand
> > > > > > > > > why that is happening. I agree it's good hygiene to clear=
 the flag, but
> > > > > > > > > I don't see why this is failing.
> > > > > > > >=20
> > > > > > > > The problem is of_clk_init() will not wait for clock provid=
ers
> > > > > > > > registered by a platform driver that returns -EPROBE_DEFER.=
 Which can
> > > > > > > > result in final probe to be delayed quite a bit. If this ha=
ppens and
> > > > > > > > CLK_OF_DECLARE tries to setup a fixed-factor-clock with a d=
eferred
> > > > > > > > clock parent, it will fail.
> > > > > > >=20
> > > > > > > Doesn't the 'force' local variable get set to true in this ca=
se, and
> > > > > > > then the fixed factor clk is registered anyway? The clk frame=
work tries
> > > > > > > hard to let clks be registered in any order so that parents d=
on't need
> > > > > > > to be registered before children. From what I remember, we wa=
nt to wait
> > > > > > > for parents because of_clk_set_defaults() may fail otherwise.
> > > > > >=20
> > > > > > Yes, the 'force' local variable get set. But it's the setup fun=
ction of
> > > > > > fixed-factor-clk that fails to register the clock.
> > > > >=20
> > > > > Ok. What part of __clk_hw_register_fixed_factor() fails? Or is it=
 the
> > > > > caller, _of_fixed_factor_clk_setup()?
> > > >=20
> > > > It's the caller _of_fixed_factor_clk_setup() in of_clk_add_hw_provi=
der()
> > > > after __clk_hw_register_fixed_factor().
> > >=20
> > > Ok, so is of_clk_set_defaults() failing for some reason?
> >=20
> > It's __set_clk_rates() that failes with EPROBE_DEFER when calling
> > of_clk_get_from_provider().
>=20
> Thank you for fully describing the problem. These sorts of details
> should be in the commit text. It would have helped avoid this back and
> forth.

I agree. I will remember that next time and thank you for your patience.

> Coming to the patch, I'll have to think about this problem more. I see
> that we call of_clk_set_defaults() from multiple places, and sometimes
> multiple times (e.g. if a platform driver registers a clk provider it
> may be run twice). And we don't allow of_clk_init() to know that things
> have failed to register. It's quite a mess! We also don't know if
> failing to register clks during of_clk_init() is fatal, or if it will be
> ok to wait for a platform driver to probe later. And we blindly call
> of_clk_set_defaults() during of_clk_init() even if it fails. Ugh.
>=20
> >=20
> > > Can you provide
> > > more details about the DTB, or DT node being used?
> >=20
> > The clock parent is the master clock from a SAI where the MCLK gets
> > registered in the SAI driver. Where fixed-factor-clock's will create
> > bit clk and frame clk.
> >=20
> > Extra details: SAI can provide BCLK and FCLK but the codec needs FCLK
> > running all the time and the SAI can only keep the MCLK running. Like o=
n
> > pause/XRUNS.
>=20
> Having assigned-clock-rates on the fixed factor clk node is rare. I only
> see arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts which does this in
> mainline. Why do you do that instead of putting the assigned-clock-rates
> property in the consumer device node for the fixed factor clk?

Because there's two consumers. But I have just confirmed it's indeed
enough to just have it in the consumers instead. Thank you!=
