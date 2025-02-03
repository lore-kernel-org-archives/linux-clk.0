Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B92036EC
	for <linux-clk@vger.kernel.org>; Mon,  3 Feb 2025 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600240; cv=none; b=aWJmAgpBMP/ce9yK3vJX++V0/LOqftMJvm10I4wS3kg7yJQJ5TZ6ZmcbNZBAZugAGt1i5T8EwR4G5xOHAE4mDz/VKkR++Auayz1pyaN50Eci5KXsB3onWazaP6EKLgxsmFGyim93juEMXMP4DAU2R76TRJP244t8Nm9WKvEeYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600240; c=relaxed/simple;
	bh=n//MYP3HUKx2pg/IUyZ4yEkd7tkeIUN66Lf4iSZKjfo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U6bf53UzwjIsZMi7/1qOmKddnluVtP4xrWu5R5XMaj0voP8hvokMnpLRrLmFAGNufffO7Dut6MvLtcaZVkhPsqRcXf3P/PlXypKyKjDWiS1wx64hQugz/iDayDg6qEHaTOo8OfbuhET35+AbhfoBYKkVtWQBnCGheq+ADYpgVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=F+FoJmdX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="F+FoJmdX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so2778065f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 03 Feb 2025 08:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738600236; x=1739205036; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4w6UmI8zApfFjzpF1ITEcZX/xk8zGVgfYD57VZOtxmU=;
        b=F+FoJmdXpPk2vh2bMAJpjWb+H6tsWi66hiVYGwd29NHow6XaLFbwoyso0rgzUK9fQU
         2PPfo+vQtNJAsRb8T5fpu9Vr8UmRwmEa8ksRSKfdXlNNnBSxkMFuhdzVcmd/ms+yaF3/
         UPGmtoJoaTDxsCTt01hL1Mjcvy/8PNJNFi/M8TpgtmBSkq+IHpZOeb7P2EeTbarJIUwu
         bafAL9y1U2FBhPIXf9HBVrCrySSPzpBLc5kSoQJikDPQiIjTvmYP1keKHMu81Kdr+DX0
         VBiwBKKmBq8JfxwJwdyQoYBICNmTrvP0IpS1dtspclDiJquS/BbGZqW6mgztazQaWNc4
         VyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600236; x=1739205036;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4w6UmI8zApfFjzpF1ITEcZX/xk8zGVgfYD57VZOtxmU=;
        b=ZlUuJmCl4jqv0Z+9GHhwFjxWO7MywxgWPihEXlR9HL7aDB1ur7KkUco+SYBA0h+7tM
         t+VygPQY6WW31880GspdOKlnbkOf9Qf2IYtn6hCQ72IwBdliNsmdqjxPLwW2+1jTN4wj
         YqEP0o5B9xZ98fYp5qPBmEjeqB1UfPdHXOsTHXsjAZrSwY2ml9UqIJSchIyEDxv15KP9
         jrcn/2mzFneDvVbntX2gED0paUtLhqFQp7xa2Bl+B88rZCLVMdsLREcB/p+oOXMMqbb/
         2WQlqT6HrhPVZOt2O65sZX5wZrX0WajLgt2RUGbzzY5JtMSmjwsMpqwUFcoNTg+/zwYL
         pg7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+Rbm+Wgl5jHrgz0UJq+2D3c1xmX7/uAgWWgEDQvu5+df1oCnzlkgWYbwLUCSvfyvYcj8W7wt1qBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9zz8JTSxjtCdtFaI8prEgEmdskkFOt6UoPg5XUKCsUvXK3vy
	IQbG15SejDtdjn1ZIBdks5vBcvOIyGpAuZS7spIqmZbZ6vb4pKxjujLcFGA0y4w=
