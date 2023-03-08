Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9911C6FA99
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 03:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjCHDnL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Mar 2023 22:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjCHDnI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Mar 2023 22:43:08 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7B8527B
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 19:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678246976; x=1709782976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oFa7Gcyn9Ul+mH142Yn1yviiCF+dyhpwwZBiVvmgMPY=;
  b=YvnsRgwdToe0GzaB7oNl4DdnZ2rtK0tUUBk2kt/1yfTREOAN/5SszX9j
   HR89bc8l3we3qTdyHpKl3IXgOrNUp0FMcvVX4ehMOvcMvCxlQ4rvHEoZs
   uPev+NgiSafCEET30USbyrQKZ92ck4CuP+AkAZebNaxh4FzXfieR6NVGx
   sBeQuqUuXmwHWIbwmjqcVojZ77KwYObhMy2B1GyN4qCkdX4Fo+UbMN/5k
   g2tzKqolg6wrxSYRcX+yoYAbHxlKenmb3pP1ZsMxjPGhjWfntfJy5UWEQ
   qrucJHqY/oxtDa0eDdpItqetvhAO2zFcDkSWiK6wEt+3N4v56FDtxXzmS
   g==;
X-IronPort-AV: E=Sophos;i="5.98,242,1673884800"; 
   d="scan'208";a="329421735"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Mar 2023 11:42:11 +0800
IronPort-SDR: 662nnkl3P7ji9DTIsB4l0wAVndH2YnroGi1xmyv+UlSrk2KcxIz4xxQ57psrHtOASM4G2Of9Tz
 AZc47R+39r3DvIEkpNE1x1TQ2Myed1au2dqYP7fAUqH6kmdMRayQDiOfP5VRfwUp1Yfz7vvYeI
 ZSEK3DQnuPyMBm+alqrsOycflc3KDmpWoagq+NSmXdc6c546BXljBSu4niVHLP27aXx1v707Eb
 zY8clOdWFeTn/UC98DwhKX9Zfs8v1TA77IY/4T1GdCqil8pNwPMkKSVNNRXxBi8CpRh0Cm255H
 JCM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 18:53:08 -0800
IronPort-SDR: KO1u9z3/PoJwqWvOL3MpgSENFH5IcDG7eXXg9+Ndz7fApkuLueTPegxEjGCi7/hoUJoU9lnV0s
 a0fFFoYn9+eghT6E1PILSXp23tUhb0odn6DAsMVKVQ6OHabB/36NWeKBB6GWhxDFLVAFsLEYEo
 98NwtjNKEyj2Vy40YwMHhSheQGf1qLs8+TiZT60AqU8qYSB4boAethyoMKuerMkVwjRIEVaMXG
 jzW7ztUN1sl5HnzX/q2Gokgph9Hx/sb6t55MPkQvsIAbUycFHuyDt33zLnaLcrdDeZC2VIS9FF
 pG4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 19:42:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PWdRQ6bGYz1Rwt8
        for <linux-clk@vger.kernel.org>; Tue,  7 Mar 2023 19:42:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1678246929; x=1680838930; bh=oFa7Gcyn9Ul+mH142Yn1yviiCF+dyhpwwZB
        iVvmgMPY=; b=cek3KLifGixZZTZrx1ddYUvHS4/hW2is8iEUeEVtCi6y4tIk5pw
        t8yxPu1VtKTdJ7ThRCpYBaw0cVEERK2SwGE9PcSJxM1G3IbQZC+KQj2JE9OuX9Qq
        EJg4XL2COUGHo/p03oEv2recb8TRmvLV+/NHlLjT6G/40iCdNP/1c5lJpR0WYB/v
        RBRNdvXhvbG42V/VzebZCaLtQtar2QNZTeYDPe4dsa0wy3ufYnKHf1SbsDziIHwL
        8cFHUDf37o1D7+o0IsS792rVmKEzLH2KUeoMUqWiaqGuIszV64aRw6IG54kEWie3
        W8zN9xlQbG23dcTCbOveevg4IscNv517rPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id DtSaz3X3ej_K for <linux-clk@vger.kernel.org>;
        Tue,  7 Mar 2023 19:42:09 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PWdRM4js0z1RvLy;
        Tue,  7 Mar 2023 19:42:07 -0800 (PST)
Message-ID: <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
Date:   Wed, 8 Mar 2023 12:42:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jesse Taube <mr.bossman075@gmail.com>,
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
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/8/23 12:23, Randy Dunlap wrote:
>>> OK, I don't know how it happened. I cannot reproduce it now.
>>> The failing .config files has CONFIG_MMU is not set (for RV32I), whic=
h
>>> appears to be impossible.
>> These patches add `CONFIG_MMU is not set` (for RV32I).
>> But no worries it seems to be a non issue=C2=A0 now.
>>
>> Your thoughts Damien?
>>
>=20
> Thanks for reminding me.
>=20
> With these 3 patches applied to linux-next-20230307,
> I still get this build error.

Does this help ?

diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 2527cf5757ec..7796c5f1d109 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -4,7 +4,8 @@ config SOC_K210_SYSCTL
        bool "Canaan Kendryte K210 SoC system controller"
        depends on RISCV && SOC_CANAAN && OF
        default SOC_CANAAN
-        select PM
-        select MFD_SYSCON
+       select COMMON_CLK_K210
+       select PM
+       select MFD_SYSCON
        help
          Canaan Kendryte K210 SoC system controller driver.

(just noticed that there are whitespace errors here...)

Note that both the sysctl and clk driver depend on RISCV. I think these s=
hould
probably also depend on 64BIT, and eventually add a "|| COMPILE_TEST" as =
well.
So something like this:

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index b6c5bf69a2b2..657a36d2640d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -431,7 +431,7 @@ config COMMON_CLK_FIXED_MMIO

 config COMMON_CLK_K210
        bool "Clock driver for the Canaan Kendryte K210 SoC"
-       depends on OF && RISCV && SOC_CANAAN
+       depends on OF && RISCV && SOC_CANAAN && (64BIT || COMPILE_TEST)
        default SOC_CANAAN
        help
          Support for the Canaan Kendryte K210 RISC-V SoC clocks.
diff --git a/drivers/soc/canaan/Kconfig b/drivers/soc/canaan/Kconfig
index 2527cf5757ec..1745a614d2a7 100644
--- a/drivers/soc/canaan/Kconfig
+++ b/drivers/soc/canaan/Kconfig
@@ -2,9 +2,10 @@

 config SOC_K210_SYSCTL
        bool "Canaan Kendryte K210 SoC system controller"
-       depends on RISCV && SOC_CANAAN && OF
+       depends on RISCV && SOC_CANAAN && OF && (64BIT || COMPILE_TEST)
        default SOC_CANAAN
-        select PM
-        select MFD_SYSCON
+       select COMMON_CLK_K210
+       select PM
+       select MFD_SYSCON
        help
          Canaan Kendryte K210 SoC system controller driver.

COMPILE_TEST is optional though, but I do not see any reason why not even=
though
in practice these drivers will likely never end up in 32-bits SoC.


--=20
Damien Le Moal
Western Digital Research

