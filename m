Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.uni-paderborn.de ([131.234.142.9]:46729 "EHLO
	mail.uni-paderborn.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754045AbbHJOqc (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 10 Aug 2015 10:46:32 -0400
MIME-Version: 1.0
In-Reply-To: <CALcgO_6DQFaeHKyRPXzs2AB1L2z6v6M9nk2KnmE5RsjJvuXKFg@mail.gmail.com>
References: <CALcgO_6DQFaeHKyRPXzs2AB1L2z6v6M9nk2KnmE5RsjJvuXKFg@mail.gmail.com>
Date: Mon, 10 Aug 2015 16:46:28 +0200
Message-ID: <CALcgO_4RON7Jx+BvgREJKzenUQYhqiJxCz3YxsZXRewW-paZ=w@mail.gmail.com>
Subject: Re: clk-gpio-gate: using GPIO pin from expander chip on serial bus
From: Michael Allwright <michael.allwright@upb.de>
To: Jyri Sarha <jsarha@ti.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 8 August 2015 at 16:51, Michael Allwright <michael.allwright@upb.de> wrote:
> Hi everyone,
>
> I think I have found a small issue with the clk-gpio-gate driver. When
> using a GPIO expander connected to I2C bus to enable the clock, I
> think there is an issue regarding accessing the GPIO while holding
> a/the/one of the spinlocks that is associated with the clock framework
> [1, 2].
>
> [1] https://www.kernel.org/doc/Documentation/gpio/gpio.txt - 60
> [2] https://www.kernel.org/doc/Documentation/clk.txt - 246
>
> This is these are the two reports coming back while booting the
> kernel. They happen most of the time, occasionally I can get to the
> login prompt, but then the issue reappears when I try to use the
> driver that enables the clock.
>
> [  131.068176] ------------[ cut here ]------------
> [  131.071380] WARNING: CPU: 0 PID: 1447 at
> .../drivers/gpio/gpiolib.c:1398 gpiod_set_value+0x50/0x5c()
> [  131.081359] Modules linked in: nfc mwifiex_sdio btmrvl_sdio btmrvl
> mwifiex cfg80211 bluetooth rfkill ov5640(O)
> [  131.099365] CPU: 0 PID: 1447 Comm: yavta Tainted: G        W  O
> 4.1.4-custom #9
> [  131.101348] Hardware name: Generic OMAP4 (Flattened Device Tree)
> ...
> [  131.151336] [<c0305a44>] (gpiod_set_value) from [<c04f45b8>]
> (clk_gpio_gate_enable+0x10/0x18)
> [  131.164672] [<c04f45b8>] (clk_gpio_gate_enable) from [<c04efb28>]
> (clk_core_enable+0x78/0x138)
> [  131.164672] [<c04efb28>] (clk_core_enable) from [<c04effd0>]
> (clk_enable+0x20/0x34)
> [  131.181335] [<c04effd0>] (clk_enable) from [<bf00093c>]
> (ov5640_s_power+0x168/0x1f0 [ov5640])
> ...
>
> And a tenth of a second later:
>
> [  131.305084] BUG: spinlock cpu recursion on CPU#0, kworker/0:1/232
> [  131.311492]  lock: enable_lock+0x0/0x20, .magic: dead4ead, .owner:
> yavta/1447, .owner_cpu: 0
> [  131.311492] CPU: 0 PID: 232 Comm: kworker/0:1 Tainted: G        W
> O    4.1.4-custom #9
> [  131.321350] Hardware name: Generic OMAP4 (Flattened Device Tree)
> [  131.331329] Workqueue: pm pm_runtime_work
> [  131.339202] [<c0016a2c>] (unwind_backtrace) from [<c0012f9c>]
> (show_stack+0x10/0x14)
> [  131.341308] [<c0012f9c>] (show_stack) from [<c05d30b8>]
> (dump_stack+0x84/0x9c)
> [  131.351318] [<c05d30b8>] (dump_stack) from [<c008aed8>]
> (do_raw_spin_lock+0x190/0x1b0)
> [  131.363189] [<c008aed8>] (do_raw_spin_lock) from [<c05d9bf0>]
> (_raw_spin_lock_irqsave+0x48/0x54)
> [  131.372406] [<c05d9bf0>] (_raw_spin_lock_irqsave) from [<c04ef6f0>]
> (clk_enable_lock+0x9c/0x124)
> [  131.381317] [<c04ef6f0>] (clk_enable_lock) from [<c04f0dc8>]
> (clk_disable+0x1c/0x34)
> [  131.389709] [<c04f0dc8>] (clk_disable) from [<c002725c>]
> (_disable_clocks+0x18/0x68)
> [  131.391326] [<c002725c>] (_disable_clocks) from [<c0028600>]
> (_idle+0x10c/0x214)
>
> The first one, comes from the following lines of codes, there is also
> a relevant comment in the function docs:
>
> This function should be called from contexts where we cannot sleep,
> and will complain if the GPIO chip functions potentially sleep.
>
> /* Should be using gpio_set_value_cansleep() */
> WARN_ON(desc->chip->can_sleep);
>
> For what ever reason this isn't a problem in the regulator framework
> (I use the same GPIO expander to switch on/off fixed regulators) which
> I would have thought would have been just as system critical as the
> clock framework.
> Perhaps this can be solved by creating or allowing clocks that aren't
> so system critical that can be enabled via clk_enable_cansleep() so to
> speak? I'm sure there is cleaner solutions to this.
>
> Any thoughts?
>
>
> Michael Allwright
>
> PhD Student
> Paderborn Institute for Advanced Studies in Computer Science and Engineering
>
> University of Paderborn
> Office-number 02-10
> Zukunftsmeile 1
> 33102 Paderborn
> Germany

Issue resolved, proposed patch to follow.

Michael Allwright

PhD Student
Paderborn Institute for Advanced Studies in Computer Science and Engineering

University of Paderborn
Office-number 02-10
Zukunftsmeile 1
33102 Paderborn
Germany
