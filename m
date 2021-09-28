Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B814AC433F5
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 16:27:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 987C4611CE
	for <linux-clk@archiver.kernel.org>; Tue, 28 Sep 2021 16:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241758AbhI1Q2l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Sep 2021 12:28:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241702AbhI1Q2j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Sep 2021 12:28:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41F496128A;
        Tue, 28 Sep 2021 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632846420;
        bh=RIHQE4aWfBPKHQOvToBrdjP5ETITfcqpfhUZw9uKGXE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=RiuunJAHbRyP+p8E2K8/OQa92Ep5G9dbIz4CLljlIES1IUUU4wGruLbYZGsr6Qetk
         4rDYPwNQYzZ4D5Y1StkJnfxrfMEi+8rQI/QSvKtuBDfEinE7+ojY4AzDV6X+5bxq5e
         7iMGyZLMll830V6bjTZ8OndhzZRQWplbrmAkgGtJO34VBL51BKdGZlRPbBy380Nxq3
         ErVlQGGTPp+g/K+q9A4TmNg/gsVdHvneYuhE6uDZFNhg0uHxoPy5UdTcnFFITDxtcq
         5GWd8HAHvpHh5800z961Ps5at+obTEh/IsvcjBA2hnkklv6qDpS22BNoRSzAnCfDCd
         dEtG/jGpSIIcA==
Message-ID: <1d94747e74061f05395c34a4c441f96823dbf53a.camel@kernel.org>
Subject: Re: [PATCH 2/5] clk: bcm-2835: Remove rounding up the dividers
From:   nicolas saenz julienne <nsaenz@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 28 Sep 2021 18:26:55 +0200
In-Reply-To: <20210922125419.4125779-3-maxime@cerno.tech>
References: <20210922125419.4125779-1-maxime@cerno.tech>
         <20210922125419.4125779-3-maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2021-09-22 at 14:54 +0200, Maxime Ripard wrote:
> The driver, once it found a divider, tries to round it up by increasing
> the least significant bit of the fractional part by one when the
> round_up argument is set and there's a remainder.
> 
> However, since it increases the divider it will actually reduce the
> clock rate below what we were asking for, leading to issues with
> clk_set_min_rate() that will complain that our rounded clock rate is
> below the minimum of the rate.
> 
> Since the dividers are fairly precise already, let's remove that part so
> that we can have clk_set_min_rate() working.
> 
> This is effectively a revert of 9c95b32ca093 ("clk: bcm2835: add a round
> up ability to the clock divisor").
> 
> Fixes: 9c95b32ca093 ("clk: bcm2835: add a round up ability to the clock divisor")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>
Tested-by: Nicolas Saenz Julienne <nsaenz@kernel.org> # boot and basic functionality

Regards,
Nicolas

