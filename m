Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81CC38F23D
	for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 23:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774482765; cv=none; b=aelZTA8Xk9sLlzBUjGMJ736Chy5dP++WLSrcqc1es1kORv6RyDpzfbsKTF5CkRRqZp0tPDbsSET4WGyEAURhv6oyZX3TWM14rpeeFGkVwU8dx2rvLyfsRhsTQE8fnrn/eiNXmbl/o963CW2GxlhYUiPD6cNOKk0/UItCz1QvGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774482765; c=relaxed/simple;
	bh=pDlL9CglIFwRMO2//WwSLnjr7T4jqi7GVAwBYo3zUck=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hQ4yn2Wzi46bTNHw3PNjEW4kw1bbsJnejAbXCBszUjiJdKn25ZYdoNpBk0rnrA5x4JQQj1zgUtaVyLQk7DDgOa5A+eN634D6J5Errg2CdGrdGzqdzK/2n2DbZnlMwPP192KgUGGtDKmnHWvzOr3pbt2TgT/7qyTMtRbnLPPdvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmR7OWL3; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cQ6K1kzS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmR7OWL3";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cQ6K1kzS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774482762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yuJFXc+oSvSHiNWcGKsTw0+QoEJBqEFxVNPR1gcgJbM=;
	b=YmR7OWL30w0gYMIGwhh8lM5hiaAfjyAq6W2MfBr5Jvregfss+kL5kvnHx/75ZFpyqDyHY6
	HHqXzYRXmvM93JbVhVEQwyNCRKUZ5PqCKZ8hOXQoz/f6UQD60CcvHA0MyYIhBlsStbY+2V
	sm8lmkKMca4Vvkc+/U3DUc2eiG67wp4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-Un5jgTzzMgO3NTz28ounvg-1; Wed, 25 Mar 2026 19:52:40 -0400
X-MC-Unique: Un5jgTzzMgO3NTz28ounvg-1
X-Mimecast-MFC-AGG-ID: Un5jgTzzMgO3NTz28ounvg_1774482760
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7c4ab845so140847285a.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Mar 2026 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774482760; x=1775087560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuJFXc+oSvSHiNWcGKsTw0+QoEJBqEFxVNPR1gcgJbM=;
        b=cQ6K1kzSgy6+Pde3JMLbR+DEDzVoMPT1prAP5K2+Q67HfT18WBd15NH0chfkRsGst3
         /vzpzMRKtPY1V56zPv8NRBKdUPZpdviOUeaq5Z7inGVHXLBbOug1hysQ4f+dh2uTmTzY
         ZEt2wqyIS+5oMqr/nY+oPbPDVsF7GhmuE9ZOXs6h586ktjmutuNs+nApUs6ZCcwGYghe
         iX8pq1db4tRK93BVJqnY9j6cMRA/3aJbDU68WbPkxDzY9FQ19GaMcrj19slNCy9pHXew
         /+995YU19vpzmQxpFpeG0Fz0l0BozIEEzZMGI+eHOcnwoYiT2y1DMLekKezVQSQ21wVF
         WfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774482760; x=1775087560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuJFXc+oSvSHiNWcGKsTw0+QoEJBqEFxVNPR1gcgJbM=;
        b=C40bfMCU2DyrDiWEgfMFHr1pW4PTOn1JRUm3pdp7tbLT9K9dBVmO2lDRxYjyK68/gP
         0YsVSDm17n44waxS9BJOsdswRCyXO/8DR66bUN8KJboFSKTwZTmR68OE+1/wRRuyUNlL
         Taxf/TLdBAlpehI5nvbp5DQxfx+rJe3ta69uoNzhsH1qZRAe4RKapYVnnXwX6tPUMhKO
         Ks0WXCt4epIKddxk6FaAxY1iVQc4KOhPeLiVyCdG2neZm4FCqwKTyEOBVqxMtHFZYhnx
         +2o3YFeV52Ox6gRGAltnwGyFCNCMZ8eeLlUcFHaGlWi1kaP+PkxG7U9wx+GIdR4CYG4O
         1EpQ==
X-Gm-Message-State: AOJu0YwpLjW4YQ6l8WRPXZjZcr2wIB5hc1Nvjz7tWZtRJVkhF9O13nCJ
	+l1UUMzC/pAPWNpHxmJXw55I3fxMD+Zgh0K+AvI4vxV6O95P+ZMBsjIsQ/qLuBsTrDh4zVzOTQU
	Uz0oOOvmS4jZL/rEwYYeBE2o4pc8gcs77NzipMPb0Oj1LevFxMZJ1Wqc7Rjp06g==
