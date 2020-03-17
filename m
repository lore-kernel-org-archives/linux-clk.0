Return-Path: <SRS0=cR9G=5C=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39974C2BB1D
	for <linux-clk@archiver.kernel.org>; Tue, 17 Mar 2020 19:25:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E99C120738
	for <linux-clk@archiver.kernel.org>; Tue, 17 Mar 2020 19:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aP8lAyE5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgCQTZe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Mar 2020 15:25:34 -0400
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]:19527
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726452AbgCQTZe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Mar 2020 15:25:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwUUf+xos9Fu38Il5Ft1rLlvrmPC6fjcRreRxdTqCE2keVf+j+tRV9vnEsU5nnFwr/WtdZshMValEqJYk7xXs1kGWlVfShJEILdlpM72OiThybODsaPSlZ7omAF11VRcI6B4iMDh98+h9NNN79cwsAswnOs5U/NwCChsintWAhzI2Fg/0w2WM3Xw+39kmwvn6t+tur6Im4sA34FWUnqRGv7/F0fApDr42yOm5ZH2h00P1lvhjH/H7VPyrf2inzG4K2b8tzdxI/cgg7CwV+50+qNaBJkx5Cu3cVEUa4uc/DX6wzPbntCN+4EfUT+SuHT3ESVktgIugT9D+cWOUBfW5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRr6IIQSfIOzAZex5zW8dYAPAp+aahvugMA72oRtshk=;
 b=ZU1KuehTWsi0WjIWcmQAAIXuCiw8UZTqeaaFaWa5GhghoQ+J25iOPOV5Bkp0rp6AwKd0l40kRFFtXLyJ1YANfteM0NvM3zQxxq6xXFlWp/hHztt24E4N5Mbgnuvzyjpod3jfR/99BNa/ztUk756cJz8zpjPHrdQ9IW3LLdcWGSYYfOdkFfnvvkGlYVbs1sZqg2kUuLLUbmi13OxQkK5Q0yx7YLS2FECr2Dx8Fi9pFt+qm7GON+/scQAXdBJDc59q5Hy2oW+1m/mxUzGMeOdgSKQJsvEcS7V6ch6ilgLr4aktJQX/60R2nyGghLNWG1jfWaMqTEYP6F/bNrHSOfP/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRr6IIQSfIOzAZex5zW8dYAPAp+aahvugMA72oRtshk=;
 b=aP8lAyE5RNz16DfZZIPlHoMxpO3vOsvfsbyVo4oC3c5KgiaF5pexNmEHPI0OijEHtNkWN045O9pZphWoAKXumebVsY3sRnCJt1Zg6zrViZdwEjp6pvjdG/AvTOdeDgOGEsOq/Pp+btzKuA5kh7sqhrRUpAxDqb6bsQT+CRAjJXM=
