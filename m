Return-Path: <SRS0=Hq2+=AY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436C5C433E1
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jul 2020 05:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F24720674
	for <linux-clk@archiver.kernel.org>; Mon, 13 Jul 2020 05:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="wJ/lsVIf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgGMFra (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Jul 2020 01:47:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38893 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbgGMFr3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 13 Jul 2020 01:47:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594619249; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=giZv+9y7LNQMJTKXeaUBWSz3WRz84eCYj/TBVuNbEGY=; b=wJ/lsVIfHMa4viURXiuzWlyvVSJc4bCrcW8O3Bks8rSScUP+2H/ExJ425cup6+AwDfhl0inM
 qOgv3RW/SVPEqlf4hiSFA/LP3CczINdIOb4vb9hkfs8TgGEVcjky6he6wpWjHlFtMcaqKGIS
 iryTDnWJsT3Mzb2Ic7AaMxMdn1Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4MzlhZiIsICJsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f0bf570e3bee125106b2603 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 13 Jul 2020 05:47:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6954AC43391; Mon, 13 Jul 2020 05:47:27 +0000 (UTC)
Received: from [192.168.0.101] (unknown [49.207.129.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCE14C433C6;
        Mon, 13 Jul 2020 05:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BCE14C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [clk:clk-qcom 13/14] drivers/clk/qcom/gcc-ipq8074.c:4610:30:
 warning: initializer overrides prior initialization of this subobject
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Selvam Sathappan Periakaruppan <speriaka@codeaurora.org>
References: <202007121820.EgK6NAy4%lkp@intel.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <f304b312-8034-5838-4ffc-e0fcbe8136b1@codeaurora.org>
Date:   Mon, 13 Jul 2020 11:17:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202007121820.EgK6NAy4%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

I see that you already applied this patch on clk-next,

shall I provide the fix as incremental patch?

On 7/12/2020 4:04 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-qcom
> head:   b4297844995f380588e6f935a2f98c399129a9b2
> commit: f0cfcf1ade201dcfd3365f231efc90e846fa46df [13/14] clk: qcom: ipq8074: Add missing clocks for pcie
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 02946de3802d3bc65bc9f2eb9b8d4969b5a7add8)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          git checkout f0cfcf1ade201dcfd3365f231efc90e846fa46df
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
