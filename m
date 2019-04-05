Return-Path: <SRS0=2G6t=SH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA87C282CE
	for <linux-clk@archiver.kernel.org>; Fri,  5 Apr 2019 17:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DB1D2184B
	for <linux-clk@archiver.kernel.org>; Fri,  5 Apr 2019 17:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="hr/dN2+e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbfDERTj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Apr 2019 13:19:39 -0400
Received: from mout.gmx.net ([212.227.15.19]:53595 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730870AbfDERTi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Apr 2019 13:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554484761;
        bh=XCB652qUdPHwNv5ml4SqPR351vUhbY1m7Ohr6r4qVQk=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=hr/dN2+eT/qRf85XUPveWy00yc9D2INl010ghKRv+1gi3RY1eZk98yF47QSqq+2rB
         8AO3eJTGzV0j4UdmShcplqqX5J03uLL+4vDxeRkid+rWlfah8sPhiYd2l1s/X2MEld
         nOCnlwm9+zjeW8WLmt0CZCAkkb7qMDKNZwUfR2E8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.38] ([46.127.221.103]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M3S2C-1gun9d02FM-00qwM0; Fri, 05
 Apr 2019 19:19:21 +0200
Subject: Re: [PATCH v3] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <20190404141325.21952-1-dave.mueller@gmx.ch>
 <CAHp75VeaWLW4GdknPHeh69enOFc_3izcwwpAhKXGJfk45QMLgw@mail.gmail.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <cf20b8b1-2061-6133-d764-3241d5d9acdf@gmx.ch>
Date:   Fri, 5 Apr 2019 19:19:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <CAHp75VeaWLW4GdknPHeh69enOFc_3izcwwpAhKXGJfk45QMLgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T9VMoIoUhX0M7NTtieAiYCF0JMvbvTn+cHXT27H2l07g8sutGs3
 TQcwqpsT2mych2Wj3tRAS1KuaxOC7zyFo1DbWykFIr2a4UgADknHBV7HvhZZUACWZWMvcVT
 KSD2F3E98b9kvOa84BLGiV9m+kvTGDhlVZAiiNfhdGn6eQTshAFocCDct1lbmGFZ2YqGzCm
 QrHIwwqjlVW1hKv9Qofxw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xCXKJlujJyk=:cXDO3pcG8gS/FOzPQ8djri
 XGYJ9fI5ZUmEzh4Cdd12U5QQEO379qH64LAarYLZnckIeFQF3ZALMQkWfql13ZDihw4AWF6O0
 rxnkcRLElOulglnoQ8nLtPhcAQlYLnkV0+8fNLPCXSqeR2OMpyvwE4RiEVmeM9MLYTtVUwkcR
 hwveOQk2iXqSNBV0SuxllhhZMCjxScKuqH7LPJ/O9Vf0gmoe3ty8xSmk5xhzMbdKR2q19JhQv
 PYZx/QZ9U4Gs+4JltFkwcF5EeYp/TLRido7wrb7uJxHCTi/+l584mx9eSwXQuVuUjxo3Qwh4P
 kg2FjoBCDPExOYnee400AgcxxMPb2CgRtLUQV52oejG3IF1X/f78+CF/QQ9aHiurYcybsZyFk
 YrW6+3sRFZeEU6vyWdtvMNP8gG2FCUxAFchurcgm77QlHHtC5Iy5v98eBx4C8+bBw1mo+wlaQ
 pweBZIF1aQd0mnJ0GSecgsiJIDTY0wRazEFRtfoMyVFBUxw9/xATuZ8DIduefCHZETgeHnm/7
 0rt0diGKxf+keCG9sQsGSPCU0cghfXzY012a2WLlk1aad/y9beW/DK9gTsKnYXmFQTEMvXOlZ
 M4uOXJ2eaXyUpvHbNlKTa+bTNpI4IJbzQAjM7ai7ouoBcmvZ6OZ5IQap92A8tUeHmzC3m2IXT
 Tphh5ji6Bse98jaQjE211XjWMM1w6yYAhCSS98IWdGA/rlTUlZQnURxuFNoKCosBaeJYTW6PB
 JS7C0FGzp5XCD6UNys4yWiluAXvJsPnZuT8ag3AFXY6dtFCwn7KGaJut+yJoDjvOxysvewcem
 ECKXqAeueVmtXb8egrSpw2aICJpjfm6px7KBvFOyCeNaCOw9kCUcv+qnUI6FnTMQcdWlZXbTj
 Sn9O23oaJyP+hgvr9Y0NUSDav7amPTUGndlJUkPjnxDGGkLZyO9PUrHRev/ItFslbRDolrTwh
 wt52PUFscLw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

Thanks for the review.

Andy Shevchenko wrote:

>> +       /*
>> +        * On some systems, the pmc_plt_clocks already enabled by the
>> +        * firmware are being marked as critical to avoid them being
>> +        * gated by the clock framework
>
> Period would be nice to have at the end.

Ok.

>> - * @base:      PMC clock register base offset
>> - * @clks:      pointer to set of registered clocks, typically 0..5
>> + * @base:              PMC clock register base offset
>> + * @clks:              pointer to set of registered clocks, typically =
0..5
>
>> + * @chk_critclks:      flag to indicate if firmware enabled pmc_plt_cl=
ks
>> + *                     should be marked as critial or not
>
> Perhaps simple critical? And do not touch the rest here.

Ok, I will rename the field.

Dave
