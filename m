Return-Path: <pebolle@tiscali.nl>
Message-ID: <1433231444.2361.75.camel@x220>
Subject: Re: [PATCH v3] Add TI CDCE925 I2C controlled clock synthesizer
 driver
From: Paul Bolle <pebolle@tiscali.nl>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@linaro.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Date: Tue, 02 Jun 2015 09:50:44 +0200
In-Reply-To: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl>
References: <1433153623-29205-1-git-send-email-mike.looijmans@topic.nl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2015-06-01 at 12:13 +0200, Mike Looijmans wrote:
> --- /dev/null
> +++ b/drivers/clk/clk-cdce925.c

> +static int cdce925_regmap_i2c_write(
> +	void *context, const void *data, size_t count)

> +	dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
> +			reg_data[0], reg_data[1]);

For some silly reason (ie, I mistakenly thought I spotted an issue) I
did a quick build of this file. That triggered some noise on x86_64.
Excerpt:

drivers/clk/clk-cdce925.c: In function ‘cdce925_regmap_i2c_write’:
include/linux/dynamic_debug.h:64:16: warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument 5 has type ‘size_t’ [-Wformat=]
  static struct _ddebug  __aligned(8)   \
                ^
[...]
drivers/clk/clk-cdce925.c:505:2: note: in expansion of macro ‘dev_dbg’
  dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
  ^

A quick look at Documentation/printk-formats.txt suggested this (very
lightly tested) fix:
@@ -502,7 +502,7 @@ static int cdce925_regmap_i2c_write(
        reg_data[0] = CDCE925_I2C_COMMAND_BYTE_TRANSFER | ((u8 *)data)[0];
        reg_data[1] = ((u8 *)data)[1];
 
-       dev_dbg(&i2c->dev, "%s(%u) %#x %#x\n", __func__, count,
+       dev_dbg(&i2c->dev, "%s(%zu) %#x %#x\n", __func__, count,
                        reg_data[0], reg_data[1]);
 
        ret = i2c_master_send(i2c, reg_data, count);

> +static int cdce925_regmap_i2c_read(void *context,
> +	   const void *reg, size_t reg_size, void *val, size_t val_size)

> +		dev_dbg(&i2c->dev, "%s(%u, %u) %#x %#x\n", __func__,
> +				reg_size, val_size, reg_data[0], *((u8 *)val));

Likewise:
@@ -547,7 +547,7 @@ static int cdce925_regmap_i2c_read(void *context,
 
        ret = i2c_transfer(i2c->adapter, xfer, 2);
        if (likely(ret == 2)) {
-               dev_dbg(&i2c->dev, "%s(%u, %u) %#x %#x\n", __func__,
+               dev_dbg(&i2c->dev, "%s(%zu, %zu) %#x %#x\n", __func__,
                                reg_size, val_size, reg_data[0], *((u8 *)val));
                return 0;
        } else if (ret < 0)

Thanks,


Paul Bolle
