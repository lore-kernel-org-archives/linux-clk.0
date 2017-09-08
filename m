Return-Path: <carlo@endlessm.com>
MIME-Version: 1.0
In-Reply-To: <58ef7321-a16d-8974-6a37-db473b6bf48e@linux.intel.com>
References: <20170714082356.28117-1-carlo@caione.org> <CAOQ7t2beu8CyHM1qR+DDt-BQXmFHoyJe8q_56qhkkYLM_o1upQ@mail.gmail.com>
 <ac99f461-798b-e245-232e-5e76c2de93b0@linux.intel.com> <58ef7321-a16d-8974-6a37-db473b6bf48e@linux.intel.com>
From: Carlo Caione <carlo@endlessm.com>
Date: Fri, 8 Sep 2017 10:05:03 +0200
Message-ID: <CAL9uMOE+gehOJ+QpW0PZC8ZBSWMZsPw0UAZYn=7EhPmYUxAJRQ@mail.gmail.com>
Subject: Re: [PATCH v3] clk: x86: Do not gate clocks enabled by the firmware
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Carlo Caione <carlo@caione.org>, alan@linux.intel.com,
	Michael Turquette <mturquette@baylibre.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, Darren Hart <dvhart@infradead.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Linux Upstreaming Team <linux@endlessm.com>,
	Enric Balletbo Serra <eballetbo@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 7, 2017 at 11:51 PM, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> See attached an untested change to show the idea on moving to the clk API
> and get feedback (I am not a camera guy, just trying to help -
> compile-tested/checkpatch only).
> This code *should* enable the same functionality using existing hooks in the
> kernel (and handle the BYT/CHT clocking difference as a bonus).
> I am sure Andy will have plenty of comments :-)

FWIW tested-by: Carlo Caione <carlo@endlessm.com>

Thanks,

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
