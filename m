Return-Path: <sergej@taudac.com>
Subject: Re: [PATCH] clk: si5351: Apply PLL soft reset before enabling the
 outputs
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Stephen Boyd <sboyd@codeaurora.org>, jacob@teenage.engineering,
 mturquette@baylibre.com, linux-clk@vger.kernel.org,
 Rabeeh Khoury <rabeeh@solid-run.com>
References: <1501010261-7130-1-git-send-email-sergej@taudac.com>
 <20170726011112.GK2146@codeaurora.org>
 <5b9c2982-c376-ce39-e3aa-09c0feefd63c@gmail.com>
 <96cb94f5-1b00-70a4-4027-863b2f8e6ba4@taudac.com>
 <20170727091147.GA662@n2100.armlinux.org.uk>
 <e658b14c-620c-5e94-4b80-0841addd5a1f@gmail.com>
From: Sergej Sawazki <sergej@taudac.com>
Message-ID: <e3f5101f-e5f4-5071-8fa9-4c398931070b@taudac.com>
Date: Tue, 8 Aug 2017 22:59:26 +0200
MIME-Version: 1.0
In-Reply-To: <e658b14c-620c-5e94-4b80-0841addd5a1f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Am 28.07.2017 um 09:33 schrieb Sebastian Hesselbarth:
> On 27.07.2017 11:11, Russell King - ARM Linux wrote:
>> On Thu, Jul 27, 2017 at 01:10:58AM +0200, Sergej Sawazki wrote:
>>> Am 26.07.2017 um 06:43 schrieb Sebastian Hesselbarth:[...]
>>> On my setup, the Si5351 provides audio bit and frame clocks. Without
>>> resetting the PLLs before enabling the output clocks the phase offset
>>> between the clocks is unpredictable, the clocks are not aligned, this
>>> corrupts the audio stream.
> 
> Sergej,
> 
> if the two clocks you are generating are directly related to each other.
> why aren't you using _one_ PLL and derive both clocks from the same PLL?
> 
> This should solve your alignment issues.
> 
[...]

Sebastian,

I am using _one_ PLL for all my clocks, still, the phase relationship 
between the clocks is random on each activation.

The only way I was able to fix it, is to reset the corresponding PLL.

Sergej
