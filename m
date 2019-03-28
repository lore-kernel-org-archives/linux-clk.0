Return-Path: <SRS0=OKnm=R7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF73C43381
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:36:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BAFF12173C
	for <linux-clk@archiver.kernel.org>; Thu, 28 Mar 2019 14:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XAEQVJUb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfC1Ogb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Mar 2019 10:36:31 -0400
Received: from mout.gmx.net ([212.227.15.15]:40633 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbfC1Oga (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Mar 2019 10:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1553783746;
        bh=TN6b9b0S/9+xjWzdRP6B3DLNgpB2Qyy1B0J2sUZsRZA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=XAEQVJUbtngqCiIUWDNEuho2v+fd3xjfJDZtubZgAjD6NRyviMP7yA1tpsTNp+lWy
         Mc5EdDD/A/lMKEmfGHV7GkHX9P8YzXZjtKR3quqAWU6Su3VT8IVSz0ur4st6aICyBJ
         kFcQrd+EOhG83fZyvyZRGHA5xottpaxQxDoPfLsI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MILxX-1h72E91Kmd-004CVm; Thu, 28
 Mar 2019 15:35:46 +0100
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <1c433bef-055e-2ac3-990c-325aa2d3899e@factor-ts.ru>
 <9B4A1B1917080E46B64F07F2989DADD69AF4DDE7@ORSMSX115.amr.corp.intel.com>
 <0d0b97cc-2871-6a81-11ad-4dbb8a6b652e@redhat.com>
 <20190327164748.GO9224@smile.fi.intel.com>
 <907ab1ec-ae46-a678-4f0e-87af5069f2eb@gmx.ch>
 <20190327191925.GP9224@smile.fi.intel.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <5dd6a6ac-94de-07ad-df5a-2601cbc7e9d0@gmx.ch>
Date:   Thu, 28 Mar 2019 15:35:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <20190327191925.GP9224@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2IZUbd8WfQbkrpyOCzvQ8z+pvuHR9rIOYglj17E8poFDZlJobfb
 XQ4140F0PjiLsm3D5X9FIqGjXzK5nbuPBRcz9sJMG7LXzddeo3xJW48T43u9pA6pk/3OEz8
 xvosuwEb9jxbw1QsE9jjOvV65ASs8Vfm85n22G8EdwREwz58tHewQlwC+DE+epoychZdPEf
 NX2Fp5anMdVIaO0RFmyqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1yY3HTmMdCg=:pvxwlGuaiICcBBjzfw0g51
 KxTPWBgasg85PJ20UADqJxZ/yKBFHx/R1xAaRVtRXk/+ebCAh8ruiVFTOaPm8vMsHTj4sOCQM
 R0oBWN3gymTtmFCjcJu1cw/wo+BOYEBcdjNfjuS6S8zBfighI+glQjPR1NlYm5H45r5vG0nIp
 6cgcLUXCavIEwjyHRwdvS+7Kdb3/VbfSFA6vk0r0Sqb80nEXvLlTm5t9SjJt2Mr1ifHMwReL5
 zCMwcM5ml4MTxHsAGc1k/q0QiJ+SAn2FKrGq3YaYroIrAhYhsc0bTE+8ICkZ9SWnnEIWSg16M
 KUZj/OT+Cgy/t0qqUBqKILO2yTeZQlEvu9nnskh6F2I6lkMLUnmEDGsRjDY1rRaFObdL3uKcK
 V37KvZK7w37cXrs7Add8+lOLKOm9TBJTyfwaw5mxdwH/1RNtEzengfw6RdvPCi6bLtnQlsu+b
 1GMPv72FJmnk/iP+SPqXmiHcP71ei4HvRg+bKPxFx3APlrXSgslLacHhw2p+0pHWWlQrLEUZx
 xXcjcajNhn6uiRQ/SgKJRvhA9OUfUxgRPqfguKfBss2v+N16Y30oRYaIDU7FqRUT6/Gtxq3S0
 6zDfwBU4tTE1fzVFYGlvfkvmlCBa1Hcx83gWFlXGots270p8hKfboE7lkVTZoguOPFjes5XCq
 1kvW2o3b08+Mqbec/srNTVmfoQlPMaKs6NOrBMa6t21gWK2RGFVXfz+em4KscIvZKrEBl1Z/D
 qDoXreCynAN5k2YMBgwpRg0clEGrUWJPq2WQKjowfxoi6rVNfLd5swSdMNFTMDhsPoBGp4Wdx
 dKM8yNmXbwSu0/AGf3TY5OyUp8WEHf1XQbCD66rulK0g1QrkFopTx/OpgzoSi0mvdPLbNSigC
 sMLSwPVQ+9+7R1dtfhgVAqIKGR+luhJcODFZ4bOs/B9HgQ9RA20Gedg1pPtbQiyFXn8Y3nHNa
 FUoecMMcOIQ==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

Andy Shevchenko wrote:
> On Wed, Mar 27, 2019 at 06:31:19PM +0100, David M=C3=BCller wrote:
>> The pmc_plt_clks may also be used for external hardware purposes withou=
t
>> the need for a driver involved. So I'm afraid a fix similar to the r816=
9
>> approach will not suit all needs. Please see
>> https://www.spinics.net/lists/linux-clk/msg35800.html for details.
>
> Any driver for device which is using PMC clock should take it into
> consideration.

I agree that each driver should properly request the clocks and other
resources needed.

But what if the PMC clock is used by hardware for which no driver is
being loaded or needed?


Dave
