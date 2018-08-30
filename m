Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 Arend van Spriel <aspriel@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Huang Ying <ying.huang@intel.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Roman Gushchin <guro@fb.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180828093332.20674-5-brgl@bgdev.pl>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20180828093332.20674-1-brgl@bgdev.pl> <20180828093332.20674-5-brgl@bgdev.pl>
Message-ID: <153566598892.129321.11102576282589539273@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 4/4] clk: pmc-atom: use devm_kstrdup_const()
Date: Thu, 30 Aug 2018 14:53:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Bartosz Golaszewski (2018-08-28 02:33:32)
> Use devm_kstrdup_const() in the pmc-atom driver. This mostly serves as
> an example of how to use this new routine to shrink driver code.
> =

> While we're at it: replace a call to kcalloc() with devm_kcalloc().
> =

> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

If you want this example to be merged through the clk tree please resend
after the other patches merge.