Received: from VI1PR04MB6941.eurprd04.prod.outlook.com (52.133.244.87) by
 VI1PR04MB4430.eurprd04.prod.outlook.com (20.177.53.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.21; Tue, 17 Mar 2020 19:25:27 +0000
Received: from VI1PR04MB6941.eurprd04.prod.outlook.com
 ([fe80::289c:fdf8:faf0:3200]) by VI1PR04MB6941.eurprd04.prod.outlook.com
 ([fe80::289c:fdf8:faf0:3200%2]) with mapi id 15.20.2814.021; Tue, 17 Mar 2020
 19:25:27 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck Lenormand <franck.lenormand@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Thread-Topic: [PATCH v2 1/8] clk: imx: Align imx sc clock msg structs to 4
Thread-Index: AQHV6Ar29fUTh/h0xEeUNN9RFuY7RA==
Date:   Tue, 17 Mar 2020 19:25:27 +0000
Message-ID: <VI1PR04MB6941383E77EC501E96D2CBB0EEF60@VI1PR04MB6941.eurprd04.prod.outlook.com>
References: <cover.1582216144.git.leonard.crestez@nxp.com>
 <10e97a04980d933b2cfecb6b124bf9046b6e4f16.1582216144.git.leonard.crestez@nxp.com>
 <158264951569.54955.16797064769391310232@swboyd.mtv.corp.google.com>
 <VI1PR04MB70233A098DC4A2A82B114E93EEED0@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <158276809953.177367.6095692240077023796@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 782aa1a2-dee5-4b89-fb80-08d7caa8f2c9
x-ms-traffictypediagnostic: VI1PR04MB4430:|VI1PR04MB4430:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB44307A11C734F634C6F033BEEEF60@VI1PR04MB4430.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(199004)(186003)(44832011)(316002)(26005)(8936002)(8676002)(81156014)(54906003)(81166006)(5660300002)(7416002)(110136005)(71200400001)(2906002)(66556008)(7696005)(6506007)(66446008)(53546011)(76116006)(64756008)(478600001)(66946007)(55016002)(52536014)(91956017)(86362001)(66476007)(33656002)(4326008)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4430;H:VI1PR04MB6941.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lho5ObqdQ9QumK0hbpy8nzcTQp5OPuBIJTujmOjVNxDEWd6lzs41w1RGDbkUutxi9cyjGkQmvbqavLrG0ZFKEf1OJtzbqAyC+Tm51GbMRDSCmskHtf4816W6E84NDzgpYGoFI0WqzhnyAGRKG40QO+3rlUlFsc2u9oLV3R/E1fjDQrefk/yJuHuQiST6Xcbe1taFMmHojvg6lJBHSnQqporNf/cPzvzCafuLvqco+N1Q7PVfGe9LxXoqZ6Tx/0u6mn9KPenRUSEkoA8op5RiIRxnLekC+ZGkJvRAAv+w7TopQbp3Y3HdjiaXJJ0Mv8etDyO7XEIQIsNl2ZYu5ze2YSWFyEcvhSWGUKNWQTruQ6JPtrH+t9tg9ATOveU0xXx/Ci2AJUqWr++fxML81B64BXUNKm175C6ej/xpgj4ceoMpL98Dw6xxUJDjgto3OgL2
x-ms-exchange-antispam-messagedata: YMkPkaOe5AdkRaTySb+dJSfCThH+oCTZREqNFaoXUeqjzIqFMQqz0hs/Ekdef8LXzFG4NldAGPnTh7HHcDoadaFxtRX4i43hdF9TpYv2etfpUkjwJvVzSTKFJvn/Jil3boiVhrCUjpSgIOqdalepGQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782aa1a2-dee5-4b89-fb80-08d7caa8f2c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 19:25:27.1351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kjL3YHcLIkDqxJxcwD9HHp5SJiGzq0xdz9KuNyGvNhoQU2FzRstowWWjUFlSCfsnM+bmO5UPPvWIXDKYpXqWHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4430
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020-02-27 3:48 AM, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2020-02-25 11:52:11)=0A=
>> On 25.02.2020 18:52, Stephen Boyd wrote:=0A=
>>> Quoting Leonard Crestez (2020-02-20 08:29:32)=0A=
>>>> The imx SC api strongly assumes that messages are composed out of=0A=
>>>> 4-bytes words but some of our message structs have odd sizeofs.=0A=
>>>>=0A=
>>>> This produces many oopses with CONFIG_KASAN=3Dy.=0A=
>>>>=0A=
>>>> Fix by marking with __aligned(4).=0A=
>>>>=0A=
>>>> Fixes: fe37b4820417 ("clk: imx: add scu clock common part")=0A=
>>>> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>=0A=
>>>> ---=0A=
>>>>    drivers/clk/imx/clk-scu.c | 6 +++---=0A=
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)=0A=
>>>>=0A=
>>>> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c=0A=
>>>> index fbef740704d0..3c5c42d8833e 100644=0A=
>>>> --- a/drivers/clk/imx/clk-scu.c=0A=
>>>> +++ b/drivers/clk/imx/clk-scu.c=0A=
>>>> @@ -41,16 +41,16 @@ struct clk_scu {=0A=
>>>>    struct imx_sc_msg_req_set_clock_rate {=0A=
>>>>           struct imx_sc_rpc_msg hdr;=0A=
>>>>           __le32 rate;=0A=
>>>>           __le16 resource;=0A=
>>>>           u8 clk;=0A=
>>>> -} __packed;=0A=
>>>> +} __packed __aligned(4);=0A=
>>>=0A=
>>> Sorry, this still doesn't make sense to me. Having __aligned(4) means=
=0A=
>>> that the struct is placed on the stack at some alignment, great, but it=
=0A=
>>> still has __packed so the sizeof this struct is some odd number like 11=
.=0A=
>>> If this struct is the last element on the stack it will end at some=0A=
>>> unaligned address and the mailbox code will read a few bytes beyond the=
=0A=
>>> end of the stack.=0A=
>>=0A=
>> I checked again and marking the struct with __aligned(4) makes it have=
=0A=
>> sizeof =3D=3D 12 as intended. It was 11 before.=0A=
>>=0A=
>>       static_assert(sizeof(struct imx_sc_msg_req_set_clock_rate) =3D=3D =
12);=0A=
>>=0A=
>> After reading through your email and gcc docs again I'm not sure if this=
=0A=
>> portable/reliable this is but as far as I understand "sizeof" needs to=
=0A=
>> account for alignment. Or is this just an accident with my compiler?=0A=
>>=0A=
>> Marking a structure both __packed and __aligned(4) means that __packed=
=0A=
>> only affects internal struct member layout but sizeof is still rounded=
=0A=
>> up to a multiple of 4:=0A=
>>=0A=
>> struct test {=0A=
>>          u8      a;=0A=
>>          u16     b;=0A=
>> } __packed __aligned(4);=0A=
>>=0A=
>> static_assert(sizeof(struct test) =3D=3D 4);=0A=
>> static_assert(offsetof(struct test, a) =3D=3D 0);=0A=
>> static_assert(offsetof(struct test, b) =3D=3D 1);=0A=
>>=0A=
>> This test is not realistic because I don't think SCU messages have any=
=0A=
>> such oddly-aligned members.=0A=
>>=0A=
> =0A=
> I'm not really sure as I'm not a linker expert. I'm just especially wary=
=0A=
> of using __packed or __aligned attributes because they silently generate=
=0A=
> code that is usually inefficient. This is why we typically do lots of=0A=
> shifting and masking in the kernel, so that we can easily see how=0A=
> complicated it is to pack bits into place. Maybe it makes sense to get=0A=
> rid of the structs entirely and pack the bits into __le32 arrays of=0A=
> varying length. Then we don't have to worry about packed or aligned or=0A=
> what the compiler will do and we can easily be confident that we've put=
=0A=
> the bits in the right place in each u32 that is eventually written to=0A=
> the mailbox register space.=0A=
=0A=
These message structs are not as complicated as hardware register, for =0A=
example everything is always on a byte border.=0A=
=0A=
In older versions of the imx internal tree SC messaging is done by =0A=
packing into arrays through a layer of generated code which looks like this=
:=0A=
=0A=
          RPC_VER(&msg) =3D SC_RPC_VERSION;=0A=
          RPC_SVC(&msg) =3D U8(SC_RPC_SVC_MISC);=0A=
          RPC_FUNC(&msg) =3D U8(MISC_FUNC_SET_CONTROL);=0A=
          RPC_U32(&msg, 0U) =3D U32(ctrl);=0A=
          RPC_U32(&msg, 4U) =3D U32(val);=0A=
          RPC_U16(&msg, 8U) =3D U16(resource);=0A=
          RPC_SIZE(&msg) =3D 4U;=0A=
