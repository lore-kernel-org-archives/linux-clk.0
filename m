Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69ECDC77B73
	for <linux-clk@archiver.kernel.org>; Wed, 19 Apr 2023 07:42:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjDSHmf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Apr 2023 03:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbjDSHlv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Apr 2023 03:41:51 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2113.outbound.protection.outlook.com [40.107.22.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E13BB96
        for <linux-clk@vger.kernel.org>; Wed, 19 Apr 2023 00:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFsBcnqhPWcmKZhHBnQCGRKmHVT+KmTb6s5DWaftqcmVi2OWe1Mdj7IaCpw26Rpv2Km6i7pbo+InKqUKx9FK/h/z2WlHQ6pD0kSfxu9iRIFkt8GilVrskZCHv0K3MOdEIlGEGlz4kw8XwzuMKqUlPp/sIgDTxEbXZSXMb9gmsZK6uxVpsIRW2KM2Wbx/SN8lLsnuenlTMzYvCbBT2xSH/Fmoj23kidZIyCBkO3/sPcMJC9NB4iIxJwyg3hnsQ4tdMxKYtfArfrfCuwnwR+VohJ3ydYXiqms9o6nARMvH/7qPZqCEiqDxI+G7FvVKl6+AoGrGzudKKfxLfNG/Lv2nbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtRNdyWWZFyJ56lb1kGocu1VTyQOwwrUF6cbFRuCLOA=;
 b=myifqCzw2KI+cY+1umbiCwo3EpLY9xR3gwQIpAqPhiZ0UDjoqO119tnyPcZKajuh6MZGhl5RlprZF5fgb8gIkHL7UlgVMI7ChB79iS1kIF9ggPHB5n1DhOWlSQ8UBHA9DL4zSe5V+I5WDg99KucIhUzRUca15W/oJ6QwmZaF+q5Qo9jmXY7h+71/BZs+/cWr7mqi5irvXPZyGtJKIkFQ+CE79vQVjOhG0chhpwqgGy0EMd+mO9lEbc81OGZLhl0MEl7npsMteGoecIZiglF3nezq1yZEM546qpSuAGe9IQbQRcZ3yINcWnNx/upNQbkFJlkfqQ0UrO1WpqGmcjWKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtRNdyWWZFyJ56lb1kGocu1VTyQOwwrUF6cbFRuCLOA=;
 b=WA8ioEs106+CphP2DMwxh2dtxcRYBPI1yw1n3z3eSVO8q3kDQVg4cIDxej7FcBuymASvwxJ12eO7p4ymhaFbr5KynRRvnLcfmocx19CaN73vwq3qIHW5YlaRym20JTabclsTwU2Xcsc5U2e8I+HBDlYKNbh5LXTh7JawInkaiyA=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AS8PR03MB9167.eurprd03.prod.outlook.com (2603:10a6:20b:5c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:41:42 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:41:39 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOq8wPYWAgAIJVIA=
Date:   Wed, 19 Apr 2023 07:41:39 +0000
Message-ID: <20230419074039.218394-1-emas@bang-olufsen.dk>
In-Reply-To: <48bd83b09adf698976fd10f71463a553.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AS8PR03MB9167:EE_
x-ms-office365-filtering-correlation-id: cfd82291-fb90-465d-160c-08db40a98330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +IFUEdbRufbzC2oxEpDdNNZkztWBMujjHqeIZGon0LhglJTkI+ii6k5sJFG+jxcFEAT4NMinyE+se0wR+doxFY6sqeOH1GYjZWfnNHHfoCHFD3qsFkz8B7XjdYmBGYtonHS3wF2ilOvImQ96htPrN2CpNXH5heIOn65lhnHLU83BAVhkLIOlovZCUu3/WfnZCOGNuQxHYhb/m9wrELIOq/LJYwk0wxRXvn+U+KDv+d8rBCc9LeUg5aQm64cLoILdAHU97MOKGJ3xTuMSS2fvGZouT9eu5vHRtk0ZfUdKD5AkAdgkNrANZM8JszpZuNz+Ra6x1XraGIC9v2o020o4ZxdAAOguVvpJLliKOPpU4NPmO1jB2/HZj8DR2bzJgjrJlFjKmYfw0tVxGpKz5LB4UlEDwu3c4zix0WhpXpH5jtO4UcfJVyFiw/cGFqjMLlE3FkU+JXZ/hMZMugLlMsuwqRLAVqpL6gjY3tVaMWLafCUtFqiG65Vrbdn9m+gH25oTlbNcOkrt9eGoUxnTyhtgIrFzehErDfWC+dNGC7uDsdIEOeZI5v85HhpGfTREA+YzRsAHrObSlsR89mOvvdoeOdkPcRpoFNJrcn8wLMhQcZlFGR2eeHzPo56Xw65Qwbvo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199021)(36756003)(186003)(4326008)(110136005)(316002)(66556008)(76116006)(91956017)(66446008)(64756008)(66946007)(66476007)(478600001)(71200400001)(6486002)(8936002)(8976002)(41300700001)(8676002)(5660300002)(4744005)(2906002)(86362001)(38070700005)(38100700002)(122000001)(2616005)(6512007)(26005)(1076003)(53546011)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gojRdjnLtw6HkZHGdhfqYnbKynvYKplPshp5zyDjHU0xNNdCMR/MInvjVQ?=
 =?iso-8859-1?Q?3NF7Q2+PGUQcvob1bH9U3h9XB38X5Tp6nswChgws50u0U9ZqNQu0lI9J8+?=
 =?iso-8859-1?Q?46NCU0CtqX3u+sq7/HTZEZoVeZkTvjFgqYVnbi+JJdGkBx6ElbBRyFowkn?=
 =?iso-8859-1?Q?zUwoCvBfjEo36MrFSI0C6DXccfsj+UgnecUMh+olo06ovZy04eohvg9aPO?=
 =?iso-8859-1?Q?0HCBB3kFNQUmyUf7OLHKPg/qzaFBAuY5d2icnkVxAE3PdlGU8uvsDBmlQ+?=
 =?iso-8859-1?Q?KQVAK8xprjW7ETzSXk5t2JuwzEXvpfjBWrC3Fp9izEDi3Bjmk9BJCCoxC0?=
 =?iso-8859-1?Q?fN1sPa9mnLYsSEfKMP9d9HfGLy7n9cnlcCjpkZRXOwQQMFJBG/dIfOSpQn?=
 =?iso-8859-1?Q?CyvAssMDg/Fs+0uUJjiAcFkBgwb9FWkPaHqREooOHFbqKSTDpSm5GfxBn6?=
 =?iso-8859-1?Q?qy+RNskyoOAOt/+/DxIH6Vdjf1l2JQApA68Qe9mBsfmiq1r8Krfx3e0QFU?=
 =?iso-8859-1?Q?yYPSQ9vGp1xRL8XWE1AUysPp9OWE7AYY/pXsD7lJEaIdV9ckqeFVejX9Z3?=
 =?iso-8859-1?Q?crowp/zTD9PHuvLH4ljf3PXy9U15t6egbRduXsLqm+NFu0jAewyN/hW2nb?=
 =?iso-8859-1?Q?SOniErdl2AeTkTHeOK7MmIlZc9k4psnqjV+E3ZSoxYLE84TACVbhE1AUvD?=
 =?iso-8859-1?Q?dOvlDJRODfpSO5KJDIeh8Bb5p/SOhMfkFjGvvqrHd7wmC7sByqkaNBQZ60?=
 =?iso-8859-1?Q?Q+sCUG/cJGgl9u0PoaB9DngDdORz6J9jMMpIla9SAniwQ4vHOOnOZ0Vdp1?=
 =?iso-8859-1?Q?m/ybCeNVotued2rg6lV2zG557fPSJ2SOzya7tZ615rPHSndS8AVeyfZgLW?=
 =?iso-8859-1?Q?NEvYMY7K1eUG/R/jsAfDkAUtGniHk4L+yBcvkNqKRU9OzAukS5F810/L+J?=
 =?iso-8859-1?Q?K37kYiVdz01f3pYlsLtkwdNfWUAnGWNOO6xg40Xrk2d5z/18KDaCgYgkJ1?=
 =?iso-8859-1?Q?dm3sD70AqqypYgBlYAlV33HA/dtigzLH8FLjQ85wFz0gwYYKQn5M8+BZr8?=
 =?iso-8859-1?Q?/OT8CdjrJPKickjly++Q/CE49EmsZtvZlhTKDjh7VfYoi3wsXJBUK/z8vw?=
 =?iso-8859-1?Q?Nhgz3xFfYZxreZVwya7gltyZ+icWVPYzo7rUJzrQT6ppiVqx9+jvzELKiV?=
 =?iso-8859-1?Q?uDPnF6zXCg10A+ggu622Vh3RfolVPkPHb5dA1EFJC32BNZKJlN55hTn+7w?=
 =?iso-8859-1?Q?Ha57CZaMqDp5bCa9NqodNX2FnV/7LyBTxq7XWYHE/cc+q1Hr8M05ur2nTJ?=
 =?iso-8859-1?Q?NzmPgL5LTGnInCm0rpBzrTs2ZCHxBWFpaQbEU48uiGPz5leNQGA6tWTxPo?=
 =?iso-8859-1?Q?HzG5lyU0orIh4KJsjhU4NkL5g4Dn2Dq5zdBHK/aBPA5StdmKnnAipuNFm3?=
 =?iso-8859-1?Q?OWngAeDcfSUFUHzHdJbR8VvJqsF4Jb0l88DeBpXp/jpp6+FlAnNZJKCjAk?=
 =?iso-8859-1?Q?bw1BHrr/oHNui5gASTljnb75BBe/sT2mPl2r/t2sjAWoInkw8r0zDFYesd?=
 =?iso-8859-1?Q?KxDtrK4+vCoAGXZndy42XxbOTZ8+eIA2SdNVg8Vb7wR7FQKwQvjj28p/qe?=
 =?iso-8859-1?Q?gPMCTGSXZVk6fVZFbefY4FJ5Vn/1x/HHG8b3uDPUJgh40gM9mdcPe4pg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd82291-fb90-465d-160c-08db40a98330
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2023 07:41:39.7628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WF0pmg3aHqD75sNhhPB/SUSPFqMH4yGlNe3VvuX/i4lHXcs/Qj4zWtK1ZUnLdGYPD7VWjBn37mZdjXeB5ywzgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9167
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 4/18/23 02:34, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-04-14 05:52:16)
>> When initializing clock providers "of_clk_init" will try and init
>> parents first. But if parent clock is provided by a platform driver it
>> can't. Then clocks will be forced on and OF_POPULATED flag will be set
>> blindly. So if setup failes e.g. with -EPROBE_DEFER the clock will not
>> be probed later on.
>=20
> Did something break this recently? For example, commit c28cd1f3433c
> ("clk: Mark a fwnode as initialized when using CLK_OF_DECLARE() macro")?

No it's also in v6.1 and looking back it could have been there since the
platform driver was added or close to.


