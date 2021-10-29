Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA14FC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8CB9610D2
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232024AbhJ2GuC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 02:50:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:56924 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230252AbhJ2Gt6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 02:49:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACC1860E73;
        Fri, 29 Oct 2021 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635490050;
        bh=inclrrNe3sG/DqI6J9An9x3jlpsnqOFOU6M9S5U0dYI=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=kZtn0+s42XBPCd7zJk4BknIwgw+kwZDqI/wwCbo3d+vR/X+T0SfjcsfN7RK0TJ8ZG
         DDjp2ViKNB3gctCUWxlkmgDbJO8y8KatyAJwtufZNw6peSRkfKwGQda0tYRNBvDpoZ
         1wo/HL6P+OM0XK6ACThZM6dUWjecsLl/nZYDH0UlvROktk9GhR2s3O66qi/ct0BX86
         8XkBrL/PK+gb8EkzdYPX5Be0MQ9hvE4f5DdddSJZ6xdXJEf94G6SWkGpIwbfe1Ub/R
         8jdBscDZt8D+A2cH6wB8TcOZ2kXpjTbeRg93npGNncdEAJtRHbiT9jPuH5oNk+kWxU
         1l1SGGhionlvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6e90866d-d471-8b83-20f4-3c3b9f9aac0b@amd.com>
References: <20211012103612.101859-1-AjitKumar.Pandey@amd.com> <20211012103612.101859-2-AjitKumar.Pandey@amd.com> <163417468443.936110.1163914591071839489@swboyd.mtv.corp.google.com> <ba07cb00-0cdd-89b9-9d6d-932f366c4023@amd.com> <6e90866d-d471-8b83-20f4-3c3b9f9aac0b@amd.com>
Subject: Re: [PATCH v2 1/5] x86: clk: Add config option to enable 48MHz fixed fch clk
From:   Stephen Boyd <sboyd@kernel.org>
To:     Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        linux-clk@vger.kernel.org
Date:   Thu, 28 Oct 2021 23:47:29 -0700
Message-ID: <163549004939.15791.9311288462254199884@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Ajit Kumar Pandey (2021-10-19 11:14:56)
>=20
>=20
> On 10/14/2021 2:43 PM, Ajit Kumar Pandey wrote:
> >=20
> >=20
> > On 10/14/2021 6:54 AM, Stephen Boyd wrote:
> >> [CAUTION: External Email]
> >>
> >> Quoting Ajit Kumar Pandey (2021-10-12 03:36:08)
> >>> At present 48MHz clk support is only enabled for RV architecture
> >>> using "is-rv" device property initialized from boot loader. This
> >>> limit 48MHz fixed clock gate support to RV platform unless we add
> >>> similar device property in boot loader for other architecture.
> >>>
> >>> Add Kernel config option to enable 48MHz fixed clk gate registration
> >>> with clock framework. This enahanced flexibility to enable 48MHz fch
> >>> clock support on any platforms by simply enabling kernel config. Also
> >>> replace RV with FIXED as generic naming convention across platforms.
> >>
> >> What do we do if I enable CLK_FIXED_FCH in Kconfig but don't populate
> >> the 48MHz clk? It's always present so this isn't actually a problem?
> >> Why does the bootloader set an 'is-rv' property at all?
> >>
> >=20
> > Yeah 48MHz clock is always present and we will select or enable CLK_FIX=
ED_CH config from
> ALSA machine driver which enable/disable this 48MHz clock.
> "is-rv" property is set in bootloader of RV or Raven SOC architecture=20
> resembling "is-raven". Actually we want to use existing clk-fch driver=20
> for 48MHz clock support on raven hence used an acpi property to=20
> distinguish raven platform and used check with "is-rv" flags to register =

> 48Mhz clock with CCF. Now since we need this support on older and more=20
> platforms we moved to config selection approach for registering 48Mhz=20
> clk as changing or adding BIOS property isn't feasible on all platforms.

How do we expect distros to use the same driver on different hardware
with unchanged BIOS? It seems like anyone who wants to use this driver
now has to know what is wrong with their BIOS and build their kernel
with the config set or not? Looks like a headache. We shouldn't be
changing the kernel build configuration for something that we detect at
runtime.
