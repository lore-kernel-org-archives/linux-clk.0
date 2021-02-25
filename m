Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE51C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E23664E7A
	for <linux-clk@archiver.kernel.org>; Thu, 25 Feb 2021 16:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbhBYQAJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Feb 2021 11:00:09 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:50027 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232250AbhBYQAE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Feb 2021 11:00:04 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id B085AB3C;
        Thu, 25 Feb 2021 10:59:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 25 Feb 2021 10:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:content-type:mime-version
        :content-transfer-encoding; s=fm2; bh=+SMPealCjSq/PwFRY80381eUIB
        TCEdDPlWwxCC9pVsc=; b=nNtxGAkzeCB1X6yZKvkfF4Blbsu9aKS3pVRn//mq22
        U/115xG+7ABqKcnJO+olHyMpdyvFG62yVAdVgtmPthpGDn7tiIU35QQKbY5ylqUI
        GdKVQXN1bKWcrPpJx+N9ER57NjaiODJEQtpugNt5PgEHVPZ4bZmsfPb7oJt12ZsE
        Z510oTRVDzKp/t6dKAdwnGLsa3+Yc9XIixekEnhQfr9CUEkrc4+VRmrQWkTEfeEQ
        zH4RVf4Rf5iC5aDKmW0fJhO7b/ZWryKqGoHwi4O+5GoISxe9fFMIrndCAzVtUDie
        Vuw9jNRXl7mEivbKcTp5doz+3AFS9N/jFKy+J6Zi27bA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+SMPea
        lCjSq/PwFRY80381eUIBTCEdDPlWwxCC9pVsc=; b=XkBGjbTNEoP/2XZ0G6A9Sh
        dnPqmUfDFiW3R+fwP5qFoYb+f/0bjcOzcp/94ndZsmQUY/wbI8+pUtNzsZcPLaXN
        S/Jcg3LzeOWEBI5oKUx3eLzXkImXfmh2Jkx/SxoeYZk08ebKzpJ9G/Rh1JM3Q18O
        DpAZLqUySqIC+y2x9sF8l6ypycVT+fPsN2RfmU5CJUDSg/iU4g6I3IffHt79bf0n
        lmLwAw8wllK/hzX2le/MGa62JTjFYl/Lqm+4m+w2Pv4cI6KTNattg+OYu/n0eDTI
        VH4M9X2r2fTEmhmMcSV+9Ax5Gs42qg3+lTYhdflknes+hWDfrNkD7iBulxoV8kmA
        ==
X-ME-Sender: <xms:UMk3YHbFD9pemCouU6D2WuXM6zm7sYHYJw17ueKFqWMNHKNwzEhxpg>
    <xme:UMk3YGYz3ahhSRDzjdtdp_UF6XpIjzuxkag_5vaXVGQoDEWGbaQ3Iq7YmkWVMiQN8
    _urFmigJMmBZ81eP3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
    tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
    hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
    necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UMk3YJ_exG8mUIgEVkcURn-iHV7ukSol15ZakzDoK-qQpO8ZoWONfg>
    <xmx:UMk3YNoPTdhNC0xHwR6lGl2nUR38KvVPotHIJY35ef36cyDW5N-7lw>
    <xmx:UMk3YCpgSTrU8yHGrxWdOOBE6LO1SbuxZOBcYh5CbggoGmLZya6srQ>
    <xmx:U8k3YIigYUIizC5-g3PSSHEZcePHWOeiultvpMlUePIWeOqXsQWJZo-9Pac>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 935F7240066;
        Thu, 25 Feb 2021 10:59:12 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Tim Gover <tim.gover@raspberrypi.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Subject: [PATCH 0/8] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date:   Thu, 25 Feb 2021 16:59:01 +0100
Message-Id: <20210225155909.1853812-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,=0D
=0D
Here is a series that enables the higher resolutions on the HDMI0 Controlle=
r=0D
found in the BCM2711 (RPi4).=0D
=0D
In order to work it needs a few adjustments to config.txt, most notably to=
=0D
enable the enable_hdmi_4kp60 and force_turbo options.=0D
=0D
The firmware also has a glitch at the moment and will not properly release =
the=0D
BSC controllers, which will make the EDID retrieval fail.=0D
=0D
We can work around this using the following config.txt options:=0D
=0D
disable_fw_kms_setup=3D1=0D
hdmi_edid_file:0=3D1=0D
hdmi_edid_filename:0=3D1366x768.bin=0D
hdmi_ignore_edid:0=3D1=0D
hdmi_edid_file:1=3D1=0D
hdmi_edid_filename:1=3D1366x768.bin=0D
hdmi_ignore_edid:1=3D1=0D
=0D
A fix will come for the firmware eventually.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (8):=0D
  clk: Add range accessors=0D
  drm/vc4: hvs: Make the HVS bind first=0D
  drm/vc4: hdmi: Properly compute the BVB clock rate=0D
  drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies=0D
  drm/vc4: hdmi: Enable the scrambler=0D
  drm/vc4: hdmi: Raise the maximum clock rate=0D
  drm/vc4: plane: Fix typo in scaler width and height=0D
  drm/vc4: plane: Remove redundant assignment=0D
=0D
 drivers/clk/clk.c                   | 30 ++++++++++=0D
 drivers/gpu/drm/vc4/vc4_drv.c       | 11 +++-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 88 ++++++++++++++++++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  8 +++=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |  3 +=0D
 drivers/gpu/drm/vc4/vc4_plane.c     |  5 +-=0D
 include/linux/clk.h                 | 16 ++++++=0D
 7 files changed, 148 insertions(+), 13 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D
