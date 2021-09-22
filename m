Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B1FC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17E44610A0
	for <linux-clk@archiver.kernel.org>; Wed, 22 Sep 2021 12:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236050AbhIVM4A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Sep 2021 08:56:00 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:42697 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236001AbhIVMz4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Sep 2021 08:55:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 90A972B015E3;
        Wed, 22 Sep 2021 08:54:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 22 Sep 2021 08:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:content-type:mime-version
        :content-transfer-encoding; s=fm3; bh=Go/ab6NNxUHpJNd2Et/T8u6oyB
        eZr/MiliwDKQ9MUa0=; b=kNLrMtlHMcaidc7ReuMEuLJ/fW7mtC9SLXN65MatiM
        26mcZjEN6rz4tJxGpx8JwXrlxV/2xeVs8/XzI5oUQpmpCXt+5CMMr4g0b3jGj8zz
        Cy8WuGb9ArHB9kuzYir1+jf3Q96cGBY/7XXaYGfAXEkw6i8oy9xv0lzURKRZaZIm
        TSy+TsT8xEj96h1mk+tQnKM0zMaGCPyz+5R1lXQMkln61kyC5Gl5oAtRMtcSk89x
        xL8zTVrtJGH2fuoeNrdLsskQYmCKOPIl3gjqbrlsvtGCsG4rD21J65GxzlOcDxra
        +5FtkbpEddeCaYwGxx6O3YZ8HeFwyf249jeTwxsBmEpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Go/ab6
        NNxUHpJNd2Et/T8u6oyBeZr/MiliwDKQ9MUa0=; b=mShRxK6zxj/N3jttlhY/5M
        c9/KZLpibE+Oiahb5L3AW23XnYWindChrGlAvKtUmakN5peX77GUkz7+TIMr3JM1
        xjiKM28QPGgnTYt6/LrTRIpCJXs6kvEdI/HLVqfeVjN7O7A8ZDO0bwiJfY6LeuVB
        SZTayqoUMMzvrMA63F6mPICl3xrQl0As7ywYK9ZgAO8dNf3jSFAryyqTRvX89TFc
        tkIfnFGbpKi+98hTk1rM7yc9RzNmEgi1TEgE1JbY9Y+TFFIHEAZEcQLMhM0tKXJ8
        O37vrjBbQ+rItq8wXwikw5MH0dg/lFOxWUKx1m54uu2dMeQDlR5kBEyaJ4mshXLw
        ==
X-ME-Sender: <xms:fidLYd6htLXnlarerdgFWpYqRtFyBscYw7chfO6SNxKXFCJntOJPCQ>
    <xme:fidLYa579Kuiv_RqfMmdTAJ-CquFlHury4Ybjbxuyr_b485ydn7aus9WbbW0lwIv-
    Vp_btVX9F-DicnapN8>
X-ME-Received: <xmr:fidLYUdV_73e3IjG0P3IFLNcp8AAzBJ40M5aq9hMgefZsZT3_t_MOlXyq9cftC18pkGp6vdJfAyqIFLMTtW1FM_xKmUPOb_UZ2rE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fidLYWKFrMBZswMB-h8U1oRN2OrkF43KAb5rsZxbpZQa2SXRR16Sdw>
    <xmx:fidLYRKb5jcoQjZOGgSeKYNb44q_0bfV_JUYyEjEmlRauTO4JZ6FRQ>
    <xmx:fidLYfzOAA7shjIe9rcBOx6EbN7-CELvm8PivPgtXk7sleqswPxsiw>
    <xmx:gCdLYbBzTFAsPa-zebDAAwwFp2t9smN7o-vfM43zcODr0mbqAGFqTdxLSBo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Sep 2021 08:54:22 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Michael Stapelberg <michael@stapelberg.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 0/5] drm/vc4: hdmi: Remove CPU hangs, take 2
Date:   Wed, 22 Sep 2021 14:54:14 +0200
Message-Id: <20210922125419.4125779-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,=0D
=0D
Here's another attempt at fixing the complete CPU stall while retrieving th=
e=0D
HDMI connector status when the connector is disabled.=0D
=0D
This was fixed already, but eventually got reverted by Linus due to the sam=
e=0D
symptom happening in another situation. This was likely (but not confirmed =
by=0D
the reporter) due to the kernel being booted without an HDMI display connec=
ted,=0D
in which case the firmware won't initialise the HDMI State Machine clock.=0D
=0D
This is fixed by patch 3. However, further changes in the clock drivers wer=
e=0D
needed for clk_set_min_rate to be used, which are patches 1 and 2.=0D
=0D
Finally, patches 4 and 5 are the original patches that were reverted. Patch=
 4=0D
got a small modification to move the clk_set_min_rate() call before the HSM=
=0D
clock is enabled.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (5):=0D
  clk: bcm-2835: Pick the closest clock rate=0D
  clk: bcm-2835: Remove rounding up the dividers=0D
  drm/vc4: hdmi: Set a default HSM rate=0D
  drm/vc4: hdmi: Move the HSM clock enable to runtime_pm=0D
  drm/vc4: hdmi: Make sure the controller is powered in detect=0D
=0D
 drivers/clk/bcm/clk-bcm2835.c  | 13 ++---=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c | 90 ++++++++++++++++++++++++----------=0D
 2 files changed, 68 insertions(+), 35 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
