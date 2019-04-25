Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEA1C282E1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 00:02:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 263E32175B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 00:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qPlm5V/O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728619AbfDYACT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Apr 2019 20:02:19 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:61368 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbfDYACT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Apr 2019 20:02:19 -0400
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190425000214epoutp04b428b592e71bcc06b7cd97e60928cd8a~YjqqoEiN92863528635epoutp04U
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2019 00:02:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190425000214epoutp04b428b592e71bcc06b7cd97e60928cd8a~YjqqoEiN92863528635epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1556150534;
        bh=uEv8aYKyZcxj4LS7lpPkPvglChqStI/fWidTeYXGjhM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qPlm5V/O6+3jFswmnI3eMn0t5doSwspeCMHuEO3vpAmajhR1IPRGQAiCUX6wiwFEy
         lq/zxyTJgWtmpEE0VpodIzGWeXmzbd/VbnQNn6m+c74UcyVtCxP3lu7pgijZRD1EAK
         qxTt50Ii3YcD6Hy6TARxlh2a5QjYPYBc8QPRghuE=
Received: from epsmges1p4.samsung.com (unknown [182.195.40.158]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20190425000211epcas1p48615414155368a7cfbfa7096fd6fe0fe~YjqnVl8mD0074300743epcas1p4M;
        Thu, 25 Apr 2019 00:02:11 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        E9.73.04257.CF8F0CC5; Thu, 25 Apr 2019 09:02:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20190425000204epcas1p37a7f401250f19231b72c274965e4b183~YjqgqVwDW1086710867epcas1p3z;
        Thu, 25 Apr 2019 00:02:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190425000204epsmtrp141c72d981b04f33d3f787ca51b3b2640~YjqgpsUtz2470724707epsmtrp1-;
        Thu, 25 Apr 2019 00:02:04 +0000 (GMT)
X-AuditID: b6c32a38-5cbff700000010a1-48-5cc0f8fca1f7
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        85.51.03662.CF8F0CC5; Thu, 25 Apr 2019 09:02:04 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190425000203epsmtip115ad2ffd0989e7ed22f25272de529f60~YjqgfAoWt1102211022epsmtip1n;
        Thu, 25 Apr 2019 00:02:03 +0000 (GMT)
Subject: Re: [chanwoo:devfreq-testing 15/16]
 drivers//devfreq/tegra30-devfreq.c:478:8: error: implicit declaration of
 function 'clk_set_min_rate'; did you mean 'clk_set_rate'?
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-clk@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <7622a390-8bf8-0207-b9d8-6df1fd37ab9b@samsung.com>
Date:   Thu, 25 Apr 2019 09:03:12 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bd6a2bf5-aae5-9610-4f48-09e6f44fa3b4@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmnu6fHwdiDC53a1qs/viY0eJjzz1W
        ByaPnbPusnt83iQXwBSVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtq
        q+TiE6DrlpkDNF5JoSwxpxQoFJBYXKykb2dTlF9akqqQkV9cYquUWpCSU2BZoFecmFtcmpeu
        l5yfa2VoYGBkClSYkJ3RvP8rc8F0vYrTM5ezNjCeUOti5OCQEDCRuLAvrIuRi0NIYAejxLR3
        3SwQzidGiRW3e9khnG+MErt2bWfqYuQE6/h77wxUYi+jxO9nM6Fa3jNKnD+0kwnEERbYzChx
        6NVfsBYRATWJ5Uf/sILYzAKyEjteP2EHsdkEtCT2v7jBBmLzCyhKXP3xmBHE5hWwkzi8aA9Y
        L4uAqsSbzm8sILaoQITE/WMbWCFqBCVOznwCFucUsJXYNHctC8R8cYlbT+YzQdjyEs1bZzOD
        HCQhsINNYuePk6wQX7tI9HWGQrwjLPHq+BZ2CFtK4mV/G5RdLbHy5BE2iN4ORokt+y+wQiSM
        JfYvncwEModZQFNi/S59iF18Eu++9kCN55XoaBOCqFaWuPzgLjTkJCUWt3eyQdgeEv9X3GKe
        wKg4C8k3s5B8MAvJB7MQli1gZFnFKJZaUJybnlpsWGCCHNubGMFJT8tiB+Oecz6HGAU4GJV4
        eC/EHogRYk0sK67MPcQowcGsJMJrsn1/jBBvSmJlVWpRfnxRaU5q8SFGU2BgT2SWEk3OBybk
        vJJ4Q1MjY2NjCxNDM1NDQyVx3vUOzjFCAumJJanZqakFqUUwfUwcnFINjH2/l3pEhjVN883t
        NrR/tfG1arv/3P33jP/Je0r+Lui57Zvd+9rXctKEhpKKxQ0BEqWf3q6Y2WTs+FHx1pYbx3LV
        XY9KxO6P+ZF5i/NN/N2bkh6zP82xsZl4LuSdNIeVn/nh7TW6q67rx1n7PskoLE4Wua8bb5ny
        xpezZtmyI+6NCw7XaLA1KrEUZyQaajEXFScCAFbmVgqQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnO6fHwdiDBY2Mlus/viY0eJjzz1W
        ByaPnbPusnt83iQXwBTFZZOSmpNZllqkb5fAldG8/ytzwXS9itMzl7M2MJ5Q62Lk5JAQMJH4
        e+8MexcjF4eQwG5GiYs317BAJCQlpl08ytzFyAFkC0scPlwMUfOWUeLm7EVMII6wwGZGiUOv
        /jKBNIgIqEksP/qHFcRmFpCV2PH6CdTUHYwSD2feBJvKJqAlsf/FDTYQm19AUeLqj8eMIDav
        gJ3E4UV7wAaxCKhKvOn8BlYvKhAhceb9ChaIGkGJkzOfgNmcArYSm+auZYFYpi7xZ94lZghb
        XOLWk/lMELa8RPPW2cwTGIVnIWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMpLLdcrTswt
        Ls1L10vOz93ECI4ALa0djCdOxB9iFOBgVOLhVYg8ECPEmlhWXJl7iFGCg1lJhNdk+/4YId6U
        xMqq1KL8+KLSnNTiQ4zSHCxK4rzy+ccihQTSE0tSs1NTC1KLYLJMHJxSDYxVcib8Nzt6J17k
        5Vz69/dRvxSvU/5Ldb6+XsqoGecm+lh4P8/JxzMZDrBmvjkfnl7r7yat2rf3CP/HbfKB9vZy
        wal6aX/sT04o6z8RYl/tM3nZaimWJQF9QSwbTu3bueaBpP/Zqf27Pt5sZjb5tNJ17v5qTr6l
        b7KlFyvfOy56xGeH3of8N6JKLMUZiYZazEXFiQDukijafAIAAA==
X-CMS-MailID: 20190425000204epcas1p37a7f401250f19231b72c274965e4b183
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190424144228epcas4p46114541e093bf672dca580640af9f8b0
References: <201904242234.3ZpDzMBq%lkp@intel.com>
        <CGME20190424144228epcas4p46114541e093bf672dca580640af9f8b0@epcas4p4.samsung.com>
        <bd6a2bf5-aae5-9610-4f48-09e6f44fa3b4@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Dmitry,

On 19. 4. 24. 오후 11:41, Dmitry Osipenko wrote:
> 24.04.2019 17:22, kbuild test robot пишет:
>> Hi Dmitry,
>>
>> First bad commit (maybe != root cause):
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-testing
>> head:   6b3a07e6458befbb8b90010e92d578b08678e5ce
>> commit: d2a110d18c755979bffa07f45d3b4ff89e420954 [15/16] PM / devfreq: tegra: Rename tegra-devfreq.c to tegra30-devfreq.c
>> config: sparc64-allmodconfig (attached as .config)
>> compiler: sparc64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout d2a110d18c755979bffa07f45d3b4ff89e420954
>>         # save the attached .config to linux build tree
>>         GCC_VERSION=7.2.0 make.cross ARCH=sparc64 
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>> All errors (new ones prefixed by >>):
>>
>>    drivers//devfreq/tegra30-devfreq.c: In function 'tegra_devfreq_target':
>>>> drivers//devfreq/tegra30-devfreq.c:478:8: error: implicit declaration of function 'clk_set_min_rate'; did you mean 'clk_set_rate'? [-Werror=implicit-function-declaration]
>>      err = clk_set_min_rate(tegra->emc_clock, rate);
>>            ^~~~~~~~~~~~~~~~
>>            clk_set_rate
>>    cc1: some warnings being treated as errors
>>
>> vim +478 drivers//devfreq/tegra30-devfreq.c
>>
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  460  
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  461  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  462  				u32 flags)
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  463  {
>> 11573e913 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2015-03-17  464  	struct tegra_devfreq *tegra = dev_get_drvdata(dev);
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  465  	struct devfreq *devfreq = tegra->devfreq;
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  466  	struct dev_pm_opp *opp;
>> e76bb6df1 drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  467  	unsigned long rate;
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  468  	int err;
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  469  
>> e76bb6df1 drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  470  	opp = devfreq_recommended_opp(dev, freq, flags);
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  471  	if (IS_ERR(opp)) {
>> e76bb6df1 drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  472  		dev_err(dev, "Failed to find opp for %lu Hz\n", *freq);
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  473  		return PTR_ERR(opp);
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  474  	}
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  475  	rate = dev_pm_opp_get_freq(opp);
>> 8a31d9d94 drivers/devfreq/tegra-devfreq.c Viresh Kumar    2017-01-23  476  	dev_pm_opp_put(opp);
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  477  
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18 @478  	err = clk_set_min_rate(tegra->emc_clock, rate);
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  479  	if (err)
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  480  		return err;
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  481  
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  482  	err = clk_set_rate(tegra->emc_clock, 0);
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  483  	if (err)
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  484  		goto restore_min_rate;
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  485  
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  486  	return 0;
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  487  
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  488  restore_min_rate:
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  489  	clk_set_min_rate(tegra->emc_clock, devfreq->previous_freq);
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  490  
>> 7f2e3eb6f drivers/devfreq/tegra-devfreq.c Dmitry Osipenko 2019-04-18  491  	return err;
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  492  }
>> 6234f3801 drivers/devfreq/tegra-devfreq.c Tomeu Vizoso    2014-11-24  493  
>>
>> :::::: The code at line 478 was first introduced by commit
>> :::::: 7f2e3eb6fa764bb003164c331c93306a8e1223c3 PM / devfreq: tegra: Don't ignore clk errors
>>
>> :::::: TO: Dmitry Osipenko <digetx@gmail.com>
>> :::::: CC: Chanwoo Choi <cw00.choi@samsung.com>
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>
> 
> Oh, there is no declaration for clk_set_min_rate() when CONFIG_COMMON_CLK=n. Either driver should be made dependent on CONFIG_COMMON_CLK or the declaration should be added to include/linux/clk.h (the same applies to tegra20-devfreq).
> 
> Chanwoo, what will we do?
> 
> 

I applied your patches to my testing branch for build test.
It is not applied to official branch.

As the Stephen comments, please resend it after fixing this issue.


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
