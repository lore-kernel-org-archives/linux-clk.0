Return-Path: <brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20180828093332.20674-1-brgl@bgdev.pl>
References: <20180828093332.20674-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Sep 2018 14:59:54 +0200
Message-ID: <CAMRc=McmvkWEKV71pX9_PbNaYYf2VpovO2JrUQckWJ_0taqCZw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] devres: provide and use devm_kstrdup_const()
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Arend van Spriel <aspriel@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vivek Gautam <vivek.gautam@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
	Joe Perches <joe@perches.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
	Michal Hocko <mhocko@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <guro@fb.com>, Huang Ying <ying.huang@intel.com>,
	Kees Cook <keescook@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

2018-08-28 11:33 GMT+02:00 Bartosz Golaszewski <brgl@bgdev.pl>:
> This series implements devm_kstrdup_const() together with some
> prerequisite changes and uses it in pmc-atom driver.
>
> v1 -> v2:
> - fixed the changelog in the patch implementing devm_kstrdup_const()
> - fixed the kernel doc
> - moved is_kernel_rodata() to asm-generic/sections.h
> - fixed constness
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

If there are no objections - can this be picked up for 4.20?

Thanks,
Bartosz
