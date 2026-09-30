Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB644FB9AF;
	Wed, 30 Sep 2026 17:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788185; cv=none; b=KnstRywePsHQ2qexjNqPHzSOx/u8SzRKCDWuFrRlYMNdCQ87JrrC4tPXwk3Zi1bnjqAem5Fx6vBO1yENrZeXHW0weZ/dZDSo9qNUINMEu7Snww+sw7CJKqto5jfuC0m2N62PGlc8loN+fyUy4n4g2yJrfdZ3l9JqMa8FZL+4RyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788185; c=relaxed/simple;
	bh=Aa5Ivf36cfXYkp4xSRFaPN8USkw0wK2xpb5noSzAHPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mmwv5t1R1GaOx38q001g7nszKfnJI0L2F199ywrcl7pJmJRLwVwRaPGUdANeu+m0jbRslfXQHpC/l5QSBdqOgIGYthGr2BtN3JglqGPXF/29GQn6U/43mI/OTWlRtuLL5Az8RtXj6ubWv2DfEGPbeVs+j0kFewqz/OjhlUWqvgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAP5j/Mt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAP5j/Mt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 981051F00899;
	Wed, 30 Sep 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790788183;
	bh=KT0ETgO4Z9G3jrW0AkFaXa21laUMQC261VNURsmUYTc=;
	h=From:Date:Subject:To:Cc;
	b=kAP5j/MtMoERgR0VwBHibnuXlXWPjh8bkZpLuc+Zo/mrxg90VvvbWafxMpSBNVOnW
	 YHtKqbXQ6Kc5Mz1/jaPV0tckoOI7oMKq5MJEjTHxXuJcx+LB8VROFh/jmb0ax/ogPv
	 FB2sLfntlYod7YKk81qY5triwtHQUHwNk/OGpEfsJjRl80zy2rRMlNxHYlgDH8dkPs
	 efOmldGSII9SlcyMLgS72dIbaggt61M14kmOI0w2oJGhEk7BXyOJqDfjwg90wXNrRD
	 zra23rDY/57kwDTBWtGjlh1Vyo1R2P+8IJ5sJQdTpR80Lh+CgqBEGAT+598Mn2fgXK
	 IMV9ExnaaABqg==
From: "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
Date: Wed, 30 Sep 2026 10:09:36 -0700
Subject: [PATCH] MAINTAINERS: Update RISC-V Tenstorrent SoC entry
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-maintainers-tenstorrent-v1-1-bd97694822f0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE9CvWoC/yXMTQrCQAxA4auUrA1Mh6l/VxEXM22qEUwliSKU3
 r2jXbzFt3kzGCmTwbmZQenDxpNUtLsG+nuWGyEP1RBD3IdTTFgSPjOL10gNncR8UiVxHFPIMaT
 2eOgK1MFLaeTvf365brZ3eVDvvyMsywpDF+JrfgAAAA==
X-Change-ID: 20260924-b4-maintainers-tenstorrent-f40a2041875b
To: Joel Stanley <jms@oss.tenstorrent.com>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 "Drew Fustini (Tenstorrent)" <fustini@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=fustini@kernel.org;
 h=from:subject:message-id; bh=Aa5Ivf36cfXYkp4xSRFaPN8USkw0wK2xpb5noSzAHPw=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTtdQpmDc2anKgsvLprg6nprE1983r3h5l/zVv5le/v9
 Afa6+6ldJSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAm8jCY4Z9uU8TCuW8lpqbV
 x9v/uuSr8bDYKZDfILr5dGrB5b8Mqc4M/8zf9bUL1K5+1381QstmofCrbV1vG7fO1l4g1hjKpVl
 cywMA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Add Anirudh Srinivasan as a maintainer. He wrote the Atlantis PRCM
clock and reset controller drivers and their DT binding.

Switch my address to kernel.org, which I use for all my upstream
work, and point T: at the kernel.org tree that the clk and dt pull
requests are sent from.

Signed-off-by: Drew Fustini (Tenstorrent) <fustini@kernel.org>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..086b14b688a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23600,11 +23600,12 @@ N:	spacemit
 K:	spacemit
 
 RISC-V TENSTORRENT SoC SUPPORT
-M:	Drew Fustini <dfustini@oss.tenstorrent.com>
+M:	Drew Fustini <fustini@kernel.org>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
+M:	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
-T:	git https://github.com/tenstorrent/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git
 F:	Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm-rcpu.yaml
 F:	Documentation/devicetree/bindings/riscv/tenstorrent.yaml
 F:	arch/riscv/boot/dts/tenstorrent/

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260924-b4-maintainers-tenstorrent-f40a2041875b

Best regards,
--  
Drew Fustini (Tenstorrent) <fustini@kernel.org>