=0A=
The RPC_U32/U16 macros look like this:=0A=
=0A=
#define RPC_I32(MESG, IDX)      ((MESG)->DATA.i32[(IDX) / 4U])=0A=
#define RPC_I16(MESG, IDX)      ((MESG)->DATA.i16[(IDX) / 2U])=0A=
#define RPC_I8(MESG, IDX)       ((MESG)->DATA.i8[(IDX)])=0A=
#define RPC_U32(MESG, IDX)      ((MESG)->DATA.u32[(IDX) / 4U])=0A=
#define RPC_U16(MESG, IDX)      ((MESG)->DATA.u16[(IDX) / 2U])=0A=
#define RPC_U8(MESG, IDX)       ((MESG)->DATA.u8[(IDX)])=0A=
=0A=
and the message struct itself has a big union for the data:=0A=
=0A=
typedef struct {=0A=
          uint8_t version;=0A=
          uint8_t size;=0A=
          uint8_t svc;=0A=
          uint8_t func;=0A=
          union {=0A=
                  int32_t i32[(SC_RPC_MAX_MSG - 1U)];=0A=
                  int16_t i16[(SC_RPC_MAX_MSG - 1U) * 2U];=0A=
                  int8_t i8[(SC_RPC_MAX_MSG - 1U) * 4U];=0A=
                  uint32_t u32[(SC_RPC_MAX_MSG - 1U)];=0A=
                  uint16_t u16[(SC_RPC_MAX_MSG - 1U) * 2U];=0A=
                  uint8_t u8[(SC_RPC_MAX_MSG - 1U) * 4U];=0A=
          } DATA;=0A=
} sc_rpc_msg_t;=0A=
=0A=
This approach is very verbose to the point of being unreadable I think =0A=
it's much to message structs instead. Compiler struct layout rules are =0A=
not really all that complicated and casting binary data as structs is =0A=
very common in areas such as networking. This approach is also used by =0A=
other firmware interfaces like TI sci and nvidia bpmp.=0A=
=0A=
imx8 currently has manually written message structs, it's unfortunate =0A=
that a bug was found and fixing required a scattering patches in =0A=
multiple subsystems. Perhaps a better solution would be to centralize =0A=
all structs in a single header similar to drivers/firmware/ti_sci.h?=0A=
=0A=
In order to ensrue that there are no issues specific to the compile =0A=
version perhaps a bunch of static_assert statements could be added to =0A=
check that sizeof and offset are as expected?=0A=
=0A=
---------------------------------=0A=
=0A=
As far as I can tell the issue KASAN warns about can be simplified to this:=
=0A=
=0A=
struct __packed badpack {=0A=
     u32     a;=0A=
     u16     b;=0A=
     u8      c;=0A=
};=0A=
=0A=
static_assert(sizeof(struct badpack) =3D=3D 7);=0A=
=0A=
static void func(void *x)=0A=
{=0A=
     u32* arr =3D (u32*)x;=0A=
     arr[0] =3D 0x11111111;=0A=
     arr[1] =3D 0x22222222;=0A=
}=0A=
=0A=
static int hello(void)=0A=
{=0A=
     struct badpack s;=0A=
     u8 x =3D 0x33;=0A=
=0A=
     printk("&s=3D%px &x=3D%px\n", &s, &x);=0A=
     func(&s);=0A=
     // x could be overwritten here, depending on stack layout.=0A=
     BUG_ON(x !=3D 0x33);=0A=
=0A=
     return 0;=0A=
}=0A=
=0A=
Adding __aligned(4) bumps struct size to 8 and avoids the issue=0A=
=0A=
Added KASAN maintainers to check if this is a valid fix.=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
