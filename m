Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E794FA3742
	for <linux-clk@archiver.kernel.org>; Mon, 31 Oct 2022 13:02:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiJaNC6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Oct 2022 09:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJaNC5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Oct 2022 09:02:57 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F07FD1F
        for <linux-clk@vger.kernel.org>; Mon, 31 Oct 2022 06:02:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nM2bNSGomCE+DYY/5P0pW5NjDung2cF0t4vc6MJMV4VwBJBY3V79eBKeObkF2xfnlp1hgM6B7hzRY7y+2LKaxKMcUOwi6MVh50AInh93FYRG3XdKZqiplJ9j6LVa/nTvWws/Dl6Mj+MPXNxvm9LADlL4lDuys9nD8a1BUGZiGxYvhkII2h8DUjyaeSXHtY4NAmR5QSUzDcLHVnNJt0Clm3393M3i+8l+OqJdBKMDmMMXZrnF7HlXFrUy3JVtJYe1a3chETgY2PnSYk+yl199E8f3K7eqbVXrOcDr/Gxs83aSy0bjOA2zj3FesXYHJFyzBqQFprtOrpSpVhI2E5SHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdyX89YBZO6d2/rFGVHhGTqez+Va3BMTDhzJC6UhlGo=;
 b=l7Q0PtAtmg0uCZ2mJNfzC6Ok7AkpM+Uyn81cesjGpY8MhEel86rKOLd5HsHRznvvIVC3simP++lVoTDhEwXTeO1/1p64OKIX6rrowi1J2qCMK0W109fUU27mZ2U6ywLNVnz4RPHFbFUu3OLT6c5ZEASH1Z5Gx+9utoLAQobRLGHpail8zlCPV60Y8wOilftZKYyNzCn26j3UkVBdHC9sr8TNs/K8R+2778E59i+mLSPAtAaZ3bJrY99SRg5aYNXo1RddBosmZvYrEehS5Uw8eUgEl0w89toEeUwTHdJPL08sL1I2ohEfm98RTgUJrRotLh3Bso7bNoezy5N5VkhsmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdyX89YBZO6d2/rFGVHhGTqez+Va3BMTDhzJC6UhlGo=;
 b=gWXTcV5ZY7q51Nbe3wqnqdjdn9x4MqGaRag5KaNZc8PFog8QQpMBB1/p3IbGmgEPHAW4oQPOf4iub00VqREZWjnudjk2GkLue1mm7XAPm2SW444pp1agr/AdUvUsNE83lEMcwAQqHdQqVX/9M1q/V4hel5hnbezkboVx3e1HXRg=
