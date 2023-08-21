Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA58EE49A0
	for <linux-clk@archiver.kernel.org>; Mon, 21 Aug 2023 21:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjHUVNc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Aug 2023 17:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjHUVNc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Aug 2023 17:13:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819F3D9
        for <linux-clk@vger.kernel.org>; Mon, 21 Aug 2023 14:13:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 17E4364BE2
        for <linux-clk@vger.kernel.org>; Mon, 21 Aug 2023 21:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F8FC433C8;
        Mon, 21 Aug 2023 21:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692652409;
        bh=lVgN4XwHhI1UcMbOVdRM3CTB3PkdKonlnaoZ8ZDxYqo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ULCJbMaJPZMK5w11go+BOrjuJN1QFfdR9FTDa+2ToVPq/1KSOdpIaN5axwMKYKQ/0
         xiFjNJq907Uh+h5PL4tHKfhF34bydz/PCHU9QPG03RvMsOsP5iux5L/mQ46OIyPswr
         ncu4k4pbuEUHIdVLzR7A7lMtK1LOFQGCY3W60WkrzCA2vrJ2pzGJF/lljkiYM38L2O
         CGK2t5ukM6VkmWHONuCyOrVosYQLAGQt2jijBpR89CyZtNbn6JdMpdxoywYL/bPZmE
         TbYLMKTZFNcH1PquP7p58AbTOxj5/wMIKh0UB1i6z2q5ZgMTyK9Uw00DgTPXSoqLKN
         Bj4g9yKHAmmYQ==
Date:   Mon, 21 Aug 2023 14:13:27 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Michalik, Michal" <michal.michalik@intel.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
        "jiri@resnulli.us" <jiri@resnulli.us>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        "jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>, poros <poros@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        mschmidt <mschmidt@redhat.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "bvanassche@acm.org" <bvanassche@acm.org>
Subject: Re: [PATCH RFC net-next v1 2/2] selftests/dpll: add DPLL system
 integration selftests
Message-ID: <20230821141327.1ae35b2e@kernel.org>
In-Reply-To: <CH3PR11MB84141E0EDA588B84F7E10F71E31EA@CH3PR11MB8414.namprd11.prod.outlook.com>
References: <20230817152209.23868-1-michal.michalik@intel.com>
        <20230817152209.23868-3-michal.michalik@intel.com>
        <20230818140802.063aae1f@kernel.org>
        <CH3PR11MB84141E0EDA588B84F7E10F71E31EA@CH3PR11MB8414.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 21 Aug 2023 09:32:56 +0000 Michalik, Michal wrote:
> On 18 August 2023 11:08 PM CEST, Jakub Kicinski wrote:
> > How fragile do you reckon this setup will be?
> > I mean will it work reliably across distros and various VM setups?
> > I have tried writing tests based on ynl.py and the C codegen, and
> > I can't decide whether the python stuff is easy enough to deploy.
> > Much easier to scp over to the test host a binary based on the 
> > C code. But typing tests in python is generally quicker...
> > What are your thoughts?
> > 
> > Thanks for posting the tests!  
> 
> Hi Jakub,
> 
> First of all - everything I'll write is just my opinion. While having
> quite a bit Python experience, I can't speak confidently about the
> target systems and hardware (architectures) it would be ran against and
> what might be possible problems around that. I need your help here.
> 
> From my point of view, all we need is a Python 3.7 and access to PyPI
> repositories. This version of Python is 5 years old, but if we need
> support of even older versions I can rewrite the code not to use
> dataclasses[1] so we could go with even older version. Do you think it
> is required to support platforms with no Python at all?
> 
> Another requirement is the toolchain for building the module, but I
> assume if Python is not there in some embedded system - the build tools
> are also not there...

I think the module would need to be merged with netdevsim or some such.
The usual process is for module to be part of the normal kernel build
and then require appropriate CONFIG_* options to be set.

I wonder about Python availability. If anyone who works on embedded
knows of Linux platforms which don't have Python - please shout.
Hopefully we're good on that side.

PyPI is a bigger concern, I think pure SW tests are often run in VMs
without external connectivity.

> I've seen other Python pytest code in the kernel repo - that is why I
> thought it might be a good idea to propose something like that. Your
> idea is also cool - binary is always superior. I am a strong advocate of
> taking into consideration not only deployment ease, but also maintenance
> and ease of read which might encourage community to help. I also see a
> benefit of showing the sample implementation (my tested "dummy module").
> 
> My deployment is automatic and does not leave any garbage in the system
> after tests (packages are installed into temporary virtual environment).
> In case any of the requirements are not met - tests are skipped. I've
> tested it both on real HW with some E810T cards installed and on fresh
> VM - seems to work fine. But that of course require further verification.
> Till now only Arek Kubalewski sucessfully gave those tests a shot.

Does it work on a read-only file system? People may mount the kernel
sources over read-only 9p or nfs.

> The biggest concern for me is the requirement of selftests[2]:
>   "Don't take too long;"
> This approach is reloading the modules few times to check few scenarios.
> Also, the DPLL subsystem is being tested against multiple requests - so
> it takes some time to finish (not too long but is definitely not instant).

I think the time constraints are more of a question of practicality.
A developer should be able to run the tests as part of their workflow.

> If you asked me, I would consider those tests to be part of the kernel.
> I am not sure if they should be a part of selftests, though. Maybe a
> reasonable approach would be to have have my tests being a "thorough
> integration tests" and at the same time some limited tests shipped as a
> selftests binary? I can also parametrically limit the scope of my tests
> to run faster in selftests (e.g. only one scenario) and having possibility
> to run extensive tests on demand?
> 
> Thanks,
> M^2
> 
> [1] https://docs.python.org/3/library/dataclasses.html
> [2] https://www.kernel.org/doc/html/v5.0/dev-tools/kselftest.html

