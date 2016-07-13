Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
 <1468432181-9550-6-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468432181-9550-6-git-send-email-serveralex@gmail.com>
Message-ID: <146844599156.73491.8466487898310327170@resonance>
Subject: Re: [PATCH v2 5/7] meson: clk: Add CLKIDs for clock gates
Date: Wed, 13 Jul 2016 14:39:51 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Alexander M=C3=BCller (2016-07-13 10:49:39)
> Add clock ids for the clock gates to private meson8b header file.
> =

> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
> ---
>  drivers/clk/meson/meson8b.h | 79 +++++++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 78 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index f8c6942..4ba8be5 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -60,7 +60,84 @@
>  #define CLKID_ZERO             13
>  #define CLKID_MPEG_SEL         14
>  #define CLKID_MPEG_DIV         15
> +#define CLKID_DDR              16
> +#define CLKID_DOS              17
> +#define CLKID_ISA              18
> +#define CLKID_PL301            19
> +#define CLKID_PERIPHS          20
> +#define CLKID_SPICC            21
> +#define CLKID_I2C              22
> +#define CLKID_SAR_ADC          23
> +#define CLKID_SMART_CARD       24
> +#define CLKID_RNG0             25
> +#define CLKID_UART0            26
> +#define CLKID_SDHC             27
> +#define CLKID_STREAM           28
> +#define CLKID_ASYNC_FIFO       29
> +#define CLKID_SDIO             30
> +#define CLKID_ABUF             31
> +#define CLKID_HIU_IFACE                32
> +#define CLKID_ASSIST_MISC      33
> +#define CLKID_SPI              34
> +#define CLKID_I2S_SPDIF                35
> +#define CLKID_ETH              36
> +#define CLKID_DEMUX            37
> +#define CLKID_AIU_GLUE         38
> +#define CLKID_IEC958           39
> +#define CLKID_I2S_OUT          40
> +#define CLKID_AMCLK            41
> +#define CLKID_AIFIFO2          42
> +#define CLKID_MIXER            43
> +#define CLKID_MIXER_IFACE      44
> +#define CLKID_ADC              45
> +#define CLKID_BLKMV            46
> +#define CLKID_AIU              47
> +#define CLKID_UART1            48
> +#define CLKID_G2D              49
> +#define CLKID_USB0             50
> +#define CLKID_USB1             51
> +#define CLKID_RESET            52
> +#define CLKID_NAND             53
> +#define CLKID_DOS_PARSER       54
> +#define CLKID_USB              55
> +#define CLKID_VDIN1            56
> +#define CLKID_AHB_ARB0         57
> +#define CLKID_EFUSE            58
> +#define CLKID_BOOT_ROM         59
> +#define CLKID_AHB_DATA_BUS     60
> +#define CLKID_AHB_CTRL_BUS     61
> +#define CLKID_HDMI_INTR_SYNC   62
> +#define CLKID_HDMI_PCLK                63
> +#define CLKID_USB1_DDR_BRIDGE  64
> +#define CLKID_USB0_DDR_BRIDGE  65
> +#define CLKID_MMC_PCLK         66
> +#define CLKID_DVIN             67
> +#define CLKID_UART2            68
> +#define CLKID_SANA             69
> +#define CLKID_VPU_INTR         70
> +#define CLKID_SEC_AHB_AHB3_BRIDGE      71
> +#define CLKID_CLK81_A9         72
> +#define CLKID_VCLK2_VENCI0     73
> +#define CLKID_VCLK2_VENCI1     74
> +#define CLKID_VCLK2_VENCP0     75
> +#define CLKID_VCLK2_VENCP1     76
> +#define CLKID_GCLK_VENCI_INT   77
> +#define CLKID_GCLK_VENCP_INT   78
> +#define CLKID_DAC_CLK          79
> +#define CLKID_AOCLK_GATE       80
> +#define CLKID_IEC958_GATE      81
> +#define CLKID_ENC480P          82
> +#define CLKID_RNG1             83
> +#define CLKID_GCLK_VENCL_INT   84
> +#define CLKID_VCLK2_VENCLMCC   85
> +#define CLKID_VCLK2_VENCL      86
> +#define CLKID_VCLK2_OTHER      87
> +#define CLKID_EDP              88
> +#define CLKID_AO_MEDIA_CPU     89
> +#define CLKID_AO_AHB_SRAM      90
> +#define CLKID_AO_AHB_BUS       91
> +#define CLKID_AO_IFACE         92
>  =

> -#define CLK_NR_CLKS            (CLKID_MPEG_DIV + 1)
> +#define CLK_NR_CLKS            (CLKID_AO_IFACE + 1)

You can just make this:

	#define NR_CLKS		93

Regards,
Mike

>  =

>  #endif /* __MESON8B_H */
> -- =

> 2.5.0
>=20
