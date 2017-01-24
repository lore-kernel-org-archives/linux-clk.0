Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35381 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdAXLVQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2017 06:21:16 -0500
Received: by mail-io0-f195.google.com with SMTP id m98so18117473iod.2
        for <linux-clk@vger.kernel.org>; Tue, 24 Jan 2017 03:21:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170124093133.GA28235@mwanda>
References: <20170124093133.GA28235@mwanda>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jan 2017 12:21:14 +0100
Message-ID: <CAMuHMdXYBN=6HZEgx2WVbg4iruG=_tE=erK54FHRbXbDxCkrDg@mail.gmail.com>
Subject: Re: [bug report] clk: vc5: Add support for IDT VersaClock 5P49V5923
 and 5P49V5933
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Dan,

On Tue, Jan 24, 2017 at 10:31 AM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> The patch 3e1aec4e2c41: "clk: vc5: Add support for IDT VersaClock
> 5P49V5923 and 5P49V5933" from Jan 12, 2017, leads to the following
> static checker warning:
>
>         drivers/clk/clk-versaclock5.c:235 vc5_mux_set_parent()
>         error: uninitialized symbol 'src'.
>
> drivers/clk/clk-versaclock5.c
>    210  static int vc5_mux_set_parent(struct clk_hw *hw, u8 index)
>    211  {
>    212          struct vc5_driver_data *vc5 =
>    213                  container_of(hw, struct vc5_driver_data, clk_mux);
>    214          const u8 mask = VC5_PRIM_SRC_SHDN_EN_XTAL | VC5_PRIM_SRC_SHDN_EN_CLKIN;
>    215          u8 src;
>                    ^^^
>    216
>    217          if ((index > 1) || !vc5->clk_mux_ins)
>    218                  return -EINVAL;
>    219
>    220          if (vc5->clk_mux_ins == (VC5_MUX_IN_CLKIN | VC5_MUX_IN_XIN)) {
>    221                  if (index == 0)
>    222                          src = VC5_PRIM_SRC_SHDN_EN_XTAL;
>    223                  if (index == 1)
>    224                          src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
>    225          } else {
>    226                  if (index != 0)
>    227                          return -EINVAL;
>    228
>    229                  if (vc5->clk_mux_ins == VC5_MUX_IN_XIN)
>    230                          src = VC5_PRIM_SRC_SHDN_EN_XTAL;
>    231                  if (vc5->clk_mux_ins == VC5_MUX_IN_CLKIN)
>    232                          src = VC5_PRIM_SRC_SHDN_EN_CLKIN;
>
> What about if both of these are false?

That cannot happen, cfr. the initialization of clk_mux_ins.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
