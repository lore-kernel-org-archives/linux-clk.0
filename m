Return-Path: <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: register clocks used by the
 hypervisor
To: Dirk Behme <dirk.behme@de.bosch.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org
References: <1467282752-14053-1-git-send-email-dirk.behme@de.bosch.com>
 <146776885213.35356.11565744417822933094@resonance>
 <577D035C.7090504@arm.com> <146783774807.35356.6362595927321996311@resonance>
 <dad950db-4c02-e5a2-0ce9-682a40cd12d7@de.bosch.com>
 <146794625655.73491.13497001485518368066@resonance>
 <373bf006-1a5e-0b2b-278d-d5ec0d8737fd@de.bosch.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Julien Grall <julien.grall@arm.com>
Message-ID: <577F70A8.7020406@arm.com>
Date: Fri, 8 Jul 2016 10:21:44 +0100
MIME-Version: 1.0
In-Reply-To: <373bf006-1a5e-0b2b-278d-d5ec0d8737fd@de.bosch.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Dirk,

On 08/07/16 06:51, Dirk Behme wrote:
> On 08.07.2016 04:50, Michael Turquette wrote:
>> Quoting Dirk Behme (2016-07-07 00:32:34)
>> The two issues to resolve are:
>>
>> 1) does consuming these hardware resources from the Linux kernel fit
>> correctly with the Xen model?
>
>
> I think so. Julien, what do you think?

I don't think it fits the Xen model. I will give more details on the v3 
as your commit message give an example with is contradictory to the model.

Regards,

-- 
Julien Grall
