Return-Path: <brgl@bgdev.pl>
Return-Path: <brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joe Perches <joe@perches.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@linux.vnet.ibm.com>,
	Michal Hocko <mhocko@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Roman Gushchin <guro@fb.com>,
	Huang Ying <ying.huang@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/4] devres: provide and use devm_kstrdup_const()
Date: Tue, 28 Aug 2018 11:33:28 +0200
Message-Id: <20180828093332.20674-1-brgl@bgdev.pl>
List-ID: <linux-clk.vger.kernel.org>

This series implements devm_kstrdup_const() together with some
prerequisite changes and uses it in pmc-atom driver.

v1 -> v2:
- fixed the changelog in the patch implementing devm_kstrdup_const()
- fixed the kernel doc
- moved is_kernel_rodata() to asm-generic/sections.h
- fixed constness

Bartosz Golaszewski (4):
  devres: constify p in devm_kfree()
  mm: move is_kernel_rodata() to asm-generic/sections.h
  devres: provide devm_kstrdup_const()
  clk: pmc-atom: use devm_kstrdup_const()

 drivers/base/devres.c          | 43 ++++++++++++++++++++++++++++++++--
 drivers/clk/x86/clk-pmc-atom.c | 19 ++++-----------
 include/asm-generic/sections.h | 14 +++++++++++
 include/linux/device.h         |  5 +++-
 mm/util.c                      |  7 ------
 5 files changed, 63 insertions(+), 25 deletions(-)

-- 
2.18.0
