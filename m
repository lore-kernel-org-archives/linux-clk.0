Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2595CC43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 17:31:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5C382147C
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 17:31:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="DnNewC3R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfC0Rbn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 13:31:43 -0400
Received: from mout.gmx.net ([212.227.15.15]:49953 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727695AbfC0Rbn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 27 Mar 2019 13:31:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1553707878;
        bh=5MHdzMAMLhIwvK+MnsGPUFU1DXy5by806f5J/TGvq/M=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=DnNewC3RioY3gl1PzKGCV/j+Kt2Vclbei6I9yxk6derovKZgV1s4/Z3+mxA+DzszO
         DzQlFzb+KMNbTX0WExZepjesCtSusJ8Z1X0Ahb8gaz2Qzsng2p2mo8AvBG12mcWjuo
         giMuZspAbMxT/24terhlE1Ju++D6JLoUhizvVB4w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.16] ([46.127.221.103]) by mail.gmx.com (mrgmx002
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0LfSeH-1gbkFj1BRB-00p90g; Wed, 27
 Mar 2019 18:31:18 +0100
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
Date:   Wed, 27 Mar 2019 18:31:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <20190327164748.GO9224@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gACAIf9QlhHSJLAvPXMBQEqnzVNbBpqpvXfLnsWmz/Xw88/AceN
 FopCraEyQQjejDd+dIrHK7e+g7jucLAgIPZbkw1XNHurIBBWaOIqy5wk2cGTPkRIE4xoagT
 zOniZuXWl08nDRwLQyCXwWdywwwRD4l9/+Bes9VNcQKmLwynTCYAhOWv1CBUtqIlrvH6Muh
 mSsLFKUQmYOa08NFeuG4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TLc8H4SH2yw=:UFOTytyKsbc3xjf87aaQte
 uiiA1JyMgvuLHftK5HVlIPduvNqWdYBufAa2je6KKIcx/Z2A6ZB3lCrhFGNJOdD8rwtFBL4n3
 D6yeqzNu+cy/DEeZoYQJZM9PQh3+5L7T6YmyNxXJqCw7SkU83r43YOOyM2tKRlJjr/p0dSZQo
 FN/ZTQN/+uw1lLr08SfzphImXuFiS1TmyLlsurAVpQbUIIvimWVGsmetW18IOtEYXw2peB0O/
 /6dMsyjRKLqbewWaN80mMM+1V+Dk9dYZUEw/wvKNcS3IJTgrfBunXkGYkO92snmM76meSsnsc
 X84gbBUBj6jCvKU55oUaWrNIxfaKa7jihhhzXvMU32Y3fmWKx9BLGyPp3aa9rix9kVeT//Mqr
 CZp+hfLQtIvnNWhpQY2pdLmrSqK25N2KSdhArWVYpLsJIEujJfIiE1GEhk/ORSq630YRmN6SN
 dXwwaboOD6n28VPcffr8VwDwNejJLEVK8CWxiTFkctGufopnmexm6Kdh1R38pn/uwOvEwIDR7
 tyIUYoulwJehBnfhyzPHEahm0y3X79XskFf57KHJWNx2M4EuNlexZ4BnO2gN/sXuZqZctQ80F
 EjFy7vj7BHuyQDKBUlVvPI+ZXPpe0sYHBzf80VIvSNemMGabZZ6P/aMpxe3eRJIXFvSenXpXT
 WGCIEEyicV+kUEHVjyFbjFnMxMMawmfdERhhM/qxuzaaH3IHPm5Bv5t9m0dSsE0cd+yzdBqtH
 dSiX9jFAFEfSALQC/mLWeOcPN+taHRvXL24T8hBM+vAaz/TBK94b4FE5ahK6sbRXOedm06fT3
 tdIYSwfV46/D0tB0ytkFAHIkLqIZ8KAUth2xeCzJ0zZmPQ8TIodjDUNZyK0jEUDGyASsmU/Ni
 C/7+WhfuiSDXaBYCvmBjOb+phMTKSY271NFnEMwKpLYLQyRKj/K70JHDRO7WZZz+LbsQINGfo
 xx6okwZE0xw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

Andy Shevchenko wrote:
> On Wed, Mar 27, 2019 at 05:02:31PM +0100, Hans de Goede wrote:
>> I think that it might be better to restore the CLK_IS_CRITICAL workarou=
nd
>> for this, but then only on select boards, based on DMI matching.
>>
>> I've added a bunch of relevant people / lists to the Cc.
>>
>> Andy, Stephen, what is your take on this ?
>
> I'm afraid I forgot all details about that (semi-)famous issue. Though, =
looking
> into your patch against r8169 and taking into account DT practice, it wo=
uld be
> not bad to fix a driver, we have by the way devm_clk_get_optional() now,=
 so, it
> would be not a big deal.
>
>> I'm myself starting to believe the DMI based applying of the
>> CLK_IS_CRITICAL workaround is the best solution here.
>
> DMI quirk table tends to grow in mysterious ways. I would prefer in this=
 case
> logical solution =E2=80=94 if platform has an optional clock, then use i=
t.

The pmc_plt_clks may also be used for external hardware purposes without
the need for a driver involved. So I'm afraid a fix similar to the r8169
approach will not suit all needs. Please see
https://www.spinics.net/lists/linux-clk/msg35800.html for details.

I'm in the final phase of testing a DMI based patch on my hardware.
If all goes well, I could provide a first version of the patch for
review by tomorrow.

Dave
