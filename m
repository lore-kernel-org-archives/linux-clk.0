Return-Path: <sudeep.holla@arm.com>
Subject: Re: [PATCH] clk: scpi: don't add cpufreq device if the scpi dvfs node
 is disabled
To: =?UTF-8?Q?Micha=c5=82_Zegan?= <webczat_200@poczta.onet.pl>
References: <1483706070-12357-1-git-send-email-sudeep.holla@arm.com>
 <d51628d1-c930-ec13-990c-97cc47d80472@poczta.onet.pl>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <d1cccb6b-e938-6522-c45f-5b613567cb4e@arm.com>
Date: Mon, 9 Jan 2017 09:58:37 +0000
MIME-Version: 1.0
In-Reply-To: <d51628d1-c930-ec13-990c-97cc47d80472@poczta.onet.pl>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 07/01/17 00:44, Michał Zegan wrote:
> seems the patch works as intended.
> 

So, can we take this as
Tested-by: Michał Zegan <webczat_200@poczta.onet.pl> ?

> W dniu 06.01.2017 o 13:34, Sudeep Holla pisze:
>> Currently we add the virtual cpufreq device unconditionally even when
>> the SCPI DVFS clock provider node is disabled. This will cause cpufreq
>> driver to throw errors when it gets initailised on boot/modprobe and
>> also when the CPUs are hot-plugged back in.
>>
>> This patch fixes the issue by adding the virtual cpufreq device only if
>> the SCPI DVFS clock provider is available and registered.
>>
>> Fixes: 9490f01e2471 ("clk: scpi: add support for cpufreq virtual device")
>> Reported-by: Michał Zegan <webczat_200@poczta.onet.pl>
>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>> Cc: Michael Turquette <mturquette@baylibre.com>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep
