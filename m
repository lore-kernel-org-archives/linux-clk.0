Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Akinobu Mita <akinobu.mita@gmail.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
Cc: "Akinobu Mita" <akinobu.mita@gmail.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>
References: <1455547251-4944-1-git-send-email-akinobu.mita@gmail.com>
Message-ID: <20160215230252.2278.43532@quark.deferred.io>
Subject: Re: [PATCH] clk: add userspace clock consumer
Date: Mon, 15 Feb 2016 15:02:52 -0800
List-ID: <linux-clk.vger.kernel.org>

Hello Akinobu Mita,

Quoting Akinobu Mita (2016-02-15 06:40:51)
> This adds userspace consumer for common clock.
> =

> This driver is inspired from Userspace regulator consumer
> (REGULATOR_USERSPACE_CONSUMER) and it is useful for test purposes and
> some classes of devices that are controlled entirely from user space.

Thanks for submitting the patch. Your implementation looks OK, but I
generally do not like to expose clock hardware controls to userspace
(and have a NAK'd a lot of patches trying to do this in the past). It
can be quite dangerous for the system to allow userspace to control
clocks.

Can you explain your use case more? If your main concern is testing,
should COMMON_CLK_USERSPACE_CONSUMER be hidden behind CONFIG_DEBUG_FS?

Have you looked at the per-provider DEBUGFS hooks? See commit
fb2b3c9f6857, "clk: define and export clk_debugs_add_file".

Regards,
Mike

> =

> Example binding and usages:
> =

> clksqw_userspace_consumer {
>         compatible =3D "linux,clk-userspace-consumer";
>         clocks =3D <&clksqw>;
> };
> =

>         # cd /sys/devices/platform/clksqw_userspace_consumer
>         # echo 8192 > rate
>         # echo enabled > state
> =

> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  .../bindings/clock/clk-userspace-consumer.txt      |  17 ++
>  drivers/clk/Kconfig                                |   9 ++
>  drivers/clk/Makefile                               |   1 +
>  drivers/clk/clk-userspace-consumer.c               | 180 +++++++++++++++=
++++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/clk-userspace=
-consumer.txt
>  create mode 100644 drivers/clk/clk-userspace-consumer.c
> =

> diff --git a/Documentation/devicetree/bindings/clock/clk-userspace-consum=
er.txt b/Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt
> new file mode 100644
> index 0000000..34b1bd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/clk-userspace-consumer.txt
> @@ -0,0 +1,17 @@
> +* Userspace consumer for common clock
> +
> +Required properties:
> +- compatible: Should be "linux,clk-userspace-consumer"
> +- clocks: clock phandle to control from userspace
> +
> +Examples:
> +
> +clk32k_userspace_consumer {
> +       compatible =3D "linux,clk-userspace-consumer";
> +       clocks =3D <&clk32k>;
> +};
> +
> +sqw_userspace_consumer {
> +       compatible =3D "linux,clk-userspace-consumer";
> +       clocks =3D <&sqw>;
> +};
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index eca8e01..c8dc228 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -200,6 +200,15 @@ config COMMON_CLK_CDCE706
>         ---help---
>           This driver supports TI CDCE706 programmable 3-PLL clock synthe=
sizer.
>  =

> +config COMMON_CLK_USERSPACE_CONSUMER
> +       tristate "Userspace clock consumer support"
> +       help
> +         There are some classes of devices that are controlled entirely
> +         from user space. Userspace consumer driver provides ability to
> +         control clock for such devices.
> +
> +         If unsure, say no.
> +
>  source "drivers/clk/bcm/Kconfig"
>  source "drivers/clk/hisilicon/Kconfig"
>  source "drivers/clk/qcom/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b038e36..f3b51f1 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_COMMON_CLK)      +=3D clk-gpio.o
>  ifeq ($(CONFIG_OF), y)
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-conf.o
>  endif
> +obj-$(CONFIG_COMMON_CLK_USERSPACE_CONSUMER)    +=3D clk-userspace-consum=
er.o
>  =

>  # hardware specific clock types
>  # please keep this section sorted lexicographically by file/directory pa=
th name
> diff --git a/drivers/clk/clk-userspace-consumer.c b/drivers/clk/clk-users=
pace-consumer.c
> new file mode 100644
> index 0000000..d7f36c1
> --- /dev/null
> +++ b/drivers/clk/clk-userspace-consumer.c
> @@ -0,0 +1,180 @@
> +/*
> + * Copyright (c) 2016 Akinobu Mita <akinobu.mita@gmail.com>
> + *
> + * This file is subject to the terms and conditions of version 2 of
> + * the GNU General Public License.  See the file COPYING in the main
> + * directory of this archive for more details.
> + *
> + * Inspired from reg-userspace-consumer
> + */
> +
> +#include <linux/err.h>
> +#include <linux/mutex.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +
> +struct clk_userspace_consumer {
> +       struct mutex lock;
> +       bool enabled;
> +       struct clk *clk;
> +};
> +
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
> +                       struct device_attribute *attr, const char *buf,
> +                       size_t count)
> +{
> +       struct clk_userspace_consumer *consumer =3D dev_get_drvdata(dev);
> +       bool enabled;
> +
> +       /*
> +        * sysfs_streq() doesn't need the \n's, but we add them so the st=
rings
> +        * will be shared with show_state(), above.
> +        */
> +       if (sysfs_streq(buf, "enabled\n") || sysfs_streq(buf, "1"))
> +               enabled =3D true;
> +       else if (sysfs_streq(buf, "disabled\n") || sysfs_streq(buf, "0"))
> +               enabled =3D false;
> +       else {
> +               dev_err(dev, "Configuring invalid mode\n");
> +               return count;
> +       }
> +
> +       mutex_lock(&consumer->lock);
> +
> +       if (enabled !=3D consumer->enabled) {
> +               int ret =3D 0;
> +
> +               if (enabled) {
> +                       ret =3D clk_prepare_enable(consumer->clk);
> +                       if (ret) {
> +                               dev_err(dev, "Failed to configure state: =
%d\n",
> +                                       ret);
> +                       }
> +               } else {
> +                       clk_disable_unprepare(consumer->clk);
> +               }
> +
> +               if (!ret)
> +                       consumer->enabled =3D enabled;
> +       }
> +
> +       mutex_unlock(&consumer->lock);
> +
> +       return count;
> +}
> +static DEVICE_ATTR(state, 0644, clk_show_state, clk_store_state);
> +
> +static ssize_t clk_show_rate(struct device *dev, struct device_attribute=
 *attr,
> +                       char *buf)
> +{
> +       struct clk_userspace_consumer *consumer =3D dev_get_drvdata(dev);
> +
> +       return sprintf(buf, "%ld\n", clk_get_rate(consumer->clk));
> +}
> +
> +static ssize_t clk_store_rate(struct device *dev, struct device_attribut=
e *attr,
> +                       const char *buf, size_t count)
> +{
> +       struct clk_userspace_consumer *consumer =3D dev_get_drvdata(dev);
> +       unsigned long rate;
> +       int err;
> +
> +       err =3D kstrtoul(buf, 0, &rate);
> +       if (err)
> +               return err;
> +
> +       err =3D clk_set_rate(consumer->clk, rate);
> +       if (err)
> +               return err;
> +
> +       return count;
> +}
> +static DEVICE_ATTR(rate, 0644, clk_show_rate, clk_store_rate);
> +
> +static struct attribute *attributes[] =3D {
> +       &dev_attr_state.attr,
> +       &dev_attr_rate.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group attr_group =3D {
> +       .attrs  =3D attributes,
> +};
> +
> +static int clk_userspace_consumer_probe(struct platform_device *pdev)
> +{
> +       struct clk_userspace_consumer *consumer;
> +       int ret;
> +
> +       consumer =3D devm_kzalloc(&pdev->dev, sizeof(*consumer), GFP_KERN=
EL);
> +       if (!consumer)
> +               return -ENOMEM;
> +
> +       mutex_init(&consumer->lock);
> +
> +       consumer->clk =3D devm_clk_get(&pdev->dev, NULL);
> +       if (IS_ERR(consumer->clk)) {
> +               ret =3D PTR_ERR(consumer->clk);
> +               dev_err(&pdev->dev, "Failed to get clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, consumer);
> +
> +       ret =3D sysfs_create_group(&pdev->dev.kobj, &attr_group);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int clk_userspace_consumer_remove(struct platform_device *pdev)
> +{
> +       struct clk_userspace_consumer *consumer =3D platform_get_drvdata(=
pdev);
> +
> +       sysfs_remove_group(&pdev->dev.kobj, &attr_group);
> +
> +       mutex_lock(&consumer->lock);
> +       if (consumer->enabled)
> +               clk_disable_unprepare(consumer->clk);
> +       mutex_unlock(&consumer->lock);
> +
> +       return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +
> +static const struct of_device_id userspace_consumer_id[] =3D {
> +       { .compatible =3D "linux,clk-userspace-consumer" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, userspace_consumer_id);
> +
> +#endif
> +
> +static struct platform_driver clk_userspace_consumer_driver =3D {
> +       .probe =3D clk_userspace_consumer_probe,
> +       .remove =3D clk_userspace_consumer_remove,
> +       .driver =3D {
> +               .name =3D "clk-userspace-consumer",
> +               .of_match_table =3D of_match_ptr(userspace_consumer_id),
> +       },
> +};
> +module_platform_driver(clk_userspace_consumer_driver);
> +
> +MODULE_AUTHOR("Akinobu Mita <akinobu.mita@gmail.com>");
> +MODULE_DESCRIPTION("Userspace consumer for common clock");
> +MODULE_LICENSE("GPL");
> -- =

> 2.5.0
>=20
