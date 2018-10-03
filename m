Return-Path: <SRS0=W+YX=MP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D5FC00449
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 13:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 103B92089F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Oct 2018 13:13:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xBjFARUV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 103B92089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbeJCUB0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Oct 2018 16:01:26 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59924 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbeJCUB0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Oct 2018 16:01:26 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w93DCwhO118350;
        Wed, 3 Oct 2018 08:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1538572378;
        bh=Pum2VQ14Ktr01xpmiRfpcUjDn3C4ZqbUY3EnHhjZdAs=;
        h=To:CC:From:Subject:Date;
        b=xBjFARUVuxB96eoAyUF965ofuYBi/sikeCsPfy7MDvfdsk0gQVm1V/jC9bnnWLyJS
         ZWEUAb26YdezLebxrEYrlTFd19j/SxkNq+qQNdOvivqQGwUmmfp0hPyyGiAfqSWhkE
         L/MQ3RYmObxLiqBJpNwqxIHJ90tdEITKPAPOBGDw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93DCwkA005253;
        Wed, 3 Oct 2018 08:12:58 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 3 Oct
 2018 08:12:58 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 3 Oct 2018 08:12:57 -0500
Received: from [127.0.0.1] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w93DCrVa008002;
        Wed, 3 Oct 2018 08:12:55 -0500
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "J, Keerthy" <j-keerthy@ti.com>
From:   Tero Kristo <t-kristo@ti.com>
Subject: [GIT PULL] clk: ti: updates for v4.20
Message-ID: <ee107173-b39c-5dc0-4aef-9848639b1b38@ti.com>
Date:   Wed, 3 Oct 2018 16:12:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

Here are the late changes for TI clock driver for 4.20 merge window. 
Sorry about the late pull request, but this was waiting for resolution 
on one of the dependencies (patch "clk: ti: fix OF child-node 
lookup..."). Thanks for setting up the immutable branch for it.

Please especially note the core clock changes in this series for adding 
support of clk save/restore mechanism (two patches from Russ Dill.) I 
decided to go ahead by adding them to this pull as there has been no 
comments on the patches and they have been pending on the lists already 
for a while. They aren't touching anything existing either, so they 
should be safe to apply also.

Thanks, Tero.

----------------

The following changes since commit 00a461cc32ec27fa7bd9c874a7b36b0c6c542c12:

   clk: ti: fix OF child-node lookup (2018-08-30 14:44:01 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kristo/linux 
tags/clk-ti-for-4.20

for you to fetch changes up to d6e7bbc148f9fbec8a0117b0d0f420c9710e6d81:

   clk: ti: Add functions to save/restore clk context (2018-10-03 
15:29:19 +0300)

----------------------------------------------------------------
TI clock driver changes for v4.20 merge window.

This tag adds changes for the Texas Instruments clock driver. Included
changes are:
- clkctrl driver changes switching the layout from CM based to clockdomain
   based. Needed for ongoing hwmod transition towards sysc driver. Changed
   SoCs for this include am3,am4,am5,dra7.
- RTC+DDR sleep mode support code for clock save/restore. The deep sleep
   states will wipe the clock register space on the SoC, requiring save/
   restore support so that the state can be retained over the sleep state.

----------------------------------------------------------------
Keerthy (1):
       clk: clk: Add clk_gate_restore_context function

Russ Dill (2):
       clk: Add functions to save/restore clock context en-masse
       clk: ti: Add functions to save/restore clk context

Tero Kristo (11):
       dt-bindings: clock: am33xx: add clkctrl indices for new data layout
       dt-bindings: clock: am43xx: add clkctrl indices for new data layout
       dt-bindings: clock: dra7xx: add clkctrl indices for new data layout
       clk: ti: clkctrl: support multiple clkctrl nodes under a cm node
       clk: ti: clkctrl: replace dashes from clkdm name with underscore
       clk: ti: am33xx: rename existing clkctrl data as compat data
       clk: ti: am33xx: add new clkctrl data for am33xx
       clk: ti: am43xx: rename existing clkctrl data as compat data
       clk: ti: am43xx: add new clkctrl data for am43xx
       clk: ti: dra7xx: rename existing clkctrl data as compat data
       clk: ti: dra7: add new clkctrl data

  drivers/clk/clk.c                |  93 +++++
  drivers/clk/ti/Makefile          |   9 +-
  drivers/clk/ti/clk-33xx-compat.c | 218 +++++++++++
  drivers/clk/ti/clk-33xx.c        | 232 ++++++-----
  drivers/clk/ti/clk-43xx-compat.c | 225 +++++++++++
  drivers/clk/ti/clk-43xx.c        | 249 +++++++-----
  drivers/clk/ti/clk-7xx-compat.c  | 823 
+++++++++++++++++++++++++++++++++++++++
  drivers/clk/ti/clk-7xx.c         | 590 +++++++++++++++-------------
  drivers/clk/ti/clk.c             |   7 +-
  drivers/clk/ti/clkctrl.c         | 104 +++--
  drivers/clk/ti/clock.h           |  11 +
  drivers/clk/ti/divider.c         |  36 ++
  drivers/clk/ti/dpll.c            |   6 +
  drivers/clk/ti/dpll3xxx.c        | 124 ++++++
  drivers/clk/ti/gate.c            |   3 +
  drivers/clk/ti/mux.c             |  29 ++
  include/dt-bindings/clock/am3.h  | 119 ++++++
  include/dt-bindings/clock/am4.h  | 132 +++++++
  include/dt-bindings/clock/dra7.h | 326 ++++++++++++----
  include/linux/clk-provider.h     |   9 +
  include/linux/clk.h              |  25 ++
  include/linux/clk/ti.h           |   7 +
  22 files changed, 2827 insertions(+), 550 deletions(-)
  create mode 100644 drivers/clk/ti/clk-33xx-compat.c
  create mode 100644 drivers/clk/ti/clk-43xx-compat.c
  create mode 100644 drivers/clk/ti/clk-7xx-compat.c
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
