Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Date: Wed, 27 Sep 2017 19:51:30 +0800
From: icenowy@aosc.io
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
In-Reply-To: <20170925102744.qixfwlheeimemhcf@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io>
 <20170925101027.lghnnll4h6inreqm@flea.home>
 <27EF78BD-6285-4D8D-AA65-8294D797E2FB@aosc.io>
 <20170925102744.qixfwlheeimemhcf@flea.home>
Message-ID: <9b3aeb6cb155bb2f9a7cee438de82ccb@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2017-09-25 18:27，Maxime Ripard 写道：
> On Mon, Sep 25, 2017 at 10:12:09AM +0000, Icenowy Zheng wrote:
>> 于 2017年9月25日 GMT+08:00 下午6:10:27, Maxime Ripard 
>> <maxime.ripard@free-electrons.com> 写到:
>> >Hi,
>> >
>> >On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
>> >> This patchset imports simple DVFS support for Allwinner A64 SoC.
>> >>
>> >> As the thermal sensor driver is not yet implemented and some boards
>> >> have still no AXP PMIC support, now only two OPPs are present --
>> >> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
>> >>
>> >> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
>> >> set up the device tree bits of the DVFS on Pine64.
>> >
>> >How has this been tested?
>> >
>> >What tasks did you run, with what governor, etc...
>> 
>> I only tested manual frequency switching between 648MHz and
>> 816MHz, and tested the PLL stuck issue by change the OPPs to
>> some random value.
> 
> Ideally, we should test that it's actually reliable. Poorly chosen
> OPPs might lead to corrupt data that you might not get before a while.
> 
> Please test using:
> https://linux-sunxi.org/Hardware_Reliability_Tests#Reliability_of_cpufreq_voltage.2Ffrequency_settings
> 
> And post the report.

```
root@p64 [ cpuburn-arm@master ] # ./cpuburn-a53 &
[1] 2543
root@p64 [ cpuburn-arm@master ] # ./cpufreq-ljt-stress-test
Creating './whitenoise-1920x1080.jpg' ... done
CPU stress test, which is doing JPEG decoding by libjpeg-turbo
at different cpufreq operating points.

Testing CPU 0
   816 MHz ............................................................ 
OK
   648 MHz ............................................................ 
OK

Testing CPU 1
   816 MHz ............................................................ 
OK
   648 MHz ............................................................ 
OK

Testing CPU 2
   816 MHz ............................................................ 
OK
   648 MHz ............................................................ 
OK

Testing CPU 3
   816 MHz ............................................................ 
OK
   648 MHz ............................................................ 
OK

Overall result : PASSED
```

> 
> Maxime