X-Gm-Gg: ATEYQzxcFaDeJlDUVNH9Qsp66af7eB5vkTSDOND0UVEAcNLPEuKBKNY5DJOp4nePjZg
	cPMVtPdNfQVEcyUDwpjj7Ilbv0T0Z/UftOBxaiV5pXEn0O6pqQN8unA1hTf3pCL3x0cPe64FZzh
	BozIbJPxYEzbfY95WgNhO67Es8u2kIE7d7r5/S4YhHjLc72CmXDiuOmInKuh7h4XIxOZeeY2R4q
	BlQ1n5SpL6OpIDqknHCrKHhfiV2ktUMApmMNno/1Y9mz4eDrjpMWnPB1WkAM0z56W7AxEIabp5T
	GBPmJOFPGnyErYhyvCHGg30HaPlzvQJ4Jy5zZZuklmQ0wjNC3rMqCtpN+NT0uOz2Av4bXw6O8zW
	8DDm+3Ya/4uUY/uuPnhrlHtoQABrgYLqmVpn2RydydodDfNvobnhbHc2rC3zZ
X-Received: by 2002:a05:620a:1708:b0:8cf:be85:ba84 with SMTP id af79cd13be357-8d00107923fmr778026685a.54.1774482759941;
        Wed, 25 Mar 2026 16:52:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1708:b0:8cf:be85:ba84 with SMTP id af79cd13be357-8d00107923fmr778024085a.54.1774482759430;
        Wed, 25 Mar 2026 16:52:39 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e501eedsm106346785a.40.2026.03.25.16.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 16:52:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/4] clk: update kernel docs
Date: Wed, 25 Mar 2026 19:52:09 -0400
Message-Id: <20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MQQ7CIBCF4as0s3bMgIitK+9humhhEKIWA02ja
 bi72LXL/+XlWyFzCpzh3KyQeAk5xKmG3DVg/DDdGIOtDZKkpgMpNI872mgy0ng8tU5JoYmg3l+
 JXXhv1LWv7UOeY/ps8iJ+6x9kEUjomJVu7dh1TlwSWz/MexOf0JdSvh4f6YuhAAAA
X-Change-ID: 20260304-clk-docs-0b578f421600
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pDlL9CglIFwRMO2//WwSLnjr7T4jqi7GVAwBYo3zUck=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKPlFo5/vZZuG+mk1PKvYgrl3X/XDn3f2vjybkxZ+tnn
 FZQf6Fq01HKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBENvEyMnSd2xG4cIsok6FS
 pEK0S/KyA7ITX1b7r++ecmNv/6FlKzcwMkwXEzkyV31+S2zVzYBbjDqb3jxwuXrIh2GTYi2r3eb
 E2dwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a small series that updates the kernel documentation for struct
clk_core, moves the clk flags into a new enum so that they can be shown
in the documentation, and updates the clk kunit test to use HZ_PER_MHZ.

Since I've been doing a lot of work in the clk subsystem lately, I would
like to add some more documentation about this subsystem in the future
as I have time. There's a lot of other things that I know can be done
now, and I'd like to just start with these small changes merged.

Changes in v2:
- Add clk_core_flags enum, and kernel doc for this.
- Update descriptions in clk_core based on feedback from Stephen.
- Update clk kernel docs to show some of the new API documentation.
- Link to v1: https://lore.kernel.org/r/20260304-clk-docs-v1-0-fee468db99f1@redhat.com

Merge Strategy
--------------
Since there is a new enum that's added, and it's referenced in the
docoumentation, all of these patches will need to go through Stephen's
tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: move core flags into a new enum for kernel docs
      clk: add kernel docs for struct clk_core
      docs: clk: include some identifiers to keep documentation up to date
      clk: test: convert constants to use HZ_PER_MHZ

 Documentation/driver-api/clk.rst | 58 +++++++---------------------------------
 drivers/clk/clk.c                | 51 +++++++++++++++++++++++++++++++++++
 drivers/clk/clk_test.c           |  7 ++---
 include/linux/clk-provider.h     | 55 ++++++++++++++++++++++---------------
 4 files changed, 98 insertions(+), 73 deletions(-)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260304-clk-docs-0b578f421600

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

