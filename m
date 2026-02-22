Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408F360747
	for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 23:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771804285; cv=none; b=JIqw1Iq+YTQmYsT+bnriHKs1U33csUDLPixVgZBfVw7ZWsAeNuukmIKAuA3Jd1eOWjwOYbhy1ZTrexUEQNSuqM8Kn5Q68G/ioA+NkiDQWbaIU/rAWT19iSUgQctvMADZs24IGT292xNo5lQpRt/WXpttmFPIGNMZsdybM4wek6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771804285; c=relaxed/simple;
	bh=wGVttcAFf43FvuXELpCpPpss8qiQ5XFMZf1Gzsy6ONU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oDeUPleU4Z510SoOiPalBw4e61J9Vm/T1CKcrgIF26SyrewzFPiZR3S5scXivK4GaCNPiPk8nmDo1cmd+y/BGFuAGyb1XbIa+3rz+pPaOBv6+q/nXcpYxqtrE2X7//Ub4zlG9t3ZvNZceL6QnEpnLUrHlZOfQ1v7MSIMmGFPzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IRL550GX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iy2UOVZS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IRL550GX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iy2UOVZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771804283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p/oijTVco+mgrfk3ej3RVNg/v9mqitb42UkrdJrAB5Y=;
	b=IRL550GXgNKKCCQE8SL/aAjfasrgXHQGt8qE3hkVV50zXqE5zJJEL9vrO+GqA8m9G6UUcF
	l1W5Brtq1pyvWnLfVXHEIGa8ovc4D/4QwmnYrsmP6NolCFxTKa8LTRRlSjm0jUKt6nwkEp
	Pf8ilUVJ4QWNWaGohxaWNliUlvxaoWA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-ZXdfV0zNOYCgJgxH4xC47A-1; Sun, 22 Feb 2026 18:51:22 -0500
X-MC-Unique: ZXdfV0zNOYCgJgxH4xC47A-1
X-Mimecast-MFC-AGG-ID: ZXdfV0zNOYCgJgxH4xC47A_1771804282
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so4445694785a.1
        for <linux-clk@vger.kernel.org>; Sun, 22 Feb 2026 15:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771804282; x=1772409082; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/oijTVco+mgrfk3ej3RVNg/v9mqitb42UkrdJrAB5Y=;
        b=iy2UOVZSackqX4QM24BHNTvef6STkL9AHX0c9dpdm5fkrClbqfKFPUjVoo2Y/9DgDx
         kc8XYlG/KIjj05z7taDaOkJuYZ7V34cr7wxONWqVadbQH2UetPNKG9ovyPkw6MNdkAjS
         Kt8gZmeoHGQzCHLqQ4LRH1t4boDD7CUbeT+KV3zsKZRKQuUTjQFd+b51U5aUTPYqbf6Y
         E4ZrqVCQ7kudNsixhoUG3wXf2xzPFnrilBpdVeZNC4p5qKzT4Q6JuJvQ3HY5HhFLvY9i
         6O0bZKYEHJvfSgwCJuMtXObHol+a2CE+hif1pnIcp+dWn5mDYVtJmM1JN9zT1NHwL4on
         hlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771804282; x=1772409082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/oijTVco+mgrfk3ej3RVNg/v9mqitb42UkrdJrAB5Y=;
        b=a+ni6zsLLxOW5sxvCH9kJ9qubu7rqbZZMUO/YrnNIwstT2soDA3CLIe6+HIeh2q3Rc
         iygwAzQ0SBfOwSHy8Wkcfzav3gi+wjUEoDUXY9T0ff2cHl5e8d2EboNP5459pqiRitiN
         ySzc0J3HVOsWHLhtYKtoKUZ3BaEfNoju1PPHjan3IlDJUmCsN71sYQF4+v5xNm+Zayk9
         hlb4PjWzglyjahluByL9RsSqET0qVUk4e+IGLtSPNNB+XOc+R7aLU1S+PlDo0qI6a7B7
         LXaynDJk5OFFLAmM1raxfvRRWz3N4iimkqcxzwtbDNX5yHnaTZkbCUbHaBP7Ifzl5XwV
         FxaQ==
