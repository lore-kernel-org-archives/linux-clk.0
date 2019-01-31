Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2846C282D9
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 11:01:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4259218DA
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 11:01:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="l6l127Ta"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbfAaLBv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 06:01:51 -0500
Received: from mail-eopbgr1400098.outbound.protection.outlook.com ([40.107.140.98]:25349
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726221AbfAaLBv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 31 Jan 2019 06:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvxZZOMIB0tdKPjE72x2XvR4Lu6XO0EbjSAKlE7qOv8=;
 b=l6l127TaQJ7tKGez6U/syG8iZI12K1cMHpV+f9Kpp/FiIOrVWl/S5VtepyXsPdqYUF5rdErVQ66qosQi/KGYcs3lrF5iqT8S/3EAhRV10p26+CP6tvn4SsbotdW0SVJt3hLjeTJUExTvQb23PzQSUqw8+V0NU66NSOnMAqKtF10=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1529.jpnprd01.prod.outlook.com (52.133.161.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.17; Thu, 31 Jan 2019 11:01:46 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9c4b:5b3e:212f:354e%3]) with mapi id 15.20.1580.017; Thu, 31 Jan 2019
 11:01:46 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH/RFT v3 5/5] clk: renesas: r8a774c0: Add Z2 clock
Thread-Topic: [PATCH/RFT v3 5/5] clk: renesas: r8a774c0: Add Z2 clock
Thread-Index: AQHUuUkELwv5d4vX3USmXnneqE4bfaXJNPWA
Date:   Thu, 31 Jan 2019 11:01:45 +0000
Message-ID: <TY1PR01MB1770EB487AACF48B1B4E3689C0910@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20190131094021.3092-1-horms+renesas@verge.net.au>
 <20190131094021.3092-6-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-6-horms+renesas@verge.net.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1529;20:wQQC+5p9rdCwKs/IT7H2PXg4rt0oSJCyiNaTGNz84MU0HzTK0rP3DjLGrd1Om3k2cm2IWpLrpGqYNepbgDKa7LPR0JHdpsdDZ0B7oiO0NrcOo5/2lPJBVntwi9zbIV0twzbYI10GybRwKbzRMXyFIpjlcW8WdS9cQsVeDnxsWAE=
x-ms-office365-filtering-correlation-id: 01712ca4-9317-4b1a-58ba-08d6876b7dba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1529;
x-ms-traffictypediagnostic: TY1PR01MB1529:
x-microsoft-antispam-prvs: <TY1PR01MB15291259E6AC38EA8E23BEF6C0910@TY1PR01MB1529.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09347618C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(39850400004)(366004)(396003)(199004)(189003)(7736002)(305945005)(229853002)(14454004)(39060400002)(11346002)(66066001)(71190400001)(25786009)(486006)(476003)(446003)(4326008)(71200400001)(106356001)(478600001)(44832011)(99286004)(55016002)(6116002)(105586002)(110136005)(3846002)(81156014)(81166006)(26005)(53936002)(76176011)(316002)(9686003)(74316002)(186003)(6246003)(6506007)(54906003)(8676002)(53546011)(97736004)(256004)(86362001)(107886003)(7696005)(2906002)(102836004)(6436002)(33656002)(68736007)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1529;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GCwr4ZtlMbrp8dfIdHhQbRJ7xNPskLckv61oas7uxXJ/Can2305YHLdLNs9P9P+/SksUFyHWiG7mD2cegb+0PzGj/qMm9+MROxgX06EK1cX6zblQVBtPMOs/FggdpzsXcKDDFYqGMrfGGQMOVN65Apm3NLjtK/7NBPtzg/nGiIr3OR/KsLYsGSJkIeb8/HUA6uM8NF2PMpRxpwAewuAaK4m2IWpDkgfwXMFNA6TxyXwdh/6HjDIuKMU+ujVqvl18zzSbfEbczgaAfkWoX7ep5ALt8O6QGBxLxkOJ7x4R4z9sS8wdyWMo4pD9hNCDau69EicM+QFwGljuULiB9pWOBBy7aOD0P0So+sUoB7cmQcCqOM0I11Ckz7tkuvnfSB08bCfvd5lJDjNva6J+1x1cog9TsSeJUWrNGDCRqhwkQMk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01712ca4-9317-4b1a-58ba-08d6876b7dba
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2019 11:01:45.8137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1529
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Simon,

I get the same results for the RZ/G2E on EK874:

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
800000 1000000 1200000
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/=
clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z2/clk_rate:1200000000
# echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/=
clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:975000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:975000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1000000
/sys/kernel/debug/clk/z2/clk_rate:975000000
# echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/=
clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:787500
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:787500
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:800000
/sys/kernel/debug/clk/z2/clk_rate:787500000
# echo 1200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/=
clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z2/clk_rate:1200000000

> From: Simon Horman <horms+renesas@verge.net.au>
> Sent: 31 January 2019 09:40
> Subject: [PATCH/RFT v3 5/5] clk: renesas: r8a774c0: Add Z2 clock
>
> Adds support for R-Car RZ/G2E (r8a774c0) Z2 clock.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Tested-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> v3: New patch
> ---
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/renesas/r8a774c0-cpg-mssr.c b/drivers/clk/renesa=
s/r8a774c0-cpg-mssr.c
> index 10b96895d452..24634ca94f69 100644
> --- a/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a774c0-cpg-mssr.c
> @@ -79,6 +79,7 @@ static const struct cpg_core_clk r8a774c0_core_clks[] _=
_initconst =3D {
>  /* Core Clock Outputs */
>  DEF_FIXED("za2",       R8A774C0_CLK_ZA2,   CLK_PLL0D24,    1, 1),
>  DEF_FIXED("za8",       R8A774C0_CLK_ZA8,   CLK_PLL0D8,     1, 1),
> +DEF_GEN3_Z("z2",       R8A774C0_CLK_Z2,    CLK_TYPE_GEN3_Z2, CLK_PLL0, 4=
, 8),
>  DEF_FIXED("ztr",       R8A774C0_CLK_ZTR,   CLK_PLL1,       6, 1),
>  DEF_FIXED("zt",        R8A774C0_CLK_ZT,    CLK_PLL1,       4, 1),
>  DEF_FIXED("zx",        R8A774C0_CLK_ZX,    CLK_PLL1,       3, 1),
> --
> 2.11.0

Cheers,
Fab




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
