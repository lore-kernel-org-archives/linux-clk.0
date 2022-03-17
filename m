Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E2CC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 17 Mar 2022 06:18:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiCQGTR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Mar 2022 02:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbiCQGTH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Mar 2022 02:19:07 -0400
X-Greylist: delayed 2891 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 16 Mar 2022 23:08:11 PDT
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1515.securemx.jp [210.130.202.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA72FDE91F
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 23:08:10 -0700 (PDT)
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1515) id 22H5K0fg006511; Thu, 17 Mar 2022 14:20:00 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 22H5Jgqw031268; Thu, 17 Mar 2022 14:19:42 +0900
X-Iguazu-Qid: 34ts2h0wWrGoc7W7iG
X-Iguazu-QSIG: v=2; s=0; t=1647494381; q=34ts2h0wWrGoc7W7iG; m=n28StlUQtG5hQDddNFnfOu+3YH3aQ3yXP1Ucg1Nt/aM=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1513) id 22H5Je69021763
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 17 Mar 2022 14:19:41 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8lp/1bA3V3ceed9kFmZBHf8I1Gx5DdXzEJ1vlSwI2QqaNS8uZ6f6iNgmSwg7P+jagcv3BFpm/fvLR5HsgA3S6NHbpbrmFK1zfSFz/cISr2uvGCzIhXXA+eS94UqZc1UpUJdn/tGToyPJ5pokgE1p0mW6TFRqgR1baCTykTTwYRG3Z6PtkqA5SVbqPhohvHp+eKyawGad1pXI7Kvd/Ju45/2Gbx4KHuLFFY9FeY4k034r9tO98MqjQQsmm/NPw82k3TdM4FOtWLuW8C7UGe6TIe0x9y9HkcSC4kn3q75gYDOpEjFuaoPIBIaD6+8h7EQYTkBZ6jy8CcQzoSCr017Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxbJ8Wl7CY5b+9KRGpcVwbJskz1q7HNTx/Mct04IXbo=;
 b=QbhO0zz0Bg2xuezRVjAb/1O2iatU5/rkzlOpziNCZ0BjnrgXOzsWLeS8QuPPYzdzGu14LCLQqaNxqwCjCmL8KVo2OZRyJa2mtIudVlg9dIJB7kxKLNbPlz8HvP7OCPq2g1mPqLOnQ6bRzkRk8X7yyONGyILo7jhaO0ud+CSI79JAvU/QeZBXN0hrRwUn2VNL6RTYub9dPj2B/roa4hdcRaBzkhwYhzL+3xOFEeT703TXmdbhsMLCHqV8Hrk8ykEKsww1Rhzymd9uEs1DI9mAg3F9je2q9Xb2yjESNCr63rZhQgs3+ZCNj0tAXKHH1BgopKaTyAWcTdhE9Ch63BUJzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     <dan.carpenter@oracle.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] clk: visconti: prevent array overflow in
 visconti_clk_register_gates()
Thread-Topic: [PATCH] clk: visconti: prevent array overflow in
 visconti_clk_register_gates()
