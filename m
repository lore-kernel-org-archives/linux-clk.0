Return-Path: <andy.shevchenko@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP8WD_ZUbO+aKUV1-tPS_5APkpSAwbi=K=koVEDWWUfzF0tW+A@mail.gmail.com>
References: <CAP8WD_ZUbO+aKUV1-tPS_5APkpSAwbi=K=koVEDWWUfzF0tW+A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Mar 2018 17:17:07 +0200
Message-ID: <CAHp75Vc46tzX89a1XLqhCe6G_0H46zXBYdtdVexi08nz3sK=nQ@mail.gmail.com>
Subject: Re: x86 : Kconfig : INTEL_PMC_CORE not specific enough
To: whiteheadm@acm.org
Cc: linux-clk@vger.kernel.org,
	Platform Driver <platform-driver-x86@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
	Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Irina Tirdea <irina.tirdea@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 13, 2018 at 1:20 PM, tedheadster <tedheadster@gmail.com> wrote:

> drivers/platform/x86/intel_pmc_core.c

Apparently you meant pmc_atom.c in the same folder.

>  config PMC_ATOM

-- 
With Best Regards,
Andy Shevchenko
