Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AKesNsu3Ub4CZNTQXA9_at3qG8CMnwqYqtcU=pBs_Ahg@mail.gmail.com>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
 <20180111211948.GL28313@codeaurora.org> <CAOMZO5AKesNsu3Ub4CZNTQXA9_at3qG8CMnwqYqtcU=pBs_Ahg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jan 2018 10:56:48 -0200
Message-ID: <CAOMZO5Bj47K6cB_QK8mcyki4iNnTb6suJ6yRA2ZRzV=PJXvcSg@mail.gmail.com>
Subject: Re: Warnings from drivers/clk/clk.c
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 15, 2018 at 10:14 AM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Stephen,
>
> On Thu, Jan 11, 2018 at 7:19 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>
>> We have two WARN_ON in this function. Do you know which one hit
>> (makes me think we should put a printk in here now and also
>> include the clk name).
>
> The two WARN_ON() places are hit.
>
> Please see the complete log at:
> https://storage.kernelci.org/next/master/next-20180115/arm/imx_v6_v7_defconfig/lab-pengutronix/boot-imx53-qsrb.txt

Ok, I managed to fix the issue. Will send a patch shortly.
