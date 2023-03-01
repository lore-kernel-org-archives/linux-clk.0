Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD2E8C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 04:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjCAEmu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 23:42:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjCAEmt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 23:42:49 -0500
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 261E63609A
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 20:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677645768; x=1709181768;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8XAiocMESlyEQB3/IA8FOwC8IwIUE9dV7mZk2taKSqk=;
  b=Pcsf44kAAvPXdEa6skIXuuEJHyAEsn4/WeFEIFDBQCJJu7X665guGIDR
   AOUnk787PvbyY4CwTAl9trUX94NAQDmgazCnk2c123/ilxeXV+2EuRnxm
   eu5IOdQzkLETeMc25Ecn7bFAYIA5BkkBbhBQsI/3+8dHR7QlOK5RPlZgZ
   jIAc85x2NPm5FYYHf3VIBXl27U9KZ0pzmYnacWk4ES1ulObs2XLH8uImq
   dMesvZWlgD4+dt4Ej7yB+yza7CnRzMFTMefWCJgahmUxfuOkrMcVzp5ko
   +m72I90qy55qZIwK+KerEChqEe6uZ9xj7UYxkHZJHj20jkYcn7kxqZiMO
   A==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="328813448"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 12:42:47 +0800
IronPort-SDR: wgGNx9PYC1iR1qdrYkxCQVtWH7qQ9y3SALk+SlRuQj4mAox6a6QoC6LwNwXiRlpqc+CZ+lM4hT
 tE1SxRaVkNk/d5NNxfKJx7YwCATFwlbItM5Ewpd85UlLi/9koOy6AcYIuIUuZyt6RncAJITPnf
 /o2JEuGGKEo+SM6+PO3tM9uSdnYKpM0qvkDOdQaUltkwEzfxY7V24Z/21dlIWqnmiVtoWQvkPT
 iNE3wnd9XiSL9Uo9INR/6H44w+7mlVkYOArjqtDp8SDX05ma/5MC6Zq06DdgKft4MjE+6t59A+
 3R0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 19:59:37 -0800
IronPort-SDR: i4R35ODMzw1lOTD3jmJkg334geO0KX0D7jgN0RnO9E02x/L8K1uRBunzZw+tQYMg04Ib4vTobl
 5ivAC8PNgSauXg63ewWdVFW1HSLYVobzirdyOkhJenU1bGu+sHW5kjz82z7PovY018gXqTMZFX
 Ep78i3SF6SoTGdcmNuLfMoOk3mprcOgLCOjD0K6Hk7+jrJMvfck6pHn9J6v7nCr7ie1JBwMbsZ
 IWwYxZRL5HaH8roiH4bWwicOQ5O6Ds+/OT8d1vY8ETUJ4Ruq+MmXyT05gMj4O5sh1R2NoFPLN6
 8vY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 20:42:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRM6Z5nfvz1RvTp
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 20:42:46 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1677645765; x=1680237766; bh=8XAiocMESlyEQB3/IA8FOwC8IwIUE9dV7mZ
        k2taKSqk=; b=YicStjHF/bkaDIY+BCq9sFSKFwAR5vZ1XXw5KatFKMHzU+Jj2Hc
        w89sPKOiCqCpUXRLbuTQkcRqdkKinrC2SgO+rMh/F3d5Yw2fzb6VSvma0iObqwii
        bXpiSAk7mP2a/3G0uOhwnGzoGNQlTKaxQjxbfCudxk0oer+VyML5l9SFHE/FCS1I
        WJbeWnaT5VVj+5qjllUHftsz2MNAZjQgk3Aw6ECQ/R+O1+7kHJZ2CqrwWzGGYJjr
        mTFdUxR7ifbEO/FVUvsW2a5IDn+i/71NMPUkbwcoqIDP4qN0wRjnZ72KhJ9SjydD
        nZYjNC67bUVYoHnefAItYapQHGV5jZp2I8A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WQih4Xqtw36B for <linux-clk@vger.kernel.org>;
        Tue, 28 Feb 2023 20:42:45 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRM6X04XNz1RvLy;
        Tue, 28 Feb 2023 20:42:43 -0800 (PST)
Message-ID: <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
Date:   Wed, 1 Mar 2023 13:42:42 +0900
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
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/1/23 13:07, Randy Dunlap wrote:
> Hi--
> 
> On 2/28/23 16:26, Jesse Taube wrote:
>> This patch-set aims to add NOMMU support to RV32.
>> Many people want to build simple emulators or HDL
>> models of RISC-V this patch makes it possible to
>> run linux on them.
>>
>> Yimin Gu is the original author of this set.
>> Submitted here:
>> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
>>
>> Though Jesse T rewrote the Dconf.
> 
> Dconf?
> 
>>
>> The new set:
>> https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html
>> ---
>> V1->V2:
>>  - Add Conor's clock patch for implicit div64
>>  - Fix typo in commit title 3/3
>>  - Fix typo in commit description 2/3
>> V2->V3
>>  - Change from defconfig file to a PHONY config
>> ---
> 
> Is this 'rv32_nommu_virt_defconfig' target the only build target
> that is supported?
> 
> I ask because I applied the 3 patches and did 25 randconfig builds.
> 5 of them failed the same way:
> 
> riscv32-linux-ld: drivers/soc/canaan/k210-sysctl.o: in function `k210_soc_early_init':
> k210-sysctl.c:(.init.text+0x78): undefined reference to `k210_clk_early_init'

Arg. Forgot about that. k210 is rv64 only and while the clk driver could still
compile test with rv32 (or any arch), that driver provides the
k210_clk_early_init() function which is called very early in the boot process
from k210_soc_early_init(), which is an SOC_EARLY_INIT_DECLARE() call. The
problem may be there. Probably should be disabled for rv32 if no SoC need that
sort of early init call.

> 
> because
> # CONFIG_COMMON_CLK_K210 is not set
> 
> 
> Maybe SOC_CANAAN needs some more selects for required code?
> 
>> Conor Dooley (1):
>>   clk: k210: remove an implicit 64-bit division
>>
>> Jesse Taube (1):
>>   riscv: configs: Add nommu PHONY defconfig for RV32
>>
>> Yimin Gu (1):
>>   riscv: Kconfig: Allow RV32 to build with no MMU
>>
>>  arch/riscv/Kconfig     | 5 ++---
>>  arch/riscv/Makefile    | 4 ++++
>>  drivers/clk/clk-k210.c | 2 +-
>>  3 files changed, 7 insertions(+), 4 deletions(-)
>>
> 

-- 
Damien Le Moal
Western Digital Research