X-Gm-Message-State: AOJu0Yzpz7lIjpd6cukD1HqLnP1FOHdXT/FcHr+DHCup3oqogNwrw3z+
	dFlirG12bQqATjeQAWu0EG50r7KxRoVwzXB0vNklTI0ODIayTmEdMPiX1Hv2HHJlp6dS1cBWjmt
	Nh33UCyTlQaagrdxMCgmvxO6Y2WOp2KUt90nakI55/pJrvH9LvM8TTSi9hvbW+A==
X-Gm-Gg: AZuq6aJ8QGYjA/rx1prMB8FiBwe4Yus1d4nbKKLZQvIFYWaSBCSY4TqSlKaT50RSs9J
	umeOSHWP/xVZn9ll5mZXnG/CTT6gj+Kkx2fxpPjuA/G9zUVNTDES89Cea5/U4AWrRTw5IZcXrsJ
	HVhIQEd++IXgU2IaQ4E39L1MPRlSJL2jhE4p8dlmYxQtgctJ37TeVSUwrWk4XbdL6QlUUGE/g3W
	+L/QeOU2nxP3/R4vYXmEIp3PYUGm6RthRa4dYvhJlNHFgRMoBAPJwZfyKe8UGtXDkTAEXpxuk9b
	0vK0BVB52UtJfL/2Nmrz0WmhLGEKclzmdFZ4QfIFxHJ+A5bd0T9Hd3Al+2XlCPt1dJf+oGs5ASk
	A5UbMnxPw/+b2ceyDMi9KfX61Vpi+CJDw00+688mMnpMo02k4U4G08kpCkiS5Mw==
X-Received: by 2002:a05:620a:2805:b0:8cb:5566:c947 with SMTP id af79cd13be357-8cb7be732f1mr1524797485a.17.1771804281707;
        Sun, 22 Feb 2026 15:51:21 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:8cb:5566:c947 with SMTP id af79cd13be357-8cb7be732f1mr1524795885a.17.1771804281349;
        Sun, 22 Feb 2026 15:51:21 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c8a771fsm53701036d6.17.2026.02.22.15.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:51:20 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/3] clk: microchip: core: allow driver to be compiled with
 COMPILE_TEST
Date: Sun, 22 Feb 2026 18:51:03 -0500
Message-Id: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgMxooNXEQeNUYNaSwsiFO9uc
 XzD/wmiBtMIXZEg6G3RLpdRlQXINrpV0eZsYOKWmBnl2PE0CZds5tGb1IykzUS0VMwjQS590MW
 e/9oP7/sBhGRWy2UAAAA=
X-Change-ID: 20260222-clk-microchip-pic32-0e5b00f122a0
To: Conor Dooley <conor.dooley@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=783; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=wGVttcAFf43FvuXELpCpPpss8qiQ5XFMZf1Gzsy6ONU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnTyt+elZ/V/ON3IdbHhy/srioaWbly4VL/pXk7bred
 WXyjKAdiztKWRjEuBhkxRRZluQaFUSkrrK9d0eTBWYOKxPIEAYuTgGYyLkEhv/B215Ya/uu60oK
 +CTxVvtiipHLNu5801cpEnFWLAFnVAIZ/lmsPjkl/N/yH8eSFt0zql5Q/XNDhPaGv/N507SkwnS
 XqHMAAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a small series that lets us enable COMPILE_TEST for the pic32 clk
driver so that this driver can be compiled on all architectures in the
future to help avoid breakage.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (3):
      clk: microchip: core: update to use div64_ul() instead of do_div()
      clk: microchip: core: change asm nop calls to nop()
      clk: microchip: core: allow driver to be compiled with COMPILE_TEST

 drivers/clk/microchip/Kconfig    |  2 +-
 drivers/clk/microchip/clk-core.c | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260222-clk-microchip-pic32-0e5b00f122a0

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

