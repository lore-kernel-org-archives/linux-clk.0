Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] soc: Add SoC specific driver support for nuc900
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-7-git-send-email-vw@iommu.org> <4765191.NGpMC1JR46@wuerfel>
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net,
	Wan Zongshun <mcuos.com@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org
From: Wan Zongshun <vw@iommu.org>
Message-ID: <5784B302.80307@iommu.org>
Date: Tue, 12 Jul 2016 17:06:10 +0800
MIME-Version: 1.0
In-Reply-To: <4765191.NGpMC1JR46@wuerfel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2016年07月11日 16:03, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:27:26 PM CEST Wan Zongshun wrote:
>> +       ret = of_property_read_string(np, "compatible", &soc_dev_attr->soc_id);
>> +       if (ret)
>>                return -EINVAL;
>> +
>> +       soc_dev_attr->machine = "NUC900EVB";
>> +       soc_dev_attr->family = "NUC900";
>> +       soc_dev = soc_device_register(soc_dev_attr);
>> +       if (IS_ERR(soc_dev)) {
>> +               kfree(soc_dev_attr);
>> +               return -ENODEV;
>> +       }
>> +
>> +       ret = regmap_read(syscon_regmap, GCR_CHIPID, &nuc900_chipid);
>> +       if (ret)
>> +               return -ENODEV;
>> +
>> +       device_create_file(soc_device_to_device(soc_dev), &nuc900_chipid_attr);
>> +       device_create_file(soc_device_to_device(soc_dev), &nuc900_version_attr);
>> +
>> +       dev_info(&pdev->dev, "Nuvoton Chip ID: 0x%x, Version ID:0x%x\n",
>> +                nuc900_chipid & GCR_CHIPID_MASK,
>> +                (nuc900_chipid >> 24) & 0xff);
>
> I'm still a bit unsure about the set of attributes here.
>
> - The "soc_id" is read from the device tree from the field that contains
>    the board name, I think for consistency you should try to map the
>    GCR_CHIPID to the name of the SoC and assign that here
>
> - The "machine" is hardcoded to "NUC900EVB", which in turn looks like
>    a particular board but not the one you are running on. Maybe read
>    that from the DT instead?
>
> - The "revision" is not filled at all, I would suggest using something
>    derived from the GCR_CHIPID register here
>
> - you have two nonstandard attributes "chipid" and "version", which
>    I'd hope to avoid -- the set of standard attributes is supposed to
>    give enough information about the machine, and platform independent
>    user space will never read those.

So, Maybe I can remove those two codes, no need push those information 
to user space?

device_create_file(soc_device_to_device(soc_dev), &nuc900_chipid_attr);
device_create_file(soc_device_to_device(soc_dev), &nuc900_version_attr);

>
> 	Arnd
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>
