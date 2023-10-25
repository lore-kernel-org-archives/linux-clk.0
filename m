Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A312C0032E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Oct 2023 09:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbjJYJry (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Oct 2023 05:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbjJYJrn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Oct 2023 05:47:43 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2136.outbound.protection.outlook.com [40.107.20.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B32D62
        for <linux-clk@vger.kernel.org>; Wed, 25 Oct 2023 02:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8d43peXyrKjbLqygHSqHLKwWXJB7XXVwdyxLJ4tbnfYsQU+KUPCwVMFSJStHSIrJaMQIqkFcPbEDu/4h9ss2cxGeTZIq58BZO4JREKTZOMPnoOJb0W8Vjk0OoMBbxFbqLCDKG58UAgVLh2u3AwaOc4F52NWrO5H4PkBo9zP2o7w/jtQeWdThuf72wOfc0iWDqiSCVG+bheHu0gZHJ6FfChfpEu3ABr1TnuFs6rWDvIuS/NAywiCvxYYggMIEJoCKRfcEYdxK8hmf8Lj1O4vR57JfLk+ZkRmNeYw8xOk97wPR/9cSGpYjGkcSLfSjd7bXsauedtHEWMBH9xirdFgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNIOSG+uOIizIp7ltCOZWvprp+O45MI7RopEfR+cVBQ=;
 b=U2Yn3oGVpOyCHoGLPLMUQuvDEMKNtaccaDtakoFSFU/SjvMcDydsbqiXRBRRaFyZXvWOD+tj6juamzbAvbAGas2DRTpOCUzlOlEuqyubHiVAm8b/Tt6ZZKtjxRrT1g98ByYcoaF86ohONHEISdjN6sj8QS2KXxlpnZK6rwQC59ochpoieIw7UeIz8Y7pm6QVWM28fRdDKxlRErDpLbFMgHmTVEad47bP8Bspa+21CsBiwwrjBP2aDTpGHC/AtF7IwfUiQ4wy0TPddEJYYZQvlc7+z3WQyltZ3ENhdqaFxNOjv7YJq9l6f1PkIZimnL1ZFYOkdb7IS9NKGRyIIGMubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNIOSG+uOIizIp7ltCOZWvprp+O45MI7RopEfR+cVBQ=;
 b=GrkcrZ886yfQEVW1bpmRZ+IxepEnDotRtnv/0CvlVwOsl8qfAr6REEBNUQKJhrXKPAYs5OOJVaDr4hFHrAW4LurLrB99TB0qrGZnxKvrX/F2PfWpCAFS9OTDpxeEn5mDRDfw3BUYkYwL6FPqqXjwkivaNLAdTa2gGhPeFdlxRQ8=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AM9PR03MB7679.eurprd03.prod.outlook.com (2603:10a6:20b:41c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Wed, 25 Oct
 2023 09:47:34 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%6]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 09:47:34 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOq8wPYWAgSs1aIA=
Date:   Wed, 25 Oct 2023 09:47:34 +0000
Message-ID: <ZTjkNcz5bS9TbmoR@emil-HP-ZBook-Studio-G5>
References: <20230414125207.33722-1-emas@bang-olufsen.dk>
 <48bd83b09adf698976fd10f71463a553.sboyd@kernel.org>
In-Reply-To: <48bd83b09adf698976fd10f71463a553.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AM9PR03MB7679:EE_
x-ms-office365-filtering-correlation-id: b8e472e1-5250-40f8-a939-08dbd53f69f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xhE2lDY5X8gKK7K+AxfibQcE4cHjKaNeTzp2Tt74B1kPY3uvu4I4vc4EFaDGyJxaAx9WcrzjTcovCk+gnQeSS7FCYhPj+s7ATsdvabhaBR3zo799Vt8WDgALn50NhvnxGahDf6H1pRyddAODHHbp16FQSmGq/9HdDUr2OANVpwT64M/65pe76wbe84H2pWTuAyv8wZ990VUqwIBVSNuAyLTS/Zh7IJ9c9+jI1nKxgCKiZA3fPKbLCu3446TKnfolXtT2/8NanSvOOkF0maBphXURuap+y35Ejh3xqY5y/5A0Gbij//IR9L0EMk5juGRuAOAUOTtAggD7o45qrYAxmlmxkBnLS9Ei3pqAGUSF6tGMCg9NVLypy5gMaY1hFO2f7/RibKHQEuLCGmYR4Bdp+FDzaYf5KE4/hszEka0TRlkeDaIMpyQPggW3EwQ7qxrQh/wuwRIOkWmRIz9gDlQ+GBSmda9Wjpd+5XeKh8FkrSLA2X2n3bu5SR+2W/hQCZ8zd0r3zNOY8radd1KkHpEEdhNFUGHXmeyrXdI9ax+TOmh1XIvHUDKGag29iERmnHN7Y6m0+4yX/k5u1sG6lc+Fbj/bk33jJ/eV2dg1bzy+Ujq14fQ+RG4BdTpKcB/sDq5L
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39850400004)(376002)(396003)(346002)(366004)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(5660300002)(71200400001)(41300700001)(26005)(83380400001)(38100700002)(86362001)(6512007)(33716001)(122000001)(2906002)(9686003)(478600001)(91956017)(76116006)(316002)(6916009)(66946007)(66556008)(66476007)(66446008)(54906003)(64756008)(6486002)(4326008)(8676002)(8936002)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c79lIZi8rgqE4XAIQGKBQWKM0VfQ/YH46iu/Ha5yWnoYo3efANxYilEHxnc9?=
 =?us-ascii?Q?/+8yzkesEoqUd0qFuOysd4VaefsoQO+d8idS7TIhsadXyY5YV0QUhytGroft?=
 =?us-ascii?Q?mJytlT/YPoqjaMGrkxFC1QpmYmlSjVPQ/nsUd7UqNaO6Gev/lU9XBRs8gSDw?=
 =?us-ascii?Q?uvmk3+/ri0oS9d2zhQguxKgecWZS+2VJFw7c0UJ0dYDNWcqFvi76y5kMPtvN?=
 =?us-ascii?Q?vnInK1v/tyxrseS6pFk4rLcfSS6mDLR/oj3JgHxPcUPQoVFEmevO+I6dcerq?=
 =?us-ascii?Q?rY9cVfGnNLLROni9m4hFIJavD/ZL1xYYIcEA7MvRRss+cUK7DaZrLyNuzThy?=
 =?us-ascii?Q?hSRGjLQl37HBGGstIFxJx0uIlIrhO/mV6cifAStUi8b3WpnM5y+V0qR+gVeu?=
 =?us-ascii?Q?Fwb1t5Gr0X69QN85fvbgssxcf/j+BUapv/ExdaEl+0EEk36IWvGeuV0DEzqG?=
 =?us-ascii?Q?N1+C7AULOFxvjR8vtIdW8lQSr3ny8uAK6364rulS5vXxx9E6Wnxk6xiA7ULs?=
 =?us-ascii?Q?5EVrl8lPNljO/FCxkhXBVn2yRbI1jCSoj3J7c55L+zWpCgwNqWw2WC5vZcUk?=
 =?us-ascii?Q?6VKn7zf+7fPHScK+eBpoG0IS2o+gg+d++68SJoO+l/0nIx8aBczwQ3y9MKVU?=
 =?us-ascii?Q?+e5DxrMUOsxgZUTget14avoahfprv8P9c9X6FvkXHPalV5fzlqjtr4QXrmnp?=
 =?us-ascii?Q?qO+6tINnnbFptKdAaO5pQJpzDsW63CxhJkta30qda0aYiTcn0xBAvIj3VbvB?=
 =?us-ascii?Q?sRXZ4BVPek5ue35gNcvGACEumojiCsCWsHUzt1SnIgch9Gw6S346LXSJSS7l?=
 =?us-ascii?Q?cbtacs8SV4ZFlNQMMMlr988tRDQtf/sQ0CDFTyO1RLpyZTeoxiXU6DSpZHev?=
 =?us-ascii?Q?QqxOhzfzGzZg/xsyOJvGEPf+yg7A9MnqoY7plzTJTrtRLeUh3p8TRRmH1Dy6?=
 =?us-ascii?Q?eH2rXpUe5OqcGVaAOsAbuCO+9GoMT+wzrCC56Agns/AOW0n1cwWv0YGuBHWN?=
 =?us-ascii?Q?wFJ/X/2F42ShWX5W4dBdtSVTDH+jhV5CT2ji2EBBewmP1vy3uIKCidW9cSxz?=
 =?us-ascii?Q?agfv01ZSpofbvyjwBBJj1dW/2DN1ycrjXjT6KYmAwvaj65Ab/UDYMz41HhZ6?=
 =?us-ascii?Q?TqqTdshphYi1dWh4WHyiZXVZNZNBAFXHFc6AJ2qk3mAHcpPSCR0Ktph18qIP?=
 =?us-ascii?Q?4A8xTPc7iREXVprQsH2T9DZRQS6gC4PGJlP4UNqbJ5QEF72Y/w3It8ZbZDGb?=
 =?us-ascii?Q?NZule/L3M0K4s7Q6rQ7xZZEFX9aF/bx+5HHs7X8axClRtv/DpgB7QSkcStVG?=
 =?us-ascii?Q?D0mkQg+CtVkmsJXncdUX7MfP78G/+L+oL0B+x43V6bWNlYjqvgV2ROx5A62A?=
 =?us-ascii?Q?EdPBwU99ZNwgEYquf+ntydGugPZhof3nUBHBu+DBzbGaF3DbuttHPS1p/56e?=
 =?us-ascii?Q?2jyskMByCXsHJaTd2XQLaPoMTnb7dsNnPh82HkS1MYCZs4jhLpINnTcD0F0H?=
 =?us-ascii?Q?gZmhuoKsvGo6sdPsgDpS7oH+TgIK8WyIl6j8+NrRHutKY0/MhhtYhU0WVz0a?=
 =?us-ascii?Q?AHS3dDVbDrscbZ/u5qX+D3uzCEcG6hjsR+9OO7mWsrxhs8BzVpJEbFX+spla?=
 =?us-ascii?Q?Vw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23C63036C435BC468D9274EBF55373CB@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e472e1-5250-40f8-a939-08dbd53f69f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:47:34.0609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLw6d7EkgLZ91xEbbuimuqW6+0uwORr049ypqzL52Wtj5DigcX6cpNEsKyNaumKzmLpaopZ/PsuK2taad7ajKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7679
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Apr 17, 2023 at 05:34:45PM -0700, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-04-14 05:52:16)
> > When initializing clock providers "of_clk_init" will try and init
> > parents first. But if parent clock is provided by a platform driver it
> > can't. Then clocks will be forced on and OF_POPULATED flag will be set
> > blindly. So if setup failes e.g. with -EPROBE_DEFER the clock will not
> > be probed later on.
>=20
> Did something break this recently? For example, commit c28cd1f3433c
> ("clk: Mark a fwnode as initialized when using CLK_OF_DECLARE() macro")?

Sorry for missing this mail. But no nothing broke I just added support
for some HW in a DT where the clock parent has a lot of dependencies and
has a likelihood of getting deferred until all the dependencies has been
probed.=20

> >=20
> > This patch will clear the OF_POPULATED falg if clock setup failes.
>=20
> s/falg/flag/

Thank you! I will update the commit message. I'm still new to the
mailing list. What is the preferred way? Sending PATCH v2 or just resend
the updated patch to the mailing list?