X-Gm-Gg: ASbGncuXk1Qp0utXpDu+nU9YKYR84ABm+W2MJ/I9gihJP3n3jkhbVKYULLlC+yJkhRx
	4Iw2sB/uJ/8mjSxW6D9FbehpMBhMakzGL0SQQ8QvjPlm2nVb1CzqnGeJ0B3bwKvyXNhmdlbckvO
	jrJSXrdQffEQbqHBBdhwgIaqM74Fsj20Ava2hzwOHJMHYpZNrQlMCz+nA5xqkhn6mJ1yz9PviEf
	OImEpC/6Fsf2C/OjyDNTer1H+GK3xxpEHXGZTzLa8e72eDodqt3w3YuFUYvDgUoB/pTAep3TUGW
	3uGx2Ils1djm4WaQt74ATpJL
X-Google-Smtp-Source: AGHT+IHDKGWZDdu9KvAZ5cKLRS+DMqDNkg23q/oCJosK4PIMEE8v9HnxxhxTqL283NqvyKO/CgE6nA==
X-Received: by 2002:a5d:6d86:0:b0:38a:518d:97b with SMTP id ffacd0b85a97d-38c519311d8mr17660310f8f.11.1738600233881;
        Mon, 03 Feb 2025 08:30:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b579dsm13247381f8f.78.2025.02.03.08.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 08:30:33 -0800 (PST)
Message-ID: <11da7631-8eae-4ffa-a131-2a8b33e0743d@tuxon.dev>
Date: Mon, 3 Feb 2025 18:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
 <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
 <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
 <7d1bf72b-183a-429d-9a0c-10e1936a9abe@linaro.org>
 <e7374f91-a65d-4882-8a9b-de478582e09e@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e7374f91-a65d-4882-8a9b-de478582e09e@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Daniel,

