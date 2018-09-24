Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:39494 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725982AbeIXQd2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 12:33:28 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8OATCIf009639
        for <linux-clk@vger.kernel.org>; Mon, 24 Sep 2018 06:32:03 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2mpwfrt2pg-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-clk@vger.kernel.org>; Mon, 24 Sep 2018 06:32:02 -0400
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-clk@vger.kernel.org> from <rppt@linux.vnet.ibm.com>;
        Mon, 24 Sep 2018 11:32:00 +0100
Date: Mon, 24 Sep 2018 13:31:45 +0300
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
        Robin Murphy <robin.murphy@arm.com>,
        Joe Perches <joe@perches.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>, Roman Gushchin <guro@fb.com>,
        Huang Ying <ying.huang@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v3 2/4] mm: move is_kernel_rodata() to
 asm-generic/sections.h
References: <20180924101150.23349-1-brgl@bgdev.pl>
 <20180924101150.23349-3-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180924101150.23349-3-brgl@bgdev.pl>
Message-Id: <20180924103144.GB6264@rapoport-lnx>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Sep 24, 2018 at 12:11:48PM +0200, Bartosz Golaszewski wrote:
> Export this routine so that we can use it later in devm_kstrdup_const()
> and devm_kfree_const().
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

> ---
>  include/asm-generic/sections.h | 14 ++++++++++++++
>  mm/util.c                      |  7 -------
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
> index 849cd8eb5ca0..d79abca81a52 100644
> --- a/include/asm-generic/sections.h
> +++ b/include/asm-generic/sections.h
> @@ -141,4 +141,18 @@ static inline bool init_section_intersects(void *virt, size_t size)
>  	return memory_intersects(__init_begin, __init_end, virt, size);
>  }
> 
> +/**
> + * is_kernel_rodata - checks if the pointer address is located in the
> + *                    .rodata section
> + *
> + * @addr: address to check
> + *
> + * Returns: true if the address is located in .rodata, false otherwise.
> + */
> +static inline bool is_kernel_rodata(unsigned long addr)
> +{
> +	return addr >= (unsigned long)__start_rodata &&
> +	       addr < (unsigned long)__end_rodata;
> +}
> +
>  #endif /* _ASM_GENERIC_SECTIONS_H_ */
> diff --git a/mm/util.c b/mm/util.c
> index 9e3ebd2ef65f..470f5cd80b64 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -15,17 +15,10 @@
>  #include <linux/vmalloc.h>
>  #include <linux/userfaultfd_k.h>
> 
> -#include <asm/sections.h>
>  #include <linux/uaccess.h>
> 
>  #include "internal.h"
> 
> -static inline int is_kernel_rodata(unsigned long addr)
> -{
> -	return addr >= (unsigned long)__start_rodata &&
> -		addr < (unsigned long)__end_rodata;
> -}
> -
>  /**
>   * kfree_const - conditionally free memory
>   * @x: pointer to the memory
> -- 
> 2.18.0
> 

-- 
Sincerely yours,
Mike.
