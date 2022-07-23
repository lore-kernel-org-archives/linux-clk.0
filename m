Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E91C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jul 2022 11:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235081AbiGWLoh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Jul 2022 07:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiGWLog (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Jul 2022 07:44:36 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529D41BE90
        for <linux-clk@vger.kernel.org>; Sat, 23 Jul 2022 04:44:35 -0700 (PDT)
Received: from [192.168.1.101] (abxj77.neoplus.adsl.tpnet.pl [83.9.3.77])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 8EE661FFC6;
        Sat, 23 Jul 2022 13:44:33 +0200 (CEST)
Message-ID: <833fa178-22fc-c47c-a7b8-2444de3bf9cc@somainline.org>
Date:   Sat, 23 Jul 2022 13:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Increasing the maximum message size
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

when sending new clock drivers for Qualcomm SoCs I've been repeatedly
getting a bounce with a reason of "too long (>100000 characters)". The
drivers are pretty big for one email, for example gcc-sc8280xp.c has
201071 chars, but it only makes sense to add them big-as-they-are,
because there are simply so many clocks, each of which needs to be
defined as a struct with its properties set correctly.

Would it be possible to increase the limit for linux-arm-msm and
linux-clk to something like 250000 so that they get to appear on
there?

Konrad
