Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3CBC25B6B
	for <linux-clk@archiver.kernel.org>; Thu, 26 Oct 2023 09:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjJZJkO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Oct 2023 05:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZJkN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Oct 2023 05:40:13 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2111.outbound.protection.outlook.com [40.107.105.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AB318F
        for <linux-clk@vger.kernel.org>; Thu, 26 Oct 2023 02:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dy1HO17b3gSyNG9LQ5MA0v8UFuKRIVl0i6F9tS8DqIUznz4HfWxuvd/bwFa6f1QBAOqpQPhOIAnzGfPKJFcAXkjKMwpZ4M8yqOWzJ1todL8+hGo/QP6RbtEEfP7TM2tzhazsLV1YqyIATAkg5b1/8rN0jGNCruaODjUWonh93BshheE0xf4Wp/5wON/fJLRY6n6qCVh5grQjJ8biHggHDpuPAsETpPE7MA8qIBI21p8TygDoob5mDm1IKqbTABAJMIAJofV8eq2p0xG/ZGpSA74OrqNebWmvCv2rATrTLgLQxy2yTA2tIG5AmwfWLaivUPvDdibLfHjX74jCnZ/nLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZIzTVYCoHE0wMDHreLL9N9Yrv9pw84C8d+XUCGKFYlU=;
 b=QjoNjwNwkKtNR347qWwwIBQ3ssBsSAqtU9PezTGgBx1PGvHIGmAGoOyru1p4l9abDH+sYO7gb5krPnghdby0Pk7YtbVuXb3/EDYB8GjfEP/Obb42jNHel/XeU/tggWY666saMKRytWi310op/F3jlhm1EdLnVFMUXLUhK3MEN4i4F93xuNi9Xzy35GeiyEQz+FHEnePUxv5C1sMu6wrqGXE7YCQmbUujmR7q9tULqIZzJuN2jMfv9d4mNIN7Q0OhhneShVrDmMyqCvPcN2WXQmSPYyGFHTtvokfly1TYfybTJoVgWPp4O/lQix/sEFLs2Nb0fcn1UPByV+1zCZJavw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZIzTVYCoHE0wMDHreLL9N9Yrv9pw84C8d+XUCGKFYlU=;
 b=YA8fnmbr+FXkG2a9hf9yk/oQmI1mPQFVBTmGZ0DM5XJbPfhaXTsKU0XqP7eMKC8J5D3lW7Ny7bGIFBTJgUl+is5Zm26h7g9D9CMCznhMJYpCylXzKf8aWYZQIDjI9rrJZktyU48ifcJyLM4hWANovsG6rjS55F5y+erxFdWhmE0=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AS2PR03MB9816.eurprd03.prod.outlook.com (2603:10a6:20b:608::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 26 Oct
 2023 09:40:05 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 09:40:04 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOrBZcqWAgADDtACAAD9RgIAA+aUAgADPqACAAMQpgA==
Date:   Thu, 26 Oct 2023 09:40:04 +0000
Message-ID: <ZToz6ztMDkeR+npf@emil-HP-ZBook-Studio-G5>
References: <20230414125207.33722-1-emas@bang-olufsen.dk>
 <a45ff881c83827189be308e2a8e4e13a.sboyd@kernel.org>
 <ZTfapJurCE3T2caX@emil-HP-ZBook-Studio-G5>
 <6ae70c7185bc8806299915181b282b19.sboyd@kernel.org>
 <ZTjhLPl+TfeBiX0o@emil-HP-ZBook-Studio-G5>
 <ce50bcdaf831faa5dc63f5e505bde1f8.sboyd@kernel.org>
In-Reply-To: <ce50bcdaf831faa5dc63f5e505bde1f8.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AS2PR03MB9816:EE_
x-ms-office365-filtering-correlation-id: bb2443ee-5f57-4b80-f41a-08dbd60788a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YnU9sS1PX6ZQy69fs7axBKrderyuGD+uZJWl7c/d9wzlmr2fSK+PLashG/8SixtLXJTV+7YEmBBABr+KYmWaJIgRLt52RxHs3VdsEDXo5/533f1IwpkRSS1QsTdbGtjH832JdHXgWieYi6e6vKwYlWH9lNtqjSVi6+JC90ktaYwURfOkoHTxmtLGgYctpLdT4Y/qoLBaDzYuoByD5YKJoKm0UlSEyCSzuSiNaEGOTX0eicVY55yBuVgw1hB/JfItdEYi1p4YKKO1c2JNyNE1q/Tf921BKN/I2ejCDIITaLXtFJQFeCF8Nylnm4C6JhzCnw59bzofVClsz96JffDqX36PHzBTx6RTkElytCv9wSPmYB1pydaVRrWYss5TSTfYfcJ0oof2DL9Rf76SRuZAfiySUwXX1VWwDsFO9CZ9Y4JvFfBblH1Q33dxh3iMonZ4881owfuarap38ChREz3AxlRcA2yHGkR1RSPj4/bVb+z/hp6gLM7Q/58Xto6yXsqCH3dqYjyCgAxFZYvC1xGWdQYr/KS5ntM9p7TJJOYK79/X7+7K/U9dwkehN783A9XmLq++J0ueCSgz/rW1Ngk3HTlmc2MPSi8OSBamMEE7TLTIpVH0GLMrxLMV34Tbfs24V+ZbOs4ggEpXJy18oN+h6Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39850400004)(346002)(376002)(366004)(136003)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(4001150100001)(86362001)(6486002)(6506007)(2906002)(38100700002)(5660300002)(8936002)(8676002)(38070700009)(83380400001)(4326008)(41300700001)(6916009)(66446008)(66476007)(122000001)(66556008)(91956017)(76116006)(66946007)(54906003)(64756008)(316002)(33716001)(9686003)(6512007)(478600001)(26005)(71200400001)(67856001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bwdnkk4ehEBC1CL2Ps4iShjC9IhMiTcln0Tkjmb2Dn862QU4M0ERVgVpNzqX?=
 =?us-ascii?Q?9nP8Ou8jy77DHTSZAqIRlYU6wHZJx4m+k8cmj4n2wjaPE2cukoKMOiDwq/Pm?=
 =?us-ascii?Q?ynTzTRELBRnfrxf1E3UlOH8wOG83hA8Fq5fyGijvPIg15tMiIj0/PkRd25D3?=
 =?us-ascii?Q?ipMswfNSwRyLgcXtoA4KxqjkPPEjwNArosW4OZpylGB5/YUaGFE630Fw2VZH?=
 =?us-ascii?Q?opF/L9GssVmUjIEXBAFy26mWMgOfBZRQFyG3Iy9Lcxr+Zprw9HIiAcuefy1r?=
 =?us-ascii?Q?Gx2SAmPUVA8dZJ+5wT3TcgHCsfyrI4a4OTIgV8oZZsxtnulYQu1ae0O+8TpE?=
 =?us-ascii?Q?j0l9eha3fOhucQY9T4DZYviSQoxE5MCD1NS6gI5kyTcyftotXu/1MhcMJtbG?=
 =?us-ascii?Q?a3EQE8wCfdYJMlEYRmx60NTiIdMLSXRQheaQfUVIgQCAs/fnSrXBz+i0RhSZ?=
 =?us-ascii?Q?vjq6WA/8ZOET7+3eoGcLRXpVfHye+WO62l4JAuy95E//HuC0BRcbEJc7NpAx?=
 =?us-ascii?Q?TVkFsu1ZZLaIewF4DzmxWMh9akAaStJEn/wrx3qVZEVBDBfioPXHhyneKbhc?=
 =?us-ascii?Q?S/ixD1QMnfUBbIs9bBWoOkP+vl7XyPhIU6VJ9Xedo0UBQK5LDX1PsQH6B9Xd?=
 =?us-ascii?Q?IUyAzUVj4wSHM23ESA+UgodT2EvE+jO4MGmizt/1MsEGWSSNFogktksXotaP?=
 =?us-ascii?Q?dHGhXt20LiZnbvc0TW2/zlvWlrWfAPlmu2KWZQrJVGRTn09/kZ0AeD+ifSTF?=
 =?us-ascii?Q?WLkmX8tBRmaA96FYT+H8luc6WeQrnMneccSpZhwsJxKW8sXr/yAr+0b36iFK?=
 =?us-ascii?Q?RtINTwzpRfp3AY9v8A0noIRmFmbHfqnCVqkVgKHT7Pr8nDQhts0iM9gVglTP?=
 =?us-ascii?Q?KBL69WH7pgNMPDghuQQ7R4y0Ajr0+GY+94udAH9zrj3RUlicgDFo2xdQe1iI?=
 =?us-ascii?Q?I+spCGpN5a6jwjxP/4OfVxiITmC4E8Q2tF3BvALfX/armASUd/wUP3cYriRO?=
 =?us-ascii?Q?uXDvTCLSKKL0OsjPB+0aHnCAGrIuyAWgngYY5eriATbXY/QnFNESPGwtu1ai?=
 =?us-ascii?Q?S8a8OStWh+By9yksohjxhHg9BZOe2MQeWIYzjMug49MJCxTlPMdDiz1bFnyB?=
 =?us-ascii?Q?64htEh62z3guDPLVChtOB6RC9pMC1ny4S6WhaeFW3PnWwW3N5N2cU2z4RApy?=
 =?us-ascii?Q?Erh551+3rT2H+Qj7HSU80e1AuAOSCqN/262YPrf2BiKjY0Dx1XCb5CKDoZev?=
 =?us-ascii?Q?8Rmc7tXR07kkNTrX4YY/JTlUW5Zi40cNy3CnWeGyykh4fA3ogWFq/lJ6zQDv?=
 =?us-ascii?Q?hRwCSWtyupXfLBsPn9ww3ItqyT5XCEtd3q6vEvEBjC+H3+srJqAawvL1YOPh?=
 =?us-ascii?Q?TgmoftChiciBk7fFVgwOLtT9AO/lWxCLktZklnZzCkCfdQL5yj4lT00xE/Sc?=
 =?us-ascii?Q?UTSRwJgJes64OHMcI0YdtCEY7v80m9V/Cqvw/9LfqqDJfKsj2+ht88XHZxuE?=
 =?us-ascii?Q?CbuXoZZtOv9jCERB6p+O+KgbO4O7wOR59PjD8iEtRR18/d2KX8Upmh+S+RCc?=
 =?us-ascii?Q?MWWfbvTgoYHl3aafysROuQpOTTe5g9Qvsxt99z311OaRt/dyczq7kbGFbLxS?=
 =?us-ascii?Q?vg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <366446BF882EC742A7C027FF3054E6BC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2443ee-5f57-4b80-f41a-08dbd60788a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 09:40:04.7819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /WlRMQyLKWhvb8nc73tqHUayOO4fGIcV6NnB6UJ+q4evYHO0TOkeCu6y5pt0FDbmB5b5vuLrt5ZWS0ppHlh5Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9816
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 25, 2023 at 02:57:50PM -0700, Stephen Boyd wrote:
> Quoting Emil Abildgaard Svendsen (2023-10-25 02:34:49)
> > On Tue, Oct 24, 2023 at 11:41:05AM -0700, Stephen Boyd wrote:
> > > Quoting Emil Abildgaard Svendsen (2023-10-24 07:54:28)
> > > > On Mon, Oct 23, 2023 at 08:14:01PM -0700, Stephen Boyd wrote:
> > > > > Quoting Emil Abildgaard Svendsen (2023-04-14 05:52:16)
> > > > > > When initializing clock providers "of_clk_init" will try and in=
it
> > > > > > parents first. But if parent clock is provided by a platform dr=
iver it
> > > > > > can't. Then clocks will be forced on and OF_POPULATED flag will=
 be set
> > > > > > blindly. So if setup failes e.g. with -EPROBE_DEFER the clock w=
ill not
> > > > > > be probed later on.
> > > > > >=20
> > > > > > This patch will clear the OF_POPULATED falg if clock setup fail=
es.
> > > > >=20
> > > > > Are you actually running into a problem with of_clk_init() failin=
g to
> > > > > register a fixed rate of fixed factor clk from DT?
>=20
> Sorry, this was "fixed rate or fixed factor"

Fixed factor

> > >=20
> > > Can you answer this question?
> >=20
> > I wouldn't call it a problem with of_clk_init() because how does it kno=
w
> > when fixed-factor-clk fails to register a clock when the setup function
> > returns void?=20
>=20
> Let's not debate the semantics of the question. Does the clk get
> registered with the framework during of_clk_init()?

No the clk doesn't get registered by of_clk_init().

> >=20
> > > > > I don't understand
> > > > > why that is happening. I agree it's good hygiene to clear the fla=
g, but
> > > > > I don't see why this is failing.
> > > >=20
> > > > The problem is of_clk_init() will not wait for clock providers
> > > > registered by a platform driver that returns -EPROBE_DEFER. Which c=
an
> > > > result in final probe to be delayed quite a bit. If this happens an=
d
> > > > CLK_OF_DECLARE tries to setup a fixed-factor-clock with a deferred
> > > > clock parent, it will fail.
> > >=20
> > > Doesn't the 'force' local variable get set to true in this case, and
> > > then the fixed factor clk is registered anyway? The clk framework tri=
es
> > > hard to let clks be registered in any order so that parents don't nee=
d
> > > to be registered before children. From what I remember, we want to wa=
it
> > > for parents because of_clk_set_defaults() may fail otherwise.
> >=20
> > Yes, the 'force' local variable get set. But it's the setup function of
> > fixed-factor-clk that fails to register the clock.
>=20
> Ok. What part of __clk_hw_register_fixed_factor() fails? Or is it the
> caller, _of_fixed_factor_clk_setup()?

It's the caller _of_fixed_factor_clk_setup() in of_clk_add_hw_provider()
after __clk_hw_register_fixed_factor().
