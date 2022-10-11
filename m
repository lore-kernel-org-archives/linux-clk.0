Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC444C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 07:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiJKH3G (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Oct 2022 03:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiJKH3F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Oct 2022 03:29:05 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.133.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A30E63FD2
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 00:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1665473342;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=VrmK6PwJl5onzYtTna5rIvG9Z6Iokq/DQGCp7OIQHBI=;
        b=KivcmLkfMugMUtQgxO9lKlt/gKOOIO5FJQHGbR+D49N7X9ASjvUudGz3ImzAyZzbpNpjgR
        BCuHVUoLiaLQpNVVe5j4ctOzoe0Rv32ig41UxaJUMHu4Yggx/HXqGkLULwFF9pvcLzQxWr
        hmf/WJpdCfx17eJRB/5tR7NKrLPsD7Zc2dBANs29vKu2mFweunS1Wi7AOAXEvAcamRjlO9
        Ri7I3O9L5aHbjXdyOVeNmS1ir6PF/ky7mepJ0DDUa6vlB8wqwGF4NkslFcMnLud75Wm5Vv
        T7ZG0ZG40pkYEPRtWB4ZzOi5zE+Sx4tjTFst4vH6PiO2lhHvD4RFWZz2vBkgqQ==
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-648LQk-_Oqamcajv9sWh9g-1; Tue, 11 Oct 2022 03:29:00 -0400
X-MC-Unique: 648LQk-_Oqamcajv9sWh9g-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by DM4PR19MB6176.namprd19.prod.outlook.com (2603:10b6:8:b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.40; Tue, 11 Oct
 2022 07:28:57 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 07:28:56 +0000
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
Date:   Tue, 11 Oct 2022 07:28:56 +0000
Message-ID: <MN2PR19MB3693031CD60B09AE87885F5BB1239@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <cover.1663827071.git.rtanwar@maxlinear.com>
 <5a88bd5a9e93cc6e794080e5cac821ae0c27ec56.1663827071.git.rtanwar@maxlinear.com>
 <20220929001745.A4F9FC433B5@smtp.kernel.org>
 <MN2PR19MB3693EEC08EAC5370F1D195FBB1579@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20220930010123.38984C4347C@smtp.kernel.org>
 <MN2PR19MB369301BFE8DFB56C348CD6C0B15D9@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20221005202037.E7B43C433C1@smtp.kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR19MB3693:EE_|DM4PR19MB6176:EE_
x-ms-office365-filtering-correlation-id: a640df55-c566-4d17-4c00-08daab5a41ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: tLdAwmDzJYDY0gdKAdFV/EJgCOKfWzs49rcOyq86Qtj6GRpg4rHEprXCGDurpf7bfQEaOQxQoaQ+V0FfVCunwRisQgUfACcM6zCEB9ae3v0/Df2b7OkRriMqThNIhd3O7KRKBBghAndEZBRdigkkQMRU1JZXMP6eLxrV0umUfCTR3irtdPiBByysaUG10Zndf152jQY9IQlDy3AWFZEHWEdhWRDcaz/8yiDhypgdjrBHiHSkSajh1hRIjBW+XtPkBqAWz0eAEEanUwV41vuzoQ2sKIl2TuLsSJz3La9+KXa/yCgAcBV2eL4XVKMcrbx98Rq57O3RKxgy5P3kx+xjPsC1iwEViypex71HmABv39pooa6g0rFL0TCBG5JQnPf0F746rfRisNM9c/eGoeAELecOfKqLIZ+Os6/dByjhBLa6v91CYGWzyF3f1UGy8L04vFj+9VFYqWkttkFRdMKdIH14PL/FNlU0fDTMUakxfL+pUdp+eKWVvUqEO8dsR6gXtFv1eywulC2ewAJGg1dGThmQ5NS/LvigLK9bnMKTexRTKqcF51NMXPep5Eq77aql7hBGkXy4XrE5PRzUUEBWEmuOvXaSMW1uav2hSJLGm1NAP7UtMI6zoskVGiPGfY0IHOV/pxAIacT+Rho4hM3Ph/+atuaHQltI77uucf9AfQYmji3NjQuls5oWbbLdSHlmMhuXkErBVC8O5/rOy5oOp6eNzKsqEIh3JlKyDznSEPqsUcxqcITxWEUovpC1tAbALHKlnnMZ+zvgimFZpO+WKg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(366004)(136003)(39850400004)(451199015)(66946007)(66476007)(9686003)(66556008)(7696005)(54906003)(55016003)(110136005)(64756008)(8676002)(2906002)(478600001)(52536014)(8936002)(38100700002)(4326008)(5660300002)(66446008)(71200400001)(53546011)(6506007)(107886003)(33656002)(26005)(122000001)(86362001)(41300700001)(38070700005)(83380400001)(91956017)(66899015)(316002)(186003)(76116006);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eB28US/8lRZUqwQ9ZOyhnW55Hr4s0GOpwnyXvN1ROlGlwwAEu31YRbfWBlqo?=
 =?us-ascii?Q?Q3ptcr72OJUEfFmcb/cKGStDoGMP/NoN6P+DSOaPQWNGoTUrK7P4ICuar+4Y?=
 =?us-ascii?Q?kQLS13Ca3yaWYVGPaU4u4doVt6RshvfLWuYGdDl8k+wOFOjJcAYKjRguEhGQ?=
 =?us-ascii?Q?hPLHhULXQGIdmFlSw34OdpV90VqcS1U7P2lR2M5RfS/8edZjkdUHV4/EVG1M?=
 =?us-ascii?Q?oFgFdU2Swon5d1qyvp5llm2IPo/HiPvMYxyg1ucPbMmmIMdGkaM5qqmSm3oA?=
 =?us-ascii?Q?k/xvTjEZQc1GWMRE+jqEEbednUkpY9emIJg+HGGCSqcRFHxRiuxRO059QEuD?=
 =?us-ascii?Q?pie7djz5R5CmqVz8V7UDLYAoBes3vZjiGpgfH+/kFIoxx/THfJzx4ZvFN2Fh?=
 =?us-ascii?Q?mZyKFufbIA7GaOdqaHOgjIE8tCcfxVgGAWAJpjoYfcB0oOpdaXpa9q7yv8dP?=
 =?us-ascii?Q?FKgLhoj/EUjOL+9znq5nUPatgKNLCLFi+XQ9RYrsOTWHEOHtn7LFDIAz/zrQ?=
 =?us-ascii?Q?UDQ6Z5H+eLLMRSx0o2GnbZ7LMl30exAHa6Q+zMLqiH/6H4U0e1ahfZ8ef9Kh?=
 =?us-ascii?Q?iU+knxpyDLOMu78ympNbdgA2ZFUgUezE/Xsd0Pzh76zeyzcWrKbOwNf+i88F?=
 =?us-ascii?Q?xaYao4DX3so8hsxrFhC1vMizBDu7mhbNZR8xOkC0hJVXgWjFKtWogvM6wgyY?=
 =?us-ascii?Q?+sjdxYgXATab2ho/7+gn0JlI5hEB83P/xPL3cEz7YomyRskGUwvwmRQvISM6?=
 =?us-ascii?Q?DNFU3/2cOVlhumOGSD2y+xnFrJd7HgXBSvmNrs5kyvbJg/k7XVSwi7m3dP7u?=
 =?us-ascii?Q?dwV+f30JMeovk/c0aqca4dtr0zMPXkf09XIhR8YEvK3dUdLEYBvuVeEOf1UW?=
 =?us-ascii?Q?NpptErMKT99XneBPf8+HxO/24qz13mfTnBz1G/HVGJOdGDBNO2dvJOSJZA6D?=
 =?us-ascii?Q?q8VjxrPt/ECpR+pMw3zCK2a6pXYaUu7ap5Inb3dr8dWlHZ3nsLyHkIXnS0ih?=
 =?us-ascii?Q?dSSCMJcYh2gX+OFSwHI+7XZPH9V53U6s9mCkas0hBFhulh+F8gsKkF4epJ0c?=
 =?us-ascii?Q?lhIqubXFa/xejj0oEKbU3zNte0TdpIJaeUDwm1I/8GKxe5g1CFWs3lrcFBBg?=
 =?us-ascii?Q?5pjXbtAc4TV+0RT9woxZ55aMuxEwWyjIsv+MuD8LZbMYakp6taKSdznwxw9s?=
 =?us-ascii?Q?lERkn+4S0af854nyS+haeyIXcVdCUzaFB/lkItiRrdvrUFoT1W9uigbac+U8?=
 =?us-ascii?Q?mit3dqz/y1YhXw+Ea+84g4z7JV5REurGB+khZIYb47xBS5jR6iOGc7qNI+i1?=
 =?us-ascii?Q?Iw0W6vXPAREFNaANLRkt3wQcz0it2Irh31UtPL6dqHFpZYyDSCr0kJPpEKkt?=
 =?us-ascii?Q?oUi1hsE+w+ABEoh/LekpB6AaVEYUMfoO2xFno5DWVV0qHnpAkT+ipSMNgdWt?=
 =?us-ascii?Q?57J1+RkSPe8oRHcY2vM58c2/dEC4IsV6fNfSJMjcV2tRIyn+pmIsKC2GNqE9?=
 =?us-ascii?Q?9xMkVuFoykNRyuJt3x53ptq6aissrtc7fyMdB+/E+e+W+jZyMY4hpojKgyLv?=
 =?us-ascii?Q?cQ29VBQCOm/0zOoYevb9jfXVZv4iAHcW3RbgiFVKIviRUbj8NCEbGTDWWDXg?=
 =?us-ascii?Q?6A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a640df55-c566-4d17-4c00-08daab5a41ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2022 07:28:56.5166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V2ZFZaOr2SHSTeiXprtQ+vHpS1Btp1F55pRY+0Wa5kqfy9JQO0GxKkC4sRkoT9QO8clKJsap5N7jFrlr0+Pemw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6176
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,=0A=0AOn 6/10/2022 4:20 am, Stephen Boyd wrote:=0A> This email w=
as sent from outside of MaxLinear.=0A>=20=0A>=20=0A> Quoting Rahul Tanwar (=
2022-10-05 02:36:00)=0A>>>>=0A>>>=0A>>> Why is the clk driver probing on th=
e new SoCs? Is it providing=0A>>> something? Can we detect that the power m=
anagement IP exists and not=0A>>> register these clks?=0A>>>=0A>>=0A>> We d=
iscussed in the team about not registering gate clks at all as you=0A>> men=
tioned. But if we do that, all peripheral drivers that use these clks=0A>> =
would need modifications so their probe does not fail due to failure=0A>> r=
eturns of clk related standard calls for e.g devm_clk_get(),=0A>> clk_prepa=
re_enable(). These are standard calls in probe for all the=0A>> drivers and=
 a lot of them use gate clks. So this would need a lot of=0A>> changes with=
 possibility of breaking working functionalities.=0A>=20=0A> Why? We can ha=
ve clk_get() return NULL when these clks can't be used.=0A> This is how we =
implement "dummy" clks on systems where the clk provider=0A> can provide th=
e clk but there's nothing to do for the clk operations.=0A> The clk API tre=
ats NULL as a valid clk but bails out early when calling=0A> any consumer A=
PIs.=0A>=20=0A=0AI agree that what you are suggesting is the ideal way to h=
andle such=20=0Aclks. If i understand you correctly, you are suggesting bel=
ow (please=20=0Acorrect me if i am mistaken):=0A=0A1. Disable/remove such c=
locks from corresponding driver's devicetree=20=0Anodes. This will make dev=
m_clk_get() or clk_get() return failure.=0A=0A2. Modify all drivers which u=
se such clks=0A=0Afrom:=0A=0A    clk =3D devm_clk_get(...);=0A    if (IS_ER=
R(clk))=0A        return -ERROR;=0A    clk_prepare_enable(clk);=0A    clk_g=
et/set_rate();=0A    ...=0A=0Ato:=0A    clk =3D devm_clk_get(...);=0A    if=
 (!(IS_ERR(clk)) {=0A        clk_prepare_enable(clk);=0A        clk_get/set=
_rate();=0A        ...=0A    } else {=0A       // print error info - do not=
hing, no clk_ops calls=0A    }=0A=0ABut the problem that we have is that 80=
% of the clks that we use fall=20=0Aunder this category (around 65 clks). A=
nd if we follow this approach,=20=0Athen we will have to make above changes=
 in all of the drivers which use=20=0Athese clks & retest them again. That =
seems like a overhaul. We already=20=0Akeep a internal driver flag in each =
clk entry data structure and we=20=0Aalready use it in the driver for other=
 types of clks for e.g MUX_CLKs.=20=0ASo using the internal flag to handle =
this becomes a preferable &=20=0Aexisting driver design aligned approach fo=
r us.=0A=0AThanks,=0ARahul=0A=0A>>=0A>> Also, i incorrectly mentioned about=
 the reason being backward=0A>> compatibility with older SoCs. Main reason =
is to support different power=0A>> profiles use cases as per end product re=
quirements some of which might=0A>> control it from clk framework i.e. this=
 driver. We keep a internal=0A>> driver flag just for this purpose to provi=
de this flexibility depending=0A>> on the use case which is what we have us=
ed here.=0A>>=0A>> I am sending v3 with more clear & correct description ab=
out it to=0A>> justify the need for these changes.=0A>>=0A>=20=0A> Ok=0A>=
=20=0A>=20=0A=0A

