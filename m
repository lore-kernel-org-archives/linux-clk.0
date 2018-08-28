Return-Path: <rppt@linux.vnet.ibm.com>
Date: Tue, 28 Aug 2018 09:32:50 +0300
From: Mike Rapoport <rppt@linux.vnet.ibm.com>
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
        Michal Hocko <mhocko@suse.com>, Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <guro@fb.com>,
        Huang Ying <ying.huang@intel.com>, Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm@kvack.org
Subject: Re: [PATCH 1/2] devres: provide devm_kstrdup_const()
References: <20180827082101.5036-1-brgl@bgdev.pl>
 <20180827103353.GB13848@rapoport-lnx>
 <CAMRc=MdZ_1Vk2c19L-spzOm=7UaDpaACriq4gzMxAvQz=noNgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMRc=MdZ_1Vk2c19L-spzOm=7UaDpaACriq4gzMxAvQz=noNgQ@mail.gmail.com>
Message-Id: <20180828063250.GB25317@rapoport-lnx>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 27, 2018 at 04:28:55PM +0200, Bartosz Golaszewski wrote:
> 2018-08-27 12:33 GMT+02:00 Mike Rapoport <rppt@linux.vnet.ibm.com>:
> > On Mon, Aug 27, 2018 at 10:21:00AM +0200, Bartosz Golaszewski wrote:
> >> Provide a resource managed version of kstrdup_const(). This variant
> >> internally calls devm_kstrdup() on pointers that are outside of
> >> .rodata section. Also provide a corresponding version of devm_kfree().
> >>
> >> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >> ---
> >>  include/linux/device.h |  2 ++
> >>  mm/util.c              | 35 +++++++++++++++++++++++++++++++++++
> >>  2 files changed, 37 insertions(+)
> >>
> >> diff --git a/include/linux/device.h b/include/linux/device.h
> >> index 8f882549edee..f8f5982d26b2 100644
> >> --- a/include/linux/device.h
> >> +++ b/include/linux/device.h
> >> @@ -693,7 +693,9 @@ static inline void *devm_kcalloc(struct device *dev,
> >>       return devm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
> >>  }
> >>  extern void devm_kfree(struct device *dev, void *p);
> >> +extern void devm_kfree_const(struct device *dev, void *p);
> >>  extern char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp) __malloc;
> >> +extern char *devm_kstrdup_const(struct device *dev, const char *s, gfp_t gfp);
> >>  extern void *devm_kmemdup(struct device *dev, const void *src, size_t len,
> >>                         gfp_t gfp);
> >>
> >> diff --git a/mm/util.c b/mm/util.c
> >> index d2890a407332..6d1f41b5775e 100644
> >> --- a/mm/util.c
> >> +++ b/mm/util.c

[ ... ]

> >> + * Strings allocated by devm_kstrdup_const will be automatically freed when
> >> + * the associated device is detached.
> >> + */
> >> +char *devm_kstrdup_const(struct device *dev, const char *s, gfp_t gfp)
> >> +{
> >> +     if (is_kernel_rodata((unsigned long)s))
> >> +             return s;
> >> +
> >> +     return devm_kstrdup(dev, s, gfp);
> >> +}
> >> +EXPORT_SYMBOL(devm_kstrdup_const);
> >> +
> >
> > The devm_ variants seem to belong to drivers/base/devres.c rather than
> > mm/util.c
> >
> 
> Not all devm_ variants live in drivers/base/devres.c, many subsystems
> implement them locally. In this case we need to choose between
> exporting is_kernel_rodata() and putting devm_kstrdup_const() in
> mm/util.c. I chose the latter, since it's cleaner.

I rather think that moving is_kernel_rodata() to
include/asm-generic/sections.h and having devm_kstrdup_const() next to
devm_kstrdup() would be cleaner.
 
> Bart
> 

-- 
Sincerely yours,
Mike.
