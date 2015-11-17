Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from fw-tnat.cambridge.arm.com ([217.140.96.140]:59919 "EHLO
	cam-smtp0.cambridge.arm.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751616AbbKQRaw (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2015 12:30:52 -0500
From: Punit Agrawal <punit.agrawal@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Jon Medhurst <tixy@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Liviu Dudau <Liviu.Dudau@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] scpi: hide get_scpi_ops in module from built-in code
References: <4740279.aWlP1tqJLa@wuerfel>
Date: Tue, 17 Nov 2015 17:30:14 +0000
In-Reply-To: <4740279.aWlP1tqJLa@wuerfel> (Arnd Bergmann's message of "Mon, 16
	Nov 2015 22:34:58 +0100")
Message-ID: <9hhoaespm8p.fsf@e105922-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Arnd Bergmann <arnd@arndb.de> writes:

> The scpi_clock driver can be built-in when CONFIG_COMPILE_TEST
> is set even when ARM_SCPI_PROTOCOL is a loadable module, and
> that results in a link error:
>
> drivers/built-in.o: In function `scpi_clocks_probe':
> (.text+0x14453c): undefined reference to `get_scpi_ops'
>
> Using #if IS_REACHABLE() around the get_scpi_ops() declaration
> makes it build successfully in this case for compile-testing,
> but the effect is the same as when ARM_SCPI_PROTOCOL is
> disabled, as the code will not be used.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Makes sense. Thanks, Arnd!

       Acked-by: Punit Agrawal <punit.agrawal@arm.com>

>
> diff --git a/include/linux/scpi_protocol.h b/include/linux/scpi_protocol.h
> index 80af3cd35ae4..72ce932c69b2 100644
> --- a/include/linux/scpi_protocol.h
> +++ b/include/linux/scpi_protocol.h
> @@ -71,7 +71,7 @@ struct scpi_ops {
>  	int (*sensor_get_value)(u16, u32 *);
>  };
>  
> -#if IS_ENABLED(CONFIG_ARM_SCPI_PROTOCOL)
> +#if IS_REACHABLE(CONFIG_ARM_SCPI_PROTOCOL)
>  struct scpi_ops *get_scpi_ops(void);
>  #else
>  static inline struct scpi_ops *get_scpi_ops(void) { return NULL; }
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
