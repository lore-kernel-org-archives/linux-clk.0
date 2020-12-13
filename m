Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD17DC433FE
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:37:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91FBF22D71
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbgLMFhA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Dec 2020 00:37:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728755AbgLMFg7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Dec 2020 00:36:59 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607837779;
        bh=t/n1tspDQdnKbiymnbRa69RsP87wuaQJFxpNY2WLfDY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YLXW46D5IratvVVN0wvVSIWmUTmDUT4AsoTzm84dv6/1PbG8AFpQjawrzc89Fh0l9
         eQMfSj7QTOHZKPKFq/Ypd8iVLB3Dj4f/H2V0ZUxBTF5IZ8r1LEhPZG8mRQokS11PYQ
         +erVhTxe5Z10Lae541yGoPlPMnQ8fjd77hwUz9lefCd97iUMupIExg+CoXJFWP5h+I
         5bPzoxJclEoUPaP1rPOp3AT1TKxXfNwiDXRvalOmX+olRCKN9FYxxcVD/vjiZpVBS6
         c2iDW9eCvnF1/fpQ8tYs4Sy6/27nqmwjy+36roP2a5JsVBNJvHFgMUcS43AFow+fPn
         TFYV1cWZ6G/Yw==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v7 0/7] clk: clk-wizard: clock-wizard: Driver updates
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     git@xilinx.com, devicetree@vger.kernel.org,
        mturquette@baylibre.com, gregkh@linuxfoundation.org,
        devel@driverdev.osuosl.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Sat, 12 Dec 2020 21:36:17 -0800
Message-ID: <160783777786.1580929.1950826106627397616@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2020-11-04 07:06:40)
>=20
> Shubhrajyoti Datta (7):
>   dt-bindings: add documentation of xilinx clocking wizard

Any chance to respond to Robs comments?

>   clk: clock-wizard: Add the clockwizard to clk directory

Is it called 'wizard' anywhere in the documentation? I wonder if there
is a better name that could be found for this.

>   clk: clock-wizard: Fix kernel-doc warning
>   clk: clock-wizard: Add support for dynamic reconfiguration
>   clk: clock-wizard: Add support for fractional support
>   clk: clock-wizard: Remove the hardcoding of the clock outputs
>   clk: clock-wizard: Update the fixed factor divisors
>
