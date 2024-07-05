Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2102.outbound.protection.outlook.com [40.92.103.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BA914A629
	for <linux-clk@vger.kernel.org>; Fri,  5 Jul 2024 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720183153; cv=fail; b=QgLq7CjFQdF63hrapGzBkQkl/UcXDy7LV4ZhMOuuj8hdtbN7wa8zzSJ0nnI9K4+rYSj0ecMl4okXy+vNB/JF3XZualDVt/zRU80Sdix8Z6Cn4Sp4mbsMZ9Fu22QAEgP0dWmBG+tHw/MVUdjw4CJYZNZiEiQlUIs/1hMl+ZYLD3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720183153; c=relaxed/simple;
	bh=JcxaNV0loAH0NtvXpNcOYkiuCVG0ebsxxiTHO2wG3aI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u73jeHYdrG75BRk6uq+IkTrmkNOMo+CvffuYaJqCqP6FTuTLa9NhC8x9BMhJsIdNrCzDDOZEWPXo2snILaA2ky78AvqLzpgtTrr/H9LzIL8xdd33Hn2P2YfEiT/6cLSaDkGjgVt8hAr+jAaLYO6zRvKrMP/Ja0uNpovWO2h9fZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ln38gqJc; arc=fail smtp.client-ip=40.92.103.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ln38gqJc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhCOvngeqXlWX39ODM1TvQ6ZrZZCMF57UMuu62+OKnsaQClQWwfPqTsPKYLoByzAlWN8eaFasHubcs/1veNEsdjd+YBTOr6XzJFzSnblfeT+bolPmJFnugf0e/gE17t8MSCYm/BbWQr3hXukI2duZNC5DYcnHfxKobPetCccuZT8bz3s5yhnT1R8PFtLFZxDAFWxyXzqUHS7JzbJZOnvHa5WHr/IogruUv4onWBNVqBQaGqCoC9jWhdSjQBb19wf4ciKPi4XL5Rh8u+pHb9ajCAt2c1V9ARY6Hoao4I8BKOU7/37dxw2RBieAKONfTRb2x9YAhjycUraVFEH3sIb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwwuibg7rzbiOrFoCqqc4PSd1JP4j20igxvJdL5HuCA=;
 b=HJsjJw5jTxHFNqz4TOhSkbxJ8Ow/RXRK9KKIlmv5VsZH+GlPnEUtuw3HQhyb0wlbjQ0aLey5HKhtaPgm7g98xPKjaebYKaHpzEDlG2KgatC3qTqX3n7RRixPNhvzsINu0q5oSv4VOcP3gjGbjuoxBWxaNZUB9MArOjsbN7ScRZqaJehle+JSABUQKC3iMMO8Js5u5w4nH6rM7D9dBo+7e/MMtGoToF/aqhMHy++AM7QCXHSpEtalDOiBDE91XbdeYKQWXDlMzfAGFcoKWnPFAEUsgB16AbIoFJ4dH7uTIcITvOWU6gRAT98uxc5GGQnirkCD5v806OJLF+nQUJXw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwwuibg7rzbiOrFoCqqc4PSd1JP4j20igxvJdL5HuCA=;
 b=ln38gqJcbbG9Id/MJyLIsdwbeoACw5MlWVU2srLOx6fsEsrLrxqJ6ujHeIBgrnvOG8lYjZd2Uu2qgUOcHxYauJL9HUp77XPzlPOdHXdp9LhjTIiLQLVq/T0MdQkOP4cxiAYBzrgHKyoETHv4z98ZhicFN0ARnyJNRtiw1MWI4knR7kO2abqJM3cBd1Ksw0Jry9WE6B9jttk12bgaZxI1ELE93FggDyaB5m3iaDe5NDSdLl8itpOr9Q+kZbF9FhXhX8pnKphjMxp4D/oho73WF8/NMci7WQCCO8KvUl3aM26RcQCBLLXhNLuf2Q2m/Kb2xfVvaCtIFWoEEKnU08U4sQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MAZP287MB0452.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.30; Fri, 5 Jul
 2024 12:39:02 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 12:39:02 +0000
Message-ID:
 <MA0P287MB2822F6666A518B70019EA43FFEDF2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 5 Jul 2024 20:38:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
From: Chen Wang <unicorn_wang@outlook.com>
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>
References: <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2822C5A4682AE9EA6AB3B9E4FED72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822C5A4682AE9EA6AB3B9E4FED72@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [u2fFg8fIhhN5In+sYuycoZQGHLPolFEr]
X-ClientProxiedBy: TYAPR01CA0008.jpnprd01.prod.outlook.com (2603:1096:404::20)
 To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <1bd7b08b-824c-41a3-af76-e15221a96886@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MAZP287MB0452:EE_
X-MS-Office365-Filtering-Correlation-Id: cf91e23d-dcb2-4d79-f731-08dc9cef7313
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799003|8060799006|4302099013|440099028|3412199025|1602099012;
X-Microsoft-Antispam-Message-Info:
	S7ZrqGWOkSJQmn0jXAFDso2dsh93ugZs8gfBNdffsG62DE9fmyaLZShHSHvklU3JD9rSEd+3uIKVoYRrC/j9AJtF2K9LgqVxjQFkjmdoLN9CJ4goPN96v7AEVKBU2NJNmURh/lISqvz20hGPacikNaSNIq+s9ruQojuRZBOuN1Cq34GEmt2A09kb808NRw+++lIbnW1xDD+TjBO50Cz15nkLek7MoY3wxtk2qQTvWwc60muouNziB+CuBS/XRzaQSd7LdNv22NuOheRcCbm4hSRDc7MRS7ffjpHUPYZ8hRlxtsmnZVsmbgWOaP7YvPxsdVdZbI5sTXz7VscKeCNMPdrN+ZYxRSMa7eJDRkES7QuSt8cL1XBeJLhujMycNjmOJHuyGH2JC8s/nEXnl8yv89NY3EyZED/7qxbWGn8Vr/swVnXfjc2/hP/oUe1R9n2eweTadeX3LyJ1TFd8E/XXQkZwiedfQ2cqU/lrVqqvenoWzs1Oeo3SqG/DLr+fzV2kiJo1TXEf0fJCO2FPgb7xZ/LAQsA3UrOWXaxZlfDtBeQYaMHE+MJYBh5Vsp7v58mBZBoobL2PhmMJUXHbO/Kwo0cKDT/vEI6Ra0U7Mw4j2Le1gwlv5Am1GuOf/WSn6Ti139RzbdbyNQQ1EYXDDMP2Oodx6WjdvL3utT8zBw3AsgaGwAMzpM4TL0rPEpT5ZKkdgpvvEVzpqswfgPm1KHMmT9Dj0yT9OQkzDypDubCziHN3hdIQl572kl173ruXXEs9z69ZA1+AL95nvQm3q8zdww==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHZ1OEc4YyszTWtjanBUMm14VmM2UDlzNFpnRDhJVXQ2b2VwMkQrUmVTc0dq?=
 =?utf-8?B?TW5xZEpMUjRPZE4yRWFGamhTUzUweEp0WmJNa3BIWndqSU1ickNOdE80dnlZ?=
 =?utf-8?B?MnMxc052VkxZMUxrd0phOTRlcU8rZDZhaXJXa0p4OUlydmVuTFZJR0wwRVEv?=
 =?utf-8?B?MHlleUIxSzBZdnVIUjJpdTF5MHV4Mkp2OWZIeVlqa3p6dGVLVUVoNFVtbDly?=
 =?utf-8?B?WEIwaHlHZ3FlMHF1SGJhbjhFbFovUGtFcWFOMlIwMUFnTS9TaDVXR1ZlSlF1?=
 =?utf-8?B?Unc4SDdpSGdpeXRrUzJoMWdkTkE1SExkdEdRNVZTdTBtckdYWlR1VnJCb2Z4?=
 =?utf-8?B?UTc0SkkyZ04yeVo5bUYvTDFGWS9Uc3FvTkg5UUpQTGYvSGc1ZG4vWG5qMEo1?=
 =?utf-8?B?VkhrNC9jdktPcHJibzZidEo1OXY4aWc1K0FTZnE3MWlIREhFajZReE9ESWlY?=
 =?utf-8?B?cWUzQzE3Ni9ieTBBVGNNc0RIQ2lsbngybWF0SEp1RFVWOXMwNmZ5dS9teWRW?=
 =?utf-8?B?QnpTQmY1WFlXdlk3bGxNS3cwekNYUVZQMWFhQTlnekVhMG5OMUhUZ3p0V3Zm?=
 =?utf-8?B?N1pGYUx4WTMydWM5dEN1UFZkMnV5QlRJQzBLQ0FjOHpCVXVLSTYzR2RSNTFz?=
 =?utf-8?B?UkFhN0t3L2Fjenh0OFFrcVJqM0ZQbnBHeXlJL1JFZ0lRU09UdUZ6N2cxUU14?=
 =?utf-8?B?MDVLT240MW5yeFFFVEFJRjNxRUkvZVdRRThtME4zS0sveUFlL3ZKRlA0OElz?=
 =?utf-8?B?U0RNbDkxNURFQnZFM0d1cWtFa3BUOUVLNlBhMGdDR0RKYjZZbGJEVDFjOG5X?=
 =?utf-8?B?TnF5OURIRlpQL2JvYnJqdWpiR0ZNWmRVV2kyVEl5a1ZXT0FUNUVCMERGYklR?=
 =?utf-8?B?Z2RSNktJajVTeWNUVjVpa0xhdVZuNkhEczVUcjNmd3cyWEM1SURkTUl0Q3hG?=
 =?utf-8?B?SklpUTVHSmxiVFpFQ2l4RkVQUDNRbWxLbXdlWlhnazFlZ1Z6S3k4LytzV2Z4?=
 =?utf-8?B?QUFBUWl4NWx3ZzQ4QUZWMXM0aWlldi9ZT1ppZ2swRHNZUUVEUDMyL05YVlh6?=
 =?utf-8?B?T1k5SjRUampZbjZsVzd2MTJSemNHTzRTaXRWYlkzTXEraFVYWFpXU2t6WnRX?=
 =?utf-8?B?ZUxqYmxYNE9tcWVZcnRnRThIRlozNnBFbnpJL1daNWVXdEdSOFlEMWlmc1lT?=
 =?utf-8?B?K28wNm1nNmhUY2JwWWhZd2x5SFc0S253ejZGRFBpU09KbVFhbUk4ZnErcHl6?=
 =?utf-8?B?bm5tVkwvSldRVm1qZ1J4Um9aN2NYY1I1MTdqU05mNzdJN2phbFFRc05xQWhy?=
 =?utf-8?B?MXVjRVV2V1Nybk9BQXFVTEZmMFJ5M2pCMzZqMmZXS3RiMXhPRFNxdndpTmk3?=
 =?utf-8?B?Wlhid3k4OEZ6K1ZrUXZsb2dGKzMySkthVzRuQkZHR1k3YkQ2ZkZQblFwUDJ6?=
 =?utf-8?B?TkdaM1FpSWFyem0xS3c0SytrbTRDWEVnNWZqV01aT0NGRGR0TE1MT3B6UXFo?=
 =?utf-8?B?bUlxR2kxVGEyRGxmRGZjalREc2lHQ0ZzcnRaY25YTmtua2hMbFhVOUR0SC9F?=
 =?utf-8?B?Z2IzOXB6RXB4cVRhbjVzNkZSdi9iNzFQaVpqSGFNWkFTVU1NNDZadTdLKzBD?=
 =?utf-8?B?d3hoM00wZVFKZGphY0x6VkRCclNIbUtDWXpZN3JJT0tEbGI2bEZOcm9uNmRV?=
 =?utf-8?Q?18aECCXt6GaVgPM9x4tD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf91e23d-dcb2-4d79-f731-08dc9cef7313
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 12:39:02.3764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0452

Resend.

Hi, Stephen,

Can we have this merged in v6.11?

Thanks,

Chen


On 2024/6/27 18:26, Chen Wang wrote:
> Hi， Stephen，
>
> Is it ok for you to pull this patchset？ I readlly hope we can get this 
> in v6.11.
>
> Thanks,
>
> Chen.
>
>
> On 2024/6/14 15:28, Chen Wang wrote:
>> Hey, Stephen,
>>
>> Please pull clock changes for RISC-V/Sophgo/SG2042.
>>
>> For dts part, I will handle it at my side.
>>
>> I send this PR just want to expedite patches for this clock driver. 
>> The patches have gone through 16 rounds of review [1], and I have 
>> carefully checked and revised all of them based on everyone's comments.
>>
>> Link: 
>> https://lore.kernel.org/linux-riscv/cover.1717661798.git.unicorn_wang@outlook.com/ 
>> [1]
>>
>> Thanks,
>> Chen.
>>
>> The following changes since commit 
>> 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
>>
>>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/sophgo/linux.git tags/riscv-sg2042-clk-for-v6.11
>>
>> for you to fetch changes up to 48cf7e01386e7e35ea12255bc401bdd484c34e7d:
>>
>>   clk: sophgo: Add SG2042 clock driver (2024-06-14 14:49:40 +0800)
>>
>> ----------------------------------------------------------------
>> RISC-V SG2042 clock driver changes for v6.11
>>
>> Sophgo:
>> Added clock support for sg2042
>>
>> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
>>
>> ----------------------------------------------------------------
>> Chen Wang (4):
>>       dt-bindings: clock: sophgo: add pll clocks for SG2042
>>       dt-bindings: clock: sophgo: add RP gate clocks for SG2042
>>       dt-bindings: clock: sophgo: add clkgen for SG2042
>>       clk: sophgo: Add SG2042 clock driver
>>
>>  Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml | 
>> 61 +++++
>>  Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml |   
>> 53 ++++
>>  Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml | 
>> 49 ++++
>>  drivers/clk/sophgo/Kconfig |   28 +++
>>  drivers/clk/sophgo/Makefile |    4 +
>>  drivers/clk/sophgo/clk-sg2042-clkgen.c | 1152 
>> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/sophgo/clk-sg2042-pll.c |  570 
>> ++++++++++++++++++++++++++++++++++++++++++
>>  drivers/clk/sophgo/clk-sg2042-rpgate.c |  291 +++++++++++++++++++++
>>  drivers/clk/sophgo/clk-sg2042.h |   18 ++
>>  include/dt-bindings/clock/sophgo,sg2042-clkgen.h |  111 ++++++++
>>  include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 ++
>>  include/dt-bindings/clock/sophgo,sg2042-rpgate.h |   58 +++++
>>  12 files changed, 2409 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
>>  create mode 100644 
>> Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
>>  create mode 100644 drivers/clk/sophgo/clk-sg2042-clkgen.c
>>  create mode 100644 drivers/clk/sophgo/clk-sg2042-pll.c
>>  create mode 100644 drivers/clk/sophgo/clk-sg2042-rpgate.c
>>  create mode 100644 drivers/clk/sophgo/clk-sg2042.h
>>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
>>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
>>  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h
>>
>>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
