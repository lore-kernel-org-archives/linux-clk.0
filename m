Return-Path: <jonathanh@nvidia.com>
Subject: Re: [RFC 6/6] bus: Add support for Tegra NOR controller
To: Mirza Krak <mirza.krak@gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-7-git-send-email-mirza.krak@gmail.com>
 <f6df33eb-53ae-699b-9e1f-69eb7fed7da0@nvidia.com>
 <CALw8SCVy4ud5_+gS3C8WeyTCV0m_4R2xjdEY4vCKEq_3-aFanw@mail.gmail.com>
 <dbbb5c9f-8c67-9d9f-171b-64cd18353411@nvidia.com>
 <CALw8SCXCdVMKgemEyQ-MZbxdthkPCDVzi+3boqtXk1_XNjcz4g@mail.gmail.com>
CC: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding
	<thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>,
	<pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Michael
 Turquette" <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>,
	<linux@armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <7f558131-60c7-22e2-2b2e-93d4b405a2db@nvidia.com>
Date: Mon, 25 Jul 2016 09:19:12 +0100
MIME-Version: 1.0
In-Reply-To: <CALw8SCXCdVMKgemEyQ-MZbxdthkPCDVzi+3boqtXk1_XNjcz4g@mail.gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>



On 22/07/16 20:18, Mirza Krak wrote:
> 2016-07-22 11:38 GMT+02:00 Jon Hunter <jonathanh@nvidia.com>:
>>>> The driver should have a remove function given that we can build as a
>>>> module.
>>>
>>> At the moment I do not know what we would do in a remove function and
>>> hence me not adding one.
>>
>> Should just be the inverse of the probe (although there is no inverse
>> for the parsing DT bit). If you don't wish to add a remove, that is
>> fine, but make the driver a 'bool' and not 'tristate' in the Kconfig so
>> it cannot be configured as a module.
> 
> I understand the concept of a remove function, but I use devm_ calls
> for all resources. These should be handled by the device core on a
> driver detach?

There is one clock that needs to be disabled in the remove.

Cheers
Jon

-- 
nvpublic
