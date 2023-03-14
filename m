Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6424DC6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 14 Mar 2023 22:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjCNW7D (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Mar 2023 18:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjCNW7B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Mar 2023 18:59:01 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46837457FC
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678834719; x=1710370719;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+E8pmmwHhgh7vdhIb+zwxnTey/wAa0W8HsUhFIWhutk=;
  b=WTptAG/UT1f8YS0B9Wp6VrdB9y1STWseXmFFu4LQXDL+YUDavABXjvxo
   pFw6xWj4ad48zaC++N/S02i+vM9eXEI9daBqTZ7f9rkZIzJmumH7S3wSE
   6z2WFgnJczM6C1PNWYSFLj3iza+S5pCjR5gu6Yq9M9NYsBo1V6S0TKvz5
   rGuypf+emajLSRFOoRTcQLHH6vdJp6jUxsL/mcYN48lm1eo7EOcCQqsi2
   o2ICmIlu+G/Awn1Jfd9dNaGVcGZ5STA6gBA+6g8Vpm0KcR2THo5WSZxat
   66oE0S6WjePtvTERRBEc5N1edKTr5avMQbIJffFKebXbiJjxBWKgyxNJ5
   A==;
X-IronPort-AV: E=Sophos;i="5.98,261,1673884800"; 
   d="scan'208";a="223921920"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2023 06:56:48 +0800
IronPort-SDR: 1h9Ju2DinIrSmlwEloN7IBWeypebxRc1Td/RYPvD+aZEGT8xGfCm8lnMPb2WNuLkd6MrQpL9Du
 yAFIqFS7GOI5zHZlfVhKtO6gJRd3Iswt0RtQTV93+Yx4KOtW0WoNu/kss9sUu6RCx2C3Wmf8on
 iE+LLw8JAmNzpkn64dh8o9SIaa9zYRtTlqez6VFQm9ZVJysGDWP4MrGqW5i6JyZSQyrN/nDeUN
 lshXctkfKVWgH4oDwdhF8P5EHFhKfQQnmfh3aPNa08vI+o9kBHvn4UCJepf0KfgwSxUAXEtaOB
 HKM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 15:13:15 -0700
IronPort-SDR: nQ8pLaI9mlNoENXKdWsonxd9d3sW9MqGb4mQ3VXzgrBBQUNVWxTifRrSKN4xmpPLXILDgK8t/c
 fH2mR1m7UiZVQniYwyJSnhkXCHeiiD2/5B8CfOhfsuxlE3BXdf/Qz11w70swK49+qqFkS0mcrB
 mX2I+/32wKgHFm+GDDMOunaS/c59bgewrJiYZU3K66ATD193UhomebwyrLu2+U7+e0D5S+Cjtw
 buKrsr+2zjWC5hRIXYM/CdyuathFr6ZapD1O30mGcLM/tyx29zN7IEr0hUYhLfHDp2vx/YFO8C
 Pso=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 15:56:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pbpmw18LLz1RtVx
        for <linux-clk@vger.kernel.org>; Tue, 14 Mar 2023 15:56:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1678834607; x=1681426608; bh=+E8pmmwHhgh7vdhIb+zwxnTey/wAa0W8HsU
        hFIWhutk=; b=pb5Ubts9uFeMDy3UPBwLFJFAL6FZv2yzDlpU/CfNTgSpj5k+KMf
        shzvJMdo6TLqyeeUegM7dT0ya0VSgtw4Ubh5Rb5xCXiqbc4UMMUAAO7ZXIL1CFTY
        4inbstQ+c84/Y9bT7lfIDXBnYkKhEyj9tCbhqrv5texA/lvkBuR/smueU7EGkZDj
        lumPjmvylCfty5HRr/yu82EUadbDb7R8ZW725Yz6mpb38H51RUkIrUp4ZCeD4t/H
        /o2AG3/RKG3fBYnnlvjtAPBTXHsFG024/hxhipjr7gQg2nUULt1J+DgmvBlRE2Q7
        34JJWv9GpA04YPJI7IYXntrkAcayH16HEBQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WCAdOn08G9dV for <linux-clk@vger.kernel.org>;
        Tue, 14 Mar 2023 15:56:47 -0700 (PDT)
Received: from [10.225.163.84] (unknown [10.225.163.84])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pbpmt099tz1RtVm;
        Tue, 14 Mar 2023 15:56:45 -0700 (PDT)
Message-ID: <5d4c882f-3d7b-e97b-b36c-82c928c31d25@opensource.wdc.com>
Date:   Wed, 15 Mar 2023 07:56:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] RISCV: CANAAN: Make K210_SYSCTL depend on CLK_K210
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>,
        linux-riscv@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>
References: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230314211030.3953195-1-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/15/23 06:10, Jesse Taube wrote:
> CLK_K210 is no longer a dependency of SOC_CANAAN,
> but K210_SYSCTL depends on CLK_K210. This patch makes K210_SYSCTL
> depend on CLK_K210. Also fix whitespace errors.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org
> Fixes: 3af577f9826f ("RISC-V: stop directly selecting drivers for SOC_CANAAN")
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>


-- 
Damien Le Moal
Western Digital Research

