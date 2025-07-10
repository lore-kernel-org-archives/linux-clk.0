Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D92F0C54
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 16:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164872; cv=none; b=CV1Ojlcvr+i7b772MPHfV91RhqZ9nOQ+lO0KgNoZpyjUbb18wqt9vrOWywRa3AC4/M5d5Ncvhfd/JIfQw/lBzDX0Hdbx3/Jfuq3DNbUDjudJnjE0lWr/r1JPZuK+UslQC/I9efe7Z+iUjC8O1qBffm3gpiPmhhJNEbomyhvo8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164872; c=relaxed/simple;
	bh=uByNPn2hW31VVNIAVITQmiBwDw9ZQzuzCS+fE0hn1Ds=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gHXeCgUitNpA5YYiw9dZFW7eyd/pCBp1bdtQqYTzfP2eD94hNNwRfNUKLJJ2H7P3LNtVonAt4arJyJ4dn6PPaCHu8KSFk8NgtCyJUtmMYOPmlWKivu+5UG02oQiLNhwz2yZueREsDK/Ac6DvQWG3lrkT1K4tmU3+5sURZFpBouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6gAcOrG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6gAcOrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
	b=i6gAcOrGJPGc3MIOSZhyCLlH0bUc8pdQkmxjN1aGKOvLTV+jP6qerNFoYimpA5LmU6xqll
	JBweLErIIliKhD94OjIEOfdrlnyk6gwQvid2gEvwKHbFYndY1fvNZritbWIXw7i/nh/5P9
	JZvo538GqL8GfDmCMpGGK1ixXR4/hhI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-s1Eqlag_Nb6nbtZa5slijA-1; Thu, 10 Jul 2025 12:27:48 -0400
X-MC-Unique: s1Eqlag_Nb6nbtZa5slijA-1
X-Mimecast-MFC-AGG-ID: s1Eqlag_Nb6nbtZa5slijA_1752164868
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so205238385a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 09:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164868; x=1752769668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
        b=p75tLm0fm/RjdHNiYRcY7VK6lIjbaGtR2EkuTOxCdcCoxnkfBWDv/0PXcEtDHNNZUr
         kZNiZAeifBBw8gpMoJ703fnESg9+EhaFx7imSIa6s3LtefBpbkN4pzzi2k6pTNUz7Uv9
         uiXVaXtF3C0ATNnm3BucfEMnWxwq52pCvcHV5RSvqHl+nA/4nBKrH5VfXIDVjZ7+jOf4
         zb5sKcemsQJ5wr1KLv8Uj1yTUWa+r9ZbtpS9Z5A/tCiiYaUmbI4pgjJL6W1UX+PBT7Pa
         lHmm1siwtjoxzI5+oiF4/x7Tlmkwt3s9wvPeynShgSNkqkFH7xUmpaaayL6sFr55cha3
         9TdA==
X-Gm-Message-State: AOJu0Yzhrs9Ii7XkPSpuI54V6K2JTbM6CXbfa083VdsHjb8XcJyzRbt5
	HcNQVlNDUbwtNMLEMTvAaFgMexW0C/hnGF4TkFyO2ryj8Hn5XUInemS2DxXyP8NgWhKkAnlK49M
	EMIyygfheZG8Jr+4j/CKiMvty3J8qGlD033OvCs+/y5NtH+FoYU7azePnuuPN2g==
X-Gm-Gg: ASbGncuN1ORtQ4XeARivRCz7IN2LoFtXWNSOYbSRvqdYUbEYV36//Pl4MDKd6Ptj8cK
	0FcUal3c8G47sM4axkrQhNtWJ65Xm0INlZnjSa5o1gazc0kVR0KiUu0DMfTCnfvgqfhFcoF+Nst
	08UoRN357HmLx/35sNJ8xt3rHMvEMLlYl3mf7jpWnKxVYrsIzcirZw8VeuNDCFgIaar/PNfL4yE
	WlXla1JXwAAOZDjKZOcVbBWn4uCO02Aa7t7UehEvwR6gAhe/a3oq9BTyQ4+Gn8cwkMULoS3JfsA
	7gToqYop6qZ3q9OPfHMRtxTIPT/IYSB8EHcQxO/08Dv+/AY1Q+QA7agHV+K7
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id af79cd13be357-7ddecc1d5a2mr17535385a.42.1752164866481;
        Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27LfFDrGnMnfhyfHCbnzrSuLJo3IShFntK9oUyUSQ7N0TE7WAmGfbfKdAyUi+8fKCbP099g==
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id af79cd13be357-7ddecc1d5a2mr17531485a.42.1752164866037;
        Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:45 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 12:27:26 -0400
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7pb2gC/x3MwQqDMAwA0F8pOS+QiuLwV8YOtc00zFZJVRTx3
 1d2fJd3QWYVztCZC5R3yTKnAvsw4EeXBkYJxVBR1VBrCYNGjDniMp7opy/qvKWA6lZG73tLoan
 5STWUYFH+yPHPX+/7/gEq7Uv9bAAAAA==
X-Change-ID: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=5373;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=uByNPn2hW31VVNIAVITQmiBwDw9ZQzuzCS+fE0hn1Ds=;
 b=IyDjRecZ8lmUveDSl1A/ekKcgnVDZWOm0cbVtunJ0Yg60K87JgqJbB99cAFDWIE1Ws5cFuS4G
 SGQmD+wl6KeCcggSryEiIu7SICeBclsasH4oDapkP9eAZ8fGGn/ww3M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
patch posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (7):
      drm/msm/dsi_phy_10nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm_8960: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_7nm: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8996: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8998: convert from round_rate() to determine_rate()

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 18 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 36 +++++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 22 +++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 ++++++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 18 ++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c        | 19 +++++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c        | 19 +++++++------
 7 files changed, 84 insertions(+), 82 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

