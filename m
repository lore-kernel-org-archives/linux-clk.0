Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
Subject: Re: [PATCH v2 0/2] Add initial support for RPM clocks
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
 <20150921043310.GO13472@usrtlx11787.corpusers.net>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <5601DA59.2010909@linaro.org>
Date: Wed, 23 Sep 2015 01:46:49 +0300
MIME-Version: 1.0
In-Reply-To: <20150921043310.GO13472@usrtlx11787.corpusers.net>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 09/21/2015 07:33 AM, Bjorn Andersson wrote:
> On Mon 03 Aug 09:48 PDT 2015, Georgi Djakov wrote:
>
>> This patchset adds initial support for the clocks controlled by
>> the RPM (Resource Power Manager) processor on Qualcomm platforms.
>> It depends on Bjorn's Qualcomm SMD & RPM patches, that are now in
>> linux-next: https://lkml.org/lkml/2015/7/27/1125
>>
>> The first patch implements the RPM clock operations, which are
>> using a shared memory for sending requests to the RPM processor.
>> The second patch adds the support of RPM clocks on the MSM8916
>> platform.
>>
>
> I pulled this set into my local tree and added a MSM8974 driver; so I
> could enable cxo_a2 and load the WCNSS firmware. This works great.
>

Thanks for trying it.

> I do however have a problem that if I revise the gcc and mmcc drivers to
> be rooted in cxo_clk_src (like you have for 8916) the clk_set_rate() in
> msm_serial messes up my uart - way before the rpmcc driver is loaded.
> I have not debugged this further (as it wasn't needed for my usecase),
> but have you seen any issues related to this?
>

I am not seeing this on 8916 and don't remember seeing in on 8974, but 
will give it a try again next week when i will have a 8974 board.

>
> Will you be able to send out v3 anytime soon, so I can rebase my 8974
> patch and send that out? Or would you be interested in me sending you my
> 8974 and you can include that in your series later?

Yes, will send v3 probably next week. I also have a work in progress
patch for 8974, but don't mind taking yours instead.

BR,
Georgi
