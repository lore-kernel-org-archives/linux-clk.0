Return-Path: <akinobu.mita@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160217211435.2278.78093@quark.deferred.io>
References: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
	<20160217211435.2278.78093@quark.deferred.io>
Date: Thu, 18 Feb 2016 23:07:23 +0900
Message-ID: <CAC5umyjbyMb9bAcKBpk+EHMS=yySm6t3faeG=g_7-VKL2YWhHg@mail.gmail.com>
Subject: Re: [PATCH] clk: add userspace clock consumer
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-02-18 6:14 GMT+09:00 Michael Turquette <mturquette@baylibre.com>:
> Quoting Akinobu Mita (2016-02-15 06:40:51)
>> +static ssize_t clk_show_state(struct device *dev, struct device_attribute *attr,
>> +                       char *buf)
>> +{
>> +       struct clk_userspace_consumer *consumer = dev_get_drvdata(dev);
>> +
>> +       if (consumer->enabled)
>> +               return sprintf(buf, "enabled\n");
>> +
>> +       return sprintf(buf, "disabled\n");
>> +}
>> +
>> +static ssize_t clk_store_state(struct device *dev,
>
> s/state/enable/

OK.  I'll rename this sysfs file name from 'state' to 'enable' and it
prints '0' or '1' instead of 'disabled' or 'enabled'.

>> +static const struct of_device_id userspace_consumer_id[] = {
>> +       { .compatible = "linux,clk-userspace-consumer" },
>
> Let's use "clock" instead of "clk" for the compat string, this is how
> the other bindings do it. We tend to use "clk" when talking specifically
> about Linux.

OK.
