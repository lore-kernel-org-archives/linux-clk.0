Return-Path: <digetx@gmail.com>
Return-Path: <digetx@gmail.com>
Subject: Re: [PATCH v1 4/5] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
To: Vinod Koul <vinod.koul@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1506380746.git.digetx@gmail.com>
 <0a45e058baba72124b91c663ce1d908d275f4044.1506380746.git.digetx@gmail.com>
 <20170928092949.GB30097@localhost>
 <b601b829-d87f-99e0-dcf9-ad3f9a7195df@gmail.com>
 <260fa409-0d07-ec9e-9e3b-fb08255026d8@gmail.com>
 <20170928162238.GF30097@localhost>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3d7e0b5e-563a-5955-cb06-36ffa1b7e30f@gmail.com>
Date: Thu, 28 Sep 2017 19:37:45 +0300
MIME-Version: 1.0
In-Reply-To: <20170928162238.GF30097@localhost>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 28.09.2017 19:22, Vinod Koul wrote:
> On Thu, Sep 28, 2017 at 05:35:59PM +0300, Dmitry Osipenko wrote:
>> On 28.09.2017 17:06, Dmitry Osipenko wrote:
>>> On 28.09.2017 12:29, Vinod Koul wrote:
>>>>> +	default:
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	ahb_seq  = burst << TEGRA_AHBDMA_CHANNEL_AHB_BURST_SHIFT;
>>>>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_ADDR_WRAP;
>>>>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_INTR_ENB;
>>>>> +
>>>>> +	writel_relaxed(ahb_seq,
>>>>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_SEQ);
>>>>> +
>>>>> +	writel_relaxed(ahb_addr,
>>>>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_PTR);
>>>>
>>>> oh no, you don't write to HW here. This can be called anytime when you have
>>>> txn running! You should save these and use them in prep_ calls.
>>>>
>>>
>>> BTW, some of the DMA drivers have exactly the same problem. I now see that it is
>>> actually documented explicitly in provider.txt, but that's inconsistent across
>>> the actual drivers.
>>>
>>
>> Also, shouldn't prep_ and dma_slave_config be protected with locking? I don't
>> see DMA core doing any locking and seems none of the drivers too.
> 
> In prep when you modify the list yes (with vchan I suspect that maybe taken
> care), but in general yes driver needs to do that
> 

I meant that one CPU could modify channels config, while other CPU is preparing
the new TX using config that is in process of the modification. On the other
hand, this looks like something that DMA client should take care of.

-- 
Dmitry
