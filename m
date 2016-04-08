Return-Path: <richard@nod.at>
Subject: Re: [PATCH V2 4/7] mtd: nand: add Loongson1 NAND driver
To: Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@linux-mips.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <1460115779-13141-1-git-send-email-keguang.zhang@gmail.com>
 <1460115779-13141-4-git-send-email-keguang.zhang@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <57079B87.9030209@nod.at>
Date: Fri, 8 Apr 2016 13:52:39 +0200
MIME-Version: 1.0
In-Reply-To: <1460115779-13141-4-git-send-email-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
List-ID: <linux-clk.vger.kernel.org>

Am 08.04.2016 um 13:42 schrieb Keguang Zhang:
> +	chip->options		= NAND_NO_SUBPAGE_WRITE;
> +	chip->ecc.mode		= NAND_ECC_SOFT;

Is the lack of HW ECC and subpage write a hardware limitation?

Thanks,
//richard
