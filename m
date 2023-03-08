Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AECC64EC4
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 04:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229645AbjCHELe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 23:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjCHELd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 23:11:33 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EB56A0F02
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 20:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678248691; x=1709784691;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LEKP7t0Aq5YbDCnt4RRCHWXDIBxw5gwoqtVyqxFEYbk=;
  b=jQSIUC4JJrElwtDyU6JqZ1QH7q3Cl67OfcLO10yafrUJt1fH+InDx4O+
   VoYn88a+rNVFy37wp5Z+YQWe3Fuqv3C3KWC9h06gtI4BZ0P/nAN7zJqTT
   2jXoHMcUQ0AIB4awXUo5RrtvxlgFhJWjqKbsjuZ8jsyCPws3QWjAY0G3s
   iUyaQZf9qhlo1ZsLnxfkspGD1IAbp7Mvs9cffmoF6ZpJrUP7Vgm9Nm8ds
   JyaTkvoi/5LjYfr11KhFfFSevjuEnxMAiMtah8PZ/ostnqxD7XXUcZ1zl
   X3WNAKpGVSF2VJb/H8gM7rlwNtlTUGX5hQIW/SG+Jc0axh4kUiHwd/cR3
   g==;
X-IronPort-AV: E=Sophos;i="5.98,242,1673884800"; 
   d="scan'208";a="329424444"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Mar 2023 12:11:28 +0800
IronPort-SDR: sJww7S+grse9u9l6wEW+eJ+U23ndFxdy5Y72dvzs1bsJhCQzx9BPPQIizFJh7QriKUfCXxL89U
 rXIiBOWE7C0KF+4ovOvgLv8p0B3dZlPpw4cLbgczlXPtkCyH9qIvaP6e3ccj4r+uAf4ZmJKoUN
 98NtSLQXkDa56XaBJT6528LVkkBmRum7ul60hXcUM0Q7/Db7Ft0aVsssbxOt2LjAR9c+u8l+Nc
 OKl/ND+toXOojPwgciMRMlOJzzuVXaYCE/l9QTiYXJnXCsaPKx2UqnOsliCDY1Ym+Y2XV9CDGW
 7lA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 19:28:08 -0800
IronPort-SDR: r23u8iKMfElVExh9tYhRMiKTnnctOFGaqZwi6vcYa+l+g2K+tVfXOtqQFJ8t1WtbpCUUUY3kdy
 coX1CoCUpxf+Z/YWOqqZHnV3FP5ttt+YsA/fkhSXMcnigBAavQHG6/pgKb+SrkNu5wiVjirujJ
 t8OOznsk//QU0LjkoY9TuZ7cEV3PJ4YdcMeoR0jDuDLG7ttSavAX2Wm9gmsZ61/wP8WO16luUM
 6meZzrTkuKiUSZfb464FW+ej5PNj3SpexYqoa853Xrx6Lg/Ro7uqspUKvCAAHdkG1C6+I2+7Gb
 F0Q=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 20:11:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PWf5D2YPtz1Rwrq
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 20:11:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1678248687; x=1680840688; bh=LEKP7t0Aq5YbDCnt4RRCHWXDIBxw5gwoqtV
        yqxFEYbk=; b=q0mnBOHsVWw3l/BRU2nYwrSd/jX0Vw2dqn55Yu+QIfz1asZFcZT
        fmwpZ50hjvsd908/9dyAhJ3YlUyn4CPA3Hg7dZ5/ruP+t5HnSJYxNzVN6a5a3Kmh
        kxx+IqYNIBf8cVwRDxDid2sbqYvONNHwEPUK6iF/ETINauMFB1EvXOHROJwEn6F/
        5T4emscBRdRieLDxsqzn+kptdNTJ4gUikkWtpLv23vZOeA8C5QmlEtz3h1cD2h1H
        5NCScFfUlFd016nEFmkZubNTi4B62bb29Qi5oSS/gTrzlNa1J5BKN5U23DLGxwng
        nzhr2EfzaGkbex7rYum1OU6KHTWJIK5QnGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id mbm3N1MtMDuq for <linux-clk@vger.kernel.org>;
        Tue,  7 Mar 2023 20:11:27 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PWf594Y76z1RvLy;
        Tue,  7 Mar 2023 20:11:25 -0800 (PST)
