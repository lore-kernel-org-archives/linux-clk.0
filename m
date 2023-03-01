Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508F8C64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 01:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCABXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 20:23:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbjCABXK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 20:23:10 -0500
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A011E367DD
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 17:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677633771; x=1709169771;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DByreY2GJXdAGvq71tt9Fo41tXYu1N83vt1UZRvOcNg=;
  b=DkaB9sQ2/r1An6iCcbUt72xjAUJ6GzYCOYaSqCck78pbmazwlSmEU59J
   MtdfDpYs2AvXdXvIziesv1glRQFRwygaCkmP7JXECBPtzaEtJFkYYBk4A
   FERZfN4iUkAcxdwma/10HvJj+nCYPl58TVyNZEXB5PQuVyQs/9bNCWWJS
   X+JhYCE9+YRXV/NZxmiCJ9DkftEVKYSpzrd6+pZL2phQVp+ZNkROpW9gF
   Ybb7Ub71uuy5iA42+q83PUo3+msp4ikLLlFOlN2tqakF9O7EkFfLG1ZLG
   idkbv/xWUL/jUsLK573sy1e32wmL1NBcJQE3uS0G5s+35XEWVjH+fMUMq
   g==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="224259751"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 09:22:13 +0800
IronPort-SDR: JUNbgy2tLFnuLTLWZiygbZfSvuxLhHrC1TpGU+vqyF2A0rILIjEh/09Kt/amVYSGsbZwm2RTru
 H6e3shGQLEmtRHmVEEGjVi+/LkAGBNUOgGWgrsxRf5FKBahfa6j0QC4RGVSt96iHInqqoYVsir
 evA8+zP4+yCnrxz36a9JHuYCgxOzA+shBoAUc+/Ae0xB+YcbSyZURjkXJETPWrrZLigmckjpFw
 xcUlni9YR+VBoYtDTsIF4eMpmF/+S4Ibt8ZqwAnsnHNAh7Nna0BgvkyNhJd+1MaxZXjZtnKFM+
 hOU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 16:39:00 -0800
IronPort-SDR: 8wQuFkOFa7xPgbzsHf78Bid3r6y55ioudQjLMruilO+jwRQxZuHwy5UfZIYYGy/icQ9v2fpuOJ
 uB1attBG7WIq2W9LG5KYdSv+d6sI/5VVjh8F/IGe9GC1bNYRXooUcSUt2/GYmvSWyBvCCxfgGl
 wv920JVwGtJhRh+P4ORVdWddRlGglbLMkvlOwK/a6WXy2F2v+utrIr0m7UHqoZUtrBrMiwUGMn
 PDZY9HthwkIVgSDJ46o3C6BqGTgWE4Y3Ztz0TYzlia4MGJbQ/6rqjgcGleRBnthMJ8T29O4JWY
 weU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 17:22:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRGg56kXYz1Rwt8
        for <linux-clk@vger.kernel.org>; Tue, 28 Feb 2023 17:22:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1677633729; x=1680225730; bh=DByreY2GJXdAGvq71tt9Fo41tXYu1N83vt1
        UZRvOcNg=; b=aRZcjnIWzTDBFw+lwAK0yQ8I8bxlc+Ac1zRjAR1GywFhY4yN1yH
        aI+zVMJ6Q0eG41nPwWDXNKq/hOWxeI01P52EdQGYIOYzXOkufeBRfJIy6NRF23nX
        Mv/CsRYiuYhXA9RxOcnGN3cKK70ZZzHyVwwLeiPp4Q25wXt4ULnXNHNK/fyeKyA1
        72yG9x6b5NEawCA8VtwAC4s21lnwzYOOwwPhvyEQomn5yv9NJmNTstMZIMVrGBKM
        4gtrS+dFAyEVUXJQ5eCYv8E5ukl9iy2YrxwHKqzpEipCj7vPGQzjx2LdG3rpZiBz
        7ie+6OMDK/aILh8Jql2vRDyQiwps+YPQ7Zw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id wxnNuveIt7BE for <linux-clk@vger.kernel.org>;
        Tue, 28 Feb 2023 17:22:09 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRGg32nyRz1RvLy;
        Tue, 28 Feb 2023 17:22:07 -0800 (PST)
Message-ID: <efe45f04-3a7a-3e94-ef79-4dcdd6029f44@opensource.wdc.com>
Date:   Wed, 1 Mar 2023 10:22:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/3] riscv: Kconfig: Allow RV32 to build with no MMU
Content-Language: en-US
To:     Jesse Taube <mr.bossman075@gmail.com>,
        linux-riscv@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yimin Gu <ustcymgu@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Waldemar Brodkorb <wbx@openadk.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <20230301002657.352637-3-Mr.Bossman075@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230301002657.352637-3-Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/1/23 09:26, Jesse Taube wrote:
> From: Yimin Gu <ustcymgu@gmail.com>
> 
> Some RISC-V 32bit cores do not have an MMU, and the kernel should be
> able to build for them. This patch enables the RV32 to be built with
> no MMU support.
> 
> Signed-off-by: Yimin Gu <ustcymgu@gmail.com>
> CC: Jesse Taube <Mr.Bossman075@gmail.com>
> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

Looks OK.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

