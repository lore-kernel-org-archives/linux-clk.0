Return-Path: <rklein@nvidia.com>
Subject: Re: [PATCH v3] clk: tegra: Initialize UTMIPLL when enabling PLLU
To: Alexandre Courbot <gnurou@gmail.com>
References: <1463432860-906-1-git-send-email-rklein@nvidia.com>
 <CAAVeFuLmjZ3vN0Q-7T=kEw_d4P1uS7mBmirpttXkPC+isKELYg@mail.gmail.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver
	<pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "Michael
 Turguette" <mturquette@baylibre.com>, <linux-clk@vger.kernel.org>, "Andrew
 Bresticker" <abrestic@chromium.org>
From: Rhyland Klein <rklein@nvidia.com>
Message-ID: <ca1937f5-38df-1fe7-9f66-c3d643b68e0f@nvidia.com>
Date: Wed, 18 May 2016 11:26:13 -0400
MIME-Version: 1.0
In-Reply-To: <CAAVeFuLmjZ3vN0Q-7T=kEw_d4P1uS7mBmirpttXkPC+isKELYg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Return-Path: rklein@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

On 5/18/2016 12:02 AM, Alexandre Courbot wrote:
> On Tue, May 17, 2016 at 6:07 AM, Rhyland Klein <rklein@nvidia.com> wrote:
>> From: Andrew Bresticker <abrestic@chromium.org>
> 
> ...
> 
>> generations. For instance, in clk-tegra124.c, it used to have:
>>
>> when the correct shift to use is present in the new version:
>>
>> which matches the Tegra124 TRM register definition.
> 
> Seems like the examples are missing?
> 


yep, I have left the '#' in in the defines and so it was treated as a
comment and left out. Thanks.

-rhyland

-- 
nvpublic