Message-ID: <debe0a4a-126f-2308-d40c-32ed2d9f91e3@opensource.wdc.com>
Date:   Wed, 8 Mar 2023 13:11:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-riscv@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yimin Gu <ustcymgu@gmail.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Waldemar Brodkorb <wbx@openadk.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
 <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
 <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/8/23 12:46, Jesse Taube wrote:
>=20
>=20
> On 3/7/23 22:42, Damien Le Moal wrote:
>> On 3/8/23 12:23, Randy Dunlap wrote:
>>>>> OK, I don't know how it happened. I cannot reproduce it now.
>>>>> The failing .config files has CONFIG_MMU is not set (for RV32I), wh=
ich
>>>>> appears to be impossible.
>>>> These patches add `CONFIG_MMU is not set` (for RV32I).
>>>> But no worries it seems to be a non issue=C2=A0 now.
>>>>
>>>> Your thoughts Damien?
>>>>
>>>
>>> Thanks for reminding me.
>>>
>>> With these 3 patches applied to linux-next-20230307,
>>> I still get this build error.
>>
>> Does this help ?
>>
>> diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
>> index 2527cf5757ec..7796c5f1d109 100644
>> --- a/drivers/soc/canaan/Kconfig
>> +++ b/drivers/soc/canaan/Kconfig
>> @@ -4,7 +4,8 @@ config SOC_K210_SYSCTL
>>          bool "Canaan Kendryte K210 SoC system controller"
>>          depends on RISCV && SOC_CANAAN && OF
>>          default SOC_CANAAN
>> -        select PM
>> -        select MFD_SYSCON
>> +       select COMMON_CLK_K210
>> +       select PM
>> +       select MFD_SYSCON
>>          help
>>            Canaan Kendryte K210 SoC system controller driver.
>>
>> (just noticed that there are whitespace errors here...)
>>
>> Note that both the sysctl and clk driver depend on RISCV. I think thes=
e should
>> probably also depend on 64BIT, and eventually add a "|| COMPILE_TEST" =
as well.
>> So something like this:
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index b6c5bf69a2b2..657a36d2640d 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -431,7 +431,7 @@ config COMMON_CLK_FIXED_MMIO
>>
>>   config COMMON_CLK_K210
>>          bool "Clock driver for the Canaan Kendryte K210 SoC"
>> -       depends on OF && RISCV && SOC_CANAAN
>> +       depends on OF && RISCV && SOC_CANAAN && (64BIT || COMPILE_TEST=
)
>>          default SOC_CANAAN
>>          help
>>            Support for the Canaan Kendryte K210 RISC-V SoC clocks.
>> diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
>> index 2527cf5757ec..1745a614d2a7 100644
>> --- a/drivers/soc/canaan/Kconfig
>> +++ b/drivers/soc/canaan/Kconfig
>> @@ -2,9 +2,10 @@
>>
>>   config SOC_K210_SYSCTL
>>          bool "Canaan Kendryte K210 SoC system controller"
>> -       depends on RISCV && SOC_CANAAN && OF
>> +       depends on RISCV && SOC_CANAAN && OF && (64BIT || COMPILE_TEST=
)
>>          default SOC_CANAAN
>> -        select PM
>> -        select MFD_SYSCON
>> +       select COMMON_CLK_K210
>> +       select PM
>> +       select MFD_SYSCON
>>          help
>>            Canaan Kendryte K210 SoC system controller driver.
>>
>> COMPILE_TEST is optional though, but I do not see any reason why not e=
venthough
>> in practice these drivers will likely never end up in 32-bits SoC.
>>
>>
>=20
> Oh thanks I was in the in the midst of making a similar patch.
> Do you want to submit it or shall I. Also thanks for the help with this=
,=20
> was using tag 6.2.

I am busy with other stuff and do not have time to properly test this. So=
 please
feel free to go ahead and send something fully tested.

--=20
Damien Le Moal
Western Digital Research

