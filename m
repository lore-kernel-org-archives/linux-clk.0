Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECC1C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 01:19:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCABTv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 20:19:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229709AbjCABTo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 20:19:44 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045717A87
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 17:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677633579; x=1709169579;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V6miA8MHSGYGrEI6DdpNRW7sdj0ZbxKqOIltGcg9nuk=;
  b=kqqVU8q2CU4dfiXrsr0qgQkMfOjI+iqzDPrHsRk5UUdn1TnMMsPSU6CD
   kg1N2Eybs6BJwJQ+5KEyuD4HH0YqOXZXdrAOyUP1VKkVp+IN2XRx3RpTi
   qmfvP7r75YSSmk/vQZzojVUiO2a+eTGpB0Z+7wj4RwPMkRsjCC3ytRubL
   oJQwe5XB3hr2dt/KF/kKfw86K4t7xGkFGrAe/9ibSuxOSm9O4KSK9aFni
   fybWPlYrjB4LW/5j84WrQlfdkCZDDZkGME5l1kKXF3AoYbpie+4w1qJJw
   HwaKE2QU71fNCLv3/oz7c2pUloW17P5vpjSKZGh6b7wsgGU6d/E/SjH1m
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="224259543"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 09:19:31 +0800
IronPort-SDR: fb4GAj0Hi/0PFRfufJTCP4eRMz4r5QjeqiypTVKO/ghf/g3jROyn53zNi1Yztyi0T1x3jxLWFH
 bTWZUqC8Ua7lNdRw68Wc0dFhmAnL5h2G1bVS9udH1O+NG8lsW+yY2y5kz41EiSTjQcw6FXE0Lq
 FhmgbiaybRv6Q1o7s7B5KFv0JIs+c0SdqTWVbzsa0M3GHFQqhbn5gwyHn3X688yZeJHs54VdWk
 aG0gGPRjU4Fgl8CwYaXF8jYM+zMbH1AQ7E6SO1vfZ0MmDRjPgBH/K4E79gwcxcuX4z0VRydsX3
 gP0=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 16:30:37 -0800
IronPort-SDR: 2i5iszAW9GCXyQj1UHWmbzFMozX8xSO9X1mDppHWczZ3wIt4uS+O6zn5HmOvQ3n+Cn/2MmMbi4
 BVsnQ2Hi4s0GP4Vv05kJQn+EFSrmUxzKfM4MTwyM989dNU5i4tf76EmLpXZYvlJjSZy7g93dow
 ccvf5yW8annt3bHud5bvpEVNZnqFNKk9qZqAxv5HzzPBfe+MMehZjqJ5qBeM1E/PpkiIt/3zIm
 T53+0SdNvY/UPh9rQGgMk3tGblzMTbYKVhE1Ad369tZyRdnJw0WgBhwtruR1EfC0r4vcHKUpPD
 Cx4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 17:19:31 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRGc26fM6z1RvTr
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 17:19:30 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1677633570; x=1680225571; bh=V6miA8MHSGYGrEI6DdpNRW7sdj0ZbxKqOIl
        tGcg9nuk=; b=VN0P4sqB/z5su4BfULi1dB/UhJIijWBF0zYcZ7gYhjJpCBz66Oy
        K8tYHQxWl5vxxESY6HehsGMSdJP7twl1dMLiXO2D3BBwLrGYW6jgPMWoakFiXh9f
        GWWUbIiry3GQqYbBnqpEYmHu7pmpvjrFBENqDmVm1jdelhzokjALHFSakDK80DOd
        LlpGJj689B9OzC80nFDwiXCcZp2O0sS/ZV+Sz5zIq8XUpKO0hvS4UJhlLJnqxZXM
        TC1OGiPk0WGMJVyQoryANk5VgECIxkZqF6Gsq0mMoW8c7yj/u59MxJGzyBtoWU6q
        AyUfWQWafGS9OK+eRXFbibeTJj7iJa2nkUw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RzUrLWe7mneQ for <linux-clk@vger.kernel.org>;
        Tue, 28 Feb 2023 17:19:30 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRGc023zmz1RvLy;
        Tue, 28 Feb 2023 17:19:28 -0800 (PST)
Message-ID: <5a727aa8-4620-7019-4f45-e78ab6c52b04@opensource.wdc.com>
Date:   Wed, 1 Mar 2023 10:19:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>,
        linux-riscv@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yimin Gu <ustcymgu@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Waldemar Brodkorb <wbx@openadk.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        kernel test robot <lkp@intel.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <20230301002657.352637-2-Mr.Bossman075@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230301002657.352637-2-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/1/23 09:26, Jesse Taube wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The K210 clock driver depends on SOC_CANAAN, which is only selectable
> when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
> have been sent for its enabling. The kernel test robot reported this
> implicit 64-bit division there.
> 
> Replace the implicit division with an explicit one.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