Thread-Index: AQHYORDkCeP7wUSMY0iJpoiMRwAW3qzDCVig
Date:   Thu, 17 Mar 2022 05:19:36 +0000
X-TSB-HOP2: ON
Message-ID: <TYAPR01MB6252624D81E31ECFBFDC196692129@TYAPR01MB6252.jpnprd01.prod.outlook.com>
References: <20220316083533.GA30941@kili>
In-Reply-To: <20220316083533.GA30941@kili>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44845194-26bb-4a5a-8e9d-08da07d5bb10
x-ms-traffictypediagnostic: OSBPR01MB1606:EE_
x-microsoft-antispam-prvs: <OSBPR01MB160622C14354137CB9E2E5D092129@OSBPR01MB1606.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2j9OFp74/ctoSHXtM4fBIARjFyUKBg1NwOHiNDKq8AKGsgKmNaRRp/dzdInCErdDskMFHgCGN8PLJK6YkPLVyGi34usd3JsuiCZBjYIDFpktHg82dONpsHIebCgGLNN8YoeGAUtVZraRQuztC8r1/OCMQua01UxY4UL+5tpye3aB4a824utLurXcBRwa1g1dhfZVb7Yxc8A3CFCuX/2Qkjors4sR8n4AssKRRRU1WCeP6bC/N1pKwfjIC2CYp8Euob6RPFUNucSsc2A9oTmKwn7Cs5NG5ab5cCI2tpVEHt9TRKlOCbuJNve9kig9LXzCeLyguMFyLZsp4X9NserW7KQ6au3F9/FkJcl000ugjzWz+ZOQgG/Ft6ZsQSKswO5Ti/DH+kSXdtg4JpV6pUGnv2rFv4LcrwGF6hBU972SdQOviEvDuK0JKZtDyjuwARttvox7ZZWGLuwHBj+5FnWgVTs/CIGaLAmvg+IVdJab8g58bl5gZbo6CMCQ8kAtGv1zZIP+sE7+KC9tNeQ/28vaRkzbVj1+DDuP14VVqvaDqXarmWrXVouhJeVvJf891m4rVI8J0KLbtDHCocxYi6iHhhaFcReNyCim1hPmbRizGcDzyt5yJny87AqS5cadZjb0FHSEYHZIdVQ4CMl2NmC3289xabYAo/5L2iuXphQxf+nToh03dKDSWCcl1ko6zPsW0gAFQFgZyHCgzSj2+EeC9A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB6252.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(508600001)(52536014)(2906002)(8936002)(122000001)(5660300002)(53546011)(7696005)(6506007)(83380400001)(110136005)(38100700002)(54906003)(316002)(71200400001)(38070700005)(64756008)(4326008)(86362001)(76116006)(66476007)(66556008)(55016003)(66446008)(8676002)(66946007)(26005)(186003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?Q3I0cWxCYUI3QTFsbUdIeXhXb3REdlYxK1N2cGtiSTRoelRJZEFMa2Vj?=
 =?iso-2022-jp?B?TGYwU01FSmdhKzFBZWREUmdxbVV1ZDVSd3ErMGJNOW9Dck5uTXVnY1J1?=
 =?iso-2022-jp?B?Uy8zaU9HYlVrSk1FNGVKSUtORGJlZDJJTmZndm1KbGsrc0FFYTJQVkxi?=
 =?iso-2022-jp?B?M1BqVExVRC9UZGREYUp1eEEwVmZIWVBGRk5ya01POFRnZExGWmZHSGtr?=
 =?iso-2022-jp?B?Q3NSVWFubDhmTkhRaHJDTnFJeFJFK0RnK2dLcll1T0wrdDJMSEltUkhm?=
 =?iso-2022-jp?B?VnhTaWJ1QUJtejI2clhhZ2t6cFhEamRmMUpjemptOFMzdEp0Wm9wVldm?=
 =?iso-2022-jp?B?YlhkcXlIRlRacnZOdzdjWHBSSmF1dlJtRHcvNnJYR09pQVJIa3ROb0Vo?=
 =?iso-2022-jp?B?MW9wSGpsaTRBOHFVWHJxTVVVbWRTbGV0UDBZcUdVSzMzUmNJTUE5Rmlk?=
 =?iso-2022-jp?B?VGwyMFlxY3pzZ0tnQWVJby8vdTNjM2xwV1FvcVU1MDJkVitpY0VpQjgr?=
 =?iso-2022-jp?B?Z3hEeVNmRUM5U3hJRUk2MVZXY25nMkFEbGJIS3l6TlQ3Zms4M044SHJk?=
 =?iso-2022-jp?B?dXY1UVpRbVlPWC9BeUkydmU1dWxoWk5ISDlLTjd3WVZVcVVIU1NzYnRT?=
 =?iso-2022-jp?B?ZDNLTmpjeXR3RnJrQVRqdGFCZENaK29oQ1J0anJHaTR2MStneWdEWitO?=
 =?iso-2022-jp?B?V056Wmc4Ym9mY21JVUNLU1pEN3preS9ORzlNVkd3aVFOVzBEcWpTVWNG?=
 =?iso-2022-jp?B?dmxCQk1IeHFod2RmQjFrc1Z1QWRWSnRjY3dNZjE0cWtoakdVK1ZXZ2Yr?=
 =?iso-2022-jp?B?QVp3QlpESFhkOURFRkVuNVRsRnJPbTNIYXlXY0Y2T3J5cDhJZ3NhQkhW?=
 =?iso-2022-jp?B?SGV6T2xzcEZLSzFVNXJwUEUrMWlQNkZzd1g4RDBPU2R1cG1xNnd1bGdn?=
 =?iso-2022-jp?B?Y3hDN2pMTzRsQ1VUdE5qWnJzWHV3dm56QnM5MjRjdnJIVkJybCtTYUM2?=
 =?iso-2022-jp?B?NzFCMmkzeHNuU09XTFkwWDBKUmpXNHlBa3VvcDB3M1ZFQzV1bVJlRTd1?=
 =?iso-2022-jp?B?S3d4NVhmdEtKN2l1blhFMzlYUTNVVUNnVDRqTVV5TGpXMWpoTTNTSU1s?=
 =?iso-2022-jp?B?cEcxSEdzcTZIMzhxckZ0N24rSDdMdURlZ1pxSXJ6aUhKYUN6NWtxVGpY?=
 =?iso-2022-jp?B?YW80ODlnS1FFWFh1cFZkcG9hRXFLNjQ0YzROQk1kN2xyb0VvYmw5a0E2?=
 =?iso-2022-jp?B?MStsSDRWRU5MNmlubGFvZmcyTkNxc0crSWV2NVZEcjgrdloyN3JpSWZy?=
 =?iso-2022-jp?B?R1h6aEVoWUw4NXArSVR0dkRwb0dNWFg2UjUvTk1PeGxZcWtjdUo5MFVY?=
 =?iso-2022-jp?B?NXJ2WmkwcUVpSC9OWFRVZnJuUnB3a0dSMXRaTnhLd0hDMlFQUjRHRHBU?=
 =?iso-2022-jp?B?TkVzYjZyUEg4ZFdMRnI0TjN4RlA2dW5WcklqSHhTVDM4U3g4N0VxTFFp?=
 =?iso-2022-jp?B?dE42S25WUVNQWWI0dStkY2xadFdMNnVhVjltb2FIMWx1d2NjQ1RyTi9y?=
 =?iso-2022-jp?B?QmorUUg5U2NnVjVKYzdQbEdkYm8weWplaU1VQ2hpdmNFVGxLL3I3a3M1?=
 =?iso-2022-jp?B?dCtmRkFuK0djSTEwYlpoK2ZYd1ljRk1qVGxHM2FoQVVnUDVodVFodTR3?=
 =?iso-2022-jp?B?cHZ6c21zaXB1aGxZcXpWZll0VHduUFZzSHlJZHJSbFlqeEtYa2QrdDEv?=
 =?iso-2022-jp?B?V3kwSTk4N3FIZldBK3JRczUvbmhuT2RQSzFPZEhiTXBQNVJOQzZDdWpl?=
 =?iso-2022-jp?B?eTFmV1ZLL3F1b1ROYjZmUGRTU1NjRXhaY1pHdTJaRGk5VUxhVDl4RGRn?=
 =?iso-2022-jp?B?YjY1VnR3YXJYQWVBenRGeS85MFRzOWJMSmVFVHNzd09uNEJ6ZnZ4U0Iz?=
 =?iso-2022-jp?B?NjJBbzBZOGdNZ3FEaEZaRWN6VURqWXNWZ2U5UGV1ci9nbWFGMHFmWnBu?=
 =?iso-2022-jp?B?akxiY1FKci9lcCt5WTNhK2xYNmp0eDM4VVNPTm1QZ2J5enVJa3hDNlRq?=
 =?iso-2022-jp?B?U2l0TXJyNk5BQ1VJVFpSeWk3empOYmxxZ3ByckNCMXBDYk92TjhURmFV?=
 =?iso-2022-jp?B?dE5KejFkTjc5QkdoeGE1NkxFQXU1ZzF3PT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYAPR01MB6252.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44845194-26bb-4a5a-8e9d-08da07d5bb10
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 05:19:36.6857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wWHs2oyG6TC521xNml4LolJh9up94If+nqscBn3Ln17xf4hUxfqf0E5y/PJmVunrDtxJqeka8qGKxb1JLSaeV7Gyax/hmyIC/VY/9AGYrmMkrQaTvYlgzY1UGVsEsImq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1606
X-OriginatorOrg: toshiba.co.jp
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dan,

Thanks for your patch.
And I forgot to update and fix on the report you sent me before, sorry.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Wednesday, March 16, 2022 5:36 PM
> To: Michael Turquette <mturquette@baylibre.com>; iwamatsu nobuhiro(岩松
> 信洋 □ＳＷＣ◯ＡＣＴ) <nobuhiro1.iwamatsu@toshiba.co.jp>
> Cc: Stephen Boyd <sboyd@kernel.org>; linux-clk@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: [PATCH] clk: visconti: prevent array overflow in
> visconti_clk_register_gates()
> 
> This code was using -1 to represent that there was no reset function.
> Unfortunately, the -1 was stored in u8 so the if (clks[i].rs_id >= 0) condition
> was always true.  This lead to an out of bounds access in
> visconti_clk_register_gates().
> 
> Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and
> reset driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good to me.
Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

Best regards,
  Nobuhiro

> ---
>  drivers/clk/visconti/clkc.h          | 3 +++
>  drivers/clk/visconti/clkc-tmpv770x.c | 2 +-
>  drivers/clk/visconti/clkc.c          | 2 +-
>  3 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/visconti/clkc.h b/drivers/clk/visconti/clkc.h index
> 09ed82ff64e4..8756a1ec42ef 100644
> --- a/drivers/clk/visconti/clkc.h
> +++ b/drivers/clk/visconti/clkc.h
> @@ -73,4 +73,7 @@ int visconti_clk_register_gates(struct
> visconti_clk_provider *data,
>  				 int num_gate,
>  				 const struct visconti_reset_data *reset,
>  				 spinlock_t *lock);
> +
> +#define NO_RESET 0xFF
> +
>  #endif /* _VISCONTI_CLKC_H_ */
> diff --git a/drivers/clk/visconti/clkc-tmpv770x.c
> b/drivers/clk/visconti/clkc-tmpv770x.c
> index c2b2f41a85a4..6c753b2cb558 100644
> --- a/drivers/clk/visconti/clkc-tmpv770x.c
> +++ b/drivers/clk/visconti/clkc-tmpv770x.c
> @@ -176,7 +176,7 @@ static const struct visconti_clk_gate_table
> clk_gate_tables[] = {
>  	{ TMPV770X_CLK_WRCK, "wrck",
>  		clks_parent_data, ARRAY_SIZE(clks_parent_data),
>  		0, 0x68, 0x168, 9, 32,
> -		-1, }, /* No reset */
> +		NO_RESET, },
>  	{ TMPV770X_CLK_PICKMON, "pickmon",
>  		clks_parent_data, ARRAY_SIZE(clks_parent_data),
>  		0, 0x10, 0x110, 8, 4,
> diff --git a/drivers/clk/visconti/clkc.c b/drivers/clk/visconti/clkc.c index
> 56a8a4ffebca..d0b193b5d0b3 100644
> --- a/drivers/clk/visconti/clkc.c
> +++ b/drivers/clk/visconti/clkc.c
> @@ -147,7 +147,7 @@ int visconti_clk_register_gates(struct
> visconti_clk_provider *ctx,
>  		if (!dev_name)
>  			return -ENOMEM;
> 
> -		if (clks[i].rs_id >= 0) {
> +		if (clks[i].rs_id != NO_RESET) {
>  			rson_offset = reset[clks[i].rs_id].rson_offset;
>  			rsoff_offset = reset[clks[i].rs_id].rsoff_offset;
>  			rs_idx = reset[clks[i].rs_id].rs_idx;
> --
> 2.20.1

