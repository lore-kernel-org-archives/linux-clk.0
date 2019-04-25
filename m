Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBBDC43218
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 13:35:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79CD7206C0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 13:35:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pMNiOuFM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfDYNfI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 09:35:08 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41094 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727609AbfDYNfH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Apr 2019 09:35:07 -0400
Received: by mail-lj1-f193.google.com with SMTP id k8so7760435lja.8
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2019 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ObWtiScYVxIhJocOQZPAFUmXZ9Xlj671ZqILSy3cF3I=;
        b=pMNiOuFMvlvEXR6oHVILLlMK+HfrCc/nTEUxz3ZhWpSLf09OYNJXZMotMGCJLfkhKr
         wZ1r9G2Bw2kYXZcjJ/KH5BFgmip9sZIAKJ7Jtk7ETlbt4P8hZ5R4AbJKkhIONngxJvJE
         TRV7yiSFKGjVFIjv7fF3p0322miM5TJjDnZCHaH/6nHc845Qx2GpdCsCHw8G1eWOccir
         LuPWy7PRTA2M8rhsUGOmeBddeeorJDifwLIskccgTC/FaPUZTeWlCtm4pv0aqKmB8+dg
         Wto+TdhHGiLOwf9clVBc6orbhUGDpcp7zTZkEe7B3doiboYz7X//NQUDv04GTgRTHwwa
         4AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ObWtiScYVxIhJocOQZPAFUmXZ9Xlj671ZqILSy3cF3I=;
        b=EbwWmm/YWrTyIXkICxXjwx3mGtAma55ck6Rr6FLFxzchRimUWmcQtuETwcxiw8ewNk
         XwQLogMiHGfF3kiNoGNeI8gy36kgi3L0j8hbPLZx8PGUWpPX92lQVjMc4L7H07xwPOhf
         kDtofqvtYa7+9nQqO7+nRp6MtSBsmWhljqaBRyvfQonBmkE832b4o3mGckcddxKyNWbx
         IzaD7n9BUBjfwb8PJO0PxKkfFCN4xw4hqUym+EhMTt7PoLCF5ibuQvhjCDfrbs3vJvUh
         AwrMj27duTrnIrfpYaaQMzXwI1+MFrKslQkKebJUJg8tl30wg2B7FDmBNa6XbxkJcB5I
         F/FA==
X-Gm-Message-State: APjAAAXITK7vzFTMlcmGJi85LYSGgHF6NJDzPzOq0fqCT0sA+6e7E2Ih
        RKdJoaRjysEZkp9Bqt8+50fO0Mav
X-Google-Smtp-Source: APXvYqxb/wpbulHeNvSjmmubrX/C99uZjzHsf01k+pO3DBmUFRN+R3RnaJa/l+BwSHwaRyi9IYIVkQ==
X-Received: by 2002:a2e:8684:: with SMTP id l4mr22137648lji.121.1556199304889;
        Thu, 25 Apr 2019 06:35:04 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id z30sm5002852lfb.87.2019.04.25.06.35.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 06:35:04 -0700 (PDT)
Subject: Re: [chanwoo:devfreq-testing 15/16]
 drivers//devfreq/tegra30-devfreq.c:478:8: error: implicit declaration of
 function 'clk_set_min_rate'; did you mean 'clk_set_rate'?
To:     Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-clk@vger.kernel.org
References: <201904242234.3ZpDzMBq%lkp@intel.com>
 <CGME20190424144228epcas4p46114541e093bf672dca580640af9f8b0@epcas4p4.samsung.com>
 <bd6a2bf5-aae5-9610-4f48-09e6f44fa3b4@gmail.com>
 <7622a390-8bf8-0207-b9d8-6df1fd37ab9b@samsung.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0d7e81d5-0990-bce2-d188-6a9640b73afd@gmail.com>
Date:   Thu, 25 Apr 2019 16:35:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7622a390-8bf8-0207-b9d8-6df1fd37ab9b@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