Received: from OS0PR01MB5571.jpnprd01.prod.outlook.com (2603:1096:604:be::8)
 by OS3PR01MB9271.jpnprd01.prod.outlook.com (2603:1096:604:1cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Mon, 31 Oct
 2022 13:02:52 +0000
Received: from OS0PR01MB5571.jpnprd01.prod.outlook.com
 ([fe80::a281:dcbb:ed45:9bac]) by OS0PR01MB5571.jpnprd01.prod.outlook.com
 ([fe80::a281:dcbb:ed45:9bac%3]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 13:02:52 +0000
From:   Gareth Williams <gareth.williams.jx@renesas.com>
To:     Marek Vasut <marex@denx.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error
Thread-Topic: [PATCH v2] clk: renesas: r9a06g032: Repair grave increment error
Thread-Index: AQHY6sHZO0jOg62Dmkyw9D1XJ4UV1a4odXrQ
Date:   Mon, 31 Oct 2022 13:02:51 +0000
Message-ID: <OS0PR01MB5571A141EC9159DB281867C8DF379@OS0PR01MB5571.jpnprd01.prod.outlook.com>
References: <20221028113834.7496-1-marex@denx.de>
In-Reply-To: <20221028113834.7496-1-marex@denx.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5571:EE_|OS3PR01MB9271:EE_
x-ms-office365-filtering-correlation-id: b1ce377e-b1b7-4cd8-2c02-08dabb403827
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sDT7FF+kBvWO31DoD1PJnfMQyoX7UhauAwJugBdginBF5bXRKR0CyhZXgtyhU7kL8lBlpLHgOSHYfFVb8Np5MTeEeyceR4lQVTzTaJp8T0AMXjc6usN7kAChSAViOym3udMnQk6sTkJXCYr8v8yjo5NwlejhX9Y3E3Vveh0GuG1IQuA2tHNnoBPVNiKAP74ycvw9rPQHxzpaS0y9CixE79wk5nKZ0/jkxP3K3AsgteRNzQzYYhakMAFBJzPg5boy5XFTeIGFLihF3VDX+CDWblihfbG/stXKqcbS31WzgLvnLiBsnHjJJkpMRAMmOARWtgymYWFBmddvBE3k68shrKd8EeZj82ODCNAaUF6opiewpro5qvAWqHjBFt+qxaQs4wg3SmjBHHKL+Un2cdAq4045zpiZlTh/KMBt8fjjqM9Ep2ezVg/9DGyt7xSkp7VB0xTGAoGaOq0hWiCclIujrPEHADj4HYU/VGj0lBRnZdSHvyJnHYyEeJ6PNgzoro3RQRm9adVCppb1SnClqfsVxOAbzhV9r6d2Nwhy7h4fLdt/cW9SN5qjyQ/vIASw7DW62Je/Ev/PY+u4BI0U0yOYwJadQNpet0uAFQ1vrj6psk1jlEMcpWv+Ov7+QcNkNfyKrm0c6OTZQynn6mluTBOlEC9rvQeymHJlQViqsU+5yonVjeAzCtTTEx7mcD0IC1kjYyCb588+SH/RBJDU8CdbR5nSqLGPgfvpKad4pFr+0hZ4DySxFhnvOXK61vuoUaFViXPSqfCl/JF8a3ND5mpopQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5571.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199015)(86362001)(2906002)(55016003)(83380400001)(8676002)(71200400001)(8936002)(52536014)(4326008)(41300700001)(5660300002)(33656002)(38070700005)(66946007)(66476007)(66446008)(64756008)(76116006)(66556008)(54906003)(316002)(110136005)(478600001)(26005)(186003)(53546011)(6506007)(7696005)(38100700002)(9686003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qV2+16Omhfpw7vLivoQbikgVX9CuM/xETnC/8wZNHAcVWIu8FDzNeneKb1z0?=
 =?us-ascii?Q?UjahTJ7gUVN9OuPeXnD8P1bTAc/wd0yl5DRQc+gJr0mBAs4GAhq38xKwrnBy?=
 =?us-ascii?Q?9kLB2PhTQjbZ4VhS6BJ4505j17Nkw2/f5XFT37mjokSDjCzm+CyPL6V+krJ5?=
 =?us-ascii?Q?3G5+Wwe6GkQ+/WSElJ6BAwXrlOzZs++YzRtHQvV39CglcNBA9ubO7j5vtn86?=
 =?us-ascii?Q?cUjSxbKqmDcmRV74mfB4VdSgU/d3jU+4ScOpmPwie/FmqdrwRwJRpLe6QtxT?=
 =?us-ascii?Q?jiKtnG/3+hioCBsvAHoeHi70Q7onx6CWICo/y17buxjZmV6k0ShRJxAN+OO7?=
 =?us-ascii?Q?PpBgLurC0U02wlczeZEWPL0ke+dZZ3LPoZBDm6LvbvSrgOo4Irb5MsE+68Aa?=
 =?us-ascii?Q?7xS1zzPyBmWJrlQzJmjsH5w3MD8XdO7plk5RsuIuqYKyRHLdLi/jrnx1s6SM?=
 =?us-ascii?Q?PxdLEOywC0E5uN9/7HbjGLXz4UCMjbQ9VciG54WYfPbbsu8H+m2nSIRrddOu?=
 =?us-ascii?Q?oflxhRNFBXzlM9zxtazySP9WOsIRuKAVtkXOUKb4FJydWDAP+CCl8xLbT3HE?=
 =?us-ascii?Q?L2t1960nkF+W2QPHFkUeBj+ZmH3oeOJ97hUtLzl7+Q3JBo+V3FKnbMVmreW7?=
 =?us-ascii?Q?tKgsPfMMiT97+DbyqDti5uZJoi7Hd2RmaJ7w2jtuQndx3YUt2LglMlIySufb?=
 =?us-ascii?Q?Ha1JRLbeD9NxG7MwbNtfyRwe5ojDsUVZFuuBVvWnGuk1ZLgMP6zFOW0MirIq?=
 =?us-ascii?Q?IIhbmUz8SSj2Fj4nDtbMajf9GhoYSS550leSR4tR7a33K0lt5PI44DytOLMO?=
 =?us-ascii?Q?/H4DhOec3xu8L2MG1ktn62DOihYRHxiwyxAsfNZPxNuQhSkYHJyuUWVylFZH?=
 =?us-ascii?Q?FuccdPgSVycwYT9Ha5eilKVjVeUxttFvPLu2b8R6BIgWG2l+gBQZ4kwVcs/X?=
 =?us-ascii?Q?UacCwR6M8O2Q2On0IGey46knZcdBVZ5r+WbjxR7kif//gC8vNlvUFAo+Cu4N?=
 =?us-ascii?Q?3xqo4NUcVE8znDIASFGOzoraml0ZRqZ3+BTyvjAwALeh8otLmP5jPJljkfVl?=
 =?us-ascii?Q?vsgL0Fr2JNLi0BGvAYOKx9vrfpPxKkuuGwgjVq2EREU57vLiw6DM6bShyONe?=
 =?us-ascii?Q?kix1juE7YG47m2WOZbd41PYlwBUriCflxhn6l3bKm6LJ1rGNC8d0dnPKiizU?=
 =?us-ascii?Q?7p1kYLZ8+3/xYMQWi4E/SKybjbfGyUPxJcx4l+D+nZ1q7jL5YDG/cGacbCSa?=
 =?us-ascii?Q?ZZfjtdwyk3kFYzmlOBlQxFURiXMcvEZHitGLSuMs1mN9nDbcTm0YvgDqBvMD?=
 =?us-ascii?Q?2Q5pg1/K+LPZVMzeKT1O4KTYf00qiDC0ybLGVGIdm8QKShlGzVRtSlGMKlFT?=
 =?us-ascii?Q?bZwx3EiXcyQm7MfbzWrdlq46IM8slu6QbeRGugv9UMURphpD2hf1mJnRv77z?=
 =?us-ascii?Q?uLCiI8ME6kmLH++x/NYHQOerIh6cg6AX9GqQATIUZWRGi57ZpjRGgpYHu5xo?=
 =?us-ascii?Q?6zx72K2CnVmfssvzK3xvwcxv5hA13ZltcFvSjAClha333n/C3xwP2DUEuScS?=
 =?us-ascii?Q?sGpAtPpPqdW72ClB2IggcH2A1sExvYgbQe9HRW28GA0dgBafDKHtDueP30/L?=
 =?us-ascii?Q?Yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5571.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ce377e-b1b7-4cd8-2c02-08dabb403827
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 13:02:52.0113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qr72d3gxXyAmmbBcVLkSoz934j5yzNh2j/K4RVmcJWMISQtsgsfQL87g8HealzOrAYNEJi5D47BhYUxWmLNbZ0YcAZZwf9GVy/m+/yg+Pcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9271
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,


On Fri, Oct 28, 2022 at 12:39 PM Marek Vasut <marex@denx.de> wrote:
>=20
> If condition (clkspec.np !=3D pd->dev.of_node) is true, then the driver e=
nds
> up in endless loop, forever, locking up the machine.

Thanks for the patch, this looks correct to me.

Reviewed-by: Gareth Williams <gareth.williams.jx@renesas.com>

Best Regards,

Gareth

>=20
> Fixes: aad03a66f902 ("clk: renesas: r9a06g032: Add clock domain support")
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Gareth Williams <gareth.williams.jx@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
> V2: - Drop Phil, add Gareth
>     - Add Fixes tag
>     - Add RB from Geert, Ralph
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c
> b/drivers/clk/renesas/r9a06g032-clocks.c
> index 1488c9d6e6394..983faa5707b9c 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -412,7 +412,7 @@ static int r9a06g032_attach_dev(struct
> generic_pm_domain *pd,
>  	int error;
>  	int index;
>=20
> -	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
> +	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells",
> i++,
>  					   &clkspec)) {
>  		if (clkspec.np !=3D pd->dev.of_node)
>  			continue;
> @@ -425,7 +425,6 @@ static int r9a06g032_attach_dev(struct
> generic_pm_domain *pd,
>  			if (error)
>  				return error;
>  		}
> -		i++;
>  	}
>=20
>  	return 0;
> --
> 2.35.1
