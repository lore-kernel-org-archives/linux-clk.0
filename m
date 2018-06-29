Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lj1-f173.google.com ([209.85.208.173]:36157 "EHLO
        mail-lj1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964976AbeF2IeW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Jun 2018 04:34:22 -0400
Received: by mail-lj1-f173.google.com with SMTP id o26-v6so6650360ljg.3
        for <linux-clk@vger.kernel.org>; Fri, 29 Jun 2018 01:34:22 -0700 (PDT)
Date: Fri, 29 Jun 2018 11:34:18 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: Stephen Boyd <sboyd@kernel.org>, robh+dt@kernel.org
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 4/4] clk: bd71837: Add driver for BD71837 PMIC clock
Message-ID: <20180629083418.GG2118@localhost.localdomain>
References: <cover.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <d99c8762b0fbbcb18ec4f4d104191364c0ea798c.1528117485.git.matti.vaittinen@fi.rohmeurope.com>
 <152878945117.16708.12422348324182290971@swboyd.mtv.corp.google.com>
 <20180612082354.GG20078@localhost.localdomain>
 <152997029783.143105.16692843405899913246@swboyd.mtv.corp.google.com>
 <20180626081319.GA2118@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180626081319.GA2118@localhost.localdomain>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Jun 26, 2018 at 11:13:19AM +0300, Matti Vaittinen wrote:
> Hello Stephen, Rob and all others
> 
> Thanks again Stephen. I appreciate your help. And just to help you
> sorting your inbox a bit - I have written patch series v6 and v7 before
> receiving these comments. I will write v8 after I get some further input
> from you and Rob on how to solve the issue with having the clk stuff in
> parent node and usage of devm_of_clk_add_hw_provider where DT node is
> fetched from dev pointer. 

Just for your information - I did send v8 without clk part as I was
unsure how to proceed with it. I still wanted to get the MFD fixes sent
before I start my vacations and family time. I will wait for input from
you / Rob and continue the clk portion latest after 4 weeks. Sorry for
long delay =(

Have a nice Summer
-- Matti Vaittinen
