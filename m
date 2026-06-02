Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D4B30E821
	for <linux-clk@vger.kernel.org>; Tue,  2 Jun 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430575; cv=none; b=Ji8D6wRlV9IEXNrXjQJZVqRoyzXN22LI1uMrK3MJisPm/nDn38y8f3p/lM3z4NBGGN4/8bUjc/k/ZsaN+mtnmL5xDuLWtwOP82zVx70mfCVBqRfbgSrXC1mBVRdfvLomgdi8hxh1TNXQjfWec1tEmZRsqqc1+zaBbZM8/gvf7b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430575; c=relaxed/simple;
	bh=I92Yi+tkT9CMsn6qUnkOf841AL79dYZlftu3M2rJuaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zh4Ja3uKyacOUuBY3qP9AW/mwCPXPiCEMzhlKtBESUIKGH8AB9WF2gr1fPaptN70D0vbFAuUY18EJcdw/USP47e3KoVxVJZR4XkvjXU7BPuRzcx1uq4gSvgPojUwwnGujkX63DWIcly8qBWhZff+sg5YF9bDXt5Qk6YZwoC6Mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5WOnaV+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5WOnaV+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b64c8311so359775e9.3
        for <linux-clk@vger.kernel.org>; Tue, 02 Jun 2026 13:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780430572; x=1781035372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=q5WOnaV+Jol47pCghMl19sjTDFNfR5QsibNTTnkVMDFStgxoF5WFV2xc0zUi9bOymv
         b7DeP/tiILz+aHMzy7vPThcc9Gy7sMMHVjcALSmbmB/50aqRZWlB298Y5REPt59OGQUw
         bOWrV4cWn3VDciMg48w/GSxl7fW66+1eFO7pVreg31w92cpg9Hjl2dmQaUUWhOjsRc+H
         df0NeS3FpPaizgLFEpSXYBSBZlIFDZbf2LfYC8AiCMxVfn/j9L72zDmgTryYfRwgLrkY
         7OhMEYs4vS3rUudEcNB0OtEniT4+WiJqZDf2S0vtzMugvpTdAwhsYZAH3mvBZKTfqXcT
         qH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780430572; x=1781035372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=R23cYi8TFn5cOyw0R/OKC+Vivr4FTdSAazBz7RWg0fv+T4iETwEQFYHjTp/pHF7JRn
         r+EBZPAGoJtiaCTDC9BeAr04cbzQkDuJD0d1glGWp5VNPrU/Ai6eUTs/JXm7zUcJjbEG
         o7ia2VlqZuksRGATmGjkW7AMHenPBB+JIzhFbU7EANrFF6zYi/Z1/pePdpu7AOaTz9zQ
         OcaIT1vET87wmepb0xZHgkOlsHa88wIU9D5MrAx/7XaxU7XgK1eKgNDsbxDRsUBB1BSF
         Vj4I9VRBm3T2eFM/HWmLoQuz6Ms8H/i/xOA0S+q92T7rfx1L2o3K7u2CWuDOzo68sbjs
         A/Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/f8qpek4v3Uxbk6bkI4EgulEVHStUyorJrnEVNES9vYQuAfqlHzCrHREP0QLahDzi8oU7jUl69sy0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0F92enEb0mDiRm7zQo4vhWXrBJR7IjaaS2N6HsEDhXxEvKZDb
	EITLoOV0ozuGSvLPAL5Iq79tpKfiX7E9CQ1oH3dildTXQ7r+vaMJ/zNG
X-Gm-Gg: Acq92OE2XsbaQaCWv/ct8dLuBJRb9vfkgVRbIhRasOhrK47vRYXc8AVQPiPVxjT/y+8
	dN2/FBNVns21JSGyP7X/yJCwW3kVjYGi7udGR9IDHFPDVh+etg+ZuunbHE494frRu9djggwYQDj
	JdrfuJvPpuN8uZTAvTMF2tB3pbQlesCNBX/FKKVFbA3cu0/4EFzyftV3YgvYcJ/f8gErOMwR8RM
	/NHZdGVSsvrFWWfC28SoYLy8oAWpjVVezqi9HevF6OsGw/VcyIaCBR+lZlprWLXNuGwXH8QSuYi
	9Fj/6tnoenYf2w5HpmntRajq0eYGjifXJnKPN/pIyZ8IVz2m9SeU2IW+YGizrXvvw7yDnt1rZOy
	GAz/iSM+jHQTvQMJD0lO72HErBNQX+zbbYoZ5i/A2nQiLrjOksi0SnMN1s1Wm755+P7isTo3p/+
	WnYyveR7+hu7r1W9/DS8v/wiUd8vcvJgRWl6uVWnx/m/YhOz+d6d9HccvBDRcZYqptcaQohYS9n
	VOR2CQ8RT5Go3ouyBA9ya4WpCXjetmLR0IKPtFHjHCOphXoSjsmXNtQ8ERUWd1En9I=
X-Received: by 2002:a05:600c:c4a3:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490b5ea6f55mr4800365e9.11.1780430572386;
        Tue, 02 Jun 2026 13:02:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm97978255e9.13.2026.06.02.13.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:02:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RESEND v5 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add KUnit test suites
Date: Tue,  2 Jun 2026 21:02:41 +0100
Message-ID: <20260602200243.1806087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

v4->v5:
- Made use of KUNIT_DEFINE_ACTION_WRAPPER().
- Added RB tag for patch#1

v3->v4:
- Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
- Added entry in .kunitconfig file
- Fixed reverse christmas tree order in
  clk_divider_bestdiv_ulong_max_returns_max_rate
- Updated MODULE_DESCRIPTION() to be more specific

v2->v3:
- Added Rb tag
- Swapped the order of the patches
- Added the expected value in the fixup patch

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
    handling
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests

 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 153 +++++++++++++++++++++++++++++++++
 5 files changed, 180 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.54.0

