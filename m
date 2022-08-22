Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C38C28D13
	for <linux-clk@archiver.kernel.org>; Mon, 22 Aug 2022 23:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiHVX64 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Aug 2022 19:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237790AbiHVX6y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Aug 2022 19:58:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FF0192B1
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 16:58:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15FE7B80B90
        for <linux-clk@vger.kernel.org>; Mon, 22 Aug 2022 23:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F34C433C1;
        Mon, 22 Aug 2022 23:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661212729;
        bh=y48cf3xN/u/rr7SrWWNLbl7ECEgfS/53/YvBZnSsTSI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B6JMY0It5cScQpJ6RqijkTPtlY36LjH9N0ck7uDAl2OjMRmdbQ6g8kCXP4j+c/NlB
         lbPrBX3FMZXd9AoilNMpcggCXgOVCjvL7ywd1ld1MSKymaXullKLGLU7FSKu7ZSGCT
         bBJH6Vur6REgebMCZkC5KdPatRTmbuCxiafupjCb7urgp5vGHR9yoSNXNoZTj4I+8T
         7+yHRqQ4lNbeAVdyLwlxzKlw3upfL2Nk6fwgRh9g7kXBahLkLr6RP/U8yv4KCceUAY
         HVmOeO4YmYtt45rIBnHH7USoDLgA5gtReGH14Jnw9WoDgCthlnIzWkoNN26cLBrBm1
         U02tD2tbMSW7g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220510070154.29528-3-shubhrajyoti.datta@xilinx.com>
References: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com> <20220510070154.29528-3-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH 2/2] clk: zynqmp: Fix stack-out-of-bounds in strncpy`
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, git@xilinx.com,
        Ian Nam <young.kwan.nam@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org
Date:   Mon, 22 Aug 2022 16:58:47 -0700
User-Agent: alot/0.10
Message-Id: <20220822235849.C3F34C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shubhrajyoti Datta (2022-05-10 00:01:54)
> From: Ian Nam <young.kwan.nam@xilinx.com>
>=20
> "BUG: KASAN: stack-out-of-bounds in strncpy+0x30/0x68"
>=20
> Linux-ATF interface is using 16 bytes of SMC payload. In case clock name =
is
> longer than 15 bytes, string terminated NULL character will not be receiv=
ed
> by Linux. Add explicit NULL character at last byte to fix issues when clo=
ck
> name is longer.
>=20
> This fixes below bug reported by KASAN:
>=20
> [    7.522474] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    7.529795] BUG: KASAN: stack-out-of-bounds in strncpy+0x30/0x68
> [    7.535871] Read of size 1 at addr ffff0008c89a7410 by task swapper/0/1
> [    7.542557]
> [    7.544065] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.0-00396-g81e=
f9e7-dirty #3
> [    7.551809] Hardware name: Xilinx Versal vck190 Eval board revA (QSPI)=
 (DT)
> [    7.558847] Call trace:
> [    7.561321]  dump_backtrace+0x0/0x1e8
> [    7.565023]  show_stack+0x14/0x20
> [    7.568374]  dump_stack+0xd4/0x108
> [    7.571817]  print_address_description.isra.0+0xbc/0x37c
> [    7.577189]  __kasan_report+0x144/0x198
> [    7.581068]  kasan_report+0xc/0x18
> [    7.584507]  __asan_load1+0x5c/0x68
> [    7.588032]  strncpy+0x30/0x68
> [    7.591120]  zynqmp_clock_probe+0x238/0x7b8
> [    7.595350]  platform_drv_probe+0x6c/0xc8
> [    7.599405]  really_probe+0x14c/0x418
> [    7.603108]  driver_probe_device+0x74/0x130
> [    7.607339]  __device_attach_driver+0xc4/0xe8
> [    7.611744]  bus_for_each_drv+0xec/0x150
> [    7.615711]  __device_attach+0x160/0x1d8
> [    7.619678]  device_initial_probe+0x10/0x18
> [    7.623907]  bus_probe_device+0xe0/0xf0
> [    7.627785]  device_add+0x528/0x950
> [    7.631312]  of_device_add+0x5c/0x80
> [    7.634926]  of_platform_device_create_pdata+0x120/0x168
> [    7.640299]  of_platform_bus_create+0x244/0x4e0
> [    7.644880]  of_platform_populate+0x50/0xe8
> [    7.649110]  zynqmp_firmware_probe+0x370/0x3a8
> [    7.653602]  platform_drv_probe+0x6c/0xc8
> [    7.657656]  really_probe+0x14c/0x418
> [    7.661359]  driver_probe_device+0x74/0x130
> [    7.665589]  device_driver_attach+0x94/0xa0
> [    7.669820]  __driver_attach+0x70/0x108
> [    7.673698]  bus_for_each_dev+0xe4/0x158
> [    7.677664]  driver_attach+0x30/0x40
> [    7.681278]  bus_add_driver+0x21c/0x2b8
> [    7.685157]  driver_register+0xbc/0x1d0
> [    7.689035]  __platform_driver_register+0x7c/0x88
> [    7.693793]  zynqmp_firmware_driver_init+0x1c/0x24
> [    7.698637]  do_one_initcall+0xa4/0x234
> [    7.702518]  kernel_init_freeable+0x1b0/0x24c
> [    7.706924]  kernel_init+0x10/0x110
> [    7.710450]  ret_from_fork+0x10/0x18
> [    7.714058]
> [    7.715559] The buggy address belongs to the page:
> [    7.720405] page:ffff0008f9be1c88 refcount:0 mapcount:0 mapping:000000=
0000000000 index:0x0
> [    7.728772] raw: 0008d00000000000 ffff0008f9be1c90 ffff0008f9be1c90 00=
00000000000000
> [    7.736606] raw: 0000000000000000 0000000000000000 00000000ffffffff
> [    7.742942] page dumped because: kasan: bad access detected
> [    7.748572]
> [    7.750076] addr ffff0008c89a7410 is located in stack of task swapper/=
0/1 at offset 112 in frame:
> [    7.759052]  zynqmp_clock_probe+0x0/0x7b8
> [    7.763103]
> [    7.764604] this frame has 3 objects:
> [    7.768306]  [32, 44) 'response'
> [    7.768312]  [64, 80) 'ret_payload'
> [    7.771573]  [96, 112) 'name'
> [    7.775095]
> [    7.779585] Memory state around the buggy address:
> [    7.784430]  ffff0008c89a7300: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    7.791735]  ffff0008c89a7380: 00 00 00 00 f1 f1 f1 f1 00 04 f2 f2 00 =
00 f2 f2
> [    7.799040] >ffff0008c89a7400: 00 00 f3 f3 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    7.806342]                          ^
> [    7.810132]  ffff0008c89a7480: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    7.817437]  ffff0008c89a7500: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [    7.824738] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Signed-off-by: Ian Nam <young.kwan.nam@xilinx.com>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---

Applied to clk-next
