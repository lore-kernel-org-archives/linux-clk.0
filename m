Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F682C77B6E
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 12:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjDNMwV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 08:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjDNMwV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 08:52:21 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2097.outbound.protection.outlook.com [40.107.20.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC5559FF
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 05:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXt5E1JngslMyV/P6Hcw1e4zjJLZvcBY+hgGQ6y1FaZTJagAEPjFCL/FpCHos375wBBdQ65Qvz9obdC8PIdPxx2uFwN1wTxUj/CqoNWgggmC88QatcAinQwhTeVh+Kh7s9TVGEwxi0ev9rOTv89+4ftPghBOmWeuNJCW8m9nCrY8JjVkUx0HH43b6Wy5WVUYWJBvSAPDbs5Yt55sAUCvVTC3muTzE5ZKBRHC4+XapIacioO0SefYSNwEneSdmmJP28gzCPEsB/pBqGIsVFA8PRlBm4h5mhWEUNmLdpfjxSeocx442FnGSR3VteqrUECWw2OKTmyF4nqaSKusu7B+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/FIsx445zpkorcjL5Y1S01C0nNroyo73eA9Lv+90bI=;
 b=XwGXnia/Qhr5wAB22dbSn2LuTY+eGz+Xg55fA+eEPPM6N7nGdnV4nkLJDh1TqNHp6RAM/PS8g7JTkp+/cBhemf1N/68Mo4G2ihUru18FwY1ZmkT1+TAKcA4iDES0x2Cg2Xzs8okIEaj0gylciJjsg2J0Z+nXzBehiQ/voVbQvQK5BcBep/jhx5Hxe9nAKDVzbAjs0+DcEwh1LH7BCODOEXHmLlhqoaF2lz9tZKPNSpL/spRg4KIlD6Zbu+QyaT924lkTCP66moSy3zOmurElF2hvro1dU1extxVmJYz+fJMVGwr0XuBwnXslZ0fKwgqpBl2XeYvegcOkdXlZ3SqfAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/FIsx445zpkorcjL5Y1S01C0nNroyo73eA9Lv+90bI=;
 b=POG6ykVJuC1YaCjnUf7b4hJrAkNvi65O/mNBVczBowVzKlMwomK2ImYLbDIRIENE+J6U+GMwGr/h8pa/zeNDJI+8Iup4o8CDVuHXjrszVgB71etSgfcFUvU1HX5SzHRKYgbNZfdjY0s3grGCkBdVwhV5stJ7Te1LU30YmiD082E=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by AS4PR03MB8724.eurprd03.prod.outlook.com (2603:10a6:20b:58f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 12:52:16 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::39bd:559b:e92c:3871%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 12:52:16 +0000
From:   Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: [PATCH] clk: fixed: handle failed clk setup
Thread-Topic: [PATCH] clk: fixed: handle failed clk setup
Thread-Index: AQHZbs/wg8NYgL3w6keZ8goPOXqOOg==
Date:   Fri, 14 Apr 2023 12:52:16 +0000
Message-ID: <20230414125207.33722-1-emas@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|AS4PR03MB8724:EE_
x-ms-office365-filtering-correlation-id: 6e29337d-3a99-472e-e5dc-08db3ce7136e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l3coGk8BU0Hc6fvuiCfrvnedYfYqSDaAyqz64j9U33UfPWGWM2I9HHhpXja82mtLZrs2jngZLx9n/wg+HZMFACLvLNbf76iSELF2zURapUEXpf0MsOOYfpQBdrvq7VrIPR350jGs3nrnJukSFF6gxSlxanywvImsJnE3Mw8rJs5ofuBcbj8yTkXfP16pO4U7G3HQDks/IgVZT6mpi/iJ7Ko36zzApTX5z/5Bg4qepkYQKdxHCsEpEjLreVUFaWz2JyLScG4CGsd+5+NdiwWbJp3NlN4ip3N7cQLFfEdeqJJiAP0NfNMGQJzEfoxtg2pAqRh0sRL0OdAVrwmzVknIDxjYe3ETsDMkT1mkSeo6eoCSZJoBd4IV+XlQs9oPsaZMYzJriR5IzZng9o6DSujXOwvTM/Qr5Bu9ZrS+oi39sY+/T7i7vGmo9DK6M4bqy7WWnQveufCEZ2Tb53Kk5uP6+bNZQgrFNljMypQ2NEHkfrixcvjJA6nBY5TSeUXTgKCwb76zmlkn+qpyS39a/lGaPBm15RIUlJQa4ll+QyXMRKUHhoQCpCXF70nam9oXSq7Ae1tYeLdz3YE/rQ6gAdEFxGsHnfGSmlG/AQOTq70QHCzP2bvpePHbGlteQOzrS0NB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4942.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(26005)(186003)(1076003)(6512007)(6506007)(71200400001)(2906002)(6486002)(83380400001)(86362001)(36756003)(122000001)(66446008)(4326008)(41300700001)(8976002)(66556008)(8936002)(8676002)(76116006)(316002)(66946007)(91956017)(5660300002)(110136005)(38100700002)(38070700005)(54906003)(2616005)(66476007)(478600001)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FWqXHuo7hWox+9oVfxyhZUwvn/P/CY5TOUIpZDyRHQHDfbpciEW0AWZJNK?=
 =?iso-8859-1?Q?4jfKlMuSf0l/72WpnhruHQ30gM4vitwXN2ORUpQj7oWI467k2qZHelXt3d?=
 =?iso-8859-1?Q?/eg5uJDVg2taQzC1d3hD4xJv2ml6VtePVhAY9aKSdVvuYU/f43GnLDD5C6?=
 =?iso-8859-1?Q?QOP4Lq+H6z5feJB8P7E04bez9NMqHkL70Vl6uX7BMbpyv2OWnwvnQOYDGW?=
 =?iso-8859-1?Q?hR8ElvkKwuPrHM2kGpy23WlrPNBv7DHGKuMI05Qe1n+qNy6zi05wFn9Jl3?=
 =?iso-8859-1?Q?5P4RXwCBlAxKGzRrtd4VVvtlIJvr52y0cdXEQzrCvGfQ8sI3Xs/GgYl7zU?=
 =?iso-8859-1?Q?2bWLi8R520he0ukeED9GXhfqC8N8oQS/Na3FBR/fIuetkmtJimISwpY1S9?=
 =?iso-8859-1?Q?LMbxwkU2Ngyuq+kJqvcl/8eZa9NkptBcS4L7quFZ+VHDjD1b2sVWW2WqJQ?=
 =?iso-8859-1?Q?7jEsJZqnWk7vMj+d1EoERVOzcNOIX3YpR/Xu0Sgs6cwphRN+VNqRTpLTGu?=
 =?iso-8859-1?Q?GOu3oCs51efdCHB4mYWKS1XC+/82l8o14dLIcc8ceHTYDBbZfdURaIhNHq?=
 =?iso-8859-1?Q?5x358AXnrMWmkYwEC7yt3FvAuuYERvjNU0ofNbAcBeoGgCcDsSg84BtycZ?=
 =?iso-8859-1?Q?SYzcSPvyTbnlFkSGAGrz+a10acOc23zfUqpQkGSJ1+Dhm1z+dBWUqjkGtr?=
 =?iso-8859-1?Q?260EQrbd7DniJWjDlnW2eurbhbM/4QWS71gBUPNtYBhoMlpQUvKywpY2Ys?=
 =?iso-8859-1?Q?t7KGdesXc7rYrgnhjZ28oTPDx/GpK4w0SVDMsOa+jZB2P4SMXvlpViZNlg?=
 =?iso-8859-1?Q?+D8dsmJO68EMksQTP7o7rYPzgZ9SoWFLgiDQpWLwbv9npEgLaFaj/27MWm?=
 =?iso-8859-1?Q?hHtAeaIP/sH7S824G86DByOUsWwnQcrQLbz4Peheux0CuVF3ervxqQRiby?=
 =?iso-8859-1?Q?AJZjtwhVda606/ORyDFx8wbB1R6yyY1vu9SAiFbgf+NW144WPEUIQeU/9K?=
 =?iso-8859-1?Q?jVdWEFP9FSNpx6AL0x7stknqhnBPwwAq5kD7S8yXfL99zu6vhApO97g0a7?=
 =?iso-8859-1?Q?Iob2vwcACO1uXiUu3NgKCvY7W/ovg9DKHRUYVF3k8QBCCd4GJEIZKLcHdg?=
 =?iso-8859-1?Q?PVZs8GRBhco+fuPnCbrtUE96rZ8/RGCn6RaHlF7vjHJhurj84JK3PhlFKL?=
 =?iso-8859-1?Q?uKsVDxYR3y0YZ97YRjZq7gkassm11yZNfgW4dqCOTfMKQAfIqSJYFZpt5R?=
 =?iso-8859-1?Q?hFsUn54KnuJIvQi3BtNWaRyHlxActlZ1waiM5/u8LKlSBpyx++JtTgZ9Wn?=
 =?iso-8859-1?Q?3vJdf6hSOaLlv2s5wfz5OPmzwca0+Ti8HKGJnMG4xsffT0Ow6MMvleMrs6?=
 =?iso-8859-1?Q?EB/UR8wOpyCmR7Q06i4sgqnURNOXZkBJikz0SA7004y41fWqSJUd1qpoJ9?=
 =?iso-8859-1?Q?5JwrndSJFWXCIMGLK2qKyRY1kSDS0Q4xDhr8LDNDceGbd7L+0r9Fzxb/RR?=
 =?iso-8859-1?Q?40z+nyAwtJ4QXJWl0XPl2nX452WMdTV9UomKj/rixr7vxFX/M3FLqOiZ3K?=
 =?iso-8859-1?Q?4+LwVoQLu8wITZIcbChLdzOvs7V9kh+l33jjfesgdleVI3dlqcMfHKxVCt?=
 =?iso-8859-1?Q?raX0SHfAgLH8YwF7cvnMPP/WU8j91XFa5OJQcr1UiZ/i9JH7MzMQXiJQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e29337d-3a99-472e-e5dc-08db3ce7136e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 12:52:16.4117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9VkNBxH6C6DlA+ufSJDZ6SrXeKCNM0xTjVnmljAdzTAVJumHxjXWWNyx5HqimKvopcL0T/xk22YPilp0kNbApg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8724
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When initializing clock providers "of_clk_init" will try and init
parents first. But if parent clock is provided by a platform driver it
can't. Then clocks will be forced on and OF_POPULATED flag will be set
blindly. So if setup failes e.g. with -EPROBE_DEFER the clock will not
be probed later on.

This patch will clear the OF_POPULATED falg if clock setup failes.

Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
---
 drivers/clk/clk-fixed-factor.c | 19 +++++++++++--------
 drivers/clk/clk-fixed-rate.c   | 11 ++++++++++-
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.=
c
index f734e34735a9..d00837daca9e 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -268,14 +268,8 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struc=
t device_node *node)
=20
 	hw =3D __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, NULL, 0=
,
 					    0, mult, div, false);
