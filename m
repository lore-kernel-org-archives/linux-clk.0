Return-Path: <andriy.shevchenko@linux.intel.com>
Date: Mon, 24 Sep 2018 14:16:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Robin Murphy <robin.murphy@arm.com>, Joe Perches <joe@perches.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>,
	Michal Hocko <mhocko@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <guro@fb.com>,
	Huang Ying <ying.huang@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 0/4] devres: provide and use devm_kstrdup_const()
Message-ID: <20180924111601.GL15943@smile.fi.intel.com>
References: <20180924101150.23349-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180924101150.23349-1-brgl@bgdev.pl>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 24, 2018 at 12:11:46PM +0200, Bartosz Golaszewski wrote:
> This series implements devm_kstrdup_const() together with some
> prerequisite changes and uses it in pmc-atom driver.
> 

Through which tree you are assuming this would be directed?

> v1 -> v2:
> - fixed the changelog in the patch implementing devm_kstrdup_const()
> - fixed the kernel doc
> - moved is_kernel_rodata() to asm-generic/sections.h
> - fixed constness
> 
> v2 -> v3:
> - rebased on top of 4.19-rc5 as there were some conflicts in the
>   pmc-atom driver
> - collected Reviewed-by tags
> 
> Bartosz Golaszewski (4):
>   devres: constify p in devm_kfree()
>   mm: move is_kernel_rodata() to asm-generic/sections.h
>   devres: provide devm_kstrdup_const()
>   clk: pmc-atom: use devm_kstrdup_const()
> 
>  drivers/base/devres.c          | 43 ++++++++++++++++++++++++++++++++--
>  drivers/clk/x86/clk-pmc-atom.c | 19 ++++-----------
>  include/asm-generic/sections.h | 14 +++++++++++
>  include/linux/device.h         |  5 +++-
>  mm/util.c                      |  7 ------
>  5 files changed, 63 insertions(+), 25 deletions(-)
> 
> -- 
> 2.18.0
> 

-- 
With Best Regards,
Andy Shevchenko
