Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CFEC4360F
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 07:59:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6B2B20855
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 07:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lN6MIJ8v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfDDH7o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 03:59:44 -0400
Received: from mout.gmx.net ([212.227.15.18]:39543 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726031AbfDDH7o (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Apr 2019 03:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1554364772;
        bh=4dryxbjqDuB2mQedf9JoKOfNokVuiMRomlk/hAQCRus=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=lN6MIJ8v2y4dvzu9yHwXtO0Hke9LgXfp8gYRJAke7MfxH30ctyP3haG3f9/AhEmUs
         LLXmAyOaooqn+xBEuKABKHwbrhPgRrPOGSbyPA/B11kZq+wQgfjD2aWpEA0iyvCQO8
         RAT19bwdOX2lgBvh3i1/kRXna02ZkNdEiweLqxyM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.11.10] ([185.137.174.251]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MZTP3-1hURTN07bx-00LBDp; Thu, 04
 Apr 2019 09:59:32 +0200
Subject: Re: [PATCH v2] clk: x86: Add system specific quirk to mark clocks as
 critical
To:     Hans de Goede <hdegoede@redhat.com>, linux-clk@vger.kernel.org
Cc:     platform-driver-x86@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190328124939.23139-1-dave.mueller@gmx.ch>
 <20190403140857.1130-1-dave.mueller@gmx.ch>
 <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
From:   =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>
Organization: Privat
Message-ID: <6fdd8567-51fc-3931-9322-b71081b2b9ea@gmx.ch>
Date:   Thu, 4 Apr 2019 10:00:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:52.0) Gecko/20100101 Firefox/52.0
 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JSijmQh/NYoHpLB/UqH24mJsxXdren9tuRl9vvFpsaXoQpnr+34
 xXcq5ZceSBK/fHODamY5W43+YanQYqxMOnF+nYQlxKtQ/FmbCNX8J/cSvyHqXS09muF8wx9
 8+n4CpT0IkYj+TCPBwM66NKfelc80gH7drDB8MMyuyZJXOWTtgj1zON11q5siOuYCVCLCBi
 ZuVaU53clTcvedF3C0bCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CMNg1GOsuvg=:yR1MpnTg0mI+DbR9SA14x8
 tmE4LrC+PI7JsZ8LajBz84FsS2lHrdcEMltN3qscgSKNubJZp5E9yurz4SGALwGbXed+U4qS6
 6sRdgQEoPHq91cRgJ1twHvdwo4DFwkvrYJ/Vc8vMVTXUMgz+B3sXWBDymcyDBbok6INLT7VxJ
 6+uqyHOOC2RiAZyULSbFIyJBdYVcvsvSNuMVTqxLZGO1NKZpZp8XxdhYbdOXfDw2WN/SiYnxx
 995/aqVfsVh4/FOWezGtw+U3PIsewy4/oXF5RRejeGLEdNvQUpB0cyt3h+LKhaQYfqSU27JDP
 /+GPoIIO//pooFdZmQ4EaaKS+F7IoL10EeDBDv9XOPEkKBgAYJqILO+Gg8OnQIOLzNmtbnchK
 7xVOWBCoZiTV2cHHTml9oCGf0isQa2ed5zYr2kFfMsmd4TtBUmdcVPzbVxDHb2tA8GCmusjLF
 9udbSk2MwV6M2IbbWKUdVEvSZ8901bSFejrKRzo0K1gesSJ3oaU5BR49FcqX2Mh/xYKWkiwCX
 gqc8vxa5F2J6OGMoEbycsyw5knfteUQZnB2vj2e+It2LI5Z0kzrBi7F7oQ7yXgN5m+fzvNjIR
 nG8bfC5br3au+3mhwai5SEobUAdiZGh7E32ZEl/mWgwskSXE0rE/MoZv/f1xWPLXSehONYwJl
 4wb0ptjxVZIA03PF80zGWEN5xeNiAWTx3Ed03MnAqi5IEwS8O2L4pxFTpex49ambeU3hGb5WD
 evgCCQqggqRpvp6OIsWr8ZxqQX4Gl/NGIw42Xdm4FsRHTxijUN4lzTI3SyUUYVLo5GbVo9zZK
 bvHUjeHmVo3WgNS6eZe9pgl3pcWKOlg0OWu5nfTcu/OxZCK4hiu7E0+/3jPLoyF3cVQzP91Px
 gaZ4do55+/DKtMxVc3iruXPQz/47hMLqLcEOV9w6pMjIqfsE6dNpLSh4hwPw4pPUZ5tKnjVjw
 SCLcm3FX14g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello

Thanks for the review.

Hans de Goede wrote:
>> +/*
>> + * Some systems need one or more of their pmc_plt_clks to be
>> + * marked as critical
>> + */
>> +static const struct dmi_system_id critclk_systems[] __initconst =3D {
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ident =3D "MPL CEC1x",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_MATCH(DMI_SYS_VENDOR, "MPL AG"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DMI=
_MATCH(DMI_PRODUCT_NAME, "CEC10 Family"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>> +=C2=A0=C2=A0=C2=A0 },
>
> You need an empty terminating entry here, otherwise the dmi functions
> will keep walking the array, so you need to add:
>
> =C2=A0=C2=A0=C2=A0=C2=A0{}
>
> here.

Arrgh, shame on me.

Is there a rule / recommendation how the sentinel entry should look
like? In the kernel sources I see a "{}", "{ }", "{ /*sentinel*/ }", ...


Dave
