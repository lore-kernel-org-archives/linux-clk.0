Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF4BC636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 09:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjBMJCf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 04:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBMJCb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 04:02:31 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9D630C8;
        Mon, 13 Feb 2023 01:02:30 -0800 (PST)
Received: from [172.16.71.140] (unknown [49.255.141.98])
        by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9AD4720034;
        Mon, 13 Feb 2023 17:02:28 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codeconstruct.com.au; s=2022a; t=1676278948;
        bh=MRZUwSFMI2QcJCDR1qI3+EewYtKghEAcl8omlYVCeSc=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References;
        b=d7gAv7cQg+Y77IUqlVU/KxyPOtpOa8z0rkZ/1fwDUcFVUrHOLArXwOPgtdvl7vNd0
         iSdBGO7hmpGchESmxSqCMRgBC3Mir42hluKa7fxEwLCq48Q9GOVm+TVYt3rWi2qrw3
         OltCUqN+9JFV63ZRm7FFqyLkyiqAkS79Op0jDk1ZfzGAAfjZF7r+ZO+RFe1qwShTBl
         BPRsCu/1x/rqcmOAy/jQS7Z7Kj3QHGZh1gu3L8FnEljGjfFdITM2JYkk9X09YEhRKs
         OAjTiKy3t9LPetttVW+qw3gnfaoYloRFPT4s6hKelb1jxPu9TyS5xooS7Tov+Izaa4
         bBmUoIs08moAA==
Message-ID: <40269fdbc75a149a37e8a44f62cb3a6102f61d8a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] dts: ast2600: Add reset config for I3C
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date:   Mon, 13 Feb 2023 17:02:28 +0800
In-Reply-To: <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
References: <cover.1676267865.git.jk@codeconstruct.com.au>
         <f426c3a22d64d076b007a0fc75dc95a389a9387f.1676267865.git.jk@codeconstruct.com.au>
         <4eed8885-a149-43b1-f6f6-f9b7fbb2f3b4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

> 2. This is not DTS. There is nothing from DTS here.

[and from, your reply on patch 2/3:]

> Why do you use subject prefix in patch 1 different than in patch 2?

Ack, will change to "clk:"; there is quite a mix of "dt-bindings:" and
"clk:" on the changes within this dir. I'll unify across the series.

Cheers,


Jeremy
