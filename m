Return-Path: <marcel@ziswiler.com>
Date: Fri, 23 Feb 2018 07:28:33 +0100
In-Reply-To: <98bfea14-de25-e764-94b4-2f0dd687149a@wwwdotorg.org>
References: <20180222230451.15515-1-marcel@ziswiler.com> <98bfea14-de25-e764-94b4-2f0dd687149a@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: [PATCH] clk: tegra: fix pllu rate configuration
To: Stephen Warren <swarren@wwwdotorg.org>
CC: linux-tegra@vger.kernel.org,Dmitry Osipenko <digetx@gmail.com>,Marcel Ziswiler <marcel.ziswiler@toradex.com>,Thierry Reding <thierry.reding@gmail.com>,Stephen Boyd <sboyd@kernel.org>,linux-kernel@vger.kernel.org,Prashant Gaikwad <pgaikwad@nvidia.com>,Peter De Schrijver <pdeschrijver@nvidia.com>,Jonathan Hunter <jonathanh@nvidia.com>,Michael Turquette <mturquette@baylibre.com>,linux-clk@vger.kernel.org
From: Marcel Ziswiler <marcel@ziswiler.com>
Message-ID: <5E71CC53-1C99-45FD-9615-D95C88DC085B@ziswiler.com>
List-ID: <linux-clk.vger.kernel.org>



On February 23, 2018 12:47:56 AM GMT+01:00, Stephen Warren <swarren@wwwdot=
org=2Eorg> wrote:
>On 02/22/2018 04:04 PM, Marcel Ziswiler wrote:
>> Turns out latest upstream U-Boot does not configure/enable pllu which
>> leaves it at some default rate of 500 kHz:
>
>I assume this is only because U-Boot just happened not to access any
>USB=20
>devices=2E In other words, if you break into the U-Boot boot flow and=20
>explicitly initialize/access USB, then USB works both in U-Boot and in=20
>the kernel even without this patch?

Exactly=2E

> If that's not the case, it seems=20
>there's a bug in U-Boot=2E
>
>Either way, I have no issue with this patch=2E I just want to make sure=
=20
>there weren't other bugs in U-Boot that needed fixing=2E

No, rest assured U-Boot is working just fine on the legacy Tegras=2E The o=
nly thing in need of fixing lately was NAND on Colibri T20 and Harmony=2E
