Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D8FC433FE
	for <linux-clk@archiver.kernel.org>; Wed,  5 Oct 2022 09:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbiJEJgf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Oct 2022 05:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJEJge (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Oct 2022 05:36:34 -0400
Received: from us-smtp-delivery-115.mimecast.com (us-smtp-delivery-115.mimecast.com [170.10.129.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFD927CC2
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 02:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1664962591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=tIX4vc8dBWlM4R/MbtQuRHKga38x2FExdMlYxRu0DLg=;
        b=WGO7ZVJt1EwbunLlyeT3zToL+h2IU31IQYHhbTtiSmQrcKU8HzFkwDWOTv1EcEx/JbT8u+
        8YOwhqBx9xF3M8i38EnTO0QNg+vb4h7SZoNvz+4c4Bb6Gpzlvl1EZWqvkTGYIB5QrAh1TG
        xWwu4a8Atbn6QTT4QzNHSHrDWnvAmHW5OtU9VZehbrOPFQRxnVb65CxNoemXumkzVVbNzx
        hWQrNcxbUK3ff7EGIPJoYvVmjAVgN6Kqp4Lr0jLcgBQSTP0dHAsVt5ctg3WKZNMFZoahFX
        Qs6WHwvx/Bhyr/BCzKqeyEnzbbcwia3injwA4qTJHqqprpIS/qlso5sqFcrCpw==
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-A0ZCzVb1P-ebOOk383iVrg-1; Wed, 05 Oct 2022 05:36:28 -0400
X-MC-Unique: A0ZCzVb1P-ebOOk383iVrg-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by SJ0PR19MB4416.namprd19.prod.outlook.com (2603:10b6:a03:280::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Wed, 5 Oct
 2022 09:36:26 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::4d61:1edd:74f5:342c%6]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 09:36:26 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
CC:     "linux-kernel@" <"vger.kernel.org linux-kernel"@vger.kernel.org>,
        linux-lgm-soc <linux-lgm-soc@maxlinear.com>,
        Yi xin Zhu <yzhu@maxlinear.com>
Subject: Re: [PATCH RESEND v2 4/5] clk: mxl: Add validation for register
 reads/writes
Thread-Topic: [PATCH RESEND v2 4/5] clk: mxl: Add validation for register
 reads/writes
Thread-Index: AQHYzkwHcZxL62Wq60mV6jLfqKCvSQ==
Date:   Wed, 5 Oct 2022 09:36:26 +0000
Message-ID: <MN2PR19MB369388C0478A6DCC41B70F9EB15D9@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <cover.1663827071.git.rtanwar@maxlinear.com>
 <3bcdfdf0f66dd2fdcffbdeabb5e3ab0bfb2e3489.1663827071.git.rtanwar@maxlinear.com>
 <20220929002032.7061EC433D7@smtp.kernel.org>
 <MN2PR19MB36932AE7D8804943B14CE74BB1579@MN2PR19MB3693.namprd19.prod.outlook.com>
 <20220930010212.7860DC433C1@smtp.kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR19MB3693:EE_|SJ0PR19MB4416:EE_
x-ms-office365-filtering-correlation-id: 80b71bca-6092-457d-dec0-08daa6b5133e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: ZBU++cR1v+lo+ikDTZ43qg7G6tQcR7l6zFpozgrwqIPaHMA4nd3Ek640g3sYPDZgIuemeQGZ4RiwN/gnb+1bY/5W53qV5XXlXYyun21QkII41jfLS2RpChX2DFIfH6SOYA2wLqpyokTN/j/sPAxM/qrTi9Yfq0zVDPEdwIkMKmmjKxGfpHfJaW4uMyqmy339zBX1t+yNMC9w0gUl+VNVFQKVexi7GclUdUVov/OJnxHOmEF5PAYrLqEWNq1xy7z3lcStxZMnvPZQ/bAC2w+h2vK9AMlRs1bqVmmX0cLpxXqOHnu/oTgAa0TCtjIFYZp2vmmnHII54EWEjKwKD50/PjitfmorRUhyYvPq68wQZ9sP3Ui2Nwimi1ruI2pgxIyOpUoXimmH3q4KTCfshtKhe+s6UqDnA/nuPGhy/XIDWD1ZJwyQNnbT1tvkn//iihbqLFTjOQhevJE8gzhK1obF/NYp9k5rjkCY2/F9M9mtgRnDwK0Kzt9GymhYzPWORh8l5UbciWqOmWaIauBzFYVlNuyMZ/gQ6ftEs3g7L/8/Ry9X8PP+2Pm11swlxWV+8CShNmYckCoio9v7uRQew7Uv5uk4UBDDn8Uc1PA2s61If2r/4BoDaSHCCqEYONcEQ3+zCsgPgGdROWGo/rESk2rGsoRHAa8+OxKnaOrHosLZpDrJ7ciIVXO2IptDOpCeXXKZc8rOe7fd64LpCXZoR3y4/AMpNxIFUBm4tIXTLTdnwMMD1XkzmQwzcwleSCSpNb+nJ3CtPYNOx0nAy9MrUl1fDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(451199015)(52536014)(66446008)(64756008)(66556008)(66476007)(8936002)(41300700001)(86362001)(110136005)(33656002)(38100700002)(122000001)(38070700005)(83380400001)(7696005)(9686003)(6506007)(53546011)(26005)(107886003)(186003)(71200400001)(54906003)(5660300002)(316002)(66946007)(76116006)(4326008)(8676002)(91956017)(478600001)(2906002)(55016003);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uPsvXY8gOeNkV5vyHUjUN/VkyOGkszjabkQGjS31FnFYba5EiuHOqDrmfK/8?=
 =?us-ascii?Q?FfsEkZ6yBc2KaYq78bVO7bVp61WZ72Bw0U9rKEUbsxKK53j10JRrG2QqFjpT?=
 =?us-ascii?Q?ywFchzcXWlJ+Ay81MWJS9IMj40ubvKACjfx+xgF1ISfmKRg4B57iaOYJhqC5?=
 =?us-ascii?Q?vrYlCM7cmM0BY7gtEbfrMTfzXrQyL94dknVbCqqhFdvJholDkWhVJM/rYTHG?=
 =?us-ascii?Q?9MDz/1oEtbYEMFiWyDYz6CWRzweVaAokqlIeQ3I0wYd/hYqZ9T83zQy6I9Xs?=
 =?us-ascii?Q?+8PmyH+lEdRGXa3fAwOdt3B/xXtgxOxbA7bTPVDR5r1ictzg0wtggV87erIx?=
 =?us-ascii?Q?b87mSdPVYKMELyBG8EfpQ86MBu/KsufjuVFXIkHndNGywDO7cPeZyI8R/aHZ?=
 =?us-ascii?Q?pVxqXnaXem22ZcYPosNFKNbMShe9AlshELovnLDPlRCRrwDin81aRagiXLSu?=
 =?us-ascii?Q?ALvWaL6fwIGWl9D4ll1xtvUeya5z1QDM3n8EaOLPui0RdtZ9ZRHp/yBkceXT?=
 =?us-ascii?Q?r/yRRMUmfvP+QrisOeGIMGJg0KpAT+L71aN3uEVeXemRb9Ny91sUwEOGwLmt?=
 =?us-ascii?Q?YSXgGdhOiVh0vpDMN8Oj2o/0vPSHMot3b6+YwgjZ+8RicM/U+9ERIzzmZy7V?=
 =?us-ascii?Q?fcfJcOEuKgoMzdq4gc3yGcNsYGPBYlAUTiaSXRLsrsb51nZQ+GvqsWVoVOzu?=
 =?us-ascii?Q?CsQo2mWO/TZRowsv8igv/kaM5wchXeZqOf+0SrIhdgrEbXNXNbYjlcbfrLY2?=
 =?us-ascii?Q?1aaUe6hYc1pntWpPqhA9yVxYLB4KlB7Vl3RHGAMJZkRpnPkkbLhWbZwTTwfn?=
 =?us-ascii?Q?Nrld7c2YgAb9agBFj156PGilBfgntUTmzRG8wAbYGb+ZM1pxtUy5CYvqbWXC?=
 =?us-ascii?Q?98f5hevpngnOrfYsb3/+N/rZrmtympHKla8mwSXg0ggTm5buNkx+d8nJLZrX?=
 =?us-ascii?Q?m6YlzMiEPgTnQzxXO0UgtTb2/yBfT55wRlK8y3sOmdHS5Tc7QAa1vmIIFjru?=
 =?us-ascii?Q?gIm6TRAwAMxzxPZdfDdZdjfksG1Vp02+m3Nj4AE3viVv3my13k6DMPYX1cmX?=
 =?us-ascii?Q?YuZyCKmhpubiEtOru0X91g49KG0QfzuSAmTEzGBIIrkLLzYzDuxPEOmAJ3ai?=
 =?us-ascii?Q?bHws36MHMBJ1lAGGpxXCKHKQBuCAyXS/jrKoTXEWbpESvwiYew/KZTMF+YFm?=
 =?us-ascii?Q?d2Ef+6pqE+nayJ02CBpqclii13lV3xhS/f5OomU1KpD21kcTgaK2f7LnwRD4?=
 =?us-ascii?Q?I8ffCGzOkJcz9EsqZq3DFqk2sBOgO58LVioZ4AT3jTDfOjSDJiftVZ+BszxU?=
 =?us-ascii?Q?X7yyjKr5QmJNwQCg9pAjkU/hHlsp6QLu/p6UHNlpoVTKl+U/9ucc0FpMwRKf?=
 =?us-ascii?Q?eCW3h8LWLJPvqApB4gnyTAo1aFSuiny2g5QUVktRZ3pIizklex/Y+oX0fkp2?=
 =?us-ascii?Q?cqfZYcXKMEodYLlEXImPfHX5GqDRELqlmgF/Hc7UVS5mIURG1eovC2tALo0v?=
 =?us-ascii?Q?B3S0xtiH2DDuG6PsIkbR8yyxyFqw5UhzXPyiPN9GZgvhf9HXPFM1pz97prAi?=
 =?us-ascii?Q?Nt9JnN/86gLxsMDmMo3z4Yfl+9w1ROqTB3ioyoz87jvrCkuBkNzzjRJ3oduQ?=
 =?us-ascii?Q?JQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b71bca-6092-457d-dec0-08daa6b5133e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 09:36:26.8056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bJ4g34MltnBIAOlZ1MNrwCPaGhLLFFqmYU0fmI36r8QiFKghX0CgXmXkwPE+AH8v+4WQ0+7R6rapMdM4BeLs/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4416
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,=0A=0AOn 30/9/2022 9:02 am, Stephen Boyd wrote:=0A> This email w=
as sent from outside of MaxLinear.=0A>=20=0A>=20=0A> Quoting Rahul Tanwar (=
2022-09-28 23:10:10)=0A>> On 29/9/2022 8:20 am, Stephen Boyd wrote:=0A>>>> =
+       u32 mask;=0A>>>>=0A>>>> +       /*=0A>>>> +        * Some clocks su=
pport parent clock dividers but they do not=0A>>>> +        * support clock=
 gating (clk enable/disable). Such types of=0A>>>> +        * clocks might =
call this function with width as 0 during=0A>>>> +        * clk_prepare_ena=
ble() call. Handle such cases by not doing=0A>>>> +        * anything durin=
g clk_prepare_enable() but handle clk_set_rate()=0A>>>> +        * correctl=
y=0A>>>> +        */=0A>>>> +       if (!width)=0A>>>> +               retu=
rn;=0A>>>=0A>>> Why are the clk_ops assigned in a way that makes the code g=
et here? Why=0A>>> can't we have different clk_ops, or not register the clk=
s at all, when=0A>>> the hardware can't be written?=0A>>=0A>>=0A>> The hard=
ware can actually be written for such clks but only for=0A>> clk_set_rate()=
 op for setting the clk rate. Just that hardware does not=0A>> provide any =
way to enable/disable such clks.=0A>>=0A>> Alternative way to handle such c=
lks could be that the clk consumer does=0A>> not invoke clk_prepare_enable(=
) before invoking clk_set_rate(). But we=0A>> want to avoid making changes =
in the clk consumer code to keep it=0A>> standard. And handle it here by ju=
st validating the width parameter.=0A>=20=0A> Why not have different clk_op=
s then that doesn't do anything for=0A> enable/disable and only does it for=
 set_rate?=0A>=20=0A=0AThere is only one clk entry which falls in this cate=
gory. Adding a=20=0Adifferent clk_ops for just one clk would need many more=
 lines of code=20=0Aaddition which appears to be a overkill.=0A=0AI have re=
moved this change in v3 and used the driver internal flag to=20=0Ahandle th=
is particular clk. That requires minimal change and looks=20=0Alogical addi=
tion.=0A=0AThanks,=0ARahul=0A=0A=0A>=20=0A=0A