On 31.01.2025 01:16, Claudiu Beznea wrote:
> Hi, Daniel,
> 
> On 31.01.2025 00:33, Daniel Lezcano wrote:
>> On 30/01/2025 21:53, Claudiu Beznea wrote:
>>> Hi, Daniel,
>>>
>>> On 30.01.2025 19:24, Daniel Lezcano wrote:
>>>> On 30/01/2025 11:30, Claudiu Beznea wrote:
>>>>>
>>>>>
>>>>> On 30.01.2025 12:07, Daniel Lezcano wrote:
>>>>>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>>>>>> Hi, Daniel,
>>>>
>>>> [ ... ]
>>>>
>>>>>>>> Would the IP need some cycles to capture the temperature accurately
>>>>>>>> after the
>>>>>>>> clock is enabled ?
>>>>>>>
>>>>>>> There is nothing about this mentioned about this in the HW manual of the
>>>>>>> RZ/G3S SoC. The only points mentioned are as described in the driver
>>>>>>> code:
>>>>>>> - wait at least 3us after each IIO channel read
>>>>>>> - wait at least 30us after enabling the sensor
>>>>>>> - wait at least 50us after setting OE bit in TSU_SM
>>>>>>>
>>>>>>> For this I chose to have it implemented as proposed.
>>>>>>
>>>>>> IMO, disabling/enabling the clock between two reads through the pm
>>>>>> runtime may
>>>>>> not be a good thing, especially if the system enters a thermal situation
>>>>>> where
>>>>>> it has to mitigate.
>>>>>>
>>>>>> Without any testing capturing the temperatures and compare between the
>>>>>> always-on
>>>>>> and on/off, it is hard to say if it is true or not. Up to you to test
>>>>>> that or
>>>>>> not. If you think it is fine, then let's go with it.
>>>>>
>>>>> I tested it with and w/o the runtime PM and on/off support (so, everything
>>>>> ON from the probe) and the reported temperature values were similar.
>>>>
>>>>
>>>> Did you remove the roundup to 0.5°C ?
>>>
>>> I did the testing as suggested and, this time, collected results and
>>> compared side by side. I read the temperature for 10 minutes, 60 seconds
>>> after the Linux prompt showed up. There is, indeed, a slight difference b/w
>>> the 2 cases.
>>>
>>> When the runtime PM doesn't touch the clocks on read the reported
>>> temperature varies b/w 53-54 degrees while when the runtime PM
>>> enables/disables the clocks a single read reported 55 degrees, the rest
>>> reported 54 degrees.
>>>
>>> I plotted the results side by side here:
>>> https://i2.paste.pics/f07eaeddc2ccc3c6695fe5056b52f4a2.png?
>>> trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=vWXm2VTrbt
>>>
>>> Please let me know how do you consider it.
>>
> 
> After sending this to you I figured it out that precision is lost somewhere
> so I re-tested it with the following diff (multiplied parts of the equation
> with 1000):
> 
> diff --git a/drivers/thermal/renesas/rzg3s_thermal.c
> b/drivers/thermal/renesas/rzg3s_thermal.c
> index 6719f9ca05eb..84e18ff69d7c 100644
> --- a/drivers/thermal/renesas/rzg3s_thermal.c
> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
> @@ -83,7 +83,7 @@ static int rzg3s_thermal_get_temp(struct
> thermal_zone_device *tz, int *temp)
>         }
> 
>         ret = 0;
> -       ts_code_ave = DIV_ROUND_CLOSEST(ts_code_ave, TSU_READ_STEPS);
> +       ts_code_ave = DIV_ROUND_CLOSEST(MCELSIUS(ts_code_ave), TSU_READ_STEPS);
> 
>         /*
>          * According to the HW manual (section 40.4.4 Procedure for
> Measuring the Temperature)
> @@ -91,11 +91,8 @@ static int rzg3s_thermal_get_temp(struct
> thermal_zone_device *tz, int *temp)
>          *
>          * Tj = (ts_code_ave - priv->calib0) * 165 / (priv->calib0 -
> priv->calib1) - 40
>          */
> -       *temp = DIV_ROUND_CLOSEST((ts_code_ave - priv->calib1) * 165,
> -                                 (priv->calib0 - priv->calib1)) - 40;
> -
> -       /* Report it in mili degrees Celsius and round it up to 0.5 degrees
> Celsius. */
> -       *temp = roundup(MCELSIUS(*temp), 500);
> +       *temp = DIV_ROUND_CLOSEST((u64)(ts_code_ave -
> MCELSIUS(priv->calib1)) * MCELSIUS(165),
> +                                 MCELSIUS(priv->calib0 - priv->calib1)) -
> MCELSIUS(40);
> 
>  rpm_put:
>         pm_runtime_mark_last_busy(dev);
> 
> With this, the results seems similar b/w runtime PM and no runtime PM cases.
> 
> The tests were executed after the board was off for few hours. The
> first test was with runtime PM suspend/resume on each read. Then the board
> was rebooted and re-run the test w/o runtime PM suspend/resume on reads.
> 
> Figure with results is here:
> https://i2.paste.pics/5f353a4f04b07b4bead3086624aba23f.png?trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=5n34QNjWID
> 
> 
>> Thanks for taking the time to provide a figure
>>
>> Testing thermal can be painful because it should be done under certain
>> conditions.
>>
>> I guess there was no particular work load on the system when running the
>> tests.
> 
> No load, indeed.
> 
>>
>> At the first glance, it seems, without the pm runtime, the measurement is
>> more precise as it catches more thermal changes. But the test does not give
>> information about the thermal behavior under stress. And one second
>> sampling is too long to really figure it out.
>>
>> In the kernel source tree, there is a tool to read the temperature in an
>> optimized manner, you may want to use it to read the temperature at a
>> higher rate. It is located in tools/thermal/thermometer
>>
>> Compiling is a bit fuzzy ATM, so until it is fixed, here are the steps:
>>
>> (you should install libconfig-dev and libnl-3-dev packages).
>>
>> cd $LINUX_DIR/tools/thermal/lib
>> make
>> LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LINUX_DIR/tools/thermal/lib
>>
>> cd $LINUX_DIR/tools
>> make thermometer
>>
>>
>>
>> Then change directory:
>>
>> cd $LINUX_DIR/tools/thermal/thermometer
>>
>>
>> Run the tool:
>>
>> ./thermometer -o out -c t.conf -l DEBUG -- <my_command>
>>
>>
>> The content of the configuration file t.conf is:
>>
>> thermal-zones = (
>>           {    name = "cpu[0_9].*-thermal";
>>         polling = 100; }
>>       )
>>
>> All the captured data will be in the 'out' directory
>>
>> For 'my_command', I suggest to use a script containing:
>>
>> sleep 10; dhrystone -t 1 -r 120; sleep 10
>>
>> If you need the dhrystone binary, let me know.
>>
>> The thermal zone device tree configuration should be changed to use a 65°C
>> passive trip point instead of 100°C (and the kernel setup with the step
>> wise governor as default).
>>>> The resulting figure from the temperature should show a flat temperature
>> figure during 10 seconds, then the temperature increasing until reaching
>> the temperature threshold of 65°C, the temperature stabilizing around it,
>> then followed by a temperature decreasing when the test finishes.
>>
>> If the temperature does not reach the limit, decrease the trip point
>> temperature or increase the dhrystone duration (the -r 120 option)
>>
>> At this point, you should the test with and without pm runtime but in order
>> to have consistent results, you should wait ~20 minutes between two tests.
>>
>> The shape of the figures will give the immediate information about how the
>> mitigation vs thermal sensor vs cooling device behave.
>>
>> Additionally, you can enable the thermal DEBUGFS option and add the
>> collected information statistics from /sys/kernel/debug/thermal/*** in the
>> results.
>>
>>
>> Hope that helps
> 
> Thank you for all these details. I'll have a look on it but starting with
> Monday as I won't have access to setup in the following days.

I re-run the tests with the thermometer application that you indicated.

This is the conf I used:

thermal-zones = (
          {    name = "cpu-thermal";
        polling = 100; }
      )

The used device tree is as follows:

	thermal-zones {
		cpu_thermal: cpu-thermal {
			polling-delay-passive = <250>;
			polling-delay = <1000>;
			thermal-sensors = <&tsu>;
			sustainable-power = <423>;

			cooling-maps {
				map0 {
					trip = <&target>;
					cooling-device = <&cpu0 0 2>;
					contribution = <1024>;
				};
			};

			trips {
				sensor_crit: sensor-crit {
					temperature = <125000>;
					hysteresis = <1000>;
					type = "critical";
				};

				target: trip-point {
					temperature = <56000>;
					hysteresis = <1000>;
					type = "passive";
				};
			};
		};
	};

I executed with:

time ./thermometer -o out -l DEBUG -c t.conf -- ./test.sh

where test.sh is:

sleep 10; time echo 100000000 | dhry; sleep 10

My dhry has no -t or -r option so I passed the number of runs checking that
the test executes for 120 seconds.

I executed first the thermometer application with runtime PM suspend/resume
on temperature read, then wait for ~25 minutes then executed the tests w/o
runtime PM suspend/resume on temperature read.

The output of the thermometer application is as follows:

- runtime PM suspend/resume when reading: https://p.fr33tux.org/5bbb4d
- no runtime PM suspend/resumes when reading: https://p.fr33tux.org/c9a7cf
- full console log while testing: https://p.fr33tux.org/ace3a6

I also plotted the results for visual comparison as follows:

1/ RPM + no-RPM (continuous time base):
https://i2.paste.pics/c3956d15a7a889a9e1ee5b60529b42f6.png?rand=axUi4IsA1C

2/ RPM + no-RPM (first samples, for side by side comparison):
https://i2.paste.pics/e2a30af590e28a091415e3afb74eb0ac.png?rand=XQhoxUe1EM

3/ RPM only:
https://i2.paste.pics/977d4de070b8e2a19694ae2b4ba3c5fc.png?rand=IfZOkonRd9

4/ no-RPM only:
https://i2.paste.pics/5d6e3d0a124e5e4b3b8b397d7b5b057c.png?rand=UaigrMRNvy

Please let me know how your input.

Thank you,
Claudiu


> 
> Thank you,
> Claudiu
> 
>>
>>
>>
>>
>>
>>
> 

