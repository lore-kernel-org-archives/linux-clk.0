Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C324E4A8
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 01:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778549743; cv=none; b=cKaMaEDlOhX23+Qk8+Wg5Wp0dnZ5G/su9VWySIPpeM8lxZjK5/bsTjqndKjk0XCmuBlEkBgBNxcV3sRxya0F/ktXvyOwi4vyPdSbuG4tJtODGYhce7vgKO3Lxa6EP6u9/cmuWZovsvApTdgIMmfnD8+JrWNWNpKuAYzKKX5fuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778549743; c=relaxed/simple;
	bh=OXLbc8oa7LK5j+UoK7PYojQxNt6tMdSaWmLDVwmy6fY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nyHnsjJbg1JV2lNochpNnqQLz+tEZ1kNWvbRjW9KwVKWbSjOP9acqHwE+KwPJ5iNG3dMI5qTrqVEHNajyZ+fLb90kLuFQX42Qskr5D6Tkpk2u2CJ5HQMrFoLRktZRXnVgG/OaWtPoly3T9GWE1Mx7EkCN/nqOeK7bozBlWmrkW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UN3SJ6dU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bua3LGJ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UN3SJ6dU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bua3LGJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778549738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hDM81GL78FREZS+LEcr682BVOat2yXDAdlE/kgG+9Ak=;
	b=UN3SJ6dU6ltPgZxb6uhowEqTnxpp1n1e2EQl/EqaUCXwYPKQgzCp5AHFXFTHyifrlRjWKA
	0L70nqNs2QpynUmgKtKzTvvrSx/Z3NQumYDPZvqw8mgpJdEMPCBo9+/GYgFmc6W40mmVUf
	Mx0nJBikYVn3NW7/ricaZ/XMWe0Gqzw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-xsSk-xIJMsy_bFjLipSzHQ-1; Mon, 11 May 2026 21:35:37 -0400
X-MC-Unique: xsSk-xIJMsy_bFjLipSzHQ-1
X-Mimecast-MFC-AGG-ID: xsSk-xIJMsy_bFjLipSzHQ_1778549737
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51494d74d4bso64001711cf.1
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 18:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778549737; x=1779154537; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDM81GL78FREZS+LEcr682BVOat2yXDAdlE/kgG+9Ak=;
        b=bua3LGJ/G0JvzPn44dIDD1bltMl6WOGtAzek+ypdj19WcKhhE9qVdYJKh8G9NU7ZTU
         2wpL/cQubpcRCvMPNadHttQ+TkmMg7kv9MTLeE+4IpfAIbtof1BxacX6BgAXhkE/pg1y
         Bli+BVrl/T3wrO/yBO80Z1nijkSP9wq/rJD94j9B1m5hDnEQCFfWW2m6QJUMEhU7oFfQ
         uEZQpz/HvMIEVDSBAtjGO9mDrrHQye5xZZ7pLKp1KcqD3UADxQ1bnralIK1HqBrtQLY3
         GwXvsGG6HJ3MgkF9KWwEMguK/aOJEtOHRY1gd0bCYP4cV8u6VizqFbDN3bltmFJBZwk/
         UPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778549737; x=1779154537;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDM81GL78FREZS+LEcr682BVOat2yXDAdlE/kgG+9Ak=;
        b=f4jrjiWxWhPZRedcT37jJ486wrM5Dxc7mG45lmph1Zj8G4b2vkb9bRMWrRxzSMu/Sg
         TfkQtvlY/pnluJfbhPmLWh8kxNxi9by5Awas84wuxZRvofYL0R60EvQXEuY5msy3s7Qf
         ggZfQa6HYtn/sWXski8vIeU1XNA4smT0liHZElnbCtwUCT0puU/P0fF+D+Uby4kpdyoR
         5mFDL49BCIQ/UgP+kjDf+K52y9a8k1vJMbibjTl9jzhgRJNbZrdGTYR5d8XkUHIz0FSA
         vreTs9170OPbxszyMrGN2jAl7AkOuDKzHjskwoNTyqclYkrXEYZGLA7CqqzaxbqVJOej
         BRQA==
X-Gm-Message-State: AOJu0YyCC6wy85fxBOvDrIU4yCzqy44jV7AewxS/rPD9z4n6TT02hdId
	uTbEjd+yOnsZUnk7odrm6KRn6y0UsNPiqHLF9gQVKC035rMj6ltJopo24Rtvb3Xh7hAC++MUj/8
	/yMGppt6IW7IliHxhqGQU/bZ5HZ1EkKoCDSXk4PtvmEUQE0ePIOH6yLEYHGTGHw==