25.04.2019 3:03, Chanwoo Choi пишет:
> Hi Dmitry,
> 
> On 19. 4. 24. 오후 11:41, Dmitry Osipenko wrote:
>> 24.04.2019 17:22, kbuild test robot пишет:
>>> Hi Dmitry,
>>>
>>> First bad commit (maybe != root cause):
>>>
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-testing
>>> head:   6b3a07e6458befbb8b90010e92d578b08678e5ce
>>> commit: d2a110d18c755979bffa07f45d3b4ff89e420954 [15/16] PM / devfreq: tegra: Rename tegra-devfreq.c to tegra30-devfreq.c
>>> config: sparc64-allmodconfig (attached as .config)
>>> compiler: sparc64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
>>> reproduce:
>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>         chmod +x ~/bin/make.cross
>>>         git checkout d2a110d18c755979bffa07f45d3b4ff89e420954
>>>         # save the attached .config to linux build tree
>>>         GCC_VERSION=7.2.0 make.cross ARCH=sparc64 
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>> All errors (new ones prefixed by >>):
>>>
>>>    drivers//devfreq/tegra30-devfreq.c: In function 'tegra_devfreq_target':
>>>>> drivers//devfreq/tegra30-devfreq.c:478:8: error: implicit declaration of function 'clk_set_min_rate'; did you mean 'clk_set_rate'? [-Werror=implicit-function-declaration]
>>>      err = clk_set_min_rate(tegra->emc_clock, rate);
>>>            ^~~~~~~~~~~~~~~~
>>>            clk_set_rate
>>>    cc1: some warnings being treated as errors
>>>
>>> vim +478 drivers//devfreq/tegra30-devfreq.c
>>>
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  460  
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  461  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  462  				u32 flags)
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  463  {
>>> 11573e913 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2015-03-17  464  	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  465  	struct devfreq *devfreq = tegra->devfreq;
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  466  	struct dev_pm_opp *opp;
>>> e76bb6df1 drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  467  	unsigned long rate;
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  468  	int err;
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  469  
>>> e76bb6df1 drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  470  	opp = devfreq_recommended_opp(dev, freq, flags);
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  471  	if (IS_ERR(opp)) {
>>> e76bb6df1 drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  472  		dev_err(dev, "Failed to find opp for %lu Hz\n", *freq);
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  473  		return PTR_ERR(opp);
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  474  	}
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  475  	rate = dev_pm_opp_get_freq(opp);
>>> 8a31d9d94 drivers/devfreq/tegra-devfreq.c Viresh Kumar    2017-01-23  476  	dev_pm_opp_put(opp);
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  477  
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18 @478  	err = clk_set_min_rate(tegra->emc_clock, rate);
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  479  	if (err)
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  480  		return err;
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  481  
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  482  	err = clk_set_rate(tegra->emc_clock, 0);
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  483  	if (err)
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  484  		goto restore_min_rate;
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  485  
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  486  	return 0;
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  487  
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  488  restore_min_rate:
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  489  	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  490  
>>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  491  	return err;
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  492  }
>>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  493  
>>>
>>> :::::: The code at line 478 was first introduced by commit
>>> :::::: 7f2e3eb6fa764bb003164c331c93306a8e1223c3 PM / devfreq: tegra: Don't ignore clk errors
>>>
>>> :::::: TO: Dmitry Osipenko <digetx@gmail.com>
>>> :::::: CC: Chanwoo Choi <cw00.choi@samsung.com>
>>>
>>> ---
>>> 0-DAY kernel test infrastructure                Open Source Technology Center
>>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>>
>>
>> Oh, there is no declaration for clk_set_min_rate() when CONFIG_COMMON_CLK=n. Either driver should be made dependent on CONFIG_COMMON_CLK or the declaration should be added to include/linux/clk.h (the same applies to tegra20-devfreq).
>>
>> Chanwoo, what will we do?
>>
>>
> 
> I applied your patches to my testing branch for build test.
> It is not applied to official branch.
> 
> As the Stephen comments, please resend it after fixing this issue.
> 
> 

I sent out the the patch to fix the issue and will resend the devfreq series after the clk patch will get applied.