-	if (IS_ERR(hw)) {
-		/*
-		 * Clear OF_POPULATED flag so that clock registration can be
-		 * attempted again from probe function.
-		 */
-		of_node_clear_flag(node, OF_POPULATED);
+	if (IS_ERR(hw))
 		return ERR_CAST(hw);
-	}
=20
 	ret =3D of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
 	if (ret) {
@@ -292,7 +286,16 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struc=
t device_node *node)
  */
 void __init of_fixed_factor_clk_setup(struct device_node *node)
 {
-	_of_fixed_factor_clk_setup(node);
+	struct clk_hw *hw;
+
+	hw =3D _of_fixed_factor_clk_setup(node);
+	if (IS_ERR(hw)) {
+		/*
+		 * Clear OF_POPULATED flag so that clock registration can be
+		 * attempted again from probe function.
+		 */
+		of_node_clear_flag(node, OF_POPULATED);
+	}
 }
 CLK_OF_DECLARE(fixed_factor_clk, "fixed-factor-clock",
 		of_fixed_factor_clk_setup);
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 7d775954e26d..e69f4285759e 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -192,7 +192,16 @@ static struct clk_hw *_of_fixed_clk_setup(struct devic=
e_node *node)
  */
 void __init of_fixed_clk_setup(struct device_node *node)
 {
-	_of_fixed_clk_setup(node);
+	struct clk_hw *hw;
+
+	hw =3D _of_fixed_clk_setup(node);
+	if (IS_ERR(hw)) {
+		/*
+		 * Clear OF_POPULATED flag so that clock registration can be
+		 * attempted again from probe function.
+		 */
+		of_node_clear_flag(node, OF_POPULATED);
+	}
 }
 CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
=20
--=20
2.34.1