X-Gm-Gg: Acq92OHe10/3IUPe42J2NNBC+xWYyGxswt7dxNUbe0fIsHe/0TcUwitpwOxY3EBVJiu
	yqywrgoP4OszbkCOZeUjGI3+J1fVT0he89OgfMEV848VKx0RKKj8aA1aAPpkJWQtJIwXtCOmAu2
	zuInGyyHi+QazFz36MR2VW9LOyHuskYCnlPKHa+o2ERp/0oWbMqqOgJ4hSqd0x9r3DMQDeZCrfe
	Qr5T0KYXMQDsmhG5vpn47Gl/eMfAxsdGcsAq90moKEqi+pE1rxYhAYU6l/gbTP70TWkslhjSVId
	ONyuCoOf2PPy4o2tohO3JFocBt+/e51FZeeUTokiAbjWXNc0P/7wMF/p4cFA4bsp7idJ2KJub6H
	InHweWFHlehcCSOs63hXwBX2C9q6NthFYBNH9T80gEwwxq6E+NgoW0169B588yg==
X-Received: by 2002:a05:622a:1a85:b0:50d:af03:c9ca with SMTP id d75a77b69052e-514cf02bcabmr26355871cf.38.1778549736879;
        Mon, 11 May 2026 18:35:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1a85:b0:50d:af03:c9ca with SMTP id d75a77b69052e-514cf02bcabmr26355501cf.38.1778549736403;
        Mon, 11 May 2026 18:35:36 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm109704006d6.34.2026.05.11.18.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:35:35 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/4] clk: update kernel docs
Date: Mon, 11 May 2026 21:35:03 -0400
Message-Id: <20260511-clk-docs-v3-0-ed67e1065809@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MwQ6CMBAFf4Xs2ZptgQqc/A/jgbZbaVRqWtJoC
 P9u4YSJx3l5MzNECo4idMUMgZKLzo8ZykMBeujHGzFnMoNAIbHEiunHnRmvI0NVnxpbCS4RId9
 fgax7b6nLNfPg4uTDZysnvq5/IokzZJaoko1RbWv5OZAZ+umo/RPWShI7U9Q7U2RTaSslEtek6
 h9zWZYv+RLjKdsAAAA=
X-Change-ID: 20260304-clk-docs-0b578f421600
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=OXLbc8oa7LK5j+UoK7PYojQxNt6tMdSaWmLDVwmy6fY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKYmu+WFLxrO7vqtcvkBi2RG01afCGq38pVMv6ZCszgk
 97y6ceWjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACayIo2R4fXh5W+V6nnDlwr/
 c2W2Dszku5le0Hc+7Ivnw/reosAzoQz/TPUiAnZ8EmSMjnn0fG/W3rK80LfOHHsO9Liz6rzOvtf
 JBgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Here's a small series that updates the kernel documentation for struct
clk_core, adds a doc block for the clk flags, and updates the clk kunit
test to use HZ_PER_MHZ.

Since I've been doing a lot of work in the clk subsystem lately, I would
like to add some more documentation about this subsystem in the future
as I have time. There's a lot of other things that I know can be done
now, and I'd like to just start with these small changes merged.

I tested this by running 'make htmldocs' and opened
Documentation/output/driver-api/clk.html in my browser to ensure that
it was rendered as expected.

Changes in v3:
- Remove clk flags enum and replaced with a doc block.
- Add separate header for the flags in the rst file.
- Rebased onto next-20260508.
- Link to v2: https://lore.kernel.org/r/20260325-clk-docs-v2-0-bcf660e1ceb5@redhat.com

Changes in v2:
- Add clk_core_flags enum, and kernel doc for this.
- Update descriptions in clk_core based on feedback from Stephen.
- Update clk kernel docs to show some of the new API documentation.
- Link to v1: https://lore.kernel.org/r/20260304-clk-docs-v1-0-fee468db99f1@redhat.com

Merge Strategy
--------------
Given the new doc block, and cross tree dependency, it would be easiest
of all of this was merged together in Stephen's tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      clk: add kernel docs for the core flags
      clk: add kernel docs for struct clk_core
      docs: clk: include some identifiers to keep documentation up to date
      clk: test: convert constants to use HZ_PER_MHZ

 Documentation/driver-api/clk.rst | 58 +++++++++-------------------------------
 drivers/clk/clk.c                | 51 +++++++++++++++++++++++++++++++++++
 drivers/clk/clk_test.c           |  7 ++---
 include/linux/clk-provider.h     | 46 +++++++++++++++++++------------
 4 files changed, 96 insertions(+), 66 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260304-clk-docs-0b578f421600

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

