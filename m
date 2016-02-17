Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Akinobu Mita <akinobu.mita@gmail.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
Cc: "Akinobu Mita" <akinobu.mita@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
References: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
Message-ID: <20160217211435.2278.78093@quark.deferred.io>
Subject: Re: [PATCH] clk: add userspace clock consumer
Date: Wed, 17 Feb 2016 13:14:35 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Akinobu Mita (2016-02-15 06:40:51)
> +static ssize_t clk_show_state(struct device *dev, struct device_attribut=
e *attr,
> +                       char *buf)
> +{
> +       struct clk_userspace_consumer *consumer =3D dev_get_drvdata(dev);
> +
> +       if (consumer->enabled)
> +               return sprintf(buf, "enabled\n");
> +
> +       return sprintf(buf, "disabled\n");
> +}
> +
> +static ssize_t clk_store_state(struct device *dev,

s/state/enable/

...
> +static const struct of_device_id userspace_consumer_id[] =3D {
> +       { .compatible =3D "linux,clk-userspace-consumer" },

Let's use "clock" instead of "clk" for the compat string, this is how
the other bindings do it. We tend to use "clk" when talking specifically
about Linux.

Regards,
Mike
