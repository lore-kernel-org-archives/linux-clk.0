Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2113EC61DD8
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 15:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D296B21D79
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 15:03:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p/mrip4i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgKMPDF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 10:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgKMPDF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2020 10:03:05 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C1CC0617A7
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2020 07:03:05 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id m13so10672460oih.8
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2020 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KQExIV5YAYDTSxerJzUPhtbOLLwZjkiABR6gSsrP1XM=;
        b=p/mrip4iyRVF3BmAMIWSqbg23nVq5/87XybbXgxcoxqX1yEOC579TQwl29KGOXt/rE
         wfqobhs5lso3Vb8hM0XVMWSxAROOLSkSfakzfOWP2/lLCJgVbwhCxuv4ommVj+cbWbfr
         7ttVYKUIbTac0e3lLeLAi+Ub/5j/G71KsJqZtADgkKVouLBruCWiJDjW0paQgjoQJe6E
         o9uyygS+5KfyT6HJViF2arhrDRUmUGC3PR+kOjDcNfBcKT0OoP1FDu8RgHj8GaCOtJtx
         cAsLh+pCF6D6fujBwWJS4KNA1yzZYqP68C90HlWyW2H7thRbKPA7C05THpVo+M7gppgI
         UaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KQExIV5YAYDTSxerJzUPhtbOLLwZjkiABR6gSsrP1XM=;
        b=j0mwOEXS6cJDN3sDe8TJxfV1rPc7TStSbzv63BbvPeA15gF/N+v/tNxibZSbSBjila
         2o9YxOg4RaNF2Dyu5zTjtuP8yIJU0b9IzqTnNIJqWCJ7vvO8pw2X5XXSKrLsh21mu/6v
         1v/C2iymO627YttLHngOCJPRie3WKyeZ+1AsxJZPOP/vfcsc7vfDdK6mebtzZzI/oVsb
         ENfqZrGsIHbrZtAhy+GVCNYzar01AZA95C/RMYlx2Dq6Wb2YwoOvAu+E0rf1yGsjn4mp
         j13R/6g2MjNTt6kjxNzOwb5cjpJZkoHqgru0SO/pmD5GOd+z1x3atdKd0lj7rsV99cEl
         iRUA==
X-Gm-Message-State: AOAM532l0f3cGfYsNNxrwKugW4mGNLf93BeYoJcDWq9hqwXb6anOPSgM
        QAT+vivvnF8Sfh/AbINAwpvB7kflhp4315t5GZ4=
X-Google-Smtp-Source: ABdhPJz+k79IBm/Ti0s/cgkIKJ4o8XRujvqsiuv35KTXyLQkS06HZuSdkRnyWTny4DHTf11c5H3xamO663NzynJ98ho=
X-Received: by 2002:aca:f407:: with SMTP id s7mr1723876oih.23.1605279782170;
 Fri, 13 Nov 2020 07:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20201113091046.30964-4-sergio.paracuellos@gmail.com> <202011132226.NzPxhl8c-lkp@intel.com>
In-Reply-To: <202011132226.NzPxhl8c-lkp@intel.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Fri, 13 Nov 2020 16:02:50 +0100
Message-ID: <CAMhs-H_GiRyoO1zBtPCyx2w=aXWwuSh6Ut5afcvqiECyfg1w7Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: ralink: add clock driver for mt7621 SoC
To:     kernel test robot <lkp@intel.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        kbuild-all@lists.01.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Chuanhong Guo <gch981213@gmail.com>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Nov 13, 2020 at 3:17 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Sergio,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on clk/clk-next]
> [also build test WARNING on staging/staging-testing robh/for-next linus/master v5.10-rc3 next-20201113]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Sergio-Paracuellos/MIPS-ralink-add-CPU-clock-detection-and-clock-gate-driver-for-MT7621/20201113-171221
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/e9751b3fda8fd54952502ec81fddc61c80347155
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Sergio-Paracuellos/MIPS-ralink-add-CPU-clock-detection-and-clock-gate-driver-for-MT7621/20201113-171221
>         git checkout e9751b3fda8fd54952502ec81fddc61c80347155
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/clk/ralink/clk-mt7621.c: In function 'mt7621_register_top_clocks':
> >> drivers/clk/ralink/clk-mt7621.c:299:3: warning: ignoring return value of 'of_clk_hw_register', declared with attribute warn_unused_result [-Wunused-result]
>      299 |   of_clk_hw_register(clk_prov->node, &sclk->hw);
>          |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/clk/ralink/clk-mt7621.c: In function 'mt7621_gate_ops_init':
>    drivers/clk/ralink/clk-mt7621.c:155:2: warning: ignoring return value of 'of_clk_hw_register', declared with attribute warn_unused_result [-Wunused-result]
>      155 |  of_clk_hw_register(np, &sclk->hw);
>          |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +/of_clk_hw_register +299 drivers/clk/ralink/clk-mt7621.c
>
>    288
>    289  static void mt7621_register_top_clocks(struct mt7621_clk_provider *clk_prov)
>    290  {
>    291          struct clk_hw_onecell_data **clk_data = &clk_prov->clk_data;
>    292          struct clk_hw **hws = (*clk_data)->hws;
>    293          int i;
>    294
>    295          for (i = 0; i < ARRAY_SIZE(mt7621_clks_base); i++) {
>    296                  struct mt7621_clk *sclk = &mt7621_clks_base[i];
>    297
>    298                  sclk->clk_prov = clk_prov;
>  > 299                  of_clk_hw_register(clk_prov->node, &sclk->hw);
>    300                  hws[i] = &sclk->hw;
>    301                  (*clk_data)->num++;
>    302          }
>    303  }
>    304
>

Ok, I'll properly add error handling for this when v3 is send. Thanks!

Best regards,
    Sergio Paracuellos
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
