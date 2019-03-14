Return-Path: <SRS0=Z7Th=RR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136AEC43381
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 15:58:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CDEF82184C
	for <linux-clk@archiver.kernel.org>; Thu, 14 Mar 2019 15:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="PdDwh9KV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfCNP6M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Mar 2019 11:58:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:54499 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbfCNP6M (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 14 Mar 2019 11:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1552579081;
        bh=vmAyjpCjbx7nHbuZIFmr0VpBsMC27MyC0x6eIXC2nW4=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=PdDwh9KVa5q3GQHpv2izC+MX6P/4DYvedM61H8gZ+YZ1G2RenrjgfhWba0jiLbXnA
         Wf30hiS4Z3VX483fy2xHOm2r2mXNAAgj/qQa85wVuOKgnKJ3TWNCJmgBC9q14xRKvo
         i7im6Z6bhrv1h8SpxzRj6IaM4XiP1Hv6vxjbUVkw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MC4y8-1hDEBU3Rmi-008qfX; Thu, 14
 Mar 2019 16:58:01 +0100
Subject: Re: clk: x86: Stop marking clocks as CLK_IS_CRITICAL is causing
 non-working hardware.
To:     Stephen Boyd <sboyd@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e6e11d5c-988a-aef4-cb8c-9e3bef254b87@gmx.ch>
 <155257844626.20095.2420043618878828782@swboyd.mtv.corp.google.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <9f602139-b2cc-8d13-a50b-7ebd1f5a71be@gmx.ch>
Date:   Thu, 14 Mar 2019 16:58:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <155257844626.20095.2420043618878828782@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:85N2f8RKEf4gyHW81YkwQGTgpWvQae++bizuvkhi7z7XI3WwYV6
 cBgHnmcWAlp2kKG3i3WTBiJZe6YM2h6U63nyO7S3hpz0Tx1SU+Lq1z5GN3qBSXBd8GBMFQi
 5OOKF0PAVjZWqX0QqqCdMWqnUuwH+KPwrG0G3SI1Fp+3nN5tDHfnTfO46IrFbhqDCi+lbwN
 MTYq8Q8QgpSGupPkhqi4Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yJ/Jl+fGD48=:QCoJH/MSD2HuayLkA21Usk
 tHoXMioRNZBWuI7nJ3hHgwJYsMpox6zaUBSV5+TuiL5GsqeWHC1bYQVlQ1KUQe7AsEMwMPjkC
 XeOMPND7JRy4Kqonr6PvYEJ3npFT3KDaM7YxU1wnWBG6BUs0KdQPp+vk3yrZh9qardR20CEoH
 9yy7stz/lHIQGhsUpJjyLvhM9TdM86hfEht1WXNL3aNTncLIS8gg7DCFHX14NtiBhUnD2kkzC
 S40dt9zwEG+eS/Xo9l2/mUxkGyI+paxwLeH4F4e9sKQBsNSPM7fnOmlAyEi3EaMKlqdj3m3c4
 X2e9Wg4JDKjcK4h7LraWZJ8KzoRS0sGpscxoYi9Wg5niCvqw2m1KstMkuTp55Effd0Yexuzzu
 8+ypYqGUar62LRcPqlSTIqjnNG4OMLUSFUn1K38xfD48U4ZoEY016fWTayyBH7uAby9cMB2kq
 segemaiHpVda5LCNLOaxPPkhZ2iMap3eQ1dLlqWnYKpsFynuVnMZ3JgvfqgR5RWRi3sE/nbr9
 auaJqhcmtolXRU7bth8Eb84Ap1TQ9seWxumnbYJkbg2L9TA/paSKti0qDWa0WZfxrBGoHBMUO
 D3SYu3fNgvokPV+GlPcbPvGXgpW2bJACGWQpqhgTWlgAbKIghjmb1+Tyl5lHPrrrD+V9xlGod
 DHpmQRWAOCUfd1sqXkqZf8WJQXsjzs7rHG0BUFI77U5P1HNawMR6Zq9OIjmhGOz3iIeLJO1wE
 4+nixvVkEYocCIa0CtYji0RrBloXyjYbRZSbsyVxqnO8smifSWcLivBU0ef01D6TryftzVgdI
 ndfunvgqqbPe/DUFnJ6xn4D0Ei7cNdqB8g3Fj794vaQUGGmAnecnR5AesI97Y8+oUJP1XnHHL
 uT9YUztTe3pqzXsUEiv8ku+cKHsVxh8+DSnCk0PJbEEcm7d/mVeqLySPMf51ReShR48dXIGEc
 Dde87GTtKjA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stephen Boyd wrote:

> Quoting David M=C3=BCller (2019-03-14 03:18:59)
>> Since commit 88659387b9d509ee4bb8f0b0fe9ce2ff00988b46, the pmc_plt_clk0
>
> Is this a stable tree commit? It's not in Linus' tree.

Yes, the upstream commit is 648e921888ad96ea3dc922739e96716ad3225d7f
