Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D18C4332F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 19:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbiJCTEX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 15:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJCTEW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 15:04:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5162CE2C;
        Mon,  3 Oct 2022 12:04:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A98396117D;
        Mon,  3 Oct 2022 19:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B708C433D6;
        Mon,  3 Oct 2022 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664823860;
        bh=WaSbrKMpKs2fhEPcourlLx+oyJLAxZeozdzpwXHYjUk=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=bCeqvOVQz9Kn3Cgq/lc+VUfQ6q9diNv+ZDLaRZgsPWBuMwgmSpRDTWveZZCq23KqQ
         WZFE3q+Ic1IPjOJQ3lkUXb71QL45BJcEcLBrHbFtqrGs1E5QL/IPC0MepM3V3tMj7M
         eZblrSbK1MSHaZ+rHgyygc8LmLn/FkH2s01P1wxqReBm97JkH0dUbNPrUIWf6fKp4l
         0JTSMMZk6dkZLdUld4iGe2SXNy8gEn+81keCPBly8OBckob1FYzx7IVVxkzsl3UEpV
         PzfZ+HCZReQcLkBdHP45QIEVTvhFKjSz7T3dvIZFR4+U4pAwG8hTbhMcmzgSsBgR9L
         EW1c76k/S6+4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220511053455.360335-2-matthias.fend@emfend.at>
References: <20220511053455.360335-1-matthias.fend@emfend.at> <20220511053455.360335-2-matthias.fend@emfend.at>
Subject: Re: [PATCH v2 2/2] clk: vc5: Add support for IDT/Renesas VersaClock 5P49V6975
From:   Stephen Boyd <sboyd@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, matthias.fend@emfend.at
Date:   Mon, 03 Oct 2022 12:04:18 -0700
User-Agent: alot/0.10
Message-Id: <20221003190420.0B708C433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Matthias Fend (2022-05-10 22:34:55)
> Update IDT VersaClock 5 driver to support 5P49V6975. The 5P49V6975 is a
> member of the VersaClock 6E family and supports four fractional dividers
> (FODs), five clock outputs and an internal oscillator.
>=20
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---

Applied to clk-next
