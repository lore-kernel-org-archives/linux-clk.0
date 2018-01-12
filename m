Return-Path: <david@lechnology.com>
Subject: Re: [PATCH v5 02/44] clk: davinci: New driver for davinci PLL clocks
To: Adam Ford <aford173@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@kernel.org>,
 linux-kernel@vger.kernel.org
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-3-git-send-email-david@lechnology.com>
 <7fc8bd35-0416-216d-8e1e-53a0ec6e8790@ti.com>
 <01fbde0e-36a0-2b19-e385-e63bc4a3ae4a@lechnology.com>
 <CAHCN7xK44_zv27xe5yxL8Efey=VC-nypK6hY6VWqsoLqnKe04g@mail.gmail.com>
From: David Lechner <david@lechnology.com>
Message-ID: <c5cea4a3-0e52-d9ce-339b-b3dcd1be5a42@lechnology.com>
Date: Fri, 12 Jan 2018 09:48:31 -0600
MIME-Version: 1.0
In-Reply-To: <CAHCN7xK44_zv27xe5yxL8Efey=VC-nypK6hY6VWqsoLqnKe04g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 01/12/2018 09:30 AM, Adam Ford wrote:
> On Fri, Jan 12, 2018 at 9:25 AM, David Lechner <david@lechnology.com> wrote:
>>
>> Yes, I noticed that I missed this after I submitted this series. And I
>> will have to rework things to coordinate with the PLL as mentioned above.
>>
>> FYI, I do have cpufreq-dt working, although the LEGO EV3 has a fixed 1.2V
>> regulator, so I am limited in what I can test. Basically, I can only switch
> 
> I can test the cpufreq-dt.  Are there additional patches or are they
> part of the same git repo I have been testing?
> 
> The DA850 I have may not run all the way to highest speed, but I'll
> see what I can find.  I think I had a few at one point, but I don't
> think it was part of Logic PD's standard product lineup.
> 

There are some extra patches I have not submitted yet. However, based on the
other comments here, I don't have things implemented correctly, so you probably
want to wait to test until I get that straightened out anyway.
